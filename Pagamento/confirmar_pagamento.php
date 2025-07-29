<?php
session_start();
include "../conexao.php";

$consumidor_id = $_SESSION['id_usuario'] ?? 0;
$servico_id = $_POST['servico_id'] ?? 0;

if ($consumidor_id && $servico_id) {
    // Busca o primeiro agendamento pendente disponível
    $sql = "SELECT id FROM agendamentos 
            WHERE servico_id = $servico_id 
              AND status = 'pendente' 
              AND consumidor_id IS NULL 
            ORDER BY data, hora LIMIT 1";

    $result = mysqli_query($conexao, $sql);

    if ($row = mysqli_fetch_assoc($result)) {
        $agendamento_id = $row['id'];

        // Atualiza com o consumidor e muda o status para confirmado
        $update = "UPDATE agendamentos 
                   SET consumidor_id = $consumidor_id, status = 'confirmado' 
                   WHERE id = $agendamento_id";

        if (mysqli_query($conexao, $update)) {
            header("Location: ../usuario/minhaAgenda.php?sucesso=1");
            exit;
        } else {
            echo "Erro ao confirmar agendamento.";
        }
    } else {
        echo "Nenhum horário disponível.";
    }
} else {
    echo "Dados inválidos.";
}
?>
