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



USE comercial_db;


--- Comparaciones con expresiones calculadas
--- WHERE  tmabien puede evaluar un calculo 

--- Mostarar productos cuyo valor del inventario sea mayorn a $50,000

SELECT 
	p.codigo,
	p.nombre,
	p.precio,
	p.existencia,
	(p.precio * p.existencia) AS valor_inventario
FROM productos AS p
WHERE (p.precio * p.existencia) > 50000.4
ORDER BY valor_inventario DESC;
GO


--- Operador Logico AND
--- Mostarar Productos con Precio entre $200 y $300 que ademas tengan menos de 50 unidades

SELECT 
	p.codigo,
	p.nombre,
	p.precio,
	p.existencia,
	(p.precio * p.existencia) AS valor_inventario
FROM productos AS p
WHERE p.precio >= 200
  AND p.precio <= 300
  AND p.existencia <50
GO


-- Clausula BETWEN (EQUIVALENTE A UN RANGO)

SELECT 
	p.codigo,
	p.nombre,
	p.precio,
	p.existencia,
	(p.precio * p.existencia) AS valor_inventario
FROM productos AS p
WHERE p.precio BETWEEN 200 AND 300
      AND p.existencia <50
GO

-- Mostar los empleados del departamento 1 cuyo salario sea superior a $25000


SELECT
	e.id_empleado,
	e.nombre,
	e.salario,
	e.id_departamento
FROM empleados AS e
WHERE e.salario > 25000
   AND e.id_departamento = 1;
GO

-- Mostar los productos cuya existencia inferior a 10 o superior a 190 

SELECT 
	p.codigo,
	p.nombre,
	p.precio,
	p.existencia,
	(p.precio * p.existencia) AS valor_inventario
FROM productos AS p
WHERE p.existencia < 10 OR p.existencia > 190
GO

-- Mostar los productos que no tengan precio mayor a 400
SELECT 
	p.codigo,
	p.nombre,
	p.precio,
	p.existencia,
	(p.precio * p.existencia) AS valor_inventario
FROM productos AS p
WHERE NOT (p.precio > 400);< 
GO

-- Selecionar los empleados que pertenezcan al departamento 1,
-- al departamento 2 y con salario mayor a 25000

SELECT
	e.id_empleado,
	e.nombre,
	e.salario,
	e.id_departamento
FROM empleados AS e
WHERE e.salario > 25000
   AND (e.id_departamento = 1
   OR e.id_departamento = 2);
GO


-- OPERADOR BETWEEN 
-- permite comprobar si un valor se encuntra dentro de un rango 
-- inclusivo


/*================================================================================
	SINTAXIS

	WHERE columna BETWEEN limite_inferior AND limite_superior

=================================================================================*/

--Mostara los empleados con salario entre $15,000.0 y 20,000.0 incluyendo ambos limites

SELECT
	e.id_empleado,
	e.nombre,
	e.salario
FROM empleados AS e
WHERE e.salario BETWEEN 15000 AND 20000
ORDER BY 3 DESC;
GO



SELECT
	e.id_empleado,
	e.nombre,
	e.salario
FROM empleados AS e
WHERE e.salario >= 15000 AND e.salario <= 20000
ORDER BY 3 DESC;


--Selecionar los productos donde el precio este entre 100 y 200 

SELECT 
	p.codigo,
	p.nombre,
	p.precio,
	p.existencia,
	(p.precio * p.existencia) AS valor_inventario
FROM productos AS p
WHERE p.precio BETWEEN 100 AND 200
GO




--Selecionar las ventas realiazadas del 1 de Enero de 2025 al 10 de Enero de 2025


SELECT 
	v.id_venta AS numero_venta,
	v.id_cliente AS cliente,
	v.id_empleado AS vendedor,
	v.fecha AS fecha_venta,
	UPPER(FORMAT (v.fecha, 'MMMM', 'es-ES')) AS [mes_venta],
	UPPER(FORMAT (v.fecha, 'dddd', 'es-ES')) AS [dia_venta],
	DATEPART(YEAR, v.fecha) AS [año_venta]
FROM ventas AS v
WHERE v.fecha BETWEEN '2025-01-01' AND '2025-01-10' 
ORDER BY fecha_venta ;
GO


-- NOT BEWTEEN 
-- Recupera valores que se encuntrannfuera de un rango


-- SELECIONAR LOS PRODUCTOS QUE NO SE ENCUYENTREN EN EL RANGO DE PRECIOS
-- DE 100 Y 400

SELECT 
	p.codigo,
	p.nombre,
	p.precio,
	p.existencia,
	(p.precio * p.existencia) AS valor_inventario
FROM productos AS p
WHERE p.precio NOT BETWEEN 100 AND 400;
GO


-- OPERADOR IN 
-- Permite comprobar una columna con una lista de valores 

/*================================================================================
	SINTAXIS

	WHERE columna IN (valor_1, valor_2, valor_n)

	Es equivalente a varias condiciones conectadas con OR

=================================================================================*/

-- Mostar los productos pertenecientes a las categorias 1, 7, 12

SELECT 
	p.codigo,
	p.nombre,
	p.precio,
	p.id_categoria
FROM productos AS p
WHERE p.id_categoria IN (1,7,12)
ORDER BY p.id_categoria;
GO

SELECT 
	p.codigo,
	p.nombre,
	p.precio,
	p.id_categoria
FROM productos AS p
WHERE p.id_categoria =1
	OR p.id_categoria =7
	OR p.id_categoria =12
ORDER BY p.id_categoria;
GO


--SELECIONAR LOS DEPARTAMENTOS  DE VENTAS , TI Y DIRECCIÓN

SELECT 
	d.id_departamento,
	d.nombre
FROM departamentos AS d
WHERE d.nombre IN ('Ventas','TI','Dirección')
ORDER BY 1;
GO


-- NOT IN
-- Excluye los valores incluidos en la lista

-- Mostrar los datos de los empleados que no pertenezcan ni al departamento 1 ni al 2
SELECT
	e.id_empleado,
	e.nombre,
	e.id_departamento
FROM empleados AS e
WHERE e.id_departamento NOT IN (1,2);
GO


/*
===========================================================================
		LIKE
		Permite buscar patrones dentro de valores de texto
		SINTAXIS:
		WHERE columna LIKE 'patron'
		Los patrones pueden contener comodines, los principales son:

		Comodin			Significado
		  %				Cero, uno o varios caracteres
		  _				Exactamente un caracter
		[abc]			Un caracter incluido en la lista
		[a-f]			Un caracter incluido en el rango
		[^abc]			Un caracter no incluido en la lista
===========================================================================
*/



-- Comodin %
-- Representa cualquier cantidad de caracteres, incluyendo 0 caracteres

-- Comienza con
-- WHERE nombre LIKE 'Cliente1%'
-- Valores que comienzan con Cliente1

-- Termina con
-- WHERE correo LIKE '%mail.com'
-- Valores que terminan con mail.com

-- Contiene
-- WHERE nombre LIKE '%a%'
-- Valores que contienen 'a' donde sea



-- Mostrar los productos donde el código comience con P0001
SELECT
	p.codigo,
	p.nombre,
	p.precio
FROM productos AS p
WHERE p.codigo LIKE 'P001%';




-- Mostrar los datos de los clientes en donde su correo termine con 10@mail.com
SELECT
	c.id_cliente,
	c.nombre,
	c.correo
FROM clientes AS c
WHERE c.correo LIKE '%10@mail.com';


-- Mostrar los datos de los productos donde el nombre contenga el caracter 1
SELECT
	p.nombre,
	p.precio
FROM productos AS p
WHERE p.nombre LIKE '%1%';




-- Comodin de 1 caracter
-- El guión bajo (_) representa exactamente un caracter


-- Seleccionar los datos de los productos donde el código comience con P000 y despues exactamente con un caracter adicional
SELECT
	p.codigo,
	p.nombre,
	p.precio
FROM productos AS p
WHERE p.codigo LIKE 'P000_';