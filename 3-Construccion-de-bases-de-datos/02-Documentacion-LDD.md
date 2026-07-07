# Construcción de Base de Datos con Lenguaje SQL 

El lenguaje SQL (Structure, Query Language), se divide en cinco grandes categorias:

1. DDL (Data Definition Language)
2. DML (Data Manipulation Language)
3. DQL (Data Query Language)
4. DCL (Data Control Language - Controla permisos) GRANT, REVOKE, 
5. TCL (Transaction Control Languaje - Controla Transaccions) -BEGIN TRANSACTION, COMMIT, ROLLBACK, SAVEPOINT 

## SQL-DDL

**Lenguaje de Definicion de Datos**

Se utiliza para **crear y modificar la estructura** de una base de datos

Con DDL trabajamos sobre los objetos de la base de datos 
- _Base de datos_
- _Tablas_
- _Restricciones_
- Vistas
- Índices
- Esquemas
- Store Precedures
- Fuctions
- Triggers 

**Comandos Principales**
| Comando |  Funcion |
| :--- | :--- |
| CREATE | Este crea objetos de la base de datos |
| ALTER | Modifica objetos de la base de datos|
| DROP |Elimina objetos de la base de datos|
| TRUNCATE |Este vacía una tabla|
| RENAME |Renombra Objetos (Según el SGBD)|

## SQL-DML
**Lenguaje de Manipulación de Datos** 

Sirve para **trabajar con la información alamacenada**

Con este lenguaje no se cambia la estructura, sino los registros

**Comandos Principales**

| Comando |  Funcion |
| :--- | :--- |
| INSERT | Este inserta registros |
| UPDATE | Actualiza registros|
| DELETE | Elimina resgistros|

## SQL-DQL

**Lenguaje de consulta de datos**

Su funcion es **consulta información**

Este es probablemente el grupo más utilizado

**Comando Principal**

| Comando |  Funcion |
| :--- | :--- |
| SELECT | Sirve para consultar información |

Generalmente se combiana con: 

- WHERE
- ORDER BY
- GROUP BY
- HAVING 
- JOIN (LEFT, RIGHT, INNER,FULL,CROSS)
- TOP/LIMIT
- Funciones de agregado (SUM,AVG,MIN,MAX,COUNT)
- Window Fuctions (Funciones de Ventana)

## Nomenclatura para la construcción de las Bases de Datos (Snake Case)

La nomenclatura o la convención que más se recomienda hoy sí se busca una nomenclatura moderna, portable y alineada con buenas prácticas en distintos motores de base de datos.

La razón es que funciona de forma consistente en **SQL SERVER, MYSQL, MARIADB** y especialmente en **POSTGRESSQL**, donde los identificadores sin comillas se convierten automáticamente a minusculas. Con **snake_case** evitas problemas de mayúsculas y haces que las consultas sean más legibles. 

|  Objeto | Convensión | Ejemplo |
|:----------|:---------:|----------:|
| Base de Datos | snake_case | control_escolar |
| Esquema | snake_case | ventas, rh, seguridad |
| Tabla | Singular en snake_case | cliente, pedido, detalle_pedido |
| Columna | snake_case | cliente_id, fecha_registro, correo_electronico |
| PK | <tabla>_id | cliente_id, producto_id |
| FK | Igual que la PK referenciada | cliente_id, producto_id |
| Tabla puente | <tabla_1>_<tabla_2> | alumno_curso, producto_provedor |

## Nombrar las Restricciones

- pk_cliente
- fk_pedido_cliente
- uq_cliente_correo_electronico
- ck_producto_precio
- df_cliente_activo
- ix_pedido_fecha

**Prefijos**

- pk (Primary Key)
- fk (Foreign Key)
- uq (Unique)
- ck (Check)
- df (Default)
- ix (Index)