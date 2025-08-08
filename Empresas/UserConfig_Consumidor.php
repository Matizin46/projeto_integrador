<?php
// Inicia a sessão para acessar variáveis de sessão
session_start();

// Inclui a conexão com o banco de dados
include "../conexao.php";

// Verifica se o usuário está logado
if (!isset($_SESSION['usuario_id'])) {
    die("Acesso não autorizado.");
}

// Pega o ID do usuário logado
$id = intval($_SESSION['usuario_id']);

// Captura o tipo de usuário (1 = fornecedor, 2 = consumidor)
$tipo_usuario = $_SESSION['tipo_usuario'] ?? '';

// Inicializa variáveis para armazenar dados do usuário
$nome = $email = $cpf = $endereco = $telefone = "";

// Busca os dados do usuário no banco
$stmt = $conexao->prepare("SELECT nome, email, cpf, endereco, telefone FROM usuarios WHERE id = ?");
$stmt->bind_param("i", $id);
$stmt->execute();
$stmt->bind_result($nome, $email, $cpf, $endereco, $telefone);
$stmt->fetch();
$stmt->close();
?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8" />
  <title>Editar Cadastro - Estetique</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  
  <!-- Bootstrap para estilos e responsividade -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  
  <!-- SweetAlert para mensagens de alerta -->
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

  <!-- Fonte Poppins para manter padrão visual -->
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">

  <style>
    body {
      background-color: #fef0fb;
      font-family: 'Poppins', sans-serif; /* Fonte padrão do projeto */
      min-height: 100vh;
      display: flex;
      flex-direction: column;
    }

    /* Barra superior com título e botão de voltar */
    .top-bar {
      background: linear-gradient(to right, #67086F, #ca5fb3, #C50FD5);
      padding: 20px 40px;
      display: flex;
      justify-content: start;
      gap: 620px;
      align-items: center;
      flex-direction: row-reverse;
    }
    .top-bar h3 {
      color: white;
      font-weight: bold;
      margin: 0;
    }

    /* Botão de voltar */
    .voltar {
      background-color: #dc3545;
      color: white;
      padding: 10px 25px;
      text-decoration: none;
      border-radius: 40px;
      font-weight: bold;
      font-size: 16px;
      box-shadow: 0 2px 4px rgba(0,0,0,0.2);
      transition: background 0.3s;
      cursor: pointer;
    }
    .voltar:hover { background-color: #b02a37; }

    /* Área principal centralizada */
    .container {
      padding: 60px 15px 100px 15px;
      flex: 1;
      display: flex;
      justify-content: center;
      align-items: flex-start;
    }

    /* Caixa de configurações */
    .config-box {
      background: white;
      padding: 30px;
      border-radius: 12px;
      box-shadow: 0 0 12px rgba(0,0,0,0.1);
      width: 100%;
      max-width: 550px;
    }
    .config-box h2 {
      margin-bottom: 25px;
      font-weight: bold;
      color: #67086F;
      text-align: center;
    }

    /* Botão de salvar */
    .btn-salvar {
      background-color: #28a745;
      border: none;
      color: white;
      padding: 12px;
      width: 100%;
      font-weight: bold;
      border-radius: 6px;
    }
    .btn-salvar:hover { background-color: #218838; }

    /* Mensagens de retorno */
    .mensagem {
      padding: 15px;
      border-radius: 6px;
      margin-bottom: 20px;
      text-align: center;
      font-weight: bold;
    }
    .sucesso { background-color: #d4edda; color: #155724; }
    .erro    { background-color: #f8d7da; color: #721c24; }
  </style>
</head>
<body>

  <!-- Cabeçalho com título e botão voltar -->
  <div class="top-bar">
    <h3>Editar Cadastro</h3>
    <a class="voltar" href="empresas.php">← Voltar</a>
  </div>

  <!-- Conteúdo principal -->
  <div class="container">
    <div class="config-box">
      <h2>Atualize seus dados</h2>

      <?php
      // Exibe mensagens de sucesso ou erro vindas da sessão
      if (isset($_SESSION['mensagem'])) {
        if ($_SESSION['mensagem'] == 'sucesso') {
          echo "<div class='mensagem sucesso'>✅ Dados salvos com sucesso!</div>";
        } elseif ($_SESSION['mensagem'] == 'erro') {
          echo "<div class='mensagem erro'>❌ Erro ao salvar os dados. Tente novamente.</div>";
        }
        unset($_SESSION['mensagem']); // Remove a mensagem após exibir
      }
      ?>

      <!-- Formulário para edição de dados -->
      <!-- Importante: Consumidor salva no arquivo salvar_config_consumidor.php -->
      <form action="salvar_config_consumidor.php" method="post">
        <div class="mb-3">
          <label for="nome" class="form-label">Nome:</label>
          <input type="text" class="form-control" name="nome" id="nome" value="<?= htmlspecialchars($nome) ?>" required>
        </div>

        <div class="mb-3">
          <label for="cpf" class="form-label">CPF:</label>
          <input type="text" class="form-control" name="cpf" id="cpf" value="<?= htmlspecialchars($cpf) ?>" required>
        </div>

        <div class="mb-3">
          <label for="email" class="form-label">E-mail:</label>
          <input type="email" class="form-control" name="email" id="email" value="<?= htmlspecialchars($email) ?>" required>
        </div>

        <div class="mb-3">
          <label for="senha" class="form-label">Nova senha:</label>
          <input type="password" class="form-control" name="senha" id="senha" placeholder="Deixe em branco para manter">
        </div>

        <div class="mb-3">
          <label for="endereco" class="form-label">Endereço:</label>
          <input type="text" class="form-control" name="endereco" id="endereco" value="<?= htmlspecialchars($endereco) ?>">
        </div>

        <div class="mb-3">
          <label for="telefone" class="form-label">Telefone:</label>
          <input type="text" class="form-control" name="telefone" id="telefone" value="<?= htmlspecialchars($telefone) ?>">
        </div>

        <!-- ID do usuário oculto para identificar no update -->
        <input type="hidden" name="id" value="<?= htmlspecialchars($id) ?>">

        <!-- Botão de envio -->
        <div class="d-grid mt-4">
          <button type="submit" class="btn-salvar">💾 Salvar Alterações</button>
        </div>
      </form>
    </div>
  </div>

  <!-- Rodapé -->
  <?php include "../includes/rodape.php"; ?>

</body>
</html>
