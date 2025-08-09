<?php
// Inclui o cabeçalho/configurações visuais e meta-tags comuns do projeto
include "../includes/cabecalhoconfig.php";
?>

<?php
// Inicia a sessão para acessar dados do usuário logado
session_start();

// Conexão com o banco de dados
include "../conexao.php";

// Se não houver usuário logado, redireciona para a tela de login
if (!isset($_SESSION['usuario_id'])) {
    header("Location: ../Login/login.php");
    exit;
}

// Guarda o id do usuário logado (consumidor) como inteiro
$consumidor_id = (int)$_SESSION['usuario_id'];

// Captura o id do serviço vindo por GET (?servico_id=123); se não vier, usa 0
$servico_id = isset($_GET['servico_id']) ? (int)$_GET['servico_id'] : 0;
?>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Pagamento</title>
    <!-- Deixa a página responsiva em dispositivos móveis -->
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- CSS principal da tela de pagamento (cores, layout, inputs, etc.) -->
    <link rel="stylesheet" href="../Pagamento/pagamento.css">
    <!-- Biblioteca para alertas/modais bonitos (Sucesso/Erro) -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <style>
      /* Barra superior com gradiente, título e botão Voltar */
      .top-bar {
          background: linear-gradient(to right, #67086F, #ca5fb3, #C50FD5);
          padding: 20px 40px;
          display: flex;
          justify-content: space-between; /* título à esquerda e botão à direita (por conta do row-reverse abaixo) */
          align-items: center;
          flex-direction: row-reverse;    /* inverte a ordem visual: botão à esquerda, título à direita */
      }
      /* Título do cabeçalho */
      .top-bar h3 { 
          color: white; 
          font-weight: bold; 
          margin: 0; 
          font-size: 28px; 
      }
      /* Botão "Voltar" do cabeçalho */
      .voltar-pagamento {
          background-color: #dc3545; 
          color: white; 
          padding: 10px 25px; 
          text-decoration: none;
          border-radius: 40px; 
          font-weight: bold; 
          font-size: 16px; 
          box-shadow: 0 2px 4px rgba(0,0,0,0.2);
          transition: background 0.3s; 
          cursor: pointer;
      }
      /* Ex.: .voltar-pagamento:hover { background-color: #b02a37; } poderia ser usado para hover */
    </style>
</head>
<body>

<!-- Cabeçalho da página de pagamento -->
<div class="top-bar">
  <h3>Pagamento</h3>
  <!-- Link para retornar à listagem de empresas/serviços -->
  <a class="voltar-pagamento" href="../Empresas/empresas.php">← Voltar</a>
</div>

<!-- Conteúdo principal: container com título, seleção de método e formulário dinâmico -->
<div class="container">
    <h2>Pagamento</h2>

    <!-- Opções de método: ao clicar, chama JS para montar o formulário correspondente -->
    <div class="formas">
        <div class="metodo" onclick="mostrarFormularioCartao('Crédito')">
            <!-- Logos apenas ilustrativas para o método -->
            <img src="https://upload.wikimedia.org/wikipedia/commons/0/04/Visa.svg" alt="Visa">
            <span>Cartão de Crédito</span>
        </div>
        <div class="metodo" onclick="mostrarFormularioCartao('Débito')">
            <img src="https://upload.wikimedia.org/wikipedia/commons/0/04/Mastercard-logo.png" alt="Mastercard">
            <span>Cartão de Débito</span>
        </div>
    </div>

    <!-- Aqui o JS injeta o formulário (inputs de cartão, nome, cvv, validade, etc.) -->
    <div id="detalhes-pagamento"></div>
</div>

<script>
  // Indica que este fluxo é do consumidor (2). No JS isso pode alterar a URL de envio ou validações.
  const tipoUsuario = 2; // consumidor

  // Disponibiliza o id do serviço vindo do PHP para o JS montar o payload do pagamento.
  // Caso não exista na URL, será 0 (tratado no backend ou bloqueio no front).
  const SERVICO_ID_PHP = <?= (int)$servico_id ?>; // fallback se URL não tiver ?servico_id=
</script>

<!-- Lógica da tela de pagamento (monta o formulário, valida campos, envia via fetch, usa SweetAlert, etc.) -->
<script src="../Pagamento/pagamento.js?v=4"></script>

<?php 
// Rodapé padrão do site (gradiente, direitos reservados etc.)
include "../includes/rodape.php"; 
?>
</body>
</html>
