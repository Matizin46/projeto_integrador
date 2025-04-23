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
  