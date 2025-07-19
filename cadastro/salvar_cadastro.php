<?php
session_start();
$empresa_id = $_SESSION['id_usuario'];

$nome = $_POST['nome'];
$descricao = $_POST['descricao'];
$categoria = $_POST['categoria'];
$preco = $_POST['preco'];

include "../conexao.php";

// Verifica se o arquivo foi enviado
if (isset($_FILES['imagem']) && $_FILES['imagem']['error'] == 0) {
    $imagem_tmp = $_FILES['imagem']['tmp_name'];
    $imagem_nome = basename($_FILES['imagem']['name']);
    $diretorio = '../assets/';
    $caminho_final = $diretorio . $imagem_nome;

    // Move o arquivo para a pasta assets
    if (move_uploaded_file($imagem_tmp, $caminho_final)) {
        $url_imagem = 'assets/' . $imagem_nome; // Caminho relativo para salvar no banco
    } else {
        echo "Erro ao salvar imagem.";
        exit;
    }
} else {
    echo "Imagem não enviada.";
    exit;
}

// Inserção no banco
$sql = "INSERT INTO servicos(nome, descricao, categoria, preco, empresa_id, imagem_url)
        VALUES('$nome', '$descricao', '$categoria', '$preco', '$empresa_id', '$url_imagem')";

$resultado = mysqli_query($conexao, $sql);

mysqli_close($conexao);

// Redireciona após o cadastro
header("Location: ../homeFornecedor/home.php");
exit;
?>
