<!DOCTYPE html>
<html lang="pt-br">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Estetique - Configurações</title>
  <link rel="stylesheet" href="configuracoes.css" />
</head>

<body>
  <?php
  include "includes/cabecalhoconfig.php";
  ?>

  <div class="section">
    <h2>Configurações</h2>
    <div class="option" onclick="mostrarConteudo('perfil')">👤 Nome <span>Editar perfil</span></div>
    <div class="option" onclick="mostrarConteudo('chats')">💬 Chats <span>Minhas conversas</span></div>
    <div class="option" onclick="mostrarConteudo('notificacoes')">🔔 Notificações <span>Minha central</span></div>
    <div class="option" onclick="mostrarConteudo('cupons')">🎁 Cupons <span>Meus cupons</span></div>
    <div class="option" onclick="mostrarConteudo('pagamento')">💳 Pagamento <span>Formas de pagamento</span></div>

    <div id="conteudo-dinamico" class="conteudo"></div>

    <div class="voltar" onclick="voltarPagina()">
      ← Voltar
    </div>


    <script src="usuario.js"></script>

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

  <div id="conteudo-dinamico" class="section"></div>

  <script src="planos.js"></script>
</body>

</html>


<div id="conteudo-dinamico" class="conteudo"></div>

<div class="voltar" onclick="voltarPagina()">
  ← Voltar
</div>


<script src="planos.js"></script>
</body>

</html>