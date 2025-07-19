<?php
$servidor = "localhost";
$usuario = "root";
$senha = "12345678";
$banco = "bd_estetique";

$conexao = new mysqli($servidor, $usuario, $senha, $banco);

if ($conexao->connect_error) {
  die("Erro na conexão: " . $conexao->connect_error);
}
?>
