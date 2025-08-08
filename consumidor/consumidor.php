<!DOCTYPE html>
<!-- Declara que o documento segue o padrão HTML5 -->
<html lang="pt-br"> <!-- Define o idioma como português do Brasil -->

<!-- Importa a fonte Poppins com pesos 400, 500 e 600 do Google Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">

<head>
  <meta charset="UTF-8"> <!-- Define a codificação como UTF-8 (suporte a acentos e caracteres especiais) -->
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <!-- Faz com que a página se adapte ao tamanho da tela (responsividade) -->

  <title>Cadastro Consumidor - Estetique</title> <!-- Título exibido na aba do navegador -->

  <!-- CSS externo da página -->
  <link rel="stylesheet" href="consumidor.css">

  <!-- JavaScript externo, carregado após o HTML (defer evita bloqueio de carregamento) -->
  <script src="consumidor.js" defer></script>

  <!-- Fonte padrão aplicada globalmente -->
  <style>
    body {
      font-family: 'Poppins', sans-serif; /* Define Poppins como fonte padrão */
      font-size: 16px; /* Tamanho base */
      line-height: 1.6; /* Espaçamento entre linhas para melhor leitura */
      margin: 0;
      padding: 0;
    }
  </style>
</head>

<body>
  <!-- Seção principal do formulário de cadastro -->
  <section class="cadastro-consumidor">
    <div class="form-container">
      <h2>Cadastro do Consumidor</h2> <!-- Título do formulário -->

      <!-- Formulário de cadastro
           id="form-consumidor" -> permite manipulação via JavaScript
           method="post" -> envia dados de forma segura
           action="consumidor_salvar.php" -> arquivo PHP que receberá os dados -->
      <form id="form-consumidor" method="post" action="consumidor_salvar.php">
        
        <!-- Campo de entrada para o nome -->
        <input type="text" placeholder="Nome" required name="nome">
        
        <!-- Campo de entrada para CPF -->
        <input type="text" placeholder="CPF" required name="cpf">
        
        <!-- Campo de entrada para e-mail -->
        <input type="email" placeholder="Email" required name="email">
        
        <!-- Campo de entrada para senha -->
        <input type="password" placeholder="Senha" required name="senha">
        
        <!-- Campo de entrada para endereço -->
        <input type="text" placeholder="Endereço" required name="endereco">
        
        <!-- Campo de entrada para telefone -->
        <input type="tel" placeholder="Telefone" required name="telefone">
        
        <!-- Botão para enviar o formulário -->
        <button type="submit">Cadastrar</button>
      </form>
    </div>
  </section>

  <!-- Botão "Voltar" fixo no canto superior esquerdo -->
  <div class="voltar" onclick="voltarPagina()">
    ← Voltar
  </div>
</body>
</html>
