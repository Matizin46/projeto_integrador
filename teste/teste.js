document.addEventListener("DOMContentLoaded", function () {
  const campoBusca = document.querySelector('.campo-busca');
  const botaoBusca = document.querySelector('.btn-buscar');
  const botoesCategorias = document.querySelectorAll('.categorias button');
  const cards = document.querySelectorAll('.card');

  botaoBusca.addEventListener('click', () => {
    const termo = campoBusca.value.toLowerCase();
    cards.forEach(card => {
      const nome = card.querySelector('h3').textContent.toLowerCase();
      const servico = card.querySelector('.servico').textContent.toLowerCase();
      if (nome.includes(termo) || servico.includes(termo)) {
        card.style.display = "block";
      } else {
        card.style.display = "none";
      }
    });
  });

  botoesCategorias.forEach(botao => {
    botao.addEventListener('click', () => {
      const filtro = botao.textContent.toLowerCase();
      cards.forEach(card => {
        const servico = card.querySelector('.servico').textContent.toLowerCase();
        if (servico.includes(filtro)) {
          card.style.display = "block";
        } else {
          card.style.display = "none";
        }
      });
    });
  });
});
