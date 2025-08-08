<?php
session_start();
include "../conexao.php";

// ✅ Verifica se o usuário está logado
if (!isset($_SESSION['usuario_id'])) {
  die("Acesso não autorizado.");
}

// 🔹 Pega o ID e tipo de usuário da sessão
$id           = (int) $_SESSION['usuario_id'];
$tipo_usuario = $_SESSION['tipo_usuario'] ?? 1; // 1 = fornecedor, 2 = consumidor

// 🔹 Inicializa variáveis para evitar erros de variáveis indefinidas
$nome = $email = $cpf = $endereco = $telefone = "";

// 🔹 Busca os dados do usuário com prepared statement
$stmt = $conexao->prepare("
  SELECT nome, email, cpf, endereco, telefone 
  FROM usuarios 
  WHERE id = ?
");
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
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  <style>
    body {
      background-color: #fef0fb;
      font-family: 'Segoe UI', sans-serif;
    }
    .top-bar {
      background: linear-gradient(to right, #67086F, #ca5fb3, #C50FD5);
      padding: 20px 40px;
      display: flex;
      justify-content: space-between;
      align-items: center;
      flex-direction: row-reverse;
    }
    .top-bar h3 {
      color: white;
      font-weight: bold;
      margin: 0;
    }
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
    .container {
      padding: 60px 15px 150px 15px;
      display: flex;
      justify-content: center;
      align-items: flex-start;
    }
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
  <div class="top-bar">
    <h3>Editar Cadastro</h3>
    <!-- 🔹 Botão voltar ajustado conforme tipo de usuário -->
    <a class="voltar" href="<?= $tipo_usuario == 1 ? '../homeFornecedor/home.php' : '../empresas.php' ?>">← Voltar</a>
  </div>

  <div class="container">
    <div class="config-box">
      <h2>Atualize seus dados</h2>

      <?php
        // 🔹 Exibe mensagens de sucesso ou erro vindas da sessão
        if (isset($_SESSION['mensagem'])) {
          if ($_SESSION['mensagem'] == 'sucesso') {
            echo "<div class='mensagem sucesso'>✅ Dados salvos com sucesso!</div>";
          } elseif ($_SESSION['mensagem'] == 'erro') {
            echo "<div class='mensagem erro'>❌ Erro ao salvar os dados. Tente novamente.</div>";
          }
          unset($_SESSION['mensagem']);
        }
      ?>

      <!-- 🔹 Formulário para atualizar dados -->
      <form action="../fornecedor/salvar_config_fornecedor.php" method="post">
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

        <!-- 🔹 Campo oculto com ID do usuário -->
        <input type="hidden" name="id" value="<?= htmlspecialchars($id) ?>">

        <div class="d-grid mt-4">
          <button type="submit" class="btn-salvar">💾 Salvar Alterações</button>
        </div>
      </form>
    </div>
  </div>

  <?php include "../includes/rodape.php"; ?>
</body>
</html>
