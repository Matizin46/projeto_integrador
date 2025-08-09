<?php
// Inicia a sessão para acessar dados do usuário logado (ex.: usuario_id)
session_start();

// Inclui a conexão com o banco (deve definir $conexao como mysqli)
include "../conexao.php";

// Define que a resposta desta rota será texto puro (útil para AJAX/fetch)
header("Content-Type: text/plain");

// ===============================
// 1) Autenticação básica
// ===============================
if (!isset($_SESSION['usuario_id'])) {
    echo "Erro: não autenticado.";
    exit;
}

// ===============================
// 2) Coleta e higienização de entradas
// ===============================
// Converte id de sessão para inteiro
$usuario_id = (int)($_SESSION['usuario_id'] ?? 0);

// Converte ids vindos por POST para inteiro
$servico_id = (int)($_POST['servico_id'] ?? 0);

// Campos de pagamento: remove espaços e normaliza
$tipo       = trim($_POST['tipo_pagamento'] ?? '');
$nome       = trim($_POST['nome_cartao'] ?? '');

// Mantém apenas dígitos do número do cartão (remove espaços, traços, etc.)
$numero     = preg_replace('/\D+/', '', $_POST['numero_cartao'] ?? '');

// Validade pode vir no formato MM/AA ou AAAA-MM, aqui apenas recebemos cru
$validade   = $_POST['validade_cartao'] ?? '';

// Mantém apenas dígitos do CVV
$cvv        = preg_replace('/\D+/', '', $_POST['cvv'] ?? '');

// Metadados do pagamento
$data_pg    = date('Y-m-d');       // data de hoje
$status_pg  = 'confirmado';        // status padrão após pagamento

// ===============================
// 3) Validação de obrigatórios
// ===============================
// Se algum campo essencial não foi informado, interrompe
if (!$usuario_id || !$servico_id || !$tipo || !$nome || !$numero || !$validade || !$cvv) {
    echo "Erro: dados incompletos";
    exit;
}

// Ativa exceptions do MySQLi para facilitar o try/catch
mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);

try {
    // ===============================
    // 4) Buscar preço e empresa do serviço
    // ===============================
    $q = $conexao->prepare("SELECT preco, empresa_id FROM servicos WHERE id = ?");
    $q->bind_param("i", $servico_id);
    $q->execute();
    $rs = $q->get_result();

    // Se não encontrou o serviço, interrompe
    if ($rs->num_rows === 0) {
        echo "Erro: serviço não encontrado";
        exit;
    }

    // Extrai preço e empresa do serviço
    $rowSrv     = $rs->fetch_assoc();
    $valor      = (float)$rowSrv['preco'];     // valor a ser registrado no pagamento
    $empresa_id = (int)$rowSrv['empresa_id'];  // dono do serviço

    // ===============================
    // 5) Inicia transação
    // ===============================
    $conexao->begin_transaction();

    // ===============================
    // 6) Inserir registro do pagamento
    // ===============================
    // Observação: os dados sensíveis (número/cvv) estão indo para o banco.
    // Em produção, considere tokenização/PCI-DSS e não armazenar dados crus.
    $stmt = $conexao->prepare("
        INSERT INTO pagamentos 
        (usuario_id, servico_id, plano_id, tipo_pagamento, nome_cartao, numero_cartao, validade_cartao, cvv, data_pagamento, status_pagamento, valor_pago) 
        VALUES (?, ?, NULL, ?, ?, ?, ?, ?, ?, ?, ?)
    ");
    $stmt->bind_param(
        "iisssssssd",
        $usuario_id,      // i: id do consumidor pagante
        $servico_id,      // i: id do serviço pago
        $tipo,            // s: tipo do pagamento (ex.: cartão)
        $nome,            // s: nome impresso no cartão
        $numero,          // s: número do cartão (⚠️ cuidado em produção)
        $validade,        // s: validade do cartão
        $cvv,             // s: cvv (⚠️ cuidado em produção)
        $data_pg,         // s: data do pagamento (YYYY-mm-dd)
        $status_pg,       // s: status do pagamento (confirmado)
        $valor            // d: valor pago (decimal)
    );
    $stmt->execute();

    // ===============================
    // 7) Confirmar o próximo agendamento pendente
    // ===============================
    // Regras:
    // - Tenta pegar o horário mais próximo (ORDER BY data, hora) que ainda esteja 'pendente'
    // - Marca como 'confirmado' e amarra esse consumidor (consumidor_id)
    $upd = $conexao->prepare("
        UPDATE agendamentos 
        SET status = 'confirmado', consumidor_id = ?
        WHERE servico_id = ? AND status = 'pendente'
        ORDER BY data, hora
        LIMIT 1
    ");
    $upd->bind_param("ii", $usuario_id, $servico_id);
    $upd->execute();

    // ===============================
    // 8) Se não havia pendente, cria um agendamento “agora”
    // ===============================
    if ($upd->affected_rows === 0) {
        $dataAgora = date('Y-m-d');
        $horaAgora = date('H:i:s');

        $ins = $conexao->prepare("
            INSERT INTO agendamentos (empresa_id, servico_id, consumidor_id, data, hora, status)
            VALUES (?, ?, ?, ?, ?, 'confirmado')
        ");
        $ins->bind_param("iiiss", $empresa_id, $servico_id, $usuario_id, $dataAgora, $horaAgora);
        $ins->execute();
    }

    // ===============================
    // 9) Conclui a transação
    // ===============================
    $conexao->commit();

    // Resposta de sucesso (texto puro)
    echo "ok";

} catch (Throwable $e) {
    // Em erro, se a conexão estiver com erro pendente, desfaz a transação
    if ($conexao->errno) $conexao->rollback();

    // Retorna mensagem de erro (texto puro)
    echo "Erro ao processar: " . $e->getMessage();
}
