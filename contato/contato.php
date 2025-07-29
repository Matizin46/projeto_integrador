<link rel="stylesheet" href="contato.css"/>
<div class="form-container">
<h2>Fale com a gente</h2>
<form action="resposta.php" method="post">
<label for="nome">NOME</label>
<input type="text" id="nome" name="nome" placeholder="Seu nome completo" required>
<label for="email">E-MAIL</label>
<input type="email" id="email" name="email" placeholder="Seu email@exemplo.com" required>
<label for="mensagem">MENSAGEM</label>
<textarea id="mensagem" name="mensagem" placeholder="Digite sua mensagem..." required></textarea>
<button type="submit">Enviar</button>
</form>
<a href="../Home/home.php" class="voltar">← Voltar</a>
</div>