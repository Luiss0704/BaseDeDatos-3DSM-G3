## Código
```sql
CREATE DATABASE Employee1;
GO 

USE Employee1;
GO 

-- TABLA EMPLOYEE 
CREATE TABLE employee(
    ssn INT NOT NULL IDENTITY(1,1),
    firstname NVARCHAR(50) NOT NULL, 
    lastname VARCHAR(50) NOT NULL, 
    birthdate DATE NOT NULL,
    salary MONEY NOT NULL,
    address NVARCHAR(50) NOT NULL, 
    sex CHAR(3) NOT NULL,
    jef INT NULL,

    CONSTRAINT pk_employee 
    PRIMARY KEY (ssn),

    CONSTRAINT ck_employee_birthdate 
    CHECK (birthdate <= GETDATE() AND birthdate >='1900-01-01'), 

    CONSTRAINT ck_employee_salary 
    CHECK (salary > 0.0),
    
    CONSTRAINT ck_employee_sex 
    CHECK (sex IN ('M', 'H', 'NI')),

    CONSTRAINT fk_employee_jef 
    FOREIGN KEY (jef) 
    REFERENCES employee(ssn)
);
GO

-- TABLA DEPARTAMENT 
CREATE TABLE departament(
    number INT NOT NULL IDENTITY(1,1),
    name NVARCHAR(30) NOT NULL,
    manager INT NOT NULL,
    stardate DATE NOT NULL,
    ssn INT NOT NULL,

    CONSTRAINT pk_departament 
    PRIMARY KEY (number),
    CONSTRAINT uq_departament_name 
    UNIQUE (name)
);
GO

-- TABLA LOCATION 
CREATE TABLE location (
    num_location INT NOT NULL IDENTITY(1,1),
    name_dep NVARCHAR(30) NOT NULL,
    num_dep INT NOT NULL,
    location NVARCHAR(30) NOT NULL,
    CONSTRAINT pk_location 
    PRIMARY KEY (num_location, name_dep, num_dep)
);
GO

-- TABLA PROYECT
CREATE TABLE proyect(
    name_proye NVARCHAR(30) NOT NULL,
    num_proyec INT NOT NULL IDENTITY(1,1),
    location NVARCHAR(30) NOT NULL,
    number_dep INT NOT NULL,
    name_dep NVARCHAR(30) NOT NULL,

    CONSTRAINT pk_proyect 
    PRIMARY KEY (name_proye, num_proyec),
    CONSTRAINT uq_proyect_num 
    UNIQUE (num_proyec)
);
GO 

-- TABLA WORK_ON 
CREATE TABLE work_on(
    ssn INT NOT NULL,
    number_proy INT NOT NULL,
    name_proy NVARCHAR(30) NOT NULL,
    hours DECIMAL(5,2) NOT NULL,

    CONSTRAINT pk_work_on 
    PRIMARY KEY (ssn, number_proy, name_proy)
);
GO

-- TABLA DEPENDET 
CREATE TABLE dependet (
    ssn INT NOT NULL,
    name NVARCHAR(30) NOT NULL,
    sex CHAR(5) NOT NULL,
    relationship NVARCHAR(30) NOT NULL, 
    birthdate DATE NOT NULL,

    CONSTRAINT pk_dependet 
    PRIMARY KEY (ssn, name),

    CONSTRAINT ck_dependet_sex 
    CHECK (sex IN ('M', 'H', 'NI')),
    CONSTRAINT ck_dependet_birthdate 
    CHECK (birthdate <= GETDATE() AND birthdate >= '1900-01-01')
);
GO


-- =========================================================
-- RELACIONES Y CLAVES FORÁNEAS (ALTER TABLE)

-- Relaciones de DEPARTAMENT
ALTER TABLE departament 
ADD CONSTRAINT fk_departament_manager
FOREIGN KEY (manager) 
REFERENCES employee(ssn);

ALTER TABLE departament 
ADD CONSTRAINT fk_departament_ssn 
FOREIGN KEY (ssn) 
REFERENCES employee(ssn);
GO

-- Relaciones de LOCATION 
ALTER TABLE location 
ADD CONSTRAINT fk_location_departament 
FOREIGN KEY (num_dep) 
REFERENCES departament(number);

ALTER TABLE location 
ADD CONSTRAINT fk_location_departament_name 
FOREIGN KEY (name_dep) 
REFERENCES departament(name);
GO

-- Relaciones de PROYECT 
ALTER TABLE proyect 
ADD CONSTRAINT fk_proyect_departament 
FOREIGN KEY (number_dep) 
REFERENCES departament(number);

ALTER TABLE proyect 
ADD CONSTRAINT fk_proyect_departament_name 
FOREIGN KEY (name_dep) 
REFERENCES departament(name);
GO

-- Relaciones de WORK_ON 
ALTER TABLE work_on 
ADD CONSTRAINT fk_work_on_employee 
FOREIGN KEY (ssn) 
REFERENCES employee(ssn);

ALTER TABLE work_on 
ADD CONSTRAINT fk_work_on_proyect 
FOREIGN KEY (name_proy, number_proy)
REFERENCES proyect(name_proye, num_proyec);
GO

-- Relaciones de DEPENDET 
ALTER TABLE dependet 
ADD CONSTRAINT fk_dependet_employee 
FOREIGN KEY (ssn) 
REFERENCES employee(ssn);
GO
```

<br>

## Diagrama
![Diagrama 5: Empresa (Versión 1)](../../img/Diagramas-SQLServer/Diagrama%205.jpg)