<?php include "../includes/cabecalhoconfig.php";?>

<?php
session_start();
include "../conexao.php";

if (!isset($_SESSION['usuario_id'])) {
    header("Location: ../Login/login.php");
    exit;
}

$consumidor_id = $_SESSION['usuario_id'];
$servico_id = $_GET['servico_id'] ?? 0;
?>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Pagamento</title>
    <link rel="stylesheet" href="../Pagamento/pagamento.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>



<div class="container">
    <h2>Pagamento</h2>
    <div class="formas">
        <div class="metodo" onclick="mostrarFormularioCartao('Crédito')">
            <img src="https://upload.wikimedia.org/wikipedia/commons/0/04/Visa.svg" alt="Visa">
            <span>Cartão de Crédito</span>
        </div>

        <div class="metodo" onclick="mostrarFormularioCartao('Débito')">
            <img src="https://upload.wikimedia.org/wikipedia/commons/0/04/Mastercard-logo.png" alt="Mastercard">
            <span>Cartão de Débito</span>
        </div>
    </div>

    <div id="detalhes-pagamento"></div>
</div>

<div class="voltar" onclick="window.history.back();">← Voltar</div>

<script>
    const tipoUsuario = 2; // consumidor fixo aqui, ou pegue da sessão se necessário
</script>
<script src="../Pagamento/pagamento.js"></script>

<?php include "../includes/rodape.php"; ?>

</body>
</html>
