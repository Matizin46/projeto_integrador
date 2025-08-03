<?php
session_start();

$usuario1 = $_POST['usuario'] ?? '';
$senha1 = $_POST['senha'] ?? '';
$tipo1   = $_POST['tipo'] ?? ''; // 1 = fornecedor, 2 = consumidor

include "../conexao.php";

// Consulta segura com prepared statement
$sql = "SELECT * FROM usuarios WHERE email = ? AND id_tipo_usuario = ?";
$stmt = $conexao->prepare($sql);
$stmt->bind_param("si", $usuario1, $tipo1);
$stmt->execute();
$resultado = $stmt->get_result();

if ($resultado->num_rows > 0) {
    $linha = $resultado->fetch_assoc();

    // Comparação direta de senha (sem hash, pois é um site escolar)
    if ($senha1 == $linha['senha']) {
        // ✅ Nomes de sessão padronizados com o restante do sistema
        $_SESSION['usuario_id']   = $linha['id'];               // usado no salvar_config
        $_SESSION['tipo_usuario'] = $linha['id_tipo_usuario'];  // usado para validar tipo

        $id_usuario = $linha['id'];

        // ✅ Redirecionamento por tipo
        if ($tipo1 == 1) {
            // Fornecedor → verifica se já tem serviço
            $verificaServicos = "SELECT * FROM servicos WHERE empresa_id = ?";
            $stmt2 = $conexao->prepare($verificaServicos);
            $stmt2->bind_param("i", $id_usuario);
            $stmt2->execute();
            $resServicos = $stmt2->get_result();

            if ($resServicos->num_rows > 0) {
                header("Location: ../homeFornecedor/home.php");
            } else {
                header("Location: ../cadastro/cadastro.php");
            }
        } elseif ($tipo1 == 2) {
            // Consumidor → vai para a tela de empresas
            header("Location: ../Empresas/empresas.php");
        }
        exit;
    } else {
        header("Location: login.php?erro=Senha incorreta.");
        exit;
    }
} else {
    header("Location: login.php?erro=Usuário não encontrado.");
    exit;
}
?>
