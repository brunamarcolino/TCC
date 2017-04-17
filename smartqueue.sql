-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 17-Abr-2017 às 02:03
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
  `mesa_usuario` int(11) DEFAULT NULL,
  `status_fila` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tab_fila`
--

INSERT INTO `tab_fila` (`id_fila`, `id_usuario`, `mesa_usuario`, `status_fila`) VALUES
(1, 0, 1, 'FECHADA'),
(2, NULL, 2, 'ABERTA'),
(3, NULL, 3, 'FECHADA'),
(4, NULL, 4, 'FECHADA'),
(5, 402, 10, 'Aberta'),
(6, 402, 20, 'Aberta');

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
(7, 'Distancia permitida (KM)', '15', 1, 0, '2017-04-02'),
(8, 'Localização do atendimento', 'Metrocamp', 1, 0, '2017-04-09');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tab_senhas`
--

CREATE TABLE `tab_senhas` (
  `id_sequencia` int(11) NOT NULL,
  `id_senha` int(4) NOT NULL COMMENT 'Senha ',
  `data_senha` date NOT NULL COMMENT 'Data de geração ',
  `cpf_cliente` varchar(15) NOT NULL COMMENT 'CPF do cliente ',
  `nm_cliente` varchar(50) NOT NULL COMMENT 'Nome do Cliente ',
  `senha_cliente` varchar(60) NOT NULL COMMENT 'Senha do Cliente ',
  `status_atendimento` varchar(15) NOT NULL COMMENT 'Status: Ativo | Em atendimento | Cancelado | Atendido | Chamando | Não compareceu | Segunda Chance ',
  `tipo_atendimento` varchar(12) DEFAULT 'Normal' COMMENT 'Normal / Preferencial',
  `data_atendimento_ini` datetime DEFAULT NULL COMMENT 'Data do início do atendimento ',
  `data_atendimento_fim` datetime DEFAULT NULL COMMENT 'Data do final do atendimento ',
  `id_usuario` int(4) DEFAULT NULL COMMENT 'Código do atendente '
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabela de senhas (senha que manda pros clientes + cadastro)';

--
-- Extraindo dados da tabela `tab_senhas`
--

INSERT INTO `tab_senhas` (`id_sequencia`, `id_senha`, `data_senha`, `cpf_cliente`, `nm_cliente`, `senha_cliente`, `status_atendimento`, `tipo_atendimento`, `data_atendimento_ini`, `data_atendimento_fim`, `id_usuario`) VALUES
(164, 1, '2017-04-14', '40341728861', 'BRUNA', '1', 'Ativo', 'Normal', NULL, NULL, NULL),
(167, 2, '2017-04-14', '2', '2', '2', 'Encerrado', 'Normal', '2017-04-14 20:52:53', '2017-04-14 20:56:59', NULL),
(168, 3, '2017-04-14', '3', '3', '3', 'Encerrado', 'Normal', '2017-04-14 20:52:53', '2017-04-14 20:56:59', NULL),
(169, 4, '2017-04-14', '4', '4', '4', 'Encerrado', 'Normal', '2017-04-14 20:52:53', '2017-04-14 20:56:59', NULL),
(170, 5, '2017-04-14', '5', '5', '5', 'Encerrado', 'Normal', '2017-04-14 20:52:53', '2017-04-14 20:56:59', NULL),
(171, 6, '2017-04-14', '6', '6', '6', 'Encerrado', 'Normal', '2017-04-14 20:52:53', '2017-04-14 20:56:59', NULL),
(172, 7, '2017-04-14', '7', '7', '7', 'Encerrado', 'Normal', '2017-04-14 20:52:53', '2017-04-14 20:56:59', NULL),
(173, 8, '2017-04-14', '8', '8', '8', 'Encerrado', 'Normal', '2017-04-14 20:52:53', '2017-04-14 20:56:59', NULL),
(174, 9, '2017-04-14', '9', '9', '9', 'Encerrado', 'Normal', '2017-04-14 20:52:53', '2017-04-14 20:56:59', NULL),
(175, 10, '2017-04-14', '10', '10', '10', 'Encerrado', 'Normal', '2017-04-14 20:52:53', '2017-04-14 20:56:59', NULL),
(176, 11, '2017-04-14', '11', '11', '11', 'Encerrado', 'Normal', '2017-04-14 20:52:53', '2017-04-14 20:56:59', NULL),
(177, 12, '2017-04-14', '12', '12', '12', 'Ativo', 'Normal', NULL, NULL, NULL),
(178, 13, '2017-04-14', '13', '13', '13', 'Ativo', 'Normal', NULL, NULL, NULL),
(179, 14, '2017-04-14', '14', '14', '14', 'Ativo', 'Normal', NULL, NULL, NULL),
(180, 15, '2017-04-14', '15', '15', '15', 'Ativo', 'Normal', NULL, NULL, NULL),
(181, 16, '2017-04-14', '16', '16', '16', 'Ativo', 'Normal', NULL, NULL, NULL),
(182, 17, '2017-04-14', '17', '17', '17', 'Ativo', 'Normal', NULL, NULL, NULL),
(183, 18, '2017-04-14', '18', '18', '18', 'Ativo', 'Normal', NULL, NULL, NULL),
(184, 19, '2017-04-14', '19', '19', '19', 'Encerrado', 'Preferencial', '2017-04-14 20:52:53', '2017-04-14 20:56:59', NULL),
(185, 20, '2017-04-14', '20', '20', '20', 'Encerrado', 'Preferencial', '2017-04-14 20:52:53', '2017-04-14 20:56:59', NULL),
(186, 21, '2017-04-14', '21', '21', '21', 'Encerrado', 'Preferencial', '2017-04-14 20:52:53', '2017-04-14 20:56:59', NULL),
(187, 22, '2017-04-14', '22', '22', '22', 'Ativo', 'Preferencial', NULL, NULL, NULL),
(188, 23, '2017-04-14', '23', '23', '23', 'Ativo', 'Preferencial', NULL, NULL, NULL),
(189, 24, '2017-04-14', '24', '24', '24', 'Ativo', 'Preferencial', NULL, NULL, NULL),
(190, 25, '2017-04-14', '35009321858', 'Bruna', '1', 'Ativo', 'Normal', NULL, NULL, NULL),
(191, 26, '2017-04-14', '08576714809', 'Bruna', '1', 'Ativo', 'Normal', NULL, NULL, NULL),
(192, 27, '2017-04-14', '97731861805', 'bruna', '1', 'Ativo', 'Normal', NULL, NULL, NULL),
(193, 28, '2017-04-14', '11151761451', 'teste1', '1', 'Ativo', 'Normal', NULL, NULL, NULL),
(194, 29, '2017-04-14', '57522499372', 'jkfbfak', '1', 'Ativo', 'Normal', NULL, NULL, NULL),
(195, 30, '2017-04-14', '29406944782', 'bruna', '1', 'Ativo', 'Preferencial', NULL, NULL, NULL),
(196, 31, '2017-04-14', '27393287706', 'bruna', '2jmj7l5rSw0yVb/vlWAYkK/YBwk=', 'Ativo', 'Normal', NULL, NULL, NULL),
(197, 1, '2017-04-16', '40341728861', 'bru', '2jmj7l5rSw0yVb/vlWAYkK/YBwk=', 'Cancelado', 'Normal', NULL, NULL, NULL),
(198, 2, '2017-04-16', '35009321858', 's', '2jmj7l5rSw0yVb/vlWAYkK/YBwk=', 'Ativo', 'Normal', NULL, NULL, NULL),
(199, 3, '2017-04-16', '08576714809', 'VINICIUS', '2jmj7l5rSw0yVb/vlWAYkK/YBwk=', 'Ativo', 'Normal', NULL, NULL, NULL),
(200, 4, '2017-04-16', '123', 'A', '2jmj7l5rSw0yVb/vlWAYkK/YBwk=', 'Ativo', 'Normal', NULL, NULL, NULL);

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
(614, '63405271754', 'bruna1marcolino@gmail.com', '63405271754', 'Novasenha1', 'Atendente', 'Inativo', NULL),
(615, '17582188276', 'bruna1marcolino@gmail.com', '17582188276', '592a63eb9662eeccece211458fb45019ebba0b4e', 'Atendente', 'Inativo', 'f6c3d2bf97c9108f2fc352cb7794ffa'),
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
  MODIFY `id_fila` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `tab_parametros`
--
ALTER TABLE `tab_parametros`
  MODIFY `id_parametro` int(2) NOT NULL AUTO_INCREMENT COMMENT 'Código do parâmetro', AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `tab_senhas`
--
ALTER TABLE `tab_senhas`
  MODIFY `id_sequencia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=201;
--
-- AUTO_INCREMENT for table `tab_usuarios`
--
ALTER TABLE `tab_usuarios`
  MODIFY `id_usuario` int(4) NOT NULL AUTO_INCREMENT COMMENT 'Código do usuário ', AUTO_INCREMENT=617;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `tab_senhas`
--

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
