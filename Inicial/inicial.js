document.addEventListener("DOMContentLoaded", () => {
    const slides = document.querySelectorAll('.slide');
    let slideAtual = 0;
  
    const mostrarSlide = (indice) => {
      slides.forEach((slide, i) => {
        slide.classList.toggle('ativo', i === indice);
      });
    };
  
    document.getElementById('btnAnterior').addEventListener('click', () => {
      slideAtual = (slideAtual - 1 + slides.length) % slides.length;
      mostrarSlide(slideAtual);
    });
  
    document.getElementById('btnProximo').addEventListener('click', () => {
      slideAtual = (slideAtual + 1) % slides.length;
      mostrarSlide(slideAtual);
    });
  
    // Inicializa com o primeiro
    mostrarSlide(slideAtual);
  });
  