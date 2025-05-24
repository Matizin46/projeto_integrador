document.getElementById('form-fornecedor').addEventListener('submit', function(e) {
    e.preventDefault();
    alert('Fornecedor cadastrado com sucesso!');
  });

  function voltarPagina() {
    window.history.back(); // Volta para a página anterior no histórico do navegador
  }