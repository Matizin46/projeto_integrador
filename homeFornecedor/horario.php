<?php
    include "../includes/cabecalhoconfig.php"
    ?>
<div class="voltar" onclick="window.history.back();">← Voltar</div>

<?php
session_start();
if (!isset($_SESSION['usuario_id'])) {
    header("Location: ../Login/login.php");
    exit;
}

include "../conexao.php";
$empresa_id = $_SESSION['usuario_id'];

$sqlServico = "SELECT id, nome_servico FROM servicos WHERE empresa_id = $empresa_id LIMIT 1";
$res = mysqli_query($conexao, $sqlServico);
$servico = mysqli_fetch_assoc($res);

if (!$servico) {
    echo "Nenhum serviço encontrado para esta empresa.";
    exit;
}
?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8">
  <title>Cadastro de Horário</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
  <style>
    body {
      background: #fff0fb;
      font-family: Arial, sans-serif;
      padding-top: 80px;  /* Espaço do topo */
      padding-bottom: 100px; /* Espaço acima do rodapé */
    }

    .container {
      max-width: 600px;
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

    .voltar {
      position: fixed;
      top: 15px;
      left: 15px;
      background: #d62828;
      color: white;
      padding: 10px 20px;
      border-radius: 30px;
      font-weight: bold;
      cursor: pointer;
      z-index: 1000;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15);
    }
  </style>
</head>
<body>

  <div class="container">
    <h2 class="text-center mb-4">Cadastro de Horário</h2>
    <form action="salvar_horario.php" method="post">
      <input type="hidden" name="servico_id" value="<?php echo $servico['id']; ?>">
      <div class="mb-3">
        <label class="form-label">Serviço</label>
        <input type="text" class="form-control" value="<?php echo $servico['nome_servico']; ?>" disabled>
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

</body>
</html>

<?php
  include "../includes/rodape.php"
?>
