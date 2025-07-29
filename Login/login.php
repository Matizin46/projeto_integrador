<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Estetique - Login Fornecedor e Consumidor</title>
  <link rel="stylesheet" href="login.css">
  <script src="login.js" defer></script>
  <script src="senha.js" defer></script>
</head>
<body>
  <div class="container">
    <div class="painel-esquerdo">
      <h1 class="titulo">ESTETIQUE</h1>
      <p>Bem-vindo(a) ao portal</p>

      <div class="tabs">
        <button class="tab ativo" onclick="mostrarLogin('fornecedor')">Sou Fornecedor</button>
        <button class="tab" onclick="mostrarLogin('consumidor')">Sou Consumidor</button>
      </div>
    </div>

    <div class="painel-direito">

      <!-- Formulário Fornecedor -->
      <form id="form-fornecedor" class="formulario ativo" action="../Login/valida_login.php" method="post">
        <h2>Login Fornecedor</h2>
        <input type="text" placeholder="Usuário ou E-mail" name="usuario" required>
        <input type="password" placeholder="Senha" name="senha" required>
        <input type="hidden" name="tipo" value="1">
        <button type="submit">Entrar</button>
        <?php
        $erro=$_GET["erro"] ?? "";
        echo "<p style='color:red;'>$erro</p>";
        ?>
        <p class="link">
          <a href="#" id="esqueci-fornecedor">Esqueci minha senha</a><br />
          <a href="../fornecedor/fornecedor.php">Primeiro acesso? Faça seu cadastro</a>
        </p>
      </form>

      <!-- Formulário Consumidor -->
      <form id="form-consumidor" class="formulario" action="../Login/valida_login.php" method="post">
        <h2>Login Consumidor</h2>
        <input type="text" placeholder="Usuário ou E-mail" name="usuario" required>
        <input type="password" placeholder="Senha" name="senha" required>
        <input type="hidden" name="tipo" value="2">
        <button type="submit">Entrar</button>
        <?php
        $erro=$_GET["erro"] ?? "";
        echo "<p style='color:red;'>$erro</p>";
        ?>
        <p class="link">
          <a href="#" id="esqueci-consumidor">Esqueci minha senha</a><br />
          <a href="../consumidor/consumidor.php">Primeiro acesso? Faça seu cadastro</a>
        </p>
      </form>

    </div>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  </div>
</body>
</html>
