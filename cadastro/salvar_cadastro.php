<?php
session_start();
include "../conexao.php";

// --- 1) Garante empresa_id válido a partir do usuário logado ---
if (!isset($_SESSION['usuario_id'])) {
    exit("Sessão inválida. Faça login novamente.");
}
$usuario_id = (int) $_SESSION['usuario_id'];
$empresa_id = $usuario_id; // vamos tentar usar o mesmo id para a empresa

// Verifica se já existe empresa com esse ID
$stmt = $conexao->prepare("SELECT id FROM empresas WHERE id = ? LIMIT 1");
$stmt->bind_param("i", $empresa_id);
$stmt->execute();
$stmt->bind_result($idEmp);
$existeEmpresa = $stmt->fetch();
$stmt->close();

if (!$existeEmpresa) {
    // Puxa dados do usuário para preencher a empresa
    $stmtU = $conexao->prepare("SELECT nome, email, telefone FROM usuarios WHERE id = ? LIMIT 1");
    $stmtU->bind_param("i", $usuario_id);
    $stmtU->execute();
    $stmtU->bind_result($uNome, $uEmail, $uTelefone);
    $temUsuario = $stmtU->fetch();
    $stmtU->close();

    if (!$temUsuario) {
        exit("Usuário não encontrado para criar a empresa.");
    }

    // Tenta criar empresa COM o mesmo ID do usuário (mantém o vínculo 1:1)
    // Todos os campos da tabela empresas são NULLable, então podemos preencher o básico
    $usuarioSlug = preg_replace('/\s+/', '', strtolower($uNome ?? 'usuario'));
    $stmtInsEmp = $conexao->prepare("
        INSERT INTO empresas (id, nome, email, telefone, usuario, plano_id)
        VALUES (?, ?, ?, ?, ?, 1)
    ");
    $stmtInsEmp->bind_param("issss", $empresa_id, $uNome, $uEmail, $uTelefone, $usuarioSlug);

    if (!$stmtInsEmp->execute()) {
        // Se por algum motivo o ID já estiver ocupado, cria sem forçar o ID e usa o insert_id
        $stmtInsEmp->close();

        $stmtInsEmp2 = $conexao->prepare("
            INSERT INTO empresas (nome, email, telefone, usuario, plano_id)
            VALUES (?, ?, ?, ?, 1)
        ");
        $stmtInsEmp2->bind_param("ssss", $uNome, $uEmail, $uTelefone, $usuarioSlug);
        if (!$stmtInsEmp2->execute()) {
            $erro = $stmtInsEmp2->error;
            $stmtInsEmp2->close();
            exit("Falha ao criar empresa automaticamente: " . $erro);
        }
        $empresa_id = $stmtInsEmp2->insert_id; // usa o novo id da empresa
        $stmtInsEmp2->close();
    } else {
        $stmtInsEmp->close();
        // $empresa_id permanece igual ao $usuario_id
    }
}

// --- 2) Coleta dados do formulário ---
$nome      = trim($_POST['nome'] ?? "");
$descricao = trim($_POST['descricao'] ?? "");
$categoria = trim($_POST['categoria'] ?? "");
$preco     = isset($_POST['preco']) ? (float)$_POST['preco'] : 0.0;

if ($nome === "" || $descricao === "" || $categoria === "" || $preco <= 0) {
    exit("Preencha todos os campos corretamente.");
}

// --- 3) Upload da imagem ---
if (!isset($_FILES['imagem']) || $_FILES['imagem']['error'] !== UPLOAD_ERR_OK) {
    exit("Imagem não enviada.");
}

$ext = strtolower(pathinfo($_FILES['imagem']['name'], PATHINFO_EXTENSION));
$permitidas = ['jpg','jpeg','png','webp','gif'];
if (!in_array($ext, $permitidas)) {
    exit("Formato de imagem inválido. Use jpg, jpeg, png, webp ou gif.");
}

$dirPublico = "assets";
$dirDestino = realpath(__DIR__ . "/../" . $dirPublico);
if ($dirDestino === false) {
    $dirDestino = __DIR__ . "/../" . $dirPublico;
    @mkdir($dirDestino, 0775, true);
}

$arquivo = uniqid("img_", true) . "." . $ext;
$caminhoFisico = rtrim($dirDestino, "/\\") . DIRECTORY_SEPARATOR . $arquivo;

if (!move_uploaded_file($_FILES['imagem']['tmp_name'], $caminhoFisico)) {
    exit("Erro ao salvar imagem.");
}

$url_imagem = $dirPublico . "/" . $arquivo;

// --- 4) INSERT no servicos (sempre com empresa_id válido) ---
$sql = "INSERT INTO servicos (nome_servico, descricao, categoria, preco, empresa_id, imagem_url)
        VALUES (?, ?, ?, ?, ?, ?)";
$stmt = $conexao->prepare($sql);
if (!$stmt) {
    exit("Erro na preparação da query: " . $conexao->error);
}
$stmt->bind_param("sssdis", $nome, $descricao, $categoria, $preco, $empresa_id, $url_imagem);

if (!$stmt->execute()) {
    $erro = $stmt->error;
    $stmt->close();
    $conexao->close();
    exit("Erro ao salvar: " . $erro);
}

$stmt->close();
$conexao->close();

// --- 5) Redireciona ---
header("Location: ../homeFornecedor/home.php?sucesso=1");
exit;
