function realizarLogin() {
    alert("Função de login aqui...");
    // Aqui você pode fazer um fetch real para validar com sua API
  }
  
  function realizarCadastro() {
    const nome = document.getElementById('nome').value;
    const email = document.getElementById('email').value;
    const senha = document.getElementById('senha').value;
  
    const body = {
      nome,
      cpf: '00000000000', // pode ajustar ou permitir campo visível
      email,
      telefone: '',
      endereco: '',
      tipo: 'Cliente',
      planoId: null,
      senhaHash: senha
    };
  
    fetch('http://localhost:5000/api/users/register', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(body)
    })
      .then(res => {
        if (res.ok) alert("Cadastro realizado com sucesso!");
        else alert("Erro ao cadastrar.");
      })
      .catch(err => {
        console.error(err);
        alert("Erro de conexão.");
      });
  }
  