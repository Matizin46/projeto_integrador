<?php
session_start();                 // Inicia a sessão (necessária para usar $_SESSION)
include "../conexao.php";        // Arquivo de conexão com o banco

// Garante que este script só seja acessado via POST (evita acesso indevido via GET)
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
  die("Requisição inválida.");
}

// --- Coleta e normaliza os dados vindos do formulário ---
$id        = isset($_POST['id']) ? (int) $_POST['id'] : 0;           // ID do usuário (inteiro)
$nome      = trim($_POST['nome']     ?? '');                         // Nome (sem espaços extras)
$email     = trim($_POST['email']    ?? '');                         // E-mail
$cpf       = trim($_POST['cpf']      ?? '');                         // CPF
$endereco  = trim($_POST['endereco'] ?? '');                         // Endereço
$telefone  = trim($_POST['telefone'] ?? '');                         // Telefone
$senha     = trim($_POST['senha']    ?? '');                         // Senha (pode vir vazia, caso não queira trocar)

// Valor padrão da mensagem (usado depois no SweetAlert e na sessão)
$mensagem = 'erro';

// Validação mínima: precisa ter ID válido e campos essenciais preenchidos
if ($id > 0 && $nome !== '' && $email !== '' && $cpf !== '') {

  // Se o usuário informou nova senha, atualizamos também a senha (com hash)
  if ($senha !== '') {
    $senha_hash = password_hash($senha, PASSWORD_DEFAULT); // Hasheia a senha com algoritmo seguro
    $sql = "UPDATE usuarios 
              SET nome = ?, email = ?, cpf = ?, endereco = ?, telefone = ?, senha = ?
            WHERE id = ?";
    $stmt = $conexao->prepare($sql);
    $stmt->bind_param("ssssssi", $nome, $email, $cpf, $endereco, $telefone, $senha_hash, $id);
  } else {
    // Sem troca de senha: atualiza apenas os demais campos
    $sql = "UPDATE usuarios 
              SET nome = ?, email = ?, cpf = ?, endereco = ?, telefone = ?
            WHERE id = ?";
    $stmt = $conexao->prepare($sql);
    $stmt->bind_param("sssssi", $nome, $email, $cpf, $endereco, $telefone, $id);
  }

  // Executa a atualização e ajusta a mensagem conforme resultado
  if ($stmt && $stmt->execute()) {
    $mensagem = 'sucesso';
  }
  if ($stmt) { $stmt->close(); } // Boa prática: fecha o statement
}

// Fecha a conexão com o banco
$conexao->close();

// Guarda a mensagem na sessão (caso queira usar em outra tela)
$_SESSION['mensagem'] = $mensagem;

// Define para onde vamos redirecionar depois do alerta
$redirect = "../Empresas/UserConfig_Consumidor.php";
?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8">
  <title>Salvando...</title>

  <!-- Fonte Poppins (mesma do projeto) -->
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">

  <!-- Aplica a Poppins globalmente nesta página de feedback -->
  <style>
    body {
      font-family: 'Poppins', sans-serif;
    }
  </style>

  <!-- SweetAlert2 para o feedback visual -->
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
<script>
  // Exibe alerta de sucesso/erro e redireciona após 2 segundos
  Swal.fire({
    icon: '<?= $mensagem === "sucesso" ? "success" : "error" ?>',
    title: '<?= $mensagem === "sucesso" ? "Dados atualizados com sucesso!" : "Erro ao atualizar os dados!" ?>',
    showConfirmButton: false,
    timer: 2000
  }).then(() => {
    // Redireciona para a página de configuração do consumidor
    window.location.href = "<?= $redirect ?>";
  });
</script>
</body>
</html>
