<?php
session_start();
include "../conexao.php";

// Verifica se o usuário está logado
if (!isset($_SESSION['usuario_id'])) {
    die("Acesso não autorizado.");
}

$empresa_id = intval($_SESSION['usuario_id']); // ID do usuário logado

// Busca nome, tipo e descrição do tipo de usuário
$nomeUsuario = "";
$tipoUsuario = "";
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

// Bloquear outros tipos que não sejam 1 (Fornecedor) ou 2 (Consumidor)
if (!in_array($tipoUsuarioId, [1, 2])) {
    die("Acesso restrito.");
}

// Buscar imagem e nome do serviço
$sql = "SELECT imagem_url, nome_servico FROM servicos WHERE empresa_id = $empresa_id LIMIT 1";
$resultado = mysqli_query($conexao, $sql);

$imagemBanner = "assets/banner_padrao.png";
$nomeServico = "";

if ($row = mysqli_fetch_assoc($resultado)) {
    $imagemBanner = "../" . $row['imagem_url'];
    $nomeServico = $row['nome_servico'];
}
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8">
  <title>Seus agendamentos</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body { margin: 0; font-family: 'Segoe UI', sans-serif; background: #FFF; }
    .bg-gradient { background: linear-gradient(to right, #67086F, #ca5fb3, #C50FD5) !important; }
    header { position: relative; padding: 30px 0; }
    .dropdown { position: absolute; top: 20px; right: 30px; }
    .dropdown-btn {
      background: transparent; color: white; font-weight: bold; border: none;
      font-size: 16px; cursor: pointer;
    }
    .dropdown-content {
      display: none; position: absolute; right: 0; top: 35px; background-color: white;
      min-width: 180px; border-radius: 6px; box-shadow: 0 8px 16px rgba(0,0,0,0.2);
      z-index: 1000;
    }
    .dropdown-content a {
      color: #67086F; padding: 12px 16px; text-decoration: none; display: block; font-weight: bold;
    }
    .dropdown-content a:hover { background-color: #f5e5f9; }
    .imagem-servico {
      max-width: 250px; border-radius: 12px;
      box-shadow: 0 4px 8px rgba(0,0,0,0.2);
    }
    .container-central { text-align: center; margin-top: 30px; }
    .nome-servico { font-size: 24px; margin-top: 15px; font-weight: bold; }
    .menu { margin-top: 30px; display: flex; justify-content: center; gap: 30px; flex-wrap: wrap; }
    .menu a {
      text-decoration: none; color: #67086F; font-weight: bold; font-size: 16px;
      padding: 10px 15px; border-radius: 20px; transition: background 0.3s ease;
    }
    .menu a:hover { background-color: #f8e6f3; }
    table {
      margin: 40px auto; width: 90%; background: #fff;
      border-radius: 8px; box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
    }
    th {
      background-color: #ca5fb3; color: white;
      padding: 10px; text-align: center;
    }
    td {
      padding: 10px; border-bottom: 1px solid #f1f1f1; text-align: center;
    }

    .rodape {
  background: linear-gradient(to right, #67086F, #ca5fb3, #C50FD5);
  color: white;
  text-align: center;
  padding: 20px 0;
  position: relative; /* <--- use isso ao invés de fixed */
  bottom: 0;
  width: 100%;
}

  </style>
</head>
<body>

  <header class="bg-gradient text-white text-center">
    <h1>Agendamentos</h1>
    <div class="dropdown">
      <button onclick="toggleDropdown()" class="dropdown-btn">
        Olá, <?php echo htmlspecialchars($nomeUsuario); ?> ▾
      </button>
      <div id="dropdown-menu" class="dropdown-content">
        <a href="horario.php">Cadastrar horários</a>
        <a href="../fornecedor/configFornecedor.php">Editar Perfil</a>
        <a href="../Pagamentos/pagamento.php">Meu Plano</a>
        <a href="../Login/logout.php">Sair</a>
      </div>
    </div>
  </header>

  <div class="container-central">
    <img src="<?php echo $imagemBanner; ?>" class="imagem-servico" alt="Imagem Serviço">
    <div class="nome-servico"><?php echo htmlspecialchars($nomeServico); ?></div>
  </div>
<div class="tela-completa">
    <!-- aqui dentro vai seu header, conteúdo, etc -->
  </div>
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
$sqlAgendamentos = "
  SELECT a.*, u.nome AS cliente_nome, s.nome_servico 
  FROM agendamentos a
  INNER JOIN usuarios u ON a.consumidor_id = u.id
  INNER JOIN servicos s ON a.servico_id = s.id
  WHERE s.empresa_id = ?
  AND a.status = 'confirmado'
  ORDER BY a.data, a.hora
";

$stmt = $conexao->prepare($sqlAgendamentos);
$stmt->bind_param("i", $empresa_id);
$stmt->execute();
$result = $stmt->get_result();

while ($row = $result->fetch_assoc()) {
    $cliente = htmlspecialchars($row['cliente_nome']);
    $servico = htmlspecialchars($row['nome_servico']);
    $data = date("d/m/Y", strtotime($row['data']));
    $hora = substr($row['hora'], 0, 5);
    $status = ucfirst($row['status']);

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

</body>
</html>

<script>
function toggleDropdown() {
  var menu = document.getElementById("dropdown-menu");
  menu.style.display = menu.style.display === "block" ? "none" : "block";
}

window.onclick = function(event) {
  if (!event.target.matches('.dropdown-btn')) {
    var menu = document.getElementById("dropdown-menu");
    if (menu && menu.style.display === "block") {
      menu.style.display = "none";
    }
  }
};
</script>
