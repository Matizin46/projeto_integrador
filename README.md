# Estetique

Estetique é um sistema web para agendamento de serviços de beleza, conectando consumidores e fornecedores (profissionais/empresas) de forma prática e intuitiva.

## Funcionalidades

- **Cadastro e Login**: Usuários podem se cadastrar como fornecedores ou consumidores e acessar o sistema.
- **Cadastro de Serviços**: Fornecedores podem cadastrar seus serviços, incluindo nome, descrição, categoria, preço e imagem.
- **Agendamento**: Consumidores visualizam serviços disponíveis, escolhem horários e realizam agendamentos.
- **Pagamento Online**: Pagamento dos serviços via cartão de crédito ou débito, com confirmação automática.
- **Gestão de Perfil**: Usuários podem editar seus dados pessoais e senha.
- **Planos para Fornecedores**: Fornecedores podem adquirir planos para impulsionar seus serviços.
- **Interface Responsiva**: Layout moderno e adaptável para diferentes dispositivos.

## Estrutura de Pastas

- `cadastro/` — Cadastro de serviços/produtos.
- `consumidor/` — Cadastro, login e funcionalidades do consumidor.
- `fornecedor/` — Cadastro, login e funcionalidades do fornecedor.
- `homeFornecedor/` — Página inicial e agendamentos do fornecedor.
- `Empresas/` — Listagem de serviços para consumidores.
- `Pagamento/` — Fluxo de pagamento e confirmação.
- `includes/` — Componentes reutilizáveis (rodapé, cabeçalho, etc).
- `assets/` — Imagens e arquivos estáticos.

## Tecnologias Utilizadas

- **Frontend**: HTML, CSS, JavaScript, Bootstrap
- **Backend**: PHP (mysqli)
- **Banco de Dados**: MySQL

## Como Executar

1. Clone o repositório para o diretório do seu servidor local (ex: `htdocs` do XAMPP).
2. Importe o banco de dados `bd_estetique` no MySQL.
3. Ajuste as configurações de conexão em [`conexao.php`](conexao.php).
4. Acesse `http://localhost/projeto_integrador/Login/login.php` no navegador.

## Créditos

Desenvolvido por Fran e colaboradores para o Projeto Integrador.

---

Para dúvidas ou sugestões, consulte o arquivo [LICENSE](LICENSE) ou entre em contato
