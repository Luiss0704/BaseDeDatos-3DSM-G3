# Diccionario de Datos de la Base de Datos Credenciales

## 1. Información General

| Elemento | Valor |
| :--- | :--- |
| Proyecto | Sistema Integral Escolar y Administrativo |
| Versión | 1.0 |
| Fecha | 28 de Junio 2026 |
| Elaboró | Luis Fernando Gabriel Nieto Sánchez |
| SGBD | SQLServer |


<br>

## 2. Descripción del Sistema de Base de Datos

El sistema administra:
- Alumnos
- Teléfonos 
- Credenciales
- Materias
- Profesores 
- Departamentos
- Dependientes
- Proyectos 
- Participaciones

El sistema gestiona de manera integral la información académica y administrativa de una institución educativa, vinculando el historial académico de los alumnos, la gestión laboral de los profesores y la ejecución de proyectos institucionales bajo una estructura relacional.


<br>

## 3. Catálogo de Restricciones 

| Código | Significado |
| :--- | :--- |
| PK | Primary Key |
| FK | Foreign Key |
| NN | Not Null |
| UQ | Unique |
| AI | Auto Increment |
| CK | Check |


<br>

## 4. Dirección de Datos

**Tabla**: Alumno

**Descripción:** _Datos personales y de contacto del estudiante._
| Campos | Tipos | Longitud | Restricciones | Descripción |
| :--- | :---: | :---: | :---: | :--- |
| Matricula | VARCHAR | 20 | PK, NN | Identificador único del alumno |
| Nombre | NVARCHAR | 50 | NN | Nombre del alumno |
| Apellido1 | NVARCHAR | 50 | NN | Apellido paterno |
| Apellido2 | NVARCHAR | 50 | - | Apellido materno |
| Correo | NVARCHAR | 50 | - | Correo electrónico |
| Fechanaci | DATE | - | - | Fecha de nacimiento |

<br>

---

<br>

**Tabla**: Materia

**Descripción:** _Catálogo de asignaturas disponibles._
| Campos | Tipos | Longitud | Restricciones | Descripción |
| :--- | :---: | :---: | :---: | :--- |
| ClaveMateria | INT | - | PK, NN | Clave de la asignatura |
| NombreMateria| NVARCHAR | 50 | NN | Nombre de la materia |
| Creditos | INT | - | NN | Créditos otorgados |
| NumProf | INT | - | FK | Profesor responsable |

<br>

---

<br>

 **Tabla**: Cursa

**Descripción:** _Tabla asociativa que vincula alumnos con materias._
| Campos | Tipos | Longitud | Restricciones | Descripción |
| :--- | :---: | :---: | :---: | :--- |
| Matricula | VARCHAR | 20 | FK, PK | Referencia al alumno |
| ClaveMateria | INT | - | FK, PK | Referencia a la materia |
| Fechainscrip | DATE | - | NN | Fecha de inscripción |
| Calificacionfinal| DECIMAL| - | - | Nota final del curso |

<br>

---

<br>

**Tabla**: Profesor

**Descripción:** _Información laboral y departamental docente._
| Campos | Tipos | Longitud | Restricciones | Descripción |
| :--- | :---: | :---: | :---: | :--- |
| Numprof | INT | - | PK, NN | Identificador del profesor |
| Nombre | NVARCHAR | 50 | NN | Nombre del profesor |
| Apellido1 | NVARCHAR | 50 | NN | Apellido paterno |
| Apellido2 | NVARCHAR | 50 | - | Apellido materno |
| NumDepFK | INT | - | FK | Departamento asociado |

<br>

---

<br>

**Tabla**: Proyecto

**Descripción:** _Proyectos institucionales activos._
| Campos | Tipos | Longitud | Restricciones | Descripción |
| :--- | :---: | :---: | :---: | :--- |
| NumProyecto | INT | - | PK, NN | Identificador del proyecto |
| Nombre | NVARCHAR | 50 | NN | Nombre del proyecto |
| Presupuesto | MONEY | - | - | Recursos asignados |

<br>

---

<br>

**Tabla**: Participa

**Descripción:** _Registro de participación de profesores en proyectos._
| Campos | Tipos | Longitud | Restricciones | Descripción |
| :--- | :---: | :---: | :---: | :--- |
| NumprofFK | INT | - | FK, PK | ID del profesor |
| NumproyFK | INT | - | FK, PK | ID del proyecto |
| Rol | NVARCHAR | 30 | NN | Función en el proyecto |

<br>

---

<br>

**Tabla**: Telefono

**Descripción:** _Registro de número de telefonos del alumno_
| Campos | Tipos | Longitud | Restricciones | Descripción |
| :--- | :---: | :---: | :---: | :--- |
| Clavetel | INT | - | PK, NN| ID del número de Teléfono |
| Telefono | INT | - |NN | Número de teléfono del alumno |
| Matricula | NVARCHAR | 20 | FK, NN | Número de matricula del alumno |

<br>

---

<br>

**Tabla**: Credencial

**Descripción:** _Registro de participación de profesores en proyectos._
| Campos | Tipos | Longitud | Restricciones | Descripción |
| :--- | :---: | :---: | :---: | :--- |
| NumCred | INT | - | PK, NN| ID del número de la credencial del alumno |
| Fechadeexp | DATE | - |NN | Fecha de la expedición de la credencial |
| Vigencia | DATE | - |NN | Fecha de la vigencia de la credencial|
| Matricula | NVARCHAR | 20 | FK, NN, UQ | Número de matricula del alumno |

<br>

---

<br>

**Tabla**: Departamento

**Descripción:** _Registro de participación de profesores en proyectos._
| Campos | Tipos | Longitud | Restricciones | Descripción |
| :--- | :---: | :---: | :---: | :--- |
| NumDep| INT | - | PK, NN| Número del departamento |
| NombreDep | NVARCHAR | 30 |NN | Nombre del departamento |
| Edificio |NVARCHAR| - |NN |Nombre del edicicio deonde se encuentra|

<br>

---

<br>

**Tabla**: Dependiente

**Descripción:** _Información de la persona que depende del profesor_
| Campos | Tipos | Longitud | Restricciones | Descripción |
| :--- | :---: | :---: | :---: | :--- |
| NombreDepend| NVARCHAR | 30 | PK, NN| Nombre del dependiente|
| NumProfesor | INT | - |NN | ID del Profesor |
| Fechanaci | DATE | - | - | Fecha de nacimiento |
| Parentezco | NVARCHAR | 30 | - | El parentezco que tiene con el profesor |


<br>

## 5. Relaciones 

| Relación | Cardinalidad | Descripción |
| :--- | :---: | :--- |
| Alumno <-> Curso | 1:N | Un alumno inscrito en varios cursos. |
| Materia -> Curso | 1:N | Una materia presente en varios cursos. |
| Profesor -> Departamento | N:1 | Un profesor pertenece a un departamento. |
| Profesor <-> Proyecto | N:N | Resuelta por la tabla Participa. |


<br>

## 6. Matriz de Claves Foráneas

| Tabla | Campo FK | Referencia |
| :--- | :---: | :--- |
| Curso | Matricula | Alumno(Matricula) |
| Curso | ClaveMateria | Materia(ClaveMateria) |
| Materia | NumProf | Profesor(Numprof) |
| Participa | NumprofFK | Profesor(Numprof) |
| Participa | NumproyFK | Proyecto(NumProyecto) |


<br>

## 7. Integridad referencial 

| Regla | Descripción |
| :---: | :--- |
| IR-01 | No se puede inscribir un alumno inexistente en un curso. |
| IR-02 | Un profesor no puede ser eliminado si es responsable de una materia activa. |
| IR-03 | Las tablas asociativas (Curso, Participa) no deben permitir valores nulos en sus FK. |
| IR-04 | Los cambios en llaves primarias deben replicarse en cascada. |


<br>

## 8. Reglas del negocio

| Código | Regla |
| :---: | :--- |
| RN-01 | Todo profesor debe pertenecer a un departamento. |
| RN-02 | Un alumno puede cursar muchas materias, pero cada registro de curso almacena su calificación única. |
| RN-03 | La tabla Participa es indispensable para auditar el rol de un profesor en un proyecto. |


<br>

## 9. Diagrama relacional    

![Solución del ejercicio](/img/Relacional/Ejercicio%205%20Relacional.png)