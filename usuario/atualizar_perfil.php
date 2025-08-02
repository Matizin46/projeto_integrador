<?php
session_start();

if (!isset($_SESSION['id_tipo_usuario'])) {
    die(json_encode(["status" => "erro", "mensagem" => "Usuário não logado"]));
}

$conn = new mysqli('localhost', 'root', '12345678', 'bd_estetique');
if ($conn->connect_error) {
    die(json_encode(["status" => "erro", "mensagem" => "Erro de conexão: " . $conn->connect_error]));
}

$id = $_SESSION['id_usuario'];

$nome = $_POST['nome'] ?? '';
$telefone = $_POST['telefone'] ?? '';
$email = $_POST['email'] ?? '';
$endereco = $_POST['endereco'] ?? '';

// Verificação de campos obrigatórios
if ($nome === '' || $telefone === '' || $email === '' || $endereco === '') {
    die(json_encode(["status" => "erro", "mensagem" => "Preencha todos os campos."]));
}

$sql = "UPDATE usuarios SET nome = ?, telefone = ?, email = ?, endereco = ? WHERE id = ?";
$stmt = $conn->prepare($sql);
if (!$stmt) {
    die(json_encode(["status" => "erro", "mensagem" => "Erro ao preparar a query: " . $conn->error]));
}

$stmt->bind_param("ssssi", $nome, $telefone, $email, $endereco, $id);
$stmt->execute();

if ($stmt->affected_rows > 0) {
    echo json_encode(["status" => "sucesso", "mensagem" => "Dados atualizados com sucesso!"]);
} else {
    echo json_encode(["status" => "alerta", "mensagem" => "Nenhuma alteração realizada."]);
}
?>

