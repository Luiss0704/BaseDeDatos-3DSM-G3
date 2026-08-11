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

CREATE DATABASE empresa_patito;
GO

USE empresa_patito;
GO



-- Primera forma de construcción (NO UTILIZAR :/)
CREATE TABLE producto (
	producto_id INT IDENTITY(1,1) PRIMARY KEY,
	nombre VARCHAR(20) NOT NULL UNIQUE,
	descripcion VARCHAR(80),
	precio DECIMAL(10,2) NOT NULL CHECK (precio > 0.0),
	existencia INT NOT NULL CHECK (existencia > 0 AND existencia <= 100),
	activo BIT NOT NULL DEFAULT 1,
	tipo CHAR(1) NOT NULL, CHECK (tipo = 'r' OR tipo = 'p')
);
GO


-- Segunda forma de construcción (Restricción por columna)
CREATE TABLE producto (
	producto_id INT IDENTITY(1,1)
		CONSTRAINT pk_producto PRIMARY KEY,
	
	nombre VARCHAR(20) NOT NULL
		CONSTRAINT uq_nombre_producto UNIQUE,
	
	descripcion VARCHAR(80),
	
	precio DECIMAL(10,2) NOT NULL
		CONSTRAINT ck_nombre_producto CHECK (precio > 0),
	
	existencia INT NOT NULL
		CONSTRAINT ck_existencia_producto CHECK (existencia BETWEEN 1 AND 100),
	
	activo BIT NOT NULL
		CONSTRAINT df_activo_producto DEFAULT 1,
	
	tipo CHAR(1) NOT NULL
		CONSTRAINT ck_tipo_producto CHECK (tipo IN ('r', 'p'))
);
GO



-- Tercera forma de conatrucción (Definición al final)
CREATE TABLE producto (
	producto_id INT IDENTITY(1,1),
	nombre VARCHAR(20) NOT NULL,
	descripcion VARCHAR(80),
	precio DECIMAL(10,2) NOT NULL,
	existencia INT NOT NULL,
	activo BIT NOT NULL
		CONSTRAINT df_activo_producto DEFAULT 1,
	tipo CHAR(1) NOT NULL,

	CONSTRAINT pk_producto PRIMARY KEY (producto_id),
	CONSTRAINT uq_nombre_producto UNIQUE (nombre),
	CONSTRAINT ck_nombre_producto CHECK (precio > 0),
	CONSTRAINT ck_existencia_producto CHECK (existencia BETWEEN 1 AND 100),
	CONSTRAINT ck_tipo_producto CHECK (tipo IN ('r', 'p'))
);
GO


INSERT INTO producto VALUES (
	'Pitufo',
	'Corrientito',
	12.59,
	99,
	DEFAULT,
	'p'
);
GO


INSERT INTO producto VALUES (
	'Quemadita',
	'Queseso',
	12.59,
	34,
	DEFAULT,
	'r'
);
GO


INSERT INTO producto (nombre, precio, existencia, tipo) VALUES (
	'Pantera Rosa',
	89.9,
	56,
	'r'
);
GO


SELECT * FROM producto;
GO



DROP TABLE producto;
GO




-- Restricción FOREIGN KEY (Integridad referencial)
CREATE TABLE proveedor (
	proveedor_id INT NOT NULL IDENTITY(1,1),
	empresa VARCHAR(20) NOT NULL,
	limite_credito DECIMAL(10,2) NOT NULL,
	activo BIT NOT NULL CONSTRAINT df_proveedor_activo DEFAULT 1,
	created_at DATETIME2 NOT NULL CONSTRAINT df_proveedor_created_at DEFAULT SYSDATETIME(),
	updated_at DATETIME2 NOT NULL CONSTRAINT df_proveedor_updated_at DEFAULT SYSDATETIME(),
	CONSTRAINT pk_proveedor PRIMARY KEY (proveedor_id),
	CONSTRAINT uq_proveedor_empresa UNIQUE (empresa),
	CONSTRAINT ck_proveedor_limte_credito CHECK (limite_credito BETWEEN 100 AND 100000)
);
GO


CREATE TABLE contacto_proveedor (
	contacto_id INT IDENTITY(1,1) CONSTRAINT pk_contacto_proveedor PRIMARY KEY,
	nombre VARCHAR(30) NOT NULL,
	apellido_paterno VARCHAR(15) NOT NULL,
	apellido_materno VARCHAR(15),
	telefono VARCHAR(12) NOT NULL,
	proveedor_id INT NOT NULL,

	CONSTRAINT fk_contacto_proveedor_proveedor FOREIGN KEY (proveedor_id) REFERENCES proveedor (proveedor_id)
);
GO



INSERT INTO proveedor (empresa, limite_credito) VALUES 
	('Coca-Cola', 78000),
	('Pepsi', 7485),
	('Bimbo', 100000);
GO

SELECT * FROM proveedor;


INSERT INTO contacto_proveedor(nombre, apellido_paterno, apellido_materno, telefono, proveedor_id) VALUES
	('Luis','Aguilar', null, '052232132132', 1),
	('Kasilda','Cabeza', 'De Vaca', '052232179872', 1),
	('Alma','Marcela', 'Gozo', '745698231025', 2);
GO

SELECT * FROM contacto_proveedor;






