<?php
session_start();
header('Content-Type: application/json'); // importante para fetch interpretar a resposta como JSON

include "../conexao.php";

$usuario_id = $_SESSION['id_usuario'] ?? 0;

if ($tipo_usuario != 2) {
    $_SESSION['msg'] = "Acesso não autorizado.";
    header("Location: UserConfig_Consumidor.php");
    exit;
}

    if ($stmt->execute()) {
        $stmt->close();
        session_destroy();
        echo json_encode(['status' => 'ok']);
    } else {
        echo json_encode(['status' => 'erro', 'mensagem' => 'Erro ao excluir do banco: ' . $stmt->error]);
    }
} else {
    echo json_encode(['status' => 'erro', 'mensagem' => 'Usuário não autenticado.']);
}
?>
