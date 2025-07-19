<?php
$usuario1 = $_POST['usuario'];
$senha1 = $_POST['senha'];
$tipo1 = $_POST['tipo']; // 1 = fornecedor, 2 = consumidor

include "../conexao.php";

// Consulta com validação do tipo de usuário
$sql = "SELECT * FROM usuarios WHERE email='$usuario1' AND senha='$senha1' AND id_tipo_usuario='$tipo1'";
$resultado = mysqli_query($conexao, $sql);

if ($resultado->num_rows > 0) {
    $linha = mysqli_fetch_assoc($resultado);
    session_start();
    $_SESSION['id_usuario'] = $linha['id'];
    $id_usuario = $linha['id'];

    // Redirecionamento conforme o tipo
    if ($tipo1 == 1) {
        // Verifica se o fornecedor já cadastrou algum serviço
        $verificaServicos = "SELECT * FROM servicos WHERE empresa_id = '$id_usuario'";
        $resServicos = mysqli_query($conexao, $verificaServicos);

        if ($resServicos->num_rows > 0) {
            // Já tem serviço → vai para home do fornecedor
            header("Location: ../homeFornecedor/home.php");
        } else {
            // Não tem serviço → vai para tela de cadastro
            header("Location: ../cadastro/cadastro.php");
        }
    } elseif ($tipo1 == 2) {
        // Consumidor → vai para home normal
        header("Location: ../Empresas/empresas.php");
    }
} else {
    header("location:../Login/login.php?erro=Usuário ou senha inválidos");
}

mysqli_close($conexao);
?>