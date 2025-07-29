<body>
    <?php
    include "../includes/cabecalhoconfig.php"
    ?>

    <div class="section">
        <h2>Configurações</h2>
        <div class="option" onclick="mostrarConteudo('pagamento')">💳 Pagamento <span>Formas de pagamento</span></div>

        <div id="conteudo-dinamico" class="conteudo"></div>
        <script src="../Pagamento/pagamento.js"></script>
    </div>

    <?php
    include "../includes/rodape.php"
    ?>

</body>

</html>

<?php
session_start();

if (!isset($_SESSION['id_usuario'])) {
    header("Location: ../Login/login.php");
    exit;
}

include "../conexao.php";

// ID do consumidor logado
$consumidor_id = $_SESSION['id_usuario'];

// ID do serviço vindo da URL
$servico_id = $_GET['servico_id'] ?? 0;

// Aqui você pode mostrar os detalhes do pagamento antes da confirmação
?>

