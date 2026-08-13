/*=====================================================

SQL-DQL en SQLServer
Archivo: 05-consultas-basicas.sql
Descripción: Introducción a la ejecución de las primeras consultas de recuperación de datos

=====================================================*/

USE comercial_db;
GO

-- Utilizando el operador asterisco (*). No es muy recomendada.
-- *: todas las columnas

SELECT *
FROM productos;
GO



-- Seleccionar columnas necesarias (Proyección)

SELECT
	nombre
FROM estados;
GO

SELECT
	codigo,
	nombre,
	precio
FROM productos;
GO

SELECT
	nombre,
	apellido_paterno,
	telefono,
	correo
FROM clientes;
GO

SELECT nombre, apellido_paterno, telefono, correo
FROM clientes;
GO



-- Alias de columna: es un nombre temporal asignado a una columna dentro del resultado de una consulta

SELECT
	codigo AS codigo_producto,
	nombre AS nombre_producto,
	precio AS precio_unitario
FROM productos;
GO

SELECT
	codigo AS 'Código del producto',
	nombre AS 'Nombre del producto',
	precio AS 'Precio unitario'
FROM productos;
GO

-- Solo en SQL Server:
SELECT
	codigo AS [Código del producto],
	nombre AS [Nombre del producto],
	precio AS [Precio unitario]
FROM productos;
GO



-- Alias de Tabla:

SELECT
	p.codigo,
	p.nombre,
	p.precio
FROM productos AS p;
GO

SELECT
	productos.codigo,
	productos.nombre,
	productos.precio
FROM productos;
GO

-- Caso de error: La tabla ya no se llama productos, sino p
SELECT
	productos.codigo,
	productos.nombre,
	productos.precio
FROM productos AS p;
GO

SELECT
	categorias.id_categoria,
	categorias.nombre AS 'Nombre de la categoría',
	id_producto AS 'Número del producto',
	productos.nombre AS 'Nombre del producto',
	precio,
	existencia
FROM categorias
INNER JOIN
productos
ON categorias.id_categoria = productos.id_categoria;
GO

SELECT
	c.id_categoria,
	c.nombre AS 'Nombre de la categoría',
	id_producto AS 'Número del producto',
	p.nombre AS 'Nombre del producto',
	precio,
	existencia
FROM categorias AS c
INNER JOIN
productos AS p
ON c.id_categoria = p.id_categoria;
GO



-- Columnas calculadas
-- Seleccionar los datos de los productos y el valor del inventario

/*
	Operadores:
	()
	*, /
	%,
	+,-
*/

SELECT
	p.codigo AS 'Código del producto',
	p.nombre AS 'Nombre del producto',
	p.precio AS 'Precio del producto',
	p.existencia AS 'Existencias',
	(precio * existencia) AS 'Valor de inventario'
FROM productos AS p;
GO



-- Seleccionar los datos de las ventas,numero de ventas, cantidad vendidad, precio, descuento y calcular el importe
-- bruto, el importe con descuento y el importe neto.

SELECT 
	dv.id_venta AS 'Número de venta',
	dv.cantidad AS 'Cantidad vendida',
	dv.precio AS 'Precio de venta',
	dv.descuento AS 'Descuento',
	(dv.cantidad * dv.precio) AS 'Importe bruto',
	(dv.cantidad * dv.precio * descuento) / 100.0 AS 'Importe de descuento',
	(dv.cantidad * dv.precio) * (1 - descuento / 100.0) AS 'Importe neto'
FROM detalle_ventas AS dv;
GO



-- Uso de DISTINCT: Elimina del resultado las filas que tengan valores repetidos en todas las columnas seleccionadad.
/* Sintaxis:
	SELECT DISTINCT columna FROM tabla;
*/

-- Ejemplo sin DISTINCT
-- Selecciona los sexos de los clientes
SELECT
	sexo
FROM clientes;
GO

-- Ejemplo con DISTINCT
SELECT DISTINCT
	sexo
FROM clientes;
GO


-- Seleccionar los distintos descuentos que se han aplicado a las ventas
-- Sin DISTINCT
SELECT
	dv.descuento
FROM detalle_ventas AS dv
ORDER BY 1 DESC;

-- Con DISTINCT
SELECT DISTINCT
	dv.descuento
FROM detalle_ventas AS dv
ORDER BY 1 DESC;


-- Seleccionar los distintos departamentos a los que pertenecen los empleados
SELECT DISTINCT
	e.id_empleado AS 'Número de empleado',
	e.nombre AS 'Empleado',
	e.id_departamento AS 'No. de depto. (Empleado)',
	d.id_departamento AS 'No. de depto. (Departamento)',
	d.nombre AS 'Departamento'
FROM empleados AS e
INNER JOIN
	departamentos AS d
ON e.id_departamento = d.id_departamento
ORDER BY e.nombre;
GO


-- Cuando se utiliza con varias columnas, se evalúa la combinación completa
SELECT DISTINCT
	p.id_categoria AS 'Número de categoría',
	p.id_proveedor AS 'Número de proveedor'
FROM productos AS p;
GO



-- USO DE TOP 
-- Este limita la cantidad de filas devueltas por una columna

/*=============================================================

SELECT TOP (cantidad)
	columna_1,
	columna_2,
	columna_n
FROM tabla;

================================================================*/

-- Seleccionar los 5 primeros productos encontrados en la tabla productos
SELECT TOP (15)
	id_producto,
	codigo
FROM productos AS p
ORDER BY id_producto DESC;
GO


-- Seleccionar los primeros cinco productos que aparezcan en la consulta, mostrando el código, nombre, precio, existencia
-- y el valor del inventario de la tabla productos

SELECT TOP (5)
	p.codigo,
	p.nombre,
	p.precio,
	p.existencia,
	(p.precio * p.existencia) AS 'Valor de inventario'
FROM productos AS p;
GO


-- TOP con porcentaje: SQLServer permite limitar el resultado mediante un porcentaje.

/*	Sintaxis:

	SELECT TOP (porcentaje) PERCENT
		columnas
	FROM tabla;

*/

-- Seleccionar el 10% de los registros de la tabla productos mostrando el número de producto, código, nombre.
SELECT TOP (10) PERCENT
	p.id_producto,
	p.codigo,
	p.nombre
FROM productos AS p;
GO


-- Seleccionar los 3 primeros descuentos distintos
SELECT DISTINCT TOP (3)
	dv.descuento
FROM detalle_ventas AS dv;
GO