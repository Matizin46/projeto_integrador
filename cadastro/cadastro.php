<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <!-- Define o conjunto de caracteres da página para suportar acentuação e símbolos -->
    <meta charset="UTF-8">

    <!-- Título da aba do navegador -->
    <title>Cadastro de Serviço</title>

    <!-- Linka o arquivo CSS externo para estilização da página -->
    <link rel="stylesheet" href="cadastro.css">
</head>
<body>

    <!-- Link para voltar à tela anterior do fornecedor -->
    <a href="../fornecedor/fornecedor.php" class="voltar">← Voltar</a>

    <!-- Container principal que envolve todo o formulário -->
    <div class="container">
        <h1>Cadastro de Serviço</h1>

        <!-- Formulário para cadastro de serviço/produto -->
        <!-- Usa método POST para enviar os dados -->
        <!-- "enctype='multipart/form-data'" é necessário para upload de arquivos (como imagens) -->
        <form id="formServico" method="post" action="salvar_cadastro.php" enctype="multipart/form-data">

            <!-- Campo de texto para o nome do produto ou serviço -->
            <label for="nome">Nome do Produto/Serviço:</label>
            <input type="text" id="nome" required name="nome">

            <!-- Campo de texto para descrição do serviço -->
            <label for="descricao">Descrição:</label>
            <textarea id="descricao" rows="3" required name="descricao"></textarea>

            <!-- Seleção de categoria do serviço -->
            <label for="categoria">Categoria:</label>
            <select id="categoria" required name="categoria">
                <option value="">Selecione</option>
                <option value="Cabelo">Cabelo</option>
                <option value="Maquiagem">Maquiagem</option>
                <option value="Unha">Unha</option>
                <option value="Massagem">Massagem</option>
            </select>

            <!-- Campo numérico para o preço do serviço -->
            <label for="preco">Preço (R$):</label>
            <input type="number" id="preco" min="0" step="0.01" required name="preco">

            <!-- Campo para upload de imagem -->
            <label for="imagem">Imagem:</label>
            <input type="file" id="imagem" name="imagem" accept="image/*" required>

            <!-- Botão para enviar o formulário e cadastrar o serviço -->
            <!-- O atributo "href" aqui não faz efeito; o destino é definido por "action" no <form> -->
            <button type="submit">Cadastrar</button>
        </form>

        <!-- Área para exibir mensagens dinâmicas de sucesso ou erro -->
        <div id="mensagem"></div>
    </div>

</body>
</html>

