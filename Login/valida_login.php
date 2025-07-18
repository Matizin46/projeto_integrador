<?php

$usuario1 = $_POST['usuario'];
$senha1 = $_POST['senha'];

include "../conexao.php";
$sql = "select * from consumidor where email='$usuario1' and senha='$senha1'"; 

$resultado = mysqli_query($conexao, $sql);

if($resultado->num_rows > 0){
    header("location:../Home/home.php");
}
else{
    header("location:login.php?erro= Usuário ou senha inválido");
}

mysqli_close($conexao);
?>