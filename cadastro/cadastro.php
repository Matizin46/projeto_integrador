<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Cadastro de Serviço</title>
    <link rel="stylesheet" href="cadastro.css">
</head>
<body>

    <a href="../fornecedor/fornecedor.php" class="voltar">← Voltar</a>

    <div class="container">
        <h1>Cadastro de Serviço</h1>
        <form id="formServico">
            <label for="nome">Nome do Produto/Serviço:</label>
            <input type="text" id="nome" required>

            <label for="descricao">Descrição:</label>
            <textarea id="descricao" rows="3" required></textarea>

            <label for="categoria">Categoria:</label>
            <select id="categoria" required>
                <option value="">Selecione</option>
                <option value="Cabelo">Cabelo</option>
                <option value="Maquiagem">Maquiagem</option>
                <option value="Unha">Unha</option>
                <option value="Massagem">Massagem</option>
            </select>

            <label for="preco">Preço (R$):</label>
            <input type="number" id="preco" min="0" step="0.01" required>

            <label for="imagem">Imagem:</label>
            <input type="file" id="imagem" accept="image/*" required>

            <button type="submit" href="../fornecedor/configFornecedor.php">Cadastrar</button>
        </form>
        <div id="mensagem"></div>
    </div>

</body>
</html>
