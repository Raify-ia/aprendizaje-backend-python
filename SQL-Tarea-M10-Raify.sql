--Usando la clausula GROUP BY para agrupar columnas especificas
--de la tabla Sales.SalesOrderDetail
SELECT ProductID,
	SUM(OrderQty) AS TotalQuantity,
	SUM(LineTotal) AS TotalSales

FROM Sales.SalesOrderDetail
GROUP BY ProductID

--Obteniendo el total de ventas de la tabla Sales.SalesOrderDetail guiandome por
--el ProductID y filtrando por un numero especifico de ventas superior a 50 
SELECT ProductID,
	SUM(OrderQty) AS TotalQuantity
FROM Sales.SalesOrderDetail
GROUP BY ProductID
HAVING SUM(OrderQty) > 50

--Usndo la tabla Sales.SalesOrderDetail para mostrar el
--cláusula SalesOrderID, ProductID y y LineTotal con OVER con PARTITION BY.
SELECT 
SalesOrderID,
	ProductID,
	LineTotal,
	SUM(LineTotal) OVER (PARTITION BY SalesOrderID, ProductID) 
	TotalOrderValue
FROM Sales.SalesOrderDetail

--Usando ROW_NUMBER  para numerar cada línea de pedido 
--dentro de cada SalesOrderID.
SELECT 
	SalesOrderID,
	SalesOrderDetailID,
	ProductID,
	LineTotal,
	ROW_NUMBER() OVER (PARTITION BY SalesOrderID ORDER BY SalesOrderDetailID) AS RowNum
FROM Sales.SalesOrderDetail

--Asigna un rango para cada producto por cada SalesOrderID 
--basadome en el LineTotal usando la función RANK().
SELECT 
	SalesOrderID,
	ProductID,
	LineTotal,
	RANK() OVER (PARTITION BY SalesOrderID ORDER BY LineTotal DESC) AS Rank
FROM Sales.SalesOrderDetail

--Asigna el rango denso a cada producto dentro de cada SalesOrderID 
--basadome en el LineTotal usando la función DENSE_RANK().
SELECT 
	SalesOrderID,
	ProductID,
	LineTotal,
	DENSE_RANK() OVER (PARTITION BY SalesOrderID ORDER BY LineTotal DESC) AS DENSERANK
FROM Sales.SalesOrderDetail

--agrupando los datos de ProductID para obtener el valor de venta LineTotal
--para filtrar aquellos con valor a mas de 5000 y ordenarlos de forma decendente
SELECT 
	ProductID,
	SUM(LineTotal) AS TotalSales
FROM Sales.SalesOrderDetail
GROUP BY ProductID
HAVING SUM(LineTotal) > 5000 
ORDER BY(TotalSales) DESC 
