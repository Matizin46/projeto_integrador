-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 04/07/2025 às 03:20
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bd_estetique`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `agendamentos`
--

CREATE TABLE `agendamentos` (
  `id` int(11) NOT NULL,
  `empresa_id` int(11) NOT NULL,
  `servico_id` int(11) NOT NULL,
  `consumidor_id` int(11) DEFAULT NULL,
  `data` date NOT NULL,
  `hora` time NOT NULL,
  `status` enum('pendente','confirmado','cancelado') DEFAULT 'pendente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `agendamentos`
--

INSERT INTO `agendamentos` (`id`, `empresa_id`, `servico_id`, `consumidor_id`, `data`, `hora`, `status`) VALUES
(1, 1, 1, NULL, '2025-06-28', '09:00:00', 'pendente'),
(2, 1, 1, NULL, '2025-06-29', '11:00:00', 'pendente'),
(3, 1, 1, NULL, '2025-06-30', '14:00:00', 'pendente'),
(4, 2, 2, NULL, '2025-06-28', '09:00:00', 'pendente'),
(5, 2, 2, NULL, '2025-06-29', '11:00:00', 'pendente'),
(6, 2, 2, NULL, '2025-06-30', '14:00:00', 'pendente'),
(7, 3, 3, NULL, '2025-06-28', '09:00:00', 'pendente'),
(8, 3, 3, NULL, '2025-06-29', '11:00:00', 'pendente'),
(9, 3, 3, NULL, '2025-06-30', '14:00:00', 'pendente'),
(10, 4, 4, NULL, '2025-06-28', '09:00:00', 'pendente'),
(11, 4, 4, NULL, '2025-06-29', '11:00:00', 'pendente'),
(12, 4, 4, NULL, '2025-06-30', '14:00:00', 'pendente'),
(13, 5, 5, NULL, '2025-06-28', '09:00:00', 'pendente'),
(14, 5, 5, NULL, '2025-06-29', '11:00:00', 'pendente'),
(15, 5, 5, NULL, '2025-06-30', '14:00:00', 'pendente'),
(16, 6, 6, NULL, '2025-06-28', '09:00:00', 'pendente'),
(17, 6, 6, NULL, '2025-06-29', '11:00:00', 'pendente'),
(18, 6, 6, NULL, '2025-06-30', '14:00:00', 'pendente'),
(19, 7, 7, NULL, '2025-06-28', '09:00:00', 'pendente'),
(20, 7, 7, NULL, '2025-06-29', '11:00:00', 'pendente'),
(21, 7, 7, NULL, '2025-06-30', '14:00:00', 'pendente'),
(22, 8, 8, NULL, '2025-06-28', '09:00:00', 'pendente'),
(23, 8, 8, NULL, '2025-06-29', '11:00:00', 'pendente'),
(24, 8, 8, NULL, '2025-06-30', '14:00:00', 'pendente'),
(25, 9, 9, NULL, '2025-06-28', '09:00:00', 'pendente'),
(26, 9, 9, NULL, '2025-06-29', '11:00:00', 'pendente'),
(27, 9, 9, NULL, '2025-06-30', '14:00:00', 'pendente'),
(28, 10, 10, NULL, '2025-06-28', '09:00:00', 'pendente'),
(29, 10, 10, NULL, '2025-06-29', '11:00:00', 'pendente'),
(30, 10, 10, NULL, '2025-06-30', '14:00:00', 'pendente'),
(31, 11, 11, NULL, '2025-06-28', '09:00:00', 'pendente'),
(32, 11, 11, NULL, '2025-06-29', '11:00:00', 'pendente'),
(33, 11, 11, NULL, '2025-06-30', '14:00:00', 'pendente'),
(34, 12, 12, NULL, '2025-06-28', '09:00:00', 'pendente'),
(35, 12, 12, NULL, '2025-06-29', '11:00:00', 'pendente'),
(36, 12, 12, NULL, '2025-06-30', '14:00:00', 'pendente');

-- --------------------------------------------------------

--
-- Estrutura para tabela `configuracoes_empresa`
--

CREATE TABLE `configuracoes_empresa` (
  `id` int(11) NOT NULL,
  `empresa_id` int(11) DEFAULT NULL,
  `cor_tema` varchar(20) DEFAULT NULL,
  `horario_abertura` time DEFAULT NULL,
  `horario_fechamento` time DEFAULT NULL,
  `dias_funcionamento` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `consumidores`
--

CREATE TABLE `consumidores` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `cpf` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `senha` varchar(100) DEFAULT NULL,
  `endereco` text DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `empresas`
--

CREATE TABLE `empresas` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `cnpj` varchar(20) DEFAULT NULL,
  `endereco` text DEFAULT NULL,
  `usuario` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `senha` varchar(100) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `plano_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `empresas`
--

INSERT INTO `empresas` (`id`, `nome`, `cnpj`, `endereco`, `usuario`, `email`, `telefone`, `senha`, `logo`, `plano_id`) VALUES
(1, 'Beleza Pura', '12.345.678/0001-00', 'Rua A, 123', 'beleza123', 'contato@belezapura.com', '11999999999', 'senha123', 'logos/empresa1.png', 1),
(2, 'Studio Vip', '98.765.432/0001-11', 'Av B, 456', 'studiovip', 'contato@studiovip.com', '11988888888', 'senha123', 'logos/empresa2.png', 2),
(3, 'Top Estilo', '45.678.910/0001-22', 'Rua C, 789', 'topestilo', 'contato@topestilo.com', '11977777777', 'senha123', 'logos/empresa3.png', 3),
(4, 'Barber King', '23.456.789/0001-33', 'Av D, 321', 'barberking', 'contato@barberking.com', '11966666666', 'senha123', 'logos/empresa4.png', 2),
(5, 'Espaço Mulher', '67.890.123/0001-44', 'Rua E, 654', 'espacomulher', 'contato@espacomulher.com', '11955555555', 'senha123', 'logos/empresa5.png', 1),
(6, 'ManiCure', '89.012.345/0001-55', 'Av F, 987', 'manicure', 'contato@manicure.com', '11944444444', 'senha123', 'logos/empresa6.png', 3),
(7, 'Depilação & Cia', '11.223.344/0001-66', 'Rua G, 147', 'sobrancelhaecia', 'contato@sobrancelhaecia.com', '11933333333', 'senha123', 'logos/empresa7.png', 1),
(8, 'Clínica Skin', '22.334.455/0001-77', 'Av H, 258', 'clinicaskin', 'contato@clinicaskin.com', '11922222222', 'senha123', 'logos/empresa8.png', 3),
(9, 'Glow Studio', '33.445.566/0001-88', 'Rua I, 369', 'glowstudio', 'contato@glowstudio.com', '11911111111', 'senha123', 'logos/empresa9.png', 2),
(10, 'Lash Design', '44.556.677/0001-99', 'Av J, 741', 'lashdesign', 'contato@lashdesign.com', '11900000000', 'senha123', 'logos/empresa10.png', 2),
(11, 'Spa da Beleza', '55.667.788/0001-00', 'Rua K, 852', 'spabeleza', 'contato@spabeleza.com', '11912345678', 'senha123', 'logos/empresa11.png', 1),
(12, 'Cabelo & Arte', '66.778.899/0001-11', 'Av L, 963', 'cabeloearte', 'contato@cabeloearte.com', '11987654321', 'senha123', 'logos/empresa12.png', 3);

-- --------------------------------------------------------

--
-- Estrutura para tabela `planos`
--

CREATE TABLE `planos` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `preco` decimal(10,2) DEFAULT NULL,
  `descricao` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `planos`
--

INSERT INTO `planos` (`id`, `nome`, `preco`, `descricao`) VALUES
(1, 'BÁSICO', 10.00, '10 Chats simultâneos, Sem impulso de loja, Sem banner no perfil, 4 fotos por anúncio, Taxa de 20% em pagamentos'),
(2, 'AVANÇADO', 30.00, '30 Chats simultâneos, Impulso de loja 20%, 1 banner de perfil, 10 fotos por anúncio, Taxa de 15% em pagamentos'),
(3, 'PREMIUM', 50.00, 'Chats ilimitados, Impulso máximo, 5 banners de perfil, Anúncio 100% personalizado, Taxa de 10% em pagamentos');

-- --------------------------------------------------------

--
-- Estrutura para tabela `servicos`
--

CREATE TABLE `servicos` (
  `id` int(11) NOT NULL,
  `empresa_id` int(11) DEFAULT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `descricao` text DEFAULT NULL,
  `categoria` varchar(50) DEFAULT NULL,
  `preco` decimal(10,2) DEFAULT NULL,
  `duracao_minutos` int(11) DEFAULT NULL,
  `imagem` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `servicos`
--

INSERT INTO `servicos` (`id`, `empresa_id`, `nome`, `descricao`, `categoria`, `preco`, `duracao_minutos`, `imagem`) VALUES
(1, 1, 'Corte Feminino', 'Corte moderno e alinhado à tendência', 'Cabelo', 60.00, 45, 'https://i.pinimg.com/736x/93/fb/77/93fb77ce5524a6b275c0fa5071714dde.jpg'),
(2, 2, 'Manicure Completa', 'Limpeza, esmaltação e hidratação', 'Unha', 40.00, 30, 'https://i.pinimg.com/736x/bf/de/05/bfde050b5365e633646c1fbf8430f3ea.jpg'),
(3, 3, 'Design de Sobrancelha', 'Com pinça e henna', 'Sobrancelha', 35.00, 25, 'https://desassossegada.com.br/wp-content/uploads/2021/08/o-que-e-o-design-de-sobrancelha.jpg'),
(4, 4, 'Barba e Corte', 'Combo completo masculino', 'Barbearia', 70.00, 50, 'https://i.pinimg.com/originals/74/3a/10/743a107ffdb0212c3a3c80718f9ef242.jpg'),
(5, 5, 'Limpeza de Pele', 'Profunda, com produtos naturais', 'Pele', 90.00, 60, 'https://th.bing.com/th/id/R.8df0d77ad6b5022a6dec55cce6f69b3a?rik=g2Hu1wO6SO7ElA&pid=ImgRaw&r=0'),
(6, 6, 'Alongamento de Unha', 'Gel, fibra ou acrílico', 'Unha', 120.00, 90, 'https://th.bing.com/th/id/OIP.epXcWuUq_Lyx_gc_a0Ww1gHaIo?o=7rm=3&rs=1&pid=ImgDetMain&o=7&rm=3'),
(7, 7, 'Depilação Íntima', 'Cera quente e fria', 'Depilação', 55.00, 40, 'https://tse1.explicit.bing.net/th/id/OIP.Vrw3qVMtl9V5zCqmD2hulQHaE8?rs=1&pid=ImgDetMain&o=7&rm=3'),
(8, 8, 'Peeling Químico', 'Clareamento de manchas', 'Pele', 130.00, 50, 'https://tse1.explicit.bing.net/th/id/OIP.ZE7CpYjetjFmILu9BSTPZAHaE8?rs=1&pid=ImgDetMain&o=7&rm=3'),
(9, 9, 'Micropigmentação', 'Sobrancelhas fio a fio', 'Sobrancelha', 200.00, 90, 'https://tse4.mm.bing.net/th/id/OIP.YpeixOrjAiNrKmLxcEMIqwHaDt?rs=1&pid=ImgDetMain&o=7&rm=3'),
(10, 10, 'Lash Lifting', 'Curvatura natural dos cílios', 'Olhos', 80.00, 45, 'https://tse1.explicit.bing.net/th/id/OIP.y9luJO-5EYEYHyO-oODopAHaHa?rs=1&pid=ImgDetMain&o=7&rm=3'),
(11, 11, 'Hidratação Capilar', 'Nutrição com queratina', 'Cabelo', 70.00, 40, 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjXeUmJNBQZkcRZsGNIj11aC8NdKaAxuwxJPtA43_oUdTd6KnDh03RBb_LRB29reBoWCvkoWi5tBlGyHyxAPcYUjNNQgKDbsqo07EwptJ-0R0pHcpRTLmAHvakJ2t0CvIFNt7VLcgGGk68qDxPHaB1Pw_rxbl4NGFWW_FWqdYEuxYBQZQY43Hql-GhrRA/s660/of'),
(12, 12, 'Corte Masculino', 'Estilo degradê', 'Cabelo', 45.00, 30, 'https://blog.cuecastore.com.br/wp-content/uploads/2020/09/cabelo.jpg');

-- --------------------------------------------------------

--
-- Estrutura para tabela `wp_commentmeta`
--

CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `comment_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `wp_comments`
--

CREATE TABLE `wp_comments` (
  `comment_ID` bigint(20) UNSIGNED NOT NULL,
  `comment_post_ID` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `comment_author` tinytext NOT NULL,
  `comment_author_email` varchar(100) NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT 0,
  `comment_approved` varchar(20) NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) NOT NULL DEFAULT '',
  `comment_type` varchar(20) NOT NULL DEFAULT 'comment',
  `comment_parent` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `wp_links`
--

CREATE TABLE `wp_links` (
  `link_id` bigint(20) UNSIGNED NOT NULL,
  `link_url` varchar(255) NOT NULL DEFAULT '',
  `link_name` varchar(255) NOT NULL DEFAULT '',
  `link_image` varchar(255) NOT NULL DEFAULT '',
  `link_target` varchar(25) NOT NULL DEFAULT '',
  `link_description` varchar(255) NOT NULL DEFAULT '',
  `link_visible` varchar(20) NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `link_rating` int(11) NOT NULL DEFAULT 0,
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) NOT NULL DEFAULT '',
  `link_notes` mediumtext NOT NULL,
  `link_rss` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `wp_options`
--

CREATE TABLE `wp_options` (
  `option_id` bigint(20) UNSIGNED NOT NULL,
  `option_name` varchar(191) NOT NULL DEFAULT '',
  `option_value` longtext NOT NULL,
  `autoload` varchar(20) NOT NULL DEFAULT 'yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Despejando dados para a tabela `wp_options`
--

INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'cron', 'a:9:{i:1750201276;a:2:{s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}s:32:\"recovery_mode_clean_expired_keys\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1750202264;a:3:{s:21:\"wp_update_user_counts\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1750202269;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1750204875;a:1:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1750206675;a:1:{s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1750208475;a:1:{s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1750289002;a:1:{s:30:\"wp_delete_temp_updater_backups\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}}i:1750374076;a:1:{s:30:\"wp_site_health_scheduled_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}}s:7:\"version\";i:2;}', 'on'),
(2, 'siteurl', 'http://localhost/blog-Estetique', 'on'),
(3, 'home', 'http://localhost/blog-Estetique', 'on'),
(4, 'blogname', 'Blog Estetique', 'on'),
(5, 'blogdescription', 'Estética', 'on'),
(6, 'users_can_register', '0', 'on'),
(7, 'admin_email', 'paesmatheus665@gmail.com', 'on'),
(8, 'start_of_week', '1', 'on'),
(9, 'use_balanceTags', '0', 'on'),
(10, 'use_smilies', '1', 'on'),
(11, 'require_name_email', '1', 'on'),
(12, 'comments_notify', '1', 'on'),
(13, 'posts_per_rss', '10', 'on'),
(14, 'rss_use_excerpt', '0', 'on'),
(15, 'mailserver_url', 'mail.example.com', 'on'),
(16, 'mailserver_login', 'login@example.com', 'on'),
(17, 'mailserver_pass', '', 'on'),
(18, 'mailserver_port', '110', 'on'),
(19, 'default_category', '1', 'on'),
(20, 'default_comment_status', 'open', 'on'),
(21, 'default_ping_status', 'open', 'on'),
(22, 'default_pingback_flag', '1', 'on'),
(23, 'posts_per_page', '10', 'on'),
(24, 'date_format', 'j \\d\\e F \\d\\e Y', 'on'),
(25, 'time_format', 'H:i', 'on'),
(26, 'links_updated_date_format', 'j \\d\\e F \\d\\e Y, H:i', 'on'),
(27, 'comment_moderation', '0', 'on'),
(28, 'moderation_notify', '1', 'on'),
(29, 'permalink_structure', '/%year%/%monthnum%/%day%/%postname%/', 'on'),
(30, 'rewrite_rules', 'a:94:{s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:21:\"^index.php/wp-json/?$\";s:22:\"index.php?rest_route=/\";s:24:\"^index.php/wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:17:\"^wp-sitemap\\.xml$\";s:23:\"index.php?sitemap=index\";s:17:\"^wp-sitemap\\.xsl$\";s:36:\"index.php?sitemap-stylesheet=sitemap\";s:23:\"^wp-sitemap-index\\.xsl$\";s:34:\"index.php?sitemap-stylesheet=index\";s:48:\"^wp-sitemap-([a-z]+?)-([a-z\\d_-]+?)-(\\d+?)\\.xml$\";s:75:\"index.php?sitemap=$matches[1]&sitemap-subtype=$matches[2]&paged=$matches[3]\";s:34:\"^wp-sitemap-([a-z]+?)-(\\d+?)\\.xml$\";s:47:\"index.php?sitemap=$matches[1]&paged=$matches[2]\";s:47:\"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:42:\"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:23:\"category/(.+?)/embed/?$\";s:46:\"index.php?category_name=$matches[1]&embed=true\";s:35:\"category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:17:\"category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:20:\"tag/([^/]+)/embed/?$\";s:36:\"index.php?tag=$matches[1]&embed=true\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:45:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:40:\"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:21:\"type/([^/]+)/embed/?$\";s:44:\"index.php?post_format=$matches[1]&embed=true\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:8:\"embed/?$\";s:21:\"index.php?&embed=true\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:17:\"comments/embed/?$\";s:21:\"index.php?&embed=true\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:20:\"search/(.+)/embed/?$\";s:34:\"index.php?s=$matches[1]&embed=true\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:23:\"author/([^/]+)/embed/?$\";s:44:\"index.php?author_name=$matches[1]&embed=true\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:17:\"author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:45:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:74:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:32:\"([0-9]{4})/([0-9]{1,2})/embed/?$\";s:58:\"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:19:\"([0-9]{4})/embed/?$\";s:37:\"index.php?year=$matches[1]&embed=true\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:58:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:68:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:88:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:83:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:83:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:64:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:53:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/embed/?$\";s:91:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/trackback/?$\";s:85:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&tb=1\";s:77:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:72:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:65:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/page/?([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&paged=$matches[5]\";s:72:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/comment-page-([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&cpage=$matches[5]\";s:61:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)(?:/([0-9]+))?/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&page=$matches[5]\";s:47:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:57:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:77:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:72:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:72:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:53:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&cpage=$matches[4]\";s:51:\"([0-9]{4})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&cpage=$matches[3]\";s:38:\"([0-9]{4})/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&cpage=$matches[2]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\".?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:24:\"(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";}', 'on'),
(31, 'hack_file', '0', 'on'),
(32, 'blog_charset', 'UTF-8', 'on'),
(33, 'moderation_keys', '', 'off'),
(34, 'active_plugins', 'a:0:{}', 'on'),
(35, 'category_base', '', 'on'),
(36, 'ping_sites', 'http://rpc.pingomatic.com/', 'on'),
(37, 'comment_max_links', '2', 'on'),
(38, 'gmt_offset', '', 'on'),
(39, 'default_email_category', '1', 'on'),
(40, 'recently_edited', '', 'off'),
(41, 'template', 'twentytwentyfive', 'on'),
(42, 'stylesheet', 'twentytwentyfive', 'on'),
(43, 'comment_registration', '0', 'on'),
(44, 'html_type', 'text/html', 'on'),
(45, 'use_trackback', '0', 'on'),
(46, 'default_role', 'subscriber', 'on'),
(47, 'db_version', '58975', 'on'),
(48, 'uploads_use_yearmonth_folders', '1', 'on'),
(49, 'upload_path', '', 'on'),
(50, 'blog_public', '1', 'on'),
(51, 'default_link_category', '2', 'on'),
(52, 'show_on_front', 'page', 'on'),
(53, 'tag_base', '', 'on'),
(54, 'show_avatars', '1', 'on'),
(55, 'avatar_rating', 'G', 'on'),
(56, 'upload_url_path', '', 'on'),
(57, 'thumbnail_size_w', '150', 'on'),
(58, 'thumbnail_size_h', '150', 'on'),
(59, 'thumbnail_crop', '1', 'on'),
(60, 'medium_size_w', '300', 'on'),
(61, 'medium_size_h', '300', 'on'),
(62, 'avatar_default', 'mystery', 'on'),
(63, 'large_size_w', '1024', 'on'),
(64, 'large_size_h', '1024', 'on'),
(65, 'image_default_link_type', 'none', 'on'),
(66, 'image_default_size', '', 'on'),
(67, 'image_default_align', '', 'on'),
(68, 'close_comments_for_old_posts', '0', 'on'),
(69, 'close_comments_days_old', '14', 'on'),
(70, 'thread_comments', '1', 'on'),
(71, 'thread_comments_depth', '5', 'on'),
(72, 'page_comments', '0', 'on'),
(73, 'comments_per_page', '50', 'on'),
(74, 'default_comments_page', 'newest', 'on'),
(75, 'comment_order', 'asc', 'on'),
(76, 'sticky_posts', 'a:0:{}', 'on'),
(77, 'widget_categories', 'a:0:{}', 'on'),
(78, 'widget_text', 'a:0:{}', 'on'),
(79, 'widget_rss', 'a:0:{}', 'on'),
(80, 'uninstall_plugins', 'a:0:{}', 'off'),
(81, 'timezone_string', 'America/Sao_Paulo', 'on'),
(82, 'page_for_posts', '35', 'on'),
(83, 'page_on_front', '24', 'on'),
(84, 'default_post_format', '0', 'on'),
(85, 'link_manager_enabled', '0', 'on'),
(86, 'finished_splitting_shared_terms', '1', 'on'),
(87, 'site_icon', '6', 'on'),
(88, 'medium_large_size_w', '768', 'on'),
(89, 'medium_large_size_h', '0', 'on'),
(90, 'wp_page_for_privacy_policy', '3', 'on'),
(91, 'show_comments_cookies_opt_in', '1', 'on'),
(92, 'admin_email_lifespan', '1761606075', 'on'),
(93, 'disallowed_keys', '', 'off'),
(94, 'comment_previously_approved', '1', 'on'),
(95, 'auto_plugin_theme_update_emails', 'a:0:{}', 'off'),
(96, 'auto_update_core_dev', 'enabled', 'on'),
(97, 'auto_update_core_minor', 'enabled', 'on'),
(98, 'auto_update_core_major', 'enabled', 'on'),
(99, 'wp_force_deactivated_plugins', 'a:0:{}', 'on'),
(100, 'wp_attachment_pages_enabled', '0', 'on'),
(101, 'initial_db_version', '58975', 'on'),
(102, 'wp_user_roles', 'a:5:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:61:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}}', 'on'),
(103, 'fresh_site', '0', 'off'),
(104, 'WPLANG', 'pt_BR', 'auto'),
(105, 'user_count', '1', 'off'),
(106, 'widget_block', 'a:6:{i:2;a:1:{s:7:\"content\";s:19:\"<!-- wp:search /-->\";}i:3;a:1:{s:7:\"content\";s:156:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Posts recentes</h2><!-- /wp:heading --><!-- wp:latest-posts /--></div><!-- /wp:group -->\";}i:4;a:1:{s:7:\"content\";s:224:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Comentários</h2><!-- /wp:heading --><!-- wp:latest-comments {\"displayAvatar\":false,\"displayDate\":false,\"displayExcerpt\":false} /--></div><!-- /wp:group -->\";}i:5;a:1:{s:7:\"content\";s:146:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Arquivos</h2><!-- /wp:heading --><!-- wp:archives /--></div><!-- /wp:group -->\";}i:6;a:1:{s:7:\"content\";s:150:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Categorias</h2><!-- /wp:heading --><!-- wp:categories /--></div><!-- /wp:group -->\";}s:12:\"_multiwidget\";i:1;}', 'auto'),
(107, 'sidebars_widgets', 'a:4:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:3:{i:0;s:7:\"block-2\";i:1;s:7:\"block-3\";i:2;s:7:\"block-4\";}s:9:\"sidebar-2\";a:2:{i:0;s:7:\"block-5\";i:1;s:7:\"block-6\";}s:13:\"array_version\";i:3;}', 'auto'),
(108, 'widget_pages', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto'),
(109, 'widget_calendar', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto'),
(110, 'widget_archives', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto'),
(111, 'widget_media_audio', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto'),
(112, 'widget_media_image', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto'),
(113, 'widget_media_gallery', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto'),
(114, 'widget_media_video', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto'),
(115, 'widget_meta', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto'),
(116, 'widget_search', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto'),
(117, 'widget_recent-posts', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto'),
(118, 'widget_recent-comments', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto'),
(119, 'widget_tag_cloud', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto'),
(120, 'widget_nav_menu', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto'),
(121, 'widget_custom_html', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto'),
(122, '_transient_wp_core_block_css_files', 'a:2:{s:7:\"version\";s:5:\"6.8.1\";s:5:\"files\";a:536:{i:0;s:23:\"archives/editor-rtl.css\";i:1;s:27:\"archives/editor-rtl.min.css\";i:2;s:19:\"archives/editor.css\";i:3;s:23:\"archives/editor.min.css\";i:4;s:22:\"archives/style-rtl.css\";i:5;s:26:\"archives/style-rtl.min.css\";i:6;s:18:\"archives/style.css\";i:7;s:22:\"archives/style.min.css\";i:8;s:20:\"audio/editor-rtl.css\";i:9;s:24:\"audio/editor-rtl.min.css\";i:10;s:16:\"audio/editor.css\";i:11;s:20:\"audio/editor.min.css\";i:12;s:19:\"audio/style-rtl.css\";i:13;s:23:\"audio/style-rtl.min.css\";i:14;s:15:\"audio/style.css\";i:15;s:19:\"audio/style.min.css\";i:16;s:19:\"audio/theme-rtl.css\";i:17;s:23:\"audio/theme-rtl.min.css\";i:18;s:15:\"audio/theme.css\";i:19;s:19:\"audio/theme.min.css\";i:20;s:21:\"avatar/editor-rtl.css\";i:21;s:25:\"avatar/editor-rtl.min.css\";i:22;s:17:\"avatar/editor.css\";i:23;s:21:\"avatar/editor.min.css\";i:24;s:20:\"avatar/style-rtl.css\";i:25;s:24:\"avatar/style-rtl.min.css\";i:26;s:16:\"avatar/style.css\";i:27;s:20:\"avatar/style.min.css\";i:28;s:21:\"button/editor-rtl.css\";i:29;s:25:\"button/editor-rtl.min.css\";i:30;s:17:\"button/editor.css\";i:31;s:21:\"button/editor.min.css\";i:32;s:20:\"button/style-rtl.css\";i:33;s:24:\"button/style-rtl.min.css\";i:34;s:16:\"button/style.css\";i:35;s:20:\"button/style.min.css\";i:36;s:22:\"buttons/editor-rtl.css\";i:37;s:26:\"buttons/editor-rtl.min.css\";i:38;s:18:\"buttons/editor.css\";i:39;s:22:\"buttons/editor.min.css\";i:40;s:21:\"buttons/style-rtl.css\";i:41;s:25:\"buttons/style-rtl.min.css\";i:42;s:17:\"buttons/style.css\";i:43;s:21:\"buttons/style.min.css\";i:44;s:22:\"calendar/style-rtl.css\";i:45;s:26:\"calendar/style-rtl.min.css\";i:46;s:18:\"calendar/style.css\";i:47;s:22:\"calendar/style.min.css\";i:48;s:25:\"categories/editor-rtl.css\";i:49;s:29:\"categories/editor-rtl.min.css\";i:50;s:21:\"categories/editor.css\";i:51;s:25:\"categories/editor.min.css\";i:52;s:24:\"categories/style-rtl.css\";i:53;s:28:\"categories/style-rtl.min.css\";i:54;s:20:\"categories/style.css\";i:55;s:24:\"categories/style.min.css\";i:56;s:19:\"code/editor-rtl.css\";i:57;s:23:\"code/editor-rtl.min.css\";i:58;s:15:\"code/editor.css\";i:59;s:19:\"code/editor.min.css\";i:60;s:18:\"code/style-rtl.css\";i:61;s:22:\"code/style-rtl.min.css\";i:62;s:14:\"code/style.css\";i:63;s:18:\"code/style.min.css\";i:64;s:18:\"code/theme-rtl.css\";i:65;s:22:\"code/theme-rtl.min.css\";i:66;s:14:\"code/theme.css\";i:67;s:18:\"code/theme.min.css\";i:68;s:22:\"columns/editor-rtl.css\";i:69;s:26:\"columns/editor-rtl.min.css\";i:70;s:18:\"columns/editor.css\";i:71;s:22:\"columns/editor.min.css\";i:72;s:21:\"columns/style-rtl.css\";i:73;s:25:\"columns/style-rtl.min.css\";i:74;s:17:\"columns/style.css\";i:75;s:21:\"columns/style.min.css\";i:76;s:33:\"comment-author-name/style-rtl.css\";i:77;s:37:\"comment-author-name/style-rtl.min.css\";i:78;s:29:\"comment-author-name/style.css\";i:79;s:33:\"comment-author-name/style.min.css\";i:80;s:29:\"comment-content/style-rtl.css\";i:81;s:33:\"comment-content/style-rtl.min.css\";i:82;s:25:\"comment-content/style.css\";i:83;s:29:\"comment-content/style.min.css\";i:84;s:26:\"comment-date/style-rtl.css\";i:85;s:30:\"comment-date/style-rtl.min.css\";i:86;s:22:\"comment-date/style.css\";i:87;s:26:\"comment-date/style.min.css\";i:88;s:31:\"comment-edit-link/style-rtl.css\";i:89;s:35:\"comment-edit-link/style-rtl.min.css\";i:90;s:27:\"comment-edit-link/style.css\";i:91;s:31:\"comment-edit-link/style.min.css\";i:92;s:32:\"comment-reply-link/style-rtl.css\";i:93;s:36:\"comment-reply-link/style-rtl.min.css\";i:94;s:28:\"comment-reply-link/style.css\";i:95;s:32:\"comment-reply-link/style.min.css\";i:96;s:30:\"comment-template/style-rtl.css\";i:97;s:34:\"comment-template/style-rtl.min.css\";i:98;s:26:\"comment-template/style.css\";i:99;s:30:\"comment-template/style.min.css\";i:100;s:42:\"comments-pagination-numbers/editor-rtl.css\";i:101;s:46:\"comments-pagination-numbers/editor-rtl.min.css\";i:102;s:38:\"comments-pagination-numbers/editor.css\";i:103;s:42:\"comments-pagination-numbers/editor.min.css\";i:104;s:34:\"comments-pagination/editor-rtl.css\";i:105;s:38:\"comments-pagination/editor-rtl.min.css\";i:106;s:30:\"comments-pagination/editor.css\";i:107;s:34:\"comments-pagination/editor.min.css\";i:108;s:33:\"comments-pagination/style-rtl.css\";i:109;s:37:\"comments-pagination/style-rtl.min.css\";i:110;s:29:\"comments-pagination/style.css\";i:111;s:33:\"comments-pagination/style.min.css\";i:112;s:29:\"comments-title/editor-rtl.css\";i:113;s:33:\"comments-title/editor-rtl.min.css\";i:114;s:25:\"comments-title/editor.css\";i:115;s:29:\"comments-title/editor.min.css\";i:116;s:23:\"comments/editor-rtl.css\";i:117;s:27:\"comments/editor-rtl.min.css\";i:118;s:19:\"comments/editor.css\";i:119;s:23:\"comments/editor.min.css\";i:120;s:22:\"comments/style-rtl.css\";i:121;s:26:\"comments/style-rtl.min.css\";i:122;s:18:\"comments/style.css\";i:123;s:22:\"comments/style.min.css\";i:124;s:20:\"cover/editor-rtl.css\";i:125;s:24:\"cover/editor-rtl.min.css\";i:126;s:16:\"cover/editor.css\";i:127;s:20:\"cover/editor.min.css\";i:128;s:19:\"cover/style-rtl.css\";i:129;s:23:\"cover/style-rtl.min.css\";i:130;s:15:\"cover/style.css\";i:131;s:19:\"cover/style.min.css\";i:132;s:22:\"details/editor-rtl.css\";i:133;s:26:\"details/editor-rtl.min.css\";i:134;s:18:\"details/editor.css\";i:135;s:22:\"details/editor.min.css\";i:136;s:21:\"details/style-rtl.css\";i:137;s:25:\"details/style-rtl.min.css\";i:138;s:17:\"details/style.css\";i:139;s:21:\"details/style.min.css\";i:140;s:20:\"embed/editor-rtl.css\";i:141;s:24:\"embed/editor-rtl.min.css\";i:142;s:16:\"embed/editor.css\";i:143;s:20:\"embed/editor.min.css\";i:144;s:19:\"embed/style-rtl.css\";i:145;s:23:\"embed/style-rtl.min.css\";i:146;s:15:\"embed/style.css\";i:147;s:19:\"embed/style.min.css\";i:148;s:19:\"embed/theme-rtl.css\";i:149;s:23:\"embed/theme-rtl.min.css\";i:150;s:15:\"embed/theme.css\";i:151;s:19:\"embed/theme.min.css\";i:152;s:19:\"file/editor-rtl.css\";i:153;s:23:\"file/editor-rtl.min.css\";i:154;s:15:\"file/editor.css\";i:155;s:19:\"file/editor.min.css\";i:156;s:18:\"file/style-rtl.css\";i:157;s:22:\"file/style-rtl.min.css\";i:158;s:14:\"file/style.css\";i:159;s:18:\"file/style.min.css\";i:160;s:23:\"footnotes/style-rtl.css\";i:161;s:27:\"footnotes/style-rtl.min.css\";i:162;s:19:\"footnotes/style.css\";i:163;s:23:\"footnotes/style.min.css\";i:164;s:23:\"freeform/editor-rtl.css\";i:165;s:27:\"freeform/editor-rtl.min.css\";i:166;s:19:\"freeform/editor.css\";i:167;s:23:\"freeform/editor.min.css\";i:168;s:22:\"gallery/editor-rtl.css\";i:169;s:26:\"gallery/editor-rtl.min.css\";i:170;s:18:\"gallery/editor.css\";i:171;s:22:\"gallery/editor.min.css\";i:172;s:21:\"gallery/style-rtl.css\";i:173;s:25:\"gallery/style-rtl.min.css\";i:174;s:17:\"gallery/style.css\";i:175;s:21:\"gallery/style.min.css\";i:176;s:21:\"gallery/theme-rtl.css\";i:177;s:25:\"gallery/theme-rtl.min.css\";i:178;s:17:\"gallery/theme.css\";i:179;s:21:\"gallery/theme.min.css\";i:180;s:20:\"group/editor-rtl.css\";i:181;s:24:\"group/editor-rtl.min.css\";i:182;s:16:\"group/editor.css\";i:183;s:20:\"group/editor.min.css\";i:184;s:19:\"group/style-rtl.css\";i:185;s:23:\"group/style-rtl.min.css\";i:186;s:15:\"group/style.css\";i:187;s:19:\"group/style.min.css\";i:188;s:19:\"group/theme-rtl.css\";i:189;s:23:\"group/theme-rtl.min.css\";i:190;s:15:\"group/theme.css\";i:191;s:19:\"group/theme.min.css\";i:192;s:21:\"heading/style-rtl.css\";i:193;s:25:\"heading/style-rtl.min.css\";i:194;s:17:\"heading/style.css\";i:195;s:21:\"heading/style.min.css\";i:196;s:19:\"html/editor-rtl.css\";i:197;s:23:\"html/editor-rtl.min.css\";i:198;s:15:\"html/editor.css\";i:199;s:19:\"html/editor.min.css\";i:200;s:20:\"image/editor-rtl.css\";i:201;s:24:\"image/editor-rtl.min.css\";i:202;s:16:\"image/editor.css\";i:203;s:20:\"image/editor.min.css\";i:204;s:19:\"image/style-rtl.css\";i:205;s:23:\"image/style-rtl.min.css\";i:206;s:15:\"image/style.css\";i:207;s:19:\"image/style.min.css\";i:208;s:19:\"image/theme-rtl.css\";i:209;s:23:\"image/theme-rtl.min.css\";i:210;s:15:\"image/theme.css\";i:211;s:19:\"image/theme.min.css\";i:212;s:29:\"latest-comments/style-rtl.css\";i:213;s:33:\"latest-comments/style-rtl.min.css\";i:214;s:25:\"latest-comments/style.css\";i:215;s:29:\"latest-comments/style.min.css\";i:216;s:27:\"latest-posts/editor-rtl.css\";i:217;s:31:\"latest-posts/editor-rtl.min.css\";i:218;s:23:\"latest-posts/editor.css\";i:219;s:27:\"latest-posts/editor.min.css\";i:220;s:26:\"latest-posts/style-rtl.css\";i:221;s:30:\"latest-posts/style-rtl.min.css\";i:222;s:22:\"latest-posts/style.css\";i:223;s:26:\"latest-posts/style.min.css\";i:224;s:18:\"list/style-rtl.css\";i:225;s:22:\"list/style-rtl.min.css\";i:226;s:14:\"list/style.css\";i:227;s:18:\"list/style.min.css\";i:228;s:22:\"loginout/style-rtl.css\";i:229;s:26:\"loginout/style-rtl.min.css\";i:230;s:18:\"loginout/style.css\";i:231;s:22:\"loginout/style.min.css\";i:232;s:25:\"media-text/editor-rtl.css\";i:233;s:29:\"media-text/editor-rtl.min.css\";i:234;s:21:\"media-text/editor.css\";i:235;s:25:\"media-text/editor.min.css\";i:236;s:24:\"media-text/style-rtl.css\";i:237;s:28:\"media-text/style-rtl.min.css\";i:238;s:20:\"media-text/style.css\";i:239;s:24:\"media-text/style.min.css\";i:240;s:19:\"more/editor-rtl.css\";i:241;s:23:\"more/editor-rtl.min.css\";i:242;s:15:\"more/editor.css\";i:243;s:19:\"more/editor.min.css\";i:244;s:30:\"navigation-link/editor-rtl.css\";i:245;s:34:\"navigation-link/editor-rtl.min.css\";i:246;s:26:\"navigation-link/editor.css\";i:247;s:30:\"navigation-link/editor.min.css\";i:248;s:29:\"navigation-link/style-rtl.css\";i:249;s:33:\"navigation-link/style-rtl.min.css\";i:250;s:25:\"navigation-link/style.css\";i:251;s:29:\"navigation-link/style.min.css\";i:252;s:33:\"navigation-submenu/editor-rtl.css\";i:253;s:37:\"navigation-submenu/editor-rtl.min.css\";i:254;s:29:\"navigation-submenu/editor.css\";i:255;s:33:\"navigation-submenu/editor.min.css\";i:256;s:25:\"navigation/editor-rtl.css\";i:257;s:29:\"navigation/editor-rtl.min.css\";i:258;s:21:\"navigation/editor.css\";i:259;s:25:\"navigation/editor.min.css\";i:260;s:24:\"navigation/style-rtl.css\";i:261;s:28:\"navigation/style-rtl.min.css\";i:262;s:20:\"navigation/style.css\";i:263;s:24:\"navigation/style.min.css\";i:264;s:23:\"nextpage/editor-rtl.css\";i:265;s:27:\"nextpage/editor-rtl.min.css\";i:266;s:19:\"nextpage/editor.css\";i:267;s:23:\"nextpage/editor.min.css\";i:268;s:24:\"page-list/editor-rtl.css\";i:269;s:28:\"page-list/editor-rtl.min.css\";i:270;s:20:\"page-list/editor.css\";i:271;s:24:\"page-list/editor.min.css\";i:272;s:23:\"page-list/style-rtl.css\";i:273;s:27:\"page-list/style-rtl.min.css\";i:274;s:19:\"page-list/style.css\";i:275;s:23:\"page-list/style.min.css\";i:276;s:24:\"paragraph/editor-rtl.css\";i:277;s:28:\"paragraph/editor-rtl.min.css\";i:278;s:20:\"paragraph/editor.css\";i:279;s:24:\"paragraph/editor.min.css\";i:280;s:23:\"paragraph/style-rtl.css\";i:281;s:27:\"paragraph/style-rtl.min.css\";i:282;s:19:\"paragraph/style.css\";i:283;s:23:\"paragraph/style.min.css\";i:284;s:35:\"post-author-biography/style-rtl.css\";i:285;s:39:\"post-author-biography/style-rtl.min.css\";i:286;s:31:\"post-author-biography/style.css\";i:287;s:35:\"post-author-biography/style.min.css\";i:288;s:30:\"post-author-name/style-rtl.css\";i:289;s:34:\"post-author-name/style-rtl.min.css\";i:290;s:26:\"post-author-name/style.css\";i:291;s:30:\"post-author-name/style.min.css\";i:292;s:26:\"post-author/editor-rtl.css\";i:293;s:30:\"post-author/editor-rtl.min.css\";i:294;s:22:\"post-author/editor.css\";i:295;s:26:\"post-author/editor.min.css\";i:296;s:25:\"post-author/style-rtl.css\";i:297;s:29:\"post-author/style-rtl.min.css\";i:298;s:21:\"post-author/style.css\";i:299;s:25:\"post-author/style.min.css\";i:300;s:33:\"post-comments-form/editor-rtl.css\";i:301;s:37:\"post-comments-form/editor-rtl.min.css\";i:302;s:29:\"post-comments-form/editor.css\";i:303;s:33:\"post-comments-form/editor.min.css\";i:304;s:32:\"post-comments-form/style-rtl.css\";i:305;s:36:\"post-comments-form/style-rtl.min.css\";i:306;s:28:\"post-comments-form/style.css\";i:307;s:32:\"post-comments-form/style.min.css\";i:308;s:26:\"post-content/style-rtl.css\";i:309;s:30:\"post-content/style-rtl.min.css\";i:310;s:22:\"post-content/style.css\";i:311;s:26:\"post-content/style.min.css\";i:312;s:23:\"post-date/style-rtl.css\";i:313;s:27:\"post-date/style-rtl.min.css\";i:314;s:19:\"post-date/style.css\";i:315;s:23:\"post-date/style.min.css\";i:316;s:27:\"post-excerpt/editor-rtl.css\";i:317;s:31:\"post-excerpt/editor-rtl.min.css\";i:318;s:23:\"post-excerpt/editor.css\";i:319;s:27:\"post-excerpt/editor.min.css\";i:320;s:26:\"post-excerpt/style-rtl.css\";i:321;s:30:\"post-excerpt/style-rtl.min.css\";i:322;s:22:\"post-excerpt/style.css\";i:323;s:26:\"post-excerpt/style.min.css\";i:324;s:34:\"post-featured-image/editor-rtl.css\";i:325;s:38:\"post-featured-image/editor-rtl.min.css\";i:326;s:30:\"post-featured-image/editor.css\";i:327;s:34:\"post-featured-image/editor.min.css\";i:328;s:33:\"post-featured-image/style-rtl.css\";i:329;s:37:\"post-featured-image/style-rtl.min.css\";i:330;s:29:\"post-featured-image/style.css\";i:331;s:33:\"post-featured-image/style.min.css\";i:332;s:34:\"post-navigation-link/style-rtl.css\";i:333;s:38:\"post-navigation-link/style-rtl.min.css\";i:334;s:30:\"post-navigation-link/style.css\";i:335;s:34:\"post-navigation-link/style.min.css\";i:336;s:27:\"post-template/style-rtl.css\";i:337;s:31:\"post-template/style-rtl.min.css\";i:338;s:23:\"post-template/style.css\";i:339;s:27:\"post-template/style.min.css\";i:340;s:24:\"post-terms/style-rtl.css\";i:341;s:28:\"post-terms/style-rtl.min.css\";i:342;s:20:\"post-terms/style.css\";i:343;s:24:\"post-terms/style.min.css\";i:344;s:24:\"post-title/style-rtl.css\";i:345;s:28:\"post-title/style-rtl.min.css\";i:346;s:20:\"post-title/style.css\";i:347;s:24:\"post-title/style.min.css\";i:348;s:26:\"preformatted/style-rtl.css\";i:349;s:30:\"preformatted/style-rtl.min.css\";i:350;s:22:\"preformatted/style.css\";i:351;s:26:\"preformatted/style.min.css\";i:352;s:24:\"pullquote/editor-rtl.css\";i:353;s:28:\"pullquote/editor-rtl.min.css\";i:354;s:20:\"pullquote/editor.css\";i:355;s:24:\"pullquote/editor.min.css\";i:356;s:23:\"pullquote/style-rtl.css\";i:357;s:27:\"pullquote/style-rtl.min.css\";i:358;s:19:\"pullquote/style.css\";i:359;s:23:\"pullquote/style.min.css\";i:360;s:23:\"pullquote/theme-rtl.css\";i:361;s:27:\"pullquote/theme-rtl.min.css\";i:362;s:19:\"pullquote/theme.css\";i:363;s:23:\"pullquote/theme.min.css\";i:364;s:39:\"query-pagination-numbers/editor-rtl.css\";i:365;s:43:\"query-pagination-numbers/editor-rtl.min.css\";i:366;s:35:\"query-pagination-numbers/editor.css\";i:367;s:39:\"query-pagination-numbers/editor.min.css\";i:368;s:31:\"query-pagination/editor-rtl.css\";i:369;s:35:\"query-pagination/editor-rtl.min.css\";i:370;s:27:\"query-pagination/editor.css\";i:371;s:31:\"query-pagination/editor.min.css\";i:372;s:30:\"query-pagination/style-rtl.css\";i:373;s:34:\"query-pagination/style-rtl.min.css\";i:374;s:26:\"query-pagination/style.css\";i:375;s:30:\"query-pagination/style.min.css\";i:376;s:25:\"query-title/style-rtl.css\";i:377;s:29:\"query-title/style-rtl.min.css\";i:378;s:21:\"query-title/style.css\";i:379;s:25:\"query-title/style.min.css\";i:380;s:25:\"query-total/style-rtl.css\";i:381;s:29:\"query-total/style-rtl.min.css\";i:382;s:21:\"query-total/style.css\";i:383;s:25:\"query-total/style.min.css\";i:384;s:20:\"query/editor-rtl.css\";i:385;s:24:\"query/editor-rtl.min.css\";i:386;s:16:\"query/editor.css\";i:387;s:20:\"query/editor.min.css\";i:388;s:19:\"quote/style-rtl.css\";i:389;s:23:\"quote/style-rtl.min.css\";i:390;s:15:\"quote/style.css\";i:391;s:19:\"quote/style.min.css\";i:392;s:19:\"quote/theme-rtl.css\";i:393;s:23:\"quote/theme-rtl.min.css\";i:394;s:15:\"quote/theme.css\";i:395;s:19:\"quote/theme.min.css\";i:396;s:23:\"read-more/style-rtl.css\";i:397;s:27:\"read-more/style-rtl.min.css\";i:398;s:19:\"read-more/style.css\";i:399;s:23:\"read-more/style.min.css\";i:400;s:18:\"rss/editor-rtl.css\";i:401;s:22:\"rss/editor-rtl.min.css\";i:402;s:14:\"rss/editor.css\";i:403;s:18:\"rss/editor.min.css\";i:404;s:17:\"rss/style-rtl.css\";i:405;s:21:\"rss/style-rtl.min.css\";i:406;s:13:\"rss/style.css\";i:407;s:17:\"rss/style.min.css\";i:408;s:21:\"search/editor-rtl.css\";i:409;s:25:\"search/editor-rtl.min.css\";i:410;s:17:\"search/editor.css\";i:411;s:21:\"search/editor.min.css\";i:412;s:20:\"search/style-rtl.css\";i:413;s:24:\"search/style-rtl.min.css\";i:414;s:16:\"search/style.css\";i:415;s:20:\"search/style.min.css\";i:416;s:20:\"search/theme-rtl.css\";i:417;s:24:\"search/theme-rtl.min.css\";i:418;s:16:\"search/theme.css\";i:419;s:20:\"search/theme.min.css\";i:420;s:24:\"separator/editor-rtl.css\";i:421;s:28:\"separator/editor-rtl.min.css\";i:422;s:20:\"separator/editor.css\";i:423;s:24:\"separator/editor.min.css\";i:424;s:23:\"separator/style-rtl.css\";i:425;s:27:\"separator/style-rtl.min.css\";i:426;s:19:\"separator/style.css\";i:427;s:23:\"separator/style.min.css\";i:428;s:23:\"separator/theme-rtl.css\";i:429;s:27:\"separator/theme-rtl.min.css\";i:430;s:19:\"separator/theme.css\";i:431;s:23:\"separator/theme.min.css\";i:432;s:24:\"shortcode/editor-rtl.css\";i:433;s:28:\"shortcode/editor-rtl.min.css\";i:434;s:20:\"shortcode/editor.css\";i:435;s:24:\"shortcode/editor.min.css\";i:436;s:24:\"site-logo/editor-rtl.css\";i:437;s:28:\"site-logo/editor-rtl.min.css\";i:438;s:20:\"site-logo/editor.css\";i:439;s:24:\"site-logo/editor.min.css\";i:440;s:23:\"site-logo/style-rtl.css\";i:441;s:27:\"site-logo/style-rtl.min.css\";i:442;s:19:\"site-logo/style.css\";i:443;s:23:\"site-logo/style.min.css\";i:444;s:27:\"site-tagline/editor-rtl.css\";i:445;s:31:\"site-tagline/editor-rtl.min.css\";i:446;s:23:\"site-tagline/editor.css\";i:447;s:27:\"site-tagline/editor.min.css\";i:448;s:26:\"site-tagline/style-rtl.css\";i:449;s:30:\"site-tagline/style-rtl.min.css\";i:450;s:22:\"site-tagline/style.css\";i:451;s:26:\"site-tagline/style.min.css\";i:452;s:25:\"site-title/editor-rtl.css\";i:453;s:29:\"site-title/editor-rtl.min.css\";i:454;s:21:\"site-title/editor.css\";i:455;s:25:\"site-title/editor.min.css\";i:456;s:24:\"site-title/style-rtl.css\";i:457;s:28:\"site-title/style-rtl.min.css\";i:458;s:20:\"site-title/style.css\";i:459;s:24:\"site-title/style.min.css\";i:460;s:26:\"social-link/editor-rtl.css\";i:461;s:30:\"social-link/editor-rtl.min.css\";i:462;s:22:\"social-link/editor.css\";i:463;s:26:\"social-link/editor.min.css\";i:464;s:27:\"social-links/editor-rtl.css\";i:465;s:31:\"social-links/editor-rtl.min.css\";i:466;s:23:\"social-links/editor.css\";i:467;s:27:\"social-links/editor.min.css\";i:468;s:26:\"social-links/style-rtl.css\";i:469;s:30:\"social-links/style-rtl.min.css\";i:470;s:22:\"social-links/style.css\";i:471;s:26:\"social-links/style.min.css\";i:472;s:21:\"spacer/editor-rtl.css\";i:473;s:25:\"spacer/editor-rtl.min.css\";i:474;s:17:\"spacer/editor.css\";i:475;s:21:\"spacer/editor.min.css\";i:476;s:20:\"spacer/style-rtl.css\";i:477;s:24:\"spacer/style-rtl.min.css\";i:478;s:16:\"spacer/style.css\";i:479;s:20:\"spacer/style.min.css\";i:480;s:20:\"table/editor-rtl.css\";i:481;s:24:\"table/editor-rtl.min.css\";i:482;s:16:\"table/editor.css\";i:483;s:20:\"table/editor.min.css\";i:484;s:19:\"table/style-rtl.css\";i:485;s:23:\"table/style-rtl.min.css\";i:486;s:15:\"table/style.css\";i:487;s:19:\"table/style.min.css\";i:488;s:19:\"table/theme-rtl.css\";i:489;s:23:\"table/theme-rtl.min.css\";i:490;s:15:\"table/theme.css\";i:491;s:19:\"table/theme.min.css\";i:492;s:24:\"tag-cloud/editor-rtl.css\";i:493;s:28:\"tag-cloud/editor-rtl.min.css\";i:494;s:20:\"tag-cloud/editor.css\";i:495;s:24:\"tag-cloud/editor.min.css\";i:496;s:23:\"tag-cloud/style-rtl.css\";i:497;s:27:\"tag-cloud/style-rtl.min.css\";i:498;s:19:\"tag-cloud/style.css\";i:499;s:23:\"tag-cloud/style.min.css\";i:500;s:28:\"template-part/editor-rtl.css\";i:501;s:32:\"template-part/editor-rtl.min.css\";i:502;s:24:\"template-part/editor.css\";i:503;s:28:\"template-part/editor.min.css\";i:504;s:27:\"template-part/theme-rtl.css\";i:505;s:31:\"template-part/theme-rtl.min.css\";i:506;s:23:\"template-part/theme.css\";i:507;s:27:\"template-part/theme.min.css\";i:508;s:30:\"term-description/style-rtl.css\";i:509;s:34:\"term-description/style-rtl.min.css\";i:510;s:26:\"term-description/style.css\";i:511;s:30:\"term-description/style.min.css\";i:512;s:27:\"text-columns/editor-rtl.css\";i:513;s:31:\"text-columns/editor-rtl.min.css\";i:514;s:23:\"text-columns/editor.css\";i:515;s:27:\"text-columns/editor.min.css\";i:516;s:26:\"text-columns/style-rtl.css\";i:517;s:30:\"text-columns/style-rtl.min.css\";i:518;s:22:\"text-columns/style.css\";i:519;s:26:\"text-columns/style.min.css\";i:520;s:19:\"verse/style-rtl.css\";i:521;s:23:\"verse/style-rtl.min.css\";i:522;s:15:\"verse/style.css\";i:523;s:19:\"verse/style.min.css\";i:524;s:20:\"video/editor-rtl.css\";i:525;s:24:\"video/editor-rtl.min.css\";i:526;s:16:\"video/editor.css\";i:527;s:20:\"video/editor.min.css\";i:528;s:19:\"video/style-rtl.css\";i:529;s:23:\"video/style-rtl.min.css\";i:530;s:15:\"video/style.css\";i:531;s:19:\"video/style.min.css\";i:532;s:19:\"video/theme-rtl.css\";i:533;s:23:\"video/theme-rtl.min.css\";i:534;s:15:\"video/theme.css\";i:535;s:19:\"video/theme.min.css\";}}', 'on'),
(126, 'recovery_keys', 'a:0:{}', 'off'),
(127, 'theme_mods_twentytwentyfive', 'a:4:{s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1746056404;s:4:\"data\";a:3:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:3:{i:0;s:7:\"block-2\";i:1;s:7:\"block-3\";i:2;s:7:\"block-4\";}s:9:\"sidebar-2\";a:2:{i:0;s:7:\"block-5\";i:1;s:7:\"block-6\";}}}s:19:\"wp_classic_sidebars\";a:0:{}s:18:\"nav_menu_locations\";a:0:{}}', 'on');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(128, '_transient_wp_styles_for_blocks', 'a:2:{s:4:\"hash\";s:32:\"42b9c3ad41dc8ef6bf6a5ca75eecc7a0\";s:6:\"blocks\";a:56:{s:11:\"core/button\";s:0:\"\";s:14:\"core/site-logo\";s:0:\"\";s:18:\"core/post-template\";s:0:\"\";s:12:\"core/columns\";s:769:\":root :where(.wp-block-columns-is-layout-flow) > :first-child{margin-block-start: 0;}:root :where(.wp-block-columns-is-layout-flow) > :last-child{margin-block-end: 0;}:root :where(.wp-block-columns-is-layout-flow) > *{margin-block-start: var(--wp--preset--spacing--50);margin-block-end: 0;}:root :where(.wp-block-columns-is-layout-constrained) > :first-child{margin-block-start: 0;}:root :where(.wp-block-columns-is-layout-constrained) > :last-child{margin-block-end: 0;}:root :where(.wp-block-columns-is-layout-constrained) > *{margin-block-start: var(--wp--preset--spacing--50);margin-block-end: 0;}:root :where(.wp-block-columns-is-layout-flex){gap: var(--wp--preset--spacing--50);}:root :where(.wp-block-columns-is-layout-grid){gap: var(--wp--preset--spacing--50);}\";s:14:\"core/pullquote\";s:405:\":root :where(.wp-block-pullquote){color: var(--wp--preset--color--contrast);font-family: var(--wp--preset--font-family--roboto-slab);font-size: var(--wp--preset--font-size--xx-large);font-weight: 200;line-height: 1.2;padding-top: var(--wp--preset--spacing--30);padding-bottom: var(--wp--preset--spacing--30);}:root :where(.wp-block-pullquote p:last-of-type){margin-bottom: var(--wp--preset--spacing--30);}\";s:32:\"c48738dcb285a3f6ab83acff204fc486\";s:148:\":root :where(.wp-block-pullquote cite){color: var(--wp--preset--color--accent-4);font-size: var(--wp--preset--font-size--small);font-style: normal;}\";s:11:\"core/avatar\";s:57:\":root :where(.wp-block-avatar img){border-radius: 100px;}\";s:12:\"core/buttons\";s:665:\":root :where(.wp-block-buttons-is-layout-flow) > :first-child{margin-block-start: 0;}:root :where(.wp-block-buttons-is-layout-flow) > :last-child{margin-block-end: 0;}:root :where(.wp-block-buttons-is-layout-flow) > *{margin-block-start: 16px;margin-block-end: 0;}:root :where(.wp-block-buttons-is-layout-constrained) > :first-child{margin-block-start: 0;}:root :where(.wp-block-buttons-is-layout-constrained) > :last-child{margin-block-end: 0;}:root :where(.wp-block-buttons-is-layout-constrained) > *{margin-block-start: 16px;margin-block-end: 0;}:root :where(.wp-block-buttons-is-layout-flex){gap: 16px;}:root :where(.wp-block-buttons-is-layout-grid){gap: 16px;}\";s:9:\"core/code\";s:427:\":root :where(.wp-block-code){background-color: var(--wp--preset--color--accent-5);color: var(--wp--preset--color--contrast);font-family: var(--wp--preset--font-family--fira-code);font-size: var(--wp--preset--font-size--medium);font-weight: 300;padding-top: var(--wp--preset--spacing--40);padding-right: var(--wp--preset--spacing--40);padding-bottom: var(--wp--preset--spacing--40);padding-left: var(--wp--preset--spacing--40);}\";s:24:\"core/comment-author-name\";s:169:\":root :where(.wp-block-comment-author-name){color: var(--wp--preset--color--accent-4);font-size: var(--wp--preset--font-size--small);margin-top: 5px;margin-bottom: 0px;}\";s:32:\"c0002c260f8238c4212f3e4c369fc4f7\";s:143:\":root :where(.wp-block-comment-author-name a:where(:not(.wp-element-button))){color: var(--wp--preset--color--accent-4);text-decoration: none;}\";s:32:\"1e7c38b45537b325dbbbaec17a301676\";s:112:\":root :where(.wp-block-comment-author-name a:where(:not(.wp-element-button)):hover){text-decoration: underline;}\";s:20:\"core/comment-content\";s:178:\":root :where(.wp-block-comment-content){font-size: var(--wp--preset--font-size--medium);margin-top: var(--wp--preset--spacing--30);margin-bottom: var(--wp--preset--spacing--30);}\";s:17:\"core/comment-date\";s:127:\":root :where(.wp-block-comment-date){color: var(--wp--preset--color--contrast);font-size: var(--wp--preset--font-size--small);}\";s:32:\"c83ca7b3e52884c70f7830c54f99b318\";s:114:\":root :where(.wp-block-comment-date a:where(:not(.wp-element-button))){color: var(--wp--preset--color--contrast);}\";s:22:\"core/comment-edit-link\";s:90:\":root :where(.wp-block-comment-edit-link){font-size: var(--wp--preset--font-size--small);}\";s:32:\"41d70710612536a90e368c12bcb0efea\";s:119:\":root :where(.wp-block-comment-edit-link a:where(:not(.wp-element-button))){color: var(--wp--preset--color--contrast);}\";s:23:\"core/comment-reply-link\";s:91:\":root :where(.wp-block-comment-reply-link){font-size: var(--wp--preset--font-size--small);}\";s:32:\"13c96340dbf37700add1f4c5cae19f3e\";s:120:\":root :where(.wp-block-comment-reply-link a:where(:not(.wp-element-button))){color: var(--wp--preset--color--contrast);}\";s:23:\"core/post-comments-form\";s:565:\":root :where(.wp-block-post-comments-form){font-size: var(--wp--preset--font-size--medium);padding-top: var(--wp--preset--spacing--40);padding-bottom: var(--wp--preset--spacing--40);}:root :where(.wp-block-post-comments-form textarea, .wp-block-post-comments-form input:not([type=submit])){border-radius:.25rem; border-color: var(--wp--preset--color--accent-6) !important;}:root :where(.wp-block-post-comments-form input[type=checkbox]){margin:0 .2rem 0 0 !important;}:root :where(.wp-block-post-comments-form label){font-size: var(--wp--preset--font-size--small);}\";s:24:\"core/comments-pagination\";s:182:\":root :where(.wp-block-comments-pagination){font-size: var(--wp--preset--font-size--medium);margin-top: var(--wp--preset--spacing--40);margin-bottom: var(--wp--preset--spacing--40);}\";s:29:\"core/comments-pagination-next\";s:98:\":root :where(.wp-block-comments-pagination-next){font-size: var(--wp--preset--font-size--medium);}\";s:32:\"core/comments-pagination-numbers\";s:101:\":root :where(.wp-block-comments-pagination-numbers){font-size: var(--wp--preset--font-size--medium);}\";s:33:\"core/comments-pagination-previous\";s:102:\":root :where(.wp-block-comments-pagination-previous){font-size: var(--wp--preset--font-size--medium);}\";s:14:\"core/post-date\";s:124:\":root :where(.wp-block-post-date){color: var(--wp--preset--color--accent-4);font-size: var(--wp--preset--font-size--small);}\";s:32:\"ac0d4e00f5ec22d14451759983e5bd43\";s:133:\":root :where(.wp-block-post-date a:where(:not(.wp-element-button))){color: var(--wp--preset--color--accent-4);text-decoration: none;}\";s:32:\"0ae6ffd1b886044c2da62d75d05ab13d\";s:102:\":root :where(.wp-block-post-date a:where(:not(.wp-element-button)):hover){text-decoration: underline;}\";s:25:\"core/post-navigation-link\";s:94:\":root :where(.wp-block-post-navigation-link){font-size: var(--wp--preset--font-size--medium);}\";s:15:\"core/post-terms\";s:158:\":root :where(.wp-block-post-terms){font-size: var(--wp--preset--font-size--small);font-weight: 500;}:root :where(.wp-block-post-terms a){white-space: nowrap;}\";s:15:\"core/post-title\";s:0:\"\";s:32:\"bb496d3fcd9be3502ce57ff8281e5687\";s:134:\":root :where(.wp-block-post-title a:where(:not(.wp-element-button))){color: var(--wp--preset--color--contrast);text-decoration: none;}\";s:32:\"12380ab98fdc81351bb32a39bbfc9249\";s:103:\":root :where(.wp-block-post-title a:where(:not(.wp-element-button)):hover){text-decoration: underline;}\";s:10:\"core/quote\";s:1315:\":root :where(.wp-block-quote){border-color: currentColor;border-width: 0 0 0 2px;border-style: solid;font-size: var(--wp--preset--font-size--large);font-weight: 300;margin-right: 0;margin-left: 0;padding-top: var(--wp--preset--spacing--30);padding-right: var(--wp--preset--spacing--40);padding-bottom: var(--wp--preset--spacing--30);padding-left: var(--wp--preset--spacing--40);}:root :where(.wp-block-quote-is-layout-flow) > :first-child{margin-block-start: 0;}:root :where(.wp-block-quote-is-layout-flow) > :last-child{margin-block-end: 0;}:root :where(.wp-block-quote-is-layout-flow) > *{margin-block-start: var(--wp--preset--spacing--30);margin-block-end: 0;}:root :where(.wp-block-quote-is-layout-constrained) > :first-child{margin-block-start: 0;}:root :where(.wp-block-quote-is-layout-constrained) > :last-child{margin-block-end: 0;}:root :where(.wp-block-quote-is-layout-constrained) > *{margin-block-start: var(--wp--preset--spacing--30);margin-block-end: 0;}:root :where(.wp-block-quote-is-layout-flex){gap: var(--wp--preset--spacing--30);}:root :where(.wp-block-quote-is-layout-grid){gap: var(--wp--preset--spacing--30);}:root :where(.wp-block-quote.has-text-align-right ){border-width: 0 2px 0 0;}:root :where(.wp-block-quote.has-text-align-center ){border-width: 0;border-inline: 0; padding-inline: 0;}\";s:32:\"1de7a22e22013106efc5be82788cb6c0\";s:218:\":root :where(.wp-block-quote cite){color: var(--wp--preset--color--accent-4);font-size: var(--wp--preset--font-size--small);font-style: normal;font-weight: 300;}:root :where(.wp-block-quote cite sub){font-size: 0.65em}\";s:21:\"core/query-pagination\";s:107:\":root :where(.wp-block-query-pagination){font-size: var(--wp--preset--font-size--medium);font-weight: 500;}\";s:11:\"core/search\";s:406:\":root :where(.wp-block-search .wp-block-search__label, .wp-block-search .wp-block-search__input, .wp-block-search .wp-block-search__button){font-size: var(--wp--preset--font-size--medium);line-height: 1.6;text-transform: uppercase;}:root :where(.wp-block-search .wp-block-search__input){border-radius:3.125rem;padding-left:1.5625rem;padding-right:1.5625rem;border-color:var(--wp--preset--color--accent-6);}\";s:32:\"14fa6a3d0cfbde171cbc0fb04aa8a6cf\";s:138:\":root :where(.wp-block-search .wp-element-button,.wp-block-search  .wp-block-button__link){border-radius: 3.125rem;margin-left: 1.125rem;}\";s:32:\"05993ee2f3de94b5d1350998a7e9b6b0\";s:130:\":root :where(.wp-block-search .wp-element-button:hover,.wp-block-search  .wp-block-button__link:hover){border-color: transparent;}\";s:14:\"core/separator\";s:148:\":root :where(.wp-block-separator){border-color: currentColor;border-width: 0 0 1px 0;border-style: solid;color: var(--wp--preset--color--accent-6);}\";s:17:\"core/site-tagline\";s:85:\":root :where(.wp-block-site-tagline){font-size: var(--wp--preset--font-size--large);}\";s:15:\"core/site-title\";s:101:\":root :where(.wp-block-site-title){font-weight: 700;letter-spacing: -.5px;text-transform: uppercase;}\";s:32:\"f513d889cf971b13995cc3fffed2f39b\";s:92:\":root :where(.wp-block-site-title a:where(:not(.wp-element-button))){text-decoration: none;}\";s:32:\"22c37a317cc0ebd50155b5ad78564f37\";s:103:\":root :where(.wp-block-site-title a:where(:not(.wp-element-button)):hover){text-decoration: underline;}\";s:21:\"core/term-description\";s:90:\":root :where(.wp-block-term-description){font-size: var(--wp--preset--font-size--medium);}\";s:15:\"core/navigation\";s:133:\":root :where(.wp-block-navigation){font-size: var(--wp--preset--font-size--large);letter-spacing: -0.28px;text-transform: uppercase;}\";s:32:\"25289a01850f5a0264ddb79a9a3baf3d\";s:92:\":root :where(.wp-block-navigation a:where(:not(.wp-element-button))){text-decoration: none;}\";s:32:\"026c04da08398d655a95047f1f235d97\";s:103:\":root :where(.wp-block-navigation a:where(:not(.wp-element-button)):hover){text-decoration: underline;}\";s:9:\"core/list\";s:52:\":root :where(.wp-block-list li){margin-top: 0.5rem;}\";s:12:\"core/heading\";s:0:\"\";s:14:\"core/paragraph\";s:0:\"\";s:32:\"3b63e16ac7cf29a0a8c9e12905543dce\";s:93:\":root :where(p a:where(:not(.wp-element-button))){color: var(--wp--preset--color--contrast);}\";s:10:\"core/group\";s:0:\"\";s:11:\"core/column\";s:0:\"\";s:16:\"core/post-author\";s:84:\":root :where(.wp-block-post-author){font-size: var(--wp--preset--font-size--small);}\";s:21:\"core/post-author-name\";s:89:\":root :where(.wp-block-post-author-name){font-size: var(--wp--preset--font-size--small);}\";s:32:\"5e6daa05ce887f9195642ee978692d48\";s:118:\":root :where(.wp-block-post-author-name a:where(:not(.wp-element-button))){color: var(--wp--preset--color--contrast);}\";}}', 'on'),
(147, 'can_compress_scripts', '1', 'on'),
(156, 'finished_updating_comment_type', '1', 'auto'),
(158, 'new_admin_email', 'paesmatheus665@gmail.com', 'auto'),
(165, 'current_theme', 'Twenty Twenty-Five', 'auto'),
(166, 'theme_mods_twentytwentyfour', 'a:5:{i:0;b:0;s:19:\"wp_classic_sidebars\";a:0:{}s:18:\"nav_menu_locations\";a:0:{}s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1746058472;s:4:\"data\";a:1:{s:19:\"wp_inactive_widgets\";a:5:{i:0;s:7:\"block-2\";i:1;s:7:\"block-3\";i:2;s:7:\"block-4\";i:3;s:7:\"block-5\";i:4;s:7:\"block-6\";}}}}', 'off'),
(167, 'theme_switched', '', 'auto'),
(184, '_site_transient_timeout_wp_font_collection_url_https://s.w.org/images/fonts/wp-6.7/collections/google-fonts-with-preview.json', '1746144934', 'off'),
(195, 'wp_calendar_block_has_published_posts', '1', 'auto'),
(206, '_site_transient_update_core', 'O:8:\"stdClass\":4:{s:7:\"updates\";a:1:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:6:\"latest\";s:8:\"download\";s:65:\"https://downloads.wordpress.org/release/pt_BR/wordpress-6.8.1.zip\";s:6:\"locale\";s:5:\"pt_BR\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:65:\"https://downloads.wordpress.org/release/pt_BR/wordpress-6.8.1.zip\";s:10:\"no_content\";s:0:\"\";s:11:\"new_bundled\";s:0:\"\";s:7:\"partial\";s:0:\"\";s:8:\"rollback\";s:0:\"\";}s:7:\"current\";s:5:\"6.8.1\";s:7:\"version\";s:5:\"6.8.1\";s:11:\"php_version\";s:6:\"7.2.24\";s:13:\"mysql_version\";s:5:\"5.5.5\";s:11:\"new_bundled\";s:3:\"6.7\";s:15:\"partial_version\";s:0:\"\";}}s:12:\"last_checked\";i:1750198980;s:15:\"version_checked\";s:5:\"6.8.1\";s:12:\"translations\";a:0:{}}', 'off'),
(207, '_site_transient_update_themes', 'O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1750198983;s:7:\"checked\";a:4:{s:16:\"twentytwentyfive\";s:3:\"1.2\";s:16:\"twentytwentyfour\";s:3:\"1.3\";s:17:\"twentytwentythree\";s:3:\"1.6\";s:15:\"twentytwentytwo\";s:3:\"2.0\";}s:8:\"response\";a:0:{}s:9:\"no_update\";a:4:{s:16:\"twentytwentyfive\";a:6:{s:5:\"theme\";s:16:\"twentytwentyfive\";s:11:\"new_version\";s:3:\"1.2\";s:3:\"url\";s:46:\"https://wordpress.org/themes/twentytwentyfive/\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/theme/twentytwentyfive.1.2.zip\";s:8:\"requires\";s:3:\"6.7\";s:12:\"requires_php\";s:3:\"7.2\";}s:16:\"twentytwentyfour\";a:6:{s:5:\"theme\";s:16:\"twentytwentyfour\";s:11:\"new_version\";s:3:\"1.3\";s:3:\"url\";s:46:\"https://wordpress.org/themes/twentytwentyfour/\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/theme/twentytwentyfour.1.3.zip\";s:8:\"requires\";s:3:\"6.4\";s:12:\"requires_php\";s:3:\"7.0\";}s:17:\"twentytwentythree\";a:6:{s:5:\"theme\";s:17:\"twentytwentythree\";s:11:\"new_version\";s:3:\"1.6\";s:3:\"url\";s:47:\"https://wordpress.org/themes/twentytwentythree/\";s:7:\"package\";s:63:\"https://downloads.wordpress.org/theme/twentytwentythree.1.6.zip\";s:8:\"requires\";s:3:\"6.1\";s:12:\"requires_php\";s:3:\"5.6\";}s:15:\"twentytwentytwo\";a:6:{s:5:\"theme\";s:15:\"twentytwentytwo\";s:11:\"new_version\";s:3:\"2.0\";s:3:\"url\";s:45:\"https://wordpress.org/themes/twentytwentytwo/\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/theme/twentytwentytwo.2.0.zip\";s:8:\"requires\";s:3:\"5.9\";s:12:\"requires_php\";s:3:\"5.6\";}}s:12:\"translations\";a:0:{}}', 'off'),
(211, '_transient_health-check-site-status-result', '{\"good\":17,\"recommended\":4,\"critical\":2}', 'on'),
(296, '_site_transient_update_plugins', 'O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1750198982;s:8:\"response\";a:0:{}s:12:\"translations\";a:0:{}s:9:\"no_update\";a:0:{}}', 'off'),
(301, 'category_children', 'a:0:{}', 'auto'),
(304, '_site_transient_wp_plugin_dependencies_plugin_data', 'a:0:{}', 'off'),
(305, 'recently_activated', 'a:0:{}', 'off'),
(320, '_site_transient_timeout_wp_theme_files_patterns-f0768e03671ecd4b13ceffc333b59350', '1750200771', 'off'),
(321, '_site_transient_wp_theme_files_patterns-f0768e03671ecd4b13ceffc333b59350', 'a:2:{s:7:\"version\";s:3:\"1.2\";s:8:\"patterns\";a:98:{s:21:\"banner-about-book.php\";a:4:{s:5:\"title\";s:28:\"Banner with book description\";s:4:\"slug\";s:34:\"twentytwentyfive/banner-about-book\";s:11:\"description\";s:66:\"Banner with book description and accompanying image for promotion.\";s:10:\"categories\";a:1:{i:0;s:6:\"banner\";}}s:28:\"banner-cover-big-heading.php\";a:4:{s:5:\"title\";s:22:\"Cover with big heading\";s:4:\"slug\";s:41:\"twentytwentyfive/banner-cover-big-heading\";s:11:\"description\";s:82:\"A full-width cover section with a large background image and an oversized heading.\";s:10:\"categories\";a:3:{i:0;s:6:\"banner\";i:1;s:5:\"about\";i:2;s:8:\"featured\";}}s:22:\"banner-intro-image.php\";a:4:{s:5:\"title\";s:49:\"Short heading and paragraph and image on the left\";s:4:\"slug\";s:35:\"twentytwentyfive/banner-intro-image\";s:11:\"description\";s:68:\"A Intro pattern with Short heading, paragraph and image on the left.\";s:10:\"categories\";a:2:{i:0;s:6:\"banner\";i:1;s:8:\"featured\";}}s:16:\"banner-intro.php\";a:4:{s:5:\"title\";s:35:\"Intro with left-aligned description\";s:4:\"slug\";s:29:\"twentytwentyfive/banner-intro\";s:11:\"description\";s:66:\"A large left-aligned heading with a brand name emphasized in bold.\";s:10:\"categories\";a:1:{i:0;s:6:\"banner\";}}s:17:\"banner-poster.php\";a:4:{s:5:\"title\";s:19:\"Poster-like section\";s:4:\"slug\";s:30:\"twentytwentyfive/banner-poster\";s:11:\"description\";s:78:\"A section that can be used as a banner or a landing page to announce an event.\";s:10:\"categories\";a:2:{i:0;s:6:\"banner\";i:1;s:5:\"media\";}}s:43:\"banner-with-description-and-images-grid.php\";a:4:{s:5:\"title\";s:39:\"Banner with description and images grid\";s:4:\"slug\";s:47:\"twentytwentyfive/banner-description-images-grid\";s:11:\"description\";s:75:\"A banner with a short paragraph, and two images displayed in a grid layout.\";s:10:\"categories\";a:2:{i:0;s:6:\"banner\";i:1;s:8:\"featured\";}}s:18:\"binding-format.php\";a:4:{s:5:\"title\";s:16:\"Post format name\";s:4:\"slug\";s:31:\"twentytwentyfive/binding-format\";s:11:\"description\";s:75:\"Prints the name of the post format with the help of the Block Bindings API.\";s:10:\"categories\";a:1:{i:0;s:28:\"twentytwentyfive_post-format\";}}s:12:\"comments.php\";a:5:{s:5:\"title\";s:8:\"Comments\";s:4:\"slug\";s:25:\"twentytwentyfive/comments\";s:11:\"description\";s:63:\"Comments area with comments list, pagination, and comment form.\";s:10:\"categories\";a:1:{i:0;s:4:\"text\";}s:10:\"blockTypes\";a:1:{i:0;s:13:\"core/comments\";}}s:32:\"contact-centered-social-link.php\";a:5:{s:5:\"title\";s:30:\"Centered link and social links\";s:4:\"slug\";s:45:\"twentytwentyfive/contact-centered-social-link\";s:11:\"description\";s:73:\"Centered contact section with a prominent message and social media links.\";s:10:\"categories\";a:1:{i:0;s:7:\"contact\";}s:8:\"keywords\";a:3:{i:0;s:7:\"contact\";i:1;s:3:\"faq\";i:2;s:9:\"questions\";}}s:26:\"contact-info-locations.php\";a:6:{s:5:\"title\";s:27:\"Contact, info and locations\";s:4:\"slug\";s:39:\"twentytwentyfive/contact-info-locations\";s:11:\"description\";s:78:\"Contact section with social media links, email, and multiple location details.\";s:13:\"viewportWidth\";i:1400;s:10:\"categories\";a:1:{i:0;s:7:\"contact\";}s:8:\"keywords\";a:2:{i:0;s:7:\"contact\";i:1;s:8:\"location\";}}s:29:\"contact-location-and-link.php\";a:4:{s:5:\"title\";s:25:\"Contact location and link\";s:4:\"slug\";s:42:\"twentytwentyfive/contact-location-and-link\";s:11:\"description\";s:89:\"Contact section with a location address, a directions link, and an image of the location.\";s:10:\"categories\";a:2:{i:0;s:7:\"contact\";i:1;s:8:\"featured\";}}s:18:\"cta-book-links.php\";a:4:{s:5:\"title\";s:30:\"Call to action with book links\";s:4:\"slug\";s:31:\"twentytwentyfive/cta-book-links\";s:11:\"description\";s:74:\"A call to action section with links to get the book in different websites.\";s:10:\"categories\";a:1:{i:0;s:14:\"call-to-action\";}}s:22:\"cta-book-locations.php\";a:4:{s:5:\"title\";s:29:\"Call to action with locations\";s:4:\"slug\";s:35:\"twentytwentyfive/cta-book-locations\";s:11:\"description\";s:82:\"A call to action section with links to get the book in the most popular locations.\";s:10:\"categories\";a:1:{i:0;s:14:\"call-to-action\";}}s:24:\"cta-centered-heading.php\";a:4:{s:5:\"title\";s:16:\"Centered heading\";s:4:\"slug\";s:37:\"twentytwentyfive/cta-centered-heading\";s:11:\"description\";s:53:\"A hero with a centered heading, paragraph and button.\";s:10:\"categories\";a:1:{i:0;s:14:\"call-to-action\";}}s:19:\"cta-events-list.php\";a:4:{s:5:\"title\";s:11:\"Events list\";s:4:\"slug\";s:32:\"twentytwentyfive/cta-events-list\";s:11:\"description\";s:37:\"A list of events with call to action.\";s:10:\"categories\";a:1:{i:0;s:14:\"call-to-action\";}}s:26:\"cta-grid-products-link.php\";a:5:{s:5:\"title\";s:54:\"Call to action with grid layout with products and link\";s:4:\"slug\";s:39:\"twentytwentyfive/cta-grid-products-link\";s:11:\"description\";s:42:\"A call to action featuring product images.\";s:13:\"viewportWidth\";i:1400;s:10:\"categories\";a:2:{i:0;s:14:\"call-to-action\";i:1;s:8:\"featured\";}}s:22:\"cta-heading-search.php\";a:4:{s:5:\"title\";s:23:\"Heading and search form\";s:4:\"slug\";s:35:\"twentytwentyfive/cta-heading-search\";s:11:\"description\";s:54:\"Large heading with a search form for quick navigation.\";s:10:\"categories\";a:1:{i:0;s:14:\"call-to-action\";}}s:18:\"cta-newsletter.php\";a:5:{s:5:\"title\";s:18:\"Newsletter sign-up\";s:4:\"slug\";s:31:\"twentytwentyfive/cta-newsletter\";s:11:\"description\";s:0:\"\";s:10:\"categories\";a:1:{i:0;s:14:\"call-to-action\";}s:8:\"keywords\";a:2:{i:0;s:14:\"call-to-action\";i:1;s:10:\"newsletter\";}}s:15:\"event-3-col.php\";a:5:{s:5:\"title\";s:46:\"Events, 3 columns with event images and titles\";s:4:\"slug\";s:28:\"twentytwentyfive/event-3-col\";s:11:\"description\";s:95:\"A header with title and text and three columns that show 3 events with their images and titles.\";s:10:\"categories\";a:1:{i:0;s:6:\"banner\";}s:8:\"keywords\";a:3:{i:0;s:6:\"events\";i:1;s:7:\"columns\";i:2;s:6:\"images\";}}s:14:\"event-rsvp.php\";a:7:{s:5:\"title\";s:10:\"Event RSVP\";s:4:\"slug\";s:27:\"twentytwentyfive/event-rsvp\";s:11:\"description\";s:64:\"RSVP for an upcoming event with a cover image and event details.\";s:13:\"viewportWidth\";i:1400;s:10:\"categories\";a:1:{i:0;s:14:\"call-to-action\";}s:8:\"keywords\";a:3:{i:0;s:14:\"call-to-action\";i:1;s:4:\"rsvp\";i:2;s:5:\"event\";}s:10:\"blockTypes\";a:1:{i:0;s:17:\"core/post-content\";}}s:18:\"event-schedule.php\";a:5:{s:5:\"title\";s:14:\"Event schedule\";s:4:\"slug\";s:31:\"twentytwentyfive/event-schedule\";s:11:\"description\";s:54:\"A section with specified dates and times for an event.\";s:10:\"categories\";a:1:{i:0;s:5:\"about\";}s:8:\"keywords\";a:4:{i:0;s:6:\"events\";i:1;s:6:\"agenda\";i:2;s:8:\"schedule\";i:3;s:8:\"lectures\";}}s:19:\"footer-centered.php\";a:5:{s:5:\"title\";s:15:\"Centered footer\";s:4:\"slug\";s:32:\"twentytwentyfive/footer-centered\";s:11:\"description\";s:44:\"Footer with centered site title and tagline.\";s:10:\"categories\";a:1:{i:0;s:6:\"footer\";}s:10:\"blockTypes\";a:1:{i:0;s:25:\"core/template-part/footer\";}}s:18:\"footer-columns.php\";a:5:{s:5:\"title\";s:19:\"Footer with columns\";s:4:\"slug\";s:31:\"twentytwentyfive/footer-columns\";s:11:\"description\";s:45:\"Footer columns with title, tagline and links.\";s:10:\"categories\";a:1:{i:0;s:6:\"footer\";}s:10:\"blockTypes\";a:1:{i:0;s:25:\"core/template-part/footer\";}}s:21:\"footer-newsletter.php\";a:5:{s:5:\"title\";s:29:\"Footer with newsletter signup\";s:4:\"slug\";s:34:\"twentytwentyfive/footer-newsletter\";s:11:\"description\";s:51:\"Footer with large site title and newsletter signup.\";s:10:\"categories\";a:1:{i:0;s:6:\"footer\";}s:10:\"blockTypes\";a:1:{i:0;s:25:\"core/template-part/footer\";}}s:17:\"footer-social.php\";a:5:{s:5:\"title\";s:33:\"Centered footer with social links\";s:4:\"slug\";s:30:\"twentytwentyfive/footer-social\";s:11:\"description\";s:49:\"Footer with centered site title and social links.\";s:10:\"categories\";a:1:{i:0;s:6:\"footer\";}s:10:\"blockTypes\";a:1:{i:0;s:25:\"core/template-part/footer\";}}s:10:\"footer.php\";a:5:{s:5:\"title\";s:6:\"Footer\";s:4:\"slug\";s:23:\"twentytwentyfive/footer\";s:11:\"description\";s:51:\"Footer columns with logo, title, tagline and links.\";s:10:\"categories\";a:1:{i:0;s:6:\"footer\";}s:10:\"blockTypes\";a:1:{i:0;s:25:\"core/template-part/footer\";}}s:16:\"format-audio.php\";a:4:{s:5:\"title\";s:12:\"Audio format\";s:4:\"slug\";s:29:\"twentytwentyfive/format-audio\";s:11:\"description\";s:73:\"An audio post format with an image, title, audio player, and description.\";s:10:\"categories\";a:1:{i:0;s:28:\"twentytwentyfive_post-format\";}}s:15:\"format-link.php\";a:4:{s:5:\"title\";s:11:\"Link format\";s:4:\"slug\";s:28:\"twentytwentyfive/format-link\";s:11:\"description\";s:77:\"A link post format with a description and an emphasized link for key content.\";s:10:\"categories\";a:1:{i:0;s:28:\"twentytwentyfive_post-format\";}}s:15:\"grid-videos.php\";a:4:{s:5:\"title\";s:16:\"Grid with videos\";s:4:\"slug\";s:28:\"twentytwentyfive/grid-videos\";s:11:\"description\";s:19:\"A grid with videos.\";s:10:\"categories\";a:1:{i:0;s:5:\"about\";}}s:24:\"grid-with-categories.php\";a:5:{s:5:\"title\";s:20:\"Grid with categories\";s:4:\"slug\";s:37:\"twentytwentyfive/grid-with-categories\";s:11:\"description\";s:41:\"A grid section with different categories.\";s:13:\"viewportWidth\";i:1400;s:10:\"categories\";a:1:{i:0;s:6:\"banner\";}}s:19:\"header-centered.php\";a:5:{s:5:\"title\";s:20:\"Centered site header\";s:4:\"slug\";s:32:\"twentytwentyfive/header-centered\";s:11:\"description\";s:52:\"Site header with centered site title and navigation.\";s:10:\"categories\";a:1:{i:0;s:6:\"header\";}s:10:\"blockTypes\";a:1:{i:0;s:25:\"core/template-part/header\";}}s:18:\"header-columns.php\";a:5:{s:5:\"title\";s:19:\"Header with columns\";s:4:\"slug\";s:31:\"twentytwentyfive/header-columns\";s:11:\"description\";s:54:\"Site header with site title and navigation in columns.\";s:10:\"categories\";a:1:{i:0;s:6:\"header\";}s:10:\"blockTypes\";a:1:{i:0;s:25:\"core/template-part/header\";}}s:22:\"header-large-title.php\";a:5:{s:5:\"title\";s:23:\"Header with large title\";s:4:\"slug\";s:35:\"twentytwentyfive/header-large-title\";s:11:\"description\";s:63:\"Site header with large site title and right-aligned navigation.\";s:10:\"categories\";a:1:{i:0;s:6:\"header\";}s:10:\"blockTypes\";a:1:{i:0;s:25:\"core/template-part/header\";}}s:10:\"header.php\";a:5:{s:5:\"title\";s:6:\"Header\";s:4:\"slug\";s:23:\"twentytwentyfive/header\";s:11:\"description\";s:43:\"Site header with site title and navigation.\";s:10:\"categories\";a:1:{i:0;s:6:\"header\";}s:10:\"blockTypes\";a:1:{i:0;s:25:\"core/template-part/header\";}}s:36:\"heading-and-paragraph-with-image.php\";a:4:{s:5:\"title\";s:45:\"Heading and paragraph with image on the right\";s:4:\"slug\";s:49:\"twentytwentyfive/heading-and-paragraph-with-image\";s:11:\"description\";s:89:\"A two-column section with a heading and paragraph on the left, and an image on the right.\";s:10:\"categories\";a:1:{i:0;s:5:\"about\";}}s:13:\"hero-book.php\";a:5:{s:5:\"title\";s:9:\"Hero book\";s:4:\"slug\";s:26:\"twentytwentyfive/hero-book\";s:11:\"description\";s:66:\"A hero section for the book with a description and pre-order link.\";s:10:\"categories\";a:1:{i:0;s:6:\"banner\";}s:8:\"keywords\";a:3:{i:0;s:7:\"podcast\";i:1;s:4:\"hero\";i:2;s:7:\"stories\";}}s:25:\"hero-full-width-image.php\";a:4:{s:5:\"title\";s:22:\"Hero, full width image\";s:4:\"slug\";s:38:\"twentytwentyfive/hero-full-width-image\";s:11:\"description\";s:68:\"A hero with a full width image, heading, short paragraph and button.\";s:10:\"categories\";a:1:{i:0;s:6:\"banner\";}}s:41:\"hero-overlapped-book-cover-with-links.php\";a:4:{s:5:\"title\";s:38:\"Hero, overlapped book cover with links\";s:4:\"slug\";s:54:\"twentytwentyfive/hero-overlapped-book-cover-with-links\";s:11:\"description\";s:47:\"A hero with an overlapped book cover and links.\";s:10:\"categories\";a:1:{i:0;s:6:\"banner\";}}s:16:\"hero-podcast.php\";a:5:{s:5:\"title\";s:12:\"Hero podcast\";s:4:\"slug\";s:29:\"twentytwentyfive/hero-podcast\";s:11:\"description\";s:0:\"\";s:10:\"categories\";a:1:{i:0;s:6:\"banner\";}s:8:\"keywords\";a:3:{i:0;s:7:\"podcast\";i:1;s:4:\"hero\";i:2;s:7:\"stories\";}}s:14:\"hidden-404.php\";a:4:{s:5:\"title\";s:3:\"404\";s:4:\"slug\";s:27:\"twentytwentyfive/hidden-404\";s:11:\"description\";s:0:\"\";s:8:\"inserter\";b:0;}s:23:\"hidden-blog-heading.php\";a:4:{s:5:\"title\";s:19:\"Hidden blog heading\";s:4:\"slug\";s:36:\"twentytwentyfive/hidden-blog-heading\";s:11:\"description\";s:52:\"Hidden heading for the home page and index template.\";s:8:\"inserter\";b:0;}s:17:\"hidden-search.php\";a:4:{s:5:\"title\";s:6:\"Search\";s:4:\"slug\";s:30:\"twentytwentyfive/hidden-search\";s:11:\"description\";s:0:\"\";s:8:\"inserter\";b:0;}s:18:\"hidden-sidebar.php\";a:4:{s:5:\"title\";s:7:\"Sidebar\";s:4:\"slug\";s:31:\"twentytwentyfive/hidden-sidebar\";s:11:\"description\";s:0:\"\";s:8:\"inserter\";b:0;}s:21:\"hidden-written-by.php\";a:4:{s:5:\"title\";s:10:\"Written by\";s:4:\"slug\";s:34:\"twentytwentyfive/hidden-written-by\";s:11:\"description\";s:0:\"\";s:8:\"inserter\";b:0;}s:9:\"logos.php\";a:4:{s:5:\"title\";s:5:\"Logos\";s:4:\"slug\";s:22:\"twentytwentyfive/logos\";s:11:\"description\";s:77:\"Showcasing the podcast\'s clients with a heading and a series of client logos.\";s:10:\"categories\";a:1:{i:0;s:6:\"banner\";}}s:24:\"media-instagram-grid.php\";a:5:{s:5:\"title\";s:14:\"Instagram grid\";s:4:\"slug\";s:37:\"twentytwentyfive/media-instagram-grid\";s:11:\"description\";s:62:\"A grid section with photos and a link to an Instagram profile.\";s:13:\"viewportWidth\";i:1440;s:10:\"categories\";a:3:{i:0;s:5:\"media\";i:1;s:7:\"gallery\";i:2;s:8:\"featured\";}}s:14:\"more-posts.php\";a:5:{s:5:\"title\";s:10:\"More posts\";s:4:\"slug\";s:27:\"twentytwentyfive/more-posts\";s:11:\"description\";s:45:\"Displays a list of posts with title and date.\";s:10:\"categories\";a:1:{i:0;s:5:\"query\";}s:10:\"blockTypes\";a:1:{i:0;s:10:\"core/query\";}}s:21:\"overlapped-images.php\";a:4:{s:5:\"title\";s:41:\"Overlapping images and paragraph on right\";s:4:\"slug\";s:34:\"twentytwentyfive/overlapped-images\";s:11:\"description\";s:53:\"A section with overlapping images, and a description.\";s:10:\"categories\";a:2:{i:0;s:5:\"about\";i:1;s:8:\"featured\";}}s:22:\"page-business-home.php\";a:8:{s:5:\"title\";s:17:\"Business homepage\";s:4:\"slug\";s:35:\"twentytwentyfive/page-business-home\";s:11:\"description\";s:28:\"A business homepage pattern.\";s:13:\"viewportWidth\";i:1400;s:10:\"categories\";a:2:{i:0;s:21:\"twentytwentyfive_page\";i:1;s:8:\"featured\";}s:8:\"keywords\";a:1:{i:0;s:7:\"starter\";}s:10:\"blockTypes\";a:1:{i:0;s:17:\"core/post-content\";}s:9:\"postTypes\";a:2:{i:0;s:4:\"page\";i:1;s:11:\"wp_template\";}}s:20:\"page-coming-soon.php\";a:8:{s:5:\"title\";s:11:\"Coming soon\";s:4:\"slug\";s:33:\"twentytwentyfive/page-coming-soon\";s:11:\"description\";s:96:\"A full-width cover banner that can be applied to a page or it can work as a single landing page.\";s:13:\"viewportWidth\";i:1400;s:10:\"categories\";a:2:{i:0;s:21:\"twentytwentyfive_page\";i:1;s:8:\"featured\";}s:8:\"keywords\";a:1:{i:0;s:7:\"starter\";}s:10:\"blockTypes\";a:1:{i:0;s:17:\"core/post-content\";}s:9:\"postTypes\";a:2:{i:0;s:4:\"page\";i:1;s:11:\"wp_template\";}}s:15:\"page-cv-bio.php\";a:7:{s:5:\"title\";s:6:\"CV/bio\";s:4:\"slug\";s:28:\"twentytwentyfive/page-cv-bio\";s:11:\"description\";s:36:\"A pattern for a CV/Bio landing page.\";s:13:\"viewportWidth\";i:1400;s:10:\"categories\";a:3:{i:0;s:21:\"twentytwentyfive_page\";i:1;s:5:\"about\";i:2;s:8:\"featured\";}s:8:\"keywords\";a:1:{i:0;s:7:\"starter\";}s:10:\"blockTypes\";a:1:{i:0;s:17:\"core/post-content\";}}s:21:\"page-landing-book.php\";a:8:{s:5:\"title\";s:21:\"Landing page for book\";s:4:\"slug\";s:34:\"twentytwentyfive/page-landing-book\";s:11:\"description\";s:104:\"A landing page for the book with a hero section, pre-order links, locations, FAQs and newsletter signup.\";s:13:\"viewportWidth\";i:1400;s:10:\"categories\";a:2:{i:0;s:21:\"twentytwentyfive_page\";i:1;s:8:\"featured\";}s:8:\"keywords\";a:1:{i:0;s:7:\"starter\";}s:10:\"blockTypes\";a:1:{i:0;s:17:\"core/post-content\";}s:9:\"postTypes\";a:2:{i:0;s:4:\"page\";i:1;s:11:\"wp_template\";}}s:22:\"page-landing-event.php\";a:8:{s:5:\"title\";s:22:\"Landing page for event\";s:4:\"slug\";s:35:\"twentytwentyfive/page-landing-event\";s:11:\"description\";s:87:\"A landing page for the event with a hero section, description, FAQs and call to action.\";s:13:\"viewportWidth\";i:1400;s:10:\"categories\";a:2:{i:0;s:21:\"twentytwentyfive_page\";i:1;s:8:\"featured\";}s:8:\"keywords\";a:1:{i:0;s:7:\"starter\";}s:10:\"blockTypes\";a:1:{i:0;s:17:\"core/post-content\";}s:9:\"postTypes\";a:2:{i:0;s:4:\"page\";i:1;s:11:\"wp_template\";}}s:24:\"page-landing-podcast.php\";a:8:{s:5:\"title\";s:24:\"Landing page for podcast\";s:4:\"slug\";s:37:\"twentytwentyfive/page-landing-podcast\";s:11:\"description\";s:111:\"A landing page for the podcast with a hero section, description, logos, grid with videos and newsletter signup.\";s:13:\"viewportWidth\";i:1400;s:10:\"categories\";a:2:{i:0;s:21:\"twentytwentyfive_page\";i:1;s:8:\"featured\";}s:8:\"keywords\";a:1:{i:0;s:7:\"starter\";}s:10:\"blockTypes\";a:1:{i:0;s:17:\"core/post-content\";}s:9:\"postTypes\";a:2:{i:0;s:4:\"page\";i:1;s:11:\"wp_template\";}}s:50:\"page-link-in-bio-heading-paragraph-links-image.php\";a:7:{s:5:\"title\";s:59:\"Link in bio heading, paragraph, links and full-height image\";s:4:\"slug\";s:63:\"twentytwentyfive/page-link-in-bio-heading-paragraph-links-image\";s:11:\"description\";s:84:\"A link in bio landing page with a heading, paragraph, links and a full height image.\";s:13:\"viewportWidth\";i:1400;s:10:\"categories\";a:3:{i:0;s:21:\"twentytwentyfive_page\";i:1;s:6:\"banner\";i:2;s:8:\"featured\";}s:8:\"keywords\";a:1:{i:0;s:7:\"starter\";}s:10:\"blockTypes\";a:1:{i:0;s:17:\"core/post-content\";}}s:33:\"page-link-in-bio-wide-margins.php\";a:7:{s:5:\"title\";s:48:\"Link in bio with profile, links and wide margins\";s:4:\"slug\";s:46:\"twentytwentyfive/page-link-in-bio-wide-margins\";s:11:\"description\";s:86:\"A link in bio landing page with social links, a profile photo and a brief description.\";s:13:\"viewportWidth\";i:1400;s:10:\"categories\";a:3:{i:0;s:21:\"twentytwentyfive_page\";i:1;s:6:\"banner\";i:2;s:8:\"featured\";}s:8:\"keywords\";a:1:{i:0;s:7:\"starter\";}s:10:\"blockTypes\";a:1:{i:0;s:17:\"core/post-content\";}}s:39:\"page-link-in-bio-with-tight-margins.php\";a:8:{s:5:\"title\";s:30:\"Link in bio with tight margins\";s:4:\"slug\";s:52:\"twentytwentyfive/page-link-in-bio-with-tight-margins\";s:11:\"description\";s:90:\"A full-width, full-height link in bio section with an image, a paragraph and social links.\";s:13:\"viewportWidth\";i:1400;s:10:\"categories\";a:2:{i:0;s:21:\"twentytwentyfive_page\";i:1;s:6:\"banner\";}s:8:\"keywords\";a:1:{i:0;s:7:\"starter\";}s:10:\"blockTypes\";a:1:{i:0;s:17:\"core/post-content\";}s:9:\"postTypes\";a:2:{i:0;s:4:\"page\";i:1;s:11:\"wp_template\";}}s:23:\"page-portfolio-home.php\";a:8:{s:5:\"title\";s:18:\"Portfolio homepage\";s:4:\"slug\";s:36:\"twentytwentyfive/page-portfolio-home\";s:11:\"description\";s:29:\"A portfolio homepage pattern.\";s:13:\"viewportWidth\";i:1400;s:10:\"categories\";a:2:{i:0;s:21:\"twentytwentyfive_page\";i:1;s:5:\"posts\";}s:8:\"keywords\";a:1:{i:0;s:7:\"starter\";}s:10:\"blockTypes\";a:1:{i:0;s:17:\"core/post-content\";}s:9:\"postTypes\";a:2:{i:0;s:4:\"page\";i:1;s:11:\"wp_template\";}}s:18:\"page-shop-home.php\";a:8:{s:5:\"title\";s:13:\"Shop homepage\";s:4:\"slug\";s:31:\"twentytwentyfive/page-shop-home\";s:11:\"description\";s:24:\"A shop homepage pattern.\";s:13:\"viewportWidth\";i:1400;s:10:\"categories\";a:1:{i:0;s:21:\"twentytwentyfive_page\";}s:8:\"keywords\";a:1:{i:0;s:7:\"starter\";}s:10:\"blockTypes\";a:1:{i:0;s:17:\"core/post-content\";}s:9:\"postTypes\";a:2:{i:0;s:4:\"page\";i:1;s:11:\"wp_template\";}}s:19:\"post-navigation.php\";a:5:{s:5:\"title\";s:15:\"Post navigation\";s:4:\"slug\";s:32:\"twentytwentyfive/post-navigation\";s:11:\"description\";s:29:\"Next and previous post links.\";s:10:\"categories\";a:1:{i:0;s:4:\"text\";}s:10:\"blockTypes\";a:1:{i:0;s:25:\"core/post-navigation-link\";}}s:17:\"pricing-2-col.php\";a:5:{s:5:\"title\";s:18:\"Pricing, 2 columns\";s:4:\"slug\";s:30:\"twentytwentyfive/pricing-2-col\";s:11:\"description\";s:88:\"Pricing section with two columns, pricing plan, description, and call-to-action buttons.\";s:13:\"viewportWidth\";i:1400;s:10:\"categories\";a:1:{i:0;s:14:\"call-to-action\";}}s:17:\"pricing-3-col.php\";a:4:{s:5:\"title\";s:18:\"Pricing, 3 columns\";s:4:\"slug\";s:30:\"twentytwentyfive/pricing-3-col\";s:11:\"description\";s:100:\"A three-column boxed pricing table designed to showcase services, descriptions, and pricing options.\";s:10:\"categories\";a:3:{i:0;s:14:\"call-to-action\";i:1;s:6:\"banner\";i:2;s:8:\"services\";}}s:18:\"services-3-col.php\";a:4:{s:5:\"title\";s:19:\"Services, 3 columns\";s:4:\"slug\";s:31:\"twentytwentyfive/services-3-col\";s:11:\"description\";s:56:\"Three columns with images and text to showcase services.\";s:10:\"categories\";a:3:{i:0;s:14:\"call-to-action\";i:1;s:6:\"banner\";i:2;s:8:\"services\";}}s:36:\"services-subscriber-only-section.php\";a:4:{s:5:\"title\";s:33:\"Services, subscriber only section\";s:4:\"slug\";s:49:\"twentytwentyfive/services-subscriber-only-section\";s:11:\"description\";s:72:\"A subscriber-only section highlighting exclusive services and offerings.\";s:10:\"categories\";a:2:{i:0;s:14:\"call-to-action\";i:1;s:8:\"services\";}}s:24:\"services-team-photos.php\";a:4:{s:5:\"title\";s:21:\"Services, team photos\";s:4:\"slug\";s:37:\"twentytwentyfive/services-team-photos\";s:11:\"description\";s:59:\"Display team photos in a services section with grid layout.\";s:10:\"categories\";a:3:{i:0;s:6:\"banner\";i:1;s:14:\"call-to-action\";i:2;s:8:\"featured\";}}s:37:\"template-404-vertical-header-blog.php\";a:5:{s:5:\"title\";s:17:\"Right-aligned 404\";s:4:\"slug\";s:50:\"twentytwentyfive/template-404-vertical-header-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:13:\"templateTypes\";a:1:{i:0;s:3:\"404\";}}s:30:\"template-archive-news-blog.php\";a:6:{s:5:\"title\";s:17:\"News blog archive\";s:4:\"slug\";s:43:\"twentytwentyfive/template-archive-news-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:1:{i:0;s:7:\"archive\";}}s:31:\"template-archive-photo-blog.php\";a:6:{s:5:\"title\";s:18:\"Photo blog archive\";s:4:\"slug\";s:44:\"twentytwentyfive/template-archive-photo-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:1:{i:0;s:7:\"archive\";}}s:30:\"template-archive-text-blog.php\";a:6:{s:5:\"title\";s:17:\"Text blog archive\";s:4:\"slug\";s:43:\"twentytwentyfive/template-archive-text-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:1:{i:0;s:7:\"archive\";}}s:41:\"template-archive-vertical-header-blog.php\";a:6:{s:5:\"title\";s:21:\"Right-aligned archive\";s:4:\"slug\";s:54:\"twentytwentyfive/template-archive-vertical-header-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:1:{i:0;s:7:\"archive\";}}s:27:\"template-home-news-blog.php\";a:6:{s:5:\"title\";s:14:\"News blog home\";s:4:\"slug\";s:40:\"twentytwentyfive/template-home-news-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:3:{i:0;s:10:\"front-page\";i:1;s:5:\"index\";i:2;s:4:\"home\";}}s:28:\"template-home-photo-blog.php\";a:6:{s:5:\"title\";s:15:\"Photo blog home\";s:4:\"slug\";s:41:\"twentytwentyfive/template-home-photo-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:3:{i:0;s:10:\"front-page\";i:1;s:5:\"index\";i:2;s:4:\"home\";}}s:38:\"template-home-posts-grid-news-blog.php\";a:5:{s:5:\"title\";s:34:\"News blog with featured posts grid\";s:4:\"slug\";s:51:\"twentytwentyfive/template-home-posts-grid-news-blog\";s:11:\"description\";s:0:\"\";s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:3:{i:0;s:10:\"front-page\";i:1;s:5:\"index\";i:2;s:4:\"home\";}}s:27:\"template-home-text-blog.php\";a:6:{s:5:\"title\";s:14:\"Text blog home\";s:4:\"slug\";s:40:\"twentytwentyfive/template-home-text-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:2:{i:0;s:10:\"front-page\";i:1;s:4:\"home\";}}s:38:\"template-home-vertical-header-blog.php\";a:6:{s:5:\"title\";s:18:\"Right-aligned home\";s:4:\"slug\";s:51:\"twentytwentyfive/template-home-vertical-header-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:3:{i:0;s:10:\"front-page\";i:1;s:5:\"index\";i:2;s:4:\"home\";}}s:40:\"template-home-with-sidebar-news-blog.php\";a:6:{s:5:\"title\";s:22:\"News blog with sidebar\";s:4:\"slug\";s:53:\"twentytwentyfive/template-home-with-sidebar-news-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:3:{i:0;s:10:\"front-page\";i:1;s:5:\"index\";i:2;s:4:\"home\";}}s:28:\"template-page-photo-blog.php\";a:5:{s:5:\"title\";s:15:\"Photo blog page\";s:4:\"slug\";s:41:\"twentytwentyfive/template-page-photo-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:13:\"templateTypes\";a:1:{i:0;s:4:\"page\";}}s:38:\"template-page-vertical-header-blog.php\";a:5:{s:5:\"title\";s:18:\"Right-aligned page\";s:4:\"slug\";s:51:\"twentytwentyfive/template-page-vertical-header-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:13:\"templateTypes\";a:1:{i:0;s:4:\"page\";}}s:33:\"template-query-loop-news-blog.php\";a:4:{s:5:\"title\";s:20:\"News blog query loop\";s:4:\"slug\";s:46:\"twentytwentyfive/template-query-loop-news-blog\";s:11:\"description\";s:0:\"\";s:8:\"inserter\";b:0;}s:34:\"template-query-loop-photo-blog.php\";a:6:{s:5:\"title\";s:16:\"Photo blog posts\";s:4:\"slug\";s:47:\"twentytwentyfive/template-query-loop-photo-blog\";s:11:\"description\";s:54:\"A list of posts, 3 columns, with only featured images.\";s:13:\"viewportWidth\";i:1400;s:10:\"categories\";a:1:{i:0;s:5:\"query\";}s:10:\"blockTypes\";a:1:{i:0;s:10:\"core/query\";}}s:33:\"template-query-loop-text-blog.php\";a:4:{s:5:\"title\";s:20:\"Text blog query loop\";s:4:\"slug\";s:46:\"twentytwentyfive/template-query-loop-text-blog\";s:11:\"description\";s:0:\"\";s:8:\"inserter\";b:0;}s:44:\"template-query-loop-vertical-header-blog.php\";a:4:{s:5:\"title\";s:24:\"Right-aligned query loop\";s:4:\"slug\";s:57:\"twentytwentyfive/template-query-loop-vertical-header-blog\";s:11:\"description\";s:0:\"\";s:8:\"inserter\";b:0;}s:23:\"template-query-loop.php\";a:5:{s:5:\"title\";s:23:\"List of posts, 1 column\";s:4:\"slug\";s:36:\"twentytwentyfive/template-query-loop\";s:11:\"description\";s:61:\"A list of posts, 1 column, with featured image and post date.\";s:10:\"categories\";a:1:{i:0;s:5:\"query\";}s:10:\"blockTypes\";a:1:{i:0;s:10:\"core/query\";}}s:29:\"template-search-news-blog.php\";a:6:{s:5:\"title\";s:24:\"News blog search results\";s:4:\"slug\";s:42:\"twentytwentyfive/template-search-news-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:1:{i:0;s:6:\"search\";}}s:30:\"template-search-photo-blog.php\";a:6:{s:5:\"title\";s:25:\"Photo blog search results\";s:4:\"slug\";s:43:\"twentytwentyfive/template-search-photo-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:1:{i:0;s:6:\"search\";}}s:29:\"template-search-text-blog.php\";a:6:{s:5:\"title\";s:24:\"Text blog search results\";s:4:\"slug\";s:42:\"twentytwentyfive/template-search-text-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:1:{i:0;s:6:\"search\";}}s:40:\"template-search-vertical-header-blog.php\";a:6:{s:5:\"title\";s:26:\"Right-aligned blog, search\";s:4:\"slug\";s:53:\"twentytwentyfive/template-search-vertical-header-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:1:{i:0;s:6:\"search\";}}s:40:\"template-single-left-aligned-content.php\";a:6:{s:5:\"title\";s:30:\"Post with left-aligned content\";s:4:\"slug\";s:47:\"twentytwentyfive/post-with-left-aligned-content\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:2:{i:0;s:5:\"posts\";i:1;s:6:\"single\";}}s:29:\"template-single-news-blog.php\";a:6:{s:5:\"title\";s:34:\"News blog single post with sidebar\";s:4:\"slug\";s:42:\"twentytwentyfive/template-single-news-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:2:{i:0;s:5:\"posts\";i:1;s:6:\"single\";}}s:26:\"template-single-offset.php\";a:6:{s:5:\"title\";s:34:\"Offset post without featured image\";s:4:\"slug\";s:39:\"twentytwentyfive/template-single-offset\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:2:{i:0;s:5:\"posts\";i:1;s:6:\"single\";}}s:30:\"template-single-photo-blog.php\";a:6:{s:5:\"title\";s:22:\"Photo blog single post\";s:4:\"slug\";s:43:\"twentytwentyfive/template-single-photo-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:2:{i:0;s:5:\"posts\";i:1;s:6:\"single\";}}s:29:\"template-single-text-blog.php\";a:6:{s:5:\"title\";s:21:\"Text blog single post\";s:4:\"slug\";s:42:\"twentytwentyfive/template-single-text-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:2:{i:0;s:5:\"posts\";i:1;s:6:\"single\";}}s:40:\"template-single-vertical-header-blog.php\";a:6:{s:5:\"title\";s:25:\"Right-aligned single post\";s:4:\"slug\";s:53:\"twentytwentyfive/template-single-vertical-header-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:2:{i:0;s:5:\"posts\";i:1;s:6:\"single\";}}s:22:\"testimonials-2-col.php\";a:5:{s:5:\"title\";s:21:\"2 columns with avatar\";s:4:\"slug\";s:35:\"twentytwentyfive/testimonials-2-col\";s:11:\"description\";s:42:\"Two columns with testimonials and avatars.\";s:10:\"categories\";a:1:{i:0;s:12:\"testimonials\";}s:8:\"keywords\";a:1:{i:0;s:11:\"testimonial\";}}s:22:\"testimonials-6-col.php\";a:5:{s:5:\"title\";s:35:\"3 column layout with 6 testimonials\";s:4:\"slug\";s:35:\"twentytwentyfive/testimonials-6-col\";s:11:\"description\";s:86:\"A section with three columns and two rows, each containing a testimonial and citation.\";s:10:\"categories\";a:1:{i:0;s:12:\"testimonials\";}s:8:\"keywords\";a:1:{i:0;s:11:\"testimonial\";}}s:22:\"testimonials-large.php\";a:5:{s:5:\"title\";s:32:\"Review with large image on right\";s:4:\"slug\";s:35:\"twentytwentyfive/testimonials-large\";s:11:\"description\";s:46:\"A testimonial with a large image on the right.\";s:10:\"categories\";a:1:{i:0;s:12:\"testimonials\";}s:8:\"keywords\";a:1:{i:0;s:11:\"testimonial\";}}s:13:\"text-faqs.php\";a:6:{s:5:\"title\";s:4:\"FAQs\";s:4:\"slug\";s:26:\"twentytwentyfive/text-faqs\";s:11:\"description\";s:68:\"A FAQs section with a FAQ heading and list of questions and answers.\";s:13:\"viewportWidth\";i:1400;s:10:\"categories\";a:2:{i:0;s:4:\"text\";i:1;s:5:\"about\";}s:8:\"keywords\";a:5:{i:0;s:3:\"faq\";i:1;s:5:\"about\";i:2;s:10:\"frequently\";i:3;s:5:\"asked\";i:4;s:9:\"questions\";}}s:19:\"vertical-header.php\";a:6:{s:5:\"title\";s:20:\"Vertical site header\";s:4:\"slug\";s:32:\"twentytwentyfive/vertical-header\";s:11:\"description\";s:52:\"Vertical site header with site title and navigation.\";s:13:\"viewportWidth\";i:300;s:10:\"categories\";a:1:{i:0;s:6:\"header\";}s:10:\"blockTypes\";a:1:{i:0;s:34:\"core/template-part/vertical-header\";}}}}', 'off'),
(324, '_site_transient_timeout_theme_roots', '1750200782', 'off'),
(325, '_site_transient_theme_roots', 'a:4:{s:16:\"twentytwentyfive\";s:7:\"/themes\";s:16:\"twentytwentyfour\";s:7:\"/themes\";s:17:\"twentytwentythree\";s:7:\"/themes\";s:15:\"twentytwentytwo\";s:7:\"/themes\";}', 'off'),
(326, '_site_transient_timeout_php_check_da775d00ae55849f14f81cf79fc50d46', '1750803784', 'off'),
(327, '_site_transient_php_check_da775d00ae55849f14f81cf79fc50d46', 'a:5:{s:19:\"recommended_version\";s:3:\"7.4\";s:15:\"minimum_version\";s:6:\"7.2.24\";s:12:\"is_supported\";b:1;s:9:\"is_secure\";b:1;s:13:\"is_acceptable\";b:1;}', 'off');

-- --------------------------------------------------------

--
-- Estrutura para tabela `wp_postmeta`
--

CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Despejando dados para a tabela `wp_postmeta`
--

INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(3, 6, '_wp_attached_file', '2025/04/Tesoura.png'),
(4, 6, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:512;s:6:\"height\";i:512;s:4:\"file\";s:19:\"2025/04/Tesoura.png\";s:8:\"filesize\";i:24483;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(9, 11, '_edit_lock', '1746656768:1'),
(10, 12, '_wp_attached_file', '2025/04/pexels-104274529-10600173.jpg'),
(11, 12, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:2000;s:6:\"height\";i:2996;s:4:\"file\";s:37:\"2025/04/pexels-104274529-10600173.jpg\";s:8:\"filesize\";i:580342;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(12, 13, '_wp_attached_file', '2025/04/pexels-freestockpro-12956087.jpg'),
(13, 13, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:2000;s:6:\"height\";i:1333;s:4:\"file\";s:40:\"2025/04/pexels-freestockpro-12956087.jpg\";s:8:\"filesize\";i:310224;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(14, 14, '_wp_attached_file', '2025/04/pexels-john-tekeridis-21837-14256897.jpg'),
(15, 14, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:2000;s:6:\"height\";i:1333;s:4:\"file\";s:48:\"2025/04/pexels-john-tekeridis-21837-14256897.jpg\";s:8:\"filesize\";i:303207;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(16, 15, '_wp_attached_file', '2025/04/pexels-karolina-grabowska-6629521.jpg'),
(17, 15, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:2000;s:6:\"height\";i:1333;s:4:\"file\";s:45:\"2025/04/pexels-karolina-grabowska-6629521.jpg\";s:8:\"filesize\";i:340019;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(18, 16, '_wp_attached_file', '2025/04/pexels-polina-kovaleva-5927811.jpg'),
(19, 16, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:2000;s:6:\"height\";i:1334;s:4:\"file\";s:42:\"2025/04/pexels-polina-kovaleva-5927811.jpg\";s:8:\"filesize\";i:239767;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(20, 17, '_wp_attached_file', '2025/04/pexels-vigot-lucero-1189391497-23532307.jpg'),
(21, 17, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:2000;s:6:\"height\";i:3000;s:4:\"file\";s:51:\"2025/04/pexels-vigot-lucero-1189391497-23532307.jpg\";s:8:\"filesize\";i:741441;s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(24, 11, '_thumbnail_id', '14'),
(37, 24, '_edit_lock', '1746663750:1'),
(38, 26, '_edit_lock', '1746485494:1'),
(39, 29, '_edit_lock', '1746485813:1'),
(40, 31, '_edit_lock', '1746663796:1'),
(42, 35, '_edit_lock', '1746663828:1'),
(44, 38, '_edit_lock', '1746656562:1'),
(57, 38, '_thumbnail_id', '12'),
(58, 35, '_edit_last', '1'),
(59, 35, 'footnotes', ''),
(65, 47, '_edit_lock', '1746656844:1'),
(68, 47, '_thumbnail_id', '13'),
(69, 49, '_edit_lock', '1746656970:1'),
(72, 49, '_thumbnail_id', '16'),
(73, 51, '_edit_lock', '1746662926:1'),
(76, 51, '_thumbnail_id', '15'),
(77, 53, '_edit_lock', '1746663106:1'),
(80, 53, '_thumbnail_id', '17'),
(81, 57, 'footnotes', '');

-- --------------------------------------------------------

--
-- Estrutura para tabela `wp_posts`
--

CREATE TABLE `wp_posts` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `post_author` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext NOT NULL,
  `post_title` text NOT NULL,
  `post_excerpt` text NOT NULL,
  `post_status` varchar(20) NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) NOT NULL DEFAULT 'open',
  `post_password` varchar(255) NOT NULL DEFAULT '',
  `post_name` varchar(200) NOT NULL DEFAULT '',
  `to_ping` text NOT NULL,
  `pinged` text NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext NOT NULL,
  `post_parent` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `guid` varchar(255) NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT 0,
  `post_type` varchar(20) NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Despejando dados para a tabela `wp_posts`
--

INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(6, 1, '2025-04-30 20:28:29', '2025-04-30 23:28:29', '', 'Tesoura', '', 'inherit', 'open', 'closed', '', 'tesoura', '', '', '2025-04-30 20:28:29', '2025-04-30 23:28:29', '', 0, 'http://localhost/blog-Estetique/wp-content/uploads/2025/04/Tesoura.png', 0, 'attachment', 'image/png', 0),
(7, 1, '2025-04-30 20:39:44', '2025-04-30 23:39:44', '{\"version\": 3, \"isGlobalStylesUserThemeJSON\": true }', 'Custom Styles', '', 'publish', 'closed', 'closed', '', 'wp-global-styles-twentytwentythree', '', '', '2025-04-30 20:39:44', '2025-04-30 23:39:44', '', 0, 'http://localhost/blog-Estetique/2025/04/30/wp-global-styles-twentytwentythree/', 0, 'wp_global_styles', '', 0),
(8, 1, '2025-04-30 21:14:22', '2025-05-01 00:14:22', '{\"styles\":{\"blocks\":{\"core\\/post-terms\":{\"typography\":{\"fontWeight\":\"500\"},\"variations\":{\"post-terms-1\":{\"elements\":{\"link\":{\"border\":{\"color\":\"var(--wp--preset--color--accent-5)\"},\"color\":{\"background\":\"var(--wp--preset--color--accent-5)\"}}}}}},\"core\\/pullquote\":{\"typography\":{\"fontFamily\":\"var(--wp--preset--font-family--roboto-slab)\",\"fontSize\":\"var(--wp--preset--font-size--xx-large)\",\"fontWeight\":\"200\"},\"elements\":{\"cite\":{\"color\":{\"text\":\"var(--wp--preset--color--accent-4)\"}}},\"color\":{\"text\":\"var(--wp--preset--color--contrast)\"}},\"core\\/site-tagline\":{\"typography\":{\"fontSize\":\"var(--wp--preset--font-size--large)\"}},\"core\\/site-title\":{\"typography\":{\"textTransform\":\"uppercase\"}},\"core\\/column\":{\"variations\":{\"section-2\":{\"elements\":{\"button\":{\":hover\":{\"color\":{\"background\":\"color-mix(in srgb, var(--wp--preset--color--accent-1) 85%, transparent)\"}},\"color\":{\"background\":\"var(--wp--preset--color--accent-1)\",\"text\":\"var(--wp--preset--color--contrast)\"}}}},\"section-3\":{\"elements\":{\"button\":{\":hover\":{\"color\":{\"background\":\"color-mix(in srgb, var(--wp--preset--color--contrast) 85%, transparent)\"}},\"color\":{\"background\":\"var(--wp--preset--color--contrast)\",\"text\":\"var(--wp--preset--color--base)\"}}}},\"section-4\":{\"elements\":{\"link\":{\"color\":{\"text\":\"currentColor\"}},\"button\":{\":hover\":{\"color\":{\"background\":\"color-mix(in srgb, var(--wp--preset--color--accent-1) 85%, transparent)\",\"text\":\"var(--wp--preset--color--contrast)\"}},\"color\":{\"background\":\"var(--wp--preset--color--accent-1)\",\"text\":\"var(--wp--preset--color--contrast)\"}},\"heading\":{\"color\":{\"text\":\"currentColor\"}}},\"color\":{\"text\":\"var(--wp--preset--color--base)\"}},\"section-5\":{\"elements\":{\"heading\":{\"color\":{\"text\":\"var(--wp--preset--color--base)\"}},\"link\":{\"color\":{\"text\":\"currentColor\"}},\"button\":{\":hover\":{\"color\":{\"background\":\"color-mix(in srgb, var(--wp--preset--color--accent-1) 85%, transparent)\"}},\"color\":{\"background\":\"var(--wp--preset--color--accent-1)\",\"text\":\"var(--wp--preset--color--contrast)\"}}}}}},\"core\\/columns\":{\"variations\":{\"section-2\":{\"elements\":{\"button\":{\":hover\":{\"color\":{\"background\":\"color-mix(in srgb, var(--wp--preset--color--accent-1) 85%, transparent)\"}},\"color\":{\"background\":\"var(--wp--preset--color--accent-1)\",\"text\":\"var(--wp--preset--color--contrast)\"}}}},\"section-3\":{\"elements\":{\"button\":{\":hover\":{\"color\":{\"background\":\"color-mix(in srgb, var(--wp--preset--color--contrast) 85%, transparent)\"}},\"color\":{\"background\":\"var(--wp--preset--color--contrast)\",\"text\":\"var(--wp--preset--color--base)\"}}}},\"section-4\":{\"elements\":{\"link\":{\"color\":{\"text\":\"currentColor\"}},\"button\":{\":hover\":{\"color\":{\"background\":\"color-mix(in srgb, var(--wp--preset--color--accent-1) 85%, transparent)\",\"text\":\"var(--wp--preset--color--contrast)\"}},\"color\":{\"background\":\"var(--wp--preset--color--accent-1)\",\"text\":\"var(--wp--preset--color--contrast)\"}},\"heading\":{\"color\":{\"text\":\"currentColor\"}}},\"color\":{\"text\":\"var(--wp--preset--color--base)\"}},\"section-5\":{\"elements\":{\"heading\":{\"color\":{\"text\":\"var(--wp--preset--color--base)\"}},\"link\":{\"color\":{\"text\":\"currentColor\"}},\"button\":{\":hover\":{\"color\":{\"background\":\"color-mix(in srgb, var(--wp--preset--color--accent-1) 85%, transparent)\"}},\"color\":{\"background\":\"var(--wp--preset--color--accent-1)\",\"text\":\"var(--wp--preset--color--contrast)\"}}}}}},\"core\\/group\":{\"variations\":{\"section-2\":{\"elements\":{\"button\":{\":hover\":{\"color\":{\"background\":\"color-mix(in srgb, var(--wp--preset--color--accent-1) 85%, transparent)\"}},\"color\":{\"background\":\"var(--wp--preset--color--accent-1)\",\"text\":\"var(--wp--preset--color--contrast)\"}}}},\"section-3\":{\"elements\":{\"button\":{\":hover\":{\"color\":{\"background\":\"color-mix(in srgb, var(--wp--preset--color--contrast) 85%, transparent)\"}},\"color\":{\"background\":\"var(--wp--preset--color--contrast)\",\"text\":\"var(--wp--preset--color--base)\"}}}},\"section-4\":{\"elements\":{\"link\":{\"color\":{\"text\":\"currentColor\"}},\"button\":{\":hover\":{\"color\":{\"background\":\"color-mix(in srgb, var(--wp--preset--color--accent-1) 85%, transparent)\",\"text\":\"var(--wp--preset--color--contrast)\"}},\"color\":{\"background\":\"var(--wp--preset--color--accent-1)\",\"text\":\"var(--wp--preset--color--contrast)\"}},\"heading\":{\"color\":{\"text\":\"currentColor\"}}},\"color\":{\"text\":\"var(--wp--preset--color--base)\"}},\"section-5\":{\"elements\":{\"heading\":{\"color\":{\"text\":\"var(--wp--preset--color--base)\"}},\"link\":{\"color\":{\"text\":\"currentColor\"}},\"button\":{\":hover\":{\"color\":{\"background\":\"color-mix(in srgb, var(--wp--preset--color--accent-1) 85%, transparent)\"}},\"color\":{\"background\":\"var(--wp--preset--color--accent-1)\",\"text\":\"var(--wp--preset--color--contrast)\"}}}}}},\"core\\/navigation\":{\"typography\":{\"fontSize\":\"var(--wp--preset--font-size--large)\",\"letterSpacing\":\"-0.28px\",\"textTransform\":\"uppercase\"}},\"core\\/post-author\":{\"typography\":{\"fontSize\":\"var(--wp--preset--font-size--small)\"}},\"core\\/post-author-name\":{\"typography\":{\"fontSize\":\"var(--wp--preset--font-size--small)\"},\"elements\":{\"link\":{\"color\":{\"text\":\"var(--wp--preset--color--contrast)\"}}}},\"core\\/search\":{\"typography\":{\"textTransform\":\"uppercase\"}},\"core\\/code\":{\"color\":{\"text\":\"var(--wp--preset--color--contrast)\",\"background\":\"var(--wp--preset--color--accent-5)\"}},\"core\\/post-title\":{\"elements\":{\"link\":{\"color\":{\"text\":\"var(--wp--preset--color--contrast)\"}}}},\"core\\/quote\":{\"elements\":{\"cite\":{\"color\":{\"text\":\"var(--wp--preset--color--accent-4)\"}}}},\"core\\/paragraph\":{\"elements\":{\"link\":{\"color\":{\"text\":\"var(--wp--preset--color--contrast)\"}}}}},\"elements\":{\"heading\":{\"typography\":{\"fontFamily\":\"var(--wp--preset--font-family--roboto-slab)\",\"fontWeight\":\"300\",\"letterSpacing\":\"-0.5px\",\"lineHeight\":\"1.2\"},\"color\":{\"text\":\"var(--wp--preset--color--contrast)\"}},\"button\":{\"typography\":{\"fontWeight\":\"500\",\"letterSpacing\":\"-0.36px\",\"textTransform\":\"uppercase\"},\":hover\":{\"color\":{\"background\":\"color-mix(in srgb, var(--wp--preset--color--accent-1) 85%, transparent)\",\"text\":\"var(--wp--preset--color--contrast)\"}},\"color\":{\"text\":\"var(--wp--preset--color--contrast)\",\"background\":\"var(--wp--preset--color--accent-1)\"}},\"link\":{\"color\":{\"text\":\"currentColor\"}}},\"typography\":{\"letterSpacing\":\"0\"},\"color\":{\"text\":\"var(--wp--preset--color--accent-4)\"}},\"settings\":{\"typography\":{\"fontFamilies\":{\"theme\":[{\"name\":\"Roboto Slab\",\"slug\":\"roboto-slab\",\"fontFamily\":\"\\\"Roboto Slab\\\", serif\",\"fontFace\":[{\"fontFamily\":\"\\\"Roboto Slab\\\"\",\"fontStyle\":\"normal\",\"fontWeight\":\"100 900\",\"src\":[\"file:.\\/assets\\/fonts\\/roboto-slab\\/RobotoSlab-VariableFont_wght.woff2\"]}]},{\"name\":\"Manrope\",\"slug\":\"manrope\",\"fontFamily\":\"Manrope, sans-serif\",\"fontFace\":[{\"src\":[\"file:.\\/assets\\/fonts\\/manrope\\/Manrope-VariableFont_wght.woff2\"],\"fontWeight\":\"200 800\",\"fontStyle\":\"normal\",\"fontFamily\":\"Manrope\"}]}]},\"fontSizes\":{\"theme\":[{\"fluid\":false,\"name\":\"Pequeno\",\"size\":\"0.875rem\",\"slug\":\"small\"},{\"fluid\":{\"max\":\"1.125rem\",\"min\":\"1rem\"},\"name\":\"M\\u00e9dia\",\"size\":\"1rem\",\"slug\":\"medium\"},{\"fluid\":{\"max\":\"1.375rem\",\"min\":\"1.125rem\"},\"name\":\"Grande\",\"size\":\"1.38rem\",\"slug\":\"large\"},{\"fluid\":{\"max\":\"2rem\",\"min\":\"1.75rem\"},\"name\":\"Extra grande\",\"size\":\"1.75rem\",\"slug\":\"x-large\"},{\"fluid\":{\"max\":\"2.4rem\",\"min\":\"2.15rem\"},\"name\":\"Extra extra grande\",\"size\":\"2.15rem\",\"slug\":\"xx-large\"}]}},\"color\":{\"palette\":{\"theme\":[{\"color\":\"#DFDCD7\",\"name\":\"Base\",\"slug\":\"base\"},{\"color\":\"#191919\",\"name\":\"Contraste\",\"slug\":\"contrast\"},{\"color\":\"#7A9BDB\",\"name\":\"Realce 1\",\"slug\":\"accent-1\"},{\"color\":\"#F7E6FF\",\"name\":\"Realce 2\",\"slug\":\"accent-2\"},{\"color\":\"#182949\",\"name\":\"Realce 3\",\"slug\":\"accent-3\"},{\"color\":\"#5F5F5F\",\"name\":\"Realce 4\",\"slug\":\"accent-4\"},{\"color\":\"#D7D3CC\",\"name\":\"Realce 5\",\"slug\":\"accent-5\"},{\"color\":\"#19191933\",\"name\":\"Realce 6\",\"slug\":\"accent-6\"}]}}},\"isGlobalStylesUserThemeJSON\":true,\"version\":3}', 'Custom Styles', '', 'publish', 'closed', 'closed', '', 'wp-global-styles-twentytwentyfive', '', '', '2025-05-07 22:04:48', '2025-05-08 01:04:48', '', 0, 'http://localhost/blog-Estetique/2025/04/30/wp-global-styles-twentytwentyfive/', 0, 'wp_global_styles', '', 0),
(9, 1, '2025-04-30 21:25:28', '2025-05-01 00:25:28', '{\"styles\":{\"blocks\":{\"core\\/button\":{\"border\":{\"color\":\"var(--wp--preset--color--contrast)\"}},\"core\\/post-terms\":{\"typography\":{\"fontWeight\":\"500\"}},\"core\\/pullquote\":{\"elements\":{\"link\":{\"color\":{\"text\":\"currentColor\"}}},\"color\":{\"text\":\"var(--wp--preset--color--accent-3)\"},\"typography\":{\"fontFamily\":\"var(--wp--preset--font-family--roboto-slab)\",\"fontSize\":\"var(--wp--preset--font-size--xx-large)\",\"fontWeight\":\"200\"}},\"core\\/site-tagline\":{\"typography\":{\"fontSize\":\"var(--wp--preset--font-size--large)\"}},\"core\\/site-title\":{\"typography\":{\"textTransform\":\"uppercase\"}},\"core\\/column\":{\"variations\":{\"section-4\":{\"elements\":{\"button\":{\":hover\":{\"color\":{\"background\":\"color-mix(in srgb, var(--wp--preset--color--accent-2) 85%, transparent)\"}}},\"link\":{\"color\":{\"text\":\"currentColor\"}},\"heading\":{\"color\":{\"text\":\"currentColor\"}}},\"color\":{\"text\":\"var(--wp--preset--color--accent-2)\"}},\"section-5\":{\"elements\":{\"button\":{\":hover\":{\"color\":{\"background\":\"color-mix(in srgb, var(--wp--preset--color--base) 85%, transparent)\"}}},\"heading\":{\"color\":{\"text\":\"var(--wp--preset--color--base)\"}},\"link\":{\"color\":{\"text\":\"currentColor\"}}},\"color\":{\"text\":\"var(--wp--preset--color--base)\"}}}},\"core\\/columns\":{\"variations\":{\"section-4\":{\"elements\":{\"button\":{\":hover\":{\"color\":{\"background\":\"color-mix(in srgb, var(--wp--preset--color--accent-2) 85%, transparent)\"}}},\"link\":{\"color\":{\"text\":\"currentColor\"}},\"heading\":{\"color\":{\"text\":\"currentColor\"}}},\"color\":{\"text\":\"var(--wp--preset--color--accent-2)\"}},\"section-5\":{\"elements\":{\"button\":{\":hover\":{\"color\":{\"background\":\"color-mix(in srgb, var(--wp--preset--color--base) 85%, transparent)\"}}},\"heading\":{\"color\":{\"text\":\"var(--wp--preset--color--base)\"}},\"link\":{\"color\":{\"text\":\"currentColor\"}}},\"color\":{\"text\":\"var(--wp--preset--color--base)\"}}}},\"core\\/group\":{\"variations\":{\"section-4\":{\"elements\":{\"button\":{\":hover\":{\"color\":{\"background\":\"color-mix(in srgb, var(--wp--preset--color--accent-2) 85%, transparent)\"}}},\"link\":{\"color\":{\"text\":\"currentColor\"}},\"heading\":{\"color\":{\"text\":\"currentColor\"}}},\"color\":{\"text\":\"var(--wp--preset--color--accent-2)\"}},\"section-5\":{\"elements\":{\"button\":{\":hover\":{\"color\":{\"background\":\"color-mix(in srgb, var(--wp--preset--color--base) 85%, transparent)\"}}},\"heading\":{\"color\":{\"text\":\"var(--wp--preset--color--base)\"}},\"link\":{\"color\":{\"text\":\"currentColor\"}}},\"color\":{\"text\":\"var(--wp--preset--color--base)\"}}}},\"core\\/post-title\":{\"elements\":{\"link\":{\"color\":{\"text\":\"currentColor\"}}},\"color\":{\"text\":\"var(--wp--preset--color--accent-3)\"}},\"core\\/query-title\":{\"color\":{\"text\":\"var(--wp--preset--color--accent-3)\"},\"elements\":{\"link\":{\"color\":{\"text\":\"currentColor\"}}}},\"core\\/navigation\":{\"typography\":{\"fontSize\":\"var(--wp--preset--font-size--large)\",\"letterSpacing\":\"-0.28px\",\"textTransform\":\"uppercase\"}},\"core\\/post-author\":{\"typography\":{\"fontSize\":\"var(--wp--preset--font-size--small)\"}},\"core\\/post-author-name\":{\"typography\":{\"fontSize\":\"var(--wp--preset--font-size--small)\"}},\"core\\/search\":{\"typography\":{\"textTransform\":\"uppercase\"}}},\"elements\":{\"heading\":{\"color\":{\"text\":\"var(--wp--preset--color--accent-3)\"},\"typography\":{\"fontFamily\":\"var(--wp--preset--font-family--roboto-slab)\",\"fontWeight\":\"300\",\"letterSpacing\":\"-0.5px\",\"lineHeight\":\"1.2\"}},\"button\":{\"color\":{\"background\":\"var(--wp--preset--color--contrast)\",\"text\":\"var(--wp--preset--color--base)\"},\"typography\":{\"fontWeight\":\"500\",\"letterSpacing\":\"-0.36px\",\"textTransform\":\"uppercase\"}},\"link\":{\"color\":{\"text\":\"currentColor\"}}},\"color\":{\"text\":\"var(--wp--preset--color--accent-4)\"},\"typography\":{\"letterSpacing\":\"0\"}},\"settings\":{\"color\":{\"palette\":{\"theme\":[{\"color\":\"#F8F7F5\",\"name\":\"Base\",\"slug\":\"base\"},{\"color\":\"#191919\",\"name\":\"Contraste\",\"slug\":\"contrast\"},{\"color\":\"#FFFFFF\",\"name\":\"Realce 1\",\"slug\":\"accent-1\"},{\"color\":\"#F5B684\",\"name\":\"Realce 2\",\"slug\":\"accent-2\"},{\"color\":\"#191919\",\"name\":\"Realce 3\",\"slug\":\"accent-3\"},{\"color\":\"#5F5F5F\",\"name\":\"Realce 4\",\"slug\":\"accent-4\"},{\"color\":\"#F1EEE9\",\"name\":\"Realce 5\",\"slug\":\"accent-5\"},{\"color\":\"#19191933\",\"name\":\"Realce 6\",\"slug\":\"accent-6\"}]}},\"typography\":{\"fontFamilies\":{\"theme\":[{\"name\":\"Roboto Slab\",\"slug\":\"roboto-slab\",\"fontFamily\":\"\\\"Roboto Slab\\\", serif\",\"fontFace\":[{\"fontFamily\":\"\\\"Roboto Slab\\\"\",\"fontStyle\":\"normal\",\"fontWeight\":\"100 900\",\"src\":[\"file:.\\/assets\\/fonts\\/roboto-slab\\/RobotoSlab-VariableFont_wght.woff2\"]}]},{\"name\":\"Manrope\",\"slug\":\"manrope\",\"fontFamily\":\"Manrope, sans-serif\",\"fontFace\":[{\"src\":[\"file:.\\/assets\\/fonts\\/manrope\\/Manrope-VariableFont_wght.woff2\"],\"fontWeight\":\"200 800\",\"fontStyle\":\"normal\",\"fontFamily\":\"Manrope\"}]}]},\"fontSizes\":{\"theme\":[{\"fluid\":false,\"name\":\"Pequeno\",\"size\":\"0.875rem\",\"slug\":\"small\"},{\"fluid\":{\"max\":\"1.125rem\",\"min\":\"1rem\"},\"name\":\"M\\u00e9dia\",\"size\":\"1rem\",\"slug\":\"medium\"},{\"fluid\":{\"max\":\"1.375rem\",\"min\":\"1.125rem\"},\"name\":\"Grande\",\"size\":\"1.38rem\",\"slug\":\"large\"},{\"fluid\":{\"max\":\"2rem\",\"min\":\"1.75rem\"},\"name\":\"Extra grande\",\"size\":\"1.75rem\",\"slug\":\"x-large\"},{\"fluid\":{\"max\":\"2.4rem\",\"min\":\"2.15rem\"},\"name\":\"Extra extra grande\",\"size\":\"2.15rem\",\"slug\":\"xx-large\"}]}}},\"isGlobalStylesUserThemeJSON\":true,\"version\":3}', 'Custom Styles', '', 'inherit', 'closed', 'closed', '', '8-revision-v1', '', '', '2025-04-30 21:25:28', '2025-05-01 00:25:28', '', 8, 'http://localhost/blog-Estetique/?p=9', 0, 'revision', '', 0),
(11, 1, '2025-04-30 22:07:55', '2025-05-01 01:07:55', '<!-- wp:paragraph -->\n<p>A limpeza de pele profunda é um dos procedimentos estéticos mais procurados atualmente — e com razão. Ela remove cravos, impurezas e células mortas, permitindo que a pele respire melhor e absorva nutrientes de forma mais eficiente. Além disso, melhora a circulação sanguínea, previne o surgimento de acne e proporciona uma aparência mais saudável e viçosa. Esse tratamento deve ser feito com um profissional para garantir a eficácia e segurança do procedimento.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image {\"id\":14,\"width\":\"316px\",\"height\":\"auto\",\"sizeSlug\":\"full\",\"linkDestination\":\"none\",\"align\":\"center\"} -->\n<figure class=\"wp-block-image aligncenter size-full is-resized\"><img src=\"http://localhost/blog-Estetique/wp-content/uploads/2025/04/pexels-john-tekeridis-21837-14256897.jpg\" alt=\"\" class=\"wp-image-14\" style=\"width:316px;height:auto\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', '5 Benefícios da Limpeza de Pele Profunda Que Você Precisa Conhecer', '', 'publish', 'open', 'open', '', '5-beneficios-da-limpeza-de-pele-profunda-que-voce-precisa-conhecer', '', '', '2025-05-07 19:25:29', '2025-05-07 22:25:29', '', 0, 'http://localhost/blog-Estetique/?p=11', 0, 'post', '', 0),
(12, 1, '2025-04-30 22:06:24', '2025-05-01 01:06:24', '', 'pexels-104274529-10600173', ' Harmonização Facial', 'inherit', 'open', 'closed', '', 'pexels-104274529-10600173', '', '', '2025-05-05 19:56:09', '2025-05-05 22:56:09', '', 11, 'http://localhost/blog-Estetique/wp-content/uploads/2025/04/pexels-104274529-10600173.jpg', 0, 'attachment', 'image/jpeg', 0),
(13, 1, '2025-04-30 22:06:25', '2025-05-01 01:06:25', '', 'pexels-freestockpro-12956087', 'Estética Corporal', 'inherit', 'open', 'closed', '', 'pexels-freestockpro-12956087', '', '', '2025-05-05 19:55:47', '2025-05-05 22:55:47', '', 11, 'http://localhost/blog-Estetique/wp-content/uploads/2025/04/pexels-freestockpro-12956087.jpg', 0, 'attachment', 'image/jpeg', 0),
(14, 1, '2025-04-30 22:06:26', '2025-05-01 01:06:26', '', 'pexels-john-tekeridis-21837-14256897', 'limpeza de pele', 'inherit', 'open', 'closed', '', 'pexels-john-tekeridis-21837-14256897', '', '', '2025-05-05 19:56:20', '2025-05-05 22:56:20', '', 11, 'http://localhost/blog-Estetique/wp-content/uploads/2025/04/pexels-john-tekeridis-21837-14256897.jpg', 0, 'attachment', 'image/jpeg', 0),
(15, 1, '2025-04-30 22:06:26', '2025-05-01 01:06:26', '', 'pexels-karolina-grabowska-6629521', 'Massagens ', 'inherit', 'open', 'closed', '', 'pexels-karolina-grabowska-6629521', '', '', '2025-05-05 19:55:15', '2025-05-05 22:55:15', '', 11, 'http://localhost/blog-Estetique/wp-content/uploads/2025/04/pexels-karolina-grabowska-6629521.jpg', 0, 'attachment', 'image/jpeg', 0),
(16, 1, '2025-04-30 22:06:27', '2025-05-01 01:06:27', '', 'pexels-polina-kovaleva-5927811', 'Skincare ', 'inherit', 'open', 'closed', '', 'pexels-polina-kovaleva-5927811', '', '', '2025-05-05 19:54:42', '2025-05-05 22:54:42', '', 11, 'http://localhost/blog-Estetique/wp-content/uploads/2025/04/pexels-polina-kovaleva-5927811.jpg', 0, 'attachment', 'image/jpeg', 0),
(17, 1, '2025-04-30 22:06:28', '2025-05-01 01:06:28', '', 'pexels-vigot-lucero-1189391497-23532307', 'Micropigmentação: ', 'inherit', 'open', 'closed', '', 'pexels-vigot-lucero-1189391497-23532307', '', '', '2025-05-05 19:54:21', '2025-05-05 22:54:21', '', 11, 'http://localhost/blog-Estetique/wp-content/uploads/2025/04/pexels-vigot-lucero-1189391497-23532307.jpg', 0, 'attachment', 'image/jpeg', 0),
(18, 1, '2025-04-30 22:07:55', '2025-05-01 01:07:55', '<!-- wp:paragraph -->\n<p>A limpeza de pele profunda é um dos procedimentos estéticos mais procurados atualmente — e com razão. Ela remove cravos, impurezas e células mortas, permitindo que a pele respire melhor e absorva nutrientes de forma mais eficiente. Além disso, melhora a circulação sanguínea, previne o surgimento de acne e proporciona uma aparência mais saudável e viçosa. Esse tratamento deve ser feito com um profissional para garantir a eficácia e segurança do procedimento.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image {\"id\":14,\"sizeSlug\":\"full\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-full\"><img src=\"http://localhost/blog-Estetique/wp-content/uploads/2025/04/pexels-john-tekeridis-21837-14256897.jpg\" alt=\"\" class=\"wp-image-14\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', '5 Benefícios da Limpeza de Pele Profunda Que Você Precisa Conhecer', '', 'inherit', 'closed', 'closed', '', '11-revision-v1', '', '', '2025-04-30 22:07:55', '2025-05-01 01:07:55', '', 11, 'http://localhost/blog-Estetique/?p=18', 0, 'revision', '', 0),
(19, 1, '2025-04-30 22:08:45', '2025-05-01 01:08:45', '<!-- wp:paragraph -->\n<p>A limpeza de pele profunda é um dos procedimentos estéticos mais procurados atualmente — e com razão. Ela remove cravos, impurezas e células mortas, permitindo que a pele respire melhor e absorva nutrientes de forma mais eficiente. Além disso, melhora a circulação sanguínea, previne o surgimento de acne e proporciona uma aparência mais saudável e viçosa. Esse tratamento deve ser feito com um profissional para garantir a eficácia e segurança do procedimento.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image {\"id\":14,\"width\":\"316px\",\"height\":\"auto\",\"sizeSlug\":\"full\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-full is-resized\"><img src=\"http://localhost/blog-Estetique/wp-content/uploads/2025/04/pexels-john-tekeridis-21837-14256897.jpg\" alt=\"\" class=\"wp-image-14\" style=\"width:316px;height:auto\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', '5 Benefícios da Limpeza de Pele Profunda Que Você Precisa Conhecer', '', 'inherit', 'closed', 'closed', '', '11-revision-v1', '', '', '2025-04-30 22:08:45', '2025-05-01 01:08:45', '', 11, 'http://localhost/blog-Estetique/?p=19', 0, 'revision', '', 0),
(24, 1, '2025-05-05 19:33:53', '2025-05-05 22:33:53', '<!-- wp:paragraph -->\n<p>A limpeza de pele profunda é um dos procedimentos estéticos mais procurados atualmente — e com razão. Ela remove cravos, impurezas e células mortas, permitindo que a pele respire melhor e absorva nutrientes de forma mais eficiente. Além disso, melhora a circulação sanguínea, previne o surgimento de acne e proporciona uma aparência mais saudável e viçosa. Esse tratamento deve ser feito com um profissional para garantir a eficácia e segurança do procedimento.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image {\"id\":14,\"sizeSlug\":\"full\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-full\"><img src=\"http://localhost/blog-Estetique/wp-content/uploads/2025/04/pexels-john-tekeridis-21837-14256897.jpg\" alt=\"\" class=\"wp-image-14\"/></figure>\n<!-- /wp:image -->', 'Inicial', '', 'publish', 'closed', 'closed', '', 'inicial', '', '', '2025-05-05 19:33:53', '2025-05-05 22:33:53', '', 0, 'http://localhost/blog-Estetique/?page_id=24', 0, 'page', '', 0),
(25, 1, '2025-05-05 19:33:53', '2025-05-05 22:33:53', '<!-- wp:paragraph -->\n<p>A limpeza de pele profunda é um dos procedimentos estéticos mais procurados atualmente — e com razão. Ela remove cravos, impurezas e células mortas, permitindo que a pele respire melhor e absorva nutrientes de forma mais eficiente. Além disso, melhora a circulação sanguínea, previne o surgimento de acne e proporciona uma aparência mais saudável e viçosa. Esse tratamento deve ser feito com um profissional para garantir a eficácia e segurança do procedimento.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image {\"id\":14,\"sizeSlug\":\"full\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-full\"><img src=\"http://localhost/blog-Estetique/wp-content/uploads/2025/04/pexels-john-tekeridis-21837-14256897.jpg\" alt=\"\" class=\"wp-image-14\"/></figure>\n<!-- /wp:image -->', 'Inicial', '', 'inherit', 'closed', 'closed', '', '24-revision-v1', '', '', '2025-05-05 19:33:53', '2025-05-05 22:33:53', '', 24, 'http://localhost/blog-Estetique/?p=25', 0, 'revision', '', 0),
(26, 1, '2025-05-05 19:41:18', '2025-05-05 22:41:18', '<!-- wp:paragraph {\"className\":\"\"} -->\n<p>✨ <strong>Transforme sua beleza com nossos cuidados especializados!</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"className\":\"\"} -->\n<p>Na nossa clínica, oferecemos um atendimento completo e personalizado para realçar sua beleza natural e cuidar da sua saúde estética com excelência. Contamos com uma variedade de serviços pensados especialmente para você que busca bem-estar, autoestima e resultados visíveis sem abrir mão do conforto.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"className\":\"\"} -->\n<p>Realizamos <strong>limpeza de pele profunda</strong> para renovar e purificar a pele, <strong>tratamentos corporais não invasivos</strong> como drenagem linfática, criolipólise e massagens modeladoras para reduzir medidas e modelar o corpo, além de <strong>procedimentos faciais</strong> como a <strong>harmonização facial</strong>, que equilibra os traços do rosto de forma natural e segura.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"className\":\"\"} -->\n<p>Também oferecemos <strong>orientações de skincare personalizadas</strong>, para que você mantenha os cuidados em casa com os produtos certos, e <strong>terapias relaxantes</strong> que aliviam o estresse, promovem bem-estar e ainda refletem na saúde da sua pele. E para quem deseja realçar o olhar, temos a <strong>micropigmentação de sobrancelhas</strong>, com resultado natural, duradouro e feito com todo o cuidado.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"className\":\"\"} -->\n<p>Seja para relaxar, cuidar da pele ou transformar sua aparência, aqui você encontra tudo o que precisa em um só lugar. Agende sua avaliação e descubra o melhor da estética com quem entende de autocuidado! 🌿💆‍♀️</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:gallery {\"linkTo\":\"none\"} -->\n<figure class=\"wp-block-gallery has-nested-images columns-default is-cropped\"><!-- wp:image {\"id\":17,\"sizeSlug\":\"large\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://localhost/blog-Estetique/wp-content/uploads/2025/04/pexels-vigot-lucero-1189391497-23532307.jpg\" alt=\"\" class=\"wp-image-17\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:image {\"id\":13,\"sizeSlug\":\"large\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://localhost/blog-Estetique/wp-content/uploads/2025/04/pexels-freestockpro-12956087.jpg\" alt=\"\" class=\"wp-image-13\"/></figure>\n<!-- /wp:image --></figure>\n<!-- /wp:gallery -->', 'Sobre', '', 'publish', 'closed', 'closed', '', 'sobre', '', '', '2025-05-05 19:51:31', '2025-05-05 22:51:31', '', 0, 'http://localhost/blog-Estetique/?page_id=26', 0, 'page', '', 0),
(27, 1, '2025-05-05 19:41:18', '2025-05-05 22:41:18', '<!-- wp:paragraph {\"className\":\"\"} -->\n<p>✨ <strong>Transforme sua beleza com nossos cuidados especializados!</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"className\":\"\"} -->\n<p>Na nossa clínica, oferecemos um atendimento completo e personalizado para realçar sua beleza natural e cuidar da sua saúde estética com excelência. Contamos com uma variedade de serviços pensados especialmente para você que busca bem-estar, autoestima e resultados visíveis sem abrir mão do conforto.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"className\":\"\"} -->\n<p>Realizamos <strong>limpeza de pele profunda</strong> para renovar e purificar a pele, <strong>tratamentos corporais não invasivos</strong> como drenagem linfática, criolipólise e massagens modeladoras para reduzir medidas e modelar o corpo, além de <strong>procedimentos faciais</strong> como a <strong>harmonização facial</strong>, que equilibra os traços do rosto de forma natural e segura.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"className\":\"\"} -->\n<p>Também oferecemos <strong>orientações de skincare personalizadas</strong>, para que você mantenha os cuidados em casa com os produtos certos, e <strong>terapias relaxantes</strong> que aliviam o estresse, promovem bem-estar e ainda refletem na saúde da sua pele. E para quem deseja realçar o olhar, temos a <strong>micropigmentação de sobrancelhas</strong>, com resultado natural, duradouro e feito com todo o cuidado.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"className\":\"\"} -->\n<p>Seja para relaxar, cuidar da pele ou transformar sua aparência, aqui você encontra tudo o que precisa em um só lugar. Agende sua avaliação e descubra o melhor da estética com quem entende de autocuidado! 🌿💆‍♀️</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image {\"id\":17,\"sizeSlug\":\"full\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-full\"><img src=\"http://localhost/blog-Estetique/wp-content/uploads/2025/04/pexels-vigot-lucero-1189391497-23532307.jpg\" alt=\"\" class=\"wp-image-17\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:image {\"id\":13,\"sizeSlug\":\"full\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-full\"><img src=\"http://localhost/blog-Estetique/wp-content/uploads/2025/04/pexels-freestockpro-12956087.jpg\" alt=\"\" class=\"wp-image-13\"/></figure>\n<!-- /wp:image -->', 'Sobre', '', 'inherit', 'closed', 'closed', '', '26-revision-v1', '', '', '2025-05-05 19:41:18', '2025-05-05 22:41:18', '', 26, 'http://localhost/blog-Estetique/?p=27', 0, 'revision', '', 0),
(28, 1, '2025-05-05 19:51:31', '2025-05-05 22:51:31', '<!-- wp:paragraph {\"className\":\"\"} -->\n<p>✨ <strong>Transforme sua beleza com nossos cuidados especializados!</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"className\":\"\"} -->\n<p>Na nossa clínica, oferecemos um atendimento completo e personalizado para realçar sua beleza natural e cuidar da sua saúde estética com excelência. Contamos com uma variedade de serviços pensados especialmente para você que busca bem-estar, autoestima e resultados visíveis sem abrir mão do conforto.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"className\":\"\"} -->\n<p>Realizamos <strong>limpeza de pele profunda</strong> para renovar e purificar a pele, <strong>tratamentos corporais não invasivos</strong> como drenagem linfática, criolipólise e massagens modeladoras para reduzir medidas e modelar o corpo, além de <strong>procedimentos faciais</strong> como a <strong>harmonização facial</strong>, que equilibra os traços do rosto de forma natural e segura.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"className\":\"\"} -->\n<p>Também oferecemos <strong>orientações de skincare personalizadas</strong>, para que você mantenha os cuidados em casa com os produtos certos, e <strong>terapias relaxantes</strong> que aliviam o estresse, promovem bem-estar e ainda refletem na saúde da sua pele. E para quem deseja realçar o olhar, temos a <strong>micropigmentação de sobrancelhas</strong>, com resultado natural, duradouro e feito com todo o cuidado.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"className\":\"\"} -->\n<p>Seja para relaxar, cuidar da pele ou transformar sua aparência, aqui você encontra tudo o que precisa em um só lugar. Agende sua avaliação e descubra o melhor da estética com quem entende de autocuidado! 🌿💆‍♀️</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:gallery {\"linkTo\":\"none\"} -->\n<figure class=\"wp-block-gallery has-nested-images columns-default is-cropped\"><!-- wp:image {\"id\":17,\"sizeSlug\":\"large\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://localhost/blog-Estetique/wp-content/uploads/2025/04/pexels-vigot-lucero-1189391497-23532307.jpg\" alt=\"\" class=\"wp-image-17\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:image {\"id\":13,\"sizeSlug\":\"large\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://localhost/blog-Estetique/wp-content/uploads/2025/04/pexels-freestockpro-12956087.jpg\" alt=\"\" class=\"wp-image-13\"/></figure>\n<!-- /wp:image --></figure>\n<!-- /wp:gallery -->', 'Sobre', '', 'inherit', 'closed', 'closed', '', '26-revision-v1', '', '', '2025-05-05 19:51:31', '2025-05-05 22:51:31', '', 26, 'http://localhost/blog-Estetique/?p=28', 0, 'revision', '', 0),
(29, 1, '2025-05-05 19:56:39', '2025-05-05 22:56:39', '<!-- wp:gallery {\"linkTo\":\"none\"} -->\n<figure class=\"wp-block-gallery has-nested-images columns-default is-cropped\"><!-- wp:image {\"id\":17,\"sizeSlug\":\"large\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://localhost/blog-Estetique/wp-content/uploads/2025/04/pexels-vigot-lucero-1189391497-23532307.jpg\" alt=\"\" class=\"wp-image-17\"/><figcaption class=\"wp-element-caption\">Micro pigmentação</figcaption></figure>\n<!-- /wp:image -->\n\n<!-- wp:image {\"id\":16,\"sizeSlug\":\"large\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://localhost/blog-Estetique/wp-content/uploads/2025/04/pexels-polina-kovaleva-5927811.jpg\" alt=\"\" class=\"wp-image-16\"/><figcaption class=\"wp-element-caption\">Skincare </figcaption></figure>\n<!-- /wp:image -->\n\n<!-- wp:image {\"id\":15,\"sizeSlug\":\"large\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://localhost/blog-Estetique/wp-content/uploads/2025/04/pexels-karolina-grabowska-6629521.jpg\" alt=\"\" class=\"wp-image-15\"/><figcaption class=\"wp-element-caption\">Massagens </figcaption></figure>\n<!-- /wp:image -->\n\n<!-- wp:image {\"id\":14,\"sizeSlug\":\"large\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://localhost/blog-Estetique/wp-content/uploads/2025/04/pexels-john-tekeridis-21837-14256897.jpg\" alt=\"\" class=\"wp-image-14\"/><figcaption class=\"wp-element-caption\">limpeza de pele</figcaption></figure>\n<!-- /wp:image -->\n\n<!-- wp:image {\"id\":13,\"sizeSlug\":\"large\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://localhost/blog-Estetique/wp-content/uploads/2025/04/pexels-freestockpro-12956087.jpg\" alt=\"\" class=\"wp-image-13\"/><figcaption class=\"wp-element-caption\">Estética Corporal</figcaption></figure>\n<!-- /wp:image -->\n\n<!-- wp:image {\"id\":12,\"sizeSlug\":\"large\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://localhost/blog-Estetique/wp-content/uploads/2025/04/pexels-104274529-10600173.jpg\" alt=\"\" class=\"wp-image-12\"/><figcaption class=\"wp-element-caption\"> Harmonização Facial</figcaption></figure>\n<!-- /wp:image --></figure>\n<!-- /wp:gallery -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'Galeria de Fotos', '', 'publish', 'closed', 'closed', '', 'galeria-de-fotos', '', '', '2025-05-05 19:56:39', '2025-05-05 22:56:39', '', 0, 'http://localhost/blog-Estetique/?page_id=29', 0, 'page', '', 0),
(30, 1, '2025-05-05 19:56:39', '2025-05-05 22:56:39', '<!-- wp:gallery {\"linkTo\":\"none\"} -->\n<figure class=\"wp-block-gallery has-nested-images columns-default is-cropped\"><!-- wp:image {\"id\":17,\"sizeSlug\":\"large\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://localhost/blog-Estetique/wp-content/uploads/2025/04/pexels-vigot-lucero-1189391497-23532307.jpg\" alt=\"\" class=\"wp-image-17\"/><figcaption class=\"wp-element-caption\">Micro pigmentação</figcaption></figure>\n<!-- /wp:image -->\n\n<!-- wp:image {\"id\":16,\"sizeSlug\":\"large\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://localhost/blog-Estetique/wp-content/uploads/2025/04/pexels-polina-kovaleva-5927811.jpg\" alt=\"\" class=\"wp-image-16\"/><figcaption class=\"wp-element-caption\">Skincare </figcaption></figure>\n<!-- /wp:image -->\n\n<!-- wp:image {\"id\":15,\"sizeSlug\":\"large\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://localhost/blog-Estetique/wp-content/uploads/2025/04/pexels-karolina-grabowska-6629521.jpg\" alt=\"\" class=\"wp-image-15\"/><figcaption class=\"wp-element-caption\">Massagens </figcaption></figure>\n<!-- /wp:image -->\n\n<!-- wp:image {\"id\":14,\"sizeSlug\":\"large\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://localhost/blog-Estetique/wp-content/uploads/2025/04/pexels-john-tekeridis-21837-14256897.jpg\" alt=\"\" class=\"wp-image-14\"/><figcaption class=\"wp-element-caption\">limpeza de pele</figcaption></figure>\n<!-- /wp:image -->\n\n<!-- wp:image {\"id\":13,\"sizeSlug\":\"large\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://localhost/blog-Estetique/wp-content/uploads/2025/04/pexels-freestockpro-12956087.jpg\" alt=\"\" class=\"wp-image-13\"/><figcaption class=\"wp-element-caption\">Estética Corporal</figcaption></figure>\n<!-- /wp:image -->\n\n<!-- wp:image {\"id\":12,\"sizeSlug\":\"large\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://localhost/blog-Estetique/wp-content/uploads/2025/04/pexels-104274529-10600173.jpg\" alt=\"\" class=\"wp-image-12\"/><figcaption class=\"wp-element-caption\"> Harmonização Facial</figcaption></figure>\n<!-- /wp:image --></figure>\n<!-- /wp:gallery -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'Galeria de Fotos', '', 'inherit', 'closed', 'closed', '', '29-revision-v1', '', '', '2025-05-05 19:56:39', '2025-05-05 22:56:39', '', 29, 'http://localhost/blog-Estetique/?p=30', 0, 'revision', '', 0),
(31, 1, '2025-05-05 20:08:04', '2025-05-05 23:08:04', '<!-- wp:paragraph -->\n<p>Entre em contato comigo:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:list -->\n<ul class=\"wp-block-list\"><!-- wp:list-item -->\n<li>E-mail: paesmatheus665@gmail.com</li>\n<!-- /wp:list-item --></ul>\n<!-- /wp:list -->\n\n<!-- wp:list -->\n<ul class=\"wp-block-list\"><!-- wp:list-item -->\n<li>Linkedin: https://linkedin.com/matheuspaes</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>Github: <a href=\"https://github.com/Matizin46\">https://github.com/Matizin46</a></li>\n<!-- /wp:list-item --></ul>\n<!-- /wp:list -->\n\n<!-- wp:paragraph -->\n<p>Eu estou fazendo curso técnico em informática no Senac Americana:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:group {\"layout\":{\"type\":\"constrained\",\"justifyContent\":\"center\"}} -->\n<div class=\"wp-block-group\"><!-- wp:html -->\n<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3679.328662065791!2d-47.331668924573464!3d-22.753181132399664!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x94c8998174c896b9%3A0x739b7f99b3323574!2sSenac%20Americana!5e0!3m2!1spt-BR!2sbr!4v1746486437634!5m2!1spt-BR!2sbr\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>\n<!-- /wp:html --></div>\n<!-- /wp:group -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'Contato', '', 'publish', 'closed', 'closed', '', 'contato', '', '', '2025-05-07 21:25:17', '2025-05-08 00:25:17', '', 0, 'http://localhost/blog-Estetique/?page_id=31', 0, 'page', '', 0),
(32, 1, '2025-05-05 20:08:04', '2025-05-05 23:08:04', '<!-- wp:paragraph -->\n<p>Entre em contato comigo:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:list -->\n<ul class=\"wp-block-list\"><!-- wp:list-item -->\n<li>E-mail: paesmatheus665@gmail.com</li>\n<!-- /wp:list-item --></ul>\n<!-- /wp:list -->\n\n<!-- wp:list -->\n<ul class=\"wp-block-list\"><!-- wp:list-item -->\n<li>Linkedin: https://linkedin.com/matheuspaes</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>Github: <a href=\"https://github.com/Matizin46\">https://github.com/Matizin46</a></li>\n<!-- /wp:list-item --></ul>\n<!-- /wp:list -->\n\n<!-- wp:paragraph -->\n<p>Eu estou fazendo curso técnico em informática no Senac Americana:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:html -->\n<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3679.328662065791!2d-47.331668924573464!3d-22.753181132399664!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x94c8998174c896b9%3A0x739b7f99b3323574!2sSenac%20Americana!5e0!3m2!1spt-BR!2sbr!4v1746486437634!5m2!1spt-BR!2sbr\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>\n<!-- /wp:html -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'Contato', '', 'inherit', 'closed', 'closed', '', '31-revision-v1', '', '', '2025-05-05 20:08:04', '2025-05-05 23:08:04', '', 31, 'http://localhost/blog-Estetique/?p=32', 0, 'revision', '', 0),
(35, 1, '2025-05-05 20:20:41', '2025-05-05 23:20:41', '', 'Blog', '', 'publish', 'closed', 'closed', '', 'blog', '', '', '2025-05-05 22:13:04', '2025-05-06 01:13:04', '', 0, 'http://localhost/blog-Estetique/?page_id=35', 0, 'page', '', 0),
(36, 1, '2025-05-05 20:20:41', '2025-05-05 23:20:41', '', 'Blog', '', 'inherit', 'closed', 'closed', '', '35-revision-v1', '', '', '2025-05-05 20:20:41', '2025-05-05 23:20:41', '', 35, 'http://localhost/blog-Estetique/?p=36', 0, 'revision', '', 0),
(38, 1, '2025-05-05 22:04:16', '2025-05-06 01:04:16', '<!-- wp:paragraph -->\n<p>A harmonização facial é um conjunto de procedimentos estéticos minimamente invasivos que visam equilibrar e realçar os traços do rosto. Pode incluir preenchimento labial, rinomodelação, toxina botulínica e outros recursos. Indicada para homens e mulheres que desejam melhorar sua autoestima sem recorrer a cirurgias, a harmonização deve ser feita com responsabilidade e sob orientação profissional.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image {\"id\":12,\"width\":\"175px\",\"height\":\"auto\",\"sizeSlug\":\"full\",\"linkDestination\":\"none\",\"align\":\"center\"} -->\n<figure class=\"wp-block-image aligncenter size-full is-resized\"><img src=\"http://localhost/blog-Estetique/wp-content/uploads/2025/04/pexels-104274529-10600173.jpg\" alt=\"\" class=\"wp-image-12\" style=\"width:175px;height:auto\"/><figcaption class=\"wp-element-caption\"> Harmonização Facial</figcaption></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'Harmonização Facial: O Que É e Para Quem É Indicada?', '', 'publish', 'open', 'open', '', 'harmonizacao-facial-o-que-e-e-para-quem-e-indicada', '', '', '2025-05-07 19:24:48', '2025-05-07 22:24:48', '', 0, 'http://localhost/blog-Estetique/?p=38', 0, 'post', '', 0),
(39, 1, '2025-05-05 22:04:16', '2025-05-06 01:04:16', '', 'Harmonização Facial: O Que É e Para Quem É Indicada?', '', 'inherit', 'closed', 'closed', '', '38-revision-v1', '', '', '2025-05-05 22:04:16', '2025-05-06 01:04:16', '', 38, 'http://localhost/blog-Estetique/?p=39', 0, 'revision', '', 0),
(42, 1, '2025-05-05 22:09:36', '2025-05-06 01:09:36', '<!-- wp:paragraph -->\n<p>A harmonização facial é um conjunto de procedimentos estéticos minimamente invasivos que visam equilibrar e realçar os traços do rosto. Pode incluir preenchimento labial, rinomodelação, toxina botulínica e outros recursos. Indicada para homens e mulheres que desejam melhorar sua autoestima sem recorrer a cirurgias, a harmonização deve ser feita com responsabilidade e sob orientação profissional.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image {\"id\":12,\"sizeSlug\":\"full\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-full\"><img src=\"http://localhost/blog-Estetique/wp-content/uploads/2025/04/pexels-104274529-10600173.jpg\" alt=\"\" class=\"wp-image-12\"/><figcaption class=\"wp-element-caption\"> Harmonização Facial</figcaption></figure>\n<!-- /wp:image -->', 'Harmonização Facial: O Que É e Para Quem É Indicada?', '', 'inherit', 'closed', 'closed', '', '38-revision-v1', '', '', '2025-05-05 22:09:36', '2025-05-06 01:09:36', '', 38, 'http://localhost/blog-Estetique/?p=42', 0, 'revision', '', 0),
(43, 1, '2025-05-05 22:10:03', '2025-05-06 01:10:03', '<!-- wp:paragraph -->\n<p>A harmonização facial é um conjunto de procedimentos estéticos minimamente invasivos que visam equilibrar e realçar os traços do rosto. Pode incluir preenchimento labial, rinomodelação, toxina botulínica e outros recursos. Indicada para homens e mulheres que desejam melhorar sua autoestima sem recorrer a cirurgias, a harmonização deve ser feita com responsabilidade e sob orientação profissional.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image {\"id\":12,\"width\":\"375px\",\"height\":\"auto\",\"sizeSlug\":\"full\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-full is-resized\"><img src=\"http://localhost/blog-Estetique/wp-content/uploads/2025/04/pexels-104274529-10600173.jpg\" alt=\"\" class=\"wp-image-12\" style=\"width:375px;height:auto\"/><figcaption class=\"wp-element-caption\"> Harmonização Facial</figcaption></figure>\n<!-- /wp:image -->', 'Harmonização Facial: O Que É e Para Quem É Indicada?', '', 'inherit', 'closed', 'closed', '', '38-revision-v1', '', '', '2025-05-05 22:10:03', '2025-05-06 01:10:03', '', 38, 'http://localhost/blog-Estetique/?p=43', 0, 'revision', '', 0),
(45, 1, '2025-05-07 19:24:48', '2025-05-07 22:24:48', '<!-- wp:paragraph -->\n<p>A harmonização facial é um conjunto de procedimentos estéticos minimamente invasivos que visam equilibrar e realçar os traços do rosto. Pode incluir preenchimento labial, rinomodelação, toxina botulínica e outros recursos. Indicada para homens e mulheres que desejam melhorar sua autoestima sem recorrer a cirurgias, a harmonização deve ser feita com responsabilidade e sob orientação profissional.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image {\"id\":12,\"width\":\"175px\",\"height\":\"auto\",\"sizeSlug\":\"full\",\"linkDestination\":\"none\",\"align\":\"center\"} -->\n<figure class=\"wp-block-image aligncenter size-full is-resized\"><img src=\"http://localhost/blog-Estetique/wp-content/uploads/2025/04/pexels-104274529-10600173.jpg\" alt=\"\" class=\"wp-image-12\" style=\"width:175px;height:auto\"/><figcaption class=\"wp-element-caption\"> Harmonização Facial</figcaption></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'Harmonização Facial: O Que É e Para Quem É Indicada?', '', 'inherit', 'closed', 'closed', '', '38-revision-v1', '', '', '2025-05-07 19:24:48', '2025-05-07 22:24:48', '', 38, 'http://localhost/blog-Estetique/?p=45', 0, 'revision', '', 0),
(46, 1, '2025-05-07 19:25:29', '2025-05-07 22:25:29', '<!-- wp:paragraph -->\n<p>A limpeza de pele profunda é um dos procedimentos estéticos mais procurados atualmente — e com razão. Ela remove cravos, impurezas e células mortas, permitindo que a pele respire melhor e absorva nutrientes de forma mais eficiente. Além disso, melhora a circulação sanguínea, previne o surgimento de acne e proporciona uma aparência mais saudável e viçosa. Esse tratamento deve ser feito com um profissional para garantir a eficácia e segurança do procedimento.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image {\"id\":14,\"width\":\"316px\",\"height\":\"auto\",\"sizeSlug\":\"full\",\"linkDestination\":\"none\",\"align\":\"center\"} -->\n<figure class=\"wp-block-image aligncenter size-full is-resized\"><img src=\"http://localhost/blog-Estetique/wp-content/uploads/2025/04/pexels-john-tekeridis-21837-14256897.jpg\" alt=\"\" class=\"wp-image-14\" style=\"width:316px;height:auto\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', '5 Benefícios da Limpeza de Pele Profunda Que Você Precisa Conhecer', '', 'inherit', 'closed', 'closed', '', '11-revision-v1', '', '', '2025-05-07 19:25:29', '2025-05-07 22:25:29', '', 11, 'http://localhost/blog-Estetique/?p=46', 0, 'revision', '', 0),
(47, 1, '2025-05-07 19:29:35', '2025-05-07 22:29:35', '<!-- wp:paragraph -->\n<p>Hoje em dia é possível alcançar resultados incríveis na estética corporal sem bisturi. Tratamentos como criolipólise, drenagem linfática, massagem modeladora e radiofrequência ajudam a reduzir medidas, combater a celulite e tonificar a pele. A escolha ideal depende do seu objetivo e das características do seu corpo. Uma avaliação profissional é essencial para montar o plano de tratamento mais eficaz para você.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image {\"id\":13,\"width\":\"330px\",\"height\":\"auto\",\"sizeSlug\":\"full\",\"linkDestination\":\"none\",\"align\":\"center\"} -->\n<figure class=\"wp-block-image aligncenter size-full is-resized\"><img src=\"http://localhost/blog-Estetique/wp-content/uploads/2025/04/pexels-freestockpro-12956087.jpg\" alt=\"\" class=\"wp-image-13\" style=\"width:330px;height:auto\"/><figcaption class=\"wp-element-caption\">Estética Corporal</figcaption></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'Estética Corporal: 4 Tratamentos Para Reduzir Medidas Sem Cirurgia', '', 'publish', 'open', 'open', '', 'estetica-corporal-4-tratamentos-para-reduzir-medidas-sem-cirurgia', '', '', '2025-05-07 19:29:35', '2025-05-07 22:29:35', '', 0, 'http://localhost/blog-Estetique/?p=47', 0, 'post', '', 0);
INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(48, 1, '2025-05-07 19:29:35', '2025-05-07 22:29:35', '<!-- wp:paragraph -->\n<p>Hoje em dia é possível alcançar resultados incríveis na estética corporal sem bisturi. Tratamentos como criolipólise, drenagem linfática, massagem modeladora e radiofrequência ajudam a reduzir medidas, combater a celulite e tonificar a pele. A escolha ideal depende do seu objetivo e das características do seu corpo. Uma avaliação profissional é essencial para montar o plano de tratamento mais eficaz para você.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image {\"id\":13,\"width\":\"330px\",\"height\":\"auto\",\"sizeSlug\":\"full\",\"linkDestination\":\"none\",\"align\":\"center\"} -->\n<figure class=\"wp-block-image aligncenter size-full is-resized\"><img src=\"http://localhost/blog-Estetique/wp-content/uploads/2025/04/pexels-freestockpro-12956087.jpg\" alt=\"\" class=\"wp-image-13\" style=\"width:330px;height:auto\"/><figcaption class=\"wp-element-caption\">Estética Corporal</figcaption></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'Estética Corporal: 4 Tratamentos Para Reduzir Medidas Sem Cirurgia', '', 'inherit', 'closed', 'closed', '', '47-revision-v1', '', '', '2025-05-07 19:29:35', '2025-05-07 22:29:35', '', 47, 'http://localhost/blog-Estetique/?p=48', 0, 'revision', '', 0),
(49, 1, '2025-05-07 19:31:27', '2025-05-07 22:31:27', '<!-- wp:paragraph -->\n<p>Manter uma rotina diária de skincare é fundamental para conservar a juventude e a saúde da pele. Limpeza, tonificação, hidratação e proteção solar são os quatro pilares básicos. Além disso, o uso de produtos específicos para cada tipo de pele (oleosa, seca, mista ou sensível) potencializa os resultados. Não se trata apenas de estética, mas também de saúde e bem-estar.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image {\"id\":16,\"width\":\"318px\",\"height\":\"auto\",\"sizeSlug\":\"full\",\"linkDestination\":\"none\",\"align\":\"center\"} -->\n<figure class=\"wp-block-image aligncenter size-full is-resized\"><img src=\"http://localhost/blog-Estetique/wp-content/uploads/2025/04/pexels-polina-kovaleva-5927811.jpg\" alt=\"\" class=\"wp-image-16\" style=\"width:318px;height:auto\"/><figcaption class=\"wp-element-caption\">Skincare </figcaption></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'A Importância do Skincare Diário Para uma Pele Jovem e Saudável', '', 'publish', 'open', 'open', '', 'a-importancia-do-skincare-diario-para-uma-pele-jovem-e-saudavel', '', '', '2025-05-07 19:31:27', '2025-05-07 22:31:27', '', 0, 'http://localhost/blog-Estetique/?p=49', 0, 'post', '', 0),
(50, 1, '2025-05-07 19:31:27', '2025-05-07 22:31:27', '<!-- wp:paragraph -->\n<p>Manter uma rotina diária de skincare é fundamental para conservar a juventude e a saúde da pele. Limpeza, tonificação, hidratação e proteção solar são os quatro pilares básicos. Além disso, o uso de produtos específicos para cada tipo de pele (oleosa, seca, mista ou sensível) potencializa os resultados. Não se trata apenas de estética, mas também de saúde e bem-estar.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image {\"id\":16,\"width\":\"318px\",\"height\":\"auto\",\"sizeSlug\":\"full\",\"linkDestination\":\"none\",\"align\":\"center\"} -->\n<figure class=\"wp-block-image aligncenter size-full is-resized\"><img src=\"http://localhost/blog-Estetique/wp-content/uploads/2025/04/pexels-polina-kovaleva-5927811.jpg\" alt=\"\" class=\"wp-image-16\" style=\"width:318px;height:auto\"/><figcaption class=\"wp-element-caption\">Skincare </figcaption></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'A Importância do Skincare Diário Para uma Pele Jovem e Saudável', '', 'inherit', 'closed', 'closed', '', '49-revision-v1', '', '', '2025-05-07 19:31:27', '2025-05-07 22:31:27', '', 49, 'http://localhost/blog-Estetique/?p=50', 0, 'revision', '', 0),
(51, 1, '2025-05-07 19:33:58', '2025-05-07 22:33:58', '<!-- wp:paragraph -->\n<p>Massagens relaxantes, aromaterapia e banhos de imersão não apenas aliviam o estresse, mas também contribuem para uma aparência mais jovem e saudável. O corpo relaxado produz menos cortisol, o que ajuda na renovação celular e na prevenção do envelhecimento precoce. Incorporar momentos de relaxamento à sua rotina estética pode transformar não só sua pele, mas também seu estado emocional.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image {\"id\":15,\"width\":\"302px\",\"height\":\"auto\",\"sizeSlug\":\"full\",\"linkDestination\":\"none\",\"align\":\"center\"} -->\n<figure class=\"wp-block-image aligncenter size-full is-resized\"><img src=\"http://localhost/blog-Estetique/wp-content/uploads/2025/04/pexels-karolina-grabowska-6629521.jpg\" alt=\"\" class=\"wp-image-15\" style=\"width:302px;height:auto\"/><figcaption class=\"wp-element-caption\">Massagens </figcaption></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'Terapias Relaxantes: Como o Bem-Estar Reflete na Sua Beleza', '', 'publish', 'open', 'open', '', 'terapias-relaxantes-como-o-bem-estar-reflete-na-sua-beleza', '', '', '2025-05-07 19:33:58', '2025-05-07 22:33:58', '', 0, 'http://localhost/blog-Estetique/?p=51', 0, 'post', '', 0),
(52, 1, '2025-05-07 19:33:58', '2025-05-07 22:33:58', '<!-- wp:paragraph -->\n<p>Massagens relaxantes, aromaterapia e banhos de imersão não apenas aliviam o estresse, mas também contribuem para uma aparência mais jovem e saudável. O corpo relaxado produz menos cortisol, o que ajuda na renovação celular e na prevenção do envelhecimento precoce. Incorporar momentos de relaxamento à sua rotina estética pode transformar não só sua pele, mas também seu estado emocional.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image {\"id\":15,\"width\":\"302px\",\"height\":\"auto\",\"sizeSlug\":\"full\",\"linkDestination\":\"none\",\"align\":\"center\"} -->\n<figure class=\"wp-block-image aligncenter size-full is-resized\"><img src=\"http://localhost/blog-Estetique/wp-content/uploads/2025/04/pexels-karolina-grabowska-6629521.jpg\" alt=\"\" class=\"wp-image-15\" style=\"width:302px;height:auto\"/><figcaption class=\"wp-element-caption\">Massagens </figcaption></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'Terapias Relaxantes: Como o Bem-Estar Reflete na Sua Beleza', '', 'inherit', 'closed', 'closed', '', '51-revision-v1', '', '', '2025-05-07 19:33:58', '2025-05-07 22:33:58', '', 51, 'http://localhost/blog-Estetique/?p=52', 0, 'revision', '', 0),
(53, 1, '2025-05-07 21:13:51', '2025-05-08 00:13:51', '<!-- wp:paragraph -->\n<p>A micropigmentação é uma técnica estética que visa corrigir falhas e definir o desenho das sobrancelhas por meio da aplicação de pigmentos na camada superficial da pele. Ideal para quem deseja sobrancelhas mais marcantes e simétricas, o procedimento proporciona um efeito natural e duradouro, dispensando o uso diário de maquiagem. Existem diferentes técnicas, como fio a fio e shadow, que podem ser escolhidas de acordo com o estilo e a necessidade de cada pessoa. A micro pigmentação deve ser realizada por um profissional qualificado para garantir um resultado harmônico, seguro e satisfatório.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image {\"id\":17,\"width\":\"227px\",\"height\":\"auto\",\"sizeSlug\":\"full\",\"linkDestination\":\"none\",\"align\":\"center\"} -->\n<figure class=\"wp-block-image aligncenter size-full is-resized\"><img src=\"http://localhost/blog-Estetique/wp-content/uploads/2025/04/pexels-vigot-lucero-1189391497-23532307.jpg\" alt=\"\" class=\"wp-image-17\" style=\"width:227px;height:auto\"/><figcaption class=\"wp-element-caption\">Micropigmentação: </figcaption></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'Micro pigmentação: O Segredo Para Sobrancelhas Perfeitas', '', 'publish', 'open', 'open', '', 'micro-pigmentacao-o-segredo-para-sobrancelhas-perfeitas', '', '', '2025-05-07 21:13:51', '2025-05-08 00:13:51', '', 0, 'http://localhost/blog-Estetique/?p=53', 0, 'post', '', 0),
(54, 1, '2025-05-07 21:13:51', '2025-05-08 00:13:51', '<!-- wp:paragraph -->\n<p>A micropigmentação é uma técnica estética que visa corrigir falhas e definir o desenho das sobrancelhas por meio da aplicação de pigmentos na camada superficial da pele. Ideal para quem deseja sobrancelhas mais marcantes e simétricas, o procedimento proporciona um efeito natural e duradouro, dispensando o uso diário de maquiagem. Existem diferentes técnicas, como fio a fio e shadow, que podem ser escolhidas de acordo com o estilo e a necessidade de cada pessoa. A micro pigmentação deve ser realizada por um profissional qualificado para garantir um resultado harmônico, seguro e satisfatório.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image {\"id\":17,\"width\":\"227px\",\"height\":\"auto\",\"sizeSlug\":\"full\",\"linkDestination\":\"none\",\"align\":\"center\"} -->\n<figure class=\"wp-block-image aligncenter size-full is-resized\"><img src=\"http://localhost/blog-Estetique/wp-content/uploads/2025/04/pexels-vigot-lucero-1189391497-23532307.jpg\" alt=\"\" class=\"wp-image-17\" style=\"width:227px;height:auto\"/><figcaption class=\"wp-element-caption\">Micropigmentação: </figcaption></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'Micro pigmentação: O Segredo Para Sobrancelhas Perfeitas', '', 'inherit', 'closed', 'closed', '', '53-revision-v1', '', '', '2025-05-07 21:13:51', '2025-05-08 00:13:51', '', 53, 'http://localhost/blog-Estetique/?p=54', 0, 'revision', '', 0),
(55, 1, '2025-05-07 21:18:22', '2025-05-08 00:18:22', '<!-- wp:navigation-link {\"label\":\"Inicial\",\"type\":\"page\",\"id\":24,\"url\":\"http://localhost/blog-Estetique/\",\"kind\":\"post-type\"} /-->\n\n<!-- wp:navigation-link {\"label\":\"Galeria de Fotos\",\"type\":\"page\",\"id\":29,\"url\":\"http://localhost/blog-Estetique/galeria-de-fotos/\",\"kind\":\"post-type\"} /-->\n\n<!-- wp:navigation-link {\"label\":\"Blog\",\"type\":\"page\",\"id\":35,\"url\":\"http://localhost/blog-Estetique/blog/\",\"kind\":\"post-type\"} /-->\n\n<!-- wp:navigation-link {\"label\":\"Contato\",\"type\":\"page\",\"id\":31,\"url\":\"http://localhost/blog-Estetique/contato/\",\"kind\":\"post-type\"} /-->\n\n<!-- wp:navigation-link {\"label\":\"Sobre\",\"type\":\"page\",\"id\":26,\"url\":\"http://localhost/blog-Estetique/sobre/\",\"kind\":\"post-type\"} /-->', 'Navegação', '', 'publish', 'closed', 'closed', '', 'navigation', '', '', '2025-05-07 22:01:43', '2025-05-08 01:01:43', '', 0, 'http://localhost/blog-Estetique/2025/05/07/navigation/', 0, 'wp_navigation', '', 0),
(57, 1, '2025-05-07 21:23:38', '2025-05-08 00:23:38', '', 'Blog', '', 'inherit', 'closed', 'closed', '', '35-autosave-v1', '', '', '2025-05-07 21:23:38', '2025-05-08 00:23:38', '', 35, 'http://localhost/blog-Estetique/?p=57', 0, 'revision', '', 0),
(58, 1, '2025-05-07 21:25:17', '2025-05-08 00:25:17', '<!-- wp:paragraph -->\n<p>Entre em contato comigo:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:list -->\n<ul class=\"wp-block-list\"><!-- wp:list-item -->\n<li>E-mail: paesmatheus665@gmail.com</li>\n<!-- /wp:list-item --></ul>\n<!-- /wp:list -->\n\n<!-- wp:list -->\n<ul class=\"wp-block-list\"><!-- wp:list-item -->\n<li>Linkedin: https://linkedin.com/matheuspaes</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>Github: <a href=\"https://github.com/Matizin46\">https://github.com/Matizin46</a></li>\n<!-- /wp:list-item --></ul>\n<!-- /wp:list -->\n\n<!-- wp:paragraph -->\n<p>Eu estou fazendo curso técnico em informática no Senac Americana:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:group {\"layout\":{\"type\":\"constrained\",\"justifyContent\":\"center\"}} -->\n<div class=\"wp-block-group\"><!-- wp:html -->\n<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3679.328662065791!2d-47.331668924573464!3d-22.753181132399664!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x94c8998174c896b9%3A0x739b7f99b3323574!2sSenac%20Americana!5e0!3m2!1spt-BR!2sbr!4v1746486437634!5m2!1spt-BR!2sbr\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>\n<!-- /wp:html --></div>\n<!-- /wp:group -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'Contato', '', 'inherit', 'closed', 'closed', '', '31-revision-v1', '', '', '2025-05-07 21:25:17', '2025-05-08 00:25:17', '', 31, 'http://localhost/blog-Estetique/?p=58', 0, 'revision', '', 0),
(60, 1, '2025-05-07 22:01:43', '2025-05-08 01:01:43', '<!-- wp:navigation-link {\"label\":\"Inicial\",\"type\":\"page\",\"id\":24,\"url\":\"http://localhost/blog-Estetique/\",\"kind\":\"post-type\"} /-->\n\n<!-- wp:navigation-link {\"label\":\"Galeria de Fotos\",\"type\":\"page\",\"id\":29,\"url\":\"http://localhost/blog-Estetique/galeria-de-fotos/\",\"kind\":\"post-type\"} /-->\n\n<!-- wp:navigation-link {\"label\":\"Blog\",\"type\":\"page\",\"id\":35,\"url\":\"http://localhost/blog-Estetique/blog/\",\"kind\":\"post-type\"} /-->\n\n<!-- wp:navigation-link {\"label\":\"Contato\",\"type\":\"page\",\"id\":31,\"url\":\"http://localhost/blog-Estetique/contato/\",\"kind\":\"post-type\"} /-->\n\n<!-- wp:navigation-link {\"label\":\"Sobre\",\"type\":\"page\",\"id\":26,\"url\":\"http://localhost/blog-Estetique/sobre/\",\"kind\":\"post-type\"} /-->', 'Navegação', '', 'inherit', 'closed', 'closed', '', '55-revision-v1', '', '', '2025-05-07 22:01:43', '2025-05-08 01:01:43', '', 55, 'http://localhost/blog-Estetique/?p=60', 0, 'revision', '', 0),
(61, 1, '2025-05-07 22:04:48', '2025-05-08 01:04:48', '{\"styles\":{\"blocks\":{\"core\\/post-terms\":{\"typography\":{\"fontWeight\":\"500\"},\"variations\":{\"post-terms-1\":{\"elements\":{\"link\":{\"border\":{\"color\":\"var(--wp--preset--color--accent-5)\"},\"color\":{\"background\":\"var(--wp--preset--color--accent-5)\"}}}}}},\"core\\/pullquote\":{\"typography\":{\"fontFamily\":\"var(--wp--preset--font-family--roboto-slab)\",\"fontSize\":\"var(--wp--preset--font-size--xx-large)\",\"fontWeight\":\"200\"},\"elements\":{\"cite\":{\"color\":{\"text\":\"var(--wp--preset--color--accent-4)\"}}},\"color\":{\"text\":\"var(--wp--preset--color--contrast)\"}},\"core\\/site-tagline\":{\"typography\":{\"fontSize\":\"var(--wp--preset--font-size--large)\"}},\"core\\/site-title\":{\"typography\":{\"textTransform\":\"uppercase\"}},\"core\\/column\":{\"variations\":{\"section-2\":{\"elements\":{\"button\":{\":hover\":{\"color\":{\"background\":\"color-mix(in srgb, var(--wp--preset--color--accent-1) 85%, transparent)\"}},\"color\":{\"background\":\"var(--wp--preset--color--accent-1)\",\"text\":\"var(--wp--preset--color--contrast)\"}}}},\"section-3\":{\"elements\":{\"button\":{\":hover\":{\"color\":{\"background\":\"color-mix(in srgb, var(--wp--preset--color--contrast) 85%, transparent)\"}},\"color\":{\"background\":\"var(--wp--preset--color--contrast)\",\"text\":\"var(--wp--preset--color--base)\"}}}},\"section-4\":{\"elements\":{\"link\":{\"color\":{\"text\":\"currentColor\"}},\"button\":{\":hover\":{\"color\":{\"background\":\"color-mix(in srgb, var(--wp--preset--color--accent-1) 85%, transparent)\",\"text\":\"var(--wp--preset--color--contrast)\"}},\"color\":{\"background\":\"var(--wp--preset--color--accent-1)\",\"text\":\"var(--wp--preset--color--contrast)\"}},\"heading\":{\"color\":{\"text\":\"currentColor\"}}},\"color\":{\"text\":\"var(--wp--preset--color--base)\"}},\"section-5\":{\"elements\":{\"heading\":{\"color\":{\"text\":\"var(--wp--preset--color--base)\"}},\"link\":{\"color\":{\"text\":\"currentColor\"}},\"button\":{\":hover\":{\"color\":{\"background\":\"color-mix(in srgb, var(--wp--preset--color--accent-1) 85%, transparent)\"}},\"color\":{\"background\":\"var(--wp--preset--color--accent-1)\",\"text\":\"var(--wp--preset--color--contrast)\"}}}}}},\"core\\/columns\":{\"variations\":{\"section-2\":{\"elements\":{\"button\":{\":hover\":{\"color\":{\"background\":\"color-mix(in srgb, var(--wp--preset--color--accent-1) 85%, transparent)\"}},\"color\":{\"background\":\"var(--wp--preset--color--accent-1)\",\"text\":\"var(--wp--preset--color--contrast)\"}}}},\"section-3\":{\"elements\":{\"button\":{\":hover\":{\"color\":{\"background\":\"color-mix(in srgb, var(--wp--preset--color--contrast) 85%, transparent)\"}},\"color\":{\"background\":\"var(--wp--preset--color--contrast)\",\"text\":\"var(--wp--preset--color--base)\"}}}},\"section-4\":{\"elements\":{\"link\":{\"color\":{\"text\":\"currentColor\"}},\"button\":{\":hover\":{\"color\":{\"background\":\"color-mix(in srgb, var(--wp--preset--color--accent-1) 85%, transparent)\",\"text\":\"var(--wp--preset--color--contrast)\"}},\"color\":{\"background\":\"var(--wp--preset--color--accent-1)\",\"text\":\"var(--wp--preset--color--contrast)\"}},\"heading\":{\"color\":{\"text\":\"currentColor\"}}},\"color\":{\"text\":\"var(--wp--preset--color--base)\"}},\"section-5\":{\"elements\":{\"heading\":{\"color\":{\"text\":\"var(--wp--preset--color--base)\"}},\"link\":{\"color\":{\"text\":\"currentColor\"}},\"button\":{\":hover\":{\"color\":{\"background\":\"color-mix(in srgb, var(--wp--preset--color--accent-1) 85%, transparent)\"}},\"color\":{\"background\":\"var(--wp--preset--color--accent-1)\",\"text\":\"var(--wp--preset--color--contrast)\"}}}}}},\"core\\/group\":{\"variations\":{\"section-2\":{\"elements\":{\"button\":{\":hover\":{\"color\":{\"background\":\"color-mix(in srgb, var(--wp--preset--color--accent-1) 85%, transparent)\"}},\"color\":{\"background\":\"var(--wp--preset--color--accent-1)\",\"text\":\"var(--wp--preset--color--contrast)\"}}}},\"section-3\":{\"elements\":{\"button\":{\":hover\":{\"color\":{\"background\":\"color-mix(in srgb, var(--wp--preset--color--contrast) 85%, transparent)\"}},\"color\":{\"background\":\"var(--wp--preset--color--contrast)\",\"text\":\"var(--wp--preset--color--base)\"}}}},\"section-4\":{\"elements\":{\"link\":{\"color\":{\"text\":\"currentColor\"}},\"button\":{\":hover\":{\"color\":{\"background\":\"color-mix(in srgb, var(--wp--preset--color--accent-1) 85%, transparent)\",\"text\":\"var(--wp--preset--color--contrast)\"}},\"color\":{\"background\":\"var(--wp--preset--color--accent-1)\",\"text\":\"var(--wp--preset--color--contrast)\"}},\"heading\":{\"color\":{\"text\":\"currentColor\"}}},\"color\":{\"text\":\"var(--wp--preset--color--base)\"}},\"section-5\":{\"elements\":{\"heading\":{\"color\":{\"text\":\"var(--wp--preset--color--base)\"}},\"link\":{\"color\":{\"text\":\"currentColor\"}},\"button\":{\":hover\":{\"color\":{\"background\":\"color-mix(in srgb, var(--wp--preset--color--accent-1) 85%, transparent)\"}},\"color\":{\"background\":\"var(--wp--preset--color--accent-1)\",\"text\":\"var(--wp--preset--color--contrast)\"}}}}}},\"core\\/navigation\":{\"typography\":{\"fontSize\":\"var(--wp--preset--font-size--large)\",\"letterSpacing\":\"-0.28px\",\"textTransform\":\"uppercase\"}},\"core\\/post-author\":{\"typography\":{\"fontSize\":\"var(--wp--preset--font-size--small)\"}},\"core\\/post-author-name\":{\"typography\":{\"fontSize\":\"var(--wp--preset--font-size--small)\"},\"elements\":{\"link\":{\"color\":{\"text\":\"var(--wp--preset--color--contrast)\"}}}},\"core\\/search\":{\"typography\":{\"textTransform\":\"uppercase\"}},\"core\\/code\":{\"color\":{\"text\":\"var(--wp--preset--color--contrast)\",\"background\":\"var(--wp--preset--color--accent-5)\"}},\"core\\/post-title\":{\"elements\":{\"link\":{\"color\":{\"text\":\"var(--wp--preset--color--contrast)\"}}}},\"core\\/quote\":{\"elements\":{\"cite\":{\"color\":{\"text\":\"var(--wp--preset--color--accent-4)\"}}}},\"core\\/paragraph\":{\"elements\":{\"link\":{\"color\":{\"text\":\"var(--wp--preset--color--contrast)\"}}}}},\"elements\":{\"heading\":{\"typography\":{\"fontFamily\":\"var(--wp--preset--font-family--roboto-slab)\",\"fontWeight\":\"300\",\"letterSpacing\":\"-0.5px\",\"lineHeight\":\"1.2\"},\"color\":{\"text\":\"var(--wp--preset--color--contrast)\"}},\"button\":{\"typography\":{\"fontWeight\":\"500\",\"letterSpacing\":\"-0.36px\",\"textTransform\":\"uppercase\"},\":hover\":{\"color\":{\"background\":\"color-mix(in srgb, var(--wp--preset--color--accent-1) 85%, transparent)\",\"text\":\"var(--wp--preset--color--contrast)\"}},\"color\":{\"text\":\"var(--wp--preset--color--contrast)\",\"background\":\"var(--wp--preset--color--accent-1)\"}},\"link\":{\"color\":{\"text\":\"currentColor\"}}},\"typography\":{\"letterSpacing\":\"0\"},\"color\":{\"text\":\"var(--wp--preset--color--accent-4)\"}},\"settings\":{\"typography\":{\"fontFamilies\":{\"theme\":[{\"name\":\"Roboto Slab\",\"slug\":\"roboto-slab\",\"fontFamily\":\"\\\"Roboto Slab\\\", serif\",\"fontFace\":[{\"fontFamily\":\"\\\"Roboto Slab\\\"\",\"fontStyle\":\"normal\",\"fontWeight\":\"100 900\",\"src\":[\"file:.\\/assets\\/fonts\\/roboto-slab\\/RobotoSlab-VariableFont_wght.woff2\"]}]},{\"name\":\"Manrope\",\"slug\":\"manrope\",\"fontFamily\":\"Manrope, sans-serif\",\"fontFace\":[{\"src\":[\"file:.\\/assets\\/fonts\\/manrope\\/Manrope-VariableFont_wght.woff2\"],\"fontWeight\":\"200 800\",\"fontStyle\":\"normal\",\"fontFamily\":\"Manrope\"}]}]},\"fontSizes\":{\"theme\":[{\"fluid\":false,\"name\":\"Pequeno\",\"size\":\"0.875rem\",\"slug\":\"small\"},{\"fluid\":{\"max\":\"1.125rem\",\"min\":\"1rem\"},\"name\":\"M\\u00e9dia\",\"size\":\"1rem\",\"slug\":\"medium\"},{\"fluid\":{\"max\":\"1.375rem\",\"min\":\"1.125rem\"},\"name\":\"Grande\",\"size\":\"1.38rem\",\"slug\":\"large\"},{\"fluid\":{\"max\":\"2rem\",\"min\":\"1.75rem\"},\"name\":\"Extra grande\",\"size\":\"1.75rem\",\"slug\":\"x-large\"},{\"fluid\":{\"max\":\"2.4rem\",\"min\":\"2.15rem\"},\"name\":\"Extra extra grande\",\"size\":\"2.15rem\",\"slug\":\"xx-large\"}]}},\"color\":{\"palette\":{\"theme\":[{\"color\":\"#DFDCD7\",\"name\":\"Base\",\"slug\":\"base\"},{\"color\":\"#191919\",\"name\":\"Contraste\",\"slug\":\"contrast\"},{\"color\":\"#7A9BDB\",\"name\":\"Realce 1\",\"slug\":\"accent-1\"},{\"color\":\"#F7E6FF\",\"name\":\"Realce 2\",\"slug\":\"accent-2\"},{\"color\":\"#182949\",\"name\":\"Realce 3\",\"slug\":\"accent-3\"},{\"color\":\"#5F5F5F\",\"name\":\"Realce 4\",\"slug\":\"accent-4\"},{\"color\":\"#D7D3CC\",\"name\":\"Realce 5\",\"slug\":\"accent-5\"},{\"color\":\"#19191933\",\"name\":\"Realce 6\",\"slug\":\"accent-6\"}]}}},\"isGlobalStylesUserThemeJSON\":true,\"version\":3}', 'Custom Styles', '', 'inherit', 'closed', 'closed', '', '8-revision-v1', '', '', '2025-05-07 22:04:48', '2025-05-08 01:04:48', '', 8, 'http://localhost/blog-Estetique/?p=61', 0, 'revision', '', 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `wp_termmeta`
--

CREATE TABLE `wp_termmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `wp_terms`
--

CREATE TABLE `wp_terms` (
  `term_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(200) NOT NULL DEFAULT '',
  `slug` varchar(200) NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Despejando dados para a tabela `wp_terms`
--

INSERT INTO `wp_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Sem categoria', 'sem-categoria', 0),
(2, 'twentytwentythree', 'twentytwentythree', 0),
(3, 'twentytwentyfive', 'twentytwentyfive', 0),
(4, 'limpeza de pele', 'limpeza-de-pele', 0),
(5, 'estética facial', 'estetica-facial', 0),
(6, 'pele saudável', 'pele-saudavel', 0),
(7, 'Cuidados com a Pele', 'cuidados-com-a-pele', 0),
(8, 'Procedimentos Estéticos', 'procedimentos-esteticos', 0),
(9, 'estética avançada', 'estetica-avancada', 0),
(10, 'harmonização facial', 'harmonizacao-facial', 0),
(11, 'beleza natural', 'beleza-natural', 0),
(12, 'Estética Corporal', 'estetica-corporal', 0),
(13, 'estética corporal', 'estetica-corporal', 0),
(14, 'redução de medidas', 'reducao-de-medidas', 0),
(15, 'tratamentos não invasivos', 'tratamentos-nao-invasivos', 0),
(16, 'Rotina de Beleza', 'rotina-de-beleza', 0),
(17, 'cuidados diários', 'cuidados-diarios', 0),
(18, 'skincare', 'skincare', 0),
(19, 'rejuvenescimento', 'rejuvenescimento', 0),
(20, 'Bem-Estar e Estética', 'bem-estar-e-estetica', 0),
(21, 'estética e saúde', 'estetica-e-saude', 0),
(22, 'relaxamento', 'relaxamento', 0),
(23, 'spa', 'spa', 0),
(24, 'Beleza Facial', 'beleza-facial', 0),
(25, 'sobrancelhas', 'sobrancelhas', 0),
(26, 'micropigmentação', 'micropigmentacao', 0),
(27, 'beleza duradoura', 'beleza-duradoura', 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `wp_term_relationships`
--

CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `term_order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Despejando dados para a tabela `wp_term_relationships`
--

INSERT INTO `wp_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(7, 2, 0),
(8, 3, 0),
(11, 4, 0),
(11, 5, 0),
(11, 6, 0),
(11, 7, 0),
(38, 8, 0),
(38, 9, 0),
(38, 10, 0),
(38, 11, 0),
(47, 12, 0),
(47, 13, 0),
(47, 14, 0),
(47, 15, 0),
(49, 16, 0),
(49, 17, 0),
(49, 18, 0),
(49, 19, 0),
(51, 20, 0),
(51, 21, 0),
(51, 22, 0),
(51, 23, 0),
(53, 24, 0),
(53, 25, 0),
(53, 26, 0),
(53, 27, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `wp_term_taxonomy`
--

CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `taxonomy` varchar(32) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `parent` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `count` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Despejando dados para a tabela `wp_term_taxonomy`
--

INSERT INTO `wp_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 0),
(2, 2, 'wp_theme', '', 0, 1),
(3, 3, 'wp_theme', '', 0, 1),
(4, 4, 'post_tag', '', 0, 1),
(5, 5, 'post_tag', '', 0, 1),
(6, 6, 'post_tag', '', 0, 1),
(7, 7, 'category', '', 0, 1),
(8, 8, 'category', '', 0, 1),
(9, 9, 'post_tag', '', 0, 1),
(10, 10, 'post_tag', '', 0, 1),
(11, 11, 'post_tag', '', 0, 1),
(12, 12, 'category', '', 0, 1),
(13, 13, 'post_tag', '', 0, 1),
(14, 14, 'post_tag', '', 0, 1),
(15, 15, 'post_tag', '', 0, 1),
(16, 16, 'category', '', 0, 1),
(17, 17, 'post_tag', '', 0, 1),
(18, 18, 'post_tag', '', 0, 1),
(19, 19, 'post_tag', '', 0, 1),
(20, 20, 'category', '', 0, 1),
(21, 21, 'post_tag', '', 0, 1),
(22, 22, 'post_tag', '', 0, 1),
(23, 23, 'post_tag', '', 0, 1),
(24, 24, 'category', '', 0, 1),
(25, 25, 'post_tag', '', 0, 1),
(26, 26, 'post_tag', '', 0, 1),
(27, 27, 'post_tag', '', 0, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `wp_usermeta`
--

CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Despejando dados para a tabela `wp_usermeta`
--

INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'Theu'),
(2, 1, 'first_name', 'Matheus'),
(3, 1, 'last_name', 'Silva'),
(4, 1, 'description', 'Aluno no Curso Técnico em Informática 25 no Senac Americana'),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'syntax_highlighting', 'true'),
(7, 1, 'comment_shortcuts', 'true'),
(8, 1, 'admin_color', 'ectoplasm'),
(9, 1, 'use_ssl', '0'),
(10, 1, 'show_admin_bar_front', 'true'),
(11, 1, 'locale', ''),
(12, 1, 'wp_capabilities', 'a:1:{s:13:\"administrator\";b:1;}'),
(13, 1, 'wp_user_level', '10'),
(14, 1, 'dismissed_wp_pointers', ''),
(15, 1, 'show_welcome_panel', '0'),
(16, 1, 'session_tokens', 'a:1:{s:64:\"cf46db5c10fffa3019c2b7b55632039d8d9e7afdd452d5a030df71c302563328\";a:4:{s:10:\"expiration\";i:1746829380;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36\";s:5:\"login\";i:1746656580;}}'),
(17, 1, 'wp_dashboard_quick_press_last_post_id', '56'),
(18, 1, 'closedpostboxes_dashboard', 'a:0:{}'),
(19, 1, 'metaboxhidden_dashboard', 'a:5:{i:0;s:21:\"dashboard_site_health\";i:1;s:19:\"dashboard_right_now\";i:2;s:18:\"dashboard_activity\";i:3;s:21:\"dashboard_quick_press\";i:4;s:17:\"dashboard_primary\";}'),
(20, 1, 'wp_user-settings', 'libraryContent=browse'),
(21, 1, 'wp_user-settings-time', '1746055737'),
(22, 1, 'wp_persisted_preferences', 'a:4:{s:4:\"core\";a:3:{s:26:\"isComplementaryAreaVisible\";b:1;s:10:\"openPanels\";a:3:{i:0;s:11:\"post-status\";i:1;s:23:\"taxonomy-panel-post_tag\";i:2;s:23:\"taxonomy-panel-category\";}s:24:\"enableChoosePatternModal\";b:1;}s:9:\"_modified\";s:24:\"2025-05-08T00:35:07.841Z\";s:14:\"core/edit-site\";a:1:{s:12:\"welcomeGuide\";b:0;}s:14:\"core/edit-post\";a:1:{s:12:\"welcomeGuide\";b:0;}}');

-- --------------------------------------------------------

--
-- Estrutura para tabela `wp_users`
--

CREATE TABLE `wp_users` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `user_login` varchar(60) NOT NULL DEFAULT '',
  `user_pass` varchar(255) NOT NULL DEFAULT '',
  `user_nicename` varchar(50) NOT NULL DEFAULT '',
  `user_email` varchar(100) NOT NULL DEFAULT '',
  `user_url` varchar(100) NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT 0,
  `display_name` varchar(250) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Despejando dados para a tabela `wp_users`
--

INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'Matheus', '$wp$2y$10$1DpSoL1ismuraoAcszzLiuGncFW9NZcWqgsKpQMbUV0WwMxgYHkXO', 'matheus', 'paesmatheus665@gmail.com', 'http://localhost/blog-Estetique', '2025-04-30 23:01:15', '', 0, 'Matheus');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `agendamentos`
--
ALTER TABLE `agendamentos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `empresa_id` (`empresa_id`),
  ADD KEY `servico_id` (`servico_id`),
  ADD KEY `consumidor_id` (`consumidor_id`);

--
-- Índices de tabela `configuracoes_empresa`
--
ALTER TABLE `configuracoes_empresa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `empresa_id` (`empresa_id`);

--
-- Índices de tabela `consumidores`
--
ALTER TABLE `consumidores`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `empresas`
--
ALTER TABLE `empresas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `plano_id` (`plano_id`);

--
-- Índices de tabela `planos`
--
ALTER TABLE `planos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `servicos`
--
ALTER TABLE `servicos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `empresa_id` (`empresa_id`);

--
-- Índices de tabela `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `comment_id` (`comment_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Índices de tabela `wp_comments`
--
ALTER TABLE `wp_comments`
  ADD PRIMARY KEY (`comment_ID`),
  ADD KEY `comment_post_ID` (`comment_post_ID`),
  ADD KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  ADD KEY `comment_date_gmt` (`comment_date_gmt`),
  ADD KEY `comment_parent` (`comment_parent`),
  ADD KEY `comment_author_email` (`comment_author_email`(10));

--
-- Índices de tabela `wp_links`
--
ALTER TABLE `wp_links`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `link_visible` (`link_visible`);

--
-- Índices de tabela `wp_options`
--
ALTER TABLE `wp_options`
  ADD PRIMARY KEY (`option_id`),
  ADD UNIQUE KEY `option_name` (`option_name`),
  ADD KEY `autoload` (`autoload`);

--
-- Índices de tabela `wp_postmeta`
--
ALTER TABLE `wp_postmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Índices de tabela `wp_posts`
--
ALTER TABLE `wp_posts`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `post_name` (`post_name`(191)),
  ADD KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  ADD KEY `post_parent` (`post_parent`),
  ADD KEY `post_author` (`post_author`);

--
-- Índices de tabela `wp_termmeta`
--
ALTER TABLE `wp_termmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `term_id` (`term_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Índices de tabela `wp_terms`
--
ALTER TABLE `wp_terms`
  ADD PRIMARY KEY (`term_id`),
  ADD KEY `slug` (`slug`(191)),
  ADD KEY `name` (`name`(191));

--
-- Índices de tabela `wp_term_relationships`
--
ALTER TABLE `wp_term_relationships`
  ADD PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  ADD KEY `term_taxonomy_id` (`term_taxonomy_id`);

--
-- Índices de tabela `wp_term_taxonomy`
--
ALTER TABLE `wp_term_taxonomy`
  ADD PRIMARY KEY (`term_taxonomy_id`),
  ADD UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  ADD KEY `taxonomy` (`taxonomy`);

--
-- Índices de tabela `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  ADD PRIMARY KEY (`umeta_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Índices de tabela `wp_users`
--
ALTER TABLE `wp_users`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_login_key` (`user_login`),
  ADD KEY `user_nicename` (`user_nicename`),
  ADD KEY `user_email` (`user_email`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `agendamentos`
--
ALTER TABLE `agendamentos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de tabela `configuracoes_empresa`
--
ALTER TABLE `configuracoes_empresa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `consumidores`
--
ALTER TABLE `consumidores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `empresas`
--
ALTER TABLE `empresas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `planos`
--
ALTER TABLE `planos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `servicos`
--
ALTER TABLE `servicos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `wp_comments`
--
ALTER TABLE `wp_comments`
  MODIFY `comment_ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `wp_links`
--
ALTER TABLE `wp_links`
  MODIFY `link_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `wp_options`
--
ALTER TABLE `wp_options`
  MODIFY `option_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=328;

--
-- AUTO_INCREMENT de tabela `wp_postmeta`
--
ALTER TABLE `wp_postmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT de tabela `wp_posts`
--
ALTER TABLE `wp_posts`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT de tabela `wp_termmeta`
--
ALTER TABLE `wp_termmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `wp_terms`
--
ALTER TABLE `wp_terms`
  MODIFY `term_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de tabela `wp_term_taxonomy`
--
ALTER TABLE `wp_term_taxonomy`
  MODIFY `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de tabela `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  MODIFY `umeta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de tabela `wp_users`
--
ALTER TABLE `wp_users`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `agendamentos`
--
ALTER TABLE `agendamentos`
  ADD CONSTRAINT `agendamentos_ibfk_1` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`),
  ADD CONSTRAINT `agendamentos_ibfk_2` FOREIGN KEY (`servico_id`) REFERENCES `servicos` (`id`),
  ADD CONSTRAINT `agendamentos_ibfk_3` FOREIGN KEY (`consumidor_id`) REFERENCES `consumidores` (`id`);

--
-- Restrições para tabelas `configuracoes_empresa`
--
ALTER TABLE `configuracoes_empresa`
  ADD CONSTRAINT `configuracoes_empresa_ibfk_1` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`);

--
-- Restrições para tabelas `empresas`
--
ALTER TABLE `empresas`
  ADD CONSTRAINT `empresas_ibfk_1` FOREIGN KEY (`plano_id`) REFERENCES `planos` (`id`);

--
-- Restrições para tabelas `servicos`
--
ALTER TABLE `servicos`
  ADD CONSTRAINT `servicos_ibfk_1` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
