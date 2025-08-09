<style>
  /* === Cor de fundo geral e fonte padrão do sistema === */
  body {
    background-color: #fdeefc; /* tom rosa bem claro */
    font-family: 'Poppins', sans-serif; /* mesma letra usada no restante do site */
  }

  /* === Espaçamento geral da seção === */
  .section {
    padding: 30px;
  }

  /* === Container dos planos, alinhado à direita === */
  .planos {
    display: flex;
    justify-content: flex-end; /* alinha os planos no lado direito da tela */
  }

  /* === Card de um plano específico === */
  .plano {
    background: #fff; /* fundo branco para destaque */
    border: 2px solid #2c3e50; /* borda cinza-escura */
    border-radius: 15px; /* cantos arredondados */
    padding: 20px; /* espaçamento interno */
    width: 300px; /* largura fixa do card */
    box-shadow: 0 5px 15px rgba(0,0,0,0.1); /* sombra suave */
    text-align: center; /* centraliza o conteúdo */
  }

  /* === Título do plano === */
  .plano h3 {
    color: #2c3e50; /* cor do texto */
    margin-bottom: 15px; /* espaçamento inferior */
  }

  /* === Lista de benefícios do plano === */
  .plano ul {
    list-style: none; /* remove marcadores padrão */
    padding: 0;
    margin: 15px 0;
  }

  /* === Cada item da lista de benefícios === */
  .plano li {
    padding: 8px 0; /* espaçamento vertical */
    border-bottom: 1px solid #eee; /* linha separadora */
  }

  /* === Botão para adquirir o plano === */
  .plano button {
    background: linear-gradient(to right, rgb(77, 90, 212)); /* gradiente azul */
    color: white; /* texto branco */
    border: none; /* remove borda */
    padding: 10px 20px; /* espaçamento interno */
    border-radius: 8px; /* cantos arredondados */
    cursor: pointer; /* cursor de clique */
    transition: 0.3s; /* animação suave */
    font-weight: bold; /* texto em negrito */
  }

  /* === Efeito ao passar o mouse no botão === */
  .plano button:hover {
    opacity: 0.9; /* leve transparência no hover */
  }
</style>

<!-- Área geral da seção -->
<div class="section">
  <!-- Container para organizar os cards de planos -->
  <div class="planos">
    <!-- Card do plano específico -->
    <div class="plano" data-id="1">
      <h3>Escolha seu Plano<br><br>Mensalidade: R$ 20</h3>
      <ul>
        <li>Impulso de loja</li>
        <li>Banner no perfil</li>
        <li>Taxa de 10% em pagamentos</li>
      </ul>
      <!-- Botão chama a função adquirirPlano passando o ID -->
      <button onclick="adquirirPlano(1)">ADQUIRIR</button>
    </div>
  </div>
</div>

<script>
  /**
   * Função que redireciona para a tela de pagamento
   * enviando o ID do plano escolhido na URL
   */
  function adquirirPlano(id) {
    window.location.href = `../Pagamento/pagamento.php?plano_id=${id}`;
  }
</script>
