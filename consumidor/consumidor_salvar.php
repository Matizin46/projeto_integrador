<?php

// Recebe os valores enviados pelo formulário via método POST
// Essas variáveis pegam diretamente o valor de cada campo do formulário HTML
$nome     = $_POST['nome'];
$cpf      = $_POST['cpf'];
$email    = $_POST['email'];
$senha1   = $_POST['senha']; // OBS: senha ainda em texto puro (não criptografada)
$endereco = $_POST['endereco'];
$telefone = $_POST['telefone'];
$tipo     = $_POST['id_tipo_usuario']; // Está pegando, mas no INSERT está fixo como 2

// Inclui o arquivo que faz a conexão com o banco de dados
include "../conexao.php";

// Monta a instrução SQL de inserção na tabela "usuarios"
// Está inserindo todos os campos recebidos do formulário
// IMPORTANTE: aqui o valor de id_tipo_usuario está fixo como 2, independente do $tipo recebido
$sql = "INSERT INTO usuarios(nome, cpf, email, senha, endereco, telefone, id_tipo_usuario)
        VALUES('$nome', '$cpf', '$email', '$senha1', '$endereco', '$telefone', 2)"; 

// Executa a query no banco usando a conexão $conexao
$resultado = mysqli_query($conexao, $sql);

// Fecha a conexão com o banco (boa prática)
mysqli_close($conexao);

// Redireciona o usuário para a tela de login após cadastro
header("location:../Login/login.php");

?>




