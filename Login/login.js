function mostrarLogin(tipo) {
  const tabs = document.querySelectorAll('.tab');
  const forms = document.querySelectorAll('.formulario');
  const painel = document.querySelector('.painel-direito');

  // Limpa estado anterior
  tabs.forEach(tab => tab.classList.remove('ativo'));
  forms.forEach(form => form.classList.remove('ativo'));

  // Mostra o formulário correto e atualiza o título
  if (tipo === 'fornecedor') {
    document.getElementById('form-fornecedor').classList.add('ativo');
    tabs[0].classList.add('ativo');
    titulo.textContent = 'ESTETIQUE - Fornecedor';
  } else {
    document.getElementById('form-consumidor').classList.add('ativo');
    tabs[1].classList.add('ativo');
    titulo.textContent = 'ESTETIQUE - Consumidor';
  }

  // Remove qualquer formulário de recuperação se existir
  const existente = document.getElementById('form-recuperar-senha');
  if (existente) painel.removeChild(existente);
}

// Lógica de recuperação de senha com popup
document.getElementById('esqueci-fornecedor').addEventListener('click', function (e) {
  e.preventDefault();
  solicitarEmail();
});

document.getElementById('esqueci-conssumidor').addEventListener('click', function (e) {
  e.preventDefault();
  solicitarEmail();
});

function solicitarEmail() {
  Swal.fire({
    title: 'Recuperar Senha',
    input: 'email',
    inputLabel: 'Digite seu e-mail',
    inputPlaceholder: 'email@exemplo.com',
    showCancelButton: true,
    confirmButtonText: 'Enviar',
    cancelButtonText: 'Cancelar',
    inputValidator: (value) => {
      if (!value) {
        return 'Você precisa inserir um e-mail.';
      } else if (!validarEmail(value)) {
        return 'E-mail inválido!';
      }
    }
  }).then((result) => {
    if (result.isConfirmed) {
      Swal.fire(
        'Sucesso!',
        `Um link de redefinição foi enviado para: <strong>${result.value}</strong>`,
        'success'
      );
    }
  });
}

function validarEmail(email) {
  const regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  return regex.test(email);
}
