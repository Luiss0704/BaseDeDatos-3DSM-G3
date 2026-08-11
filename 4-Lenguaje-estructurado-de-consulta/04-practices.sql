/*=====================================================

SQL-DQL en SQLServer
Archivo: 04-practices.sql
Descripción: Realiza los ejemplos del comando SELECT

=====================================================*/


SELECT * FROM [dbo].[categorias];
SELECT * FROM [dbo].[ciudades];
SELECT * FROM [dbo].[clientes];
SELECT * FROM [dbo].[departamentos];
SELECT * FROM [dbo].[detalle_ventas];
SELECT * FROM [dbo].[empleados];
SELECT * FROM [dbo].[estados];
SELECT * FROM [dbo].[productos];
SELECT * FROM [dbo].[proveedores];
SELECT * FROM [dbo].[ventas];



SELECT COUNT(*) FROM [dbo].[categorias];
SELECT COUNT(*) FROM [dbo].[ciudades];
SELECT COUNT(*) FROM [dbo].[clientes];
SELECT COUNT(*) FROM [dbo].[departamentos];
SELECT COUNT(*) FROM [dbo].[detalle_ventas];
SELECT COUNT(*) FROM [dbo].[empleados];
SELECT COUNT(*) FROM [dbo].[estados];
SELECT COUNT(*) FROM [dbo].[productos];
SELECT COUNT(*) FROM [dbo].[proveedores];
SELECT COUNT(*) FROM [dbo].[ventas];

/*=======================================================

Instrucción SELECT

Sintaxis: 
	SELECT 
		[columna_1],
		[columna_2],
		[columna_3],
		[columna_N]
	FROM [nombre_tabla];

=======================================================*/




-- Mostrar todos los estado de la República
Select * 
FROM estados;  -- No es recomendable usarla cuando hay muchos datos

SELECT
	nombre
FROM estados;




-- Mostrar los nombre de los departamentos
SELECT
	nombre
FROM departamentos;



--Mostrar el nombre del proveedor, el teléfono y su contacto
SELECT
	empresa,
	telefono,
	contacto
FROM proveedores;




-- Orden lógico de una consulta SELECT




-- Orden de como escribimos la consulta
	-- SELECT
	-- FROM
	-- WHERE
	-- GROUP BY
	-- HAVING
	-- ORDER BY




-- Orden de ejecución de SQLServer
	-- FROM
	-- WHERE
	-- GROUP BY
	-- HAVING
	-- SELECT
	-- ORDER BY




-- Alias de columnas




-- Mostrar los nombres de los estados
SELECT
	nombre 'Nombre del estado'
FROM estados;

SELECT
	nombre AS 'Nombre del estado'
FROM estados;

SELECT
	nombre Nombredelestado
FROM estados;

SELECT
	nombre AS Nombre_del_estado
FROM estados;

SELECT
	nombre [Nombre del estado]
FROM estados;

SELECT
	nombre AS [Nombre del estado]
FROM estados;

SELECT
	COUNT(*) AS [Total de ventas detallado]
FROM detalle_ventas;




-- Mostrar el código, nombre y precio del producto pero con nombres más adecuados para el usuario
SELECT
	codigo AS codigo_producto,
	UPPER(nombre) AS producto,
	precio AS precio_unitario
FROM productos;




-- TODO: Ver campos calculados