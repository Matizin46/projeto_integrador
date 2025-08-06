<?php
session_start();
include "../conexao.php";
header("Content-Type: text/plain");

$usuario_id = $_SESSION['usuario_id'] ?? 0;
$servico_id = $_POST['servico_id'] ?? 0;
$tipo = $_POST['tipo_pagamento'] ?? '';
$nome = $_POST['nome_cartao'] ?? '';
$numero = $_POST['numero_cartao'] ?? '';
$validade = $_POST['validade_cartao'] ?? '';
$cvv = $_POST['cvv'] ?? '';
$data_pagamento = date('Y-m-d');
$status = 'confirmado';

// Verifica campos obrigatórios
if (!$usuario_id || !$servico_id || !$tipo || !$nome || !$numero || !$validade || !$cvv) {
    echo "Erro: dados incompletos";
    exit;
}

// Busca o preço do serviço
$busca = $conexao->prepare("SELECT preco FROM servicos WHERE id = ?");
$busca->bind_param("i", $servico_id);
$busca->execute();
$res = $busca->get_result();

if ($res->num_rows === 0) {
    echo "Erro: serviço não encontrado";
    exit;
}

$valor = $res->fetch_assoc()['preco'] ?? null;

if ($valor === null) {
    echo "Erro: valor do serviço não encontrado.";
    exit;
}

// Insere o pagamento (plano_id = NULL para consumidor)
$stmt = $conexao->prepare("INSERT INTO pagamentos 
    (usuario_id, servico_id, plano_id, tipo_pagamento, nome_cartao, numero_cartao, validade_cartao, cvv, data_pagamento, status_pagamento, valor_pago) 
    VALUES (?, ?, NULL, ?, ?, ?, ?, ?, ?, ?, ?)");

$stmt->bind_param("iisssssssd", 
    $usuario_id, $servico_id, $tipo, $nome, $numero, $validade, $cvv, $data_pagamento, $status, $valor
);

if ($stmt->execute()) {
    // Atualiza o agendamento: marca como confirmado e vincula o consumidor
    $atualizaAgendamento = $conexao->prepare("
        UPDATE agendamentos 
        SET status = 'confirmado', consumidor_id = ?
        WHERE servico_id = ? AND status = 'pendente'
        ORDER BY data, hora
        LIMIT 1
    ");
    $atualizaAgendamento->bind_param("ii", $usuario_id, $servico_id);
    $atualizaAgendamento->execute();

    echo "ok";
} else {
    echo "Erro ao salvar: " . $stmt->error;
}
?>
