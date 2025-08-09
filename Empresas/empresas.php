<?php
// =======================================
// Sessão e conexão
// =======================================
session_start();                     // Necessário para ler os dados do usuário logado
include "../conexao.php";            // Conexão com o banco

// =======================================
// Busca de dados do usuário logado
// =======================================
$nomeUsuario   = "";
$tipoUsuario   = "";
$tipoUsuarioId = null;

// Verifica se o usuário está logado
if (isset($_SESSION['usuario_id'])) {
  $id = intval($_SESSION['usuario_id']); // Garante tipo inteiro

  // Busca nome e tipo do usuário (usando statement preparado)
  $stmt = $conexao->prepare("
    SELECT u.nome, u.id_tipo_usuario, t.descricao 
    FROM usuarios u 
    INNER JOIN tipo_usuario t ON u.id_tipo_usuario = t.id 
    WHERE u.id = ?
  ");
  $stmt->bind_param("i", $id);
  $stmt->execute();
  $stmt->bind_result($nomeUsuario, $tipoUsuarioId, $tipoUsuario);
  $stmt->fetch();
  $stmt->close();

  // Restringe acesso: apenas consumidores (2)
  if ($tipoUsuarioId != 2) {
    die("Acesso restrito a consumidores.");
  }
} else {
  die("Acesso não autorizado.");
}
?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Estetique - Serviços</title>

  <!-- Bootstrap -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

  <!-- Fonte Poppins -->
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">

  <!-- Estilos locais -->
  <style>
    /* Fonte global e ajustes básicos */
    body {
      font-family: 'Poppins', sans-serif; /* Padrão do projeto */
      min-height: 100vh;
      overflow-x: hidden;
      background-color: #fdeefc; /* tom rosa bem claro */
    }

    /* =============== Cabeçalho com título centralizado =============== */
    /* Usamos grid com 3 colunas: [esquerda] [centro] [direita] */
    .header-servicos {
      display: flex;                 /* título à esquerda, ações à direita */
      align-items: center;
      justify-content: space-between;
      gap: 16px;
      padding-top: .5rem;            /* apenas respiro interno */
      padding-bottom: .5rem;
    }
    .header-servicos h1 {
      margin: 0;
      text-align: left;              /* começa onde os cards começam */
      font-weight: 700;
      color: #fff;
      text-shadow: 3px 3px 6px rgba(0,0,0,0.45); /* sombra p/ destacar no degradê */
    }
    
    .header-servicos .lado-esquerdo { grid-column: 1; }
    .header-servicos .lado-direito  { grid-column: 3; justify-self: end; }

    /* Responsivo: no mobile empilha e centraliza tudo */
    @media (max-width: 576px) {
      .header-servicos {
        grid-template-columns: 1fr;
        row-gap: 10px;
        text-align: center;
      }
      .header-servicos h1 { grid-column: 1; }
      .header-servicos .lado-direito { justify-self: center; width: 100%; }
      .header-servicos .input-group { max-width: 420px; margin: 0 auto; }
    }

    /* ---------------- Resto do seu estilo original ---------------- */
    .empresa-card {
      height: 100%;
      display: flex;
      flex-direction: column;
      border-radius: 12px;
      overflow: hidden;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    .empresa-card img {
      width: 100%;
      height: 180px;
      object-fit: cover;
    }

    .btn-agendar,
    .btn-pagamento {
    background-color: #67086F; /* cor roxa que já estava */
    color: white; /* deixa o texto branco */
    border: none;
    border-radius: 6px;
    padding: 10px;
    margin-top: auto;
    font-weight: bold;
    transition: background 0.2s ease;
    }
    .btn-agendar:hover,
    .btn-pagamento:hover {
    background-color: #4a044e; /* roxo mais escuro no hover */
    color: white; /* mantém o texto branco no hover */
    }

    .dropdown-menu a {
      font-weight: bold;
      font-size: 14px;
    }

    .container { padding-bottom: 100px; } /* espaço pro rodapé */

    /* Sombra no título do cabeçalho (força precedência por estar no fim) */
    .header-servicos h1 {
    text-shadow: 3px 3px 6px rgba(0,0,0,0.45);
    }
  </style>
</head>

<body>
  <!-- ====================== NAV / Cabeçalho com gradiente ====================== -->
  <nav class="navbar navbar-expand-lg" style="background: linear-gradient(to right, #67086F, #ca5fb3, #C50FD5);">
    <div class="container-fluid px-4 py-2 header-servicos">
      <!-- Coluna esquerda (vazia propositalmente para balancear o centro) -->
      <div class="lado-esquerdo"></div>

      <!-- Centro: Título realmente centralizado -->
      <h1 class="fw-bold">Serviços Oferecidos</h1>

      <!-- Direita: busca + menu do usuário -->
      <div class="lado-direito d-flex align-items-center gap-3">
        <!-- Busca -->
        <div class="input-group">
          <input type="text" id="busca" class="form-control" placeholder="Buscar serviços ou profissionais...">
          <button class="btn btn-light" onclick="buscarServicos()" aria-label="Buscar">🔍</button>
        </div>

        <!-- Menu do usuário -->
        <div class="dropdown">
          <button class="btn btn-light dropdown-toggle fw-bold" type="button" data-bs-toggle="dropdown" aria-expanded="false">
            Olá, <?= htmlspecialchars($nomeUsuario, ENT_QUOTES, 'UTF-8') ?>
          </button>
          <ul class="dropdown-menu dropdown-menu-end">
            <li><a class="dropdown-item" href="UserConfig_Consumidor.php">Editar Cadastro</a></li>
            <li><a class="dropdown-item" href="agendamentos.php">Meus Agendamentos</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item text-danger" href="../Login/logout.php">Sair</a></li>
          </ul>
        </div>
      </div>
    </div>
  </nav>

  <!-- ====================== CONTEÚDO PRINCIPAL ====================== -->
  <div class="container mt-4">
    <div class="row" id="empresas-container">
      <?php
      // Consulta: serviços + empresa
      $sql = "SELECT s.id AS servico_id, s.nome_servico, s.preco, s.imagem_url, s.descricao, e.nome AS empresa_nome
              FROM servicos s
              INNER JOIN empresas e ON s.empresa_id = e.id
              ORDER BY s.id ASC";
      $result = $conexao->query($sql);
      $index = 0;

      if ($result && $result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
          // Sanitização de saída para evitar XSS
          $servico_id    = (int) $row['servico_id'];
          $nome_servico  = htmlspecialchars($row['nome_servico'] ?? '', ENT_QUOTES, 'UTF-8');
          $descricao     = htmlspecialchars($row['descricao'] ?? '', ENT_QUOTES, 'UTF-8');
          $preco         = number_format((float)$row['preco'], 2, ',', '.');
          $imagem        = htmlspecialchars($row['imagem_url'] ?? '', ENT_QUOTES, 'UTF-8');
          $empresa       = htmlspecialchars($row['empresa_nome'] ?? '', ENT_QUOTES, 'UTF-8');

          // Horários disponíveis (pendentes) desse serviço
          // OBS: aqui permanece uma query simples; se quiser, dá pra trocar por prepared statement também.
          $horarios_sql    = "SELECT data, hora FROM agendamentos WHERE servico_id = $servico_id AND status = 'pendente'";
          $horarios_result = $conexao->query($horarios_sql);

          $horarios_html = "";
          if ($horarios_result) {
            while ($h = $horarios_result->fetch_assoc()) {
              $data = date("d/m", strtotime($h['data']));
              $hora = substr($h['hora'], 0, 5);
              // Saída segura na option
              $horarios_html .= "<option>".htmlspecialchars("$data às $hora", ENT_QUOTES, 'UTF-8')."</option>";
            }
          }

          // Card do serviço
          echo "
          <div class='col-md-4 col-sm-6 mb-4 empresa-card-wrapper'>
            <div class='card empresa-card'>
              <img src='../$imagem' class='card-img-top' alt='Imagem serviço'>
              <div class='card-body'>
                <h5 class='card-title'>$nome_servico</h5>
                <p class='card-text'>$descricao</p>
                <p class='mb-1 text-muted'><small>Profissional: $empresa</small></p>
                <p class='fw-bold text-primary mb-2'>R$ $preco</p>

                <button class='btn btn-agendar w-100 mb-2' onclick='mostrarHorarios($index)'>Agendar Horário</button>

                <div class='select-horario' id='horarios-$index' style='display:none'>
                  <select onchange='mostrarPagamento(this, $index)' class='form-select mb-2'>
                    <option value=''>Escolha um horário</option>
                    $horarios_html
                  </select>
                  <div class='pagamento' id='pagamento-$index' style='display:none'>
                    <a href='../Pagamento/pagamento.php?servico_id=$servico_id' class='btn btn-pagamento w-100'>💳 Efetuar pagamento</a>
                  </div>
                </div>
              </div>
            </div>
          </div>";
          $index++;
        }
      } else {
        echo "<p class='text-center'>Nenhum serviço encontrado.</p>";
      }
      ?>
    </div>
  </div>

  <?php include "../includes/rodape.php"; ?>

  <!-- Scripts -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  <script>
    // Mostra/oculta a lista de horários do card clicado
    function mostrarHorarios(index) {
      const horarioDiv = document.getElementById(`horarios-${index}`);
      const visivel = (horarioDiv.style.display === 'block');
      horarioDiv.style.display = visivel ? 'none' : 'block';
    }

    // Exibe a área de pagamento quando um horário é escolhido
    function mostrarPagamento(select, index) {
      const pagamento = document.getElementById(`pagamento-${index}`);
      pagamento.style.display = select.value !== "" ? "block" : "none";
    }

    // Filtro de busca (cliente digita e filtramos os cards pelo texto)
    function buscarServicos() {
      const termo = document.getElementById("busca").value.toLowerCase();
      const cards = document.querySelectorAll(".empresa-card-wrapper");
      cards.forEach(card => {
        const texto = card.innerText.toLowerCase();
        card.style.display = texto.includes(termo) ? "block" : "none";
      });
    }
  </script>
</body>
</html>
