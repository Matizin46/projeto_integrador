<?php

$nome = $_POST['nome'];
$cpf = $_POST['cpf'];
$email = $_POST['email'];
$senha1 = $_POST['senha'];
$endereco = $_POST['endereco'];
$telefone = $_POST['telefone'];

include "../conexao.php";
$sql = "insert into consumidor(nome, cpf, email, senha, endereco, telefone) values('$nome', '$cpf', '$email', '$senha1', '$endereco', '$telefone')"; 


$resultado = mysqli_query($conexao, $sql);

mysqli_close($conexao);

header("location:../Login/login.php")
?>


