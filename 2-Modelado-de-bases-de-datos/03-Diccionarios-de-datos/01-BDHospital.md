# Diccionario de Datos de la Base de Datos Hospital

## 1. Información General

| Elemento |  Valor |
| :--- | :--- |
| Proyecto | Base de datos de un hospital |
| Versión | 1.0 |
| Fecha | 28 de Junio 2026 |
| Elaboró  | Luis Fernando Gabriel Nieto Sánchez |
| SGBD | SQLServer |


<br>

## 2. Descripción del Sistema de Base de Datos

El sistema administra:
- Pacientes
- Expediente


Permite controlar la identifcación del paciente y garantizar la vinculación permanente y única con su historial clínico.


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

**Tabla:** Paciente     

**Descripción:** _Almacena la información personal de los pacientes registrados_

| Campos | Tipos | Longitud | Restricciones | Descripción |
| :--- | :---: | :---: | :---: | :--- |
| num_paciente | INT | - | PK, AI, NN | Identificador unico del paciente |
| nombre | VARCHAR| 100 | UQ, NN | Nombre del paciente |
| apellido_1 | VARCHAR| 50 | NN | Apellido paterno |
| apellido_2 | VARCHAR| 50 | NULL | Apellido materno |
| fecha_naci | DATE| -| NN | Fecha de naciemiento |

<br>

---

<br>

**Tabla:** Expediente          

**Descripción:** _Almacena la información médica específica vinculada a un paciente_

| Campos | Tipos | Longitud | Restricciones | Descripción |
| :--- | :---: | :---: | :---: | :--- |
| num_expediemte | INT | - | PK, AI, NN | Identificador unico del alumno |
| fecha_apertura | DATE  | - | NN | Fecha de creación del expediente |
| tipo_de_sangre | VARCHAR  | 5 | NN | Grupo sanguíneo y factor RH |
| Num_paciente | INT  | - | FK, NN, UQ | Identificador del paciente |


<br>

## 5. Relaciones

|  Relación | Cardinalidad | Descripción |
|:----------|:---------:|:----------|
| Paciente -> Expediente    | 1:1 | Cada paciente debe tener un único expediente médico asignado. |
| Expediente -> Paciente    | 1:1 | Cada expediente médico pertenece a un único paciente. |


<br>

## 6. Matriz de Claves Foráneas

| Tabla | Campo FK | Referencia |
|:----------|:---------|:----------|
|Expediente| num_paciente  | Paciente (num_paciente)  |


<br>

## 7. Integridad referencial

| Regla |  Descripción |
| :---: | :--- |
| IR-01 | No se puede registrar un expediente médico sin estar asociado a un paciente válido existente. |
| IR-02 | No se puede eliminar a un paciente del sistema si este ya tiene un expediente médico vinculado (para evitar registros huérfanos)|
| IR-03 |La actualización del identificador de un paciente (num_paciente) debe replicarse automáticamente en su expediente correspondiente|


<br>

## 8. Reglas del negocio

| Código |  Regla |
| :---: | :--- |
| RN-01 | Cada paciente debe de tener un expediente médico |
| RN-02 | Cada expediente médico pertenece a un unico paciente |
| RN-03 | No puede existir un expediente sin un paciente |
| RN-04 |  No puede existir un paciente sin un expediente |


<br>

## 9. Diagrama relacional

![Solución al ejercicio](/img/Relacional/Ejercicio%201%20Relacional.png)