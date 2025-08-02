<?php
session_start();
include "../conexao.php";

$usuario_id = $_SESSION['id_usuario'] ?? 0;

if ($usuario_id > 0) {
    // Excluir de tabelas dependentes (ordem importa!)
    $conexao->query("DELETE FROM agendamentos WHERE usuario_id = $usuario_id");
    $conexao->query("DELETE FROM pagamentos WHERE usuario_id = $usuario_id");
    $conexao->query("DELETE FROM servicos WHERE usuario_id = $usuario_id");
    $conexao->query("DELETE FROM configuracoes_empresa WHERE usuario_id = $usuario_id");

    // Depois exclui o usuário
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

