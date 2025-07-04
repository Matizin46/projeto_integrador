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