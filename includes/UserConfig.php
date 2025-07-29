<?php
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
  <style>
    body {
      margin: 0;
      font-family: Arial, sans-serif;
      background: #f5f5f5;
    }

    .section {
      padding: 30px;
    }

    .option {
      display: flex;
      justify-content: space-between;
      align-items: center;
      border: 1px solid #ccc;
      border-radius: 10px;
      padding: 15px 20px;
      background: white;
      cursor: pointer;
      margin-bottom: 20px;
    }

    .option span {
      font-size: 16px;
    }

    .conteudo {
      display: none;
      background: white;
      padding: 20px;
      border-radius: 10px;
    }

    .conteudo form {
      display: flex;
      flex-direction: column;
      gap: 15px;
    }

    .conteudo input, .conteudo button {
      padding: 12px;
      font-size: 16px;
      border-radius: 6px;
      border: 1px solid #ccc;
      width: 100%;
      box-sizing: border-box;
    }

    .conteudo button {
      background: linear-gradient(to right, rgb(77, 90, 212), rgb(125, 64, 202));
      color: white;
      font-weight: bold;
      border: none;
      cursor: pointer;
      transition: 0.3s;
    }

    .conteudo button:hover {
      opacity: 0.9;
    }

    .mensagem {
      margin-top: 10px;
      color: green;
    }
  </style>
</head>
<body>

<!-- Topo com botão voltar -->
<div style="background: linear-gradient(to right, #8e2de2, #c11ddf); padding: 15px; display: flex; align-items: center;">
  <button onclick="window.location.href='home.php'" style="
    background-color: #e74c3c;
    border: none;
    color: white;
    padding: 10px 20px;
    border-radius: 30px;
    font-size: 14px;
    cursor: pointer;
    margin-right: auto;">← Voltar</button>
  <h2 style="color: white; margin: 0 auto;">Estetique ⚙️</h2>
</div>

<!-- Seção de edição -->
<div class="section">
  <h2>Configurações</h2>

  <div class="option" onclick="toggleFormulario()">
    <span>👤 Nome</span>
    <span style="color: gray;">Editar perfil</span>
  </div>

  <?php if ($mensagem): ?>
    <p class="mensagem"><?php echo $mensagem; ?></p>
  <?php endif; ?>

  <div id="formulario" class="conteudo">
    <form method="POST">
      <input type="text" name="nome" placeholder="Alterar nome (opcional)">
      <input type="text" name="cpf" placeholder="Alterar CPF (opcional)">
      <input type="email" name="email" placeholder="Alterar e-mail (opcional)">
      <input type="password" name="senha" placeholder="Alterar senha (opcional)">
      <input type="text" name="endereco" placeholder="Alterar endereço (opcional)">
      <input type="text" name="telefone" placeholder="Alterar telefone (opcional)">
      <button type="submit">Salvar alterações</button>
    </form>
  </div>
</div>

<!-- Seção de planos ajustada -->
<div class="section" style="margin-bottom: 60px; margin-top: -10px;">
  <div class="planos" style="margin-top: 20px; display: flex; justify-content: center;">
    <div class="plano" data-id="1" style="margin: 0 auto; background: white; padding: 20px; border-radius: 15px; box-shadow: 0 5px 10px rgba(0,0,0,0.1); text-align: center; width: 300px;">
      <h3 style="color: red;">Escolha seu Plano<br><br>Mensalidade: R$ 20</h3>
      <ul style="list-style: none; padding: 0;">
        <li>Impulso de loja</li>
        <li>Banner no perfil</li>
        <li>Taxa de 10% em pagamentos</li>
      </ul>
      <button onclick="adquirirPlano(1)" style="
        background: linear-gradient(to right, #8e2de2, #c11ddf);
        border: none;
        padding: 10px 20px;
        border-radius: 30px;
        color: white;
        font-weight: bold;
        cursor: pointer;
        margin-top: 10px;
      ">ADQUIRIR</button>
    </div>
  </div>
</div>

<script>
  function toggleFormulario() {
    const form = document.getElementById('formulario');
    form.style.display = (form.style.display === 'block') ? 'none' : 'block';
  }

  function adquirirPlano(id) {
    window.location.href = `../Pagamento/pagamento.php?plano_id=${id}`;
  }
</script>

</body>
</html>
