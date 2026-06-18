USE Paperclip
GO 

CREATE TABLE Ventas.Cliente(
	IDCliente INT IDENTITY(1,1) NOT NULL,
	NombreCliente VARCHAR(50) NOT NULL,
	ApellidoPaterno VARCHAR(50) NOT NULL,
	ApellidoMaterno VARCHAR(50) NOT NULL,
	Domicilio VARCHAR(200) NOT NULL,
	Email VARCHAR(100) NOT NULL,
	Telefono VARCHAR(20) NOT NULL

	CONSTRAINT PK_Cliente PRIMARY KEY(IDCliente),
	CONSTRAINT UQ_Cliente_Email UNIQUE(Email),
)
GO
CREATE TABLE Ventas.Proveedor(
	IDProveedor INT IDENTITY(1,1) NOT NULL,
	NombreProveedor VARCHAR(100) NOT NULL,
	Contacto VARCHAR(100) NOT NULL,
	Telefono VARCHAR(20) NOT NULL

	CONSTRAINT PK_Proveedor PRIMARY KEY(IDProveedor)

)
GO
CREATE TABLE Ventas.Producto(
	IDProducto INT IDENTITY(1,1) NOT NULL,
	NombreProducto VARCHAR(100) NOT NULL,
	Categoria VARCHAR(100) NOT NULL,
	Sku VARCHAR(50) NOT NULL,
	Precio DECIMAL(10,2) NOT NULL,
	IDProveedor INT NOT NULL

	CONSTRAINT PK_Producto PRIMARY KEY(IDProducto),
	CONSTRAINT UQ_Producto_SKU UNIQUE (Sku),
	CONSTRAINT CK_Producto_Precio CHECK (Precio >= 0),
	CONSTRAINT FK_Producto_Proveedor
		FOREIGN KEY (IDProveedor) REFERENCES Ventas.Proveedor (IDProveedor)
)

GO
CREATE TABLE Ventas.Orden(
	IDOrden INT IDENTITY(1,1) NOT NULL,
	FechaOrden DATE NOT NULL,
	IDCLiente INT NOT NULL,
	IDProducto INT NOT NULL,
	Cantidad INT NOT NULL,
	PrecioUnitario DECIMAL(10,2) NOT NULL,
	PrecioTotal AS (Cantidad * PrecioUnitario),
	Sucursal VARCHAR(100) NOT NULL

	CONSTRAINT PK_Orden PRIMARY KEY(IDOrden),
	CONSTRAINT CK_Orden_Cantidad CHECK(Cantidad > 0),
	CONSTRAINT CK_Orden_PrecioUnitario CHECK(PrecioUnitario >= 0),
	CONSTRAINT FK_Orden_Cliente
		FOREIGN KEY (IDCLiente) REFERENCES Ventas.Cliente(IDCLiente),
	CONSTRAINT FK_Orden_Producto
		FOREIGN KEY (IDProducto) REFERENCES Ventas.Producto(IDProducto)
)
 GO 
