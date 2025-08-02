<?php
include "../includes/cabecalhoconfig.php";
session_start();
if (!isset($_SESSION['usuario_id'])) {
    $_SESSION['usuario_id'] = 1;
}
$conn = new mysqli('localhost', 'root', '12345678', 'bd_estetique');

$mensagem = '';
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $campos = ['nome', 'cpf', 'email', 'senha', 'endereco', 'telefone'];
    $updates = $params = [];
    $tipos = '';

    foreach ($campos as $campo) {
        if (!empty($_POST[$campo])) {
            $updates[] = "$campo = ?";
            $params[] = $_POST[$campo];
            $tipos .= 's';
        }
    }

    if ($updates) {
        $params[] = $_SESSION['usuario_id'];
        $tipos .= 'i';
        $sql = "UPDATE usuarios SET " . implode(', ', $updates) . " WHERE id = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param($tipos, ...$params);
        $stmt->execute();
        $mensagem = $stmt->affected_rows > 0 ? "Dados atualizados com sucesso!" : "Nenhuma alteração realizada.";
    }
}

$stmt = $conn->prepare("SELECT nome, cpf, email, senha, endereco, telefone FROM usuarios WHERE id = ?");
$stmt->bind_param("i", $_SESSION['usuario_id']);
$stmt->execute();
$result = $stmt->get_result()->fetch_assoc();
?>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <title>Editar Perfil</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      font-family: 'Segoe UI', sans-serif;
      margin: 0;
      background: #f4f4f4;
    }

    .header {
      padding: 20px;
      background: linear-gradient(to right, #67086F, #ca5fb3, #C50FD5);
      color: white;
      font-weight: bold;
      font-size: 24px;
      display: flex;
      align-items: center;
      justify-content: center;
    }

    .section {
      padding: 20px;
    }

    .option {
      background: #fff;
      padding: 15px 20px;
      margin-bottom: 10px;
      border-radius: 12px;
      border: 1px solid #ccc;
      display: flex;
      justify-content: space-between;
      align-items: center;
      cursor: pointer;
     
    }

    .option:hover {
      background: #f0f0f0;
    }

    .conteudo {
      margin-bottom: 70px;
      padding: 20px;
      margin-top: 10px;
      background: #fff;
      border-radius: 12px;
      box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
    }

    .btn-vermelho {
      background-color: #875fb6;
      color: white;
      padding: 12px;
      border: none;
      border-radius: 8px;
      font-size: 16px;
      cursor: pointer;
      transition: background-color 0.3s;
    }

    .btn-vermelho:hover {
      background-color: #C50FD5;
    }

    .voltar {
      position: fixed;
      top: 10px;
      left: 20px;
      background-color: #d62828;
      color: white;
      padding: 12px 20px;
      border-radius: 30px;
      font-size: 16px;
      font-weight: bold;
      cursor: pointer;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15);
      transition: background-color 0.3s;
      z-index: 1000;
    }

    .voltar:hover {
      background-color: #a31c1c;
    }

    .mensagem {
      color: green;
      font-weight: bold;
      margin-top: 10px;
    }
  </style>
</head>
<body>

<div class="voltar" onclick="window.location.href='home.php'">← Voltar</div>

<div class="header">Estetique ⚙️</div>

<div class="section">
  <h2 class="mb-3">Configurações</h2>

  <div class="option" onclick="toggleFormulario()">👤 Nome <span style="color: gray;">Editar perfil</span></div>

  <?php if ($mensagem): ?>
    <p class="mensagem"><?php echo $mensagem; ?></p>
  <?php endif; ?>

  <div id="formulario" class="conteudo" style="display: block;">
    <form method="POST">
      <div class="mb-3">
        <label class="form-label">Nome</label>
        <input type="text" name="nome" class="form-control" placeholder="Alterar nome (opcional)">
      </div>
      <div class="mb-3">
        <label class="form-label">CPF</label>
        <input type="text" name="cpf" class="form-control" placeholder="Alterar CPF (opcional)">
      </div>
      <div class="mb-3">
        <label class="form-label">Email</label>
        <input type="email" name="email" class="form-control" placeholder="Alterar email (opcional)">
      </div>
      <div class="mb-3">
        <label class="form-label">Senha</label>
        <input type="password" name="senha" class="form-control" placeholder="Alterar senha (opcional)">
      </div>
      <div class="mb-3">
        <label class="form-label">Endereço</label>
        <input type="text" name="endereco" class="form-control" placeholder="Alterar endereço (opcional)">
      </div>
      <div class="mb-3">
        <label class="form-label">Telefone</label>
        <input type="text" name="telefone" class="form-control" placeholder="Alterar telefone (opcional)">
      </div>
      <button type="submit" class="btn-vermelho w-100">Salvar alterações</button>
    </form>
  </div>
</div>

<script>
  function toggleFormulario() {
    const form = document.getElementById('formulario');
    form.style.display = (form.style.display === 'block') ? 'none' : 'block';
  }
</script>

<?php include "../includes/rodape.php"; ?>
</body>
</html>
