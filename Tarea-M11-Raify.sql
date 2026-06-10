-- Usando la tabla Production.Product, consulta para mostrar los nombres de los productos 
--y los ID’s de  productos que hayan sido ordenados.
--filtrando los productos ordenados en la tabla Sales.SalesOrderDetail. 
--Ordenado el resultado por nombre de manera ascendente.
SELECT Name,
	   ProductID
FROM Production.Product
WHERE ProductID IN (
	SELECT ProductID
	FROM Sales.SalesOrderDetail
)
ORDER BY Name ASC

-- creando una consulta que muestre un listado de todos los empleados 
--y el nombre de su departamento actual. Los campos que se mustran son:  
--BusinessEntityID, FirstName + ' ' + LastName como Nombre del Empleado, 
--y Name como Nombre del Departamento.
SELECT 
	e.BusinessEntityID,
	p.FirstName + ' ' + p.LastName AS [NameEmployee],
	d.Name AS [NameDepartment]
FROM HumanResources.Employee e
INNER JOIN Person.Person p
	ON e.BusinessEntityID = p.BusinessEntityID
INNER JOIN HumanResources.EmployeeDepartmentHistory edh
	ON e.BusinessEntityID = edh.BusinessEntityID
INNER JOIN HumanResources.Department d
	ON edh.DepartmentID = d.DepartmentID
WHERE edh.EndDate IS NULL

--Usando la tabla HumanResources.Employee, HumanResources.EmployeeDepartmentHistory y HumanResources.Department
--para crear una consulta que muestre el mismo resultado que en el ejercicio 2, pero utilizando un CTE
WITH EmployeeDepartment AS (
	SELECT
		e.BusinessEntityID,
		p.FirstName + ' ' + p.LastName AS [NameEmployee],
		d.Name AS [NameDepartment]
	FROM HumanResources.Employee e
	INNER JOIN Person.Person p
		ON e.BusinessEntityID = p.BusinessEntityID
	INNER JOIN HumanResources.EmployeeDepartmentHistory edh
		ON e.BusinessEntityID = edh.BusinessEntityID
	INNER JOIN HumanResources.Department d
		ON edh.DepartmentID = d.DepartmentID
	WHERE edh.EndDate IS NULL
)
SELECT 
	BusinessEntityID,
	[NameEmployee]
FROM EmployeeDepartment

--Creando tblas temporales e insertando solo los datos ProductID, Name de 
--la tabla Production.Product
CREATE TABLE #ProductosLocal(
	ProductID int,
	Name nvarchar(50))

INSERT INTO #ProductosLocal(ProductID, Name)
SELECT ProductID,
	Name
FROM Production.Product
	

CREATE TABLE ##ProductosLocal(
	ProductID int,
	Name nvarchar(50))
FROM Production.Product
	
INSERT INTO ##ProductosLocal (ProductID, Name)
SELECT
    ProductID,
    Name
FROM Production.Product;

select *
from #ProductosLocal
select *
from ##ProductosLocal

--Usando la tabla Sales.SalesOrderHeader para crear una consulta que muestre 
--los números de orden y números de compra solo para el año 2011.
SELECT 
	SalesOrderID,
	PurchaseOrderNumber
FROM Sales.SalesOrderHeader
WHERE YEAR(OrderDate) = 2011

--Usando la tabla Sales.SalesOrderHeader para crear consultas para mostrar los números de 
--orden y números de compra sin los 2 primeros caracteres y nombra los campos 
--resultantes como NewSalesOrderNumber y NewPurchaseOrderNumber.
SELECT 
	SUBSTRING(SalesOrderNumber, 3, LEN(SalesOrderNumber) -2 ) AS NewSalesOrderNumber,
	SUBSTRING(PurchaseOrderNumber, 3, LEN(PurchaseOrderNumber) -2) AS NewPurchaseOrderNumber
FROM Sales.SalesOrderHeader