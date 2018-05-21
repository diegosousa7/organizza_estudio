-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 20-Maio-2018 às 08:40
-- Vers~ao do servidor: 10.1.32-MariaDB
-- PHP Version: 7.2.5

SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES cp1256 */;

--
-- Database: `organizzaestudio`
--
CREATE DATABASE IF NOT EXISTS `organizzaestudio` DEFAULT CHARACTER SET latin1 COLLATE latin1_general_ci;
USE organizzaestudio;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--
-- Criaç~ao: 20-Maio-2018 às 02:40
--

CREATE TABLE `cliente` (
  `CdCliente` int(10) UNSIGNED NOT NULL,
  `CpfCnpj` varchar(18) NOT NULL,
  `Nome` varchar(255) NOT NULL,
  `RazaoSocial` varchar(255) DEFAULT NULL,
  `InscricaoEstadual` varchar(18) DEFAULT NULL,
  `CEP` varchar(8) DEFAULT NULL,
  `Endereco` varchar(150) NOT NULL,
  `EnderecoNumero` varchar(20) DEFAULT NULL,
  `Uf` char(2) DEFAULT NULL,
  `Cidade` varchar(50) DEFAULT NULL,
  `Bairro` varchar(50) DEFAULT NULL,
  `Telefone` varchar(14) DEFAULT NULL,
  `Celular` varchar(14) DEFAULT NULL,
  `Email` varchar(100) NOT NULL,
  `DataNascimento` date DEFAULT NULL
) ;

--
-- RELATIONSHIPS FOR TABLE `cliente`:
--

--
-- Truncate table before insert `cliente`
--

TRUNCATE TABLE `cliente`;
-- --------------------------------------------------------

--
-- Estrutura da tabela `contrato`
--
-- Criaç~ao: 20-Maio-2018 às 02:40
--

CREATE TABLE `contrato` (
  `CdContrato` int(10) UNSIGNED NOT NULL,
  `CdCliente` int(10) UNSIGNED NOT NULL,
  `DescricaoEvento` varchar(200) NOT NULL,
  `DataCadastro` datetime NOT NULL,
  `DataEvento` datetime NOT NULL,
  `DataAceite` datetime DEFAULT NULL,
  `Documento` blob,
  `ValorContrato` decimal(19,4) DEFAULT NULL
) ;

--
-- RELATIONSHIPS FOR TABLE `contrato`:
--   `CdCliente`
--       `cliente` -> `CdCliente`
--

--
-- Truncate table before insert `contrato`
--

TRUNCATE TABLE `contrato`;
-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionario`
--
-- Criaç~ao: 20-Maio-2018 às 02:40
--

CREATE TABLE `funcionario` (
  `CdFuncionario` int(10) UNSIGNED NOT NULL,
  `Cpf` varchar(18) NOT NULL,
  `Nome` varchar(255) NOT NULL,
  `Cep` varchar(8) DEFAULT NULL,
  `Endereco` varchar(150) DEFAULT NULL,
  `EnderecoNumero` varchar(20) DEFAULT NULL,
  `Uf` char(2) DEFAULT NULL,
  `Cidade` varchar(50) DEFAULT NULL,
  `Bairro` varchar(50) DEFAULT NULL,
  `Telefone` varchar(14) DEFAULT NULL,
  `Celular` varchar(14) DEFAULT NULL,
  `Email` varchar(100) NOT NULL,
  `DataNascimento` date DEFAULT NULL
) ;

--
-- RELATIONSHIPS FOR TABLE `funcionario`:
--

--
-- Truncate table before insert `funcionario`
--

TRUNCATE TABLE `funcionario`;
-- --------------------------------------------------------

--
-- Estrutura da tabela `servico`
--
-- Criaç~ao: 20-Maio-2018 às 02:40
--

CREATE TABLE `servico` (
  `CdServico` int(10) UNSIGNED NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `Valor` decimal(19,4) NOT NULL,
  `Descricao` varchar(255) NOT NULL
) ;

--
-- RELATIONSHIPS FOR TABLE `servico`:
--

--
-- Truncate table before insert `servico`
--

TRUNCATE TABLE `servico`;
-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_usuario`
--
-- Criaç~ao: 20-Maio-2018 às 02:40
--

CREATE TABLE `tipo_usuario` (
  `CdTipoUsuario` int(10) UNSIGNED NOT NULL,
  `Descricao` varchar(20) NOT NULL
) ;

--
-- RELATIONSHIPS FOR TABLE `tipo_usuario`:
--

--
-- Truncate table before insert `tipo_usuario`
--

TRUNCATE TABLE `tipo_usuario`;
--
-- Extraindo dados da tabela `tipo_usuario`
--

INSERT INTO `tipo_usuario` (`CdTipoUsuario`, `Descricao`) VALUES
(1, 'Administrador'),
(2, 'Funcionario'),
(3, 'Cliente');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--
-- Criaç~ao: 20-Maio-2018 às 03:07
--

CREATE TABLE `usuario` (
  `CdUsuario` int(10) UNSIGNED NOT NULL,
  `CdTipoUsuario` int(10) UNSIGNED NOT NULL,
  `NomeUsuario` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Senha` varchar(128) DEFAULT NULL
) ;

--
-- RELATIONSHIPS FOR TABLE `usuario`:
--   `CdTipoUsuario`
--       `tipo_usuario` -> `CdTipoUsuario`
--

--
-- Truncate table before insert `usuario`
--

TRUNCATE TABLE `usuario`;
--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`CdUsuario`, `CdTipoUsuario`, `NomeUsuario`, `Email`, `Senha`) VALUES
(1, 1, 'Admin', 'admin@organizzaestudio.com', 'Admin\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`CdCliente`),
  ADD UNIQUE KEY `CpfCnpj` (`CpfCnpj`);

--
-- Indexes for table `contrato`
--
ALTER TABLE `contrato`
  ADD PRIMARY KEY (`CdContrato`),
  ADD KEY `CdCliente` (`CdCliente`);

--
-- Indexes for table `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`CdFuncionario`),
  ADD UNIQUE KEY `Cpf` (`Cpf`);

--
-- Indexes for table `servico`
--
ALTER TABLE `servico`
  ADD PRIMARY KEY (`CdServico`);

--
-- Indexes for table `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  ADD PRIMARY KEY (`CdTipoUsuario`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`CdUsuario`),
  ADD UNIQUE KEY `NomeUsuario` (`NomeUsuario`),
  ADD KEY `CdTipoUsuario` (`CdTipoUsuario`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cliente`
--
ALTER TABLE `cliente`
  MODIFY `CdCliente` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contrato`
--
ALTER TABLE `contrato`
  MODIFY `CdContrato` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `funcionario`
--
ALTER TABLE `funcionario`
  MODIFY `CdFuncionario` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `servico`
--
ALTER TABLE `servico`
  MODIFY `CdServico` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  MODIFY `CdTipoUsuario` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `CdUsuario` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `contrato`
--
ALTER TABLE `contrato`
  ADD CONSTRAINT `contrato_ibfk_1` FOREIGN KEY (`CdCliente`) REFERENCES `cliente` (`CdCliente`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`CdTipoUsuario`) REFERENCES `tipo_usuario` (`CdTipoUsuario`) ON DELETE CASCADE ON UPDATE CASCADE;


--
-- Metadata
--
USE phpmyadmin;

--
-- Metadata for table cliente
--
-- Error reading data for table phpmyadmin.pma__column_info: #1100 - Tabela 'pma__column_info' n~ao foi travada com LOCK TABLES
-- Error reading data for table phpmyadmin.pma__table_uiprefs: #1100 - Tabela 'pma__table_uiprefs' n~ao foi travada com LOCK TABLES
-- Error reading data for table phpmyadmin.pma__tracking: #1100 - Tabela 'pma__tracking' n~ao foi travada com LOCK TABLES

--
-- Metadata for table contrato
--
-- Error reading data for table phpmyadmin.pma__column_info: #1100 - Tabela 'pma__column_info' n~ao foi travada com LOCK TABLES
-- Error reading data for table phpmyadmin.pma__table_uiprefs: #1100 - Tabela 'pma__table_uiprefs' n~ao foi travada com LOCK TABLES
-- Error reading data for table phpmyadmin.pma__tracking: #1100 - Tabela 'pma__tracking' n~ao foi travada com LOCK TABLES

--
-- Metadata for table funcionario
--
-- Error reading data for table phpmyadmin.pma__column_info: #1100 - Tabela 'pma__column_info' n~ao foi travada com LOCK TABLES
-- Error reading data for table phpmyadmin.pma__table_uiprefs: #1100 - Tabela 'pma__table_uiprefs' n~ao foi travada com LOCK TABLES
-- Error reading data for table phpmyadmin.pma__tracking: #1100 - Tabela 'pma__tracking' n~ao foi travada com LOCK TABLES

--
-- Metadata for table servico
--
-- Error reading data for table phpmyadmin.pma__column_info: #1100 - Tabela 'pma__column_info' n~ao foi travada com LOCK TABLES
-- Error reading data for table phpmyadmin.pma__table_uiprefs: #1100 - Tabela 'pma__table_uiprefs' n~ao foi travada com LOCK TABLES
-- Error reading data for table phpmyadmin.pma__tracking: #1100 - Tabela 'pma__tracking' n~ao foi travada com LOCK TABLES

--
-- Metadata for table tipo_usuario
--
-- Error reading data for table phpmyadmin.pma__column_info: #1100 - Tabela 'pma__column_info' n~ao foi travada com LOCK TABLES
-- Error reading data for table phpmyadmin.pma__table_uiprefs: #1100 - Tabela 'pma__table_uiprefs' n~ao foi travada com LOCK TABLES
-- Error reading data for table phpmyadmin.pma__tracking: #1100 - Tabela 'pma__tracking' n~ao foi travada com LOCK TABLES

--
-- Metadata for table usuario
--
-- Error reading data for table phpmyadmin.pma__column_info: #1100 - Tabela 'pma__column_info' n~ao foi travada com LOCK TABLES
-- Error reading data for table phpmyadmin.pma__table_uiprefs: #1100 - Tabela 'pma__table_uiprefs' n~ao foi travada com LOCK TABLES
-- Error reading data for table phpmyadmin.pma__tracking: #1100 - Tabela 'pma__tracking' n~ao foi travada com LOCK TABLES

--
-- Metadata for database organizzaestudio
--
-- Error reading data for table phpmyadmin.pma__bookmark: #1100 - Tabela 'pma__bookmark' n~ao foi travada com LOCK TABLES
-- Error reading data for table phpmyadmin.pma__relation: #1100 - Tabela 'pma__relation' n~ao foi travada com LOCK TABLES
-- Error reading data for table phpmyadmin.pma__savedsearches: #1100 - Tabela 'pma__savedsearches' n~ao foi travada com LOCK TABLES
-- Error reading data for table phpmyadmin.pma__central_columns: #1100 - Tabela 'pma__central_columns' n~ao foi travada com LOCK TABLES
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
