<style>
  .section {
    padding: 30px;
  }

  .planos {
    display: flex;
    justify-content: flex-end; /* alinha à direita */
  }

  .plano {
    background: #fff;
    border: 2px solid #2c3e50;
    border-radius: 15px;
    padding: 20px;
    width: 300px;
    box-shadow: 0 5px 15px rgba(0,0,0,0.1);
    text-align: center;
    font-family: Arial, sans-serif;
  }

  .plano h3 {
    color: #2c3e50;
    margin-bottom: 15px;
  }

  .plano ul {
    list-style: none;
    padding: 0;
    margin: 15px 0;
  }

  .plano li {
    padding: 8px 0;
    border-bottom: 1px solid #eee;
  }

  .plano button {
    background: linear-gradient(to right, rgb(77, 90, 212));
    color: white;
    border: none;
    padding: 10px 20px;
    border-radius: 8px;
    cursor: pointer;
    transition: 0.3s;
  }

  .plano button:hover {
    opacity: 0.9;
  }

 
</style>

<div class="section">
  <div class="planos">
    <div class="plano" data-id="1">
      <h3>Escolha seu Plano<br><br>Mensalidade: R$ 20</h3>
      <ul>
        <li>Impulso de loja</li>
        <li>Banner no perfil</li>
        <li>Taxa de 10% em pagamentos</li>
      </ul>
      <button onclick="adquirirPlano(1)">ADQUIRIR</button>
    </div>
  </div>
</div>

<script>
  function adquirirPlano(id) {
    // redireciona para a tela de pagamento com o ID do plano
    window.location.href = `../Pagamento/pagamento.php?plano_id=${id}`;
  }
</script>
