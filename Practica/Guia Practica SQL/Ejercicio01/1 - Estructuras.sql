-- Creacion de la base de datos
CREATE DATABASE Ejercicio_1;
GO

--Creacion de las tablas
USE Ejercicio_1;

CREATE TABLE Almacen 
(
	Nro INT PRIMARY KEY, 
	Responsable VARCHAR(50)
)

CREATE TABLE Articulo 
(
	CodArt INT PRIMARY KEY, 
	Descripcion VARCHAR(50), 
	Precio DECIMAL(12, 3)
)

CREATE TABLE Material 
(
	CodMat INT PRIMARY KEY, 
	Descripcion VARCHAR(50)
)

CREATE TABLE Proveedor 
(
	CodProv INT PRIMARY KEY, 
	Nombre VARCHAR(50), 
	Domicilio VARCHAR(50), 
	Ciudad VARCHAR(50), 
	FechaAlta DATE
)

CREATE TABLE Tiene 
(
	NroAlmacen INT, 
	CodArt INT,
	CONSTRAINT PK_Tiene PRIMARY KEY (NroAlmacen, CodArt),
)

ALTER TABLE Tiene ADD CONSTRAINT FK_Tiene_NroAlmacen FOREIGN KEY (NroAlmacen) REFERENCES Almacen(Nro) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE Tiene ADD CONSTRAINT FK_Tiene_CodArt FOREIGN KEY (CodArt) REFERENCES Articulo(CodArt) ON DELETE CASCADE ON UPDATE CASCADE;

CREATE TABLE CompuestoPor 
(
	CodArt INT, 
	CodMat INT,
	CONSTRAINT PK_CompuestoPor PRIMARY KEY (CodArt, CodMat),
)

ALTER TABLE CompuestoPor ADD CONSTRAINT FK_CompuestoPor_CodArt FOREIGN KEY (CodArt) REFERENCES Articulo(CodArt) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE CompuestoPor ADD CONSTRAINT FK_CompuestoPor_CodMat FOREIGN KEY (CodMat) REFERENCES Material(CodMat) ON DELETE CASCADE ON UPDATE CASCADE;

CREATE TABLE ProvistoPor 
(
	CodMat INT, 
	CodProv INT,
	CONSTRAINT PK_ProvistoPor PRIMARY KEY (CodProv, CodMat),
)

ALTER TABLE ProvistoPor ADD CONSTRAINT FK_ProvistoPor_CodMat FOREIGN KEY (CodMat) REFERENCES Material(CodMat) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE ProvistoPor ADD CONSTRAINT FK_ProvistoPor_CodProv FOREIGN KEY (CodProv) REFERENCES Proveedor(CodProv) ON DELETE CASCADE ON UPDATE CASCADE;

