
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

