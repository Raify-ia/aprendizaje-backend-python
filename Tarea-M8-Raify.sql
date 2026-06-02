--Creacion de una tabla
CREATE TABLE Ventas(
NúmerodeOrden int,
FechadeOrden datetime2,
FechadeEntrega date,
EstatusdelaOrden varchar(50),
NombreCliente varchar(50),
DomiciliodeEntrega varchar(250),
CompraOnline char(1),
MétododePago varchar(50),
Subtotal decimal(10,2),
Observaciones varchar(250),
)

--Agregar el nombre de una columna especifica
ALTER TABLE Ventas ADD FechadeEnvío datetime

--Cambiar el nombre de una columna especifica
EXEC sp_rename 'Ventas.CompraOnline', 'BanderaCompraOnline', 'COLUMN'
ALTER TABLE Ventas
ALTER COLUMN BanderaCompraOnline CHAR(1) NOT NULL

--Creacion de una tabla
CREATE TABLE Prueba(Id int, Nombre varchar(50))

--Insertar datos a la tabla
INSERT INTO Prueba
VALUES(5, 'Santos')

--Eliminar una tabla pero sin perder su estuctura para poder recuperarse
TRUNCATE TABLE Prueba
--Eliminar una tabla pero de forma permanente sin dejas con toda su estructura
DROP TABLE Prueba

--Creacion de la tabla ordenes
CREATE TABLE Ordenes(Id int, Registro decimal(10,2) , Estado char(1))

--Insertando datos a la tabla Ordenes
INSERT INTO Ordenes
VALUES(9, 100-3, 'V')

--Eliminado de la tabal Ordenes los estados sean C
DELETE FROM Ordenes WHERE Estado = 'C'

SELECT * FROM Ordenes