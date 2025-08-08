<?php
session_start();
include "../conexao.php";

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
  die("Requisição inválida.");
}

$id        = isset($_POST['id']) ? (int) $_POST['id'] : 0;
$nome      = trim($_POST['nome']     ?? '');
$email     = trim($_POST['email']    ?? '');
$cpf       = trim($_POST['cpf']      ?? '');
$endereco  = trim($_POST['endereco'] ?? '');
$telefone  = trim($_POST['telefone'] ?? '');
$senha     = trim($_POST['senha']    ?? '');

$mensagem = 'erro';

if ($id > 0 && $nome !== '' && $email !== '' && $cpf !== '') {

  if ($senha !== '') {
    // Atualiza com senha
    $senha_hash = password_hash($senha, PASSWORD_DEFAULT);
    $sql = "UPDATE usuarios 
              SET nome = ?, email = ?, cpf = ?, endereco = ?, telefone = ?, senha = ?
            WHERE id = ?";
    $stmt = $conexao->prepare($sql);
    $stmt->bind_param("ssssssi", $nome, $email, $cpf, $endereco, $telefone, $senha_hash, $id);
  } else {
    // Atualiza sem senha
    $sql = "UPDATE usuarios 
              SET nome = ?, email = ?, cpf = ?, endereco = ?, telefone = ?
            WHERE id = ?";
    $stmt = $conexao->prepare($sql);
    $stmt->bind_param("sssssi", $nome, $email, $cpf, $endereco, $telefone, $id);
  }

  if ($stmt && $stmt->execute()) {
    $mensagem = 'sucesso';
  }
  if ($stmt) { $stmt->close(); }
}

$conexao->close();

// volta para a tela do consumidor
$_SESSION['mensagem'] = $mensagem;
$redirect = "../Empresas/UserConfig_Consumidor.php";
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
    icon: '<?= $mensagem === "sucesso" ? "success" : "error" ?>',
    title: '<?= $mensagem === "sucesso" ? "Dados atualizados com sucesso!" : "Erro ao atualizar os dados!" ?>',
    showConfirmButton: false,
    timer: 2000
  }).then(() => {
    window.location.href = "<?= $redirect ?>";
  });
</script>
</body>
</html>
