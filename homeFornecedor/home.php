<?php
// ---------------------------------------------------------
// Sessão e conexão
// ---------------------------------------------------------
session_start();
include "../conexao.php";

// Garante que o usuário está logado
if (!isset($_SESSION['usuario_id'])) {
    die("Acesso não autorizado.");
}

// ID do usuário logado (fornecedor/consumidor dono da página)
$empresa_id = intval($_SESSION['usuario_id']);

// ---------------------------------------------------------
// Dados do usuário logado (nome + tipo)
// ---------------------------------------------------------
$nomeUsuario   = "";
$tipoUsuario   = "";
$tipoUsuarioId = null;

$stmt = $conexao->prepare("
    SELECT u.nome, u.id_tipo_usuario, t.descricao 
    FROM usuarios u 
    INNER JOIN tipo_usuario t ON u.id_tipo_usuario = t.id 
    WHERE u.id = ?
");
$stmt->bind_param("i", $empresa_id);
$stmt->execute();
$stmt->bind_result($nomeUsuario, $tipoUsuarioId, $tipoUsuario);
$stmt->fetch();
$stmt->close();

// Permite somente tipos 1 (Fornecedor) e 2 (Consumidor)
if (!in_array($tipoUsuarioId, [1, 2])) {
    die("Acesso restrito.");
}

// ---------------------------------------------------------
// Banner (primeiro serviço do usuário) — opcional
// ---------------------------------------------------------
$sql = "SELECT imagem_url, nome_servico FROM servicos WHERE empresa_id = $empresa_id LIMIT 1";
$resultado = mysqli_query($conexao, $sql);

$imagemBanner = "assets/banner_padrao.png";
$nomeServico  = "";

if ($row = mysqli_fetch_assoc($resultado)) {
    $imagemBanner = "../" . $row['imagem_url'];
    $nomeServico  = $row['nome_servico'];
}
?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8">
  <title>Seus agendamentos</title>

  <!-- Bootstrap -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

  <!-- Fonte padrão do projeto -->
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">

  <style>
    /* Fonte global + cor de fundo padrão */
    body { 
      margin: 0; 
      font-family: 'Poppins', sans-serif;  
      background-color: #fdeefc; /* tom rosa bem claro */
    
    
    }

    /* Degradê institucional */
    .bg-gradient { background: linear-gradient(to right, #67086F, #ca5fb3, #C50FD5) !important; }

    /* Header com altura confortável; relative para posicionar o dropdown */
    header { position: relative; padding: 26px 0; }

    /* ====== DROPDOWN ESTILO “CAIXINHA” (como no print) ====== */
    .user-menu {
      position: absolute;
      top: 16px;
      right: 20px;
    }
    /* Botão do usuário: caixinha branca arredondada com sombra */
    .dropdown-btn {
      background: #fff;
      color: #1f1f1f;
      font-weight: 700;
      border: 1px solid #ececec;
      border-radius: 14px;           /* “pílula” */
      padding: 10px 16px;
      font-size: 15px;
      line-height: 1;
      cursor: pointer;
      box-shadow: 0 4px 10px rgba(0,0,0,.08);
    }
    .dropdown-btn:hover { box-shadow: 0 6px 14px rgba(0,0,0,.12); }

    /* Conteúdo do menu suspenso */
    .dropdown-content {
      display: none;
      position: absolute;
      right: 0;
      top: calc(100% + 8px);
      background-color: #fff;
      min-width: 220px;
      border-radius: 10px;
      box-shadow: 0 12px 24px rgba(0,0,0,.12);
      z-index: 1000;
      overflow: hidden;
    }
    .dropdown-content a {
      color: #67086F;
      padding: 12px 16px;
      text-decoration: none;
      display: block;
      font-weight: 600;
      font-size: 14px;
    }
    .dropdown-content a:hover { background-color: #f5e5f9; }

    /* Banner/thumbnail do serviço */
    .imagem-servico {
      max-width: 250px;
      border-radius: 12px;
      box-shadow: 0 4px 8px rgba(0,0,0,0.2);
    }
    .container-central { text-align: center; margin-top: 30px; }
    .nome-servico { font-size: 24px; margin-top: 15px; font-weight: 700; }

    /* Tabela de agendamentos */
    table {
      margin: 40px auto; width: 90%; background: #fff;
      border-radius: 8px; box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
    }
    th {
      background-color: #ca5fb3; color: #fff;
      padding: 10px; text-align: center;
      font-weight: 600;
    }
    td { padding: 10px; border-bottom: 1px solid #f1f1f1; text-align: center; }

    /* Rodapé padrão */
    .rodape {
      background: linear-gradient(to right, #67086F, #ca5fb3, #C50FD5);
      color: #fff; text-align: center; padding: 20px 0;
      position: relative; bottom: 0; width: 100%;
    }
    header h1 {
      text-shadow: 2px 2px 6px rgba(0,0,0,0.4); /* deslocamento X, Y, blur, cor */
}
  </style>
</head>
<body>

  <!-- HEADER -->
  <header class="bg-gradient text-white text-center">
    <h1 class="m-0 fw-bold">Agendamentos</h1>


    <!-- Menu do usuário (caixinha) -->
    <div class="user-menu">
      <!-- Botão que abre/fecha o menu. Usamos htmlspecialchars para evitar XSS -->
      <button onclick="toggleDropdown()" class="dropdown-btn" aria-haspopup="true" aria-expanded="false" id="userMenuBtn">
        Olá, <?php echo htmlspecialchars($nomeUsuario); ?> ▾
      </button>

      <!-- Opções do usuário -->
      <nav id="dropdown-menu" class="dropdown-content" aria-labelledby="userMenuBtn">
        <a href="horario.php">Cadastrar horários</a>
        <a href="../fornecedor/configFornecedor.php">Editar Perfil</a>
        <a href="../Pagamento/pagamento_fornecedor.php">Meu Plano</a>
        <a href="../Login/logout.php">Sair</a>
      </nav>
    </div>
  </header>

  <!-- BANNER DO SERVIÇO -->
  <div class="container-central">
    <img src="<?php echo $imagemBanner; ?>" class="imagem-servico" alt="Imagem Serviço">
    <div class="nome-servico"><?php echo htmlspecialchars($nomeServico); ?></div>
  </div>

  <!-- LISTAGEM DE AGENDAMENTOS -->
  <table>
    <thead>
      <tr>
        <th>Cliente</th>
        <th>Serviço</th>
        <th>Data</th>
        <th>Horário</th>
        <th>Status</th>
      </tr>
    </thead>
    <tbody>
<?php
// Consulta: agenda do(s) serviço(s) dessa empresa
$sqlAgendamentos = "
  SELECT a.*, u.nome AS cliente_nome, s.nome_servico 
  FROM agendamentos a
  INNER JOIN usuarios u ON a.consumidor_id = u.id
  INNER JOIN servicos s ON a.servico_id = s.id
  WHERE s.empresa_id = ?
  AND a.status IN ('confirmado','cancelado')   -- mostra confirmados e cancelados
  ORDER BY a.data, a.hora
";

$stmt = $conexao->prepare($sqlAgendamentos);
$stmt->bind_param("i", $empresa_id);
$stmt->execute();
$result = $stmt->get_result();

while ($row = $result->fetch_assoc()) {
    $cliente = htmlspecialchars($row['cliente_nome']);
    $servico = htmlspecialchars($row['nome_servico']);
    $data    = date("d/m/Y", strtotime($row['data']));
    $hora    = substr($row['hora'], 0, 5);
    $status  = ucfirst($row['status']);

    echo "<tr>
            <td>$cliente</td>
            <td>$servico</td>
            <td>$data</td>
            <td>$hora</td>
            <td>$status</td>
          </tr>";
}
$stmt->close();
?>
    </tbody>
  </table>

  <?php include "../includes/rodape.php" ?>

  <script>
  // Abre/fecha o menu do usuário
  function toggleDropdown() {
    const menu = document.getElementById("dropdown-menu");
    const btn  = document.getElementById("userMenuBtn");
    const open = menu.style.display === "block";
    menu.style.display = open ? "none" : "block";
    btn.setAttribute("aria-expanded", open ? "false" : "true");
  }

  // Fecha o menu ao clicar fora
  window.addEventListener('click', function(e) {
    const btn  = document.getElementById("userMenuBtn");
    const menu = document.getElementById("dropdown-menu");
    if (!btn.contains(e.target) && !menu.contains(e.target)) {
      menu.style.display = "none";
      btn.setAttribute("aria-expanded", "false");
    }
  });
  </script>
</body>
</html>
