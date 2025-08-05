<?php
session_start();
include "../conexao.php";

$empresa_id = $_SESSION['usuario_id'] ?? 0;
$servico_id = $_POST['servico_id'];
$data = $_POST['data'];
$hora = $_POST['hora'];
$status = $_POST['status'];

// Validação básica
if (!$empresa_id || !$servico_id || !$data || !$hora || !$status) {
    echo "Dados incompletos!";
    exit;
}

$sql = "INSERT INTO agendamentos (empresa_id, servico_id, data, hora, status)
        VALUES ('$empresa_id', '$servico_id', '$data', '$hora', '$status')";

if (mysqli_query($conexao, $sql)) {
    header("Location: ../homeFornecedor/home.php");
} else {
    echo "Erro ao salvar: " . mysqli_error($conexao);
}

mysqli_close($conexao);
?>
