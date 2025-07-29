function mostrarConteudo(tipo) {
  const container = document.getElementById("conteudo-dinamico");
  let html = "";

  switch (tipo) {
      case 'perfil':
          // Exibe um formulário para editar nome, telefone, email e endereço
          html = `
            <h3>Editar Perfil</h3>
            <form id="form-perfil" onsubmit="salvarPerfil(event)">
              <label>Nome</label>
              <input type="text" id="nome" placeholder="Seu nome" required />
              
              <label>Telefone</label>
              <input type="tel" id="telefone" placeholder="(99) 99999-9999" required />
              
              <label>Email</label>
              <input type="email" id="email" placeholder="seu@email.com" required />
              
              <label>Endereço</label>
              <input type="text" id="endereco" placeholder="Rua Exemplo, 123" required />
              
              <button type="submit" class="btn-vermelho">Salvar</button>
            </form>
          `;
          break;

      case 'chats':
          // Exibe uma mensagem simples para a seção de conversas anteriores
          html = "<h3>Minhas Conversas</h3><p>Veja aqui suas conversas anteriores.</p>";
          break;

      case 'notificacoes':
          // Exibe a seção de configurações de notificação
          html = "<h3>Notificações</h3><p>Configure suas notificações.</p>";
          break;

      case 'cupons':
          // Exibe o formulário para o usuário adicionar um cupom
          html = `
            <h3>Adicionar Cupom</h3>
            <form id="form-cupom" onsubmit="adicionarCupom(event)">
              <label for="codigo-cupom">Cupom</label>
              <input type="text" id="codigo-cupom" placeholder="Digite seu cupom" required />
              <button type="submit" class="btn-vermelho">Adicionar</button>
            </form>
            <div id="cupom-resultado" style="margin-top: 15px;"></div>
          `;
          break;

      case 'favoritos':
          // Exibe a seção de locais favoritos do usuário
          html = "<h3>Locais Favoritos</h3><p>Gerencie seus locais favoritos.</p>";
          break;

      case 'pagamento':
          // Exibe os métodos de pagamento e um botão para adicionar novo cartão
          html = `
            <div class="tabs">
              <button class="tab active" onclick="alternarAba('app')">PAGUE PELO APP</button>
            </div>

            <div id="conteudo-pagamento">
              <div id="app" class="aba-conteudo active">
                <div class="metodo">
                  <img src="https://cdn-icons-png.flaticon.com/512/841/841364.png" alt="PIX" />
                  <span>PIX</span>
                </div>
                <div class="metodo">
                  <img src="https://upload.wikimedia.org/wikipedia/commons/0/04/Visa.svg" alt="Visa" />
                  <span>Visa • Crédito</span>
                </div>
                <div class="metodo">
                  <img src="https://upload.wikimedia.org/wikipedia/commons/0/04/Mastercard-logo.png" alt="Mastercard" />
                  <span>Mastercard • Crédito</span>
                </div>
                <button class="btn-vermelho">Adicionar novo cartão</button>
              </div>

              <div id="entrega" class="aba-conteudo">
                <p>Você poderá pagar com dinheiro ou maquininha no final do serviço.</p>
              </div>
            </div>
          `;
          break;
  }

  // Insere o conteúdo HTML no container
  container.innerHTML = html;
}


function alternarAba(abaId) {
  // Remove a classe "active" de todas as abas e conteúdos
  document.querySelectorAll('.tab').forEach(tab => tab.classList.remove('active'));
  document.querySelectorAll('.aba-conteudo').forEach(div => div.classList.remove('active'));

  // Ativa a aba e conteúdo correspondente ao ID passado
  document.querySelector(`.tab[onclick*="${abaId}"]`).classList.add('active');
  document.getElementById(abaId).classList.add('active');
}


function salvarPerfil(event) {
  event.preventDefault(); // Evita o recarregamento da página ao enviar o formulário

  // Coleta os valores dos campos do formulário
  const nome = document.getElementById("nome").value;
  const telefone = document.getElementById("telefone").value;
  const email = document.getElementById("email").value;
  const endereco = document.getElementById("endereco").value;

  // Aqui seria onde você salva no backend ou localStorage
  alert(`Perfil salvo!\n\nNome: ${nome}\nTelefone: ${telefone}\nEmail: ${email}\nEndereço: ${endereco}`);
}


function adicionarCupom(event) {
  event.preventDefault(); // Evita o reload do form

  const cupom = document.getElementById("codigo-cupom").value.trim().toUpperCase();
  const resultado = document.getElementById("cupom-resultado");

  // Verifica se o campo está vazio
  if (cupom === "") {
      resultado.innerHTML = `<p style="color: red;">Por favor, digite um código de cupom válido.</p>`;
      return;
  }

  // Simula a aceitação do cupom e exibe o resultado
  resultado.innerHTML = `<p style="color: green;">Cupom <strong>${cupom}</strong> adicionado com sucesso! 🎉</p>`;
  document.getElementById("form-cupom").reset(); // Limpa o campo do formulário
}


function voltarPagina() {
  window.history.back(); // Volta para a página anterior no histórico do navegador
}

function adquirirPlano(planoId) {
  // Mostra a aba de pagamento diretamente
  mostrarConteudo('pagamento');

  // Opcional: você pode exibir o plano escolhido na aba pagamento
  const container = document.getElementById("conteudo-dinamico");
  const planoSelecionado = document.createElement('p');
  planoSelecionado.style.marginTop = "15px";
  planoSelecionado.style.fontWeight = "bold";
  planoSelecionado.style.color = "#ff0000";
  planoSelecionado.innerText = `Plano selecionado: ${planoId === 1 ? 'BÁSICO' : planoId === 2 ? 'AVANÇADO' : 'PREMIUM'}`;

  container.appendChild(planoSelecionado);
}
function alternarAba(abaId) {
  // Remove a classe "active" de todas as abas e conteúdos
  document.querySelectorAll('.tab').forEach(tab => tab.classList.remove('active'));
  document.querySelectorAll('.aba-conteudo').forEach(div => div.classList.remove('active'));

  // Ativa a aba e conteúdo correspondente ao ID passado
  document.querySelector(`.tab[onclick*="${abaId}"]`).classList.add('active');
  document.getElementById(abaId).classList.add('active');
}


function salvarPerfil(event) {
  event.preventDefault(); // Evita o recarregamento da página ao enviar o formulário

  // Coleta os valores dos campos do formulário
  const nome = document.getElementById("nome").value;
  const telefone = document.getElementById("telefone").value;
  const email = document.getElementById("email").value;
  const endereco = document.getElementById("endereco").value;

  // Aqui seria onde você salva no backend ou localStorage
  alert(`Perfil salvo!\n\nNome: ${nome}\nTelefone: ${telefone}\nEmail: ${email}\nEndereço: ${endereco}`);
}


function adicionarCupom(event) {
  event.preventDefault(); // Evita o reload do form

  const cupom = document.getElementById("codigo-cupom").value.trim().toUpperCase();
  const resultado = document.getElementById("cupom-resultado");

  // Verifica se o campo está vazio
  if (cupom === "") {
      resultado.innerHTML = `<p style="color: red;">Por favor, digite um código de cupom válido.</p>`;
      return;
  }

  // Simula a aceitação do cupom e exibe o resultado
  resultado.innerHTML = `<p style="color: green;">Cupom <strong>${cupom}</strong> adicionado com sucesso! 🎉</p>`;
  document.getElementById("form-cupom").reset(); // Limpa o campo do formulário
}


function voltarPagina() {
  window.history.back(); // Volta para a página anterior no histórico do navegador
}

function mostrarConteudo(tipo) {
  const container = document.getElementById("conteudo-dinamico");

  // Se o conteúdo já está visível, esconde ao clicar novamente
  if (container.dataset.tipo === tipo) {
    container.innerHTML = "";
    container.dataset.tipo = "";
    return;
  }

  let html = "";
  container.dataset.tipo = tipo;

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
        <div id="detalhes-pagamento" style="margin-top: 20px margin-bottom: 50px;"></div>
      `;
      break;
    // (outros cases mantidos conforme o seu código anterior)
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

function mostrarConteudo(tipo) {
  const container = document.getElementById("conteudo-dinamico");

  // Se o conteúdo já está visível, esconde ao clicar novamente
  if (container.dataset.tipo === tipo) {
    container.innerHTML = "";
    container.dataset.tipo = "";
    return;
  }

  let html = "";
  container.dataset.tipo = tipo;

  switch (tipo) {
    case 'perfil':
      html = `
        <h3>Editar Perfil</h3>
        <form id="form-perfil" onsubmit="salvarPerfil(event)">
          <label>Nome</label>
          <input type="text" id="nome" placeholder="Seu nome" required />
          <label>Telefone</label>
          <input type="tel" id="telefone" placeholder="(99) 99999-9999" required />
          <label>Email</label>
          <input type="email" id="email" placeholder="seu@email.com" required />
          <label>Endereço</label>
          <input type="text" id="endereco" placeholder="Rua Exemplo, 123" required />
          <button type="submit" class="btn-vermelho">Salvar</button>
        </form>
      `;
      break;

    case 'chats':
      html = "<h3>Minhas Conversas</h3><p>Veja aqui suas conversas anteriores.</p>";
      break;

    case 'notificacoes':
      html = "<h3>Notificações</h3><p>Configure suas notificações.</p>";
      break;

    case 'cupons':
      html = `
        <h3>Adicionar Cupom</h3>
        <form id="form-cupom" onsubmit="adicionarCupom(event)">
          <label for="codigo-cupom">Cupom</label>
          <input type="text" id="codigo-cupom" placeholder="Digite seu cupom" required />
          <button type="submit" class="btn-vermelho">Adicionar</button>
        </form>
        <div id="cupom-resultado" style="margin-top: 15px;"></div>
      `;
      break;

    case 'favoritos':
      html = "<h3>Locais Favoritos</h3><p>Gerencie seus locais favoritos.</p>";
      break;

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

function mostrarPix() {
  const detalhes = document.getElementById("detalhes-pagamento");
  detalhes.innerHTML = `
    <h4>QR Code para pagamento via PIX</h4>
    <img src="https://api.qrserver.com/v1/create-qr-code/?size=200x200&data=estetique_pagamento_pix" alt="QR Code PIX" />
    <p>Escaneie com seu app bancário para realizar o pagamento.</p>
  `;
}

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

function enviarPagamentoCartao(e) {
  e.preventDefault();
  Swal.fire('Sucesso!', 'Pagamento com cartão realizado com sucesso.', 'success');
}

function salvarPerfil(event) {
  event.preventDefault();
  const nome = document.getElementById("nome").value;
  const telefone = document.getElementById("telefone").value;
  const email = document.getElementById("email").value;
  const endereco = document.getElementById("endereco").value;
  alert(`Perfil salvo!\n\nNome: ${nome}\nTelefone: ${telefone}\nEmail: ${email}\nEndereço: ${endereco}`);
}

function adicionarCupom(event) {
  event.preventDefault();
  const cupom = document.getElementById("codigo-cupom").value.trim().toUpperCase();
  const resultado = document.getElementById("cupom-resultado");

  if (cupom === "") {
    resultado.innerHTML = `<p style="color: red;">Por favor, digite um código de cupom válido.</p>`;
    return;
  }

  resultado.innerHTML = `<p style="color: green;">Cupom <strong>${cupom}</strong> adicionado com sucesso! 🎉</p>`;
  document.getElementById("form-cupom").reset();
}

function voltarPagina() {
  window.history.back();
}

// container.innerHTML = "";
// container.removeAttribute("data-tipo"); // já tem isso no seu código
// container.style.display = "none";

container.innerHTML = "";
container.dataset.tipo = "";
container.style.display = "none";
 
// Limpa qualquer espaço branco residual no layout
container.style.margin = "0";
container.style.padding = "0";
container.style.border = "none"