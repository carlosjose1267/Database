-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema trafico
-- -----------------------------------------------------
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`conductor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`conductor` (
  `idconductor` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `apellidos` VARCHAR(45) NULL,
  PRIMARY KEY (`idconductor`),
  UNIQUE INDEX `idconductor_UNIQUE` (`idconductor` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`vehiculo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`vehiculo` (
  `idvehiculo` INT NOT NULL,
  `tipo` VARCHAR(45) NULL,
  `velocidad` INT NULL,
  `conductor_idconductor` INT NOT NULL,
  PRIMARY KEY (`idvehiculo`, `conductor_idconductor`),
  INDEX `fk_vehiculo_conductor_idx` (`conductor_idconductor` ASC),
  UNIQUE INDEX `idvehiculo_UNIQUE` (`idvehiculo` ASC),
  CONSTRAINT `fk_vehiculo_conductor`
    FOREIGN KEY (`conductor_idconductor`)
    REFERENCES `mydb`.`conductor` (`idconductor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`multa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`multa` (
  `idmulta` INT NOT NULL,
  `descripcion` VARCHAR(45) NULL,
  `precio` INT NULL,
  `conductor_idconductor` INT NOT NULL,
  PRIMARY KEY (`idmulta`, `conductor_idconductor`),
  INDEX `fk_multa_conductor1_idx` (`conductor_idconductor` ASC),
  UNIQUE INDEX `idmulta_UNIQUE` (`idmulta` ASC),
  CONSTRAINT `fk_multa_conductor1`
    FOREIGN KEY (`conductor_idconductor`)
    REFERENCES `mydb`.`conductor` (`idconductor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
