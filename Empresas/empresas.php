<?php
session_start();
include "../conexao.php";

$nomeUsuario = "";
$tipoUsuario = "";
$tipoUsuarioId = null; // novo

// ✅ Verifica se o usuário está logado
if (isset($_SESSION['usuario_id'])) {
  $id = intval($_SESSION['usuario_id']);

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

  // ✅ (Opcional) Restringe acesso a consumidores
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
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    .top-bar {
      background: linear-gradient(to right, #67086F, #ca5fb3, #C50FD5);
      color: white;
      padding: 15px 30px;
      display: flex;
      align-items: center;
      justify-content: space-between;
      flex-wrap: wrap;
    }

    .top-bar h1 {
      margin: 0;
      font-weight: bold;
    }

    .search-box {
      display: flex;
      align-items: center;
      gap: 5px;
    }

    .search-box input {
      max-width: 250px;
    }

    .empresa-card img {
      height: 150px;
      object-fit: cover;
    }

    .btn-agendar,
    .btn-pagamento {
      background-color: #67086F;
      border: none;
    }

    .btn-agendar:hover,
    .btn-pagamento:hover {
      background-color: #4a044e;
    }

    .dropdown-menu a {
      font-weight: bold;
      font-size: 14px;
    }

    /* Cards de serviços */
.empresa-card {
  height: 100%;
  display: flex;
  flex-direction: column;
  border-radius: 12px;
  overflow: hidden;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

/* Imagem de capa do serviço */
.empresa-card img {
  width: 100%;
  height: 180px;
  object-fit: cover;
}

/* Rodapé fixo apenas quando necessário */
body {
  min-height: 100vh;
  overflow-x: hidden;
}

.container {
  padding-bottom: 100px;
}

  </style>
</head>

<body>
  <!-- MENU SUPERIOR ATUALIZADO -->
<nav class="navbar navbar-expand-lg" style="background: linear-gradient(to right, #67086F, #ca5fb3, #C50FD5);">
  <div class="container-fluid d-flex justify-content-between align-items-center px-4 py-2">
    <h1 class="text-white fw-bold m-0">Serviços Oferecidos</h1>

    <div class="d-flex align-items-center gap-3">
      <div class="input-group">
        <input type="text" id="busca" class="form-control" placeholder="Buscar serviços ou profissionais...">
        <button class="btn btn-light" onclick="buscarServicos()">🔍</button>
      </div>

      <div class="dropdown">
        <button class="btn btn-light dropdown-toggle fw-bold" type="button" data-bs-toggle="dropdown" aria-expanded="false">
          Olá, <?= htmlspecialchars($nomeUsuario) ?>
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


  <div class="container mt-4">
   

    <div class="row" id="empresas-container">
      <?php
      $sql = "SELECT s.id AS servico_id, s.nome_servico, s.preco, s.imagem_url, s.descricao, e.nome AS empresa_nome
              FROM servicos s
              INNER JOIN empresas e ON s.empresa_id = e.id
              ORDER BY s.id ASC";
      $result = $conexao->query($sql);
      $index = 0;

      if ($result && $result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
          $servico_id = $row['servico_id'];
          $nome_servico = $row['nome_servico'];
          $descricao = $row['descricao'];
          $preco = number_format($row['preco'], 2, ',', '.');
          $imagem = $row['imagem_url'];
          $empresa = $row['empresa_nome'];

          $horarios_sql = "SELECT data, hora FROM agendamentos WHERE servico_id = $servico_id AND status = 'pendente'";
          $horarios_result = $conexao->query($horarios_sql);

          $horarios_html = "";
          while ($h = $horarios_result->fetch_assoc()) {
            $data = date("d/m", strtotime($h['data']));
            $hora = substr($h['hora'], 0, 5);
            $horarios_html .= "<option>{$data} às {$hora}</option>";
          }

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

  <?php include "../includes/rodape.php" ?>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  <script>
    
    function mostrarHorarios(index) {
      const horarioDiv = document.getElementById(`horarios-${index}`);
      horarioDiv.style.display = (horarioDiv.style.display === 'none' || horarioDiv.style.display === '') ? 'block' : 'none';
    }

    function mostrarPagamento(select, index) {
      const pagamento = document.getElementById(`pagamento-${index}`);
      pagamento.style.display = select.value !== "" ? "block" : "none";
      
    }

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

