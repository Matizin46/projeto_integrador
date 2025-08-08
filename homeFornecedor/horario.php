<?php
session_start();
include "../conexao.php";

// Verifica se o usuário está logado
if (!isset($_SESSION['usuario_id'])) {
    header("Location: ../Login/login.php");
    exit;
}

$empresa_id = $_SESSION['usuario_id'];

$sqlServico = "SELECT id, nome_servico FROM servicos WHERE empresa_id = $empresa_id LIMIT 1";
$res = mysqli_query($conexao, $sqlServico);
$servico = mysqli_fetch_assoc($res);

if (!$servico) {
    echo "Nenhum serviço encontrado para esta empresa.";
    exit;
}
?>

 <style>
    html, body {
      height: 100%;
      margin: 0;
      padding: 0;
      font-family: Arial, sans-serif;
      background: #fff0fb;
      display: flex;
      flex-direction: column;
    }

    .content {
      flex: 1;
      display: flex;
      justify-content: center;
      padding: 40px 15px 80px;
      max-width: 800px;
      align-items: center;
     
    }

    .container {
      width: 800px;
      padding: 30px;
      background: #fff;
      border-radius: 15px;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    }

    .btn-roxo {
      background: linear-gradient(to right, #67086F, #ca5fb3, #C50FD5);
      color: white;
      border: none;
    }

    .btn-roxo:hover {
      opacity: 0.9;
    }

    .form-label {
      font-weight: bold;
    }
    
    footer {
      background: linear-gradient(to right, #67086F, #ca5fb3, #C50FD5);
      color: white;
      padding: 20px;
      text-align: center;
    }

    .top-bar {
      background: linear-gradient(to right, #67086F, #ca5fb3, #C50FD5);
      padding: 20px 40px;
      display: flex;
      justify-content: start;
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
     {
      padding: 60px 15px 150px 15px;
      display: flex;
      justify-content: center;
      align-items: flex-start;
    }
    
  </style>
<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8">
  <title>Cadastro de Horário</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="../configuracao/configuracoes.css" />

</head>
<body>

    <div class="top-bar">
      <h3>Editar Cadastro</h3>
      <a class="voltar" href="../homeFornecedor/home.php">← Voltar</a>
    </div>

  <div class="content">
    <div class="container">
      <h2 class="text-center mb-4">Cadastro de Horário</h2>
      <form action="salvar_horario.php" method="post">
        <input type="hidden" name="servico_id" value="<?= $servico['id'] ?>">
        
        <div class="mb-3">
          <label class="form-label">Serviço</label>
          <input type="text" class="form-control" value="<?= htmlspecialchars($servico['nome_servico']) ?>" disabled>
        </div>

        <div class="mb-3">
          <label for="data" class="form-label">Data</label>
          <input type="date" class="form-control" name="data" required>
        </div>

        <div class="mb-3">
          <label for="hora" class="form-label">Horário</label>
          <input type="time" class="form-control" name="hora" required>
        </div>

        <div class="mb-3">
          <label for="status" class="form-label">Status</label>
          <select class="form-select" name="status" required>
            <option value="pendente">Pendente</option>
            <option value="confirmado">Confirmado</option>
            <option value="cancelado">Cancelado</option>
          </select>
        </div>

        <button type="submit" class="btn btn-roxo w-100">Salvar Horário</button>
      </form>
    </div>
  </div>

  <!-- ✅ Inclui o rodapé -->
  <?php include "../includes/rodape.php"; ?>

</body>
</html>
