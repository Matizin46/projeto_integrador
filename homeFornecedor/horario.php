<?php 
session_start();
include "../conexao.php"; // Conexão com o banco

// 🔒 Verifica login
if (!isset($_SESSION['usuario_id'])) {
    header("Location: ../Login/login.php");
    exit;
}

$empresa_id = (int) $_SESSION['usuario_id'];

// 🔎 Busca um serviço dessa empresa (apenas 1 para associar o horário)
$sqlServico = "SELECT id, nome_servico FROM servicos WHERE empresa_id = $empresa_id LIMIT 1";
$res = mysqli_query($conexao, $sqlServico);
$servico = mysqli_fetch_assoc($res);

if (!$servico) {
    echo "Nenhum serviço encontrado para esta empresa.";
    exit;
}
?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8">
  <title>Cadastro de Horário</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />

  <!-- Bootstrap -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

  <!-- Fonte padrão do projeto -->
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">

  <style>
    /* ===== Base / Fonte / Fundo ===== */
    html, body {
      height: 100%;
      margin: 0;
      padding: 0;
      font-family: 'Poppins', sans-serif; /* mesma letra usada no restante do site */
      background: #fff0fb;
      display: flex;
      flex-direction: column;
    }

    /* ===== Barra superior (gradiente) com título central e botão voltar à esquerda ===== */
    .top-bar {
      background: linear-gradient(to right, #67086F, #ca5fb3, #C50FD5);
      padding: 16px 40px;
      display: flex;
      justify-content: center;     /* centraliza o título */
      align-items: center;
      position: relative;
    }
    .top-bar h3 {
      color: white;
      font-weight: 700;
      margin: 0;
      text-shadow: 2px 2px 6px rgba(0,0,0,0.4); /* leve sombra no texto */
    }
    .voltar {
      position: absolute;
      left: 20px;                  /* fixa o botão no canto esquerdo */
      background-color: #dc3545;
      color: white;
      padding: 10px 22px;
      text-decoration: none;
      border-radius: 40px;
      font-weight: 700;
      font-size: 14px;
      box-shadow: 0 2px 4px rgba(0,0,0,0.2);
      transition: background 0.3s;
      cursor: pointer;
    }
    .voltar:hover { background-color: #b02a37; }

    /* ===== Área central (centraliza vertical e horizontal) ===== */
    .content {
      flex: 1;
      display: flex;
      justify-content: center;  /* horizontal */
      align-items: center;      /* vertical */
      padding: 40px 15px 80px;
    }

    /* ===== Card do formulário ===== */
    .form-card {
      width: 100%;
      max-width: 500px;          /* 🔹 largura padronizada com as outras telas */
      padding: 25px;
      background: #fff;
      border-radius: 15px;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    }

    .form-card h2 {
      text-align: center;        /* 🔹 título centralizado */
      font-weight: 700;
      margin-bottom: 20px;
      color: #1f1f1f;
    }

    .form-label { font-weight: 600; }

    /* ===== Botão roxo (gradiente) ===== */
    .btn-roxo {
      background: linear-gradient(to right, #67086F, #ca5fb3, #C50FD5);
      color: #fff;               /* 🔹 texto branco */
      font-weight: 700;          /* 🔹 negrito */
      border: none;
      border-radius: 8px;
      padding: 12px;
    }
    .btn-roxo:hover { opacity: .92; }

    /* Rodapé padrão do site (seu include já traz estilo, este é fallback) */
    footer {
      background: linear-gradient(to right, #67086F, #ca5fb3, #C50FD5);
      color: white;
      padding: 20px;
      text-align: center;
    }
  </style>
</head>
<body>

  <!-- Barra superior -->
  <div class="top-bar">
    <a class="voltar" href="../homeFornecedor/home.php">← Voltar</a>
    <h3>Cadastro de Horário</h3>
  </div>

  <!-- Conteúdo central -->
  <div class="content">
    <div class="form-card">
      <h2>Cadastro de Horário</h2>

      <!-- Formulário para salvar horários -->
      <form action="salvar_horario.php" method="post">
        <!-- ID do serviço (oculto) -->
        <input type="hidden" name="servico_id" value="<?= (int)$servico['id'] ?>">

        <!-- Serviço (somente leitura) -->
        <div class="mb-3">
          <label class="form-label">Serviço</label>
          <input type="text" class="form-control" value="<?= htmlspecialchars($servico['nome_servico']) ?>" disabled>
        </div>

        <!-- Data -->
        <div class="mb-3">
          <label for="data" class="form-label">Data</label>
          <input type="date" class="form-control" name="data" id="data" required>
        </div>

        <!-- Horário -->
        <div class="mb-3">
          <label for="hora" class="form-label">Horário</label>
          <input type="time" class="form-control" name="hora" id="hora" required>
        </div>

        <!-- Status -->
        <div class="mb-3">
          <label for="status" class="form-label">Status</label>
          <select class="form-select" name="status" id="status" required>
            <option value="pendente">Pendente</option>
            <option value="confirmado">Confirmado</option>
            <option value="cancelado">Cancelado</option>
          </select>
        </div>

        <!-- Botão salvar -->
        <button type="submit" class="btn btn-roxo w-100">Salvar Horário</button>
      </form>
    </div>
  </div>

  <!-- Rodapé -->
  <?php include "../includes/rodape.php"; ?>

  <!-- SweetAlert -->
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

  <?php if (!empty($_SESSION['flash_horario']) && $_SESSION['flash_horario'] === 'ok'): ?>
  <script>
    // ✅ Mostra alerta de sucesso e redireciona
    Swal.fire({
      icon: 'success',
      title: 'Horário salvo com sucesso!',
      showConfirmButton: false,
      timer: 1800
    }).then(() => {
      // Troque o destino se quiser voltar para outra página
      window.location.href = '../homeFornecedor/home.php';
    });
  </script>
  <?php unset($_SESSION['flash_horario']); endif; ?>

  <?php if (!empty($_SESSION['flash_horario']) && $_SESSION['flash_horario'] === 'erro'): ?>
  <script>
    // ❌ Alerta de erro
    Swal.fire({
      icon: 'error',
      title: 'Não foi possível salvar o horário!',
      confirmButtonText: 'OK'
    });
  </script>
  <?php unset($_SESSION['flash_horario']); endif; ?>

</body>
</html>

