<?php
// Inicia a sessão para poder acessar variáveis salvas no login
session_start();

// Inclui a conexão com o banco de dados
require_once "../conexao.php";

// --- VERIFICAÇÃO DE LOGIN ---
// Se o usuário não estiver logado (não existir id na sessão), retorna erro HTTP 401 (não autorizado)
if (!isset($_SESSION['usuario_id'])) {
    http_response_code(401); // Código HTTP de não autorizado
    exit('Não autorizado'); // Encerra o script com mensagem
}

// --- RECEBENDO E VALIDANDO DADOS ---
// Pega o ID enviado via POST e garante que seja um inteiro
$id = isset($_POST['id']) ? (int)$_POST['id'] : 0;

// Pega o ID do usuário logado a partir da sessão
$usuario_id = (int) $_SESSION['usuario_id'];

// Se o ID enviado for inválido (0 ou negativo), encerra o script
if ($id <= 0) {
    exit('ID inválido');
}

// --- ATUALIZAÇÃO DO STATUS ---
// Prepara a query para atualizar o status para "cancelado"
// Apenas o consumidor que fez o agendamento pode cancelar (consumidor_id = usuário logado)
$stmt = $conexao->prepare("
    UPDATE agendamentos 
    SET status = 'cancelado' 
    WHERE id = ? AND consumidor_id = ?
");

// Faz o bind dos parâmetros (ii = ambos inteiros)
$stmt->bind_param("ii", $id, $usuario_id);

// Executa a query e retorna o resultado
if ($stmt->execute()) {
    // Se a atualização foi bem-sucedida
    echo "ok";
} else {
    // Se houve falha
    echo "Erro ao cancelar";
}
