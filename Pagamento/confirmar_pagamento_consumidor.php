<?php
session_start();
include "../conexao.php";
header("Content-Type: text/plain");

// Autenticação
if (!isset($_SESSION['usuario_id'])) {
    echo "Erro: não autenticado.";
    exit;
}

$usuario_id = (int)($_SESSION['usuario_id'] ?? 0);
$servico_id = (int)($_POST['servico_id'] ?? 0);
$tipo       = trim($_POST['tipo_pagamento'] ?? '');
$nome       = trim($_POST['nome_cartao'] ?? '');
$numero     = preg_replace('/\D+/', '', $_POST['numero_cartao'] ?? '');
$validade   = $_POST['validade_cartao'] ?? '';
$cvv        = preg_replace('/\D+/', '', $_POST['cvv'] ?? '');
$data_pg    = date('Y-m-d');
$status_pg  = 'confirmado';

if (!$usuario_id || !$servico_id || !$tipo || !$nome || !$numero || !$validade || !$cvv) {
    echo "Erro: dados incompletos";
    exit;
}

mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);

try {
    // 1) Buscar preço e empresa do serviço
    $q = $conexao->prepare("SELECT preco, empresa_id FROM servicos WHERE id = ?");
    $q->bind_param("i", $servico_id);
    $q->execute();
    $rs = $q->get_result();
    if ($rs->num_rows === 0) {
        echo "Erro: serviço não encontrado";
        exit;
    }
    $rowSrv     = $rs->fetch_assoc();
    $valor      = (float)$rowSrv['preco'];
    $empresa_id = (int)$rowSrv['empresa_id'];

    // 2) Transação
    $conexao->begin_transaction();

    // 3) Inserir pagamento do consumidor
    $stmt = $conexao->prepare("
        INSERT INTO pagamentos 
        (usuario_id, servico_id, plano_id, tipo_pagamento, nome_cartao, numero_cartao, validade_cartao, cvv, data_pagamento, status_pagamento, valor_pago) 
        VALUES (?, ?, NULL, ?, ?, ?, ?, ?, ?, ?, ?)
    ");
    $stmt->bind_param(
        "iisssssssd",
        $usuario_id, $servico_id, $tipo, $nome, $numero, $validade, $cvv, $data_pg, $status_pg, $valor
    );
    $stmt->execute();

    // 4) Tentar confirmar o próximo PENDENTE do serviço
    $upd = $conexao->prepare("
        UPDATE agendamentos 
        SET status = 'confirmado', consumidor_id = ?
        WHERE servico_id = ? AND status = 'pendente'
        ORDER BY data, hora
        LIMIT 1
    ");
    $upd->bind_param("ii", $usuario_id, $servico_id);
    $upd->execute();

    // 5) Se não havia pendente, criar um agendamento confirmado agora
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

    // 6) Commit
    $conexao->commit();
    echo "ok";
} catch (Throwable $e) {
    if ($conexao->errno) $conexao->rollback();
    echo "Erro ao processar: " . $e->getMessage();
}
