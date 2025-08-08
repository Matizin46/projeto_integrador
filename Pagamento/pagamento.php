<?php
include "../includes/cabecalhoconfig.php";
?>
<?php
session_start();
include "../conexao.php";

if (!isset($_SESSION['usuario_id'])) {
    header("Location: ../Login/login.php");
    exit;
}

$consumidor_id = (int)$_SESSION['usuario_id'];
$servico_id = isset($_GET['servico_id']) ? (int)$_GET['servico_id'] : 0;
?>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Pagamento</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="../Pagamento/pagamento.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
      .top-bar {
          background: linear-gradient(to right, #67086F, #ca5fb3, #C50FD5);
          padding: 20px 40px;
          display: flex;
          justify-content: space-between;
          align-items: center;
          flex-direction: row-reverse;
      }
      .top-bar h3 { color: white; font-weight: bold; margin: 0; font-size: 28px; }
      .voltar-pagamento {
          background-color: #dc3545; color: white; padding: 10px 25px; text-decoration: none;
          border-radius: 40px; font-weight: bold; font-size: 16px; box-shadow: 0 2px 4px rgba(0,0,0,0.2);
          transition: background 0.3s; cursor: pointer;
      }
    </style>
</head>
<body>

<div class="top-bar">
  <h3>Pagamento</h3>
  <a class="voltar-pagamento" href="../Empresas/empresas.php">← Voltar</a>
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
  const tipoUsuario = 2; // consumidor
  const SERVICO_ID_PHP = <?= (int)$servico_id ?>; // fallback se URL não tiver ?servico_id=
</script>
<script src="../Pagamento/pagamento.js?v=4"></script>

<?php include "../includes/rodape.php"; ?>
</body>
</html>
