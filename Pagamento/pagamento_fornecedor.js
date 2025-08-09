// ======================================================
// 1) Quando a página carregar (DOM totalmente montado)
// ======================================================
window.addEventListener("DOMContentLoaded", () => {
  // Se NÃO existe um plano ativo para o usuário
  if (!TEM_PLANO_ATIVO) {
    // Exibe um modal usando SweetAlert2 com as informações do plano
    Swal.fire({
      title: `Plano ${PLANO_NOME}`, // Título com o nome do plano
      html: `
        <div style="text-align:left">
          <p style="margin:.25rem 0"><b>Descrição:</b> ${PLANO_DESC}</p>
          <p style="margin:.25rem 0"><b>Valor:</b> R$ ${PLANO_PRECO_LABEL}/mês</p>
          <p class="small" style="color:#666;margin-top:.5rem">
            Ao prosseguir, você poderá pagar no crédito ou débito e concluir o pagamento.
          </p>
        </div>
      `,
      icon: 'info', // Ícone informativo
      showCancelButton: true, // Botão "Cancelar"
      confirmButtonText: 'Pagar agora', // Texto do botão confirmar
      cancelButtonText: 'Depois', // Texto do botão cancelar
      confirmButtonColor: '#67086F' // Cor do botão confirmar
    }).then((res) => {
      // Se o usuário clicar em "Pagar agora"
      if (res.isConfirmed) {
        mostrarConteudo(); // Mostra os métodos de pagamento
        mostrarFormularioCartao('Crédito'); // Já abre o formulário de cartão de crédito
      } else {
        // Caso escolha "Depois", apenas exibe os métodos de pagamento
        mostrarConteudo();
      }
    });
  } else {
    // Se já tem plano ativo, apenas mostra o conteúdo
    mostrarConteudo();
  }
});

// ======================================================
// 2) Função para renderizar as opções de pagamento
// ======================================================
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

// ======================================================
// 3) Função para exibir o formulário de cartão
// ======================================================
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

// ======================================================
// 4) Função para enviar os dados do pagamento
// ======================================================
function enviarPagamentoCartao(e, tipo_pagamento) {
  e.preventDefault(); // Evita recarregar a página no envio do formulário

  // Garantia: esta tela deve ser acessada apenas por fornecedores
  if (typeof tipoUsuario === "undefined" || tipoUsuario !== 1) {
    return Swal.fire("Erro!", "Tipo de usuário inválido nesta tela.", "error");
  }

  const form = e.target;
  const dados = new FormData();

  // Envia o ID do plano (se definido no PHP)
  if (typeof PLANO_ID !== "undefined") {
    dados.append("plano_id", String(PLANO_ID));
  }

  // Envia o valor numérico do plano (se definido no PHP) - útil para logs e validação
  if (typeof PLANO_PRECO_NUM !== "undefined") {
    dados.append("valor", String(PLANO_PRECO_NUM)); // Exemplo: "20.00"
  }

  // Adiciona os campos do formulário
  dados.append("tipo_pagamento", tipo_pagamento);
  dados.append("nome_cartao", form.nome_cartao.value.trim());
  dados.append("numero_cartao", form.numero_cartao.value.trim());
  dados.append("validade_cartao", form.validade_cartao.value);
  dados.append("cvv", form.cvv.value.trim());

  // Envia via fetch para o endpoint do servidor
  fetch(ENDPOINT_FORNECEDOR, {
    method: "POST",
    body: dados
  })
  .then(res => res.text()) // Lê resposta como texto
  .then(resposta => {
    console.log("Resposta do PHP:", resposta);
    if (resposta.trim() === "ok") {
      Swal.fire("Sucesso!", "Pagamento realizado com sucesso.", "success");
      form.reset(); // Limpa formulário
    } else {
      Swal.fire("Erro!", resposta, "error");
    }
  })
  .catch(erro => {
    console.error("Erro no fetch:", erro);
    Swal.fire("Erro!", "Erro de conexão com o servidor.", "error");
  });
}
