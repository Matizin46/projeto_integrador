<?php
// ===============================
// 1) Inicia sessão para acessar dados do usuário logado
// ===============================
session_start();

// Inclui a conexão com o banco de dados ($conexao)
require_once "../conexao.php";

// ===============================
// 2) Autenticação básica
// ===============================
// Se não existir o ID do usuário na sessão, retorna 401 (não autorizado)
if (!isset($_SESSION['usuario_id'])) {
    http_response_code(401);
    echo "Não autorizado";
    exit;
}

// ===============================
// 3) Coleta e tratamento das variáveis de entrada
// ===============================

// ID do usuário logado (inteiro)
$usuario_id = (int) $_SESSION['usuario_id'];

// Tipo de pagamento (padrão: "Crédito" se não vier do POST)
$tipo_pagamento = isset($_POST['tipo_pagamento']) 
    ? trim($_POST['tipo_pagamento']) 
    : 'Crédito';

// ID do plano contratado (padrão: 1 se não vier do POST)
$plano_id = isset($_POST['plano_id']) 
    ? (int) $_POST['plano_id'] 
    : 1;

// Valor pago fixo (20.00) - já no formato DECIMAL esperado pelo MySQL
$valorPago = 20.00;

// ===============================
// 4) Dados do cartão (apenas se o tipo de pagamento exigir)
// ===============================
// Nome impresso no cartão
$nome_cartao = isset($_POST['nome_cartao']) 
    ? trim($_POST['nome_cartao']) 
    : null;

// Número do cartão (mantendo apenas dígitos)
$numero_cartao = isset($_POST['numero_cartao']) 
    ? preg_replace('/\D+/', '', $_POST['numero_cartao']) 
    : null;

// Validade do cartão (ex.: MM/AA)
$validade_cartao = isset($_POST['validade_cartao']) 
    ? $_POST['validade_cartao'] 
    : null;

// CVV (apenas dígitos)
$cvv = isset($_POST['cvv']) 
    ? preg_replace('/\D+/', '', $_POST['cvv']) 
    : null;

// ===============================
// 5) Para fornecedor não há serviço vinculado
// ===============================
// Logo, o campo servico_id será NULL
$servico_id = null;

// ===============================
// 6) Ativa exceções para erros MySQLi (facilita o try/catch)
// ===============================
mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);

try {
    // ===============================
    // 7) Monta a query de inserção no banco
    // ===============================
    // Obs.: data_pagamento preenchida com NOW(), status_pagamento fixo "confirmado"
    $sql = "
        INSERT INTO pagamentos
            (usuario_id, servico_id, plano_id, tipo_pagamento, nome_cartao, numero_cartao, validade_cartao, cvv, data_pagamento, status_pagamento, valor_pago)
        VALUES
            (?,         NULL,       ?,        ?,             ?,           ?,            ?,              ?,   NOW(),        'confirmado',   ?)
    ";

    // ===============================
    // 8) Prepara a query
    // ===============================
    $stmt = $conexao->prepare($sql);

    // Bind de variáveis para os placeholders
    // i = int, s = string, d = double
    $stmt->bind_param(
        "iisssssd",
        $usuario_id,       // i: ID do usuário logado
        $plano_id,         // i: ID do plano
        $tipo_pagamento,   // s: tipo de pagamento (ex.: Crédito, Débito)
        $nome_cartao,      // s: nome no cartão
        $numero_cartao,    // s: número do cartão (apenas dígitos)
        $validade_cartao,  // s: validade
        $cvv,              // s: código de segurança
        $valorPago         // d: valor pago (decimal)
    );

    // Executa a query
    $stmt->execute();

    // ===============================
    // 9) Resposta de sucesso
    // ===============================
    echo "ok";

} catch (Throwable $e) {
    // ===============================
    // 10) Em caso de erro, retorna status 500 e mensagem
    // ===============================
    http_response_code(500);
    echo "Erro ao salvar pagamento: " . $e->getMessage();
}
