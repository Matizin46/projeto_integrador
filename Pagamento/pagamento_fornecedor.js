// Render inicial
window.addEventListener("DOMContentLoaded", () => {
  // Se não tem plano ativo, já mostra o modal explicativo
  if (!TEM_PLANO_ATIVO) {
    Swal.fire({
      title: `Plano ${PLANO_NOME}`,
      html: `
        <div style="text-align:left">
          <p style="margin:.25rem 0"><b>Descrição:</b> ${PLANO_DESC}</p>
          <p style="margin:.25rem 0"><b>Valor:</b> R$ ${PLANO_PRECO_LABEL}/mês</p>
          <p class="small" style="color:#666;margin-top:.5rem">
            Ao prosseguir, você poderá pagar no crédito ou débito e concluir o pagamento.
          </p>
        </div>
      `,
      icon: 'info',
      showCancelButton: true,
      confirmButtonText: 'Pagar agora',
      cancelButtonText: 'Depois',
      confirmButtonColor: '#67086F'
    }).then((res) => {
      if (res.isConfirmed) {
        mostrarConteudo();
        mostrarFormularioCartao('Crédito');
      } else {
        mostrarConteudo();
      }
    });
  } else {
    mostrarConteudo();
  }
});

function mostrarConteudo() {
  const container = document.getElementById("conteudo-dinamico");
  container.innerHTML = `
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
}

function mostrarFormularioCartao(tipo) {
  const detalhes = document.getElementById("detalhes-pagamento");
  detalhes.innerHTML = `
    <h4>Pagamento com Cartão de ${tipo}</h4>
    <p style="margin:.25rem 0"><b>Plano:</b> ${PLANO_NOME}</p>
    <p style="margin:.25rem 0"><b>Valor:</b> R$ ${PLANO_PRECO_LABEL}</p>

    <form onsubmit="enviarPagamentoCartao(event, '${tipo}')">
      <label>Nome no Cartão</label>
      <input type="text" name="nome_cartao" required autocomplete="cc-name">
      
      <label>Número do Cartão</label>
      <input type="text" name="numero_cartao" maxlength="16" pattern="\\d{16}" required inputmode="numeric" autocomplete="cc-number">
      
      <label>Validade</label>
      <input type="month" name="validade_cartao" required autocomplete="cc-exp">
      
      <label>CVV</label>
      <input type="text" name="cvv" maxlength="4" pattern="\\d{3,4}" required inputmode="numeric" autocomplete="cc-csc">
      
      <button type="submit" class="btn-vermelho">Pagar</button>
    </form>
  `;
}

function enviarPagamentoCartao(e, tipo_pagamento) {
  e.preventDefault();

  // Garantia: esta tela é SÓ fornecedor (tipoUsuario = 1)
  if (typeof tipoUsuario === "undefined" || tipoUsuario !== 1) {
    return Swal.fire("Erro!", "Tipo de usuário inválido nesta tela.", "error");
  }

  const form = e.target;
  const dados = new FormData();

  // Sem depender de parâmetros na URL:
  // Mandamos o PLANO_ID pelo POST (ou o PHP pode usar fallback = 1)
  if (typeof PLANO_ID !== "undefined") {
    dados.append("plano_id", String(PLANO_ID));
  }
  // Valor numérico vem do PHP; se o seu confirmar_pagamento_fornecedor não usar,
  // pode ignorar. Mas é útil para logs/validação.
  if (typeof PLANO_PRECO_NUM !== "undefined") {
    dados.append("valor", String(PLANO_PRECO_NUM)); // "20.00"
  }

  dados.append("tipo_pagamento", tipo_pagamento);
  dados.append("nome_cartao", form.nome_cartao.value.trim());
  dados.append("numero_cartao", form.numero_cartao.value.trim());
  dados.append("validade_cartao", form.validade_cartao.value);
  dados.append("cvv", form.cvv.value.trim());

  fetch(ENDPOINT_FORNECEDOR, {
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
