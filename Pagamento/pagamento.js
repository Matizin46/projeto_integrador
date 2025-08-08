// =====================
// Pagamentos - JS (consumidor/fornecedor)
// =====================

window.addEventListener("DOMContentLoaded", () => {
  // Se sua página não tem #conteudo-dinamico (como este layout), só renderizamos o form no clique
  // Deixei esta chamada caso use em outra página:
  if (document.getElementById("conteudo-dinamico")) {
    mostrarConteudo("pagamento");
  }
});

function mostrarConteudo(tipo) {
  const container = document.getElementById("conteudo-dinamico");
  if (!container) return;

  const html = `
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
  if (!detalhes) return;

  detalhes.innerHTML = `
    <h4>Pagamento com Cartão de ${tipo}</h4>
    <form onsubmit="return enviarPagamentoCartao(event, '${tipo}')">
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

// ---------- helpers ----------
function getQueryInt(key) {
  try {
    const v = new URLSearchParams(window.location.search).get(key);
    const n = parseInt(v || "0", 10);
    return Number.isNaN(n) ? 0 : n;
  } catch { return 0; }
}
function getServicoId() {
  const fromUrl = getQueryInt("servico_id");
  if (fromUrl > 0) return fromUrl;
  if (typeof SERVICO_ID_PHP !== "undefined" && +SERVICO_ID_PHP > 0) return +SERVICO_ID_PHP;
  return 0;
}
function getPlanoId() {
  const fromUrl = getQueryInt("plano_id");
  if (fromUrl > 0) return fromUrl;
  if (typeof PLANO_ID !== "undefined" && +PLANO_ID > 0) return +PLANO_ID;
  return 1;
}

// ---------- envio ----------
function enviarPagamentoCartao(e, tipo_pagamento) {
  e.preventDefault();

  const form = e.target;
  const dados = new FormData();
  let url = "";

  if (typeof tipoUsuario === "undefined") {
    Swal.fire("Erro!", "Tipo de usuário não definido.", "error");
    return false;
  }

  if (tipoUsuario === 2) {
    // CONSUMIDOR
    const servico_id = getServicoId();
    if (!servico_id) {
      Swal.fire("Erro!", "Serviço não informado.", "error");
      return false;
    }
    dados.append("servico_id", String(servico_id));
    url = "../Pagamento/confirmar_pagamento_consumidor.php";
  } else if (tipoUsuario === 1) {
    // FORNECEDOR (se usar nesta mesma base)
    const plano_id = getPlanoId();
    if (!plano_id) {
      Swal.fire("Erro!", "Plano não informado.", "error");
      return false;
    }
    dados.append("plano_id", String(plano_id));
    url = "../Pagamento/confirmar_pagamento_fornecedor.php";
  } else {
    Swal.fire("Erro!", "Tipo de usuário inválido.", "error");
    return false;
  }

  dados.append("tipo_pagamento", tipo_pagamento);
  dados.append("nome_cartao", form.nome_cartao.value.trim());
  dados.append("numero_cartao", form.numero_cartao.value.trim());
  dados.append("validade_cartao", form.validade_cartao.value);
  dados.append("cvv", form.cvv.value.trim());

  fetch(url, { method: "POST", body: dados })
    .then(res => res.text())
    .then(resposta => {
      console.log("Resposta do PHP:", resposta);
      if (resposta.trim() === "ok") {
        const msg = (tipoUsuario === 2)
          ? "Pagamento confirmado e agendamento registrado."
          : "Pagamento realizado com sucesso.";
        Swal.fire("Sucesso!", msg, "success");
        form.reset();
      } else {
        Swal.fire("Erro!", resposta, "error");
      }
    })
    .catch(erro => {
      console.error("Erro no fetch:", erro);
      Swal.fire("Erro!", "Erro de conexão com o servidor.", "error");
    });

  return false; // não navega para a página do PHP
}
