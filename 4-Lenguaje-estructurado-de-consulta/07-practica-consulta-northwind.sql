-- Mostrar las ventas realizadas en Francia, brazil y belgica
-- de 10 de julio e 1996 al 31 de Diciembre de 1998, que tenga Region de Envio,
-- para los clientes VICTE, HANAR y SUPRD, y ordenados por fecha de pedido de la mas
-- cercana a la mas antigua.

SELECT
	o.OrderID AS 'Orden',
	o.CustomerID AS 'Número de cliente',
	o.ShipCountry AS 'Lugar de envío',
	o.OrderDate AS 'Fecha de la órden',
	UPPER(FORMAT(o.OrderDate, 'dddd', 'es-Es')) AS 'Día de la orden',
	UPPER(FORMAT(o.OrderDate, 'MMMM', 'es-Es')) AS 'Mes de la orden',
	DATEPART(YEAR, o.OrderDate) AS 'Año de la órden',
	o.ShipRegion AS 'Región'
FROM orders AS o
WHERE
	o.ShipCountry IN ('France', 'Brazil', 'Belgium') AND
	o.CustomerID IN ('VICTE', 'HANAR', 'SUPRD') AND
	o.ShipRegion IS NOT NULL AND
	o.OrderDate BETWEEN '1996-07-10' AND '1998-12-31'
ORDER BY o.OrderDate DESC;
GO


SELECT
	OrderID,
	OrderDate,
	ShipRegion
FROM Orders
WHERE ShipRegion IS NOT NULL;
GO





-- Consulta perrona
SELECT
	o.OrderID,
	o.OrderDate,
	p.ProductName,
	p.UnitPrice
FROM Orders AS o
INNER JOIN
	[Order Details] AS od
ON o.OrderID = od.OrderID
INNER JOIN Products AS p
ON od.ProductID = p.ProductID
WHERE
	o.OrderDate BETWEEN '1996-07-10' AND '1998-12-31' AND
	p.ProductName LIKE 'Chan%';
GO



-- Caso de error
SELECT
	o.OrderID,
	o.OrderDate,
	p.ProductName,
	p.UnitPrice
FROM Orders AS o
INNER JOIN
	[Order Details] AS od
ON o.OrderID = od.OrderID
INNER JOIN Products AS p
ON od.ProductID = p.ProductID
WHERE p.ProductName = 'Chan';
GO




SELECT
	c.CustomerID,
	c.CompanyName,
	c.ContactName
FROM Customers AS c
WHERE c.CompanyName LIKE '%ta%';
GO