document.getElementById("busca").addEventListener("input", function () {
    const termo = this.value.toLowerCase();
    const cards = document.querySelectorAll(".card");
  
    cards.forEach(card => {
      const nome = card.querySelector("h3").textContent.toLowerCase();
      card.style.display = nome.includes(termo) ? "block" : "none";
    });
  });
  