document.addEventListener("DOMContentLoaded", function () {
  const form = document.getElementById("form-fornecedor");
  const cadastrarBtn = form.querySelector("button");

  cadastrarBtn.addEventListener("click", function () {
    const inputs = form.querySelectorAll("input");
    let camposPreenchidos = true;

    inputs.forEach(input => {
      if (!input.value.trim()) {
        camposPreenchidos = false;
        input.classList.add("campo-vazio");
      } else {
        input.classList.remove("campo-vazio");
      }
    });

    if (camposPreenchidos) {
      window.location.href = "../cadastro/cadastro.php";
    } else {
      alert("Por favor, preencha todos os campos antes de cadastrar.");
    }
  });
});
