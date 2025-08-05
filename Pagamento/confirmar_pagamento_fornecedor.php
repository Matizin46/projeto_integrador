<?php
session_start();
include "../conexao.php";

header("Content-Type: text/plain");

$usuario_id = $_SESSION['usuario_id'] ?? 0;
$plano_id = $_POST['plano_id'] ?? 0;
$tipo = $_POST['tipo_pagamento'] ?? '';
$nome = $_POST['nome_cartao'] ?? '';
$numero = $_POST['numero_cartao'] ?? '';
$validade = $_POST['validade_cartao'] ?? '';
$cvv = $_POST['cvv'] ?? '';
$data_pagamento = date('Y-m-d');
$status = 'confirmado';

// DEBUG opcional
/*
echo "SESSION:\n";
print_r($_SESSION);
echo "\nPOST:\n";
print_r($_POST);
exit;
*/

if (!$usuario_id || !$plano_id || !$tipo || !$nome || !$numero || !$validade || !$cvv) {
    echo "Erro: dados incompletos";
    exit;
}

$stmt = $conexao->prepare("INSERT INTO pagamentos 
    (usuario_id, plano_id, tipo_pagamento, nome_cartao, numero_cartao, validade_cartao, cvv, data_pagamento, status_pagamento) 
    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");

$stmt->bind_param("iisssssss", 
    $usuario_id, $plano_id, $tipo, $nome, $numero, $validade, $cvv, $data_pagamento, $status
);

if ($stmt->execute()) {
    echo "ok";
} else {
    echo "Erro ao salvar: " . $stmt->error;
}
?>
