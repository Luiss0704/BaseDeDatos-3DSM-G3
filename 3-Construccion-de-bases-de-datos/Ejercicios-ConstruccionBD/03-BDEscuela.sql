CREATE DATABASE escuela;
GO 

USE escuela;
GO

CREATE TABLE alumno(
    alumno_id INT NOT NULL IDENTITY(1,1)
    CONSTRAINT pk_alumno PRIMARY KEY,
    
    matricula VARCHAR(10) NOT NULL
    CONSTRAINT uq_alumno_matricula UNIQUE,
    
    nombre NVARCHAR(50) NOT NULL, 
    apellido_paterno NVARCHAR(20) NOT NULL, 
    apellido_materno NVARCHAR(20) NULL,
    
    semestre INT NOT NULL 
    CONSTRAINT ck_alumno_semestre 
    CHECK (semestre BETWEEN 1 AND 12)
);
GO

CREATE TABLE materia(
    materia_id INT NOT NULL IDENTITY(1,1)
    CONSTRAINT pk_materia PRIMARY KEY, 
    
    nombre_materia VARCHAR(100) NOT NULL
    CONSTRAINT uq_materia_nombre_materia UNIQUE, 
    
    creditos INT NOT NULL 
    CONSTRAINT ck_materia_creditos CHECK (creditos > 0)
);
GO

CREATE TABLE inscribe(
    materia_id INT NOT NULL,
    alumno_id INT NOT NULL, 
    
    fecha_inscripcion DATE NOT NULL
    CONSTRAINT df_inscribe_fecha_apertura DEFAULT GETDATE(),
    
    calificacion_final DECIMAL(4,2) NOT NULL
    CONSTRAINT ck_inscribe_calificacion_final 
    CHECK (calificacion_final BETWEEN 0 AND 10),

    CONSTRAINT pk_inscribe 
    PRIMARY KEY (materia_id, alumno_id),
    
    CONSTRAINT fk_inscribe_materia 
    FOREIGN KEY (materia_id)
    REFERENCES materia(materia_id),
    
    CONSTRAINT fk_inscribe_alumno 
    FOREIGN KEY (alumno_id)
    REFERENCES alumno(alumno_id)
);
GO