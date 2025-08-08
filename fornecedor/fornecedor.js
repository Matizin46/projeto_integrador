/* Aguarda todo o conteúdo da página (HTML, CSS, etc.) ser carregado antes de executar o script */
document.addEventListener("DOMContentLoaded", function () {

  /* Seleciona o formulário de cadastro de fornecedor pelo ID */
  const form = document.getElementById("form-fornecedor");

  /* Seleciona o botão de cadastro dentro do formulário */
  const cadastrarBtn = form.querySelector("button");

  /* Define a fonte padrão do sistema (igual ao restante do projeto) para todos os elementos do formulário */
  form.style.fontFamily = "'Segoe UI', sans-serif";

  /* Adiciona evento de clique ao botão de cadastro */
  cadastrarBtn.addEventListener("click", function () {

    /* Seleciona todos os campos de input do formulário */
    const inputs = form.querySelectorAll("input");

    /* Variável para verificar se todos os campos estão preenchidos */
    let camposPreenchidos = true;

    /* Verifica cada campo individualmente */
    inputs.forEach(input => {
      if (!input.value.trim()) {
        /* Caso o campo esteja vazio, define como falso e aplica a classe de erro */
        camposPreenchidos = false;
        input.classList.add("campo-vazio");
      } else {
        /* Se o campo estiver preenchido, remove a classe de erro */
        input.classList.remove("campo-vazio");
      }
    });

    /* Se todos os campos estiverem preenchidos, redireciona para a página de cadastro */
    if (camposPreenchidos) {
      window.location.href = "../cadastro/cadastro.php";
    } else {
      /* Caso contrário, exibe alerta informando que há campos vazios */
      alert("Por favor, preencha todos os campos antes de cadastrar.");
    }
  });
});
