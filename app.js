// Função de login (ainda apenas de exemplo, exibe um alerta)
function realizarLogin() {
  alert("Função de login aqui...");
}

// Aguarda o carregamento completo do DOM antes de executar
document.addEventListener('DOMContentLoaded', () => {

  // Pega o botão de cadastro pelo ID
  const cadastrarBtn = document.getElementById('cadastrarBtn');

  // Adiciona evento de clique no botão de cadastro
  cadastrarBtn.addEventListener('click', (event) => {
    event.preventDefault(); // Evita que o formulário seja enviado e a página recarregue

    // Obtém os campos do formulário
    const nome = document.getElementById('nome');
    const email = document.getElementById('email');
    const senha = document.getElementById('senha');

    // Obtém os elementos de mensagens de erro
    const erroNome = document.getElementById('erro-nome');
    const erroEmail = document.getElementById('erro-email');
    const erroSenha = document.getElementById('erro-senha');

    // Limpa mensagens de erro antes de validar novamente
    erroNome.textContent = '';
    erroEmail.textContent = '';
    erroSenha.textContent = '';

    // Variável que indica se todos os campos estão válidos
    let valido = true;

    // Valida o campo nome
    if (!nome.value.trim()) { // Se estiver vazio ou só com espaços
      erroNome.textContent = 'Por favor, preencha o nome.';
      valido = false;
    }

    // Valida o campo email
    if (!email.value.trim()) {
      erroEmail.textContent = 'Por favor, preencha o email.';
      valido = false;
    }

    // Valida o campo senha
    if (!senha.value.trim()) {
      erroSenha.textContent = 'Por favor, preencha a senha.';
      valido = false;
    } else if (senha.value.length < 6) { // Checa se tem pelo menos 6 caracteres
      erroSenha.textContent = 'A senha deve ter no mínimo 6 caracteres.';
      valido = false;
    }

    // Se todas as validações passaram
    if (valido) {
      alert("Cadastro realizado com sucesso!");
      window.location.href = "home.html"; // Redireciona para a próxima página
    }
  });
});
