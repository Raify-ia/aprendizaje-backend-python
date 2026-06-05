---obteniendo los nombres de los empleados de la tabla Person.Person
-- y bucando su puesto en HumanResources.Employee 

SELECT 
	p.FirstName,
	p.LastName,
	e.JobTitle
FROM HumanResources.Employee e
INNER JOIN Person.Person p
	ON e.BusinessEntityID = p.BusinessEntityID

--creando la consulta para obtener los nombres de los clientes de Person.Person
-- que esten relaciondos con Sales.Customer
SELECT 
	s.CustomerID,
	p.FirstName,
	p.LastName
FROM Sales.Customer s
LEFT JOIN Person.Person p
	ON s.PersonID = p.BusinessEntityID

--Usando el metodo RIGHT JOIN para mostrar el id de SalesOrderID y CustomerID
SELECT 
	p.SalesOrderID,
	c.CustomerID
FROM Sales.Customer c
RIGHT JOIN Sales.SalesOrderHeader p
	ON  c.CustomerID = p.CustomerID

--Usando las tablas Production.Product y Production.ProductReview para ver
--los comentrios y los productos que lo tienen
SELECT 
	p.Name,
	pr.Comments
FROM Production.Product p 
FULL JOIN Production.ProductReview pr
	ON  p.ProductID = pr.ProductID

--Creando la consulta que combina todos los productos con todas las categorías 
--usando un CROSS JOIN en la tabla Production.Product y Production.ProductCategory.
SELECT 
	p.Name,
	c.Name
FROM Production.Product  p 
CROSS JOIN Production.ProductCategory c

--Usando UNION para unir dos tablas y traer nombre sin duplicados
SELECT 
	Name
FROM Production.Product
UNION
SELECT 
	Name
FROM Production.ProductModel

--Usando UNION ALL para unir dos tablas y traer todos los nombre de ella
--sin importar si hay nombres duplicados 
SELECT ProductID,
	Name
FROM Production.Product
UNION ALL
SELECT ProductModelID, 
	Name
FROM Production.ProductModel

--Uso de COALESCE y CASE para mostrar el titulo del Manager
--solamente y todo lo demas como Not Manager
SELECT 
	BusinessEntityID,
	COALESCE(JobTitle, 'No Title') AS JobTitle,
	CASE
		WHEN JobTitle LIKE '%Manager%' THEN 'Manager'
		ELSE 'Not Manager'
	END AS ManagerStatus
FROM HumanResources.Employee





