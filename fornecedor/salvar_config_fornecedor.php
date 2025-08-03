<?php
session_start();

if (!isset($_SESSION['usuario_id']) || $_SESSION['tipo_usuario'] != 1) {
    die("Acesso negado.");
}

$conn = new mysqli('localhost', 'root', '12345678', 'bd_estetique');

if ($conn->connect_error) {
    die("Erro na conexão: " . $conn->connect_error);
}

$campos = ['nome', 'cpf', 'email', 'senha', 'endereco', 'telefone'];
$updates = $params = [];
$tipos = '';

foreach ($campos as $campo) {
    if (!empty($_POST[$campo])) {
        $updates[] = "$campo = ?";
        $params[] = $_POST[$campo];
        $tipos .= 's';
    }
}

if ($updates) {
    $params[] = $_SESSION['usuario_id']; // ✅ ID do usuário logado
    $tipos .= 'i';

    $sql = "UPDATE usuarios SET " . implode(', ', $updates) . " WHERE id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param($tipos, ...$params);
    $stmt->execute();

    $_SESSION['mensagem'] = $stmt->affected_rows > 0
        ? "✅ Dados atualizados com sucesso!"
        : "⚠️ Nenhuma alteração realizada.";
} else {
    $_SESSION['mensagem'] = "⚠️ Nenhum campo preenchido.";
}

header("Location: UserConfig.php");
exit;
