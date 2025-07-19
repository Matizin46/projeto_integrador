<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Cadastro de Serviço</title>
    <link rel="stylesheet" href="cadastro.css">
</head>
<body>

    <a href="../fornecedor/fornecedor.php" class="voltar">← Voltar</a>

    <div class="container">
        <h1>Cadastro de Serviço</h1>
            <form id="formServico" method="post" action="salvar_cadastro.php" enctype="multipart/form-data">
            <label for="nome">Nome do Produto/Serviço:</label>
            <input type="text" id="nome" required name="nome">

            <label for="descricao">Descrição:</label>
            <textarea id="descricao" rows="3" required name='descricao'></textarea>

            <label for="categoria">Categoria:</label>
            <select id="categoria" required  name="categoria">
                <option value="">Selecione</option>
                <option value="Cabelo">Cabelo</option>
                <option value="Maquiagem">Maquiagem</option>
                <option value="Unha">Unha</option>
                <option value="Massagem">Massagem</option>
            </select>

            <label for="preco">Preço (R$):</label>
            <input type="number" id="preco" min="0" step="0.01" required name='preco'>

            <label for="imagem">Imagem:</label>
            <input type="file" id="imagem" name="imagem" accept="image/*" required>

            <button type="submit" href="../fornecedor/configFornecedor.php">Cadastrar</button>
        </form>
        <div id="mensagem"></div>
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
