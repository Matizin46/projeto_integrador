document.getElementById('formServico').addEventListener('submit', function (e) {
    e.preventDefault();

    const nome = document.getElementById('nome').value;
    const descricao = document.getElementById('descricao').value;
    const categoria = document.getElementById('categoria').value;
    const preco = document.getElementById('preco').value;
    const imagem = document.getElementById('imagem').files[0];

    if (!nome || !descricao || !categoria || !preco || !imagem) {
        mostrarMensagem('Preencha todos os campos.', 'red');
        return;
    }

    mostrarMensagem('Serviço cadastrado com sucesso!', 'green');
    document.getElementById('formServico').reset();
});

function mostrarMensagem(msg, cor) {
    const div = document.getElementById('mensagem');
    div.innerText = msg;
    div.style.color = cor;
}
