-- Construcción de Bases de datos con SQL LDD utilizando (CREATE, ALTER, DROP)

-- Crear una base de datos
CREATE DATABASE universidad;
GO

-- Usar la base de datos
USE universidad;
GO

-- Crear una tabla
CREATE TABLE Alumno (
	alumno_id INT,
	nombre_alumno VARCHAR(20),
	apellido_paterno VARCHAR(20),
	apellido_materno VARCHAR(20),
	fecha_nacimiento DATE,
	correo VARCHAR(50)
);
GO

INSERT INTO Alumno VALUES (
	1,
	'Arcadia',
	'Vaca',
	'Del Corral',
	'1987-04-07',
	'Arcadia@ejemplo.com'
);

INSERT INTO Alumno VALUES (
	1,
	'Kevin',
	'Cabeza',
	'De Borrego',
	'1942-05-10',
	'Kevin@ejemplo.com'
);
GO

SELECT * FROM Alumno;

-- Restricciones
/*
	Las restricciones son reglas que garantizan la integridad de los datos

	Las más utilizadas son:
		- PRIMARY KEY
		- FOREIGN KEY
		- NOT NULL
		- UNIQUE
		- CHECK
		- DEFAULT
*/

DROP TABLE Alumno;
GO

-- PRIMARY KEY
CREATE TABLE Alumno (
	alumno_id INT PRIMARY KEY,
	nombre VARCHAR(50),
	correo VARCHAR(50)
);
GO

INSERT INTO Alumno VALUES (
	1,
	'Luis',
	'Luis@ejemplo.com'
);

INSERT INTO Alumno VALUES (
	1,
	'Roberta',
	'Roberta@ejemplo.com'
);
GO

DROP TABLE Alumno;
GO


-- Definir el nombre de la restricción de la Primary Key
CREATE TABLE Alumno (
	alumno_id INT NOT NULL,
	nombre VARCHAR(50),
	correo VARCHAR(50),
	CONSTRAINT pk_alumno PRIMARY KEY (alumno_id)
);
GO

INSERT INTO Alumno VALUES (
	1,
	'Luis',
	'Luis@ejemplo.com'
);

INSERT INTO Alumno VALUES (
	1,
	'Roberta',
	'Roberta@ejemplo.com'
);
GO


DROP TABLE Alumno;
GO




-- PRIMARY KEY con IDENTITY
CREATE TABLE Alumno (
	alumno_id INT IDENTITY(1,1),
	nombre VARCHAR(50),
	correo VARCHAR(50),
	CONSTRAINT pk_alumno PRIMARY KEY (alumno_id)
);
GO

INSERT INTO Alumno VALUES (
	'Luis',
	'Luis@ejemplo.com'
);

INSERT INTO Alumno VALUES (
	'Roberta',
	'Roberta@ejemplo.com'
);
GO

SELECT * FROM Alumno;
GO

DROP TABLE Alumno;
GO


-- NOT NULL
CREATE TABLE Profesor (
	profesor_id INT NOT NULL IDENTITY (1,1),
	numero_nomina VARCHAR(20) NOT NULL,
	nombre VARCHAR(15) NOT NULL,
	apellido_paterno VARCHAR(20) NOT NULL,
	apellido_materno VARCHAR(20),
	fecha_ingreso DATE,
	CONSTRAINT pk_profesor PRIMARY KEY (profesor_id)
);
GO

INSERT INTO Profesor VALUES (
	'55554DSAD','Luis','Hernández',NULL,'2027-05-07'
);
GO

SELECT * FROM Profesor;
GO

INSERT INTO Profesor (numero_nomina, nombre, apellido_paterno) VALUES (
	'sddsds12','Ricarda','Sonrics'
);
GO


-- Restricción UNIQUE

CREATE TABLE categoria (
	categoria_id INT NOT NULL IDENTITY(1,1),
	nombre VARCHAR(20) NOT NULL UNIQUE,
	activo BIT NOT NULL,
	CONSTRAINT pk_categoria PRIMARY KEY (categoria_id)
);
GO

INSERT INTO categoria (nombre,activo) VALUES (
	UPPER('carnes frías'),
	1
);
GO

DROP TABLE categoria;
GO




CREATE TABLE categoria (
	categoria_id INT NOT NULL IDENTITY(1,1),
	nombre VARCHAR(20) NOT NULL,
	activo BIT NOT NULL DEFAULT 1,
	CONSTRAINT pk_categoria PRIMARY KEY (categoria_id),
	CONSTRAINT uq_categoria_nombre UNIQUE (nombre)
);
GO


INSERT INTO categoria VALUES (
	'Carnes frías',
	DEFAULT
);
GO

INSERT INTO categoria(nombre) VALUES (
	'Lacteos'
);
GO


SELECT * FROM categoria;
GO

-- TODO: CREAR LAS TABLAS DE LAS OTRAS DOS FORMAS


-- Resricción CHECK