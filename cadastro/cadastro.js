// Adiciona um ouvinte de evento ("submit") ao formulário com id="formServico"
document.getElementById('formServico').addEventListener('submit', function (e) {
    // Previne o comportamento padrão do formulário (evita recarregar a página)
    e.preventDefault();

    // Pega o valor digitado no campo "Nome"
    const nome = document.getElementById('nome').value;
    // Pega o valor digitado no campo "Descrição"
    const descricao = document.getElementById('descricao').value;
    // Pega o valor selecionado no campo "Categoria"
    const categoria = document.getElementById('categoria').value;
    // Pega o valor digitado no campo "Preço"
    const preco = document.getElementById('preco').value;
    // Pega o primeiro arquivo enviado no campo "Imagem"
    const imagem = document.getElementById('imagem').files[0];

    // Validação: se algum campo estiver vazio/não selecionado, exibe mensagem de erro
    if (!nome || !descricao || !categoria || !preco || !imagem) {
        mostrarMensagem('Preencha todos os campos.', 'red'); // Mensagem em vermelho
        return; // Interrompe a execução (não prossegue com cadastro)
    }

    // Se todos os campos estiverem preenchidos, mostra mensagem de sucesso
    mostrarMensagem('Serviço cadastrado com sucesso!', 'green'); // Mensagem em verde

    // Limpa todos os campos do formulário
    document.getElementById('formServico').reset();
});

// Função para exibir mensagens na tela
function mostrarMensagem(msg, cor) {
    // Pega a div onde a mensagem será exibida (id="mensagem")
    const div = document.getElementById('mensagem');
    // Define o texto da mensagem
    div.innerText = msg;
    // Define a cor do texto (recebida como parâmetro)
    div.style.color = cor;
}

