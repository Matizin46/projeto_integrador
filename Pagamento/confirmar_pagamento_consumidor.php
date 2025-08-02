<?php
session_start();
include "../conexao.php";
header("Content-Type: text/plain");

$usuario_id = $_SESSION['id_usuario'] ?? 0;
$servico_id = $_POST['servico_id'] ?? 0;
// demais dados
$tipo = $_POST['tipo_pagamento'] ?? '';
$nome = $_POST['nome_cartao'] ?? '';
$numero = $_POST['numero_cartao'] ?? '';
$validade = $_POST['validade_cartao'] ?? '';
$cvv = $_POST['cvv'] ?? '';
$data_pagamento = date('Y-m-d');
$status = 'confirmado';

if (!$usuario_id || !$servico_id || !$tipo || !$nome || !$numero || !$validade || !$cvv) {
    echo "Erro: dados incompletos";
    exit;
}

$busca = $conexao->prepare("SELECT preco FROM servicos WHERE id = ?");
$busca->bind_param("i", $servico_id);
$busca->execute();
$res = $busca->get_result();

if ($res->num_rows === 0) {
    echo "Erro: serviço não encontrado";
    exit;
}

$valor = $res->fetch_assoc()['preco'];

$stmt = $conexao->prepare("INSERT INTO pagamentos 
    (usuario_id, servico_id, tipo_pagamento, nome_cartao, numero_cartao, validade_cartao, cvv, data_pagamento, status_pagamento, valor_pago) 
    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");

$stmt->bind_param("iisssssssd", 
    $usuario_id, $servico_id, $tipo, $nome, $numero, $validade, $cvv, $data_pagamento, $status, $valor
);

echo $stmt->execute() ? "ok" : "Erro ao salvar: " . $stmt->error;
?>
