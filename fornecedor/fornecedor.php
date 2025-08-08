<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8">
  <!-- Configura a página para ser responsiva, ajustando-se ao tamanho da tela -->
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Cadastro Fornecedor - Estetique</title>

  <!-- Importa o arquivo CSS externo responsável pelo estilo da página -->
  <link rel="stylesheet" href="fornecedor.css">

  <!-- Importa o JavaScript que cuida da validação dos campos, carregando apenas após o HTML -->
  <script src="fornecedor.js" defer></script>

  <!-- Define a fonte padrão usada no sistema -->
  <style>
    body {
      font-family: 'Segoe UI', sans-serif;
    }
  </style>
</head>
<body>
  
  <!-- Seção principal com imagem de fundo para a tela de cadastro -->
  <section class="cadastro-fornecedor" style="background-image: url('imagens/fundo.png');">
    <div class="form-container">
      <!-- Título do formulário -->
      <h2>Cadastro do Fornecedor</h2>

      <!-- Formulário de cadastro do fornecedor -->
      <!-- method="post" envia os dados via POST -->
      <!-- action="fornecedor_salvar.php" define o script que processará o cadastro -->
      <form id="form-fornecedor" method="post" action="fornecedor_salvar.php">
        <!-- Campo de Nome -->
        <input type="text" placeholder="Nome" required name="nome">

        <!-- Campo de CPF ou CNPJ -->
        <input type="text" placeholder="CPF ou CNPJ" required name="cpf">

        <!-- Campo de E-mail -->
        <input type="email" placeholder="E-mail" required name="email">

        <!-- Campo de Senha -->
        <input type="password" placeholder="Senha" required name="senha">

        <!-- Campo de Endereço -->
        <input type="text" placeholder="Endereço do Estabelecimento" required name="endereco">

        <!-- Campo de Telefone -->
        <input type="tel" placeholder="Telefone" required name="telefone">

        <!-- Botão para enviar o formulário -->
        <button type="submit">Cadastrar</button>
      </form>
    </div>
  </section>

  <!-- Botão/Link fixo para voltar à tela de login -->
  <a href="../Login/login.php" class="voltar">← Voltar</a>

</body>
</html>
