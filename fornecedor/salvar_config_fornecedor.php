<?php
session_start();
include "../conexao.php";

$id = (int) $_POST['id'];
$nome = $_POST['nome'];
$email = $_POST['email'];
$cpf = $_POST['cpf'];
$endereco = $_POST['endereco'];
$telefone = $_POST['telefone'];

$sql = "UPDATE usuarios 
        SET nome = '$nome', email = '$email', cpf = '$cpf', endereco = '$endereco', telefone = '$telefone' 
        WHERE id = $id";

$resultado = mysqli_query($conexao, $sql);
mysqli_close($conexao);

// Define o tipo de mensagem (sucesso ou erro)
$mensagem = $resultado ? 'sucesso' : 'erro';
?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8">
  <title>Salvando...</title>
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
<script>
  Swal.fire({
    icon: '<?= $mensagem === 'sucesso' ? 'success' : 'error' ?>',
    title: '<?= $mensagem === 'sucesso' ? 'Dados atualizados com sucesso!' : 'Erro ao atualizar os dados!' ?>',
    showConfirmButton: false,
    timer: 2000
  }).then(() => {
    window.location.href = "UserConfig.php";
  });
</script>
</body>
</html>
