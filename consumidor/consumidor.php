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
      <form id="form-consumidor">
        <input type="text" placeholder="Nome" required>
        <input type="text" placeholder="CPF" required>
        <input type="email" placeholder="E-mail" required>
        <input type="password" placeholder="Senha" required>
        <input type="text" placeholder="Endereço" required>
        <input type="tel" placeholder="Telefone" required>
        <button type="button" onclick="window.location.href='../Home/home.php'">Cadastrar</button>
      </form>
    </div>
  </section>
  <div class="voltar" onclick="voltarPagina()">
    ← Voltar
</div>
</body>
</html>
