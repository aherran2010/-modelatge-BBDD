-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mdOptica
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mdOptica
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mdOptica` DEFAULT CHARACTER SET utf8 ;
USE `mdOptica` ;

-- -----------------------------------------------------
-- Table `mdOptica`.`Proveidor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mdOptica`.`Proveidor` (
  `id_proveidor` INT NOT NULL,
  `nom` VARCHAR(145) NULL,
  `carrer` VARCHAR(80) NULL,
  `numero` VARCHAR(6) NULL,
  `pis` VARCHAR(6) NULL,
  `porta` VARCHAR(6) NULL,
  `ciutat` VARCHAR(45) NULL,
  `codi_postal` VARCHAR(5) NULL,
  `pais` VARCHAR(45) NULL,
  PRIMARY KEY (`id_proveidor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mdOptica`.`Empleat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mdOptica`.`Empleat` (
  `id_empleat` INT NOT NULL,
  `nom` VARCHAR(25) NULL,
  `cognom` VARCHAR(45) NULL,
  PRIMARY KEY (`id_empleat`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mdOptica`.`Client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mdOptica`.`Client` (
  `id_client` INT NOT NULL,
  `nom` VARCHAR(80) NULL,
  `codi_postal` VARCHAR(45) NULL,
  `telefon` VARCHAR(15) NULL,
  `correu_electronic` VARCHAR(45) NULL,
  `data_registre` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `Client_id_client_recomenat` INT NOT NULL,
  PRIMARY KEY (`id_client`),
  INDEX `fk_Client_Client_idx` (`Client_id_client_recomenat` ASC) VISIBLE,
  CONSTRAINT `fk_Client_Client`
    FOREIGN KEY (`Client_id_client_recomenat`)
    REFERENCES `mdOptica`.`Client` (`id_client`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mdOptica`.`Ullera`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mdOptica`.`Ullera` (
  `id_ullera` INT NOT NULL,
  `marca` VARCHAR(45) NULL,
  `graduacio_vidre1` VARCHAR(15) NULL,
  `graduacio_vidre2` VARCHAR(15) NULL,
  `tipus_montura` ENUM('flotant', 'pasta', 'metal.lica') NULL,
  `color_montura` VARCHAR(25) NULL,
  `color_vidre1` VARCHAR(25) NULL,
  `color_vidre2` VARCHAR(25) NULL,
  `preu` DOUBLE NULL,
  `Empleat_id_empleat` INT NOT NULL,
  `Client_id_client` INT NOT NULL,
  `Proveidor_id_proveidor` INT NOT NULL,
  PRIMARY KEY (`id_ullera`),
  INDEX `fk_Ullera_Empleat1_idx` (`Empleat_id_empleat` ASC) VISIBLE,
  INDEX `fk_Ullera_Client1_idx` (`Client_id_client` ASC) VISIBLE,
  INDEX `fk_Ullera_Proveidor1_idx` (`Proveidor_id_proveidor` ASC) VISIBLE,
  CONSTRAINT `fk_Ullera_Empleat1`
    FOREIGN KEY (`Empleat_id_empleat`)
    REFERENCES `mdOptica`.`Empleat` (`id_empleat`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ullera_Client1`
    FOREIGN KEY (`Client_id_client`)
    REFERENCES `mdOptica`.`Client` (`id_client`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ullera_Proveidor1`
    FOREIGN KEY (`Proveidor_id_proveidor`)
    REFERENCES `mdOptica`.`Proveidor` (`id_proveidor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
