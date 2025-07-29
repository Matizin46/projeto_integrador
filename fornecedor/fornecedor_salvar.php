<?php

$nome = $_POST['nome'];
$cpf = $_POST['cpf'];
$email = $_POST['email'];
$senha1 = $_POST['senha'];
$endereco = $_POST['endereco'];
$telefone = $_POST['telefone'];
$tipo = $_POST['id_tipo_usuario'];

include "../conexao.php";
$sql = "insert into usuarios(nome, cpf, email, senha, endereco, telefone, id_tipo_usuario) values('$nome', '$cpf', '$email', '$senha1', '$endereco', '$telefone', 1)"; 


$resultado = mysqli_query($conexao, $sql);

mysqli_close($conexao);

header("location:../Login/login.php")
?>

