
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema proyecto_baibiene
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema proyecto_baibiene
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `proyecto_baibiene` DEFAULT CHARACTER SET utf8 ;
USE `proyecto_baibiene` ;

-- -----------------------------------------------------
-- Table `proyecto_baibiene`.`Clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto_baibiene`.`Clientes` (
  `id_Cliente` INT NOT NULL AUTO_INCREMENT,
  `Razon_Soc_Cl` VARCHAR(60) NULL,
  `CUIT_Cl` VARCHAR(11) NOT NULL,
  `Cond_IVA_Cl` VARCHAR(30) NULL,
  `Cliente_desde` DATE NULL,
  PRIMARY KEY (`id_Cliente`),
  UNIQUE INDEX `id_Cliente_UNIQUE` (`id_Cliente` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyecto_baibiene`.`Productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto_baibiene`.`Productos` (
  `id_Prod` INT NOT NULL AUTO_INCREMENT,
  `Nombre_Prod` VARCHAR(600) NOT NULL,
  `Desc_Prod` VARCHAR(200) NULL,
  `Prec_Comp` DECIMAL(65,2) NOT NULL,
  `Prec_Vta` DECIMAL(65,2) NOT NULL,
  PRIMARY KEY (`id_Prod`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyecto_baibiene`.`Sucursales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto_baibiene`.`Sucursales` (
  `id_sucursal` INT NOT NULL AUTO_INCREMENT,
  `Ubicacion` VARCHAR(30) NOT NULL,
  `Sucursal_desde` DATE NULL,
  `Cant_empl` INT NOT NULL,
  `Cant_dptos` INT NOT NULL,
  `Nombres_dptos` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`id_sucursal`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyecto_baibiene`.`Departamentos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto_baibiene`.`Departamentos` (
  `id_depto` INT NOT NULL AUTO_INCREMENT,
  `Nombre_dep` VARCHAR(20) NOT NULL,
  `Descr_func` VARCHAR(200) NOT NULL,
  `Cant_empl` INT NOT NULL,
  `Presup_sal` DECIMAL(65,2) NULL,
  `Presup_compr` DECIMAL(65,2) NULL,
  PRIMARY KEY (`id_depto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyecto_baibiene`.`Empleados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto_baibiene`.`Empleados` (
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
    REFERENCES `proyecto_baibiene`.`Sucursales` (`id_sucursal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_depto`
    FOREIGN KEY (`id_depto`)
    REFERENCES `proyecto_baibiene`.`Departamentos` (`id_depto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyecto_baibiene`.`Ord_Vta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto_baibiene`.`Ord_Vta` (
  `id_OrdVta` INT NOT NULL AUTO_INCREMENT,
  `id_sucursal` INT NOT NULL,
  `id_Prod` INT NOT NULL,
  `id_Cliente` INT NOT NULL,
  `id_Empleado` INT NOT NULL,
  `Fecha_Vta` DATETIME NULL,
  `Nombre_Prod` VARCHAR(600) NULL,
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
    REFERENCES `proyecto_baibiene`.`Clientes` (`id_Cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_Prod1`
    FOREIGN KEY (`id_Prod`)
    REFERENCES `proyecto_baibiene`.`Productos` (`id_Prod`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_Empleado`
    FOREIGN KEY (`id_Empleado`)
    REFERENCES `proyecto_baibiene`.`Empleados` (`id_Empleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_sucursal1`
    FOREIGN KEY (`id_sucursal`)
    REFERENCES `proyecto_baibiene`.`Sucursales` (`id_sucursal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyecto_baibiene`.`Proveedores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto_baibiene`.`Proveedores` (
  `id_Prov` INT NOT NULL,
  `Razon_Soc_Prov` VARCHAR(60) NULL,
  `CUIT_Prov` VARCHAR(11) NOT NULL,
  `Cond_IVA_Prov` VARCHAR(30) NULL,
  `Prov_Desde` DATE NULL,
  PRIMARY KEY (`id_Prov`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyecto_baibiene`.`Ord_Comp`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto_baibiene`.`Ord_Comp` (
  `id_OrdComp` INT NOT NULL AUTO_INCREMENT,
  `id_Prod` INT NOT NULL,
  `id_Prov` INT NOT NULL,
  `id_sucursal` INT NOT NULL,
  `id_depto` INT NOT NULL,
  `Fecha_Comp` DATETIME NULL,
  `Nombre_Prod` VARCHAR(600) NULL,
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
    REFERENCES `proyecto_baibiene`.`Productos` (`id_Prod`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_Prov`
    FOREIGN KEY (`id_Prov`)
    REFERENCES `proyecto_baibiene`.`Proveedores` (`id_Prov`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_sucursal2`
    FOREIGN KEY (`id_sucursal`)
    REFERENCES `proyecto_baibiene`.`Sucursales` (`id_sucursal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_depto3`
    FOREIGN KEY (`id_depto`)
    REFERENCES `proyecto_baibiene`.`Departamentos` (`id_depto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyecto_baibiene`.`Servicios_Var`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto_baibiene`.`Servicios_Var` (
  `id_Servicio` INT NOT NULL AUTO_INCREMENT,
  `Desc_Serv` VARCHAR(200) NOT NULL,
  `Servicio_desde` DATE NULL,
  PRIMARY KEY (`id_Servicio`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyecto_baibiene`.`Ordenes_Servicios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto_baibiene`.`Ordenes_Servicios` (
  `id_Ord_Serv` INT NOT NULL AUTO_INCREMENT,
  `id_Servicio` INT NOT NULL,
  `id_Cliente` INT NOT NULL,
  `id_Empleado` INT NOT NULL,
  `Fecha_Serv` DATETIME NULL,
  `Tot_Serv` DECIMAL(65,2) NOT NULL,
  PRIMARY KEY (`id_Ord_Serv`),
  INDEX `id_Cliente_idx` (`id_Cliente` ASC) VISIBLE,
  INDEX `id_Empleado_idx` (`id_Empleado` ASC) VISIBLE,
  CONSTRAINT `id_Cliente1`
    FOREIGN KEY (`id_Cliente`)
    REFERENCES `proyecto_baibiene`.`Clientes` (`id_Cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_Servicio`
    FOREIGN KEY (`id_Servicio`)
    REFERENCES `proyecto_baibiene`.`Servicios_Var` (`id_Servicio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_Empleado1`
    FOREIGN KEY (`id_Empleado`)
    REFERENCES `proyecto_baibiene`.`Empleados` (`id_Empleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `proyecto_baibiene`.`Gastos_Var`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyecto_baibiene`.`Gastos_Var` (
  `id_GastoServ` VARCHAR(45) NOT NULL,
  `id_Servicio` INT NULL,
  `id_depto` INT NOT NULL,
  `id_Prov` INT NOT NULL,
  `Fecha_gasto` DATETIME NULL,
  `Tot_Gasto` DECIMAL(65,2) NOT NULL,
  INDEX `id_Prov_idx` (`id_Prov` ASC) VISIBLE,
  INDEX `id_depto_idx` (`id_depto` ASC) VISIBLE,
  PRIMARY KEY (`id_GastoServ`),
  CONSTRAINT `id_Prov1`
    FOREIGN KEY (`id_Prov`)
    REFERENCES `proyecto_baibiene`.`Proveedores` (`id_Prov`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_Servicio1`
    FOREIGN KEY (`id_Servicio`)
    REFERENCES `proyecto_baibiene`.`Servicios_Var` (`id_Servicio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_depto1`
    FOREIGN KEY (`id_depto`)
    REFERENCES `proyecto_baibiene`.`Departamentos` (`id_depto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `proyecto_baibiene`.`Inventario` (
  `id_Prod` INT NOT NULL,
  `Nombre_Prod` VARCHAR(600),
  `Cant_disp` INT NULL,
  PRIMARY KEY (`id_Prod`),
  CONSTRAINT `id_producto`
    FOREIGN KEY (`id_Prod`)
    REFERENCES `proyecto_baibiene`.`productos` (`id_Prod`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    )
ENGINE = InnoDB;

 CREATE TABLE `proyecto_baibiene`.`Usuarios_Venta` (
 `id_Usuario` INT NOT NULL AUTO_INCREMENT, 
 `Nombre_Usuario` VARCHAR (60),
 `Fecha_Modif` DATETIME NOT NULL, 
 `Nueva_Orden_Venta` INT, 
 `Operacion` VARCHAR (60), 
 PRIMARY KEY(`id_Usuario`), 
 UNIQUE INDEX `id_Usuario_UNIQUE` (`id_Usuario` ASC) VISIBLE) 
 ENGINE = InnoDB;
 
  CREATE TABLE `proyecto_baibiene`.`Usuarios_Compra` (
 `id_Usuario` INT NOT NULL AUTO_INCREMENT, 
 `Nombre_Usuario` VARCHAR (60),
 `Fecha_Modif` DATETIME NOT NULL, 
 `Nueva_Orden_Compra` INT, 
 `Operacion` VARCHAR (60), 
 PRIMARY KEY(`id_Usuario`), 
 UNIQUE INDEX `id_Usuario_UNIQUE` (`id_Usuario` ASC) VISIBLE) 
 ENGINE = InnoDB;

 CREATE TABLE `proyecto_baibiene`.`Usuarios_Salarios` (
 `id_Usuario` INT NOT NULL AUTO_INCREMENT,
 `Nombre_Usuario` VARCHAR (60),
 `Fecha_Modif` DATETIME NOT NULL, 
 `id_Empleado` INT,
 `Salario_Ant` DECIMAL (65,2), 
 `Salario_Nuevo` DECIMAL (65,2), 
 `Operacion` VARCHAR (60), 
 PRIMARY KEY(`id_Usuario`), 
 UNIQUE INDEX `id_Usuario_UNIQUE` (`id_Usuario` ASC) VISIBLE) 
 ENGINE = InnoDB;

 
USE `proyecto_baibiene` ;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- INSERCION DE DATOS EN LAS TABLAS
-- -----------------------------------------------------

INSERT INTO clientes(id_Cliente,Razon_Soc_Cl,CUIT_Cl,Cond_IVA_Cl,Cliente_desde) VALUES (1,'ERSA URBANO SA',30707788832,'RESP_INSC',NULL);
INSERT INTO clientes(id_Cliente,Razon_Soc_Cl,CUIT_Cl,Cond_IVA_Cl,Cliente_desde) VALUES (2,'EMPRESA ROMERO S A',30561970684,'RESP_INSC',NULL);
INSERT INTO clientes(id_Cliente,Razon_Soc_Cl,CUIT_Cl,Cond_IVA_Cl,Cliente_desde) VALUES (3,'DERKA Y VARGAS S A',30547704343,'RESP_INSC',NULL);
INSERT INTO clientes(id_Cliente,Razon_Soc_Cl,CUIT_Cl,Cond_IVA_Cl,Cliente_desde) VALUES (4,'VICA NEUMATICOS Y SERVICIOS S.A.',30711191379,'RESP_INSC',NULL);
INSERT INTO clientes(id_Cliente,Razon_Soc_Cl,CUIT_Cl,Cond_IVA_Cl,Cliente_desde) VALUES (5,'CHAVES RAQUEL ESTHER',27225800508,'CONS_FIN',NULL);
INSERT INTO clientes(id_Cliente,Razon_Soc_Cl,CUIT_Cl,Cond_IVA_Cl,Cliente_desde) VALUES (6,'BAROLIN ALVARO OSCAR',20256161452,'RESP_INSC',NULL);
INSERT INTO clientes(id_Cliente,Razon_Soc_Cl,CUIT_Cl,Cond_IVA_Cl,Cliente_desde) VALUES (7,'PAREDES RICARDO HUGO',20110163593,'CONS_FIN',NULL);
INSERT INTO clientes(id_Cliente,Razon_Soc_Cl,CUIT_Cl,Cond_IVA_Cl,Cliente_desde) VALUES (8,'PABLO ELOY DONNET S A',30538457627,'RESP_INSC',NULL);
INSERT INTO clientes(id_Cliente,Razon_Soc_Cl,CUIT_Cl,Cond_IVA_Cl,Cliente_desde) VALUES (9,'LIDERANDO EL NEA SA',30716919001,'RESP_INSC',NULL);
INSERT INTO clientes(id_Cliente,Razon_Soc_Cl,CUIT_Cl,Cond_IVA_Cl,Cliente_desde) VALUES (10,'VEGAS GUILLERMO MARTIN',20262674518,'CONS_FIN',NULL);

select * from clientes;

INSERT INTO departamentos(id_depto,Nombre_dep,Descr_func,Cant_empl,Presup_sal,Presup_compr) VALUES (1,'Administracion','Llevar a cabo la contabilidad, control de comprobantes y pago de honorarios',2,5000000,NULL);
INSERT INTO departamentos(id_depto,Nombre_dep,Descr_func,Cant_empl,Presup_sal,Presup_compr) VALUES (2,'Ventas','Realizar la actividad principal de venta al publico',4,10000000,NULL);
INSERT INTO departamentos(id_depto,Nombre_dep,Descr_func,Cant_empl,Presup_sal,Presup_compr) VALUES (3,'Marketing','Promocionar los productos que comercializa la empresa',1,1200000,NULL);
INSERT INTO departamentos(id_depto,Nombre_dep,Descr_func,Cant_empl,Presup_sal,Presup_compr) VALUES (4,'Servicios','Realizar la actividad secundaria de brindar servicios a clientes',2,7000000,NULL);
INSERT INTO departamentos(id_depto,Nombre_dep,Descr_func,Cant_empl,Presup_sal,Presup_compr) VALUES (5,'Deposito','Encargarse del manejo del stock para cada sucursal',4,9000000,NULL);

select * from departamentos;

INSERT INTO sucursales(id_sucursal,Ubicacion,Sucursal_desde,Cant_empl,Cant_dptos,Nombres_dptos) VALUES (1,'Corrientes, ARG',NULL,5,4,'Administracion, Ventas, Marketing, Servicios');
INSERT INTO sucursales(id_sucursal,Ubicacion,Sucursal_desde,Cant_empl,Cant_dptos,Nombres_dptos) VALUES (2,'Corrientes, ARG',NULL,2,1,'Deposito');
INSERT INTO sucursales(id_sucursal,Ubicacion,Sucursal_desde,Cant_empl,Cant_dptos,Nombres_dptos) VALUES (3,'Resistencia, ARG',NULL,4,3,'Ventas, Servicios, Administracion');
INSERT INTO sucursales(id_sucursal,Ubicacion,Sucursal_desde,Cant_empl,Cant_dptos,Nombres_dptos) VALUES (4,'Resistencia, ARG',NULL,2,1,'Deposito');

select * from sucursales;

INSERT INTO empleados(id_Empleado,id_Sucursal,id_depto,Nombre,Apellido,Salario,Empleado_desde) VALUES (1,1,1,'Jose','Garcia',150000,NULL);
INSERT INTO empleados(id_Empleado,id_Sucursal,id_depto,Nombre,Apellido,Salario,Empleado_desde) VALUES (2,3,1,'Alberto','Lopez',120000,NULL);
INSERT INTO empleados(id_Empleado,id_Sucursal,id_depto,Nombre,Apellido,Salario,Empleado_desde) VALUES (3,1,2,'Ricardo','Salgado',90000,NULL);
INSERT INTO empleados(id_Empleado,id_Sucursal,id_depto,Nombre,Apellido,Salario,Empleado_desde) VALUES (4,1,2,'Juan','Sanchez',85000,NULL);
INSERT INTO empleados(id_Empleado,id_Sucursal,id_depto,Nombre,Apellido,Salario,Empleado_desde) VALUES (5,3,2,'Martin','Escobar',85000,NULL);
INSERT INTO empleados(id_Empleado,id_Sucursal,id_depto,Nombre,Apellido,Salario,Empleado_desde) VALUES (6,3,2,'Franco','Sanchez',80000,NULL);
INSERT INTO empleados(id_Empleado,id_Sucursal,id_depto,Nombre,Apellido,Salario,Empleado_desde) VALUES (7,1,3,'Francisco','Cristaldo',110000,NULL);
INSERT INTO empleados(id_Empleado,id_Sucursal,id_depto,Nombre,Apellido,Salario,Empleado_desde) VALUES (8,1,4,'Maximo','Perez',85000,NULL);
INSERT INTO empleados(id_Empleado,id_Sucursal,id_depto,Nombre,Apellido,Salario,Empleado_desde) VALUES (9,3,4,'Marcelo','Martinez',80000,NULL);
INSERT INTO empleados(id_Empleado,id_Sucursal,id_depto,Nombre,Apellido,Salario,Empleado_desde) VALUES (10,2,5,'Joaquin','Montoya',80000,NULL);
INSERT INTO empleados(id_Empleado,id_Sucursal,id_depto,Nombre,Apellido,Salario,Empleado_desde) VALUES (11,2,5,'Pedro','De la Vega',80000,NULL);
INSERT INTO empleados(id_Empleado,id_Sucursal,id_depto,Nombre,Apellido,Salario,Empleado_desde) VALUES (12,4,5,'Mauro','Salinas',75000,NULL);
INSERT INTO empleados(id_Empleado,id_Sucursal,id_depto,Nombre,Apellido,Salario,Empleado_desde) VALUES (13,4,5,'Matias','Tonutti',70000,NULL);

select * from empleados;

INSERT INTO servicios_var(id_Servicio,Desc_Serv,Servicio_desde) VALUES (1,'Mezcla de pinturas',NULL);
INSERT INTO servicios_var(id_Servicio,Desc_Serv,Servicio_desde) VALUES (2,'Mezcla de quimicos y fijadores de pintura',NULL);
INSERT INTO servicios_var(id_Servicio,Desc_Serv,Servicio_desde) VALUES (3,'Aplicacion de pintura sobre Automovil o Camioneta',NULL);
INSERT INTO servicios_var(id_Servicio,Desc_Serv,Servicio_desde) VALUES (4,'Aplicacion de pintura sobre Motocicleta',NULL);
INSERT INTO servicios_var(id_Servicio,Desc_Serv,Servicio_desde) VALUES (5,'Aplicacion de pintura sobre Camiones o vehiculos de gran porte',NULL);
INSERT INTO servicios_var(id_Servicio,Desc_Serv,Servicio_desde) VALUES (6,'Desarmado de carroceria para aplicación de pintura',NULL);
INSERT INTO servicios_var(id_Servicio,Desc_Serv,Servicio_desde) VALUES (7,'Asesoramiento sobre aplicaciones',NULL);
INSERT INTO servicios_var(id_Servicio,Desc_Serv,Servicio_desde) VALUES (8,'Traslado de productos para almacen del cliente',NULL);

select * from servicios_var;

INSERT INTO proveedores(id_Prov,Razon_Soc_Prov,CUIT_Prov,Cond_IVA_Prov,Prov_Desde) VALUES (1,'AGUA NOBLE S.R.L.',30714916072,'RESP_INSC',NULL);
INSERT INTO proveedores(id_Prov,Razon_Soc_Prov,CUIT_Prov,Cond_IVA_Prov,Prov_Desde) VALUES (2,'HIJOS DE ROBERTO CANCIO DEMONTE SOCIEDAD ANONIMA',33578089239,'RESP_INSC',NULL);
INSERT INTO proveedores(id_Prov,Razon_Soc_Prov,CUIT_Prov,Cond_IVA_Prov,Prov_Desde) VALUES (3,'ROBERLO ARGENTINA S.A.',30708596562,'RESP_INSC',NULL);
INSERT INTO proveedores(id_Prov,Razon_Soc_Prov,CUIT_Prov,Cond_IVA_Prov,Prov_Desde) VALUES (4,'FLEXXUS S A',30709063002,'RESP_INSC',NULL);
INSERT INTO proveedores(id_Prov,Razon_Soc_Prov,CUIT_Prov,Cond_IVA_Prov,Prov_Desde) VALUES (5,'AUDEC S.A.',30709760919,'RESP_INSC',NULL);
INSERT INTO proveedores(id_Prov,Razon_Soc_Prov,CUIT_Prov,Cond_IVA_Prov,Prov_Desde) VALUES (6,'MORAY ANDRES',20250375701,'MONOTRIB',NULL);
INSERT INTO proveedores(id_Prov,Razon_Soc_Prov,CUIT_Prov,Cond_IVA_Prov,Prov_Desde) VALUES (7,'SUR CORRENTINO S.R.L.',30715934570,'RESP_INSC',NULL);

select * from proveedores;

INSERT INTO productos(id_Prod,Nombre_Prod,Desc_Prod,Prec_Comp,Prec_Vta) VALUES (1,'ROBERLO PASTA DE PULIR R1 1KG','PASTA DE PULIR',10.35,19.15);
INSERT INTO productos(id_Prod,Nombre_Prod,Desc_Prod,Prec_Comp,Prec_Vta) VALUES (2,'ROBERLO MASILLA MULTIEXTENDER 4KG','MASILLA',5.34,9.88);
INSERT INTO productos(id_Prod,Nombre_Prod,Desc_Prod,Prec_Comp,Prec_Vta) VALUES (3,'ROBERLO SILTEX 800 PROTECTOR ANTIGRAVILLA PREMIUM 1KG','PROTECTOR ANTIGRAVILLA',10.2,18.87);
INSERT INTO productos(id_Prod,Nombre_Prod,Desc_Prod,Prec_Comp,Prec_Vta) VALUES (4,'ROBERLO ALUMINIO 1,6KG','ALUMINIO',11.51,21.29);
INSERT INTO productos(id_Prod,Nombre_Prod,Desc_Prod,Prec_Comp,Prec_Vta) VALUES (5,'ROBERLO SILTEX 800 PROTECTOR ANTIGRAVILLA SUBCARROCERIA 1KG','PROTECTOR ANTIGRAVILLA',12.31,22.77);
INSERT INTO productos(id_Prod,Nombre_Prod,Desc_Prod,Prec_Comp,Prec_Vta) VALUES (6,'ROBERLO ABRILLANTADOR ROBERCAR UF 920 1KG','ABRILLANTADOR',5.49,10.16);
INSERT INTO productos(id_Prod,Nombre_Prod,Desc_Prod,Prec_Comp,Prec_Vta) VALUES (7,'ROBERLO UNIX 150 HS BARNIZ ACRILICO 5LT','BARNIZ',13.95,25.81);
INSERT INTO productos(id_Prod,Nombre_Prod,Desc_Prod,Prec_Comp,Prec_Vta) VALUES (8,'ROBERLO KRONOX 3200 BARNIZ ACRILICO 3LT','BARNIZ',12.1,22.39);
INSERT INTO productos(id_Prod,Nombre_Prod,Desc_Prod,Prec_Comp,Prec_Vta) VALUES (9,'ROBERLO GAZA BARNIZADA ATRAPA POLVO X10U.','GAZA BARNIZADA ATRAPA POLVO',7.95,14.71);
INSERT INTO productos(id_Prod,Nombre_Prod,Desc_Prod,Prec_Comp,Prec_Vta) VALUES (10,'ROBERLO PANIO MICROFRIBRA 40X40CM','PANIO',1.51,2.79);
INSERT INTO productos(id_Prod,Nombre_Prod,Desc_Prod,Prec_Comp,Prec_Vta) VALUES (11,'ROBERLO MASILLA VITAL 4KG','MASILLA',6.2,11.47);
INSERT INTO productos(id_Prod,Nombre_Prod,Desc_Prod,Prec_Comp,Prec_Vta) VALUES (12,'ROBERLO CATALIZADOR C356 7,5LT','CATALIZADOR',9.58,17.72);
INSERT INTO productos(id_Prod,Nombre_Prod,Desc_Prod,Prec_Comp,Prec_Vta) VALUES (13,'ROBERLO PINTURA BASE BLUCROM 0,75LT','PINTURA BASE',4.56,8.44);
INSERT INTO productos(id_Prod,Nombre_Prod,Desc_Prod,Prec_Comp,Prec_Vta) VALUES (14,'ROBERLO PINTURA BASE DICROM 1LT','PINTURA BASE',5.25,9.71);
INSERT INTO productos(id_Prod,Nombre_Prod,Desc_Prod,Prec_Comp,Prec_Vta) VALUES (15,'ROBERLO ADITIVO PARA BARNIZ VOC PLUS 1LT','ADITIVO PARA BARNIZ',6.95,12.86);

select * from productos;

INSERT INTO gastos_var(id_GastoServ,id_Servicio,id_depto,id_Prov,Fecha_gasto,Tot_Gasto) VALUES (1,1,4,3,NULL,1200);
INSERT INTO gastos_var(id_GastoServ,id_Servicio,id_depto,id_Prov,Fecha_gasto,Tot_Gasto) VALUES (2,1,4,2,NULL,890);
INSERT INTO gastos_var(id_GastoServ,id_Servicio,id_depto,id_Prov,Fecha_gasto,Tot_Gasto) VALUES (3,1,4,3,NULL,1050);
INSERT INTO gastos_var(id_GastoServ,id_Servicio,id_depto,id_Prov,Fecha_gasto,Tot_Gasto) VALUES (4,2,4,3,NULL,850);
INSERT INTO gastos_var(id_GastoServ,id_Servicio,id_depto,id_Prov,Fecha_gasto,Tot_Gasto) VALUES (5,1,4,3,NULL,1115);
INSERT INTO gastos_var(id_GastoServ,id_Servicio,id_depto,id_Prov,Fecha_gasto,Tot_Gasto) VALUES (6,NULL,1,6,NULL,4600);
INSERT INTO gastos_var(id_GastoServ,id_Servicio,id_depto,id_Prov,Fecha_gasto,Tot_Gasto) VALUES (7,2,4,3,NULL,950);
INSERT INTO gastos_var(id_GastoServ,id_Servicio,id_depto,id_Prov,Fecha_gasto,Tot_Gasto) VALUES (8,2,4,3,NULL,985);
INSERT INTO gastos_var(id_GastoServ,id_Servicio,id_depto,id_Prov,Fecha_gasto,Tot_Gasto) VALUES (9,4,4,3,NULL,2230);
INSERT INTO gastos_var(id_GastoServ,id_Servicio,id_depto,id_Prov,Fecha_gasto,Tot_Gasto) VALUES (10,1,4,3,NULL,1030);
INSERT INTO gastos_var(id_GastoServ,id_Servicio,id_depto,id_Prov,Fecha_gasto,Tot_Gasto) VALUES (11,1,4,2,NULL,825);
INSERT INTO gastos_var(id_GastoServ,id_Servicio,id_depto,id_Prov,Fecha_gasto,Tot_Gasto) VALUES (12,NULL,1,4,NULL,3500);
INSERT INTO gastos_var(id_GastoServ,id_Servicio,id_depto,id_Prov,Fecha_gasto,Tot_Gasto) VALUES (13,NULL,3,7,NULL,3200);
INSERT INTO gastos_var(id_GastoServ,id_Servicio,id_depto,id_Prov,Fecha_gasto,Tot_Gasto) VALUES (14,1,4,2,NULL,955);
INSERT INTO gastos_var(id_GastoServ,id_Servicio,id_depto,id_Prov,Fecha_gasto,Tot_Gasto) VALUES (15,NULL,2,1,NULL,710);

select * from gastos_var;

INSERT INTO ordenes_servicios(id_Ord_Serv,id_Servicio,id_Cliente,id_Empleado,Fecha_Serv,Tot_Serv) VALUES (1,1,6,8,NULL,2515);
INSERT INTO ordenes_servicios(id_Ord_Serv,id_Servicio,id_Cliente,id_Empleado,Fecha_Serv,Tot_Serv) VALUES (2,2,5,8,NULL,3500.5);
INSERT INTO ordenes_servicios(id_Ord_Serv,id_Servicio,id_Cliente,id_Empleado,Fecha_Serv,Tot_Serv) VALUES (3,2,4,8,NULL,3221.2);
INSERT INTO ordenes_servicios(id_Ord_Serv,id_Servicio,id_Cliente,id_Empleado,Fecha_Serv,Tot_Serv) VALUES (4,1,4,8,NULL,3130);
INSERT INTO ordenes_servicios(id_Ord_Serv,id_Servicio,id_Cliente,id_Empleado,Fecha_Serv,Tot_Serv) VALUES (5,2,4,8,NULL,1780.15);
INSERT INTO ordenes_servicios(id_Ord_Serv,id_Servicio,id_Cliente,id_Empleado,Fecha_Serv,Tot_Serv) VALUES (6,1,1,9,NULL,3312.5);
INSERT INTO ordenes_servicios(id_Ord_Serv,id_Servicio,id_Cliente,id_Empleado,Fecha_Serv,Tot_Serv) VALUES (7,1,1,9,NULL,2787.5);
INSERT INTO ordenes_servicios(id_Ord_Serv,id_Servicio,id_Cliente,id_Empleado,Fecha_Serv,Tot_Serv) VALUES (8,4,1,8,NULL,8915.5);
INSERT INTO ordenes_servicios(id_Ord_Serv,id_Servicio,id_Cliente,id_Empleado,Fecha_Serv,Tot_Serv) VALUES (9,3,1,9,NULL,15840);
INSERT INTO ordenes_servicios(id_Ord_Serv,id_Servicio,id_Cliente,id_Empleado,Fecha_Serv,Tot_Serv) VALUES (10,3,2,9,NULL,17620);
INSERT INTO ordenes_servicios(id_Ord_Serv,id_Servicio,id_Cliente,id_Empleado,Fecha_Serv,Tot_Serv) VALUES (11,1,8,9,NULL,2317.5);
INSERT INTO ordenes_servicios(id_Ord_Serv,id_Servicio,id_Cliente,id_Empleado,Fecha_Serv,Tot_Serv) VALUES (12,1,1,9,NULL,2527.5);
INSERT INTO ordenes_servicios(id_Ord_Serv,id_Servicio,id_Cliente,id_Empleado,Fecha_Serv,Tot_Serv) VALUES (13,1,3,8,NULL,1540);
INSERT INTO ordenes_servicios(id_Ord_Serv,id_Servicio,id_Cliente,id_Empleado,Fecha_Serv,Tot_Serv) VALUES (14,2,6,8,NULL,2205.3);
INSERT INTO ordenes_servicios(id_Ord_Serv,id_Servicio,id_Cliente,id_Empleado,Fecha_Serv,Tot_Serv) VALUES (15,2,6,8,NULL,2120.3);
INSERT INTO ordenes_servicios(id_Ord_Serv,id_Servicio,id_Cliente,id_Empleado,Fecha_Serv,Tot_Serv) VALUES (16,3,8,9,NULL,20535);
INSERT INTO ordenes_servicios(id_Ord_Serv,id_Servicio,id_Cliente,id_Empleado,Fecha_Serv,Tot_Serv) VALUES (17,1,10,8,NULL,2687.5);
INSERT INTO ordenes_servicios(id_Ord_Serv,id_Servicio,id_Cliente,id_Empleado,Fecha_Serv,Tot_Serv) VALUES (18,1,9,9,NULL,2198.75);
INSERT INTO ordenes_servicios(id_Ord_Serv,id_Servicio,id_Cliente,id_Empleado,Fecha_Serv,Tot_Serv) VALUES (19,1,2,9,NULL,1775);
INSERT INTO ordenes_servicios(id_Ord_Serv,id_Servicio,id_Cliente,id_Empleado,Fecha_Serv,Tot_Serv) VALUES (20,1,4,8,NULL,2125.35);
INSERT INTO ordenes_servicios(id_Ord_Serv,id_Servicio,id_Cliente,id_Empleado,Fecha_Serv,Tot_Serv) VALUES (21,3,3,8,NULL,18950);
INSERT INTO ordenes_servicios(id_Ord_Serv,id_Servicio,id_Cliente,id_Empleado,Fecha_Serv,Tot_Serv) VALUES (22,1,3,9,NULL,2790);
INSERT INTO ordenes_servicios(id_Ord_Serv,id_Servicio,id_Cliente,id_Empleado,Fecha_Serv,Tot_Serv) VALUES (23,1,1,9,NULL,2612.5);
INSERT INTO ordenes_servicios(id_Ord_Serv,id_Servicio,id_Cliente,id_Empleado,Fecha_Serv,Tot_Serv) VALUES (24,1,2,9,NULL,1693.75);
INSERT INTO ordenes_servicios(id_Ord_Serv,id_Servicio,id_Cliente,id_Empleado,Fecha_Serv,Tot_Serv) VALUES (25,2,9,8,NULL,1835.85);

select * from ordenes_servicios;

INSERT INTO ord_comp(id_OrdComp,id_Prod,id_Prov,id_sucursal,id_depto,Fecha_Comp,Nombre_Prod,Cant_Comp,Prec_Comp,Tot_Comp) VALUES (1,14,3,1,2,NULL,'ROBERLO PINTURA BASE DICROM 1LT',20,5.25,105);
INSERT INTO ord_comp(id_OrdComp,id_Prod,id_Prov,id_sucursal,id_depto,Fecha_Comp,Nombre_Prod,Cant_Comp,Prec_Comp,Tot_Comp) VALUES (2,4,3,1,2,NULL,'ROBERLO ALUMINIO 1,6KG',110,11.51,1266.1);
INSERT INTO ord_comp(id_OrdComp,id_Prod,id_Prov,id_sucursal,id_depto,Fecha_Comp,Nombre_Prod,Cant_Comp,Prec_Comp,Tot_Comp) VALUES (3,7,3,3,2,NULL,'ROBERLO UNIX 150 HS BARNIZ ACRILICO 5LT',70,13.95,976.5);
INSERT INTO ord_comp(id_OrdComp,id_Prod,id_Prov,id_sucursal,id_depto,Fecha_Comp,Nombre_Prod,Cant_Comp,Prec_Comp,Tot_Comp) VALUES (4,1,3,3,2,NULL,'ROBERLO PASTA DE PULIR R1 1KG',80,10.35,828);
INSERT INTO ord_comp(id_OrdComp,id_Prod,id_Prov,id_sucursal,id_depto,Fecha_Comp,Nombre_Prod,Cant_Comp,Prec_Comp,Tot_Comp) VALUES (5,3,3,1,2,NULL,'ROBERLO SILTEX 800 PROTECTOR ANTIGRAVILLA PREMIUM 1KG',120,10.2,1224);
INSERT INTO ord_comp(id_OrdComp,id_Prod,id_Prov,id_sucursal,id_depto,Fecha_Comp,Nombre_Prod,Cant_Comp,Prec_Comp,Tot_Comp) VALUES (6,12,3,3,2,NULL,'ROBERLO CATALIZADOR C356 7,5LT',50,9.58,479);
INSERT INTO ord_comp(id_OrdComp,id_Prod,id_Prov,id_sucursal,id_depto,Fecha_Comp,Nombre_Prod,Cant_Comp,Prec_Comp,Tot_Comp) VALUES (7,14,3,2,5,NULL,'ROBERLO PINTURA BASE DICROM 1LT',30,5.25,157.5);
INSERT INTO ord_comp(id_OrdComp,id_Prod,id_Prov,id_sucursal,id_depto,Fecha_Comp,Nombre_Prod,Cant_Comp,Prec_Comp,Tot_Comp) VALUES (8,14,3,4,5,NULL,'ROBERLO PINTURA BASE DICROM 1LT',40,5.25,210);
INSERT INTO ord_comp(id_OrdComp,id_Prod,id_Prov,id_sucursal,id_depto,Fecha_Comp,Nombre_Prod,Cant_Comp,Prec_Comp,Tot_Comp) VALUES (9,8,3,4,5,NULL,'ROBERLO KRONOX 3200 BARNIZ ACRILICO 3LT',60,12.1,726);
INSERT INTO ord_comp(id_OrdComp,id_Prod,id_Prov,id_sucursal,id_depto,Fecha_Comp,Nombre_Prod,Cant_Comp,Prec_Comp,Tot_Comp) VALUES (10,10,3,1,2,NULL,'ROBERLO PANIO MICROFRIBRA 40X40CM',50,1.51,75.5);
INSERT INTO ord_comp(id_OrdComp,id_Prod,id_Prov,id_sucursal,id_depto,Fecha_Comp,Nombre_Prod,Cant_Comp,Prec_Comp,Tot_Comp) VALUES (11,5,3,3,2,NULL,'ROBERLO SILTEX 800 PROTECTOR ANTIGRAVILLA SUBCARROCERIA 1KG',40,12.31,492.4);
INSERT INTO ord_comp(id_OrdComp,id_Prod,id_Prov,id_sucursal,id_depto,Fecha_Comp,Nombre_Prod,Cant_Comp,Prec_Comp,Tot_Comp) VALUES (12,12,3,2,5,NULL,'ROBERLO CATALIZADOR C356 7,5LT',70,9.58,670.6);
INSERT INTO ord_comp(id_OrdComp,id_Prod,id_Prov,id_sucursal,id_depto,Fecha_Comp,Nombre_Prod,Cant_Comp,Prec_Comp,Tot_Comp) VALUES (13,2,3,4,5,NULL,'ROBERLO MASILLA MULTIEXTENDER 4KG',20,5.34,106.8);
INSERT INTO ord_comp(id_OrdComp,id_Prod,id_Prov,id_sucursal,id_depto,Fecha_Comp,Nombre_Prod,Cant_Comp,Prec_Comp,Tot_Comp) VALUES (14,15,3,3,2,NULL,'ROBERLO ADITIVO PARA BARNIZ VOC PLUS 1LT',30,6.95,208.5);
INSERT INTO ord_comp(id_OrdComp,id_Prod,id_Prov,id_sucursal,id_depto,Fecha_Comp,Nombre_Prod,Cant_Comp,Prec_Comp,Tot_Comp) VALUES (15,14,3,1,3,NULL,'ROBERLO PINTURA BASE DICROM 1LT',65,5.25,341.25);

select * from ord_comp;

INSERT INTO ord_vta(id_OrdVta,id_sucursal,id_Prod,id_Cliente,id_Empleado,Fecha_Vta,Nombre_Prod,Cant_Vta,Prec_Vta,Tot_Vta) VALUES (1,1,3,1,6,NULL,'ROBERLO SILTEX 800 PROTECTOR ANTIGRAVILLA PREMIUM 1KG',1,18.87,18.87);
INSERT INTO ord_vta(id_OrdVta,id_sucursal,id_Prod,id_Cliente,id_Empleado,Fecha_Vta,Nombre_Prod,Cant_Vta,Prec_Vta,Tot_Vta) VALUES (2,1,14,2,3,NULL,'ROBERLO PINTURA BASE DICROM 1LT',1,9.71,9.71);
INSERT INTO ord_vta(id_OrdVta,id_sucursal,id_Prod,id_Cliente,id_Empleado,Fecha_Vta,Nombre_Prod,Cant_Vta,Prec_Vta,Tot_Vta) VALUES (3,1,12,7,4,NULL,'ROBERLO CATALIZADOR C356 7,5LT',3,17.72,53.16);
INSERT INTO ord_vta(id_OrdVta,id_sucursal,id_Prod,id_Cliente,id_Empleado,Fecha_Vta,Nombre_Prod,Cant_Vta,Prec_Vta,Tot_Vta) VALUES (4,1,14,9,3,NULL,'ROBERLO PINTURA BASE DICROM 1LT',5,9.71,48.55);
INSERT INTO ord_vta(id_OrdVta,id_sucursal,id_Prod,id_Cliente,id_Empleado,Fecha_Vta,Nombre_Prod,Cant_Vta,Prec_Vta,Tot_Vta) VALUES (5,3,7,7,5,NULL,'ROBERLO UNIX 150 HS BARNIZ ACRILICO 5LT',1,25.81,25.81);
INSERT INTO ord_vta(id_OrdVta,id_sucursal,id_Prod,id_Cliente,id_Empleado,Fecha_Vta,Nombre_Prod,Cant_Vta,Prec_Vta,Tot_Vta) VALUES (6,3,7,2,5,NULL,'ROBERLO UNIX 150 HS BARNIZ ACRILICO 5LT',2,25.81,51.62);
INSERT INTO ord_vta(id_OrdVta,id_sucursal,id_Prod,id_Cliente,id_Empleado,Fecha_Vta,Nombre_Prod,Cant_Vta,Prec_Vta,Tot_Vta) VALUES (7,3,4,3,3,NULL,'ROBERLO ALUMINIO 1,6KG',2,21.29,42.58);
INSERT INTO ord_vta(id_OrdVta,id_sucursal,id_Prod,id_Cliente,id_Empleado,Fecha_Vta,Nombre_Prod,Cant_Vta,Prec_Vta,Tot_Vta) VALUES (8,1,6,5,4,NULL,'ROBERLO ABRILLANTADOR ROBERCAR UF 920 1KG',1,10.16,10.16);
INSERT INTO ord_vta(id_OrdVta,id_sucursal,id_Prod,id_Cliente,id_Empleado,Fecha_Vta,Nombre_Prod,Cant_Vta,Prec_Vta,Tot_Vta) VALUES (9,1,15,4,6,NULL,'ROBERLO ADITIVO PARA BARNIZ VOC PLUS 1LT',3,12.86,38.58);
INSERT INTO ord_vta(id_OrdVta,id_sucursal,id_Prod,id_Cliente,id_Empleado,Fecha_Vta,Nombre_Prod,Cant_Vta,Prec_Vta,Tot_Vta) VALUES (10,1,3,1,6,NULL,'ROBERLO SILTEX 800 PROTECTOR ANTIGRAVILLA PREMIUM 1KG',1,18.87,18.87);
INSERT INTO ord_vta(id_OrdVta,id_sucursal,id_Prod,id_Cliente,id_Empleado,Fecha_Vta,Nombre_Prod,Cant_Vta,Prec_Vta,Tot_Vta) VALUES (11,3,11,3,4,NULL,'ROBERLO MASILLA VITAL 4KG',1,11.47,11.47);
INSERT INTO ord_vta(id_OrdVta,id_sucursal,id_Prod,id_Cliente,id_Empleado,Fecha_Vta,Nombre_Prod,Cant_Vta,Prec_Vta,Tot_Vta) VALUES (12,3,6,2,4,NULL,'ROBERLO ABRILLANTADOR ROBERCAR UF 920 1KG',4,10.16,40.64);
INSERT INTO ord_vta(id_OrdVta,id_sucursal,id_Prod,id_Cliente,id_Empleado,Fecha_Vta,Nombre_Prod,Cant_Vta,Prec_Vta,Tot_Vta) VALUES (13,3,1,2,3,NULL,'ROBERLO PASTA DE PULIR R1 1KG',3,19.15,57.45);
INSERT INTO ord_vta(id_OrdVta,id_sucursal,id_Prod,id_Cliente,id_Empleado,Fecha_Vta,Nombre_Prod,Cant_Vta,Prec_Vta,Tot_Vta) VALUES (14,1,9,10,6,NULL,'ROBERLO GAZA BARNIZADA ATRAPA POLVO X10U.',2,14.71,29.42);
INSERT INTO ord_vta(id_OrdVta,id_sucursal,id_Prod,id_Cliente,id_Empleado,Fecha_Vta,Nombre_Prod,Cant_Vta,Prec_Vta,Tot_Vta) VALUES (15,1,13,8,5,NULL,'ROBERLO PINTURA BASE BLUCROM 0,75LT',2,8.44,16.88);
INSERT INTO ord_vta(id_OrdVta,id_sucursal,id_Prod,id_Cliente,id_Empleado,Fecha_Vta,Nombre_Prod,Cant_Vta,Prec_Vta,Tot_Vta) VALUES (16,3,13,8,5,NULL,'ROBERLO PINTURA BASE BLUCROM 0,75LT',2,8.44,16.88);
INSERT INTO ord_vta(id_OrdVta,id_sucursal,id_Prod,id_Cliente,id_Empleado,Fecha_Vta,Nombre_Prod,Cant_Vta,Prec_Vta,Tot_Vta) VALUES (17,1,1,8,5,NULL,'ROBERLO PASTA DE PULIR R1 1KG',1,19.15,19.15);
INSERT INTO ord_vta(id_OrdVta,id_sucursal,id_Prod,id_Cliente,id_Empleado,Fecha_Vta,Nombre_Prod,Cant_Vta,Prec_Vta,Tot_Vta) VALUES (18,3,10,3,3,NULL,'ROBERLO PANIO MICROFRIBRA 40X40CM',3,2.79,8.37);
INSERT INTO ord_vta(id_OrdVta,id_sucursal,id_Prod,id_Cliente,id_Empleado,Fecha_Vta,Nombre_Prod,Cant_Vta,Prec_Vta,Tot_Vta) VALUES (19,1,9,1,4,NULL,'ROBERLO GAZA BARNIZADA ATRAPA POLVO X10U.',1,14.71,14.71);
INSERT INTO ord_vta(id_OrdVta,id_sucursal,id_Prod,id_Cliente,id_Empleado,Fecha_Vta,Nombre_Prod,Cant_Vta,Prec_Vta,Tot_Vta) VALUES (20,1,13,5,5,NULL,'ROBERLO PINTURA BASE BLUCROM 0,75LT',1,8.44,8.44);
INSERT INTO ord_vta(id_OrdVta,id_sucursal,id_Prod,id_Cliente,id_Empleado,Fecha_Vta,Nombre_Prod,Cant_Vta,Prec_Vta,Tot_Vta) VALUES (21,3,1,6,6,NULL,'ROBERLO PASTA DE PULIR R1 1KG',3,19.15,57.45);
INSERT INTO ord_vta(id_OrdVta,id_sucursal,id_Prod,id_Cliente,id_Empleado,Fecha_Vta,Nombre_Prod,Cant_Vta,Prec_Vta,Tot_Vta) VALUES (22,3,13,6,6,NULL,'ROBERLO PINTURA BASE BLUCROM 0,75LT',1,8.44,8.44);
INSERT INTO ord_vta(id_OrdVta,id_sucursal,id_Prod,id_Cliente,id_Empleado,Fecha_Vta,Nombre_Prod,Cant_Vta,Prec_Vta,Tot_Vta) VALUES (23,3,1,1,3,NULL,'ROBERLO PASTA DE PULIR R1 1KG',2,19.15,38.3);
INSERT INTO ord_vta(id_OrdVta,id_sucursal,id_Prod,id_Cliente,id_Empleado,Fecha_Vta,Nombre_Prod,Cant_Vta,Prec_Vta,Tot_Vta) VALUES (24,1,13,4,4,NULL,'ROBERLO PINTURA BASE BLUCROM 0,75LT',3,8.44,25.32);
INSERT INTO ord_vta(id_OrdVta,id_sucursal,id_Prod,id_Cliente,id_Empleado,Fecha_Vta,Nombre_Prod,Cant_Vta,Prec_Vta,Tot_Vta) VALUES (25,1,13,2,4,NULL,'ROBERLO PINTURA BASE BLUCROM 0,75LT',4,8.44,33.76);
INSERT INTO ord_vta(id_OrdVta,id_sucursal,id_Prod,id_Cliente,id_Empleado,Fecha_Vta,Nombre_Prod,Cant_Vta,Prec_Vta,Tot_Vta) VALUES (26,1,10,7,5,NULL,'ROBERLO PANIO MICROFRIBRA 40X40CM',5,11.47,57.35);
INSERT INTO ord_vta(id_OrdVta,id_sucursal,id_Prod,id_Cliente,id_Empleado,Fecha_Vta,Nombre_Prod,Cant_Vta,Prec_Vta,Tot_Vta) VALUES (27,3,13,7,3,NULL,'ROBERLO PINTURA BASE BLUCROM 0,75LT',2,8.44,16.88);
INSERT INTO ord_vta(id_OrdVta,id_sucursal,id_Prod,id_Cliente,id_Empleado,Fecha_Vta,Nombre_Prod,Cant_Vta,Prec_Vta,Tot_Vta) VALUES (28,1,13,8,3,NULL,'ROBERLO PINTURA BASE BLUCROM 0,75LT',2,8.44,16.88);
INSERT INTO ord_vta(id_OrdVta,id_sucursal,id_Prod,id_Cliente,id_Empleado,Fecha_Vta,Nombre_Prod,Cant_Vta,Prec_Vta,Tot_Vta) VALUES (29,3,1,2,4,NULL,'ROBERLO PASTA DE PULIR R1 1KG',1,19.15,19.15);
INSERT INTO ord_vta(id_OrdVta,id_sucursal,id_Prod,id_Cliente,id_Empleado,Fecha_Vta,Nombre_Prod,Cant_Vta,Prec_Vta,Tot_Vta) VALUES (30,3,8,3,5,NULL,'ROBERLO KRONOX 3200 BARNIZ ACRILICO 3LT',1,22.39,22.39);

select * from ord_vta;

DELIMITER //
INSERT INTO Inventario (id_Prod, Nombre_Prod, Cant_disp) 
SELECT id_Prod, Nombre_Prod, SUM(Cant_Comp) FROM Ord_Comp GROUP BY id_prod;
//

-- -----------------------------------------------------
-- CREACION DE FUNCIONES
-- -----------------------------------------------------

DELIMITER //
CREATE FUNCTION TOTAL (cantidad int, precio decimal(65,2)) RETURNS decimal (65,2)
DETERMINISTIC
BEGIN
DECLARE Resultado decimal (65,2);
	SET Resultado = cantidad*precio;
	RETURN Resultado;
END;
//

SELECT TOTAL (Cant_Vta, Prec_Vta) from ord_vta;


DELIMITER //
CREATE FUNCTION IVA21 (precio decimal(65,2)) RETURNS decimal (65,2)
DETERMINISTIC
BEGIN
DECLARE Resultado decimal (65,2);
	SET Resultado = precio*0.21;
	RETURN Resultado;
END;
//

SELECT IVA21 (Prec_Vta) from ord_vta;

DELIMITER //
CREATE FUNCTION IVA10_5 (precio decimal(65,2)) RETURNS decimal (65,2)
DETERMINISTIC
BEGIN
DECLARE Resultado decimal (65,2);
	SET Resultado = precio*0.105;
	RETURN Resultado;
END;
//

SELECT IVA10_5 (Prec_Vta) from ord_vta;


DELIMITER //
CREATE FUNCTION SUCURSAL (id int) RETURNS varchar (30)
DETERMINISTIC
BEGIN
DECLARE ubicacion_s varchar (30);
	SET ubicacion_s = (SELECT CONCAT(id_sucursal, ' - ', ubicacion) from proyecto_baibiene.sucursales where id_sucursal=id) ;
	RETURN ubicacion_s;
END;
//

SELECT SUCURSAL (id_sucursal), id_empleado, Nombre, Apellido, salario  FROM empleados;

-- -----------------------------------------------------
-- CREACION DE TABLAS VISTA
-- -----------------------------------------------------
DELIMITER //
CREATE VIEW `proyecto_baibiene`.`SalariosXdepto` AS
(SELECT 
    T1.Nombre_dep AS Departamento, TRUNCATE(AVG(T2.salario),2) AS Salario_Prom, SUM(T2.salario) AS Total_salarios_mes 
FROM departamentos AS T1 
LEFT JOIN empleados AS T2
    ON T1.id_depto = T2.id_depto 
GROUP BY T1.id_depto, T1.Nombre_dep
ORDER BY Total_salarios_mes DESC);

//


DELIMITER //
CREATE VIEW `proyecto_baibiene`.`Ventas_empleados` AS
(SELECT 
    T1.id_Empleado, T1.Nombre, T1.Apellido, COUNT(T2.id_Empleado) AS Cant_Ventas, SUM(TOTAL(T2.Cant_Vta, T2.Prec_Vta)) AS Total_Ventas
FROM Empleados AS T1
LEFT JOIN ord_vta AS T2
    ON T1.id_Empleado = T2.id_Empleado
GROUP BY T1.Nombre, T1.Apellido
ORDER BY Total_Ventas DESC);
//


DELIMITER //
CREATE VIEW `proyecto_baibiene`.`Servicios_Empleados` AS
(SELECT 
    T1.id_Empleado, T1.Nombre, T1.Apellido, COUNT(T2.id_Empleado) AS Cant_serv, SUM(Tot_Serv) AS Total_serv
FROM Empleados AS T1
LEFT JOIN ordenes_servicios AS T2
    ON T1.id_Empleado = T2.id_Empleado
GROUP BY T1.Nombre, T1.Apellido
ORDER BY Total_serv DESC);
//


DELIMITER //
CREATE VIEW `proyecto_baibiene`.`Ranking_Vta_Prod` AS
(SELECT 
    T1.id_Prod, T1.Nombre_Prod, COUNT(T2.id_Prod) AS Cant_Vendido, SUM(TOTAL(T2.Cant_Vta, T2.Prec_Vta)) AS Total_vendido, SUM(IVA21(TOTAL(T2.Cant_Vta, T2.Prec_Vta))) AS IVA
FROM Productos AS T1
LEFT JOIN ord_vta AS T2
    ON T1.id_Prod = T2.id_Prod
GROUP BY T1.id_Prod, T1.Nombre_Prod
ORDER BY Total_vendido DESC);
//


DELIMITER //
CREATE VIEW `proyecto_baibiene`.`Ranking_Comp_Prod` AS
(SELECT 
    T1.id_Prod, T1.Nombre_Prod, COUNT(T2.id_Prod) AS Cant_Ordenes, SUM(TOTAL(T2.Cant_Comp, T2.Prec_Comp)) AS Total_comprado
FROM Productos AS T1
LEFT JOIN ord_comp AS T2
    ON T1.id_Prod = T2.id_Prod
GROUP BY T1.id_Prod, T1.Nombre_Prod
ORDER BY Total_comprado DESC);
//

select * from SalariosXdepto; 
select * from Servicios_Empleados; 
select * from Ranking_Vta_Prod; 
select * from Ranking_Comp_Prod; 

USE `proyecto_baibiene` ;

-- -----------------------------------------------------
-- IMPLEMENTACION STORED PROCEDURES
-- -----------------------------------------------------

/*Este primer SP lo hice con el fin de probar las funciones substring_index. Tiene partes redundantes y que podrían hacerse
con otros comandos y mayor facilidad pero elegí hacerlos de esta forma por una cuestion de entender la lógica detras de esta sentencia
la idea es que en el parámetro se inserte el nombre del producto que se desea buscar y el retorno es la cantidad de tipos de productos 
igual nombre.
*/
DELIMITER //
CREATE PROCEDURE `Buscar_productos` (IN Cat Varchar(200))
BEGIN
SELECT substring_index (substring_index(Desc_Prod,' ',1), Desc_Prod, -2) Categoria, COUNT(*) Cantidad, Prec_Comp, Prec_Vta FROM Productos 
WHERE substring_index (substring_index(Desc_Prod,' ',1), Desc_Prod, -2)= cat
GROUP BY  substring_index (substring_index(Desc_Prod,' ',1), Desc_Prod, -2);
END;
//

CALL Buscar_productos('PINTURA');
CALL Buscar_productos('MASILLA');



/*El segundo SP es el que pide la consigna, tiene dos parámetros y puede utilizarse para otras tablas pero yo decidí hacerlo con la de
productos. Los parámetros son: la columna por la que se desea "filtrar" los resultados y el segundo es si ese orden es ascendente o
descendente. Al final de la creación del SP está el ejemplo de ordenar por los precios de compra, venta o también el nombre del producto
*/
DELIMITER //
CREATE PROCEDURE `Ordenar_productos` (IN Desc_Prod char(20), IN OrdenAoD ENUM('ASC', 'DESC'))
BEGIN
IF Desc_Prod <> '' THEN
	SET @ORDENAMIENTO = CONCAT(' ORDER BY ', Desc_Prod);
ELSE
	SET @ORDENAMIENTO = '';
   END IF;
IF OrdenAoD <> '' THEN
	SET @AoD = CONCAT(' ', OrdenAoD);
ELSE SET @AoD = '';
	END IF;
SET @CLAUSULA = CONCAT('SELECT * FROM Productos', @ORDENAMIENTO, @AoD);
PREPARE EjecutarSQL FROM @CLAUSULA;
EXECUTE EjecutarSQL;
DEALLOCATE PREPARE EjecutarSQL;
END;
//

CALL Ordenar_productos ("Prec_Comp", "DESC");
CALL Ordenar_productos ("Prec_Comp", "ASC");

CALL Ordenar_productos ("Prec_Vta", "DESC");
CALL Ordenar_productos ("Prec_Vta", "ASC");


CALL Ordenar_productos ("Desc_Prod", "ASC");
CALL Ordenar_productos ("Desc_Prod", "DESC");



/*El tercer SP es el de inserción pedido por la consigna. Lo hice sobre la tabla "clientes" y la idea es la misma que la vista en clase. 
Al introducir un CUIT que se encuentra repetido retorna una advertencia y no lo inserta. Se agregaron los parametros de Razon Social
y Condicion frente al IVA para hacer mas completo al procedure
*/

DELIMITER //
CREATE PROCEDURE `CUIT_Repetido` (IN Raz_Soc varchar(60), IN CUIT varchar(11), CondicionIVA varchar(30))
BEGIN 
IF (SELECT COUNT(*) FROM Clientes WHERE CUIT_Cl=CUIT )>0 THEN 
	   SELECT 'CUIT REPETIDO';
ELSE 
    INSERT INTO Clientes (Razon_Soc_Cl, CUIT_Cl, Cond_IVA_Cl) VALUES (Raz_Soc, CUIT, CondicionIVA);
END IF ;
END;
//

call CUIT_Repetido("JOSE BAIBIENE", "30406438717", "RESP_INSC"); /* Inserción de un Cliente (con CUIT único) nuevo*/
call CUIT_Repetido("JOSE BAIBIENE", "30406438717", "RESP_INSC"); /* Mensaje cuando el CUIT es repetido*/

SELECT * FROM CLIENTES; /*En la última fila se guarda el nuevo cliente */



-- -----------------------------------------------------
-- IMPLEMENTACION DE TRIGGERS
-- -----------------------------------------------------

/*Trigger Bitácora para nuevas ventas y ver que usuario las carga*/

CREATE TRIGGER `Registro_Vta`AFTER INSERT ON Ord_Vta FOR EACH ROW
INSERT INTO Usuarios_Venta (Fecha_Modif, Nombre_Usuario, Nueva_Orden_Venta, Operacion)
VALUES (NOW(), SESSION_USER(), NEW.id_OrdVta, 'Nueva orden de venta');

INSERT INTO ord_vta(id_sucursal,id_Prod,id_Cliente,id_Empleado,Fecha_Vta,Nombre_Prod,Cant_Vta,Prec_Vta,Tot_Vta) VALUES (1,14,2,3,NULL,'ROBERLO PINTURA BASE DICROM 1LT',1,9.71,9.71);

SELECT * FROM Ord_Vta;
SELECT * FROM Usuarios_Venta;



/*Trigger Bitácora para nuevas compras y ver que usuario las carga*/

CREATE TRIGGER `Registro_Comp`AFTER INSERT ON Ord_Comp FOR EACH ROW
INSERT INTO Usuarios_Compra (Fecha_Modif, Nombre_Usuario, Nueva_Orden_Compra, Operacion)
VALUES (NOW(), SESSION_USER(), NEW.id_OrdComp, 'Nueva orden de Compra');

INSERT INTO ord_comp(id_Prod,id_Prov,id_sucursal,id_depto,Fecha_Comp,Nombre_Prod,Cant_Comp,Prec_Comp,Tot_Comp) VALUES (5,3,3,2,NULL,'ROBERLO SILTEX 800 PROTECTOR ANTIGRAVILLA SUBCARROCERIA 1KG',40,12.31,492.4);


SELECT * FROM Ord_Comp;
SELECT * FROM Usuarios_Compra;



/*Trigger LOG para ver actualizaciones de salarios*/
/*Este Trigger guarda el valor anterior y lo almacena en una columna junto con el nuevo para poder compararlos*/

CREATE TRIGGER `Registro_Salarios` AFTER UPDATE ON Empleados FOR EACH ROW
INSERT INTO Usuarios_Salarios (Fecha_Modif, Nombre_Usuario, id_Empleado, Salario_Ant, Salario_Nuevo, Operacion)
VALUES (NOW(), SESSION_USER(),OLD.id_empleado, OLD.Salario, NEW.Salario, 'Actualizacion de salario');

UPDATE Empleados SET Salario=150000 WHERE id_empleado=2;

SELECT * FROM Empleados;
SELECT * FROM Usuarios_Salarios;



/*TRIGGER DE ACTUALIZACIÓN CUANDO HAY COMPRA*/

DELIMITER //
 CREATE TRIGGER `Stock_Update_Compra`
 AFTER INSERT ON Ord_Comp 
 FOR EACH ROW 
  BEGIN 
    UPDATE Inventario 
      SET Cant_disp = Cant_disp + NEW.Cant_Comp
    WHERE Inventario.id_Prod = New.id_Prod;
  END;
//


/*TRIGGER DE ACTUALIZACIÓN CUANDO HAY VENTA*/

DELIMITER //
 CREATE TRIGGER `Stock_Update_Venta`
 AFTER INSERT ON Ord_vta 
 FOR EACH ROW 
  BEGIN 
    UPDATE Inventario 
      SET Cant_disp = Cant_disp - NEW.Cant_Vta
    WHERE Inventario.id_Prod = New.id_Prod;
  END;
//


INSERT INTO ord_comp(id_Prod,id_Prov,id_sucursal,id_depto,Fecha_Comp,Nombre_Prod,Cant_Comp,Prec_Comp,Tot_Comp) VALUES (1,3,3,2,NULL,'ROBERLO PASTA DE PULIR R1 1KG',80,10.35,828);
//
INSERT INTO ord_vta(id_sucursal,id_Prod,id_Cliente,id_Empleado,Fecha_Vta,Nombre_Prod,Cant_Vta,Prec_Vta,Tot_Vta) VALUES (3,1,2,3,NULL,'ROBERLO PASTA DE PULIR R1 1KG',3,19.15,57.45);
//
SELECT * FROM INVENTARIO;


-- -----------------------------------------------------
-- CREACION DE USUARIOS
-- -----------------------------------------------------

USE `mysql`;
SHOW tables;

SELECT * FROM user;

/*Usuario 1 creado para utilización de la gerencia, solamente tendrá permisos de lectura sobre las tablas de la base de datos*/
CREATE USER 'Usuario1'@'Gerencia' IDENTIFIED BY '1234'; 

/*Usuario 2 creado para utilización del area de administración. 
Tendrá permisos de lectura, inserción y actualización de datos sobre las tablas*/
CREATE USER 'Usuario2'@'Administracion' IDENTIFIED BY '1234';

SELECT * FROM mysql.user WHERE user = 'Usuario1' OR user = 'Usuario2'; 

/*Se otorga el permiso de lectura sobre las tablas al usuario que va a ser utilizado por el area de gerencia de la empresa*/
GRANT SELECT ON *.* TO 'Usuario1'@'Gerencia'; 

/*Se otorga el permiso de lectura sobre las tablas al usuario que va a ser utilizado por el area de administración*/
GRANT SELECT ON *.* TO 'Usuario2'@'Administracion'; 

/*Se otorga el permiso de inserción de datos sobre las tablas al usuario que va a ser utilizado por el area de administración*/
GRANT INSERT ON *.* TO 'Usuario2'@'Administracion'; 

/*Se otorga el permiso de modificación de datos sobre las tablas al usuario que va a ser utilizado por el area de administración*/
GRANT UPDATE ON *.* TO 'Usuario2'@'Administracion'; 

SELECT * FROM mysql.user WHERE user = 'Usuario1' OR user = 'Usuario2';


USE `Proyecto_Baibiene`;
//

-- -----------------------------------------------------
-- SENTENCIAS TCL
-- -----------------------------------------------------

SET AUTOCOMMIT = 0;
SELECT @@AUTOCOMMIT;


/*CONSIGNA 1*/
/*Se crea un savepoint previo a la eliminación de registros y posteriormente se vuelve con un ROLLBACK al estado original. Posteriormente
se decide finalmente eliminar los registros y se utiliza la sentencia COMMIT para que queden permanentes en la base de datos. Estas 
operaciones se realizan sobre la tabla de Ordenes de Venta 
*/

START TRANSACTION;
SAVEPOINT `SAVE1`;

DELETE FROM Ord_Vta WHERE id_OrdVta = 29;
DELETE FROM Ord_Vta WHERE id_OrdVta = 30;
DELETE FROM Ord_Vta WHERE id_OrdVta = 31;

ROLLBACK TO `SAVE1`;

SELECT * FROM Ord_Vta;

DELETE FROM Ord_Vta WHERE id_OrdVta = 29;
DELETE FROM Ord_Vta WHERE id_OrdVta = 30;
DELETE FROM Ord_Vta WHERE id_OrdVta = 31;
COMMIT;

SELECT * FROM Ord_Vta;


/*CONSIGNA 2*/
/*Se insertan 8 registros en la tabla de órdenes de compra con 2 SAVEPOINTS en el medio. Por último al final de las inserciones se
elimina el savepoint generado en las primeras 4 transacciones, por lo que no será posible volver a este punto (inserciones 1 a 4)
*/

START TRANSACTION;
SAVEPOINT `SAVEJOSE`;
INSERT INTO ord_comp(id_Prod,id_Prov,id_sucursal,id_depto,Fecha_Comp,Nombre_Prod,Cant_Comp,Prec_Comp,Tot_Comp) VALUES (14,3,1,2,NOW(),'ROBERLO PINTURA BASE DICROM 1LT',20,5.25,105);
INSERT INTO ord_comp(id_Prod,id_Prov,id_sucursal,id_depto,Fecha_Comp,Nombre_Prod,Cant_Comp,Prec_Comp,Tot_Comp) VALUES (4,3,1,2,NOW(),'ROBERLO ALUMINIO 1,6KG',110,11.51,1266.1);
INSERT INTO ord_comp(id_Prod,id_Prov,id_sucursal,id_depto,Fecha_Comp,Nombre_Prod,Cant_Comp,Prec_Comp,Tot_Comp) VALUES (7,3,3,2,NOW(),'ROBERLO UNIX 150 HS BARNIZ ACRILICO 5LT',70,13.95,976.5);
INSERT INTO ord_comp(id_Prod,id_Prov,id_sucursal,id_depto,Fecha_Comp,Nombre_Prod,Cant_Comp,Prec_Comp,Tot_Comp) VALUES (1,3,3,2,NOW(),'ROBERLO PASTA DE PULIR R1 1KG',80,10.35,828);
SAVEPOINT `SAVE2`;

INSERT INTO ord_comp(id_Prod,id_Prov,id_sucursal,id_depto,Fecha_Comp,Nombre_Prod,Cant_Comp,Prec_Comp,Tot_Comp) VALUES (3,3,1,2,NOW(),'ROBERLO SILTEX 800 PROTECTOR ANTIGRAVILLA PREMIUM 1KG',120,10.2,1224);
INSERT INTO ord_comp(id_Prod,id_Prov,id_sucursal,id_depto,Fecha_Comp,Nombre_Prod,Cant_Comp,Prec_Comp,Tot_Comp) VALUES (12,3,3,2,NOW(),'ROBERLO CATALIZADOR C356 7,5LT',50,9.58,479);
INSERT INTO ord_comp(id_Prod,id_Prov,id_sucursal,id_depto,Fecha_Comp,Nombre_Prod,Cant_Comp,Prec_Comp,Tot_Comp) VALUES (14,3,2,5,NOW(),'ROBERLO PINTURA BASE DICROM 1LT',30,5.25,157.5);
INSERT INTO ord_comp(id_Prod,id_Prov,id_sucursal,id_depto,Fecha_Comp,Nombre_Prod,Cant_Comp,Prec_Comp,Tot_Comp) VALUES (14,3,4,5,NOW(),'ROBERLO PINTURA BASE DICROM 1LT',40,5.25,210);
SAVEPOINT `SAVE3`;

RELEASE SAVEPOINT `SAVE2`;

SELECT * FROM Ord_Comp;
