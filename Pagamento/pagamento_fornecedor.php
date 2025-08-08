<?php
include "../includes/cabecalhoconfig.php";
session_start();
include "../conexao.php";

if (!isset($_SESSION['usuario_id'])) {
    header("Location: ../Login/login.php");
    exit;
}

$fornecedor_id = (int)$_SESSION['usuario_id'];

/* Carrega plano id=1 (fallback) */
$plano = ['id' => 1, 'nome' => 'BÁSICO', 'preco' => 20.00, 'descricao' => 'Assinatura mensal do fornecedor'];

if ($stmtPlano = $conexao->prepare("SELECT id, nome, preco, descricao FROM planos WHERE id = 1 LIMIT 1")) {
    $stmtPlano->execute();
    $resPlano = $stmtPlano->get_result();
    if ($resPlano && $resPlano->num_rows > 0) {
        $plano = $resPlano->fetch_assoc();
        $plano['preco'] = (float)$plano['preco'];
    }
}

$temPlanoAtivo = false;
if ($stmtPago = $conexao->prepare("
    SELECT id FROM pagamentos 
    WHERE usuario_id = ? AND status_pagamento = 'confirmado'
    ORDER BY data_pagamento DESC
    LIMIT 1
")) {
    $stmtPago->bind_param("i", $fornecedor_id);
    $stmtPago->execute();
    $resPago = $stmtPago->get_result();
    $temPlanoAtivo = (bool)($resPago && $resPago->num_rows > 0);
}
?>


<style>
 .top-bar {
      background: linear-gradient(to right, #67086F, #ca5fb3, #C50FD5);
      padding: 20px 40px;
      display: flex;
      justify-content: space-between;
      align-items: center;
      flex-direction: row-reverse;
    }
    .top-bar h3 {
      color: white;
      font-weight: bold;
      margin: 0;
      font-size: 28px;
    }
    
    .voltar:hover { background-color: #b02a37; }
     {
      padding: 60px 15px 150px 15px;
      display: flex;
      justify-content: center;
      align-items: flex-start;
    }
</style>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Pagamento</title>
    <link rel="stylesheet" href="../Pagamento/pagamento.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>

    <div class="top-bar">
      <h3>Meu Plano</h3>
      <div class="voltar" onclick="window.history.back();">← Voltar</div>
    </div>

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


<script>
  /* Constantes globais (iguais às do primeiro, mas para fornecedor) */
  const tipoUsuario         = 1; // fornecedor
  const TEM_PLANO_ATIVO     = <?= $temPlanoAtivo ? 'true' : 'false' ?>;
  const PLANO_ID            = <?= (int)$plano['id'] ?>;
  const PLANO_NOME          = <?= json_encode($plano['nome']) ?>;
  const PLANO_DESC          = <?= json_encode($plano['descricao'] ?: 'Assinatura mensal do fornecedor') ?>;
  const PLANO_PRECO_NUM     = <?= json_encode(number_format((float)$plano['preco'], 2, '.', '')) ?>; // "20.00"
  const PLANO_PRECO_LABEL   = <?= json_encode(number_format((float)$plano['preco'], 2, ',', '.')) ?>; // "20,00"
  const ENDPOINT_FORNECEDOR = "../Pagamento/confirmar_pagamento_fornecedor.php";
</script>

<script src="../Pagamento/pagamento_fornecedor.js?v=2"></script>

<?php include "../includes/rodape.php"; ?>
</body>
</html>
