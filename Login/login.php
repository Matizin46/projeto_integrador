<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Estetique - Login Fornecedor e Consumidor</title>

  <!-- Fonte padrão usada no restante do site -->
  <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">

  <!-- Estilos CSS do login -->
  <link rel="stylesheet" href="login.css">

  <!-- Scripts JS da página -->
  <script src="login.js" defer></script>
  <script src="senha.js" defer></script>

  <style>
    /* Aplica a fonte Poppins como padrão em todo o corpo da página */
    body {
      font-family: 'Poppins', sans-serif;
    }
  </style>
</head>
<body>
  <!-- Container geral que envolve todo o conteúdo -->
  <div class="container">

    <!-- Painel esquerdo com logo, texto de boas-vindas e botões de escolha -->
    <div class="painel-esquerdo">
      <h1 class="titulo">ESTETIQUE</h1>
      <p>Bem-vindo(a) ao portal</p>

      <!-- Botões de seleção de tipo de login -->
      <div class="tabs">
        <button class="tab ativo" onclick="mostrarLogin('fornecedor')">Sou Fornecedor</button>
        <button class="tab" onclick="mostrarLogin('consumidor')">Sou Consumidor</button>
      </div>
    </div>

    <!-- Painel direito que exibe o formulário de login -->
    <div class="painel-direito">

      <!-- Formulário de login do Fornecedor -->
      <form id="form-fornecedor" class="formulario ativo" action="../Login/valida_login.php" method="post">
        <h2>Login Fornecedor</h2>

        <!-- Campo de usuário ou e-mail -->
        <input type="text" placeholder="Usuário ou E-mail" name="usuario" required>

        <!-- Campo de senha -->
        <input type="password" placeholder="Senha" name="senha" required>

        <!-- Tipo de login oculto (1 = Fornecedor) -->
        <input type="hidden" name="tipo" value="1">

        <!-- Botão para enviar o login -->
        <button type="submit">Entrar</button>

        <!-- Mensagem de erro, caso exista -->
        <?php
        $erro = $_GET["erro"] ?? "";
        echo "<p style='color:red;'>$erro</p>";
        ?>

        <!-- Links adicionais -->
        <p class="link">
          <a href="#" id="esqueci-fornecedor">Esqueci minha senha</a><br />
          <a href="../fornecedor/fornecedor.php">Primeiro acesso? Faça seu cadastro</a>
        </p>
      </form>

      <!-- Formulário de login do Consumidor -->
      <form id="form-consumidor" class="formulario" action="../Login/valida_login.php" method="post">
        <h2>Login Consumidor</h2>

        <!-- Campo de usuário ou e-mail -->
        <input type="text" placeholder="Usuário ou E-mail" name="usuario" required>

        <!-- Campo de senha -->
        <input type="password" placeholder="Senha" name="senha" required>

        <!-- Tipo de login oculto (2 = Consumidor) -->
        <input type="hidden" name="tipo" value="2">

        <!-- Botão para enviar o login -->
        <button type="submit">Entrar</button>

        <!-- Mensagem de erro, caso exista -->
        <?php
        $erro = $_GET["erro"] ?? "";
        echo "<p style='color:red;'>$erro</p>";
        ?>

        <!-- Links adicionais -->
        <p class="link">
          <a href="#" id="esqueci-consumidor">Esqueci minha senha</a><br />
          <a href="../consumidor/consumidor.php">Primeiro acesso? Faça seu cadastro</a>
        </p>
      </form>

    </div>

    <!-- Biblioteca SweetAlert2 para alertas modernos -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  </div>
</body>
</html>
