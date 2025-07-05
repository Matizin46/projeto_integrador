<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8">
  <title>Papelaria Criativa</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="home.css">
</head>
<body>

  <header class="bg-gradient text-white text-center py-4">
    <h1>Papelaria Criativa</h1>
  </header>

  <!-- Carousel -->
  <div id="carouselExample" class="carousel slide" data-bs-ride="carousel">
    <div class="carousel-inner">
      <div class="carousel-item active">
        <img src="banner1.png" class="d-block w-100" alt="Banner 1">
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

  <!-- Planos -->
  <main class="container my-5">
    <h2 class="text-center mb-4">Escolha um Plano</h2>
    <div class="row justify-content-center">
      <?php
      $planos = [
        [
          "nome" => "BÁSICO",
          "preco" => "R$ 10",
          "beneficios" => [
            "10 Chats simultâneos",
            "Sem impulso de loja",
            "Sem banner no perfil",
            "4 fotos por anúncio",
            "Taxa de 20% em pagamentos"
          ]
        ],
        [
          "nome" => "AVANÇADO",
          "preco" => "R$ 30",
          "beneficios" => [
            "30 Chats simultâneos",
            "Impulso de loja 20%",
            "1 banner de perfil",
            "10 fotos por anúncio",
            "Taxa de 15% em pagamentos"
          ]
        ],
        [
          "nome" => "PREMIUM",
          "preco" => "R$ 50",
          "beneficios" => [
            "Chats ilimitados",
            "Impulso máximo",
            "5 banners de perfil",
            "Anúncio 100% personalizado",
            "Taxa de 10% em pagamentos"
          ]
        ]
      ];

      foreach ($planos as $index => $plano) {
        echo '<div class="col-md-4 mb-4">';
        echo '  <div class="plano p-4 text-center">';
        echo "    <h3>{$plano['nome']}<br>{$plano['preco']}</h3>";
        echo '    <ul class="text-start">';
        foreach ($plano['beneficios'] as $beneficio) {
          echo "<li>$beneficio</li>";
        }
        echo '    </ul>';
        echo "    <button class='btn-plano' onclick='adquirirPlano(".($index+1).")'>ADQUIRIR</button>";
        echo '  </div>';
        echo '</div>';
      }
      ?>
    </div>
  </main>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  <script>
    function adquirirPlano(id) {
      alert("Plano " + id + " adquirido!");
    }
  </script>
</body>
</html>
