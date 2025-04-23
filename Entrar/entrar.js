function abrirModalLogin() {
    document.getElementById("modalLogin").style.display = "flex";
  }
  
  function fecharModalLogin() {
    document.getElementById("modalLogin").style.display = "none";
  }
  
  function abrirModalEsqueciSenha() {
    document.getElementById("modalEsqueci").style.display = "flex";
  }
  
  function fecharModalEsqueciSenha() {
    document.getElementById("modalEsqueci").style.display = "none";
  }
  
  function realizarLogin() {
    alert(`Bem Vindo De Volta`);
  }
  
  function enviarRecuperacao() {
    const email = document.getElementById("email-recuperacao").value;
    if (email.trim() === "") {
      document.getElementById("mensagem-recuperacao").textContent = "Informe um e-mail válido.";
      return;
    }
  
    document.getElementById("mensagem-recuperacao").textContent = "E-mail enviado com sucesso!";
  }