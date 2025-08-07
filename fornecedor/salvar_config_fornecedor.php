<?php
session_start();
include "../conexao.php";
$id = (int) $_POST['id'];
$nome = $_POST['nome'];
$email = $_POST['email'];
$cpf = $_POST['cpf'];
$endereco = $_POST['endereco'];
$telefone = $_POST['telefone'];
$senha = $_POST['senha'];
$mensagem = 'erro';
if (!empty($senha)) {
  $senha_hash = password_hash($senha, PASSWORD_DEFAULT);
  $sql = "UPDATE usuarios SET nome='$nome', email='$email', cpf='$cpf', endereco='$endereco', telefone='$telefone', senha='$senha_hash' WHERE id=$id";
} else {
  $sql = "UPDATE usuarios SET nome='$nome', email='$email', cpf='$cpf', endereco='$endereco', telefone='$telefone' WHERE id=$id";
}
if (mysqli_query($conexao, $sql)) {
  $mensagem = 'sucesso';
}
mysqli_close($conexao);
// Define redirecionamento conforme tipo de usuário
$tipo_usuario = $_SESSION['tipo_usuario'];
$redirect = ($tipo_usuario == 1) ? "../fornecedor/UserConfig.php" : "../Empresas/UserConfig_Consumidor.php";
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
    window.location.href = "<?= $redirect ?>";
  });
</script>
</body>
</html>