-- MySQL Script generated by MySQL Workbench
-- Sun May 20 19:06:17 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';
SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT;
SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS;
SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION;
SET NAMES cp1256;

-- -----------------------------------------------------
-- Schema organizzaestudio
-- -----------------------------------------------------
DROP DATABASE IF EXISTS `organizzaestudio` ;

-- -----------------------------------------------------
-- Schema organizzaestudio
-- -----------------------------------------------------
CREATE DATABASE IF NOT EXISTS `organizzaestudio` DEFAULT CHARACTER SET latin1 COLLATE latin1_general_ci ;

USE `organizzaestudio` ;

-- -----------------------------------------------------
-- Table `organizzaestudio`.`TIPO_USUARIO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `organizzaestudio`.`TIPO_USUARIO` (
  `CdTipoUsuario` INTEGER NOT NULL  AUTO_INCREMENT,
  `Descricao` VARCHAR(20) NULL,
  PRIMARY KEY (`CdTipoUsuario`)
)ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=11;



-- -----------------------------------------------------
-- Table `organizzaestudio`.`USUARIO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `organizzaestudio`.`USUARIO` (
  `CdUsuario` INTEGER NOT NULL  AUTO_INCREMENT,
  `CdTipoUsuario` INTEGER  DEFAULT NULL,
  `NomeUsuario` VARCHAR(50) NOT NULL,
  `Email` VARCHAR(50) DEFAULT NULL,
  `Senha` VARCHAR(60) CHARACTER SET 'latin1' COLLATE 'latin1_general_cs' NULL,
  `DataCriacao` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `StatusAtivo` CHAR NULL,
  PRIMARY KEY (`CdUsuario`),
  UNIQUE KEY(`NomeUsuario`),
  UNIQUE KEY(`Email`), 
  CONSTRAINT `CdTipoUsuario`
    FOREIGN KEY (`CdTipoUsuario`)
    REFERENCES `organizzaestudio`.`TIPO_USUARIO` (`CdTipoUsuario`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=11;


-- -----------------------------------------------------
-- Table `organizzaestudio`.`CLIENTE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `organizzaestudio`.`CLIENTE` (
  `CdCliente` INT  NOT NULL AUTO_INCREMENT,
  `CdUsuario` INTEGER NOT NULL,
  `CpfCnpj` VARCHAR(18) NOT NULL,
  `Nome` VARCHAR(255) NOT NULL,
  `RazaoSocial` VARCHAR(255) NULL,
  `InscricaoEstadual` VARCHAR(18) NULL,
  `Cep` VARCHAR(10) NULL,
  `Endereco` VARCHAR(150) NULL,
  `EnderecoNumero` VARCHAR(20) NULL,
  `Uf` CHAR(2) NULL,
  `Cidade` VARCHAR(50) NULL,
  `Bairro` VARCHAR(50) NULL,
  `Telefone` VARCHAR(14) NULL,
  `Celular` VARCHAR(14) NULL,
  `Email` VARCHAR(100) NULL,
  `DataNascimento` DATE NULL,
  `StatusAtivo` CHAR NOT NULL,
  PRIMARY KEY (`CdCliente`, `CdUsuario`),
  UNIQUE INDEX `CpfCnpj_UNIQUE` (`CpfCnpj` ASC),
  INDEX `fk_CLIENTE_USUARIO1_idx` (`CdUsuario` ASC),
  CONSTRAINT `fk_CLIENTE_USUARIO1`
    FOREIGN KEY (`CdUsuario`)
    REFERENCES `organizzaestudio`.`USUARIO` (`CdUsuario`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=11;



-- -----------------------------------------------------
-- Table `organizzaestudio`.`FUNCIONARIO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `organizzaestudio`.`FUNCIONARIO` (
  `CdCliente` INT  NOT NULL AUTO_INCREMENT,
  `CdUsuario` INTEGER NOT NULL,
  `Cpf` VARCHAR(18) NOT NULL,
  `Nome` VARCHAR(255) NOT NULL,
  `Cep` VARCHAR(10) NULL,
  `Endereco` VARCHAR(150) NULL,
  `EnderecoNumero` VARCHAR(20) NULL,
  `Uf` CHAR(2) NULL,
  `Cidade` VARCHAR(50) NULL,
  `Bairro` VARCHAR(50) NULL,
  `Telefone` VARCHAR(14) NULL,
  `Celular` VARCHAR(14) NULL,
  `Email` VARCHAR(100) NULL,
  `DataNascimento` DATE NULL,
  `StatuAtivo` CHAR NULL,
  PRIMARY KEY (`CdCliente`, `CdUsuario`),
  UNIQUE INDEX `CpfCnpj_UNIQUE` (`Cpf` ASC),
  UNIQUE INDEX `Usuario_UNIQUE` (`CdUsuario` ASC),
  INDEX `fk_FUNCIONARIO_USUARIO1_idx` (`CdUsuario` ASC),
  CONSTRAINT `fk_FUNCIONARIO_USUARIO1`
    FOREIGN KEY (`CdUsuario`)
    REFERENCES `organizzaestudio`.`USUARIO` (`CdUsuario`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=11;



-- -----------------------------------------------------
-- Table `organizzaestudio`.`SERVICO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `organizzaestudio`.`SERVICO` (
  `CdServico` INT  NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(100) NULL,
  `Valor` DECIMAL(19,4) NULL,
  `Descricao` VARCHAR(255) NULL,
  `StatusAtivo` CHAR NULL,
  PRIMARY KEY (`CdServico`))
ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=11;



-- -----------------------------------------------------
-- Table `organizzaestudio`.`MIDIA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `organizzaestudio`.`MIDIA` (
  `CdMidia` INT  NOT NULL AUTO_INCREMENT,
  `NormeArquivo` VARCHAR(128) NULL,
  `Caminho` VARCHAR(200) NULL,
  `TipoArquivo` VARCHAR(100) NULL,
  `DataCriacao` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`CdMidia`))
ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=11;



-- -----------------------------------------------------
-- Table `organizzaestudio`.`CONTRATO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `organizzaestudio`.`CONTRATO` (
  `CdContrato` INT  NOT NULL AUTO_INCREMENT,
  `Cliente` INT NOT NULL,
  `DescricaoEvento` VARCHAR(255) NULL,
  `DataCriacao` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `DataEvento` DATETIME NULL,
  `DataAceite` DATETIME NULL,
  `Documento` BLOB NULL,
  `ValorContrato` DECIMAL(19,4) NULL,
  `StatusAtivo` CHAR NOT NULL,
  PRIMARY KEY (`CdContrato`, `Cliente`),
  INDEX `CdCliente_idx` (`Cliente` ASC),
  CONSTRAINT `CdCliente`
    FOREIGN KEY (`Cliente`)
    REFERENCES `organizzaestudio`.`CLIENTE` (`CdCliente`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=11;



-- -----------------------------------------------------
-- Table `organizzaestudio`.`CONTRATO_SERVICO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `organizzaestudio`.`CONTRATO_SERVICO` (
  `CdContratoServico` INT  NOT NULL AUTO_INCREMENT,
  `CdServico` INT NOT NULL,
  `CdContrato` INT NOT NULL,
  PRIMARY KEY (`CdContratoServico`, `CdServico`, `CdContrato`),
  INDEX `fk_SERVICO_has_CONTRATO_CONTRATO1_idx` (`CdContrato` ASC),
  INDEX `fk_SERVICO_has_CONTRATO_SERVICO1_idx` (`CdServico` ASC),
  CONSTRAINT `fk_Servico`
    FOREIGN KEY (`CdServico`)
    REFERENCES `organizzaestudio`.`SERVICO` (`CdServico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Contrato`
    FOREIGN KEY (`CdContrato`)
    REFERENCES `organizzaestudio`.`CONTRATO` (`CdContrato`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=11;



-- -----------------------------------------------------
-- Table `organizzaestudio`.`CONTRATO_MIDIA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `organizzaestudio`.`CONTRATO_MIDIA` (
  `CdContratoMidia` INT  NOT NULL AUTO_INCREMENT,
  `CdContrato` INT NOT NULL,
  `CdMidia` INT NOT NULL,
  PRIMARY KEY (`CdContratoMidia`, `CdContrato`, `CdMidia`),
  INDEX `fk_CONTRATO_has_MIDIA_MIDIA1_idx` (`CdMidia` ASC),
  INDEX `fk_CONTRATO_has_MIDIA_CONTRATO1_idx` (`CdContrato` ASC),
  CONSTRAINT `fk_CONTRATO_has_MIDIA_CONTRATO1`
    FOREIGN KEY (`CdContrato`)
    REFERENCES `organizzaestudio`.`CONTRATO` (`CdContrato`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CONTRATO_has_MIDIA_MIDIA1`
    FOREIGN KEY (`CdMidia`)
    REFERENCES `organizzaestudio`.`MIDIA` (`CdMidia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=11;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `organizzaestudio`.`TIPO_USUARIO`
-- -----------------------------------------------------
START TRANSACTION;
USE `organizzaestudio`;
INSERT INTO `organizzaestudio`.`TIPO_USUARIO` (`CdTipoUsuario`, `Descricao`) VALUES (1, 'Administrador');
INSERT INTO `organizzaestudio`.`TIPO_USUARIO` (`CdTipoUsuario`, `Descricao`) VALUES (2, 'Funcionario');
INSERT INTO `organizzaestudio`.`TIPO_USUARIO` (`CdTipoUsuario`, `Descricao`) VALUES (3, 'Cliente');

COMMIT;


-- -----------------------------------------------------
-- Data for table `organizzaestudio`.`USUARIO`
-- -----------------------------------------------------
START TRANSACTION;
USE `organizzaestudio`;
INSERT INTO `organizzaestudio`.`USUARIO` (`CdUsuario`, `NomeUsuario`, `Email`, `Senha`, `DataCriacao`, `CdTipoUsuario`, `StatusAtivo`) VALUES (1, 'Admin', 'admin@organnizaestudio.com', 'Admin', '', 1, NULL);

COMMIT;

