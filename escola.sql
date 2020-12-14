-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 14-Dez-2020 às 22:51
-- Versão do servidor: 10.4.13-MariaDB
-- versão do PHP: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `escola`
--
CREATE DATABASE IF NOT EXISTS `escola` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `escola`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cargo`
--

CREATE TABLE `cargo` (
  `id_cargo` int(11) NOT NULL,
  `cargo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `cargo`
--

INSERT INTO `cargo` (`id_cargo`, `cargo`) VALUES
(1, 'Professor'),
(2, 'Diretor'),
(3, 'Coordenador Pedagógico'),
(4, 'Coordenador Informática'),
(5, 'Coordenador RH'),
(6, 'Coordenador Ensino Médio'),
(7, 'Coordenador Admiministração'),
(8, 'Coordenador Biblioteca');

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionários`
--

CREATE TABLE `funcionários` (
  `id_func` int(11) NOT NULL,
  `Nome` varchar(255) NOT NULL,
  `Data_Entrada` date NOT NULL,
  `Data_Saida` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `funcionários`
--

INSERT INTO `funcionários` (`id_func`, `Nome`, `Data_Entrada`, `Data_Saida`) VALUES
(1, 'Amanda', '2008-02-01', NULL),
(2, 'Célia', '2016-02-01', NULL),
(3, 'Cinthia', '2008-02-01', '2020-11-30'),
(4, 'Anderson', '2008-02-01', '2020-11-30'),
(5, 'Sirlei', '2008-02-01', NULL),
(6, 'Lucas', '2019-04-03', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `funci_cargo`
--

CREATE TABLE `funci_cargo` (
  `id_func` int(11) NOT NULL,
  `id_cargo` int(11) NOT NULL,
  `Data_Entrada` date NOT NULL,
  `Data_Saida` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `funci_cargo`
--

INSERT INTO `funci_cargo` (`id_func`, `id_cargo`, `Data_Entrada`, `Data_Saida`) VALUES
(1, 1, '2008-02-01', NULL),
(4, 1, '2010-02-01', '0000-00-00'),
(3, 1, '2010-02-01', '2020-11-30'),
(2, 1, '2008-02-01', NULL),
(2, 2, '2016-02-01', NULL),
(6, 1, '2019-04-03', NULL),
(5, 7, '2019-02-06', NULL),
(5, 1, '2008-02-01', NULL),
(3, 4, '2008-02-01', '2020-11-30'),
(4, 5, '2008-02-01', '2020-11-30');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`id_cargo`);

--
-- Índices para tabela `funcionários`
--
ALTER TABLE `funcionários`
  ADD PRIMARY KEY (`id_func`);

--
-- Índices para tabela `funci_cargo`
--
ALTER TABLE `funci_cargo`
  ADD KEY `id_func` (`id_func`),
  ADD KEY `id_cargo` (`id_cargo`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cargo`
--
ALTER TABLE `cargo`
  MODIFY `id_cargo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `funcionários`
--
ALTER TABLE `funcionários`
  MODIFY `id_func` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `funci_cargo`
--
ALTER TABLE `funci_cargo`
  ADD CONSTRAINT `funci_cargo_ibfk_1` FOREIGN KEY (`id_func`) REFERENCES `funcionários` (`id_func`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `funci_cargo_ibfk_2` FOREIGN KEY (`id_cargo`) REFERENCES `cargo` (`id_cargo`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
