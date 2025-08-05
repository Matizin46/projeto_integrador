<?php
#cliente alterar config

$id = $POST[''id];
$nome = $POST['nome'];
$email = $POST['email'];
$cpf = $POST['cpf'];
$endereco = $POST['endereco'];
$telefone = $POST['telefone'];

include "../conexao.php";
$sql = "update usuarios set nome = '$nome', email = '$email', cpf = '$cpf', endereco = '$endereco', telefone = '$telefone' where id = $id";
$resultado = mysqli_query($conexao, $sql);

mysqli_close($conexao);

header("Location: salvar_config_consumidor.php");
?>