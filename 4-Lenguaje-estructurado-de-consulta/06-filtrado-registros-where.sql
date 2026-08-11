/*=====================================================

SQL-DQL en SQLServer
Archivo: 06-filtrado-registros-where.sql
Descripción: Recuperar únicamente las filas que cumplen determinadas condiciones mediante la cláusula WHERE.

=====================================================*/


/*	Sintaxis general:

	SELECT

	FROM TABLA
	WHERE CONDICION;



	Orden sintáctico:

	SELECT
	FROM
	JOIN / ON
	WHERE
	GROUP BY
	HAVING
	ORDER BY



	Orden de ejecución:

	FROM / JOIN
	WHERE
	GROUP BY
	HAVING
	SELECT
	DISTINCT
	ORDER BY
	TOP

*/

-- Seleccionar los datos de los clientes donde su número de cliente sea 25
SELECT
	c.id_cliente AS 'Número de cliente',
	CONCAT (c.nombre, ' ', c.apellido_paterno, ' ', c.apellido_materno) AS 'Nombre completo',
	c.correo
FROM clientes AS c
WHERE c.id_cliente = 25;


-- Seleccionar todas las categorías que sean de cómputo
SELECT
	c.id_categoria,
	c.nombre
FROM categorias AS c
WHERE c.nombre = 'CÓMPUTO';


-- Seleccionar los datos del cliente 1
SELECT *
FROM clientes AS c
WHERE c.nombre = 'Cliente1';


-- Seleccionar los datos de los clientes que no pertenecen al departamento 1
SELECT *
FROM departamentos AS d
WHERE ;


-- Seleccionar los productos cuyo precio sea superior a $490.00



-- Seleccionar los productos con existencia crítica inferior a 10 unidades



-- Seleccionar los empleados con salario de #30,000.00 o más



-- Seleccionar todas las ventas realizadas el 24 de diciembre de 2025 (formato AAAA-MM-DD)
SELECT
	v.id_venta,
	v.fecha,
	v.id_cliente,
	v.id_empleado
FROM ventas AS v
WHERE v.fecha = '2025-12-24';
GO


SELECT
	v.id_venta,
	v.fecha,
	YEAR(v.fecha) AS 'Año',
	MONTH(v.fecha) AS 'Mes',
	DAY(v.fecha) AS 'Día',
	FORMAT (v.fecha, 'MMMM') AS 'Mes en Inglés',
	UPPER(FORMAT (v.fecha, 'MMMM', 'es-ES')) AS 'Mes en Español',
	FORMAT (v.fecha, 'MMM') AS 'Mes abreviado en Inglés',
	FORMAT (v.fecha, 'MMM', 'es-ES') AS 'Mes abreviado en Español',
	FORMAT (v.fecha, 'dddd') AS 'Día en Inglés',
	FORMAT (v.fecha, 'dddd', 'es-ES') AS 'Día en Español',
	v.id_cliente,
	v.id_empleado
FROM ventas AS v
WHERE v.fecha = '2025-12-24';
GO