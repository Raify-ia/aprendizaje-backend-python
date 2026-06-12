--Creo la vista llamada Production.vCostoProductoSimple para llamar los campos
--ya nombrados para la tabla Production.Product.
CREATE VIEW Production.vCostoProductoSimple
AS
SELECT
	ProductID,
	Name AS NombreProducto,
	ListPrice AS PrecioLista
FROM Production.Product
GO

SELECT *
FROM Production.vCostoProductoSimple

--Creando vista Production.vProductoConCosto  
--que combine las tablas Production.Product y Production.ProductCostHistory para mostrar los campos ProductID, Name
CREATE VIEW Production.vProductoConCosto
AS
SELECT
	p.ProductID,
	p.Name AS NombreProducto,
	p.ListPrice AS PrecioLista,
	pch.StartDate AS CostoEstandar,
	pch.StartDate AS FechaInicio
FROM Production.Product p
INNER JOIN Production.ProductCostHistory pch
	ON p.ProductID = pch.ProductID

SELECT *
FROM Production.vProductoConCosto

--Crea una función llamada dbo.fnCalcularDescuento que reciba dos parámetros 
--@Precio y @Descuento y devuelva el precio con el descuento aplicado.
CREATE FUNCTION dbo.fnCalcularDescuento
(
	@precio DECIMAL(10,2),
	@Descuento DECIMAL(5,2)
)
RETURNS DECIMAL(10,2)
AS
BEGIN
	RETURN @precio -(@precio * @Descuento / 100)

END
SELECT dbo.fnCalcularDescuento(100, 15) AS PrecioFinal

--Crea una función llamada dbo.fnLimpiarTexto que reciba un texto 
--como parámetro y lo limpie eliminando espacios al principio y al fina
CREATE FUNCTION dbo.fnLimpiarTexto
(
	@Texto VARCHAR(255)
)
RETURNS VARCHAR(255)
AS 
BEGIN
	SET @Texto = LTRIM(RTRIM(@Texto))
	SET @Texto = UPPER(@Texto)
	SET @Texto = REPLACE(@Texto, 'Á', 'A')
	SET @Texto = REPLACE(@Texto, 'É', 'E')
	SET @Texto = REPLACE(@Texto, 'Í', 'I')
	SET @Texto = REPLACE(@Texto, 'Ó', 'O')
	SET @Texto = REPLACE(@Texto, 'Ú', 'U')

RETURN @Texto
END

SELECT dbo.fnLimpiarTexto(' áéióú ' ) AS TextoLimpio

--Creando un procedimiento almacenado llamado dbo.uspObtenerProductosCostosos que reciba un 
--parámetro @PrecioMin y devuelva los productos cuyo precio de lista sea mayor que este parámetro.
CREATE PROCEDURE dbo.uspObtenerProductosCostos
	@PrecioMin DECIMAL(10,2)
AS 
BEGIN
	SELECT
		ProductID,
		Name AS NombreProducto,
		ListPrice AS PrecioLista
	FROM Production.Product
	WHERE ListPrice > @PrecioMin
END

EXEC  dbo.uspObtenerProductosCostos @PrecioMin = 1000
