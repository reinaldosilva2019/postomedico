-- MySQL Workbench Synchronization
-- Generated: 2019-10-01 10:59
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: reinaldo

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

ALTER TABLE `sgpc2019`.`endereco` 
DROP FOREIGN KEY `fk_endereco_pessoa`;

ALTER TABLE `sgpc2019`.`medico` 
DROP FOREIGN KEY `fk_medico_pessoa1`;

ALTER TABLE `sgpc2019`.`medicoespecialidade` 
DROP FOREIGN KEY `fk_medicoespecialidade_especialidade1`,
DROP FOREIGN KEY `fk_medicoespecialidade_medico1`;

ALTER TABLE `sgpc2019`.`medicoespecialidade` 
CHANGE COLUMN `especialidade_idespecialidade` `especialidade_idespecialidade` INT(11) NOT NULL AFTER `idmedicoespecialidade`,
DROP PRIMARY KEY,
ADD PRIMARY KEY (`idmedicoespecialidade`),
ADD INDEX `fk_medicoespecialidade_especialidade1_idx` (`especialidade_idespecialidade` ASC) VISIBLE,
ADD INDEX `fk_medicoespecialidade_medico1_idx` (`medico_idmedico` ASC) VISIBLE,
DROP INDEX `fk_medicoespecialidade_especialidade1_idx` ,
DROP INDEX `fk_medicoespecialidade_medico1_idx` ;
;

DROP TABLE IF EXISTS `sgpc2019`.`users` ;

DROP TABLE IF EXISTS `sgpc2019`.`password_resets` ;

DROP TABLE IF EXISTS `sgpc2019`.`migrations` ;

DROP TABLE IF EXISTS `sgpc2019`.`failed_jobs` ;

ALTER TABLE `sgpc2019`.`endereco` 
ADD CONSTRAINT `fk_endereco_pessoa`
  FOREIGN KEY (`pessoa_idpessoa`)
  REFERENCES `sgpc2019`.`pessoa` (`idpessoa`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `sgpc2019`.`medico` 
ADD CONSTRAINT `fk_medico_pessoa1`
  FOREIGN KEY (`pessoa_idpessoa`)
  REFERENCES `sgpc2019`.`pessoa` (`idpessoa`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `sgpc2019`.`medicoespecialidade` 
ADD CONSTRAINT `fk_medicoespecialidade_especialidade1`
  FOREIGN KEY (`especialidade_idespecialidade`)
  REFERENCES `sgpc2019`.`especialidade` (`idespecialidade`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_medicoespecialidade_medico1`
  FOREIGN KEY (`medico_idmedico`)
  REFERENCES `sgpc2019`.`medico` (`idmedico`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
