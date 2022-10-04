-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Proyecto_Baibiene
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Proyecto_Baibiene` DEFAULT CHARACTER SET utf8 ;
USE `Proyecto_Baibiene` ;

-- -----------------------------------------------------
-- Table `Proyecto_Baibiene`.`Clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Proyecto_Baibiene`.`Clientes` (
  `id_Cliente` INT NOT NULL,
  `Razon_Soc_Cl` VARCHAR(60) NULL,
  `CUIT_Cl` VARCHAR(9) NOT NULL,
  `Cond_IVA_Cl` VARCHAR(30) NULL,
  `Cliente_desde` DATE NULL,
  PRIMARY KEY (`id_Cliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Proyecto_Baibiene`.`Productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Proyecto_Baibiene`.`Productos` (
  `id_Prod` INT NOT NULL,
  `Nombre_Prod` VARCHAR(45) NOT NULL,
  `Desc_Prod` VARCHAR(200) NOT NULL,
  `Prec_Comp` DECIMAL(65,2) NOT NULL,
  `Prec_Vta` DECIMAL(65,2) NOT NULL,
  PRIMARY KEY (`id_Prod`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Proyecto_Baibiene`.`Sucursales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Proyecto_Baibiene`.`Sucursales` (
  `id_sucursal` INT NOT NULL,
  `Ubicacion` VARCHAR(30) NOT NULL,
  `Sucursal_desde` DATE NULL,
  `Cant_empl` INT NOT NULL,
  `Cant_dptos` INT NOT NULL,
  `Nombres_dptos` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`id_sucursal`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Proyecto_Baibiene`.`Departamentos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Proyecto_Baibiene`.`Departamentos` (
  `id_depto` INT NOT NULL,
  `Nombre_dep` VARCHAR(20) NOT NULL,
  `Descr_func` VARCHAR(200) NOT NULL,
  `Cant_empl` INT NOT NULL,
  `Presup_sal` DECIMAL(65,2) NULL,
  `Presup_compr` DECIMAL(65,2) NULL,
  PRIMARY KEY (`id_depto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Proyecto_Baibiene`.`Empleados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Proyecto_Baibiene`.`Empleados` (
  `id_Empleado` INT NOT NULL AUTO_INCREMENT,
  `id_sucursal` INT NOT NULL,
  `id_depto` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Apellido` VARCHAR(45) NOT NULL,
  `Salario` DECIMAL(65,2) NULL,
  `Empleado_desde` DATE NULL,
  PRIMARY KEY (`id_Empleado`),
  INDEX `id_sucursal_idx` (`id_sucursal` ASC) VISIBLE,
  INDEX `id_depto_idx` (`id_depto` ASC) VISIBLE,
  CONSTRAINT `id_sucursal3`
    FOREIGN KEY (`id_sucursal`)
    REFERENCES `mydb`.`Sucursales` (`id_sucursal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_depto`
    FOREIGN KEY (`id_depto`)
    REFERENCES `mydb`.`Departamentos` (`id_depto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Proyecto_Baibiene`.`Ord_Vta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Proyecto_Baibiene`.`Ord_Vta` (
  `id_OrdVta` INT NOT NULL,
  `id_sucursal` INT NOT NULL,
  `id_Prod` INT NOT NULL,
  `id_Cliente` INT NOT NULL,
  `id_Empleado` INT NOT NULL,
  `Fecha_Vta` DATETIME NOT NULL,
  `Nombre_Prod` VARCHAR(45) NULL,
  `Cant_Vta` INT NOT NULL,
  `Prec_Vta` DECIMAL(65,2) NOT NULL,
  `Tot_Vta` DECIMAL(65,2) NULL,
  PRIMARY KEY (`id_OrdVta`),
  INDEX `id_Prod_idx` (`id_Prod` ASC) VISIBLE,
  INDEX `id_Cliente_idx` (`id_Cliente` ASC) VISIBLE,
  INDEX `id_Empleado_idx` (`id_Empleado` ASC) VISIBLE,
  INDEX `id_sucursal_idx` (`id_sucursal` ASC) VISIBLE,
  CONSTRAINT `id_Cliente`
    FOREIGN KEY (`id_Cliente`)
    REFERENCES `mydb`.`Clientes` (`id_Cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_Prod1`
    FOREIGN KEY (`id_Prod`)
    REFERENCES `mydb`.`Productos` (`id_Prod`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_Empleado`
    FOREIGN KEY (`id_Empleado`)
    REFERENCES `mydb`.`Empleados` (`id_Empleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_sucursal1`
    FOREIGN KEY (`id_sucursal`)
    REFERENCES `mydb`.`Sucursales` (`id_sucursal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Proyecto_Baibiene`.`Proveedores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Proyecto_Baibiene`.`Proveedores` (
  `id_Prov` INT NOT NULL,
  `Razon_Soc_Prov` VARCHAR(60) NULL,
  `CUIT_Prov` VARCHAR(9) NOT NULL,
  `Cond_IVA_Prov` VARCHAR(30) NULL,
  `Prov_Desde` DATE NULL,
  PRIMARY KEY (`id_Prov`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Proyecto_Baibiene`.`Ord_Comp`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Proyecto_Baibiene`.`Ord_Comp` (
  `id_OrdComp` INT NOT NULL,
  `id_Prod` INT NOT NULL,
  `id_Prov` INT NOT NULL,
  `id_sucursal` INT NOT NULL,
  `id_depto` INT NOT NULL,
  `Fecha_Comp` DATETIME NOT NULL,
  `Nombre_Prod` VARCHAR(45) NULL,
  `Cant_Comp` INT NOT NULL,
  `Prec_Comp` DECIMAL(65,2) NOT NULL,
  `Tot_Comp` DECIMAL(65,2) NULL,
  PRIMARY KEY (`id_OrdComp`),
  INDEX `id_Prod_idx` (`id_Prod` ASC) VISIBLE,
  INDEX `id_Prov_idx` (`id_Prov` ASC) VISIBLE,
  INDEX `id_sucursal_idx` (`id_sucursal` ASC) VISIBLE,
  INDEX `id_depto_idx` (`id_depto` ASC) VISIBLE,
  CONSTRAINT `id_Prod2`
    FOREIGN KEY (`id_Prod`)
    REFERENCES `mydb`.`Productos` (`id_Prod`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_Prov`
    FOREIGN KEY (`id_Prov`)
    REFERENCES `mydb`.`Proveedores` (`id_Prov`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_sucursal2`
    FOREIGN KEY (`id_sucursal`)
    REFERENCES `mydb`.`Sucursales` (`id_sucursal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_depto3`
    FOREIGN KEY (`id_depto`)
    REFERENCES `mydb`.`Departamentos` (`id_depto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Proyecto_Baibiene`.`Servicios_Var`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Proyecto_Baibiene`.`Servicios_Var` (
  `id_Servicio` INT NOT NULL,
  `Desc_Serv` VARCHAR(200) NOT NULL,
  `Servicio desde` DATE NULL,
  PRIMARY KEY (`id_Servicio`, `Desc_Serv`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Proyecto_Baibiene`.`Ordenes_Servicios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Proyecto_Baibiene`.`Ordenes_Servicios` (
  `id_Ord_Serv` INT NOT NULL,
  `id_Servicio` INT NOT NULL,
  `id_Cliente` INT NOT NULL,
  `id_Empleado` INT NOT NULL,
  `Fecha_Serv` DATETIME NOT NULL,
  `Tot_Serv` DECIMAL(65,2) NOT NULL,
  PRIMARY KEY (`id_Ord_Serv`),
  INDEX `id_Cliente_idx` (`id_Cliente` ASC) VISIBLE,
  INDEX `id_Empleado_idx` (`id_Empleado` ASC) VISIBLE,
  CONSTRAINT `id_Cliente1`
    FOREIGN KEY (`id_Cliente`)
    REFERENCES `mydb`.`Clientes` (`id_Cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_Servicio`
    FOREIGN KEY (`id_Servicio`)
    REFERENCES `mydb`.`Servicios_Var` (`id_Servicio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_Empleado1`
    FOREIGN KEY (`id_Empleado`)
    REFERENCES `mydb`.`Empleados` (`id_Empleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Proyecto_Baibiene`.`Gastos_Var`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Proyecto_Baibiene`.`Gastos_Var` (
  `id_GastoServ` VARCHAR(45) NOT NULL,
  `id_Servicio` INT NOT NULL,
  `id_depto` INT NOT NULL,
  `id_Prov` INT NOT NULL,
  `Fecha_gasto` DATETIME NOT NULL,
  `Tot_Gasto` DECIMAL(65,2) NOT NULL,
  INDEX `id_Prov_idx` (`id_Prov` ASC) VISIBLE,
  PRIMARY KEY (`id_GastoServ`),
  INDEX `id_depto_idx` (`id_depto` ASC) VISIBLE,
  CONSTRAINT `id_Prov1`
    FOREIGN KEY (`id_Prov`)
    REFERENCES `mydb`.`Proveedores` (`id_Prov`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_Servicio1`
    FOREIGN KEY (`id_Servicio`)
    REFERENCES `mydb`.`Servicios_Var` (`id_Servicio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_depto1`
    FOREIGN KEY (`id_depto`)
    REFERENCES `mydb`.`Departamentos` (`id_depto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
