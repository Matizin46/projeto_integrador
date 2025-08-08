<?php
// Recebe os dados enviados pelo formulário via POST (sem validação/sanitização)
$nome = $_POST['nome'];
$cpf = $_POST['cpf'];
$email = $_POST['email'];
$senha1 = $_POST['senha'];
$endereco = $_POST['endereco'];
$telefone = $_POST['telefone'];
$tipo = $_POST['id_tipo_usuario']; // não está sendo usado na query abaixo

include "../conexao.php"; // abre conexão com o banco

// ATENÇÃO: query concatenando dados do usuário -> vulnerável a SQL Injection
// Também está gravando a senha em texto puro (risco de segurança).
// Além disso, o id_tipo_usuario foi fixado em 1, ignorando o valor de $tipo.
$sql = "insert into usuarios(nome, cpf, email, senha, endereco, telefone, id_tipo_usuario)
        values('$nome', '$cpf', '$email', '$senha1', '$endereco', '$telefone', 1)";

$resultado = mysqli_query($conexao, $sql); // executa a query

mysqli_close($conexao); // fecha a conexão

// Redireciona para a página de login após o insert
header("location:../Login/login.php");
?>
