<?php
session_start();
include "../includes/cabecalhoconfig.php";
require_once "../conexao.php";

if (!isset($_SESSION['usuario_id'])) {
    header('Location: ../Login/login.php');
    exit;
}

$consumidorId = (int) $_SESSION['usuario_id'];

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
    LEFT JOIN usuarios e ON e.id = a.empresa_id  -- ajuste se sua tabela de empresas for outra
    WHERE a.consumidor_id = ?
    ORDER BY a.data DESC, a.hora DESC
");
$stmt->bind_param("i", $consumidorId);
$stmt->execute();
$res = $stmt->get_result();

function fmtData($d) { $dt = DateTime::createFromFormat('Y-m-d', $d); return $dt ? $dt->format('d/m/Y') : $d; }
function fmtHora($h) { return $h ? substr($h,0,5) : ''; }
?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8" />
  <title>Seus agendamentos</title>
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container py-4">
  <div class="d-flex align-items-center justify-content-between mb-3">
    <h2 class="m-0">Seus agendamentos</h2>
    <button class="btn btn-outline-secondary" onclick="history.back()">← Voltar</button>
  </div>

  <?php if ($res && $res->num_rows > 0): ?>
    <div class="row g-3">
      <?php while ($ag = $res->fetch_assoc()):
        $img = !empty($ag['imagem_url']) ? '../' . $ag['imagem_url'] : '../assets/banner_padrao.png';
        $nomeServico = htmlspecialchars($ag['nome_servico'] ?: 'Serviço', ENT_QUOTES, 'UTF-8');
        $nomeEmpresa = htmlspecialchars($ag['nome_empresa'] ?: 'Empresa', ENT_QUOTES, 'UTF-8');
        $dataBr = fmtData($ag['data']);
        $horaBr = fmtHora($ag['hora']);
        $status = htmlspecialchars(ucfirst($ag['status'] ?: 'pendente'), ENT_QUOTES, 'UTF-8');
        $isCancelado = (strtolower($ag['status']) === 'cancelado'); // não deve mais ocorrer, mas deixei pra segurança
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
    <div class="alert alert-light border text-center">Você ainda não possui agendamentos.</div>
  <?php endif; ?>
</div>

<?php include "../includes/rodape.php"; ?>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
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
