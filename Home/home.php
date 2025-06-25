<!DOCTYPE html>
<html lang="pt-br">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Estetique - Início</title>
  <link rel="stylesheet" href="home.css">
  <script src="home.js" defer></script>
</head>

<body>
  <header class="top-bar">
    <h1>Estetique</h1>
    <div class="search-settings">
      <input type="text" id="busca" placeholder="Buscar serviços ou profissionais...">
      <a href="../usuario/usuario.php" id="btn-config" class="config-icon" title="Configurações">⚙️</a>
    </div>
  </header>

  <?php
  include "../includes/categorias.php"
  ?>

  <?php
  include "../includes/promocoes.php"
  ?>

  <?php
  include "../includes/destaques.php"
  ?>