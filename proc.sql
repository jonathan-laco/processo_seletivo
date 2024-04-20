-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 13/07/2023 às 03:38
-- Versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: ``
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `filhos`
--

CREATE TABLE `filhos` (
  `id` int(11) NOT NULL,
  `pessoas_id` int(11) DEFAULT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `idade` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `filhos`
--

INSERT INTO `filhos` (`id`, `pessoas_id`, `nome`, `idade`) VALUES
(1, 1, 'Pedro', 5),
(2, 1, 'Mariana', 7),
(3, 2, 'Luiz', 3),
(4, 3, 'Julia', 4),
(5, 3, 'Gabriel', 5),
(6, 3, 'Laura', 8),
(7, 4, 'Rafael', 6),
(8, 4, 'Sophia', 4),
(9, 5, 'Miguel', 3),
(10, 5, 'Alice', 6),
(11, 5, 'Giovanna', 4),
(12, 6, 'Arthur', 4),
(13, 7, 'Pedro', 3),
(14, 8, 'Isabella', 4),
(15, 9, 'Matheus', 2),
(16, 9, 'Larissa', 4),
(17, 10, 'João', 1),
(18, 11, 'Lucas', 3),
(19, 11, 'Ana', 2),
(20, 11, 'Beatriz', 5),
(21, 12, 'Daniel', 6),
(22, 12, 'Carolina', 4),
(23, 13, 'Pedro', 2),
(24, 13, 'Sophia', 3),
(25, 14, 'Miguel', 5),
(26, 14, 'Laura', 6),
(27, 14, 'Gabriel', 4),
(28, 14, 'Luiza', 3),
(29, 15, 'Arthur', 3),
(30, 15, 'Pedro', 1),
(31, 15, 'Larissa', 4),
(32, 15, 'Lucas', 5),
(33, 15, 'Ana', 2),
(34, 16, 'Gabriel', 2),
(35, 16, 'Laura', 3),
(36, 16, 'Lucas', 4),
(37, 16, 'João', 1),
(38, 16, 'Giovanna', 5),
(39, 16, 'Arthur', 6),
(40, 16, 'Sophia', 7);

-- --------------------------------------------------------

--
-- Estrutura para tabela `pessoas`
--

CREATE TABLE `pessoas` (
  `id` int(11) NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `idade` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `pessoas`
--

INSERT INTO `pessoas` (`id`, `nome`, `idade`) VALUES
(1, 'João', 30),
(2, 'Maria', 28),
(3, 'Pedro', 35),
(4, 'Ana', 32),
(5, 'Lucas', 27),
(6, 'Laura', 29),
(7, 'Carlos', 25),
(8, 'Camila', 30),
(9, 'Felipe', 27),
(10, 'Juliana', 33),
(11, 'Rafael', 29),
(12, 'Isabela', 31),
(13, 'Gustavo', 28),
(14, 'Larissa', 35),
(15, 'Diego', 24),
(16, 'Fernanda', 26);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `filhos`
--
ALTER TABLE `filhos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pessoas_id` (`pessoas_id`);

--
-- Índices de tabela `pessoas`
--
ALTER TABLE `pessoas`
  ADD PRIMARY KEY (`id`);

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `filhos`
--
ALTER TABLE `filhos`
  ADD CONSTRAINT `filhos_ibfk_1` FOREIGN KEY (`pessoas_id`) REFERENCES `pessoas` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
