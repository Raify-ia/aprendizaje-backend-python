--
USE master;
GO
CREATE DATABASE Paperclip
ON PRIMARY
(
	Name = Paperclip_log,
	FILENAME = 'C:\BasesDeDatos\Paperclip.mdf',
	SIZE = 8MB,
	FILEGROWTH = 64MB
)
LOG ON
(
	Name = Paperclip_Data,
	FILENAME = 'C:\BasesDeDatos\Paperclip_log.ldf',
	SIZE = 8MB,
	FILEGROWTH = 64MB,
	MAXSIZE = 2097152MB
)

--
USE Paperclip;
GO
CREATE TABLE RH.Departamento
(
	IDDepartamento INT NOT NULL
);
GO
CREATE TABLE RH.Empleados
(
	IDEmpleado INT NOT NULL
);
GO
CREATE TABLE Ventas.Clientes
(
	IDCliente INT NOT NULL
);
GO
CREATE TABLE Ventas.Ordenes
(
	IDOrden INT NOT NULL
);
GO
CREATE TABLE Ventas.Productos
(
	IDOrden INT NOT NULL
)
GO
--Para insertar los registro especificamente en tabla RH_Departamento
USE Paperclip;
GO

BULK INSERT RH.Departamento
FROM 'C:\Users\Franc\OneDrive\Desktop\RH_Departamento.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
);
GO
--Para insertar los registro especificamente en tabla RH_Empleados
USE Paperclip;
GO

BULK INSERT RH.Empleados
FROM 'C:\Users\Franc\OneDrive\Desktop\RH_Empleados.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
);
GO
--Para insertar los registro especificamente en tabla Ventas.Clientes
USE Paperclip;
GO

BULK INSERT Ventas.Clientes
FROM 'C:\Users\Franc\OneDrive\Desktop\Ventas_Clientes.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
);
GO
--Para insertar los registro especificamente en tabla Ventas.Ordenes
USE Paperclip;
GO

BULK INSERT Ventas.Ordenes
FROM 'C:\Users\Franc\OneDrive\Desktop\Ventas_Ordenes.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
);
GO
--Para insertar los registro especificamente en tabla Ventas.Productos
USE Paperclip;
GO

BULK INSERT Ventas.Productos
FROM 'C:\Users\Franc\OneDrive\Desktop\Ventas_Productos.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
);
GO

--Para verificar la insrtacionde form correcta
SELECT COUNT(*) Conteo
FROM RH.Departamento

SELECT COUNT(*) Conteo
FROM RH.Empleados

SELECT COUNT(*) Conteo
FROM Ventas.Clientes


SELECT COUNT(*) Conteo
FROM Ventas.Ordenes

SELECT COUNT(*) Conteo
FROM Ventas.Productos

--
USE master;
GO

BACKUP DATABASE Paperclip
TO DISK = 'C:\BasesDeDatos\Respaldos\Paperclip.bak'
WITH

    FORMAT,
    INIT,
    NAME = 'Respaldo Completo Paperclip'

GO
--
RESTORE HEADERONLY
FROM DISK = 'C:\BasesDeDatos\Respaldos\Paperclip.bak';
GO