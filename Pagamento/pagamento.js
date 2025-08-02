window.addEventListener("DOMContentLoaded", () => {
  mostrarConteudo("pagamento");
});

function mostrarConteudo(tipo) {
  const container = document.getElementById("conteudo-dinamico");
  let html = "";

  html = `
    <h3>Escolha a forma de pagamento</h3>
    <div class="metodo" onclick="mostrarFormularioCartao('Crédito')">
      <img src="https://upload.wikimedia.org/wikipedia/commons/0/04/Visa.svg" alt="Visa" />
      <span>Cartão de Crédito</span>
    </div>
    <div class="metodo" onclick="mostrarFormularioCartao('Débito')">
      <img src="https://upload.wikimedia.org/wikipedia/commons/0/04/Mastercard-logo.png" alt="Mastercard" />
      <span>Cartão de Débito</span>
    </div>
    <div id="detalhes-pagamento" style="margin-top: 20px;"></div>
  `;

  container.innerHTML = html;
}

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

function enviarPagamentoCartao(e, tipo_pagamento) {
  e.preventDefault();

  const urlParams = new URLSearchParams(window.location.search);
  const form = e.target;
  const dados = new FormData();
  let url = "";

  if (tipoUsuario === 1) {
    const plano_id = urlParams.get("plano_id");
    if (!plano_id) return Swal.fire("Erro!", "Plano não informado na URL.", "error");
    dados.append("plano_id", plano_id);
    url = "../Pagamento/confirmar_pagamento_fornecedor.php";
  } else if (tipoUsuario === 2) {
    const servico_id = urlParams.get("servico_id");
    if (!servico_id) return Swal.fire("Erro!", "Serviço não informado na URL.", "error");
    dados.append("servico_id", servico_id);
    url = "../Pagamento/confirmar_pagamento_consumidor.php";
  } else {
    return Swal.fire("Erro!", "Tipo de usuário inválido.", "error");
  }

  dados.append("tipo_pagamento", tipo_pagamento);
  dados.append("nome_cartao", form.nome_cartao.value);
  dados.append("numero_cartao", form.numero_cartao.value);
  dados.append("validade_cartao", form.validade_cartao.value);
  dados.append("cvv", form.cvv.value);

  fetch(url, {
    method: "POST",
    body: dados
  })
    .then(res => res.text())
    .then(resposta => {
      console.log("Resposta do PHP:", resposta);
      if (resposta.trim() === "ok") {
        Swal.fire("Sucesso!", "Pagamento realizado com sucesso.", "success");
        form.reset();
      } else {
        Swal.fire("Erro!", resposta, "error");
      }
    })
    .catch(erro => {
      console.error("Erro no fetch:", erro);
      Swal.fire("Erro!", "Erro de conexão com o servidor.", "error");
    });
}
