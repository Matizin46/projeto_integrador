<?php
include "../conexao.php";

echo "<h1>Listagem de usuários</h1>";

$sql = "select * from usuarios";
$resultado = mysqli_query($conexao, $sql);
while($linha = mysqli_fetch_assoc($resultado)){
    echo $linha['nome'] . "-" .$linha['email'].'<br>';
}

echo "<p><a href='usuario_form.php'>Adicionar um novo usuário</a></p>";

?>