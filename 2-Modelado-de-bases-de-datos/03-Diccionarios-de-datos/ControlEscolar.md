# Diccionario de datos de base de datos Control Escolar

**1. Información General.**

| Elemento | Valor |
| :--- | :--- |
| Proyecto | Sistema de Control Escolar |
| Versión | 1.0 |
| Fecha | Junio 2026 |
| Elaboró | Ing. José Luis Herrera Gallardo, MTI |
| SGBD | SQLServer |

<br>
<br>

**2. Descripción del Sistema de Base de Datos.**

El sistema administra:
- Carreras
- Alumnos
- Profesores
- Materias
- Grupos
- Inscripciones

Permite controla la oferta educativa y la inscripción de los estudiantes

<br>
<br>

**3. Catálogo de restricciones utilizadas.**

| Código | Significado |
| :--- | :--- |
| PK | Primary Key |
| FK | Foreign Key |
| NN | Not Null |
| UQ | Unique |
| AI | Auto Increment |
| CK | Check  |
| DF | Default |

<br>
<br>

**4. Diccionario de Datos**

**Tabla:** Carrera

**Descripcion:** _Almacena las carreras ofertadas por la Universidad_

| Campo | Tipo | Longitud | Restricciones | Descripcion |
| :--- | :---: | :---: | :---: | :--- |
| id_carrera | INT | - | PK, AU, NN | Identificador unico de la carrera|
| nombre | VARCHAR|  100 | UQ, NN|Nombre de la Carrera |
| duracion_cuatrimestre | INT|  - | NN, CK(>0)|Duracion del Cuatrimestre |

<br>

---

<br>
<br>

**Tabla:** Alumno

**Descripcion:** _Almacena la informacion de los estudiantes_

| Campo | Tipo | Longitud | Restricciones | Descripcion |
| :--- | :---: | :---: | :---: | :--- |
| id_alumno | INT | - | PK, AU, NN | Identificador unico del alumno|
| matricula | VARCHAR | 10 |UQ, NN | Matricula institucional del alumno|
| nombre | VARCHAR|  50 | NN |Nombre del Estudiante |
| apellido_paterno | VARCHAR|  50 | NN|Apellido paterno |
| apellido_materno | VARCHAR|  50 | NULL|Apellido materno |
| correo | VARCHAR|  100 | UQ, NN|Correo del alumno |
| fecha_nacimiento | DATE | - | NN | Fecha de nacimiento |
| id_carrera | INT | - | FK, NN | Carrera a la que pertenece |


<br>
<br>

**5. Relaciones**
| Relación | Cardinalidad | Descripción |
| :--- | :---: | :--- |
| Carrera --> Alumno | 1 : N | Una carrera tiene muchos alumnos |
| Carrera --> Materia | 1 : N | Una carrera tiene muchas materias |
| Profesor --> Grupo | 1 : N | Un profesor puede impartir a varios grupos |
| Materia --> Grupo | 1 : N | Una materia puede abrirse en varios grupos |
| Alumno --> Inscripcion | 1 : N | un alumno puede tener varias inscripciones |
| Grupo --> Inscripcion | 1 : N | Un grupo puede tener muchos alumnos |

<br>
<br>

**6. Matriz de claves foraneas**

| Tabla | Campo FK | Referencia |
| :--- | :---: | :--- |
| Alumno | id_carrera | Carrera (id_carrera) |
| Materia | id_carrera | Carrera (id_carrera) |
| Grupo | id_profesor | Profesor (id_profesor) |
| Grupo | id_materia | Materia (id_materia) |
| Inscripcion | id_alumno | Alumno (id_alumno) |
| Inscripcion | id_grupo | Grupo (id_grupo) |

<br>
<br>

**7. Integridad referencial**

| Regla | Descripción |
| :---: | :--- |
| IR-01 | No se puede registrar a un alumno con una carrera inexistente |
| IR-02 | No se puede crear un grupo para una materia inexistente |
| IR-02 | No se puede crear un grupo para un profesor inexistente |

<br>
<br>

**8. Reglas del negocio**

| Código | Regla |
| :---: | :--- |
| RN-01 | Un alumno pertenece solo a una única carrera |
| RN-02 | Una carrera puede tener muchos alumnos |
| RN-03 | Una carrera puede tener muchas materias |

<br>
<br>

**9. Diagrama Relacional**

![Solución al ejercicio](/img/Relacional/Ejercicio.png)