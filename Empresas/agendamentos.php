<?php
// ===============================
// Sessão, includes e segurança
// ===============================
session_start();
require_once "../conexao.php";

// (opcional) cabeçalho global do projeto
// include "../includes/cabecalhoconfig.php";

// Garante login
if (!isset($_SESSION['usuario_id'])) {
  header("Location: ../Login/login.php");
  exit;
}

$consumidorId = (int) $_SESSION['usuario_id'];

// ===============================
// Consulta de agendamentos do consumidor
// (usa consumidor_id — NÃO usuario_id)
// ===============================
$stmt = $conexao->prepare("
  SELECT 
      a.id,
      a.data,
      a.hora,
      a.status,
      s.nome_servico,
      s.imagem_url,
      e.nome AS nome_empresa
  FROM agendamentos a
  LEFT JOIN servicos s ON s.id = a.servico_id
  LEFT JOIN usuarios e ON e.id = a.empresa_id      -- ajuste se sua tabela de empresas for outra
  WHERE a.consumidor_id = ?
  ORDER BY a.data DESC, a.hora DESC
");
$stmt->bind_param("i", $consumidorId);
$stmt->execute();
$res = $stmt->get_result();

// Helpers de formatação
function fmtData($d) { $dt = DateTime::createFromFormat('Y-m-d', $d); return $dt ? $dt->format('d/m/Y') : $d; }
function fmtHora($h) { return $h ? substr($h, 0, 5) : ''; }
?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8" />
  <title>Seus agendamentos</title>
  <meta name="viewport" content="width=device-width, initial-scale=1" />

  <!-- Bootstrap e Poppins -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">

  <style>
    body { font-family: 'Poppins', sans-serif; background: #f8f9fa; }

    /* ===== Cabeçalho no padrão "Editar Cadastro" ===== */
    .top-bar {
    background: linear-gradient(to right, #67086F, #ca5fb3, #C50FD5);
    padding: 20px 40px;
    display: flex
;
    justify-content: start;
    gap: 620px;
    align-items: center;
    flex-direction: row-reverse;
    }
    .top-bar h3 { color: white; font-weight: bold; margin: 0; font-size: 28px; }
    .voltar { background-color: #dc3545; color: white; padding: 10px 25px; text-decoration: none;
    
    }

    .voltar {
    background-color: #dc3545;
    color: white;
    padding: 10px 25px;
    text-decoration: none;
    border-radius: 40px;
    font-weight: bold;
    font-size: 16px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
    transition: background 0.3s;
    cursor: pointer;

  
    }
    /* Botão voltar fixo no início do container, sem empurrar o título */
    .btn-voltar {
      position: absolute;
      left: 0;                    /* início do container */
      background-color: #e74c3c;
      color: #fff;
      padding: 8px 16px;
      border-radius: 24px;
      font-weight: 700;
      text-decoration: none;
      transition: background-color .2s ease;
    }
    .btn-voltar:hover { background-color: #c0392b; }

    /* Conteúdo */
    .page-content { padding: 24px 0 40px; }
  </style>
</head>
<body>

  <!-- ===== Cabeçalho com degradê + voltar à esquerda + título central ===== -->
  <div class="top-bar">
    <h3>Editar Cadastro</h3>
    <a class="voltar" href="empresas.php">← Voltar</a>
  </div>
  

  <!-- ===== Conteúdo ===== -->
  <div class="container page-content">

    <?php if ($res && $res->num_rows > 0): ?>
      <div class="row g-3">
        <?php while ($ag = $res->fetch_assoc()):
          $img = !empty($ag['imagem_url']) ? '../' . $ag['imagem_url'] : '../assets/banner_padrao.png';
          $nomeServico = htmlspecialchars($ag['nome_servico'] ?: 'Serviço', ENT_QUOTES, 'UTF-8');
          $nomeEmpresa = htmlspecialchars($ag['nome_empresa'] ?: 'Empresa', ENT_QUOTES, 'UTF-8');
          $dataBr      = fmtData($ag['data']);
          $horaBr      = fmtHora($ag['hora']);
          $status      = htmlspecialchars(ucfirst($ag['status'] ?: 'pendente'), ENT_QUOTES, 'UTF-8');
          $isCancelado = (strtolower($ag['status']) === 'cancelado');
        ?>
        <div class="col-12 col-md-6 col-lg-4">
          <div class="card h-100 shadow-sm">
            <img src="<?= $img ?>" class="card-img-top" alt="Serviço" style="height:180px;object-fit:cover;">
            <div class="card-body">
              <h5 class="card-title" style="color:#67086F; font-weight:700;"><?= $nomeServico ?></h5>
              <p class="card-text mb-1"><strong>Empresa:</strong> <?= $nomeEmpresa ?></p>
              <p class="card-text mb-2"><strong>Data:</strong> <?= $dataBr ?> &nbsp; <strong>Hora:</strong> <?= $horaBr ?></p>
              <span class="badge <?= $isCancelado ? 'bg-danger' : 'bg-info text-dark' ?>"><?= $status ?></span>
            </div>
            <div class="card-footer bg-white d-flex justify-content-end">
              <?php if (!$isCancelado): ?>
                <button class="btn btn-sm btn-outline-danger" onclick="cancelarAgendamento(<?= (int)$ag['id'] ?>)">
                  Cancelar
                </button>
              <?php endif; ?>
            </div>
          </div>
        </div>
        <?php endwhile; ?>
      </div>
    <?php else: ?>
      <div class="alert alert-light border text-center">
        Você ainda não possui agendamentos.
      </div>
    <?php endif; ?>

  </div>

  <?php include "../includes/rodape.php"; ?>

  <!-- Scripts -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  <script>
    // Cancelar agendamento com confirmação
    function cancelarAgendamento(id) {
      Swal.fire({
        title: 'Tem certeza?',
        text: "Deseja cancelar este agendamento?",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#d33',
        cancelButtonColor: '#6c757d',
        confirmButtonText: 'Sim, cancelar',
        cancelButtonText: 'Não'
      }).then((result) => {
        if (result.isConfirmed) {
          fetch('cancelar_agendamento.php', {
            method: 'POST',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8' },
            body: new URLSearchParams({ id })
          })
          .then(res => res.text())
          .then(txt => {
            const t = txt.trim();
            if (t.startsWith('ok')) {
              const msg = t.split('|')[1] || 'Agendamento cancelado e horário liberado. O pagamento será estornado em até 72 horas úteis.';
              Swal.fire({ title: 'Pronto!', html: msg, icon: 'success' })
                .then(() => location.reload());
            } else {
              Swal.fire('Erro!', t, 'error');
            }
          })
          .catch(() => Swal.fire('Erro!', 'Não foi possível cancelar.', 'error'));
        }
      });
    }
  </script>
</body>
</html>
