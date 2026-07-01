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











create database bdconstraints;
GO

--Razón de cardinalidad: 1:1--

CREATE TABLE paciente(
	Numpaciente INT not null,
	Nombre VARCHAR(30) not null,
	Apellido1 VARCHAR(20) not null,
	Apellido2 VARCHAR(20) null,
	Birthdate DATE not null,
	PRIMARY KEY (Numpaciente)
);
GO

DROP TABLE paciente

CREATE TABLE expediente(
	NumExpediente INT NOT NULL,
	FechaApertura DATE NOT NULL,
	Tipodesangre CHAR(3) NOT NULL,
	paciente INT NOT NULL,
	CONSTRAINT pk_expediente PRIMARY KEY (NumExpediente),
	CONSTRAINT unique_nmpaciente UNIQUE (paciente),
	CONSTRAINT fk_expediente_paciente FOREIGN KEY (paciente) REFERENCES paciente (Numpaciente)
);
GO


INSERT INTO paciente VALUES (
	1,
	'Kevin',
	'Kosner',
	'Lopez',
	'2007-02-18'
);
GO


INSERT INTO paciente VALUES (
	2,
	'Daniel',
	'Martínez',
	'Mendoza',
	'2005-01-30'
);
GO


INSERT INTO paciente VALUES (
	3,
	'Luis Fernando',
	'Nieto',
	null,
	'2007-07-04'
);
GO



SELECT * FROM paciente;


INSERT INTO expediente VALUES (
	1,
	GETDATE(),
	'+O',
	1
);
GO

INSERT INTO expediente VALUES (
	2,
	GETDATE(),
	'+B',
	2
);
Go

INSERT INTO expediente VALUES (
	3,
	GETDATE(),
	'+A',
	3
);
GO


SELECT * FROM expediente

SELECT
	e.NumExpediente,
	e.FechaApertura,
	e.Tipodesangre,
	CONCAT(p.Nombre, ' ', p.Apellido1, ' ', p.Apellido2)
	AS [NombreCompleto]
FROM expediente AS e
INNER JOIN paciente AS p
ON e.paciente = p.Numpaciente



CREATE TABLE profesor(
	Numprof INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Nombre VARCHAR(50) NOT NULL,
	Apellido1 VARCHAR(20) NOT NULL,
	Apellido2 VARCHAR(20)
);
GO


CREATE TABLE curso (
	Numcurso INT NOT NULL,
	Nombre VARCHAR(20) NOT NULL,
	Creditos INT NOT NULL,
	Numprof INT NOT NULL,
	CONSTRAINT pk_curso PRIMARY KEY (Numcurso),
	CONSTRAINT unique_nombre UNIQUE (nombre),
	CONSTRAINT check_creditos CHECK (Creditos > 0),
	CONSTRAINT fk_curso_profesor FOREIGN KEY (Numprof) REFERENCES profesor (Numprof)
);
GO


CREATE TABLE especialidad(
	Numesp INT NOT NULL,
	Numprof INT NOT NULL,
	NombreEsp VARCHAR(30) NOT NULL,
	CONSTRAINT pk_especialidad PRIMARY KEY (Numesp, Numprof),
	CONSTRAINT unique_nombreEsp UNIQUE (NombreEsp),
	CONSTRAINT fk_especialidad_profesor FOREIGN KEY (Numprof) REFERENCES profesor (Numprof)
);
GO

INSERT INTO profesor VALUES ('José Luis','Herrera','Gallardo'),
	('Luis','Nieto','Sánchez');

INSERT INTO profesor VALUES ('José Ángel','Pérez','Hernández');
GO

SELECT * FROM profesor;


INSERT INTO curso VALUES
	(1, 'Bases de datos', 50, 1),
	(2, 'Programación', 50, 1),
	(3, 'Tópicos', 30, 3);

UPDATE curso SET Numprof = 2 WHERE Numcurso = 2;
SELECT * FROM curso;



INSERT INTO especialidad VALUES
	(1, 1, 'Redes'),
	(2, 2, 'Software'),
	(3, 3, 'Entornos virtuales');

SELECT * FROM especialidad ORDER BY Numesp;
SELECT p.nombre, p.Apellido1, p.Apellido2, c.Nombre, c.Creditos, e.NombreEsp
FROM profesor AS p INNER JOIN curso AS c ON p.Numprof = c.Numprof INNER JOIN especialidad AS e ON p.Numprof = e.Numprof
ORDER BY 1;

-- TRUNCATE TABLE especialidad; --





-- Cardinalidad de M:N --

CREATE TABLE alumno (
	IDalumno INT NOT NULL PRIMARY KEY,
	Matricula Varchar(10) NOT NULL,
	Nombre NVARCHAR(30) NOT NULL,
	Appellido1 NVARCHAR(20) NOT NULL,
	Apellido2 NVARCHAR(20),
	Semestre INT NOT NULL,
	CONSTRAINT unique_matricula UNIQUE (Matricula),
	CONSTRAINT check_semestre CHECK (Semestre > 0 AND Semestre <= 10)
);
GO

CREATE TABLE materia (
	IDmateria INT NOT NULL,
	NombreMat NVARCHAR(20) NOT NULL,
	Creditos INT NOT NULL,
	CONSTRAINT pk_materia PRIMARY KEY (IDmateria),
	CONSTRAINT unique_nombreMat UNIQUE (NombreMat),
	CONSTRAINT check_creditos2 CHECK (Creditos BETWEEN 1 AND 60)
);
GO

CREATE TABLE inscribe (
	IDmateria INT NOT NULL,
	IDalumno INT NOT NULL,
	FechaInscripcion DATE NOT NULL,
	Calificacion DECIMAL(10,2) NOT NULL,
	CONSTRAINT pk_insicribe PRIMARY KEY (IDmateria, IDalumno),
	CONSTRAINT fk_inscribe_materia FOREIGN KEY (IDmateria) REFERENCES materia (IDmateria),
	CONSTRAINT fk_inscribe_alumno FOREIGN KEY (IDalumno) REFERENCES alumno (IDalumno),

);
GO