CREATE DATABASE Escuela2;
GO 

USE Escuela2;
GO 

-- Tabla alumno 
CREATE TABLE alumno(
    matricula_id INT NOT NULL IDENTITY(1,1),
    nombre NVARCHAR(50) NOT NULL, 
    apellido_1 NVARCHAR(20) NOT NULL, 
    apellido_2 NVARCHAR(20) NULL,
    correo_electronico VARCHAR(50) NOT NULL, 
    fecha_nacimiento DATE NOT NULL, 

    CONSTRAINT pk_alumno 
    PRIMARY KEY (matricula_id)
);
GO

-- Tabla departamento 
CREATE TABLE departamento(
    num_departamento INT NOT NULL, 
    nombre_departamento VARCHAR(30) NOT NULL,
    edificio VARCHAR(30) NOT NULL, 

    CONSTRAINT pk_departamento 
    PRIMARY KEY (num_departamento)
);
GO

-- Tabla proyecto 
CREATE TABLE proyecto(
    num_proyecto INT NOT NULL, 
    nombre_proyecto VARCHAR(30) NOT NULL, 
    presupuesto DECIMAL(10,2), 

    CONSTRAINT pk_proyecto
    PRIMARY KEY (num_proyecto), 
    CONSTRAINT ck_proyecto_presupuesto 
    CHECK (presupuesto>0.0)

);
GO

-- Tabla profesor
CREATE TABLE profesor(
    num_profesor INT NOT NULL, 
    nombre NVARCHAR(50) NOT NULL, 
    apellido_1 NVARCHAR(20) NOT NULL, 
    apellido_2 NVARCHAR(20) NULL,
    num_departamento INT NOT NULL, 

    CONSTRAINT pk_profesor
    PRIMARY KEY(num_profesor), 

    CONSTRAINT fk_profesor_departamento 
    FOREIGN KEY (num_departamento)
    REFERENCES departamento (num_departamento)
    ON UPDATE CASCADE
    ON DELETE NO ACTION,
);
GO

-- Tabla dependiente 
CREATE TABLE dependiente(
    nombre_dependiente NVARCHAR(30) NOT NULL, 
    num_profesor INT NOT NULL, 
    fecha_nacimiento DATE NOT NULL, 
    parentesco NVARCHAR(10) NOT NULL, 

    CONSTRAINT pk_dependiente
    PRIMARY KEY(nombre_dependiente, num_profesor), 

    CONSTRAINT fk_dependiente_profesor 
    FOREIGN KEY (num_profesor) 
    REFERENCES profesor(num_profesor)
    ON UPDATE CASCADE
    ON DELETE NO ACTION,
);
GO

-- Tabla materia

CREATE TABLE materia(
    clave_materia INT NOT NULL, 
    nombre_materia VARCHAR(30),
    creditos DECIMAL (4,2) NOT NULL, 
    num_profesor INT NOT NULL, 

    CONSTRAINT pk_materia
    PRIMARY KEY (clave_materia), 
    CONSTRAINT uq_nombre_materia
    UNIQUE(nombre_materia),
    
    CONSTRAINT fk_materia_profesor
    FOREIGN KEY (num_profesor)
    REFERENCES profesor(num_profesor)

    ON UPDATE CASCADE
    ON DELETE NO ACTION
);
GO

-- Tabla cursa
CREATE TABLE cursa(
    matricula_id INT NOT NULL, 
    clave_materia INT NOT NULL, 
    fecha_inscripccion DATE NOT NULL, 
    calificacion_final DECIMAL (4,2),

    CONSTRAINT pk_cursa
    PRIMARY KEY(matricula_id, clave_materia),

    CONSTRAINT fk_cursa_alumno
    FOREIGN KEY (matricula_id)
    REFERENCES alumno(matricula_id)
    ON UPDATE CASCADE
    ON DELETE NO ACTION,
    CONSTRAINT fk_cursa_materia
    FOREIGN KEY(clave_materia)
    REFERENCES materia(clave_materia)
    ON UPDATE CASCADE
    ON DELETE NO ACTION
);
GO

-- Tabla participa 
CREATE TABLE participa(
    num_profesor INT NOT NULL, 
    num_proyecto INT NOT NULL, 
    rol VARCHAR(30) NOT NULL, 

    CONSTRAINT pk_participa
    PRIMARY KEY(num_profesor, num_proyecto),

    CONSTRAINT fk_participa_profesor
    FOREIGN KEY (num_profesor)
    REFERENCES profesor(num_profesor)
    ON UPDATE CASCADE
    ON DELETE NO ACTION,

    CONSTRAINT fk_participa_proyecto
    FOREIGN KEY(num_proyecto)
    REFERENCES proyecto(num_proyecto)
    ON UPDATE CASCADE
    ON DELETE NO ACTION
);
GO

-- Tabla Telefono
CREATE TABLE telefono(
    clave_tel INT NOT NULL, 
    matricula_id INT NOT NULL, 
    telefono VARCHAR(13) NOT NULL, 

    CONSTRAINT pk_telefono
    PRIMARY KEY(clave_tel),

    CONSTRAINT fk_telefono_alumno
    FOREIGN KEY (matricula_id)
    REFERENCES alumno(matricula_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);
GO

-- Tabla Credencial
CREATE TABLE credencial(
    num_credencial INT NOT NULL, 
    fecha_expedicion DATE NOT NULL, 
    vigencia DATE NOT NULL, 
    matricula_id INT NOT NULL, 

    CONSTRAINT pk_credencial 
    PRIMARY KEY(num_credencial), 

    CONSTRAINT uq_credencial_matricula_id
    UNIQUE(matricula_id),

    CONSTRAINT fk_credencial_alumno
    FOREIGN KEY(matricula_id)
    REFERENCES alumno(matricula_id)
    ON UPDATE CASCADE
    ON DELETE NO ACTION
);
GO