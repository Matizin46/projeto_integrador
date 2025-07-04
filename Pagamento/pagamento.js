window.addEventListener("DOMContentLoaded", () => {
    mostrarConteudo("pagamento"); // Executa ao carregar a página
  });
  
  function mostrarConteudo(tipo) {
    const container = document.getElementById("conteudo-dinamico");
  
    let html = "";
  
    switch (tipo) {
      case 'pagamento':
        html = `
          <h3>Escolha a forma de pagamento</h3>
          <div class="metodo" onclick="mostrarPix()">
            <img src="https://cdn-icons-png.flaticon.com/512/841/841364.png" alt="PIX" />
            <span>PIX</span>
          </div>
          <div class="metodo" onclick="mostrarFormularioCartao('credito')">
            <img src="https://upload.wikimedia.org/wikipedia/commons/0/04/Visa.svg" alt="Visa" />
            <span>Visa • Crédito</span>
          </div>
          <div class="metodo" onclick="mostrarFormularioCartao('debito')">
            <img src="https://upload.wikimedia.org/wikipedia/commons/0/04/Mastercard-logo.png" alt="Mastercard" />
            <span>Mastercard • Débito</span>
          </div>
          <div id="detalhes-pagamento" style="margin-top: 20px;"></div>
        `;
        break;
    }
  
    container.innerHTML = html;
  }
  
  // Exibir QR Code (PIX)
  function mostrarPix() {
    const detalhes = document.getElementById("detalhes-pagamento");
    detalhes.innerHTML = `
      <h4>QR Code para pagamento via PIX</h4>
      <img src="https://api.qrserver.com/v1/create-qr-code/?size=200x200&data=estetique_pagamento_pix" alt="QR Code PIX" />
      <p>Escaneie com seu app bancário para realizar o pagamento.</p>
    `;
  }
  
  // Exibir formulário de cartão
  function mostrarFormularioCartao(tipo) {
    const detalhes = document.getElementById("detalhes-pagamento");
    const tipoTexto = tipo === 'credito' ? 'Crédito' : 'Débito';
    detalhes.innerHTML = `
      <h4>Pagamento com Cartão de ${tipoTexto}</h4>
      <form onsubmit="enviarPagamentoCartao(event)">
        <label>Nome no Cartão</label>
        <input type="text" required>
        
        <label>Número do Cartão</label>
        <input type="text" maxlength="16" pattern="\\d{16}" required>
  
        <label>Validade</label>
        <input type="text" placeholder="MM/AA" required>
  
        <label>CVV</label>
        <input type="text" maxlength="3" pattern="\\d{3}" required>
  
        <button type="submit" class="btn-vermelho">Pagar</button>
      </form>
    `;
  }
  
  // Lógica fictícia de envio
  function enviarPagamentoCartao(e) {
    e.preventDefault();
    Swal.fire('Sucesso!', 'Pagamento com cartão realizado com sucesso.', 'success');
  }
  