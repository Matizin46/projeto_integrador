<?php
session_start();
require_once "../conexao.php";

if (!isset($_SESSION['usuario_id'])) {
    http_response_code(401);
    echo "Não autorizado";
    exit;
}

$usuario_id       = (int) $_SESSION['usuario_id'];
$tipo_pagamento   = isset($_POST['tipo_pagamento']) ? trim($_POST['tipo_pagamento']) : 'Crédito';
$plano_id         = isset($_POST['plano_id']) ? (int) $_POST['plano_id'] : 1;

/** Força valor fixo 20.00 para DECIMAL no MySQL */
$valorPago = 20.00;

// Dados do cartão
$nome_cartao     = isset($_POST['nome_cartao']) ? trim($_POST['nome_cartao']) : null;
$numero_cartao   = isset($_POST['numero_cartao']) ? preg_replace('/\D+/', '', $_POST['numero_cartao']) : null;
$validade_cartao = isset($_POST['validade_cartao']) ? $_POST['validade_cartao'] : null;
$cvv             = isset($_POST['cvv']) ? preg_replace('/\D+/', '', $_POST['cvv']) : null;

// Para fornecedor, não há serviço → deixamos NULL
$servico_id = null;

mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);

try {
    $sql = "
        INSERT INTO pagamentos
            (usuario_id, servico_id, plano_id, tipo_pagamento, nome_cartao, numero_cartao, validade_cartao, cvv, data_pagamento, status_pagamento, valor_pago)
        VALUES
            (?,         NULL,       ?,        ?,             ?,           ?,            ?,              ?,   NOW(),        'confirmado',   ?)
    ";

    $stmt = $conexao->prepare($sql);
    // i = int, i = int, s = string, s = string, s = string, s = string, s = string, d = double
    $stmt->bind_param(
        "iisssssd",
        $usuario_id,
        $plano_id,
        $tipo_pagamento,
        $nome_cartao,
        $numero_cartao,
        $validade_cartao,
        $cvv,
        $valorPago
    );
    $stmt->execute();

    echo "ok";
} catch (Throwable $e) {
    http_response_code(500);
    echo "Erro ao salvar pagamento: " . $e->getMessage();
}
