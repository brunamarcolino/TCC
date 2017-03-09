-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 09-Mar-2017 às 02:52
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
-- Estrutura da tabela `sequence`
--

CREATE TABLE `sequence` (
  `SEQ_NAME` varchar(50) NOT NULL,
  `SEQ_COUNT` decimal(38,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `sequence`
--

INSERT INTO `sequence` (`SEQ_NAME`, `SEQ_COUNT`) VALUES
('SEQ_GEN', '650');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tab_parametros`
--

CREATE TABLE `tab_parametros` (
  `id_parametro` int(2) NOT NULL COMMENT 'Código do parâmetro',
  `desc_parametro` varchar(50) NOT NULL COMMENT 'Descrição do parâmetro',
  `valor_parametro` varchar(50) NOT NULL COMMENT 'Valor do parâmetro',
  `usuario_alteracao` int(4) NOT NULL COMMENT 'Usuário que realizou a última alteração',
  `data_alteracao` date NOT NULL COMMENT 'Data da última alteração'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Parametros do sistema (controlados pelo adm)';

--
-- Extraindo dados da tabela `tab_parametros`
--

INSERT INTO `tab_parametros` (`id_parametro`, `desc_parametro`, `valor_parametro`, `usuario_alteracao`, `data_alteracao`) VALUES
(1, 'Horario inicio atendimento', '08:00', 0, '0000-00-00'),
(2, 'Horario abertura da fila', '07:00', 0, '0000-00-00'),
(3, 'Horario de encerramento da fila', '19:00', 0, '0000-00-00'),
(4, 'Aceita segunda chance ?', 'Sim', 0, '0000-00-00'),
(5, 'Numero de Mesas', '5', 0, '0000-00-00'),
(6, 'Distancia permitida', '2 km', 0, '0000-00-00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tab_senhas`
--

CREATE TABLE `tab_senhas` (
  `id_sequencia` int(11) NOT NULL,
  `id_senha` int(4) NOT NULL COMMENT 'Senha ',
  `data_senha` date NOT NULL COMMENT 'Data de geração ',
  `cpf_cliente` int(11) NOT NULL COMMENT 'CPF do cliente ',
  `nm_cliente` varchar(50) NOT NULL COMMENT 'Nome do Cliente ',
  `senha_cliente` varchar(6) NOT NULL COMMENT 'Senha do Cliente ',
  `status_atendimento` varchar(15) NOT NULL COMMENT 'Status: Ativo | Em atendimento | Cancelado | Atendido | Chamando | Não compareceu | Segunda Chance ',
  `data_atendimento_ini` datetime DEFAULT NULL COMMENT 'Data do início do atendimento ',
  `data_atendimento_fim` datetime DEFAULT NULL COMMENT 'Data do final do atendimento ',
  `id_usuario` int(4) DEFAULT NULL COMMENT 'Código do atendente '
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabela de senhas (senha que manda pros clientes + cadastro)';

--
-- Extraindo dados da tabela `tab_senhas`
--

INSERT INTO `tab_senhas` (`id_sequencia`, `id_senha`, `data_senha`, `cpf_cliente`, `nm_cliente`, `senha_cliente`, `status_atendimento`, `data_atendimento_ini`, `data_atendimento_fim`, `id_usuario`) VALUES
(1, 1, '2017-03-07', 122, 'nome', 'senha', 'Ativo', NULL, NULL, NULL),
(2, 2, '2017-03-07', 122, 'nome', 'senha', 'Ativo', NULL, NULL, NULL),
(3, 1, '2017-03-08', 122, 'nome', 'senha', 'Ativo', NULL, NULL, NULL),
(5, 2, '2017-03-08', 122, 'nome', 'senha', 'Ativo', NULL, NULL, NULL),
(6, 3, '2017-03-08', 122, 'nome', 'senha', 'Ativo', NULL, NULL, NULL),
(7, 4, '2017-03-08', 122, 'nome', 'senha', 'Ativo', NULL, NULL, NULL),
(8, 5, '2017-03-08', 122, 'nome', 'senha', 'Ativo', NULL, NULL, NULL),
(9, 6, '2017-03-08', 122, 'nome', 'senha', 'Ativo', NULL, NULL, NULL),
(10, 7, '2017-03-08', 122, 'nome', 'senha', 'Ativo', NULL, NULL, NULL),
(11, 8, '2017-03-08', 122, 'nome', 'senha', 'Ativo', NULL, NULL, NULL),
(12, 9, '2017-03-08', 122, 'nome', 'senha', 'Ativo', NULL, NULL, NULL),
(13, 10, '2017-03-08', 122, 'nome', 'senha', 'Ativo', NULL, NULL, NULL),
(14, 11, '2017-03-08', 122, 'nome', 'senha', 'Ativo', NULL, NULL, NULL),
(15, 12, '2017-03-08', 122, 'nome', 'senha', 'Ativo', NULL, NULL, NULL),
(16, 13, '2017-03-08', 122, 'nome', 'senha', 'Ativo', NULL, NULL, NULL),
(17, 14, '2017-03-08', 122, 'nome', 'senha', 'Ativo', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tab_usuarios`
--

CREATE TABLE `tab_usuarios` (
  `id_usuario` int(4) NOT NULL COMMENT 'Código do usuário ',
  `nm_usuario` varchar(50) NOT NULL COMMENT 'Nome do Usuário ',
  `email_usuario` varchar(50) NOT NULL COMMENT 'E-mail do Usuário ',
  `cpf_usuario` int(11) NOT NULL COMMENT 'CPF do Usuário ',
  `senha_usuario` varchar(50) NOT NULL COMMENT 'Senha do Usuário ',
  `tipo_usuario` varchar(13) NOT NULL COMMENT 'Tipo: Administrador ou Atendente ',
  `status_usuario` varchar(10) NOT NULL COMMENT 'Status: Ativo ou Inativo '
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='tabela para controle de funcionarios (adm ou atendente)';

--
-- Extraindo dados da tabela `tab_usuarios`
--

INSERT INTO `tab_usuarios` (`id_usuario`, `nm_usuario`, `email_usuario`, `cpf_usuario`, `senha_usuario`, `tipo_usuario`, `status_usuario`) VALUES
(402, 'user', '123', 123, 'd033e22ae348aeb5660fc2140aec35850c4da997', 'Atendente', 'Ativo'),
(551, 'admin', 'admin', 0, 'admin', 'Administrador', 'Ativo'),
(602, 'cli', 'ate', 12345678, 'd033e22ae348aeb5660fc2140aec35850c4da997', 'Cliente', 'Ativo'),
(604, 'adm', '', 134567965, 'd033e22ae348aeb5660fc2140aec35850c4da997', 'Administrador', 'Ativo');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `sequence`
--
ALTER TABLE `sequence`
  ADD PRIMARY KEY (`SEQ_NAME`);

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
  ADD UNIQUE KEY `UNIQUE` (`cpf_usuario`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tab_parametros`
--
ALTER TABLE `tab_parametros`
  MODIFY `id_parametro` int(2) NOT NULL AUTO_INCREMENT COMMENT 'Código do parâmetro', AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `tab_senhas`
--
ALTER TABLE `tab_senhas`
  MODIFY `id_sequencia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `tab_usuarios`
--
ALTER TABLE `tab_usuarios`
  MODIFY `id_usuario` int(4) NOT NULL AUTO_INCREMENT COMMENT 'Código do usuário ', AUTO_INCREMENT=605;
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
