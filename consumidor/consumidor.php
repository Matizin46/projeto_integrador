<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Cadastro Consumidor - Estetique</title>
  <link rel="stylesheet" href="consumidor.css">
  <script src="consumidor.js" defer></script>
</head>
<body>
  <section class="cadastro-consumidor">
    <div class="form-container">
      <h2>Cadastro do Consumidor</h2>
      <form id="form-consumidor" method="post" action="consumidor_salvar.php">
        <input type="text" placeholder="Nome" required name="nome">
        <input type="text" placeholder="CPF" required name="cpf">
        <input type="email" placeholder="email" required name="email">
        <input type="password" placeholder="senha" required name="senha">
        <input type="text" placeholder="endereco" required name="endereco">
        <input type="tel" placeholder="telefone" required name="telefone">
        <button type="submit">Cadastrar</button>
      </form>
    </div>
  </section>
  <div class="voltar" onclick="voltarPagina()">
    ← Voltar
</div>
</body>
</html>
