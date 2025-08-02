<?php
session_start();
include "../conexao.php";

$usuario_id = $_SESSION['id_usuario'] ?? 0;

if ($usuario_id > 0) {
    $stmt = $conexao->prepare("DELETE FROM usuarios WHERE id = ?");
    $stmt->bind_param("i", $usuario_id);
    $stmt->execute();
    $stmt->close();
    session_destroy();
    echo json_encode(['status' => 'ok']);
} else {
    echo json_encode(['status' => 'erro', 'mensagem' => 'Usuário não autenticado.']);
}
?>
