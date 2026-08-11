CREATE DATABASE examen;
GO

USE examen;
GO

-- Tabla puesto
CREATE TABLE puesto (
    clave_puesto VARCHAR(10) 
    CONSTRAINT pk_puesto 
    PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    nivel_jerarquico VARCHAR(30),
    salario_min DECIMAL(10, 2),
    salario_neto DECIMAL(10, 2)
);

-- Tabla sucursal
CREATE TABLE sucursal (
    clave_sucursal VARCHAR(10) 
    CONSTRAINT pk_sucursal 
    PRIMARY KEY,
    nombre_sucursal VARCHAR(50) NOT NULL,
    ciudad VARCHAR(50),
    estado VARCHAR(50)
);

-- Tabla proyecto
CREATE TABLE proyecto (
    clave_proyecto VARCHAR(10) 
    CONSTRAINT pk_proyecto 
    PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    fecha_inicio DATE,
    fecha_termino DATE,
    presupuesto DECIMAL(12, 2)
);

-- Tabla capacitacion
CREATE TABLE capacitacion (
    clave_capacitacion VARCHAR(10) 
    CONSTRAINT pk_capacitacion 
    PRIMARY KEY,
    nombre_capacitacion VARCHAR(100) NOT NULL
);

-- Tabla teléfono de sucursal
CREATE TABLE telefono_sucursal (
    clave_sucursal VARCHAR(10),
    telefono VARCHAR(15),
    CONSTRAINT pk_telefono_sucursal 
    PRIMARY KEY (clave_sucursal, telefono),
    CONSTRAINT fk_telefono_sucursal_sucursal 
    FOREIGN KEY (clave_sucursal) 
    REFERENCES sucursal(clave_sucursal) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE
);



-- Tabla departamento
CREATE TABLE departamento (
    clave_departamento VARCHAR(10) 
    CONSTRAINT pk_departamento 
    PRIMARY KEY,
    nombre_departamento VARCHAR(50) NOT NULL,
    ubicacion VARCHAR(50),
    presupuesto DECIMAL(12, 2),
    num_empl_admin INT NULL 
);

-- Tabla empleado
CREATE TABLE empleado (
    num_empleado INT PRIMARY KEY,
    curp VARCHAR(18) UNIQUE NOT NULL,
    fecha_nacimiento DATE,
    nombre VARCHAR(30) NOT NULL,
    apellido_paterno VARCHAR(30) NOT NULL,  
    apellido_materno VARCHAR(30),             
    clave_departamento VARCHAR(10),      
    clave_puesto VARCHAR(10),     
    clave_sucursal VARCHAR(10),   
    num_empl_jefe INT,            
    CONSTRAINT fk_empleado_departamento 
    FOREIGN KEY (clave_departamento)
    REFERENCES departamento(clave_departamento) 
    ON DELETE SET NULL,
    CONSTRAINT fk_empleado_puesto 
    FOREIGN KEY (clave_puesto) 
    REFERENCES puesto(clave_puesto)
    ON DELETE SET NULL,
    CONSTRAINT fk_empleado_sucursal 
    FOREIGN KEY (clave_sucursal) 
    REFERENCES sucursal(clave_sucursal)
    ON DELETE SET NULL,
    
    CONSTRAINT fk_empleado_jefe 
    FOREIGN KEY (num_empl_jefe) 
    REFERENCES empleado(num_empleado)
);


ALTER TABLE departamento
ADD CONSTRAINT fk_departamento_admin
FOREIGN KEY (num_empl_admin) 
REFERENCES empleado(num_empleado) 
ON DELETE SET NULL;
 

-- Tabla participa
CREATE TABLE participa (
    num_empleado INT,
    clave_proyecto VARCHAR(10),
    fecha_asignacion DATE,
    rol VARCHAR(30),
    horas INT,
    CONSTRAINT pk_participa 
    PRIMARY KEY (num_empleado, clave_proyecto),
    CONSTRAINT fk_participa_empleado 
    FOREIGN KEY (num_empleado) 
    REFERENCES empleado(num_empleado) 
    ON DELETE CASCADE,
    CONSTRAINT fk_participa_proyecto
    FOREIGN KEY (clave_proyecto) 
    REFERENCES proyecto(clave_proyecto) 
    ON DELETE CASCADE
);

-- Tabla asistir
CREATE TABLE asistir (
    num_empleado INT,
    clave_capacitacion VARCHAR(10),
    fecha_asistencia DATE,
    calificacion DECIMAL(4,2),
    estatus VARCHAR(20),
    CONSTRAINT pk_asistir 
    PRIMARY KEY (num_empleado, clave_capacitacion),
    CONSTRAINT fk_asistir_empleado 
    FOREIGN KEY (num_empleado) 
    REFERENCES empleado(num_empleado) 
    ON DELETE CASCADE,
    CONSTRAINT fk_asistir_capacitacion 
    FOREIGN KEY (clave_capacitacion) 
    REFERENCES capacitacion(clave_capacitacion)
     ON DELETE CASCADE
);
GO
