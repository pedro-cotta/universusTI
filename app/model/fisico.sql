SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `universusTI` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `universusTI` ;

-- -----------------------------------------------------
-- Table `universusTI`.`User`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `universusTI`.`User` (
  `id` INT NOT NULL ,
  `role` VARCHAR(45) NOT NULL ,
  `nome` VARCHAR(45) NULL ,
  `telefone` VARCHAR(45) NULL ,
  `email` VARCHAR(45) NOT NULL ,
  `cpf` VARCHAR(45) NOT NULL COMMENT '\n' ,
  `password` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = FEDERATED;


-- -----------------------------------------------------
-- Table `universusTI`.`empresa`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `universusTI`.`empresa` (
  `id` INT NOT NULL ,
  `nome` VARCHAR(45) NOT NULL ,
  `plano` VARCHAR(45) NOT NULL ,
  `cnpj` VARCHAR(45) NOT NULL ,
  `endereço` VARCHAR(45) NULL ,
  `User_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_empresa_User_idx` (`User_id` ASC) ,
  CONSTRAINT `fk_empresa_User`
    FOREIGN KEY (`User_id` )
    REFERENCES `universusTI`.`User` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `universusTI`.`perguntas`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `universusTI`.`perguntas` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `label` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `universusTI`.`pesquisa`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `universusTI`.`pesquisa` (
  `empresa_id` INT NOT NULL ,
  `perguntas_id` INT NOT NULL ,
  `resposta` FLOAT NULL ,
  PRIMARY KEY (`empresa_id`, `perguntas_id`) ,
  INDEX `fk_empresa_has_perguntas_perguntas1_idx` (`perguntas_id` ASC) ,
  INDEX `fk_empresa_has_perguntas_empresa1_idx` (`empresa_id` ASC) ,
  CONSTRAINT `fk_empresa_has_perguntas_empresa1`
    FOREIGN KEY (`empresa_id` )
    REFERENCES `universusTI`.`empresa` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_empresa_has_perguntas_perguntas1`
    FOREIGN KEY (`perguntas_id` )
    REFERENCES `universusTI`.`perguntas` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `universusTI`;
//teste git anderson

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
