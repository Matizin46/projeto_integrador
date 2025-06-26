
  document.getElementById('form-consumidor').addEventListener('submit', function(e) {
    e.preventDefault();
    alert('Consumidor cadastrado com sucesso!');
  });

  function voltarPagina() {
    window.history.back(); // Volta para a página anterior no histórico do navegador
  }