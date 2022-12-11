
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