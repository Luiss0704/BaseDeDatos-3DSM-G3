## Código

```sql
CREATE DATABASE Employee2;
GO

USE Employee2;
GO 

--- 1. TABLA EMPLOYEE ---
CREATE TABLE employee(
    ssn_id INT NOT NULL IDENTITY(1,1)
    CONSTRAINT pk_employee PRIMARY KEY,

    firstname NVARCHAR(50) NOT NULL, 
    lastname NVARCHAR(50) NOT NULL, 
    birthdate DATE NOT NULL, 

    salary MONEY NOT NULL
    CONSTRAINT ck_employee_salary 
    CHECK (salary > 0.0),
    
    address NVARCHAR(50) NOT NULL,
    sex CHAR(3) NOT NULL 
    CONSTRAINT ck_employee_sex CHECK (sex IN ('M','H','NI')), 

    jef INT NULL 
    CONSTRAINT fk_employee_jef FOREIGN KEY (jef) REFERENCES employee(ssn_id)
);
GO

--- 2. TABLA DEPARTAMENT ---
CREATE TABLE departament(
    num_departament INT NOT NULL IDENTITY(1,1)
    CONSTRAINT pk_departament PRIMARY KEY, 

    name NVARCHAR(30) NOT NULL
    CONSTRAINT uq_departament_name UNIQUE,

    manages INT NOT NULL
    CONSTRAINT fk_departament_manages FOREIGN KEY (manages) REFERENCES employee(ssn_id),

    stardate DATE NOT NULL
);
GO

--- 3. TABLA PROJECT ---
CREATE TABLE project(
    number_project INT NOT NULL IDENTITY(1,1)
    CONSTRAINT pk_project 
    PRIMARY KEY,

    name NVARCHAR(30) NOT NULL, 
    location NVARCHAR(30) NOT NULL, 

    num_departament INT NOT NULL
    CONSTRAINT fk_project_departament 
    FOREIGN KEY (num_departament) 
    REFERENCES departament(num_departament)
);
GO

--- 4. TABLA WORK_ON ---
CREATE TABLE work_on(
    work_id INT NOT NULL IDENTITY(1,1)
    CONSTRAINT pk_work_on 
    PRIMARY KEY, 

    ssn_id INT NOT NULL,
    number_project INT NOT NULL,
    hours DECIMAL(5,2) NOT NULL,

    CONSTRAINT fk_work_on_employee 
    FOREIGN KEY (ssn_id) 
    REFERENCES employee(ssn_id),
    CONSTRAINT fk_work_on_project 
    FOREIGN KEY (number_project)
     REFERENCES project(number_project) 
);
GO

--- 5. TABLA DEPENDENT ---
CREATE TABLE dependet(
    dependet_id INT NOT NULL IDENTITY(1,1)
    CONSTRAINT pk_dependet PRIMARY KEY, 

    name NVARCHAR(30) NOT NULL, 
    sex CHAR(3) NOT NULL, 
    relationship NVARCHAR(10) NOT NULL,

    birthdate DATE NOT NULL, 

    ssn_id INT NOT NULL
    CONSTRAINT fk_dependet_employee 
    FOREIGN KEY (ssn_id) 
    REFERENCES employee(ssn_id),

    CONSTRAINT ck_dependet_sex 
    CHECK (sex IN ('M','H','NI')), 
    CONSTRAINT ck_dependet_relationship 
    CHECK (relationship IN ('Hijo/a', 'Madre','Padre', 'Esposa', 'Esposo'))
);
GO

--- 6. TABLA LOCATION ---
CREATE TABLE location(
    location_id INT NOT NULL IDENTITY(1,1)
    CONSTRAINT pk_location 
    PRIMARY KEY, 
    
    location NVARCHAR(30) NOT NULL,
    
    num_departament INT NOT NULL 
    CONSTRAINT fk_location_departament 
    FOREIGN KEY (num_departament)
    REFERENCES departament (num_departament)
);
GO
```

<br>

## Diagrama
![Diagrama 6: Empresa (Versión 2)](../../img/Diagramas-SQLServer/Diagrama%206.jpg)