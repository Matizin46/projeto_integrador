function mostrarLogin(tipo) {
    const tabs = document.querySelectorAll('.tab');
    const forms = document.querySelectorAll('.formulario');
  
    // Limpa estado anterior
    tabs.forEach(tab => tab.classList.remove('ativo'));
    forms.forEach(form => form.classList.remove('ativo'));
  
    // Mostra o formulário correto
    if (tipo === 'fornecedor') {
      document.getElementById('form-fornecedor').classList.add('ativo');
      tabs[0].classList.add('ativo');
    } else {
      document.getElementById('form-consumidor').classList.add('ativo');
      tabs[1].classList.add('ativo');
    }
  }


  document.addEventListener("DOMContentLoaded", function () {
    const formFornecedor = document.getElementById("form-fornecedor");
    const formConsumidor = document.getElementById("form-consumidor");
    const formRecuperar = document.getElementById("form-recuperar");

    const btnEsqueciFornecedor = document.getElementById("esqueci-fornecedor");
    const btnEsqueciConsumidor = document.getElementById("esqueci-consumidor");
    const btnVoltar = document.getElementById("voltar-login");

    // Mostrar recuperar senha ao clicar "Esqueci minha senha" no fornecedor
    btnEsqueciFornecedor.addEventListener("click", function (e) {
      e.preventDefault();
      formFornecedor.style.display = "none";
      formConsumidor.style.display = "none";
      formRecuperar.style.display = "block";
    });

    // Mostrar recuperar senha ao clicar "Esqueci minha senha" no consumidor
    btnEsqueciConsumidor.addEventListener("click", function (e) {
      e.preventDefault();
      formFornecedor.style.display = "none";
      formConsumidor.style.display = "none";
      formRecuperar.style.display = "block";
    });

    // Voltar para o login (mostra fornecedor só pra teste)
    btnVoltar.addEventListener("click", function (e) {
      e.preventDefault();
      formFornecedor.style.display = "block";
      formConsumidor.style.display = "none";
      formRecuperar.style.display = "none";
    });
  });

  // Pega os links "Esqueci minha senha"
const esqueciFornecedor = document.getElementById('esqueci-fornecedor');
const esqueciConsumidor = document.getElementById('esqueci-conssumidor'); // corrigido do seu id

// Cria dinamicamente o formulário de recuperação
const painel = document.querySelector('.painel-direito');

const formRecuperar = document.createElement('form');
formRecuperar.id = 'form-recuperar-senha';
formRecuperar.className = 'formulario';
formRecuperar.style.display = 'none';
formRecuperar.action = '../configuracao/enviar-link-recuperacao.html';
formRecuperar.method = 'post';

formRecuperar.innerHTML = `
  <h2>Recuperar Senha</h2>
  <p>Digite seu e-mail para receber o link de redefinição de senha.</p>
  <input type="email" name="email" placeholder="Seu e-mail" required>
  <button type="submit">Enviar</button>
  <p class="link"><a href="#" id="voltar-login">Voltar ao login</a></p>
`;

painel.appendChild(formRecuperar);

// Função para esconder os formulários de login e mostrar o de recuperação
function mostrarRecuperarSenha(e) {
  e.preventDefault();
  document.getElementById('form-fornecedor').style.display = 'none';
  document.getElementById('form-consumidor').style.display = 'none';
  formRecuperar.style.display = 'block';
}

// Adiciona evento nos links
esqueciFornecedor.addEventListener('click', mostrarRecuperarSenha);
esqueciConsumidor.addEventListener('click', mostrarRecuperarSenha);

// Evento para voltar ao login
document.addEventListener('click', function(e) {
  if (e.target && e.target.id === 'voltar-login') {
    e.preventDefault();
    formRecuperar.style.display = 'none';
    document.getElementById('form-fornecedor').style.display = 'block';
    document.getElementById('form-consumidor').style.display = 'block';
  }
});

  