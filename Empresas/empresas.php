<?php
include "../conexao.php";
?>

<?php
include "../includes/cabecalhoconfig.php"
?>

<!DOCTYPE html>
<html lang="pt-br">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Estetique - Serviços</title>
  <link rel="stylesheet" href="empresas.css">
</head>

<body>

  <h2>Serviços Oferecidos</h2>

  <div class="grid" id="empresas-container">
    <?php
    $sql = "SELECT s.id AS servico_id, s.nome AS servico_nome, s.preco, s.imagem, e.nome AS empresa_nome
            FROM servicos s
            INNER JOIN empresas e ON s.empresa_id = e.id
            ORDER BY s.id ASC";
    $result = $conexao->query($sql);
    $index = 0;

    if ($result && $result->num_rows > 0) {
      while ($row = $result->fetch_assoc()) {
        $servico_id = $row['servico_id'];
        $nome_empresa = $row['empresa_nome'];
        $servico_nome = $row['servico_nome'];
        $preco = number_format($row['preco'], 2, ',', '.');
        $imagem = $row['imagem'] ?: 'https://via.placeholder.com/270x180.png?text=Imagem';

        // buscar horários disponíveis para o serviço
        $horarios_sql = "SELECT data, hora FROM agendamentos WHERE servico_id = $servico_id AND status = 'pendente'";
        $horarios_result = $conexao->query($horarios_sql);

        $horarios_html = "";
        while ($h = $horarios_result->fetch_assoc()) {
          $data = date("d/m", strtotime($h['data']));
          $hora = substr($h['hora'], 0, 5);
          $horarios_html .= "<option>{$data} às {$hora}</option>";
        }

        echo "
<div class='empresa'>
<img src='$imagem' alt='$servico_nome'>
<div class='info'>
<h3>$nome_empresa</h3>
<p>$servico_nome</p>
<p><strong>R$ $preco</strong></p>
<a href='#' class='btn' onclick='mostrarHorarios($index)'>Agendar Horário</a>
<div class='select-horario' id='horarios-$index'>
<select onchange='mostrarPagamento(this, $index)' class='btn'>
<option value=''>Escolha um horário</option>
                  $horarios_html
</select>
<div class='pagamento' id='pagamento-$index'>
<a href='../Pagamento/pagamento.php?servico_id=$servico_id' class='btn'>💳 Efetuar pagamento</a>
</div>
</div>
</div>
</div>
        ";
        $index++;
      }
    } else {
      echo "<p style='text-align:center;'>Nenhum serviço encontrado.</p>";
    }
    ?>
  </div>

  <script>
    function mostrarHorarios(index) {
      const horarioDiv = document.getElementById(`horarios-${index}`);
      horarioDiv.style.display = (horarioDiv.style.display === 'none' || horarioDiv.style.display === '') ? 'block' : 'none';
    }

    function mostrarPagamento(select, index) {
      const pagamento = document.getElementById(`pagamento-${index}`);
      pagamento.style.display = select.value !== "" ? "block" : "none";
    }
  </script>

  <?php
  include "../includes/rodape.php"
  ?>

</body>

</html>