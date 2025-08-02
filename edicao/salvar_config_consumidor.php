<?php
session_start();
include "../conexao.php"; // agora correto, pois volta para a raiz

$usuario_id = $_SESSION['id_usuario'] ?? 0;

if (!$usuario_id) {
    $_SESSION['msg'] = "Usuário não autenticado.";
    header("Location: UserConfig_Consumidor.php");
    exit;
}

// Verifica tipo
$stmt = $conexao->prepare("SELECT id_tipo_usuario FROM usuarios WHERE id = ?");
$stmt->bind_param("i", $usuario_id);
$stmt->execute();
$stmt->bind_result($tipo_usuario);
$stmt->fetch();
$stmt->close();

if ($tipo_usuario != 2) {
    $_SESSION['msg'] = "Acesso não autorizado.";
    header("Location: UserConfig_Consumidor.php");
    exit;
}

// Dados
$nome = $_POST['nome'] ?? '';
$cpf = $_POST['cpf'] ?? '';
$email = $_POST['email'] ?? '';
$endereco = $_POST['endereco'] ?? '';
$telefone = $_POST['telefone'] ?? '';
$senha = $_POST['senha'] ?? '';

// Atualiza
if (!empty($senha)) {
    $senha_hash = password_hash($senha, PASSWORD_DEFAULT);
    $query = "UPDATE usuarios SET nome=?, cpf=?, email=?, senha=?, endereco=?, telefone=? WHERE id=?";
    $stmt = $conexao->prepare($query);
    $stmt->bind_param("ssssssi", $nome, $cpf, $email, $senha_hash, $endereco, $telefone, $usuario_id);
} else {
    $query = "UPDATE usuarios SET nome=?, cpf=?, email=?, endereco=?, telefone=? WHERE id=?";
    $stmt = $conexao->prepare($query);
    $stmt->bind_param("sssssi", $nome, $cpf, $email, $endereco, $telefone, $usuario_id);
}

if ($stmt->execute()) {
    $_SESSION['nome'] = $nome;
    $_SESSION['email'] = $email;
    $_SESSION['telefone'] = $telefone;

    $_SESSION['msg'] = "✅ Cadastro atualizado com sucesso!";
} else {
    $_SESSION['msg'] = "❌ Erro ao atualizar: {$stmt->error}";
}

$stmt->close();
$conexao->close();

header("Location: UserConfig_Consumidor.php");
exit;
?>


