<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8">
  <title>Papelaria Criativa</title>
  <link rel="stylesheet" href="home.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
 
  <h1>Papelaria Criativa</h1>
 
  <!-- Banner rotatório full width -->
  <div id="carouselExample" class="carousel slide" data-bs-ride="carousel">
    <div class="carousel-inner">
      <div class="carousel-item active">
        <img src="banner1.png" class="d-block w-100 " alt="Banner 1">
      </div>
      <div class="carousel-item">
        <img src="banner2.png" class="d-block w-100" alt="Banner 2">
      </div>
      <div class="carousel-item">
        <img src="banner3.png" class="d-block w-100" alt="Banner 3">
      </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
      <span class="carousel-control-prev-icon"></span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
      <span class="carousel-control-next-icon"></span>
    </button>
 
  </div>
 
  <div class="section">
    <h2>Escolha um Plano</h2>
    <div class="planos">
      <div class="plano" data-id="1">
        <h3>BÁSICO<br>R$ 10</h3>
        <ul>
          <li>10 Chats simultâneos</li>
          <li>Sem impulso de loja</li>
          <li>Sem banner no perfil</li>
          <li>4 fotos por anúncio</li>
          <li>Taxa de 20% em pagamentos</li>
        </ul>
        <button onclick="adquirirPlano(1)">ADQUIRIR</button>
      </div>
 
      <div class="plano" data-id="2">
        <h3>AVANÇADO<br>R$ 30</h3>
        <ul>
          <li>30 Chats simultâneos</li>
          <li>Impulso de loja 20%</li>
          <li>1 banner de perfil</li>
          <li>10 fotos por anúncio</li>
          <li>Taxa de 15% em pagamentos</li>
        </ul>
        <button onclick="adquirirPlano(2)">ADQUIRIR</button>
      </div>
 
      <div class="plano" data-id="3">
        <h3>PREMIUM<br>R$ 50</h3>
        <ul>
          <li>Chats ilimitados</li>
          <li>Impulso máximo</li>
          <li>5 banners de perfil</li>
          <li>Anúncio 100% personalizado</li>
          <li>Taxa de 10% em pagamentos</li>
        </ul>
        <button onclick="adquirirPlano(3)">ADQUIRIR</button>
      </div>
    </div>
  </div>
 
 
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>