<?php
// Inicia a sessão para acessar dados do usuário e mensagens de retorno
session_start();

// Inclui a conexão com o banco de dados
include "../conexao.php";

// Garante que o método de requisição seja POST
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
  die("Requisição inválida.");
}

// Recebe e valida os dados enviados pelo formulário
$id        = isset($_POST['id']) ? (int) $_POST['id'] : 0; // ID do usuário
$nome      = trim($_POST['nome']     ?? ''); // Nome completo
$email     = trim($_POST['email']    ?? ''); // E-mail
$cpf       = trim($_POST['cpf']      ?? ''); // CPF
$endereco  = trim($_POST['endereco'] ?? ''); // Endereço
$telefone  = trim($_POST['telefone'] ?? ''); // Telefone
$senha     = trim($_POST['senha']    ?? ''); // Senha (opcional)

// Variável que define o estado inicial da mensagem (erro por padrão)
$mensagem = 'erro';

// Valida se os campos obrigatórios foram preenchidos
if ($id > 0 && $nome !== '' && $email !== '' && $cpf !== '') {

  if ($senha !== '') {
    // Se a senha foi enviada, atualiza junto com os outros dados
    $senha_hash = password_hash($senha, PASSWORD_DEFAULT); // Criptografa a senha
    $sql = "UPDATE usuarios 
              SET nome = ?, email = ?, cpf = ?, endereco = ?, telefone = ?, senha = ?
            WHERE id = ?";
    $stmt = $conexao->prepare($sql);
    $stmt->bind_param("ssssssi", $nome, $email, $cpf, $endereco, $telefone, $senha_hash, $id);
  } else {
    // Caso não tenha senha nova, atualiza somente os outros campos
    $sql = "UPDATE usuarios 
              SET nome = ?, email = ?, cpf = ?, endereco = ?, telefone = ?
            WHERE id = ?";
    $stmt = $conexao->prepare($sql);
    $stmt->bind_param("sssssi", $nome, $email, $cpf, $endereco, $telefone, $id);
  }

  // Executa a query e verifica se deu certo
  if ($stmt && $stmt->execute()) {
    $mensagem = 'sucesso';
  }
  
  // Fecha a conexão da consulta preparada
  if ($stmt) { 
    $stmt->close(); 
  }
}

// Fecha a conexão com o banco de dados
mysqli_close($conexao);

// Define o redirecionamento de acordo com o tipo de usuário logado
$tipo_usuario = $_SESSION['tipo_usuario'] ?? null;
$redirect = ($tipo_usuario == 1)
  ? "../fornecedor/UserConfig.php" // Se for fornecedor
  : "../Empresas/UserConfig_Consumidor.php"; // Se for consumidor

// Armazena na sessão para exibir um banner de sucesso/erro na tela de edição
$_SESSION['mensagem'] = $mensagem;
?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8">
  <title>Salvando...</title>
  <!-- Importa biblioteca SweetAlert2 para mensagens bonitas -->
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
<script>
  // Exibe mensagem de acordo com o resultado da atualização
  Swal.fire({
    icon: '<?= $mensagem === "sucesso" ? "success" : "error" ?>',
    title: '<?= $mensagem === "sucesso" ? "Dados atualizados com sucesso!" : "Erro ao atualizar os dados!" ?>',
    showConfirmButton: false,
    timer: 2000
  }).then(() => {
    // Após o tempo definido, redireciona para a página correspondente
    window.location.href = "<?= $redirect ?>";
  });
</script>
</body>
</html>
