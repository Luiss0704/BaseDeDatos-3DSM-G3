CREATE DATABASE EjemploBD;
GO

USE EjemploBD;
GO

-- SQL-LDD

CREATE TABLE categoria (
	ID_categoria int NOT NULL,
	nombre varchar(50) NOT NULL,
	CONSTRAINT pk_categoria
	PRIMARY KEY (ID_categoria)
);

CREATE TABLE producto(
	ID_producto INT NOT NULL PRIMARY KEY,
	nombre VARCHAR(50) NOT NULL,
	precio MONEY NOT NULL,
	existencia INT NOT NULL,
	ID_categoria INT NOT NULL
	CONSTRAINT fk_producto_categoria
	FOREIGN KEY (ID_categoria)
	REFERENCES categoria (ID_categoria)
);





-- Ejemplo en MariaDB
# Crea una base de datos
create database prueba_atributos;

# Utiliza la base de datos
use prueba_atributos;

# Creación de tabla de empleado
create table empleado(
	ID int not null primary key,
    nombre varchar(50) not null,
    apellido_paterno varchar(20) not null,
    apellido_materno varchar(20) not null,
    fecha_ingreso date not null
);

insert into empleado values (1, 'Reberiano', 'Robles', 'De La Torre', '1983-04-06');

select *, year(fecha_ingreso), month(fecha_ingreso), day(fecha_ingreso) from empleado;

alter table empleado add column fecha_nacim date not null;

update empleado set fecha_nacim = '1960-04-03' where ID = 1;

select 
	nombre, 
    apellido_paterno, 
    apellido_materno, 
    fecha_ingreso, 
    fecha_nacim,
    timestampdiff(year, fecha_nacim, now()) AS edad
from empleado;










create table alumno(
	ID_alumno int not null primary key,
	nombre varchar(30) not null,
	apellido_1 varchar(15) not null,
	apellido_2 varchar(15) null, 
	telefono varchar(10), 
	calle varchar(50) not null,
	numero_ext int null, 
	numero_int varchar(5),
	fecha_nacim date not null,
);

insert into alumno values (
	1,
	'Kima Sofía',
	'Pantoja',
	null,
	'0123456789',
	'Calle Elvio',
	13,
	'B4',
	'2007-02-18'
);

insert into alumno (ID_alumno, nombre, apellido_1, calle, fecha_nacim) values (
	2,
	'José Luis',
	'Gallardo',
	'Calle Angel',
	'1983-04-06'
);

insert into alumno (ID_alumno, nombre, apellido_1, apellido_2, calle, fecha_nacim) values (3, 'Jimena', 'Valdez', 'Delgadillo', '5 de mayo', '2007-06-12');

select *, datediff(year, fecha_nacim, getdate()) as edad from alumno;


create table categoria2 (
	ID_categoria int not null primary key,
	nombre varchar(20) not null
);


create table producto2 (
	ID_producto int not null primary key,
	nombre varchar(30) not null,
	precio money not null,
	existencia int not null,
	ID_categoria int null,
	constraint fk_producto2_categoria2 foreign key (ID_categoria) references categoria2(ID_categoria)
);


Select * from categoria2;
Select * from producto2 where ID_categoria = 1;