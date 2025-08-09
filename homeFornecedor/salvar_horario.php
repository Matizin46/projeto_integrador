<?php
// Inicia a sessão para acessar variáveis como usuario_id
session_start();

// Importa a conexão com o banco (deve expor $conexao - mysqli)
include "../conexao.php";

// Lê o id da empresa (usuário logado) da sessão; se não existir, usa 0
$empresa_id = $_SESSION['usuario_id'] ?? 0;

// Coleta os campos enviados via POST pelo formulário
$servico_id = $_POST['servico_id'];
$data       = $_POST['data'];
$hora       = $_POST['hora'];
$status     = $_POST['status'];

// === Validação básica ===
// Se faltar qualquer campo essencial, interrompe e informa erro
if (!$empresa_id || !$servico_id || !$data || !$hora || !$status) {
    echo "Dados incompletos!";
    exit;
}

// Monta o INSERT (⚠️ versão simples, concatenada — sujeita a SQL Injection se não houver controle)
$sql = "INSERT INTO agendamentos (empresa_id, servico_id, data, hora, status)
        VALUES ('$empresa_id', '$servico_id', '$data', '$hora', '$status')";

// Executa o SQL e, em caso de sucesso, redireciona para a home do fornecedor
if (mysqli_query($conexao, $sql)) {
    header("Location: ../homeFornecedor/home.php");
} else {
    // Em caso de erro, exibe a mensagem do MySQL
    echo "Erro ao salvar: " . mysqli_error($conexao);
}

// Fecha a conexão
mysqli_close($conexao);
?>
