<?php
session_start();
include "../conexao.php";

$usuario_id = $_SESSION['id_usuario'] ?? 0;

// Verifica se está logado
if (!$usuario_id) {
    $_SESSION['msg'] = "Usuário não autenticado.";
    header("Location: UserConfig_Consumidor.php");
    exit;
}

// Verifica se é consumidor
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

// Dados recebidos
$nome     = trim($_POST['nome'] ?? '');
$cpf      = trim($_POST['cpf'] ?? '');
$email    = trim($_POST['email'] ?? '');
$endereco = trim($_POST['endereco'] ?? '');
$telefone = trim($_POST['telefone'] ?? '');
$senha    = $_POST['senha'] ?? '';

// Atualiza com ou sem senha
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

// Executa atualização
if ($stmt->execute()) {
    // Atualiza sessão
    $_SESSION['nome']     = $nome;
    $_SESSION['email']    = $email;
    $_SESSION['telefone'] = $telefone;

    $_SESSION['msg'] = "✅ Cadastro atualizado com sucesso!";
} else {
    $_SESSION['msg'] = "❌ Erro ao atualizar: {$stmt->error}";
}

$stmt->close();
$conexao->close();

header("Location: UserConfig_Consumidor.php");
exit;
