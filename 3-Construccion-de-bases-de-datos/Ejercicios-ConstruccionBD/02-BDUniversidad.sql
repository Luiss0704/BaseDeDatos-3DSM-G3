CREATE DATABASE universidad1;
GO 

USE universidad1;
GO 

CREATE TABLE profesor(
    profesor_id INT NOT NULL IDENTITY(1,1)
    CONSTRAINT pk_profesor
    PRIMARY KEY, 

    nombre NVARCHAR(100) NOT NULL, 

    apellido_paterno NVARCHAR(20) NOT NULL, 

    apellido_materno NVARCHAR(20) NULL

);
GO

CREATE TABLE curso(
    curso_id INT NOT NULL IDENTITY(1,1)
    CONSTRAINT pk_curso
    PRIMARY KEY, 

    nombre_curso NVARCHAR(100) NOT NULL 
    CONSTRAINT uq_curso_nombre_curso 
    UNIQUE, 

    creditos INT NOT NULL 
    CONSTRAINT  ck_curso_creditos
    CHECK(creditos>0),

    profesor_id INT NOT NULL
    CONSTRAINT fk_curso_profesor
    FOREIGN KEY (profesor_id)
    REFERENCES profesor (profesor_id)
);
GO 

CREATE TABLE especialidad(
    especialidad_id INT NOT NULL IDENTITY(1,1), 
    profesor_id INT NOT NULL,
    nombre_especialidad NVARCHAR(100) NOT NULL
    CONSTRAINT uq_especialidad_nombre_especialidad 
    UNIQUE,
    CONSTRAINT pk_especialidad 
    PRIMARY KEY (especialidad_id, profesor_id),
    CONSTRAINT fk_especialidad_profesor
    FOREIGN KEY (profesor_id)
    REFERENCES profesor(profesor_id)
);
GO