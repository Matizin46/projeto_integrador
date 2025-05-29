// JavaScript para carrossel de categorias (rolagem horizontal se tiver overflow)
const categoriaContainer = document.querySelector('.categorias');

// Opcional: Implementar busca com filtro (mock)
document.getElementById('busca').addEventListener('input', function () {
  const termo = this.value.toLowerCase();
  const cards = document.querySelectorAll(".card");

  cards.forEach((card) => {
    const nome = card.querySelector("h3").textContent.toLowerCase();
    const desc = card.querySelector("p:nth-of-type(2)").textContent.toLowerCase();
    card.style.display = nome.includes(termo) || desc.includes(termo) ? "block" : "none";
  });
});
