function salvarPerfil(event) {
  event.preventDefault();

  const nome = document.getElementById("nome").value;
  const telefone = document.getElementById("telefone").value;
  const email = document.getElementById("email").value;
  const endereco = document.getElementById("endereco").value;

  fetch('atualizar_perfil.php', {
    method: 'POST',
    headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
    body: new URLSearchParams({
      nome,
      telefone,
      email,
      endereco
    })
  })
  .then(res => res.json())
  .then(data => {
    if (data.status === "sucesso") {
      Swal.fire('Sucesso!', data.mensagem, 'success');
    } else {
      Swal.fire('Aviso', data.mensagem, data.status === "alerta" ? 'info' : 'error');
    }
  })
  .catch(err => {
    Swal.fire('Erro', 'Erro na requisição: ' + err.message, 'error');
  });
}

