-- ESQUEMA-- 
create schema linea_emprendimientos;

use linea_emprendimientos;
 
 -- TABLAS--
create table formularios (
id_formulario int not null auto_increment, 
fecha_carga date,
estado int,
id_postulante int,
presenta_garante boolean,
primary key (id_formulario)
);

 create table postulantes(
id_postulante int not null auto_increment,
nombre varchar (45),
apellido varchar(100), 
dni int,
cuil double,
email varchar(150),
localidad varchar (150),
id_localidad int,
presenta_recibo boolean,
primary key (id_postulante)
); 

create table estados (
id_estado int not null auto_increment,
descripcion varchar(200),
observacion varchar(200),
primary key (id_estado)
); 

create table seguimientos (
id_seguimiento int auto_increment not null,
id_formulario int,
id_estados int,
id_cuotas int,
fecha_seguimiento date ,
primary key (id_seguimiento) 
);

create table planes_cuota (
id_cuota int not null auto_increment, 
finaliza_pago boolean,
sucursal_cobro int,
cant_cuotas int,
id_formulario int,
primary key (id_cuota)
);  


  create table sucursales (
id_sucursal  int not null auto_increment,
banco varchar (45),
direccion varchar (200),
localidad int, 
primary key (id_sucursal)
); 


create table localidades (
id_localidad int auto_increment not null, 
nombre_localidad varchar(200),
codigo_postal int,
departamento int, 
primary key (id_localidad)
); 

CREATE TABLE departamentos (
  id INT PRIMARY KEY auto_increment,
  nombre_departamento VARCHAR(150) NOT NULL
);

-- Insercion de datos-- 

-- TABLA POSTULANTES--
select * from postulantes;

INSERT INTO postulantes (nombre, apellido, dni, cuil, email, localidad,id_localidad, presenta_recibo) VALUES 
('Juan', 'Perez', 12345678, 20345678901, 'jperez@gmail.com', 'Cordoba',1, true),
('Ana', 'González', 23456789, 20345678902, 'agonzalez@yahoo.com', 'Cordoba',1, false),
('Pedro', 'López', 34567890, 20345678903, 'plopez@hotmail.com', 'Villa Maria',2, true),
('María', 'Rodríguez', 45678901, 20345678904, 'mrodriguez@gmail.com', 'Las perdices',3, true),
('Carlos', 'Gómez', 56789012, 20345678905, 'cgomez@gmail.com', 'Rio Cuarto',4, false),
('Lucía', 'Fernández', 67890123, 20345678906, 'lfernandez@yahoo.com', 'Rio Cuarto',4, true),
('Martín', 'Gutiérrez', 78901234, 20345678907, 'mgutierrez@hotmail.com', 'San Francisco',5, false),
('Mariana', 'Díaz', 89012345, 20345678908, 'mdiaz@gmail.com', 'Alta Gracia',6, true),
('Federico', 'Alvarez', 90123456, 20345678909, 'falvarez@yahoo.com', 'Salsipuedes',7, false),
('Lorena', 'Suarez', 12345678, 20345678910, 'lsuarez@gmail.com', 'Villa Allende',8, true),
('Andrés', 'Ríos', 23456789, 20345678911, 'arios@yahoo.com', 'Cura Brochero',9, false),
('Luisa', 'Vega', 34567890, 20345678912, 'lvega@hotmail.com', 'Miona Clavero',10, true),
('Gustavo', 'Moreno', 45678901, 20345678913, 'gmoreno@gmail.com', 'Almafuerte',11, true),
('Valeria', 'Castro', 56789012, 20345678914, 'vcastro@gmail.com', 'Arias',12, false),
('Diego', 'Acosta', 67890123, 20345678915, 'dacosta@yahoo.com', 'Isla Verde',13, true),
('Carla', 'García', 78901234, 20345678916, 'cgarcia@hotmail.com', 'Camilo Aldao',14, false),
('Jorge', 'Rojas', 89012345, 20345678917, 'jrojas@gmail.com', 'Noetinger',15, true),
('Mónica', 'Vargas', 90123456, 20345678918, 'mvargas@yahoo.com', 'Cuesta Blanca',16, false),
('Oscar', 'Ferrer', 12345678, 20345678919, 'oferrer@gmail.com', 'Rio Cuarto',4, true),
('Gisela', 'Benítez', 23456789, 20345678920, 'gbenitez@yahoo.com', 'Cordoba',1, false),
('Lucas', 'Aguilar', 34567890, 20345678921, 'laguilar@hotmail.com', 'Villa María',2, true) 
;

-- TABLA SUCURSALES-- 
 select * from sucursales;

INSERT INTO sucursales (banco, direccion,localidad) VALUES
('Banco Santander', 'Av. Corrientes 1234',1),
('BBVA', 'Av. Córdoba 456',2),
('Banco Galicia', 'Av. Cabildo 678',3),
('Banco Macro', 'Av. Callao 901',5),
('Banco Provincia', 'Av. 7 N° 776',4),
('Banco Nación', 'Av. Rivadavia 1234',6),
('Banco HSBC', 'Av. Pellegrini 987',7),
('Banco Francés', 'Av. Santa Fe 456',10),
('Banco Patagonia', 'Av. Lago del Desierto 234',11),
('Banco Supervielle', 'Av. Belgrano 789',8);


-- TABLA ESTADOS-- 
select * from estados;

INSERT INTO estados (descripcion, observacion) VALUES
('Nueva', 'La postulación es nueva y aún no ha sido revisada'),
('En revisión', 'La postulación se encuentra en revisión'),
('Aprobada', 'La postulación ha sido aprobada'),
('Rechazada', 'La postulación ha sido rechazada'),
('espera documentos', 'Falta algún documento para completar la postulación'),
('espera pago', 'Falta realizar el pago correspondiente'),
('Cancelada por el solicitante', 'La postulación ha sido cancelada por el solicitante'),
('Cancelada por el sistema', 'La postulación ha sido cancelada por el sistema')
;

-- TABLA DEPARTAMENTOS-- 
select * from departamentos;

INSERT INTO departamentos (nombre_departamento) VALUES
('Capital'),
('General San Martín'),
('Juárez Celman'),
('Río Cuarto'),
('San Justo'),
('Santa María'),
('Colón'),
('San Alberto'),
('San Javier'),
('Tercero Arriba'),
('Marcos Juárez'),
('Santa María');

-- TABLA LOCALIDADES-- 
select * from localidades; 

INSERT INTO localidades (nombre_localidad, codigo_postal, departamento) VALUES
('Córdoba', 5000, '1'),
('Villa María', 5900, '2'),
('Las Perdices', 2674, '3'),
('Río Cuarto', 5800, '4'),
('San Francisco', 2400, '5'),
('Alta Gracia', 5186, '6'),
('Salsipuedes', 5113, '7'),
('Villa Allende', 5105, '7'),
('Cura Brochero', 5891, '8'),
('Mina Clavero', 5889, '8'),
('Almafuerte', 5854, '10'),
('Arias', 2585, '13'),
('Isla Verde', 2671, '11 '),
('Camilo Aldao', 2583, '11 '),
('Notinger', 5107, '7'),
('Cuesta Blanca', 5152, '14');

-- TABLA FORMULARIOS--
select * from formularios;

  INSERT INTO formularios (fecha_carga, estado, id_postulante, presenta_garante) VALUES 
('2022-01-01', 1, 1, true),
('2022-01-02', 2, 2, false),
('2022-01-03', 3, 3, true),
('2022-01-04', 4, 4, false),
('2022-01-05', 5, 5, true),
('2022-01-06', 6, 6, false),
('2022-01-07', 7, 7, true),
('2022-01-08', 8, 8, false),
('2022-01-09', 1, 9, true),
('2022-01-10', 2, 10, false),
('2022-01-11', 3, 11, true),
('2022-01-12', 4, 12, false),
('2022-01-13', 5, 13, true),
('2022-01-14', 6, 14, false),
('2022-01-15', 7, 15, true),
('2022-01-16', 8, 16, false),
('2022-01-17', 1, 17, true),
('2022-01-18', 2, 18, false),
('2022-01-19', 3, 19, true),
('2022-01-20', 4, 20, false),
('2022-01-21', 5, 21, true),
('2022-01-22', 6, 1, false),
('2022-01-23', 7, 2, true),
('2022-01-24', 8, 3, false),
('2022-01-25', 1, 4, true),
('2022-01-26', 2, 5, false),
('2022-01-27', 3, 6, true),
('2022-01-28', 4, 7, false),
('2022-01-29', 5, 8, true),
('2022-01-30', 6, 9, false),
('2022-01-31', 7, 10, true),
('2022-02-01', 8, 11, false),
('2022-02-02', 1, 12, true),
('2022-02-03', 2, 13, false),
('2022-02-04', 3, 14, true),
('2022-02-05', 4, 15, false),
('2022-02-06', 5, 16, true),
('2022-02-07', 6, 17, false),
('2022-02-08', 7, 18, true),
('2022-02-09', 8, 19, false),
('2022-02-10', 1, 20, true),
('2022-02-11', 2, 21, false),
('2022-02-12', 3, 1, true),
('2022-02-13', 4, 2, false),
('2022-02-14',4,2,false), 
('2022-02-15',5,8,true),
('2022-02-16',2,16,false),
('2022-02-17',3,21,true),
('2022-02-18',7,11,true),
('2022-02-19',1,10,false),
('2022-02-20',8,15,true),
('2022-02-21',2,20,false),
('2022-02-22',1,15,true),
('2022-02-23',4,12,false),
('2022-02-24',7,2,true),
('2022-02-25',1,1,false),
('2022-02-26',5,3,false),
('2022-02-27',5,2,false),
('2022-02-28',8,1,true),
('2022-03-01',3,18,false),
('2022-03-02',8,10,false),
('2022-03-03',2,12,true);

        
 -- PLANES_CUOTA-- 
 
 select * from planes_cuota;
 
INSERT INTO planes_cuota (id_formulario, finaliza_pago) 
VALUES 
(4, true),
(7, false),
(3, true),
(4, false),
(11, false),
(27, false),
(35, true);


-- CONSTRAINTS --
 
-- FORMULARIOS -- 
ALTER TABLE `linea_emprendimientos`.`formularios` 
ADD CONSTRAINT `id_postulante`
  FOREIGN KEY (`id_postulante`)
  REFERENCES `linea_emprendimientos`.`postulantes` (`id_postulante`); 
  
  ALTER TABLE `linea_emprendimientos`.`formularios` 
ADD CONSTRAINT `id_estados`
  FOREIGN KEY (`estado`)
  REFERENCES `linea_emprendimientos`.`estados` (`id_estado`);


  -- SEGUIMIENTOS -- 
ALTER TABLE `linea_emprendimientos`.`seguimientos` 
ADD CONSTRAINT `id_formulario`
  FOREIGN KEY (`id_formulario`)
  REFERENCES `linea_emprendimientos`.`formularios` (`id_formulario`);
  
ALTER TABLE `linea_emprendimientos`.`seguimientos` 
ADD CONSTRAINT `id_estado`
  FOREIGN KEY (`id_estados`)
 REFERENCES `linea_emprendimientos`.`estados` (`id_estado`);
 
 ALTER TABLE `linea_emprendimientos`.`seguimientos` 
ADD CONSTRAINT `id_cuota`
  FOREIGN KEY (`id_cuotas`)
  REFERENCES `linea_emprendimientos`.`planes_cuota` (`id_cuota`);
 

-- SUCURSALES--  
ALTER TABLE `linea_emprendimientos`.`sucursales` 
ADD CONSTRAINT `localidad_sucursal`
  FOREIGN KEY (`localidad`)
  REFERENCES `linea_emprendimientos`.`localidades` (`id_localidad`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
  -- POSTULANTES--
  ALTER TABLE `linea_emprendimientos`.`postulantes` 
ADD INDEX `localidad_idx` (`id_localidad` ASC) VISIBLE;
ALTER TABLE `linea_emprendimientos`.`postulantes` 
ADD CONSTRAINT `localidad`
  FOREIGN KEY (`id_localidad`)
  REFERENCES `linea_emprendimientos`.`localidades` (`id_localidad`);
  
  -- DEPARTAMENTOS-- 
  ALTER TABLE `linea_emprendimientos`.`localidades` 
  ADD INDEX `depto_idx` (`departamento` ASC) VISIBLE;
 ALTER TABLE `linea_emprendimientos`.`departamentos` 
ADD CONSTRAINT `depto_localidad`
  FOREIGN KEY (`id`)
  REFERENCES `linea_emprendimientos`.`localidades` (`id_localidad`);

  
  -- VISTAS -- 
  
  -- Formularios segun postulante

create view VT_formularios_postulante as 
select p.nombre,p.apellido,p.dni, f.*
from formularios as f
join postulantes p on f.id_postulante=p.id_postulante
;

select * from vt_formularios_postulante;

-- estado de los postulantes-- 

create view VT_estados_postulantes as 
select p.nombre,p.apellido,p.dni,p.localidad, f.estado,f.id_formulario, e.descripcion,e.observacion
from formularios f
join postulantes p on f.id_postulante=p.id_postulante
join estados e on f.estado= e.id_estado;

select * from vt_estados_postulantes where estado ='3';

-- sucursales segun localidad--

drop view if exists VT_sucursales_localidad;  
create view VT_sucursales_localidad as
select p.nombre,p.apellido,p.dni,l.nombre_localidad,s.banco,s.direccion, d.nombre_departamento
from postulantes p
join localidades l on p.id_localidad=l.id_localidad
join sucursales s on l.id_localidad=s.localidad 
join departamentos d on l.departamento=d.id; 

select * from vt_sucursales_localidad;

  
  -- cuotas segun formulario--
drop view if exists vt_cuotas_formulario;

create view vt_cuotas_formulario as
select p.apellido,p.nombre , pc.cant_cuotas, f.id_formulario, pc.finaliza_pago
from formularios f
join planes_cuota pc on pc.id_formulario=f.id_formulario
join postulantes p on p.id_postulante=f.id_postulante;  

select * from vt_cuotas_formulario;

-- Rechazados-- 
create view Rechazados as 
select * from formularios where estado='4';

select * from Rechazados;

-- FUNCIONES-- 
-- CANTIDAD DE FORMULARIOS SEGUN ID_ESTADO-- 

DELIMITER $$
USE `linea_emprendimientos`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `conteo_formularios_estados`(id_estado int) 
RETURNS int
    DETERMINISTIC
BEGIN
  DECLARE contador INT;
  SELECT COUNT(*) INTO contador FROM formularios WHERE estado= id_estado group by estado;
  RETURN contador;
END$$

DELIMITER ;

-- ESTADO DEL FORMULARIO--

DELIMITER $$
USE `linea_emprendimientos`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `obtener_estado`(id INT) RETURNS varchar(200) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
  DECLARE estado VARCHAR (200);
  SELECT estados.descripcion INTO estado FROM formularios 
  INNER JOIN estados ON formularios.estado = estados.id_estado
  WHERE formularios.id_formulario = id;
  RETURN estado;
END$$

DELIMITER ;
;


select * from formularios; 

select * from formularios ; 

ALTER TABLE `linea_emprendimientos`.`seguimientos` 
ADD COLUMN `estado_anterior` INT NULL AFTER `id_estados`;

-- TRIGGERS --


-- CREA SEGUIMIENTO AL ACTUALIZAR ESTADOS EN FORMULARIOS-- 

DROP TRIGGER IF EXISTS `linea_emprendimientos`.`trigger_actualizacion_estado`;

DELIMITER $$
USE `linea_emprendimientos`$$
CREATE TRIGGER `trigger_actualizacion_estado`
AFTER UPDATE ON `formularios` 
FOR EACH ROW
BEGIN
    IF NEW.estado <> OLD.estado THEN
        INSERT INTO `seguimientos` (id_formulario, id_estados, estado_anterior, fecha_seguimiento)
        VALUES (NEW.id_formulario, NEW.estado, OLD.estado, NOW() );
  END IF;
END$$
DELIMITER ;

select * from seguimientos;

-- CREA EL PRIMER SEGUIMIENTO AL INSERTAR UN FORMULARIO -- 

DROP TRIGGER IF EXISTS `linea_emprendimientos`.`insertar_seguimiento`;

DELIMITER $$
USE `linea_emprendimientos`$$
CREATE TRIGGER `insertar_seguimiento`
AFTER INSERT ON `formularios`
FOR EACH ROW
BEGIN
    INSERT INTO `seguimientos` (`id_formulario`,`id_estados`,fecha_seguimiento ) VALUES (NEW.id_formulario, 1, now() );
END$$
DELIMITER ;

select * from formularios;

insert into formularios (fecha_carga, estado, id_postulante, presenta_garante)
values (now(),1, 16,0);

-- CREA PLAN DE CUOTAS AL ACTUALIZAR ESTADO-- 

DELIMITER $$
CREATE TRIGGER insertar_plan_cuotas
AFTER UPDATE ON formularios
FOR EACH ROW
BEGIN
    IF NEW.estado = '3' THEN
        INSERT INTO planes_cuota (finaliza_pago, cant_cuotas,id_formulario)
        VALUES (0,20,old.id_formulario);
 END IF ;
END $$ 
DELIMITER ; 

-- CREA FORMULARIO AL INSERTAR POSTULANTE -- 

DELIMITER $$
CREATE TRIGGER insertar_formulario_postulante
AFTER insert ON postulantes
FOR EACH ROW
BEGIN
        INSERT INTO formularios (fecha_carga,estado,id_postulante, presenta_garante)
        VALUES (now(),1,new.id_postulante, new.presenta_recibo);
  
END $$ 
DELIMITER ; 


-- STORED PROCEDURE-- 
-- Actualizar estados de la tabla formularios-- 

DELIMITER $$
CREATE PROCEDURE `actualizar_estado_formulario`(
    IN p_id_formulario INT, 
    IN p_estado INT
)
BEGIN
    UPDATE formularios SET estado = p_estado WHERE id_formulario = p_id_formulario;
END
$$
DELIMITER ;

-- Actualiza si presenta recibo de sueldo para el credito-- 

DELIMITER $$
CREATE PROCEDURE `actualizar_presenta_recibo`(
    IN `p.id_postulante` INT,
    IN `p.nuevo_valor` BOOLEAN
)
BEGIN
    UPDATE `postulantes`
    SET `presenta_recibo` = `p.nuevo_valor`
    WHERE `id_postulante` = `p.id_postulante`;
END
$$
DELIMITER ;
;

-- Crear plan de cuotas-- 

delete from planes_cuota; 

USE `linea_emprendimientos`;
DROP procedure IF EXISTS `linea_emprendimientos`.`insertar_plan_cuotas_por_estado`;

DELIMITER $$
USE `linea_emprendimientos`$$
CREATE PROCEDURE insertar_plan_cuotas_por_estado()
BEGIN
    INSERT INTO planes_cuota (id_formulario, cant_cuotas, sucursal_cobro)
    SELECT f.id_formulario, 20, s.id_sucursal 
    FROM formularios f
    JOIN postulantes p ON f.id_postulante = p.id_postulante
    JOIN localidades l ON l.id_localidad = p.id_localidad
    JOIN sucursales s ON s.localidad = l.id_localidad
    WHERE f.estado <> 4;
END$$

DELIMITER ;

 call linea_emprendimientos.insertar_plan_cuotas_por_estado();
