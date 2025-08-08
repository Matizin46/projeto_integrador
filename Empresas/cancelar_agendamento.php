<?php
session_start();
require_once "../conexao.php";

if (!isset($_SESSION['usuario_id'])) {
    http_response_code(401);
    exit('Não autorizado');
}

$id = isset($_POST['id']) ? (int)$_POST['id'] : 0;
$usuario_id = (int) $_SESSION['usuario_id'];

if ($id <= 0) {
    exit('ID inválido');
}

$stmt = $conexao->prepare("
    UPDATE agendamentos 
    SET status = 'cancelado' 
    WHERE id = ? AND consumidor_id = ?
");
$stmt->bind_param("ii", $id, $usuario_id);
if ($stmt->execute()) {
    echo "ok";
} else {
    echo "Erro ao cancelar";
}
