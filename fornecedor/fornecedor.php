<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Cadastro Fornecedor - Estetique</title>
  <link rel="stylesheet" href="fornecedor.css">
  <script src="fornecedor.js" defer></script>
</head>
<body>
  <section class="cadastro-fornecedor" style="background-image: url('imagens/fundo.png');">
    <div class="form-container">
      <h2>Cadastro do Fornecedor</h2>
      <form id="form-fornecedor" method="post" action="fornecedor_salvar.php">
        <input type="text" placeholder="Nome" required name="nome">
        <input type="text" placeholder="CPF ou CNPJ" required name="cpf">
        <input type="email" placeholder="E-mail" required name="email">
        <input type="password" placeholder="Senha" required name="senha">
        <input type="text" placeholder="Endereço do Estabelecimento" required name="endereco">
        <input type="tel" placeholder="Telefone" required name="telefone">
        <button type="submit">Cadastrar</button>
      </form>
    </div>
  </section>
  <a href="../Login/login.php" class="voltar">← Voltar</a>
  </body>
</html>
