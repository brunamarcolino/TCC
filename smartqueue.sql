-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 05-Maio-2017 às 14:51
-- Versão do servidor: 10.1.19-MariaDB
-- PHP Version: 7.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `smartqueue`
--
CREATE DATABASE IF NOT EXISTS `smartqueue` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `smartqueue`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tab_fila`
--

CREATE TABLE IF NOT EXISTS `tab_fila` (
  `id_fila` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) DEFAULT NULL,
  `status_fila` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_fila`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_usuario_2` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tab_fila`
--

INSERT INTO `tab_fila` (`id_fila`, `id_usuario`, `status_fila`) VALUES
(1, NULL, 'Fechada'),
(2, NULL, 'Fechada'),
(3, NULL, 'Fechada'),
(4, NULL, 'Fechada'),
(5, NULL, 'Fechada'),
(6, NULL, 'Fechada'),
(7, NULL, 'Fechada');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tab_parametros`
--

CREATE TABLE IF NOT EXISTS `tab_parametros` (
  `id_parametro` int(2) NOT NULL AUTO_INCREMENT COMMENT 'Código do parâmetro',
  `desc_parametro` varchar(50) NOT NULL COMMENT 'Descrição do parâmetro',
  `valor_parametro` varchar(150) NOT NULL COMMENT 'Valor do parâmetro',
  `parametro_habilitado` int(1) NOT NULL DEFAULT '1',
  `usuario_alteracao` int(4) NOT NULL COMMENT 'Usuário que realizou a última alteração',
  `data_alteracao` date NOT NULL COMMENT 'Data da última alteração',
  PRIMARY KEY (`id_parametro`),
  KEY `usuario_alteracao` (`usuario_alteracao`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COMMENT='Parametros do sistema (controlados pelo adm)';

--
-- Extraindo dados da tabela `tab_parametros`
--

INSERT INTO `tab_parametros` (`id_parametro`, `desc_parametro`, `valor_parametro`, `parametro_habilitado`, `usuario_alteracao`, `data_alteracao`) VALUES
(1, 'Horário de Funcionamento', 'DETERMINADO', 1, 0, '2017-04-03'),
(2, 'Horario inicio atendimento', '01:00', 1, 0, '2017-04-02'),
(3, 'Horario abertura da fila', '07:00', 1, 0, '2017-04-02'),
(4, 'Horario de encerramento da fila', '20:00', 1, 0, '2017-04-02'),
(5, 'Aceita segunda chance ?', 'SIM', 1, 0, '2017-04-02'),
(6, 'Numero de Mesas', '4', 1, 0, '2017-04-02'),
(7, 'Distancia permitida (KM)', '5', 1, 0, '2017-04-02'),
(8, 'Localização do atendimento', 'Metrocamp', 1, 0, '2017-04-09');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tab_senhas`
--

CREATE TABLE IF NOT EXISTS `tab_senhas` (
  `id_sequencia` int(11) NOT NULL AUTO_INCREMENT,
  `id_senha` int(4) NOT NULL COMMENT 'Senha ',
  `data_senha` date NOT NULL COMMENT 'Data de geração ',
  `cpf_cliente` varchar(15) DEFAULT NULL COMMENT 'CPF do cliente ',
  `email_cliente` varchar(60) DEFAULT NULL,
  `nm_cliente` varchar(50) DEFAULT NULL COMMENT 'Nome do Cliente ',
  `senha_cliente` varchar(60) DEFAULT NULL COMMENT 'Senha do Cliente ',
  `status_atendimento` varchar(15) NOT NULL COMMENT 'Status: Ativo | Em atendimento | Cancelado | Atendido | Chamando | Não compareceu | Segunda Chance ',
  `tipo_atendimento` varchar(12) DEFAULT 'Normal' COMMENT 'Normal / Preferencial',
  `data_atendimento_ini` datetime DEFAULT NULL COMMENT 'Data do início do atendimento ',
  `data_atendimento_fim` datetime DEFAULT NULL COMMENT 'Data do final do atendimento ',
  `id_usuario` int(4) DEFAULT NULL COMMENT 'Código do atendente ',
  `id_player` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_sequencia`),
  UNIQUE KEY `id_senha` (`id_senha`,`data_senha`),
  KEY `id_usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=391 DEFAULT CHARSET=latin1 COMMENT='Tabela de senhas (senha que manda pros clientes + cadastro)';

--
-- Extraindo dados da tabela `tab_senhas`
--

INSERT INTO `tab_senhas` (`id_sequencia`, `id_senha`, `data_senha`, `cpf_cliente`, `email_cliente`, `nm_cliente`, `senha_cliente`, `status_atendimento`, `tipo_atendimento`, `data_atendimento_ini`, `data_atendimento_fim`, `id_usuario`, `id_player`) VALUES
(1, 1, '2017-05-01', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-01 00:01:00', '2017-05-01 00:14:43', 1, NULL),
(2, 2, '2017-05-01', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-01 00:01:00', '2017-05-01 00:13:23', 1, NULL),
(3, 3, '2017-05-01', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-01 00:01:00', '2017-05-01 00:05:11', 1, NULL),
(4, 4, '2017-05-01', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-01 00:01:00', '2017-05-01 00:08:09', 1, NULL),
(5, 5, '2017-05-01', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Preferencial', '2017-05-01 00:01:00', '2017-05-01 00:18:59', 2, NULL),
(6, 6, '2017-05-01', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Preferencial', '2017-05-01 00:01:00', '2017-05-01 00:17:43', 2, NULL),
(7, 7, '2017-05-01', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-01 00:01:00', '2017-05-01 00:11:23', 2, NULL),
(8, 8, '2017-05-01', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-01 00:01:00', '2017-05-01 00:03:11', 2, NULL),
(9, 9, '2017-05-01', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-01 00:01:00', '2017-05-01 00:09:09', 2, NULL),
(10, 10, '2017-05-01', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-01 00:01:00', '2017-05-01 00:15:59', 2, NULL),
(11, 11, '2017-05-01', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-01 00:01:00', '2017-05-01 00:12:43', 2, NULL),
(12, 12, '2017-05-01', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-01 00:01:00', '2017-05-01 00:11:23', 3, NULL),
(13, 13, '2017-05-01', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-01 00:01:00', '2017-05-01 00:05:50', 3, NULL),
(14, 14, '2017-05-01', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-01 00:01:00', '2017-05-01 00:07:22', 3, NULL),
(15, 15, '2017-05-01', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Preferencial', '2017-05-01 00:01:00', '2017-05-01 00:20:59', 3, NULL),
(16, 16, '2017-05-01', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Preferencial', '2017-05-01 00:01:00', '2017-05-01 00:26:43', 4, NULL),
(17, 17, '2017-05-01', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Preferencial', '2017-05-01 00:01:00', '2017-05-01 00:45:43', 4, NULL),
(18, 18, '2017-05-01', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-01 00:01:00', '2017-05-01 00:08:23', 5, NULL),
(19, 19, '2017-05-01', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-01 00:01:00', '2017-05-01 00:09:11', 5, NULL),
(20, 20, '2017-05-01', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-01 00:01:00', '2017-05-01 00:30:09', 5, NULL),
(21, 21, '2017-05-01', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-01 00:01:00', '2017-05-01 00:10:59', 5, NULL),
(22, 1, '2017-05-02', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-02 00:01:00', '2017-05-02 00:14:43', 1, NULL),
(23, 2, '2017-05-02', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-02 00:01:00', '2017-05-02 00:13:23', 1, NULL),
(24, 3, '2017-05-02', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-02 00:01:00', '2017-05-02 00:05:11', 1, NULL),
(25, 4, '2017-05-02', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-02 00:01:00', '2017-05-02 00:08:09', 1, NULL),
(26, 5, '2017-05-02', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Preferencial', '2017-05-02 00:01:00', '2017-05-02 00:18:59', 1, NULL),
(27, 6, '2017-05-02', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Preferencial', '2017-05-02 00:01:00', '2017-05-02 00:17:43', 1, NULL),
(28, 7, '2017-05-02', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-02 00:01:00', '2017-05-02 00:11:23', 2, NULL),
(29, 8, '2017-05-02', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-02 00:01:00', '2017-05-02 00:03:11', 2, NULL),
(30, 9, '2017-05-02', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-02 00:01:00', '2017-05-02 00:09:09', 2, NULL),
(31, 10, '2017-05-02', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-02 00:01:00', '2017-05-02 00:15:59', 2, NULL),
(32, 11, '2017-05-02', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-02 00:01:00', '2017-05-02 00:12:43', 3, NULL),
(33, 12, '2017-05-02', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-02 00:01:00', '2017-05-02 00:11:23', 3, NULL),
(34, 13, '2017-05-02', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-02 00:01:00', '2017-05-02 00:05:50', 3, NULL),
(35, 14, '2017-05-02', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-02 00:01:00', '2017-05-02 00:07:22', 3, NULL),
(36, 15, '2017-05-02', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Preferencial', '2017-05-02 00:01:00', '2017-05-02 00:20:59', 3, NULL),
(37, 16, '2017-05-02', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Preferencial', '2017-05-02 00:01:00', '2017-05-02 00:26:43', 4, NULL),
(38, 17, '2017-05-02', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Preferencial', '2017-05-02 00:01:00', '2017-05-02 00:45:43', 4, NULL),
(39, 18, '2017-05-02', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-02 00:01:00', '2017-05-02 00:08:23', 4, NULL),
(40, 19, '2017-05-02', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-02 00:01:00', '2017-05-02 00:09:11', 4, NULL),
(41, 20, '2017-05-02', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-02 00:01:00', '2017-05-02 00:30:09', 5, NULL),
(42, 21, '2017-05-02', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-02 00:01:00', '2017-05-02 00:10:59', 5, NULL),
(43, 1, '2017-05-03', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-03 00:01:00', '2017-05-03 00:14:43', 1, NULL),
(44, 2, '2017-05-03', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-03 00:01:00', '2017-05-03 00:13:23', 1, NULL),
(45, 3, '2017-05-03', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-03 00:01:00', '2017-05-03 00:05:11', 1, NULL),
(46, 4, '2017-05-03', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-03 00:01:00', '2017-05-03 00:08:09', 1, NULL),
(47, 5, '2017-05-03', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Preferencial', '2017-05-03 00:01:00', '2017-05-03 00:18:59', 1, NULL),
(48, 6, '2017-05-03', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Preferencial', '2017-05-03 00:01:00', '2017-05-03 00:17:43', 2, NULL),
(49, 7, '2017-05-03', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-03 00:01:00', '2017-05-03 00:11:23', 2, NULL),
(50, 8, '2017-05-03', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-03 00:01:00', '2017-05-03 00:03:11', 4, NULL),
(51, 9, '2017-05-03', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-03 00:01:00', '2017-05-03 00:09:09', 4, NULL),
(52, 10, '2017-05-03', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-03 00:01:00', '2017-05-03 00:15:59', 2, NULL),
(53, 11, '2017-05-03', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-03 00:01:00', '2017-05-03 00:12:43', 2, NULL),
(54, 12, '2017-05-03', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-03 00:01:00', '2017-05-03 00:11:23', 1, NULL),
(55, 13, '2017-05-03', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-03 00:01:00', '2017-05-03 00:05:50', 3, NULL),
(56, 14, '2017-05-03', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-03 00:01:00', '2017-05-03 00:07:22', 3, NULL),
(57, 15, '2017-05-03', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Preferencial', '2017-05-03 00:01:00', '2017-05-03 00:20:59', 3, NULL),
(58, 16, '2017-05-03', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Preferencial', '2017-05-03 00:01:00', '2017-05-03 00:26:43', 4, NULL),
(59, 17, '2017-05-03', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Preferencial', '2017-05-03 00:01:00', '2017-05-03 00:45:43', 4, NULL),
(60, 18, '2017-05-03', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-03 00:01:00', '2017-05-03 00:08:23', 5, NULL),
(61, 19, '2017-05-03', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-03 00:01:00', '2017-05-03 00:09:11', 3, NULL),
(62, 20, '2017-05-03', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-03 00:01:00', '2017-05-03 00:30:09', 5, NULL),
(63, 21, '2017-05-03', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-03 00:01:00', '2017-05-03 00:10:59', 5, NULL),
(64, 1, '2017-05-04', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-04 00:01:00', '2017-05-04 00:14:43', 5, NULL),
(65, 2, '2017-05-04', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-04 00:01:00', '2017-05-04 00:13:23', 1, NULL),
(66, 3, '2017-05-04', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-04 00:01:00', '2017-05-04 00:05:11', 1, NULL),
(67, 4, '2017-05-04', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-04 00:01:00', '2017-05-04 00:08:09', 3, NULL),
(68, 5, '2017-05-04', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Preferencial', '2017-05-04 00:01:00', '2017-05-04 00:18:59', 2, NULL),
(69, 6, '2017-05-04', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Preferencial', '2017-05-04 00:01:00', '2017-05-04 00:17:43', 2, NULL),
(70, 7, '2017-05-04', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-04 00:01:00', '2017-05-04 00:11:23', 2, NULL),
(71, 8, '2017-05-04', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-04 00:01:00', '2017-05-04 00:03:11', 2, NULL),
(72, 9, '2017-05-04', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-04 00:01:00', '2017-05-04 00:09:09', 2, NULL),
(73, 10, '2017-05-04', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-04 00:01:00', '2017-05-04 00:15:59', 1, NULL),
(74, 11, '2017-05-04', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-04 00:01:00', '2017-05-04 00:12:43', 2, NULL),
(75, 12, '2017-05-04', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-04 00:01:00', '2017-05-04 00:11:23', 3, NULL),
(76, 13, '2017-05-04', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-04 00:01:00', '2017-05-04 00:05:50', 3, NULL),
(77, 14, '2017-05-04', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-04 00:01:00', '2017-05-04 00:07:22', 2, NULL),
(78, 15, '2017-05-04', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Preferencial', '2017-05-04 00:01:00', '2017-05-04 00:20:59', 3, NULL),
(79, 16, '2017-05-04', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Preferencial', '2017-05-04 00:01:00', '2017-05-04 00:26:43', 4, NULL),
(80, 17, '2017-05-04', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Preferencial', '2017-05-04 00:01:00', '2017-05-04 00:45:43', 4, NULL),
(81, 18, '2017-05-04', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-04 00:01:00', '2017-05-04 00:08:23', 5, NULL),
(82, 19, '2017-05-04', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-04 00:01:00', '2017-05-04 00:09:11', 5, NULL),
(83, 20, '2017-05-04', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-04 00:01:00', '2017-05-04 00:30:09', 5, NULL),
(84, 21, '2017-05-04', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-04 00:01:00', '2017-05-04 00:10:59', 4, NULL),
(106, 1, '2017-05-06', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-06 00:01:00', '2017-05-06 00:14:43', 1, NULL),
(107, 2, '2017-05-06', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-06 00:01:00', '2017-05-06 00:13:23', 2, NULL),
(108, 3, '2017-05-06', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-06 00:01:00', '2017-05-06 00:05:11', 3, NULL),
(109, 4, '2017-05-06', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-06 00:01:00', '2017-05-06 00:08:09', 4, NULL),
(110, 5, '2017-05-06', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Preferencial', '2017-05-06 00:01:00', '2017-05-06 00:18:59', 5, NULL),
(111, 6, '2017-05-06', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Preferencial', '2017-05-06 00:01:00', '2017-05-06 00:17:43', 2, NULL),
(112, 7, '2017-05-06', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-06 00:01:00', '2017-05-06 00:11:23', 2, NULL),
(113, 8, '2017-05-06', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-06 00:01:00', '2017-05-06 00:03:11', 1, NULL),
(114, 9, '2017-05-06', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-06 00:01:00', '2017-05-06 00:09:09', 2, NULL),
(115, 10, '2017-05-06', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-06 00:01:00', '2017-05-06 00:15:59', 2, NULL),
(116, 11, '2017-05-06', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-06 00:01:00', '2017-05-06 00:12:43', 5, NULL),
(117, 12, '2017-05-06', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-06 00:01:00', '2017-05-06 00:11:23', 3, NULL),
(118, 13, '2017-05-06', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-06 00:01:00', '2017-05-06 00:05:50', 2, NULL),
(119, 14, '2017-05-06', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-06 00:01:00', '2017-05-06 00:07:22', 3, NULL),
(120, 15, '2017-05-06', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Preferencial', '2017-05-06 00:01:00', '2017-05-06 00:20:59', 3, NULL),
(121, 16, '2017-05-06', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Preferencial', '2017-05-06 00:01:00', '2017-05-06 00:26:43', 2, NULL),
(122, 17, '2017-05-06', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Preferencial', '2017-05-06 00:01:00', '2017-05-06 00:45:43', 4, NULL),
(123, 18, '2017-05-06', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-06 00:01:00', '2017-05-06 00:08:23', 5, NULL),
(124, 19, '2017-05-06', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-06 00:01:00', '2017-05-06 00:09:11', 3, NULL),
(125, 20, '2017-05-06', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-06 00:01:00', '2017-05-06 00:30:09', 5, NULL),
(126, 21, '2017-05-06', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-06 00:01:00', '2017-05-06 00:10:59', 1, NULL),
(127, 1, '2017-05-07', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-07 00:01:00', '2017-05-07 00:14:43', 1, NULL),
(128, 2, '2017-05-07', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-07 00:01:00', '2017-05-07 00:13:23', 1, NULL),
(129, 3, '2017-05-07', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-07 00:01:00', '2017-05-07 00:05:11', 1, NULL),
(130, 4, '2017-05-07', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-07 00:01:00', '2017-05-07 00:08:09', 1, NULL),
(131, 5, '2017-05-07', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Preferencial', '2017-05-07 00:01:00', '2017-05-07 00:18:59', 2, NULL),
(132, 6, '2017-05-07', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Preferencial', '2017-05-07 00:01:00', '2017-05-07 00:17:43', 2, NULL),
(133, 7, '2017-05-07', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-07 00:01:00', '2017-05-07 00:11:23', 2, NULL),
(134, 8, '2017-05-07', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-07 00:01:00', '2017-05-07 00:03:11', 2, NULL),
(135, 9, '2017-05-07', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-07 00:01:00', '2017-05-07 00:09:09', 2, NULL),
(136, 10, '2017-05-07', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-07 00:01:00', '2017-05-07 00:15:59', 2, NULL),
(137, 11, '2017-05-07', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-07 00:01:00', '2017-05-07 00:12:43', 2, NULL),
(138, 12, '2017-05-07', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-07 00:01:00', '2017-05-07 00:11:23', 3, NULL),
(139, 13, '2017-05-07', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-07 00:01:00', '2017-05-07 00:05:50', 3, NULL),
(140, 14, '2017-05-07', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-07 00:01:00', '2017-05-07 00:07:22', 3, NULL),
(141, 15, '2017-05-07', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Preferencial', '2017-05-07 00:01:00', '2017-05-07 00:20:59', 3, NULL),
(142, 16, '2017-05-07', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Preferencial', '2017-05-07 00:01:00', '2017-05-07 00:26:43', 4, NULL),
(143, 17, '2017-05-07', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Preferencial', '2017-05-07 00:01:00', '2017-05-07 00:45:43', 4, NULL),
(144, 18, '2017-05-07', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-07 00:01:00', '2017-05-07 00:08:23', 5, NULL),
(145, 19, '2017-05-07', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-07 00:01:00', '2017-05-07 00:09:11', 5, NULL),
(146, 20, '2017-05-07', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-07 00:01:00', '2017-05-07 00:30:09', 5, NULL),
(147, 21, '2017-05-07', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-07 00:01:00', '2017-05-07 00:10:59', 5, NULL),
(148, 1, '2017-05-08', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-08 00:01:00', '2017-05-08 00:14:43', 1, NULL),
(149, 2, '2017-05-08', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-08 00:01:00', '2017-05-08 00:13:23', 1, NULL),
(150, 3, '2017-05-08', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-08 00:01:00', '2017-05-08 00:05:11', 1, NULL),
(151, 4, '2017-05-08', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-08 00:01:00', '2017-05-08 00:08:09', 1, NULL),
(152, 5, '2017-05-08', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Preferencial', '2017-05-08 00:01:00', '2017-05-08 00:18:59', 3, NULL),
(153, 6, '2017-05-08', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Preferencial', '2017-05-08 00:01:00', '2017-05-08 00:17:43', 2, NULL),
(154, 7, '2017-05-08', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-08 00:01:00', '2017-05-08 00:11:23', 2, NULL),
(155, 8, '2017-05-08', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-08 00:01:00', '2017-05-08 00:03:11', 2, NULL),
(156, 9, '2017-05-08', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-08 00:01:00', '2017-05-08 00:09:09', 2, NULL),
(157, 10, '2017-05-08', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-08 00:01:00', '2017-05-08 00:15:59', 4, NULL),
(158, 11, '2017-05-08', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-08 00:01:00', '2017-05-08 00:12:43', 2, NULL),
(159, 12, '2017-05-08', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-08 00:01:00', '2017-05-08 00:11:23', 3, NULL),
(160, 13, '2017-05-08', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-08 00:01:00', '2017-05-08 00:05:50', 3, NULL),
(161, 14, '2017-05-08', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-08 00:01:00', '2017-05-08 00:07:22', 3, NULL),
(162, 15, '2017-05-08', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Preferencial', '2017-05-08 00:01:00', '2017-05-08 00:20:59', 3, NULL),
(163, 16, '2017-05-08', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Preferencial', '2017-05-08 00:01:00', '2017-05-08 00:26:43', 4, NULL),
(164, 17, '2017-05-08', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Preferencial', '2017-05-08 00:01:00', '2017-05-08 00:45:43', 4, NULL),
(165, 18, '2017-05-08', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-08 00:01:00', '2017-05-08 00:08:23', 5, NULL),
(166, 19, '2017-05-08', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-08 00:01:00', '2017-05-08 00:09:11', 2, NULL),
(167, 20, '2017-05-08', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-08 00:01:00', '2017-05-08 00:30:09', 5, NULL),
(168, 21, '2017-05-08', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-08 00:01:00', '2017-05-08 00:10:59', 5, NULL),
(169, 1, '2017-05-09', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-09 00:01:00', '2017-05-09 00:14:43', 1, NULL),
(170, 2, '2017-05-09', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-09 00:01:00', '2017-05-09 00:13:23', 1, NULL),
(171, 3, '2017-05-09', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-09 00:01:00', '2017-05-09 00:05:11', 5, NULL),
(172, 4, '2017-05-09', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-09 00:01:00', '2017-05-09 00:08:09', 1, NULL),
(173, 5, '2017-05-09', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Preferencial', '2017-05-09 00:01:00', '2017-05-09 00:18:59', 2, NULL),
(174, 6, '2017-05-09', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Preferencial', '2017-05-09 00:01:00', '2017-05-09 00:17:43', 2, NULL),
(175, 7, '2017-05-09', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-09 00:01:00', '2017-05-09 00:11:23', 2, NULL),
(176, 8, '2017-05-09', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-09 00:01:00', '2017-05-09 00:03:11', 2, NULL),
(177, 9, '2017-05-09', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-09 00:01:00', '2017-05-09 00:09:09', 2, NULL),
(178, 10, '2017-05-09', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-09 00:01:00', '2017-05-09 00:15:59', 2, NULL),
(179, 11, '2017-05-09', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-09 00:01:00', '2017-05-09 00:12:43', 2, NULL),
(180, 12, '2017-05-09', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-09 00:01:00', '2017-05-09 00:11:23', 3, NULL),
(181, 13, '2017-05-09', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-09 00:01:00', '2017-05-09 00:05:50', 3, NULL),
(182, 14, '2017-05-09', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-09 00:01:00', '2017-05-09 00:07:22', 3, NULL),
(183, 15, '2017-05-09', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Preferencial', '2017-05-09 00:01:00', '2017-05-09 00:20:59', 3, NULL),
(184, 16, '2017-05-09', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Preferencial', '2017-05-09 00:01:00', '2017-05-09 00:26:43', 4, NULL),
(185, 17, '2017-05-09', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Preferencial', '2017-05-09 00:01:00', '2017-05-09 00:45:43', 4, NULL),
(186, 18, '2017-05-09', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-09 00:01:00', '2017-05-09 00:08:23', 5, NULL),
(187, 19, '2017-05-09', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-09 00:01:00', '2017-05-09 00:09:11', 5, NULL),
(188, 20, '2017-05-09', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-09 00:01:00', '2017-05-09 00:30:09', 1, NULL),
(189, 21, '2017-05-09', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-09 00:01:00', '2017-05-09 00:10:59', 5, NULL),
(190, 1, '2017-05-10', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-10 00:01:00', '2017-05-10 00:14:43', 1, NULL),
(191, 2, '2017-05-10', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-10 00:01:00', '2017-05-10 00:13:23', 1, NULL),
(192, 3, '2017-05-10', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-10 00:01:00', '2017-05-10 00:05:11', 1, NULL),
(193, 4, '2017-05-10', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-10 00:01:00', '2017-05-10 00:08:09', 1, NULL),
(194, 5, '2017-05-10', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Preferencial', '2017-05-10 00:01:00', '2017-05-10 00:18:59', 2, NULL),
(195, 6, '2017-05-10', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Preferencial', '2017-05-10 00:01:00', '2017-05-10 00:17:43', 3, NULL),
(196, 7, '2017-05-10', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-10 00:01:00', '2017-05-10 00:11:23', 2, NULL),
(197, 8, '2017-05-10', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-10 00:01:00', '2017-05-10 00:03:11', 2, NULL),
(198, 9, '2017-05-10', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-10 00:01:00', '2017-05-10 00:09:09', 2, NULL),
(199, 10, '2017-05-10', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-10 00:01:00', '2017-05-10 00:15:59', 2, NULL),
(200, 11, '2017-05-10', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-10 00:01:00', '2017-05-10 00:12:43', 2, NULL),
(201, 12, '2017-05-10', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-10 00:01:00', '2017-05-10 00:11:23', 3, NULL),
(202, 13, '2017-05-10', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-10 00:01:00', '2017-05-10 00:05:50', 3, NULL),
(203, 14, '2017-05-10', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-10 00:01:00', '2017-05-10 00:07:22', 3, NULL),
(204, 15, '2017-05-10', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Preferencial', '2017-05-10 00:01:00', '2017-05-10 00:20:59', 3, NULL),
(205, 16, '2017-05-10', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Preferencial', '2017-05-10 00:01:00', '2017-05-10 00:26:43', 4, NULL),
(206, 17, '2017-05-10', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Preferencial', '2017-05-10 00:01:00', '2017-05-10 00:45:43', 4, NULL),
(207, 18, '2017-05-10', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-10 00:01:00', '2017-05-10 00:08:23', 5, NULL),
(208, 19, '2017-05-10', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-10 00:01:00', '2017-05-10 00:09:11', 5, NULL),
(209, 20, '2017-05-10', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-10 00:01:00', '2017-05-10 00:30:09', 5, NULL),
(210, 21, '2017-05-10', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-10 00:01:00', '2017-05-10 00:10:59', 1, NULL),
(211, 1, '2017-05-11', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-11 00:01:00', '2017-05-11 00:14:43', 5, NULL),
(212, 2, '2017-05-11', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-11 00:01:00', '2017-05-11 00:13:23', 1, NULL),
(213, 3, '2017-05-11', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-11 00:01:00', '2017-05-11 00:05:11', 1, NULL),
(214, 4, '2017-05-11', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-11 00:01:00', '2017-05-11 00:08:09', 1, NULL),
(215, 5, '2017-05-11', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Preferencial', '2017-05-11 00:01:00', '2017-05-11 00:18:59', 2, NULL),
(216, 6, '2017-05-11', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Preferencial', '2017-05-11 00:01:00', '2017-05-11 00:17:43', 2, NULL),
(217, 7, '2017-05-11', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-11 00:01:00', '2017-05-11 00:11:23', 2, NULL),
(218, 8, '2017-05-11', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-11 00:01:00', '2017-05-11 00:03:11', 2, NULL),
(219, 9, '2017-05-11', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-11 00:01:00', '2017-05-11 00:09:09', 2, NULL),
(220, 10, '2017-05-11', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-11 00:01:00', '2017-05-11 00:15:59', 2, NULL),
(221, 11, '2017-05-11', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-11 00:01:00', '2017-05-11 00:12:43', 2, NULL),
(222, 12, '2017-05-11', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-11 00:01:00', '2017-05-11 00:11:23', 3, NULL),
(223, 13, '2017-05-11', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-11 00:01:00', '2017-05-11 00:05:50', 3, NULL),
(224, 14, '2017-05-11', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-11 00:01:00', '2017-05-11 00:07:22', 3, NULL),
(225, 15, '2017-05-11', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Preferencial', '2017-05-11 00:01:00', '2017-05-11 00:20:59', 3, NULL),
(226, 16, '2017-05-11', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Preferencial', '2017-05-11 00:01:00', '2017-05-11 00:26:43', 4, NULL),
(227, 17, '2017-05-11', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Preferencial', '2017-05-11 00:01:00', '2017-05-11 00:45:43', 4, NULL),
(228, 18, '2017-05-11', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-11 00:01:00', '2017-05-11 00:08:23', 5, NULL),
(229, 19, '2017-05-11', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-11 00:01:00', '2017-05-11 00:09:11', 5, NULL),
(230, 20, '2017-05-11', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-11 00:01:00', '2017-05-11 00:30:09', 5, NULL),
(231, 21, '2017-05-11', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-11 00:01:00', '2017-05-11 00:10:59', 5, NULL),
(232, 1, '2017-05-12', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-12 00:01:00', '2017-05-12 00:14:43', 2, NULL),
(233, 2, '2017-05-12', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-12 00:01:00', '2017-05-12 00:13:23', 1, NULL),
(234, 3, '2017-05-12', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-12 00:01:00', '2017-05-12 00:05:11', 1, NULL),
(235, 4, '2017-05-12', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-12 00:01:00', '2017-05-12 00:08:09', 1, NULL),
(236, 5, '2017-05-12', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Preferencial', '2017-05-12 00:01:00', '2017-05-12 00:18:59', 2, NULL),
(237, 6, '2017-05-12', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Preferencial', '2017-05-12 00:01:00', '2017-05-12 00:17:43', 2, NULL),
(238, 7, '2017-05-12', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-12 00:01:00', '2017-05-12 00:11:23', 2, NULL),
(239, 8, '2017-05-12', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-12 00:01:00', '2017-05-12 00:03:11', 2, NULL),
(240, 9, '2017-05-12', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-12 00:01:00', '2017-05-12 00:09:09', 2, NULL),
(241, 10, '2017-05-12', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-12 00:01:00', '2017-05-12 00:15:59', 2, NULL),
(242, 11, '2017-05-12', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-12 00:01:00', '2017-05-12 00:12:43', 2, NULL),
(243, 12, '2017-05-12', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-12 00:01:00', '2017-05-12 00:11:23', 3, NULL),
(244, 13, '2017-05-12', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-12 00:01:00', '2017-05-12 00:05:50', 3, NULL),
(245, 14, '2017-05-12', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-12 00:01:00', '2017-05-12 00:07:22', 3, NULL),
(246, 15, '2017-05-12', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Preferencial', '2017-05-12 00:01:00', '2017-05-12 00:20:59', 3, NULL),
(247, 16, '2017-05-12', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Preferencial', '2017-05-12 00:01:00', '2017-05-12 00:26:43', 4, NULL),
(248, 17, '2017-05-12', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Preferencial', '2017-05-12 00:01:00', '2017-05-12 00:45:43', 4, NULL),
(249, 18, '2017-05-12', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-12 00:01:00', '2017-05-12 00:08:23', 5, NULL),
(250, 19, '2017-05-12', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-12 00:01:00', '2017-05-12 00:09:11', 5, NULL),
(251, 20, '2017-05-12', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-12 00:01:00', '2017-05-12 00:30:09', 5, NULL),
(252, 21, '2017-05-12', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-12 00:01:00', '2017-05-12 00:10:59', 5, NULL),
(253, 1, '2017-05-13', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-13 00:01:00', '2017-05-13 00:14:43', 4, NULL),
(254, 2, '2017-05-13', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-13 00:01:00', '2017-05-13 00:13:23', 1, NULL),
(255, 3, '2017-05-13', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-13 00:01:00', '2017-05-13 00:05:11', 1, NULL),
(256, 4, '2017-05-13', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-13 00:01:00', '2017-05-13 00:08:09', 1, NULL),
(257, 5, '2017-05-13', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Preferencial', '2017-05-13 00:01:00', '2017-05-13 00:18:59', 2, NULL),
(258, 6, '2017-05-13', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Preferencial', '2017-05-13 00:01:00', '2017-05-13 00:17:43', 2, NULL),
(259, 7, '2017-05-13', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-13 00:01:00', '2017-05-13 00:11:23', 2, NULL),
(260, 8, '2017-05-13', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-13 00:01:00', '2017-05-13 00:03:11', 2, NULL),
(261, 9, '2017-05-13', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-13 00:01:00', '2017-05-13 00:09:09', 2, NULL),
(262, 10, '2017-05-13', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-13 00:01:00', '2017-05-13 00:15:59', 2, NULL),
(263, 11, '2017-05-13', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-13 00:01:00', '2017-05-13 00:12:43', 2, NULL),
(264, 12, '2017-05-13', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-13 00:01:00', '2017-05-13 00:11:23', 3, NULL),
(265, 13, '2017-05-13', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-13 00:01:00', '2017-05-13 00:05:50', 3, NULL),
(266, 14, '2017-05-13', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-13 00:01:00', '2017-05-13 00:07:22', 3, NULL),
(267, 15, '2017-05-13', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Preferencial', '2017-05-13 00:01:00', '2017-05-13 00:20:59', 3, NULL),
(268, 16, '2017-05-13', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Preferencial', '2017-05-13 00:01:00', '2017-05-13 00:26:43', 4, NULL),
(269, 17, '2017-05-13', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Preferencial', '2017-05-13 00:01:00', '2017-05-13 00:45:43', 4, NULL),
(270, 18, '2017-05-13', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-13 00:01:00', '2017-05-13 00:08:23', 5, NULL),
(271, 19, '2017-05-13', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-13 00:01:00', '2017-05-13 00:09:11', 5, NULL),
(272, 20, '2017-05-13', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-13 00:01:00', '2017-05-13 00:30:09', 5, NULL),
(273, 21, '2017-05-13', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-13 00:01:00', '2017-05-13 00:10:59', 5, NULL),
(274, 1, '2017-05-14', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-14 00:01:00', '2017-05-14 00:14:43', 3, NULL),
(275, 2, '2017-05-14', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-14 00:01:00', '2017-05-14 00:13:23', 1, NULL),
(276, 3, '2017-05-14', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-14 00:01:00', '2017-05-14 00:05:11', 1, NULL),
(277, 4, '2017-05-14', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-14 00:01:00', '2017-05-14 00:08:09', 1, NULL),
(278, 5, '2017-05-14', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Preferencial', '2017-05-14 00:01:00', '2017-05-14 00:18:59', 2, NULL),
(279, 6, '2017-05-14', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Preferencial', '2017-05-14 00:01:00', '2017-05-14 00:17:43', 2, NULL),
(280, 7, '2017-05-14', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-14 00:01:00', '2017-05-14 00:11:23', 2, NULL),
(281, 8, '2017-05-14', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-14 00:01:00', '2017-05-14 00:03:11', 2, NULL),
(282, 9, '2017-05-14', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-14 00:01:00', '2017-05-14 00:09:09', 2, NULL),
(283, 10, '2017-05-14', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-14 00:01:00', '2017-05-14 00:15:59', 2, NULL),
(284, 11, '2017-05-14', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-14 00:01:00', '2017-05-14 00:12:43', 2, NULL),
(285, 12, '2017-05-14', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-14 00:01:00', '2017-05-14 00:11:23', 3, NULL),
(286, 13, '2017-05-14', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-14 00:01:00', '2017-05-14 00:05:50', 3, NULL),
(287, 14, '2017-05-14', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-14 00:01:00', '2017-05-14 00:07:22', 3, NULL),
(288, 15, '2017-05-14', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Preferencial', '2017-05-14 00:01:00', '2017-05-14 00:20:59', 3, NULL),
(289, 16, '2017-05-14', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Preferencial', '2017-05-14 00:01:00', '2017-05-14 00:26:43', 4, NULL),
(290, 17, '2017-05-14', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Preferencial', '2017-05-14 00:01:00', '2017-05-14 00:45:43', 4, NULL),
(291, 18, '2017-05-14', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-14 00:01:00', '2017-05-14 00:08:23', 5, NULL),
(292, 19, '2017-05-14', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-14 00:01:00', '2017-05-14 00:09:11', 5, NULL),
(293, 20, '2017-05-14', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-14 00:01:00', '2017-05-14 00:30:09', 5, NULL),
(294, 21, '2017-05-14', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-14 00:01:00', '2017-05-14 00:10:59', 5, NULL),
(295, 1, '2017-05-15', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-15 00:01:00', '2017-05-15 00:14:43', 1, NULL),
(296, 2, '2017-05-15', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-15 00:01:00', '2017-05-15 00:13:23', 1, NULL),
(297, 3, '2017-05-15', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-15 00:01:00', '2017-05-15 00:05:11', 1, NULL),
(298, 4, '2017-05-15', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-15 00:01:00', '2017-05-15 00:08:09', 1, NULL),
(299, 5, '2017-05-15', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Preferencial', '2017-05-15 00:01:00', '2017-05-15 00:18:59', 2, NULL),
(300, 6, '2017-05-15', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Preferencial', '2017-05-15 00:01:00', '2017-05-15 00:17:43', 2, NULL),
(301, 7, '2017-05-15', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-15 00:01:00', '2017-05-15 00:11:23', 2, NULL),
(302, 8, '2017-05-15', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-15 00:01:00', '2017-05-15 00:03:11', 2, NULL),
(303, 9, '2017-05-15', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-15 00:01:00', '2017-05-15 00:09:09', 2, NULL),
(304, 10, '2017-05-15', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-15 00:01:00', '2017-05-15 00:15:59', 2, NULL),
(305, 11, '2017-05-15', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-15 00:01:00', '2017-05-15 00:12:43', 2, NULL);
INSERT INTO `tab_senhas` (`id_sequencia`, `id_senha`, `data_senha`, `cpf_cliente`, `email_cliente`, `nm_cliente`, `senha_cliente`, `status_atendimento`, `tipo_atendimento`, `data_atendimento_ini`, `data_atendimento_fim`, `id_usuario`, `id_player`) VALUES
(306, 12, '2017-05-15', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-15 00:01:00', '2017-05-15 00:11:23', 3, NULL),
(307, 13, '2017-05-15', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-15 00:01:00', '2017-05-15 00:05:50', 3, NULL),
(308, 14, '2017-05-15', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-15 00:01:00', '2017-05-15 00:07:22', 3, NULL),
(309, 15, '2017-05-15', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Preferencial', '2017-05-15 00:01:00', '2017-05-15 00:20:59', 3, NULL),
(310, 16, '2017-05-15', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Preferencial', '2017-05-15 00:01:00', '2017-05-15 00:26:43', 1, NULL),
(311, 17, '2017-05-15', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Preferencial', '2017-05-15 00:01:00', '2017-05-15 00:45:43', 3, NULL),
(312, 18, '2017-05-15', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-15 00:01:00', '2017-05-15 00:08:23', 5, NULL),
(313, 19, '2017-05-15', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-15 00:01:00', '2017-05-15 00:09:11', 5, NULL),
(314, 20, '2017-05-15', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-15 00:01:00', '2017-05-15 00:30:09', 5, NULL),
(315, 21, '2017-05-15', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-15 00:01:00', '2017-05-15 00:10:59', 5, NULL),
(316, 1, '2017-05-16', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-16 00:01:00', '2017-05-16 00:14:43', 1, NULL),
(317, 2, '2017-05-16', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-16 00:01:00', '2017-05-16 00:13:23', 1, NULL),
(318, 3, '2017-05-16', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-16 00:01:00', '2017-05-16 00:05:11', 4, NULL),
(319, 4, '2017-05-16', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-16 00:01:00', '2017-05-16 00:08:09', 4, NULL),
(320, 5, '2017-05-16', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Preferencial', '2017-05-16 00:01:00', '2017-05-16 00:18:59', 2, NULL),
(321, 6, '2017-05-16', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Preferencial', '2017-05-16 00:01:00', '2017-05-16 00:17:43', 2, NULL),
(322, 7, '2017-05-16', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-16 00:01:00', '2017-05-16 00:11:23', 2, NULL),
(323, 8, '2017-05-16', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-16 00:01:00', '2017-05-16 00:03:11', 2, NULL),
(324, 9, '2017-05-16', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-16 00:01:00', '2017-05-16 00:09:09', 2, NULL),
(325, 10, '2017-05-16', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-16 00:01:00', '2017-05-16 00:15:59', 2, NULL),
(326, 11, '2017-05-16', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-16 00:01:00', '2017-05-16 00:12:43', 2, NULL),
(327, 12, '2017-05-16', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-16 00:01:00', '2017-05-16 00:11:23', 2, NULL),
(328, 13, '2017-05-16', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-16 00:01:00', '2017-05-16 00:05:50', 3, NULL),
(329, 14, '2017-05-16', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-16 00:01:00', '2017-05-16 00:07:22', 3, NULL),
(330, 15, '2017-05-16', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Preferencial', '2017-05-16 00:01:00', '2017-05-16 00:20:59', 3, NULL),
(331, 16, '2017-05-16', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Preferencial', '2017-05-16 00:01:00', '2017-05-16 00:26:43', 4, NULL),
(332, 17, '2017-05-16', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Preferencial', '2017-05-16 00:01:00', '2017-05-16 00:45:43', 4, NULL),
(333, 18, '2017-05-16', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-16 00:01:00', '2017-05-16 00:08:23', 5, NULL),
(334, 19, '2017-05-16', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-16 00:01:00', '2017-05-16 00:09:11', 5, NULL),
(335, 20, '2017-05-16', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-16 00:01:00', '2017-05-16 00:30:09', 5, NULL),
(336, 21, '2017-05-16', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-16 00:01:00', '2017-05-16 00:10:59', 5, NULL),
(337, 1, '2017-05-17', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-17 00:01:00', '2017-05-17 00:14:43', 1, NULL),
(338, 2, '2017-05-17', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-17 00:01:00', '2017-05-17 00:13:23', 1, NULL),
(339, 3, '2017-05-17', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-17 00:01:00', '2017-05-17 00:05:11', 1, NULL),
(340, 4, '2017-05-17', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-17 00:01:00', '2017-05-17 00:08:09', 1, NULL),
(341, 5, '2017-05-17', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Preferencial', '2017-05-17 00:01:00', '2017-05-17 00:18:59', 2, NULL),
(342, 6, '2017-05-17', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Preferencial', '2017-05-17 00:01:00', '2017-05-17 00:17:43', 2, NULL),
(343, 7, '2017-05-17', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-17 00:01:00', '2017-05-17 00:11:23', 2, NULL),
(344, 8, '2017-05-17', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-17 00:01:00', '2017-05-17 00:03:11', 2, NULL),
(345, 9, '2017-05-17', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-17 00:01:00', '2017-05-17 00:09:09', 2, NULL),
(346, 10, '2017-05-17', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-17 00:01:00', '2017-05-17 00:15:59', 2, NULL),
(347, 11, '2017-05-17', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-17 00:01:00', '2017-05-17 00:12:43', 2, NULL),
(348, 12, '2017-05-17', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-17 00:01:00', '2017-05-17 00:11:23', 2, NULL),
(349, 13, '2017-05-17', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-17 00:01:00', '2017-05-17 00:05:50', 2, NULL),
(350, 14, '2017-05-17', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-17 00:01:00', '2017-05-17 00:07:22', 3, NULL),
(351, 15, '2017-05-17', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Preferencial', '2017-05-17 00:01:00', '2017-05-17 00:20:59', 3, NULL),
(352, 16, '2017-05-17', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Preferencial', '2017-05-17 00:01:00', '2017-05-17 00:26:43', 4, NULL),
(353, 17, '2017-05-17', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Preferencial', '2017-05-17 00:01:00', '2017-05-17 00:45:43', 4, NULL),
(354, 18, '2017-05-17', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-17 00:01:00', '2017-05-17 00:08:23', 5, NULL),
(355, 19, '2017-05-17', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-17 00:01:00', '2017-05-17 00:09:11', 5, NULL),
(356, 20, '2017-05-17', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-17 00:01:00', '2017-05-17 00:30:09', 5, NULL),
(357, 21, '2017-05-17', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-17 00:01:00', '2017-05-17 00:10:59', 5, NULL),
(358, 1, '2017-05-18', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-18 00:01:00', '2017-05-18 00:14:43', 1, NULL),
(359, 2, '2017-05-18', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-18 00:01:00', '2017-05-18 00:13:23', 1, NULL),
(360, 3, '2017-05-18', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-18 00:01:00', '2017-05-18 00:05:11', 1, NULL),
(361, 4, '2017-05-18', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-18 00:01:00', '2017-05-18 00:08:09', 2, NULL),
(362, 5, '2017-05-18', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Preferencial', '2017-05-18 00:01:00', '2017-05-18 00:18:59', 2, NULL),
(363, 6, '2017-05-18', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Preferencial', '2017-05-18 00:01:00', '2017-05-18 00:17:43', 2, NULL),
(364, 7, '2017-05-18', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-18 00:01:00', '2017-05-18 00:11:23', 2, NULL),
(365, 8, '2017-05-18', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-18 00:01:00', '2017-05-18 00:03:11', 2, NULL),
(366, 9, '2017-05-18', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-18 00:01:00', '2017-05-18 00:09:09', 2, NULL),
(367, 10, '2017-05-18', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-18 00:01:00', '2017-05-18 00:15:59', 2, NULL),
(368, 11, '2017-05-18', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-18 00:01:00', '2017-05-18 00:12:43', 2, NULL),
(369, 12, '2017-05-18', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-18 00:01:00', '2017-05-18 00:11:23', 3, NULL),
(370, 13, '2017-05-18', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-18 00:01:00', '2017-05-18 00:05:50', 3, NULL),
(371, 14, '2017-05-18', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-18 00:01:00', '2017-05-18 00:07:22', 3, NULL),
(372, 15, '2017-05-18', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Preferencial', '2017-05-18 00:01:00', '2017-05-18 00:20:59', 3, NULL),
(373, 16, '2017-05-18', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Preferencial', '2017-05-18 00:01:00', '2017-05-18 00:26:43', 4, NULL),
(374, 17, '2017-05-18', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Preferencial', '2017-05-18 00:01:00', '2017-05-18 00:45:43', 4, NULL),
(375, 18, '2017-05-18', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-18 00:01:00', '2017-05-18 00:08:23', 5, NULL),
(376, 19, '2017-05-18', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-18 00:01:00', '2017-05-18 00:09:11', 5, NULL),
(377, 20, '2017-05-18', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-18 00:01:00', '2017-05-18 00:30:09', 5, NULL),
(378, 21, '2017-05-18', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-18 00:01:00', '2017-05-18 00:10:59', 5, NULL),
(379, 1, '2017-05-05', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-02 00:01:00', '2017-05-02 00:14:43', 1, NULL),
(380, 2, '2017-05-05', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-02 00:01:00', '2017-05-02 00:13:23', 2, NULL),
(381, 3, '2017-05-05', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-02 00:01:00', '2017-05-02 00:05:11', 1, NULL),
(382, 4, '2017-05-05', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Normal', '2017-05-02 00:01:00', '2017-05-02 00:08:09', 2, NULL),
(383, 5, '2017-05-05', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Atendido', 'Preferencial', '2017-05-02 00:01:00', '2017-05-02 00:45:43', 2, NULL),
(384, 6, '2017-05-05', '19611537778', NULL, 'Mauro', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Ativo', 'Preferencial', NULL, NULL, NULL, NULL),
(385, 7, '2017-05-05', '19611537778', NULL, 'Thiago', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Ativo', 'Normal', NULL, NULL, NULL, NULL),
(386, 8, '2017-05-05', '19611537778', NULL, 'Douglas', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Ativo', 'Normal', NULL, NULL, NULL, NULL),
(387, 9, '2017-05-05', '19611537778', NULL, 'Fernando', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Ativo', 'Normal', NULL, NULL, NULL, NULL),
(388, 10, '2017-05-05', '19611537778', NULL, 'Diego', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Ativo', 'Preferencial', NULL, NULL, NULL, NULL),
(389, 11, '2017-05-05', '19611537778', NULL, 'Marina', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Ativo', 'Normal', NULL, NULL, NULL, NULL),
(390, 12, '2017-05-05', '19611537778', NULL, 'Josiane', '6367c48dd193d56ea7b0baad25b19455e529f5ee', 'Ativo', 'Normal', NULL, NULL, NULL, NULL);

DELETE FROM tab_senhas WHERE data_senha = curdade();

INSERT INTO tab_senhas(id_senha, data_senha, cpf_cliente, nm_cliente, senha_cliente, status_atendimento, tipo_atendimento, data_atendimento_ini, data_atendimento_fim, id_usuario) VALUES 
(1, curdate(), 19611537778, 'Mauro', SHA1("abc123"), 'Atendido', 'Normal', '2017-05-02 00:01:00', '2017-05-02 00:14:43',1);
(2, curdate(), 19611537778, 'Mauro', SHA1("abc123"), 'Atendido', 'Normal', '2017-05-02 00:01:00', '2017-05-02 00:13:23',2);
(3, curdate(), 19611537778, 'Mauro', SHA1("abc123"), 'Atendido', 'Normal', '2017-05-02 00:01:00', '2017-05-02 00:05:11',1);
(4, curdate(), 19611537778, 'Mauro', SHA1("abc123"), 'Atendido', 'Normal', '2017-05-02 00:01:00', '2017-05-02 00:08:09',2);
(5, curdate(), 19611537778, 'Mauro', SHA1("abc123"), 'Atendido', 'Preferencial', '2017-05-02 00:01:00', '2017-05-02 00:45:43',2);
(6, curdate(), 19611537778, 'Mauro', SHA1("abc123"), 'Ativo', 'Preferencial');
(7, curdate(), 19611537778, 'Thiago', SHA1("abc123"), 'Ativo', 'Normal');
(8, curdate(), 19611537778, 'Douglas', SHA1("abc123"), 'Ativo', 'Normal');
(9, curdate(), 19611537778, 'Fernando', SHA1("abc123"), 'Ativo', 'Normal');
(10, curdate(), 19611537778, 'Diego', SHA1("abc123"), 'Ativo', 'Preferencial');
(11, curdate(), 19611537778, 'Marina', SHA1("abc123"), 'Ativo', 'Normal');
(12, curdate(), 19611537778, 'Josiane', SHA1("abc123"), 'Ativo', 'Normal');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tab_ultimo_tipo_atendimento`
--

CREATE TABLE IF NOT EXISTS `tab_ultimo_tipo_atendimento` (
  `tipo_atendimento` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tab_ultimo_tipo_atendimento`
--

INSERT INTO `tab_ultimo_tipo_atendimento` (`tipo_atendimento`) VALUES
('Preferencial');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tab_usuarios`
--

CREATE TABLE IF NOT EXISTS `tab_usuarios` (
  `id_usuario` int(4) NOT NULL AUTO_INCREMENT COMMENT 'Código do usuário ',
  `nm_usuario` varchar(50) NOT NULL COMMENT 'Nome do Usuário ',
  `email_usuario` varchar(50) NOT NULL COMMENT 'E-mail do Usuário ',
  `cpf_usuario` varchar(15) NOT NULL COMMENT 'CPF do Usuário ',
  `senha_usuario` varchar(50) DEFAULT NULL COMMENT 'Senha do Usuário ',
  `tipo_usuario` varchar(13) NOT NULL COMMENT 'Tipo: Administrador ou Atendente ',
  `status_usuario` varchar(10) NOT NULL COMMENT 'Status: Ativo ou Inativo ',
  `token_senha` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `UNIQUE` (`cpf_usuario`),
  UNIQUE KEY `nm_usuario` (`nm_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 COMMENT='tabela para controle de funcionarios (adm ou atendente)';

--
-- Extraindo dados da tabela `tab_usuarios`
--

INSERT INTO `tab_usuarios` (`id_usuario`, `nm_usuario`, `email_usuario`, `cpf_usuario`, `senha_usuario`, `tipo_usuario`, `status_usuario`, `token_senha`) VALUES
(1, 'BRUNA', 'bruna1marcolino@gmail.com', '40341728861', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'Atendente', 'Ativo', NULL),
(2, 'VINICIUS', 'email@email.com', '19663136081', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'Atendente', 'Ativo', NULL),
(3, 'THIAGO', 'email@email.com', '15233858550', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'Atendente', 'Ativo', NULL),
(4, 'FELIPE', 'email@email.com', '78896766117', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'Atendente', 'Ativo', NULL),
(5, 'JOHN', 'email@email.com', '32012251854', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'Atendente', 'Ativo', NULL),
(6, 'BRUNAADM', 'email@email.com', '36812489905', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'Administrador', 'Ativo', NULL),
(7, 'VINICIUSADM', 'email@email.com', '12381417737', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'Administrador', 'Ativo', NULL),
(8, 'THIAGOADM', 'email@email.com', '87636061198', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'Administrador', 'Ativo', NULL),
(9, 'FELIPEADM', 'email@email.com', '83166833340', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'Administrador', 'Ativo', NULL),
(10, 'JOHNADM', 'email@email.com', '15551499367', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'Administrador', 'Ativo', NULL);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
