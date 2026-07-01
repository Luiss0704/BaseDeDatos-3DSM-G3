# Diccionario de Datos de la Base de Datos Empresa Versión 1

## 1. Información General

| Elemento | Valor |
| :--- | :--- |
| Proyecto | Base de datos de una empresa (En Inglés, versión 1) |
| Versión | 1.0 |
| Fecha | 28 de Junio 2026 |
| Elaboró | Luis Fernando Gabriel Nieto Sánchez |
| SGBD | SQLServer |


<br>

## 2. Descripción del Sistema de Base de Datos

El sistema administra:
- Empleados
- Departamentos
- Proyectos
- Dependientes
- Ubicaciones

Permite controlar la estructura organizacional de la empresa, la asignación de empleados a departamentos, su participación en proyectos específicos, así como la gestión de dependientes y la jerarquía de supervisión


<br>

## 3. Catálogo de Restricciones

| Código |  Significado |
| :---: | :--- |
| PK | Primary Key |
| FK | Foreign Key |
| NN | Not Null |
| UQ | Unique |
| AI | Auto Increment |
| CK | Check |
| DF | Default |


<br>

## 4. Dirección de Datos

**Tabla:** Employee

**Descripción:** _Almacena toda la información del personal, incluyendo su jerarquías_

| Campos | Tipos | Longitud | Restricciones | Descripción |
| :--- | :---: | :---: | :---: | :--- |
| Ssn | INT | - | PK, AI, NN | Identificador unico del employee |
| Firstname | NVARCHAR| 50 | NN | Nombre del empleado |
| Lastname | VARCHAR| 50 | NN | Apellido paterno |
| Birthday | DATE| -| NN | Fecha de naciemiento |
| Salary | MONEY| -| NN CK(>0)| Salario que gana el empleado |
| Address | NVARCHAR| 50 | NN| Salario que gana el empleado |
| Sex | CHAR | -| NN|Sexo del empleado |
| Jef | INT | -| NN, FK| ID del jefe |

<br>

---

<br>

**Tabla:** Department

**Descripción:** _Define las unidades operativas y quién las dirige_

| Campos | Tipos | Longitud | Restricciones | Descripción |
| :--- | :---: | :---: | :---: | :--- |
| Numer | INT | - | PK, NN | Identificador unico del departamento |
| Name | NVARCHAR  | 30| NN |  Nombre del departamento |
| Manager| INT  | - | NN, FK | Llave foranea del jefe |
| Stardate | DATE  | - |NN| Fecha de cuando inaguraron el departamento |
| Ssn | INT  | - | FK, NN | Identificador del empleado |

<br>

---

<br>

**Tabla:** Project

**Descripción:** _Catálogo de proyectos y el departamento que los gestiona_

| Campos | Tipos | Longitud | Restricciones | Descripción |
| :--- | :---: | :---: | :---: | :--- |
| Number | INT  | - | NN, PK | Numero del proyecto|
| Name | NVARCHART |30| NN | Nombre del proyecto |
| Location | NVARCHAR  |30| NN | Dirección del proyecto |
| NumberDep | INT  | - | FK, NN | Identificador del departamento |
| NameDeo | NVARCHAR  | - | FK, NN, UQ | Nombre del departamento|

<br>

---

<br>

**Tabla:** WorksOn

**Descripción:** _Tabla asociativa que registra la participación del empleado en proyectos_

| Campos | Tipos | Longitud | Restricciones | Descripción |
| :--- | :---: | :---: | :---: | :--- |
| Ssn | INT | - | PK,FK, NN | Identificador unico del empleado|
| NameProy | NVARCHAR  | 30 | NN,FK,PK | Nombre del proyecto |
| NumberProy | INT  |- | NN |Número del proyecto |
| Hours | DECIMAL  | - | NN | Cantidad de horas trabajadas en el proyecto |

<br>

---

<br>

**Tabla:** Dependent

**Descripción:** _Descripción: Información sobre los beneficiarios o familiares del empleado_

| Campos | Tipos | Longitud | Restricciones | Descripción |
| :--- | :---: | :---: | :---: | :--- |
| Ssn | INT | - | PK, FK,  NN | Identificador unico del empleado |
| Name | NVARCHART  | 30 | NN, PK | Nombre del dependiente |
| Sex | CHAR  | 5 | NN | Sexo de la persona |
| RelationShip | NVARCHAR  | 30 | NN|Relación que tiene con el empleado |
| Birthday | DATE| -| NN | Fecha de naciemiento |

<br>

---

<br>

**Tabla:** Location

**Descripción:** _Detalla las ubicaciones físicas vinculadas a los departamentos_

| Campos | Tipos | Longitud | Restricciones | Descripción |
| :--- | :---: | :---: | :---: | :--- |
| Numlocation | INT | - | PK, NN | Identificador unico de la localización |
| NumberDep | INT  | - | NN, FK | Número del departamento|
| NameDep | NVARCHAR  | 30 | NN | Nombre del departamento |
| Location | NVARCHAR  | - | NN | Localización del departamento |


<br>

## 5. Relaciones

|  Relación | Cardinalidad | Descripción |
|:----------|:---------:|:----------|
| Employee <-> Employee    | 1:N  |Relación de supervisión (un jefe puede tener muchos subordinados).|
| Employee -> Departament    | 1:N  |Un departamento puede tener muchos empleados|
| Departament -> Proyect   | 1:N  | Un departamento puede controlar varios proyectos|
| Employee <-> Proyect   | N:N  |Resuelta por la tabla Work On (horas trabajadas)|
| Employee -> Dependet   | 1:N  |Un empleado puede tener varios dependientes|


<br>

## 6. Matriz de Claves Foráneas

  Tabla | Campo FK | Referencia |
|:----------|:---------:|:----------|
|Employee| Jef  | Employee (Ssn)  |
|Departament| SsnFK  | Employee (Ssn)  |
|Work On| SsnFK  | Employee (Ssn)  |
|Work On| NumberProy  | Proyect (NumberProy)  |
|Dependet| Ssn  | Employee (Ssn)  |


<br>

## 7. Integridad referencial

| Regla |  Descripción |
| :---: | :--- |
| IR-01 | Un empleado no puede ser su propio jefe (evitar ciclos infinitos en jerarquía)|
| IR-02 |No se puede registrar un dependiente sin un empleado titular válido|
| IR-03 |Al eliminar un empleado, se deben gestionar sus horas en Work On para evitar registros huérfanos|
| IR-04 |Los cambios en el Ssn (ID del empleado) deben actualizarse en cascada en las tablas donde actúa como FK|


<br>

## 8. Regla del negocio

|Código |Regla |
| :---: | :--- |
| RN-01 |Un empleado pertenece a un solo departamento, pero puede trabajar en múltiples proyectos.|
| RN-02 | Todo proyecto debe estar bajo el control de un único departamento |
| RN-03 | La tabla Work On es obligatoria para registrar las horas dedicadas; sin este registro, no se considera participación en el proyecto|
  

<br>

## 9. Diagrama relacional

![Solución del ejercicio](/img/Relacional/Ejercicio%206%20Relacional.png)

 

