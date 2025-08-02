<?php
session_start();
include "../conexao.php";

$usuario_id = $_SESSION['id_usuario'] ?? 0;
$nome = $cpf = $email = $endereco = $telefone = "";
$msg = $_SESSION['msg'] ?? null;
unset($_SESSION['msg']);

if ($usuario_id > 0) {
  $stmt = $conexao->prepare("SELECT nome, cpf, email, endereco, telefone FROM usuarios WHERE id = ?");
  $stmt->bind_param("i", $usuario_id);
  $stmt->execute();
  $resultado = $stmt->get_result();

  if ($resultado->num_rows > 0) {
    $usuario = $resultado->fetch_assoc();
    $nome = $usuario['nome'];
    $cpf = $usuario['cpf'];
    $email = $usuario['email'];
    $endereco = $usuario['endereco'];
    $telefone = $usuario['telefone'];
  }

  $stmt->close();
}
?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Editar Cadastro - Estetique</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  <style>
    body {
      background-color: #fef0fb;
      margin: 0;
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
    }
    .voltar:hover {
      background-color: #b02a37;
    }
    .container {
      padding: 60px 15px 150px 15px;
      display: flex;
      justify-content: center;
      align-items: flex-start;
      min-height: auto;
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
    .btn-salvar:hover {
      background-color: #218838;
    }
    .mensagem {
      padding: 15px;
      border-radius: 6px;
      margin-bottom: 20px;
      text-align: center;
      font-weight: bold;
    }
    .sucesso { background-color: #d4edda; color: #155724; }
    .erro    { background-color: #f8d7da; color: #721c24; }
    .btn-excluir {
      background-color: #dc3545;
      color: white;
      padding: 12px;
      text-align: center;
      display: block;
      margin-top: 20px;
      border-radius: 6px;
      text-decoration: none;
      font-weight: bold;
      cursor: pointer;
    }
  </style>
</head>
<body>

  <div class="top-bar">
    <h3>Editar Cadastro</h3>
    <div class="voltar" onclick="window.history.back();">← Voltar</div>
  </div>

  <div class="container">
    <div class="config-box">
      <h2>Atualize seus dados</h2>

      <?php if ($msg): ?>
        <div class="mensagem <?= str_contains($msg, 'sucesso') ? 'sucesso' : 'erro' ?>">
          <?= $msg ?>
        </div>
      <?php endif; ?>

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
        <div class="d-grid mt-4">
          <button type="submit" class="btn-salvar">💾 Salvar Alterações</button>
        </div>
      </form>

      <button class="btn-excluir" onclick="excluirConta()">❌ Excluir Conta</button>
    </div>
  </div>

  <script>
    function excluirConta() {
      Swal.fire({
        title: 'Tem certeza?',
        text: 'Essa ação irá excluir sua conta permanentemente!',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonText: 'Sim, excluir!',
        cancelButtonText: 'Cancelar',
        confirmButtonColor: '#dc3545'
      }).then((result) => {
        if (result.isConfirmed) {
          fetch('excluir_config_consumidor.php')
            .then(response => response.json())
            .then(data => {
              if (data.status === 'ok') {
                Swal.fire({
                  title: 'Excluído!',
                  text: 'Sua conta foi excluída.',
                  icon: 'success',
                  confirmButtonText: 'OK'
                }).then(() => {
                  window.location.href = '../Login/login.php';
                });
              } else {
                Swal.fire('Erro!', data.mensagem || 'Erro ao excluir.', 'error');
              }
            })
            .catch(() => {
              Swal.fire('Erro!', 'Não foi possível excluir a conta.', 'error');
            });
        }
      });
    }
  </script>

</body>
</html>
