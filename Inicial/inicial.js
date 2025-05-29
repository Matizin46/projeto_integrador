const banners = ["banner1.png", "banner2.png", "banner3.png"];
let indexAtual = 0;

function mudarSlide(direcao) {
  indexAtual += direcao;
  if (indexAtual < 0) indexAtual = banners.length - 1;
  if (indexAtual >= banners.length) indexAtual = 0;
  document.getElementById("banner").src = banners[indexAtual];
}
