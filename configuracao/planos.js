function adquirirPlano(planoId) {
  const userId = prompt("Digite seu ID de usuário para simular o vínculo com o plano:");

  if (!userId) {
    alert("ID inválido.");
    return;
  }

  fetch(`http://localhost:5000/api/users/${userId}/plano`, {
    method: 'PUT',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify(planoId)
  })
    .then(res => {
      if (res.ok) alert("Plano adquirido com sucesso!");
      else alert("Erro ao adquirir plano.");
    })
    .catch(err => {
      console.error(err);
      alert("Erro de conexão com o servidor.");
    });
}
