CREATE DATABASE hospital;
GO 

USE hospital; 
GO 

CREATE TABLE paciente(
    paciente_id INT NOT NULL IDENTITY(1,1)
    CONSTRAINT pk_paciente PRIMARY KEY, 

    nombre VARCHAR(50) NOT NULL,

    apellido_1 VARCHAR(20) NOT NULL, 

    apellido_2 VARCHAR(20) NULL,

    birthday DATE NOT NULL
    CONSTRAINT ck_paciente_birtday
    CHECK (birthday <= GETDATE() AND birthday >= '1900-01-01'), 

    created_at DATETIME2 NOT NULL
    CONSTRAINT df_paciente_created_ad
    DEFAULT SYSDATETIME(),

    updated_at DATETIME2 NOT NULL
    CONSTRAINT df_paciente_updated_At
    DEFAULT SYSDATETIME()
);
GO 

CREATE TABLE expediente(
    expediente_id INT NOT NULL IDENTITY(1,1)
    CONSTRAINT pk_expediente PRIMARY KEY, 

    fecha_apertura DATE NOT NULL
    CONSTRAINT ck_expediente 
    CHECK (fecha_apertura <= GETDATE() AND fecha_apertura >= '1900-01-01'), 

    tipo_sangre CHAR(3) NOT NULL
    CONSTRAINT ck_expediente_tipo_sangre
    CHECK(tipo_sangre IN ('A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-')), 

    created_at DATETIME2 NOT NULL
    CONSTRAINT df_expediente_created_at
    DEFAULT SYSDATETIME(),

    updated_at DATETIME2 NOT NULL
    CONSTRAINT df_expediente_updated_at
    DEFAULT SYSDATETIME(),

    paciente_id INT NOT NULL 
    CONSTRAINT uq_expediente_paciente UNIQUE,

    CONSTRAINT fk_expediente_paciente 
    FOREIGN KEY (paciente_id) 
    REFERENCES paciente(paciente_id)
);
GO


