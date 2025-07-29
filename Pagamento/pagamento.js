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
        <div class="metodo" onclick="mostrarFormularioCartao('Crédito')">
          <img src="https://upload.wikimedia.org/wikipedia/commons/0/04/Visa.svg" alt="Visa" />
          <span>Visa • Crédito</span>
        </div>
        <div class="metodo" onclick="mostrarFormularioCartao('Débito')">
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
  detalhes.innerHTML = `
    <h4>Pagamento com Cartão de ${tipo}</h4>
    <form onsubmit="enviarPagamentoCartao(event, '${tipo}')">
      <label>Nome no Cartão</label>
      <input type="text" name="nome_cartao" required>

      <label>Número do Cartão</label>
      <input type="text" name="numero_cartao" maxlength="16" pattern="\\d{16}" required>

      <label>Validade</label>
      <input type="month" name="validade_cartao" required>

      <label>CVV</label>
      <input type="text" name="cvv" maxlength="4" pattern="\\d{3,4}" required>

      <button type="submit" class="btn-vermelho">Pagar</button>
    </form>
  `;
}

// Enviar dados reais para o PHP (salvar no banco)
function enviarPagamentoCartao(e, tipo_pagamento) {
  e.preventDefault();

  const form = e.target;
  const dados = new FormData();
  dados.append("tipo_pagamento", tipo_pagamento);
  dados.append("nome_cartao", form.nome_cartao.value);
  dados.append("numero_cartao", form.numero_cartao.value);
  dados.append("validade_cartao", form.validade_cartao.value);
  dados.append("cvv", form.cvv.value);

  fetch("../Pagamento/confirmar_pagamento.php", {
    method: "POST",
    body: dados
  })
  .then(res => res.text())
  .then(resposta => {
    if (resposta.trim() === "ok") {
      Swal.fire("Sucesso!", "Pagamento salvo com sucesso.", "success");
      form.reset();
    } else {
      Swal.fire("Erro!", "Não foi possível salvar o pagamento.", "error");
    }
  })
  .catch(() => {
    Swal.fire("Erro!", "Erro de conexão com o servidor.", "error");
  });
}

  