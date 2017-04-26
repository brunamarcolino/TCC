-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 26-Abr-2017 às 17:00
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

-- --------------------------------------------------------

--
-- Estrutura da tabela `tab_fila`
--

CREATE TABLE `tab_fila` (
  `id_fila` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `status_fila` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(7, 402, 'Aberta');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tab_parametros`
--

CREATE TABLE `tab_parametros` (
  `id_parametro` int(2) NOT NULL COMMENT 'Código do parâmetro',
  `desc_parametro` varchar(50) NOT NULL COMMENT 'Descrição do parâmetro',
  `valor_parametro` varchar(150) NOT NULL COMMENT 'Valor do parâmetro',
  `parametro_habilitado` int(1) NOT NULL DEFAULT '1',
  `usuario_alteracao` int(4) NOT NULL COMMENT 'Usuário que realizou a última alteração',
  `data_alteracao` date NOT NULL COMMENT 'Data da última alteração'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Parametros do sistema (controlados pelo adm)';

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
(7, 'Distancia permitida (KM)', '20', 1, 0, '2017-04-02'),
(8, 'Localização do atendimento', 'Metrocamp', 1, 0, '2017-04-09');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tab_senhas`
--

CREATE TABLE `tab_senhas` (
  `id_sequencia` int(11) NOT NULL,
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
  `id_player` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabela de senhas (senha que manda pros clientes + cadastro)';

--
-- Extraindo dados da tabela `tab_senhas`
--

INSERT INTO `tab_senhas` (`id_sequencia`, `id_senha`, `data_senha`, `cpf_cliente`, `email_cliente`, `nm_cliente`, `senha_cliente`, `status_atendimento`, `tipo_atendimento`, `data_atendimento_ini`, `data_atendimento_fim`, `id_usuario`, `id_player`) VALUES
(257, 2, '2017-04-23', '2', NULL, 'Nome do Cliente 2', '2', 'Atendido', 'Normal', '2017-04-23 00:01:00', '2017-04-23 00:06:30', NULL, NULL),
(258, 3, '2017-04-23', '3', NULL, 'Nome do Cliente 3', '3', 'Atendido', 'Normal', '2017-04-23 00:01:00', '2017-04-23 00:06:30', NULL, NULL),
(259, 4, '2017-04-23', '4', NULL, 'Nome do Cliente 4', '4', 'Atendido', 'Normal', '2017-04-23 00:01:00', '2017-04-23 00:06:30', NULL, NULL),
(260, 5, '2017-04-23', '5', NULL, 'Nome do Cliente 5', '5', 'Atendido', 'Normal', '2017-04-23 00:01:00', '2017-04-23 00:06:30', NULL, NULL),
(261, 6, '2017-04-23', '6', NULL, 'Nome do Cliente 6', '6', 'Atendido', 'Normal', '2017-04-23 00:01:00', '2017-04-23 00:06:30', NULL, NULL),
(262, 7, '2017-04-23', '7', NULL, 'Nome do Cliente 7', '7', 'Atendido', 'Normal', '2017-04-23 00:01:00', '2017-04-23 00:06:30', NULL, NULL),
(263, 8, '2017-04-23', '8', NULL, 'Nome do Cliente 8', '8', 'Atendido', 'Normal', '2017-04-23 00:01:00', '2017-04-23 00:06:30', NULL, NULL),
(264, 9, '2017-04-23', '9', NULL, 'Nome do Cliente 9', '9', 'Atendido', 'Normal', '2017-04-23 00:01:00', '2017-04-23 00:06:30', NULL, NULL),
(265, 10, '2017-04-23', '10', NULL, 'Nome do Cliente 10', '10', 'Atendido', 'Normal', '2017-04-23 00:01:00', '2017-04-23 00:06:30', NULL, NULL),
(266, 11, '2017-04-23', '11', NULL, 'Nome do Cliente 11', '11', 'Atendido', 'Normal', '2017-04-23 00:01:00', '2017-04-23 00:06:30', NULL, NULL),
(267, 12, '2017-04-23', '12', NULL, 'Nome do Cliente 12', '12', 'Atendido', 'Normal', '2017-04-23 17:20:27', '2017-04-23 17:20:32', 402, NULL),
(268, 13, '2017-04-23', '13', NULL, 'Nome do Cliente 13', '13', 'Atendido', 'Normal', '2017-04-23 17:20:45', '2017-04-23 17:20:47', 402, NULL),
(269, 14, '2017-04-23', '14', NULL, 'Nome do Cliente 14', '14', 'Atendido', 'Normal', '2017-04-23 17:20:56', '2017-04-23 17:20:57', 402, NULL),
(270, 26, '2017-04-23', '15', NULL, 'Nome do Cliente 15', '15', 'Não Compareceu', 'Normal', NULL, NULL, 402, NULL),
(271, 16, '2017-04-23', '16', NULL, 'Nome do Cliente 16', '16', 'Atendido', 'Normal', '2017-04-23 17:21:07', '2017-04-23 17:21:08', 402, NULL),
(272, 17, '2017-04-23', '17', NULL, 'Nome do Cliente 17', '17', 'Atendido', 'Normal', '2017-04-23 17:21:13', '2017-04-23 17:21:14', 402, NULL),
(273, 27, '2017-04-23', '18', NULL, 'Nome do Cliente 18', '18', 'Não Compareceu', 'Normal', NULL, NULL, 402, NULL),
(274, 19, '2017-04-23', '19', NULL, 'Nome do Cliente 19', '19', 'Atendido', 'Preferencial', '2017-04-23 00:01:00', '2017-04-23 00:06:30', NULL, NULL),
(275, 20, '2017-04-23', '20', NULL, 'Nome do Cliente 20', '20', 'Atendido', 'Preferencial', '2017-04-23 00:01:00', '2017-04-23 00:06:30', NULL, NULL),
(276, 21, '2017-04-23', '21', NULL, 'Nome do Cliente 21', '21', 'Atendido', 'Preferencial', '2017-04-23 00:01:00', '2017-04-23 00:06:30', NULL, NULL),
(277, 22, '2017-04-23', '22', NULL, 'Nome do Cliente 22', '22', 'Atendido', 'Preferencial', '2017-04-23 17:09:40', '2017-04-23 17:09:48', 402, NULL),
(278, 25, '2017-04-23', '23', NULL, 'Nome do Cliente 23', '23', 'Atendido', 'Preferencial', '2017-04-23 17:37:38', '2017-04-23 17:37:40', 402, NULL),
(279, 24, '2017-04-23', '24', NULL, 'Nome do Cliente 24', '24', 'Ativo', 'Preferencial', '2017-04-23 17:20:51', '2017-04-23 17:20:54', 402, NULL),
(280, 28, '2017-04-23', '40341728861', NULL, 'bruna', '2jmj7l5rSw0yVb/vlWAYkK/YBwk=', 'Ativo', 'Normal', NULL, NULL, NULL, NULL),
(281, 1, '2017-04-24', '40341728861', NULL, 'BRUNA', '2jmj7l5rSw0yVb/vlWAYkK/YBwk=', 'Atendido', 'Normal', '2017-04-24 20:39:26', '2017-04-24 20:39:28', NULL, NULL),
(282, 1, '2017-04-25', '40341728861', NULL, 'bruna', '2jmj7l5rSw0yVb/vlWAYkK/YBwk=', 'x', 'Normal', NULL, NULL, 402, NULL),
(283, 2, '2017-04-25', '08576714809', NULL, 'joao', '2jmj7l5rSw0yVb/vlWAYkK/YBwk=', 'x', 'Normal', NULL, NULL, NULL, NULL),
(284, 3, '2017-04-25', '40586497200', NULL, 'teste', '2jmj7l5rSw0yVb/vlWAYkK/YBwk=', 'x', 'Normal', NULL, NULL, NULL, NULL),
(285, 4, '2017-04-25', '01427457905', NULL, '01427457905', '2jmj7l5rSw0yVb/vlWAYkK/YBwk=', 'x', 'Normal', NULL, NULL, NULL, NULL),
(286, 5, '2017-04-25', '85621823540', NULL, '85621823540', '2jmj7l5rSw0yVb/vlWAYkK/YBwk=', 'Chamando', 'Normal', '2017-04-25 22:06:31', '2017-04-25 22:06:33', 402, '3ad096a9-ffd5-4a5c-8b5d-20537fb22e29');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tab_ultimo_tipo_atendimento`
--

CREATE TABLE `tab_ultimo_tipo_atendimento` (
  `tipo_atendimento` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tab_ultimo_tipo_atendimento`
--

INSERT INTO `tab_ultimo_tipo_atendimento` (`tipo_atendimento`) VALUES
('Normal');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tab_usuarios`
--

CREATE TABLE `tab_usuarios` (
  `id_usuario` int(4) NOT NULL COMMENT 'Código do usuário ',
  `nm_usuario` varchar(50) NOT NULL COMMENT 'Nome do Usuário ',
  `email_usuario` varchar(50) NOT NULL COMMENT 'E-mail do Usuário ',
  `cpf_usuario` varchar(15) NOT NULL COMMENT 'CPF do Usuário ',
  `senha_usuario` varchar(50) DEFAULT NULL COMMENT 'Senha do Usuário ',
  `tipo_usuario` varchar(13) NOT NULL COMMENT 'Tipo: Administrador ou Atendente ',
  `status_usuario` varchar(10) NOT NULL COMMENT 'Status: Ativo ou Inativo ',
  `token_senha` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='tabela para controle de funcionarios (adm ou atendente)';

--
-- Extraindo dados da tabela `tab_usuarios`
--

INSERT INTO `tab_usuarios` (`id_usuario`, `nm_usuario`, `email_usuario`, `cpf_usuario`, `senha_usuario`, `tipo_usuario`, `status_usuario`, `token_senha`) VALUES
(402, 'user', 'bruna_marcolino@hotmail.com', '40341728861', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'Atendente', 'Ativo', '8a8cf8fd56dab80bb8eb3dd0529ee665'),
(551, 'admin', 'admin', '12345', 'admin', 'Administrador', 'Inativo', NULL),
(602, 'cli', 'ate', '12345678', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'Cliente', 'Ativo', NULL),
(604, 'adm', '', '134567965', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'Administrador', 'Ativo', NULL),
(605, 'Bruna', 'bruna', '123', '356a192b7913b04c54574d18c28d46e6395428ab', 'Administrador', 'Inativo', NULL),
(609, 'BRUNA1', 'BRUNA', '403.417.288-61', '356a192b7913b04c54574d18c28d46e6395428ab', 'Atendente', 'Inativo', NULL),
(610, 'AIRTON', 'AIRTON@AIRTON', '08576', '356a192b7913b04c54574d18c28d46e6395428ab', 'Atendente', 'Inativo', NULL),
(611, 'user2', 'bruna@bruna.com', '08576714809', '356a192b7913b04c54574d18c28d46e6395428ab', 'Atendente', 'Inativo', NULL),
(612, 'user3', 'bruna@bruna.com', '93516061472', '356a192b7913b04c54574d18c28d46e6395428ab', 'Atendente', 'Ativo', NULL),
(613, 'Vinicius', 'bruna@bruna.com', '42149443805', '356a192b7913b04c54574d18c28d46e6395428ab', 'Atendente', 'Ativo', NULL),
(614, '63405271754', 'bruna1marcolino@gmail.com', '63405271754', 'Novasenha1', 'Atendente', 'Inativo', '21ce87310c6d972285657cd5016116c5'),
(615, '17582188276', 'bruna1marcolino@gmail.com', '17582188276', 'e9ea4460acba997166ae132591998ef9ab181d09', 'Atendente', 'Inativo', NULL),
(616, '72154729738', '72154729738@a.com', '72154729738', 'ec4c8836db96b8aca8381c7c64bb095ba46d5e28', 'Administrador', 'Ativo', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tab_fila`
--
ALTER TABLE `tab_fila`
  ADD PRIMARY KEY (`id_fila`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_usuario_2` (`id_usuario`);

--
-- Indexes for table `tab_parametros`
--
ALTER TABLE `tab_parametros`
  ADD PRIMARY KEY (`id_parametro`),
  ADD KEY `usuario_alteracao` (`usuario_alteracao`);

--
-- Indexes for table `tab_senhas`
--
ALTER TABLE `tab_senhas`
  ADD PRIMARY KEY (`id_sequencia`),
  ADD UNIQUE KEY `id_senha` (`id_senha`,`data_senha`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indexes for table `tab_usuarios`
--
ALTER TABLE `tab_usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `UNIQUE` (`cpf_usuario`),
  ADD UNIQUE KEY `nm_usuario` (`nm_usuario`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tab_fila`
--
ALTER TABLE `tab_fila`
  MODIFY `id_fila` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `tab_parametros`
--
ALTER TABLE `tab_parametros`
  MODIFY `id_parametro` int(2) NOT NULL AUTO_INCREMENT COMMENT 'Código do parâmetro', AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `tab_senhas`
--
ALTER TABLE `tab_senhas`
  MODIFY `id_sequencia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=287;
--
-- AUTO_INCREMENT for table `tab_usuarios`
--
ALTER TABLE `tab_usuarios`
  MODIFY `id_usuario` int(4) NOT NULL AUTO_INCREMENT COMMENT 'Código do usuário ', AUTO_INCREMENT=617;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
