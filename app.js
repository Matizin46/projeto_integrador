function realizarLogin() {
  alert("Função de login aqui...");
}

// Validação visual e simulação de cadastro
document.addEventListener('DOMContentLoaded', () => {
  const cadastrarBtn = document.getElementById('cadastrarBtn');

  cadastrarBtn.addEventListener('click', (event) => {
    event.preventDefault();

    const nome = document.getElementById('nome');
    const email = document.getElementById('email');
    const senha = document.getElementById('senha');

    const erroNome = document.getElementById('erro-nome');
    const erroEmail = document.getElementById('erro-email');
    const erroSenha = document.getElementById('erro-senha');

    erroNome.textContent = '';
    erroEmail.textContent = '';
    erroSenha.textContent = '';

    let valido = true;

    if (!nome.value.trim()) {
      erroNome.textContent = 'Por favor, preencha o nome.';
      valido = false;
    }

    if (!email.value.trim()) {
      erroEmail.textContent = 'Por favor, preencha o email.';
      valido = false;
    }

    if (!senha.value.trim()) {
      erroSenha.textContent = 'Por favor, preencha a senha.';
      valido = false;
    } else if (senha.value.length < 6) {
      erroSenha.textContent = 'A senha deve ter no mínimo 6 caracteres.';
      valido = false;
    }

    if (valido) {
      alert("Cadastro realizado com sucesso!");
      window.location.href = "home.html"; // Redireciona para a próxima página
    }
  });
});
