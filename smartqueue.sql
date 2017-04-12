-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 12-Abr-2017 às 15:07
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
(4, NULL, 4, 'FECHADA');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tab_parametros`
--

CREATE TABLE `tab_parametros` (
  `id_parametro` int(2) NOT NULL COMMENT 'Código do parâmetro',
  `desc_parametro` varchar(50) NOT NULL COMMENT 'Descrição do parâmetro',
  `valor_parametro` varchar(50) NOT NULL COMMENT 'Valor do parâmetro',
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
(7, 'Distancia permitida (KM)', '4', 1, 0, '2017-04-02'),
(8, 'Localização do atendimento', '-22.8629682,-47.1498136', 1, 0, '2017-04-09');

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
(145, 1, '2017-04-07', '2147483647', 'Felipe Possato', '123456789', 'Ativo', 'Normal', '2017-03-31 19:48:52', '2017-03-31 19:51:52', 2),
(146, 2, '2017-04-07', '2147483647', 'Bruna Marcolino', '1', 'Ativo', 'Normal', '2017-03-31 19:49:42', '2017-03-31 19:52:42', 2),
(147, 3, '2017-04-07', '123456', 'cliente1', '1', 'Ativo', 'Normal', NULL, NULL, NULL),
(148, 4, '2017-04-07', '123457', 'cliente2', '1', 'Ativo', 'Normal', NULL, NULL, NULL),
(149, 5, '2017-04-07', '123458', 'cliente3', '1', 'Ativo', 'Normal', NULL, NULL, NULL),
(150, 6, '2017-04-07', '123459', 'cliente4', '1', 'Ativo', 'Normal', NULL, NULL, NULL),
(151, 7, '2017-04-07', '5', 'cliente5', '5', 'Ativo', 'Normal', NULL, NULL, NULL),
(152, 8, '2017-04-07', '6', 'b', '6', 'Cancelado', 'Normal', NULL, NULL, NULL),
(153, 9, '2017-04-07', '6', '', '6', 'Ativo', 'Normal', NULL, NULL, NULL),
(154, 10, '2017-04-07', '123', '123', '1', 'Cancelado', 'Normal', NULL, NULL, NULL),
(155, 11, '2017-04-07', '8', '', '8', 'Ativo', 'Normal', NULL, NULL, NULL),
(156, 12, '2017-04-07', '10', 'bruna', '1', 'Ativo', 'Normal', NULL, NULL, NULL),
(158, 13, '2017-04-07', '123', 'bruna', 'admin', 'Ativo', 'Normal', NULL, NULL, NULL),
(159, 14, '2017-04-07', '1234', 'Bruna', '123', 'Ativo', 'Normal', NULL, NULL, NULL),
(160, 15, '2017-04-07', '40341728861', 'Bruna', '123', 'Ativo', 'Normal', NULL, NULL, NULL),
(161, 1, '2017-04-08', '40341728861', 'bruna', '123', 'Ativo', 'Normal', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tab_usuarios`
--

CREATE TABLE `tab_usuarios` (
  `id_usuario` int(4) NOT NULL COMMENT 'Código do usuário ',
  `nm_usuario` varchar(50) NOT NULL COMMENT 'Nome do Usuário ',
  `email_usuario` varchar(50) NOT NULL COMMENT 'E-mail do Usuário ',
  `cpf_usuario` varchar(15) NOT NULL COMMENT 'CPF do Usuário ',
  `senha_usuario` varchar(50) NOT NULL COMMENT 'Senha do Usuário ',
  `tipo_usuario` varchar(13) NOT NULL COMMENT 'Tipo: Administrador ou Atendente ',
  `status_usuario` varchar(10) NOT NULL COMMENT 'Status: Ativo ou Inativo '
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='tabela para controle de funcionarios (adm ou atendente)';

--
-- Extraindo dados da tabela `tab_usuarios`
--

INSERT INTO `tab_usuarios` (`id_usuario`, `nm_usuario`, `email_usuario`, `cpf_usuario`, `senha_usuario`, `tipo_usuario`, `status_usuario`) VALUES
(402, 'user', 'bruna_marcolino@hotmail.com', '40341728861', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'Atendente', 'Ativo'),
(551, 'admin', 'admin', '12345', 'admin', 'Administrador', 'Inativo'),
(602, 'cli', 'ate', '12345678', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'Cliente', 'Ativo'),
(604, 'adm', '', '134567965', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'Administrador', 'Ativo'),
(605, 'Bruna', 'bruna', '123', '356a192b7913b04c54574d18c28d46e6395428ab', 'Administrador', 'Inativo'),
(609, 'BRUNA1', 'BRUNA', '403.417.288-61', '356a192b7913b04c54574d18c28d46e6395428ab', 'Atendente', 'Inativo'),
(610, 'AIRTON', 'AIRTON@AIRTON', '08576', '356a192b7913b04c54574d18c28d46e6395428ab', 'Atendente', 'Inativo'),
(611, 'user2', 'bruna@bruna.com', '08576714809', '356a192b7913b04c54574d18c28d46e6395428ab', 'Atendente', 'Ativo'),
(612, 'user3', 'bruna@bruna.com', '93516061472', '356a192b7913b04c54574d18c28d46e6395428ab', 'Atendente', 'Ativo'),
(613, 'Vinicius', 'bruna@bruna.com', '42149443805', '356a192b7913b04c54574d18c28d46e6395428ab', 'Atendente', 'Ativo');

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
  MODIFY `id_fila` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tab_parametros`
--
ALTER TABLE `tab_parametros`
  MODIFY `id_parametro` int(2) NOT NULL AUTO_INCREMENT COMMENT 'Código do parâmetro', AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `tab_senhas`
--
ALTER TABLE `tab_senhas`
  MODIFY `id_sequencia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=162;
--
-- AUTO_INCREMENT for table `tab_usuarios`
--
ALTER TABLE `tab_usuarios`
  MODIFY `id_usuario` int(4) NOT NULL AUTO_INCREMENT COMMENT 'Código do usuário ', AUTO_INCREMENT=614;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `tab_senhas`
--
ALTER TABLE `tab_senhas`
  ADD CONSTRAINT `tab_senhas_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `gerenciador`.`tab_usuarios` (`id_usuario`) ON DELETE NO ACTION ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
