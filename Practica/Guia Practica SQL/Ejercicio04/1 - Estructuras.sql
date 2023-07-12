CREATE DATABASE Ejercicio_4;
GO

USE Ejercicio_4;
GO

CREATE TABLE Persona 
(
	DNI INT PRIMARY KEY,
	Nombre VARCHAR(64) NOT NULL,
	Telefono VARCHAR(20) NOT NULL
);

CREATE TABLE Empresa 
(
	Nombre VARCHAR(64) PRIMARY KEY,
	Telefono VARCHAR(20) NOT NULL
);

CREATE TABLE Vive 
(
	DNI INT PRIMARY KEY,
	Calle VARCHAR(150) NOT NULL,
	Ciudad VARCHAR(100) NOT NULL,
);

CREATE TABLE Trabaja 
(
	DNI INT NOT NULL,
	NombreEmpresa VARCHAR(64) NOT NULL,
	Salario DECIMAL(12,2) NOT NULL,
	FechaIngreso DATE NOT NULL,
	FechaEgreso DATE NOT NULL,
	CONSTRAINT PK_Trabaja_DNI_NombreEmpresa PRIMARY KEY (DNI, NombreEmpresa)
);

CREATE TABLE SituadaEn 
(
	NombreEmpresa VARCHAR(64) NOT NULL,
	Ciudad VARCHAR(64) NOT NULL,
	CONSTRAINT PK_Situada_En_NombreEmpresa PRIMARY KEY (NombreEmpresa)
);

CREATE TABLE Supervisa 
(
	DNIPer INT NOT NULL,
	DNISup INT NOT NULL,
	CONSTRAINT PK_Supervisa_DNIPer_DNISup PRIMARY KEY (DNIPer, DNISup)
);

ALTER TABLE Vive ADD CONSTRAINT FK_Vive_DNI FOREIGN KEY (DNI) REFERENCES Persona (DNI) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE Trabaja ADD CONSTRAINT FK_Trabaja_DNI FOREIGN KEY (DNI) REFERENCES Persona (DNI) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE Trabaja ADD CONSTRAINT FK_Trabaja_NombreEmpresa FOREIGN KEY (NombreEmpresa) REFERENCES Empresa(Nombre) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE SituadaEn ADD CONSTRAINT FK_Situada_En_NombreEmpresa FOREIGN KEY (NombreEmpresa) REFERENCES Empresa(Nombre) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE Supervisa ADD CONSTRAINT FK_Supervisa_DNIPer FOREIGN KEY (DNIPer) REFERENCES Persona(DNI) ON DELETE CASCADE ON UPDATE CASCADE;
--ALTER TABLE Supervisa ADD CONSTRAINT FK_Supervisa_DNISup FOREIGN KEY (DNISup) REFERENCES Persona(DNI) ON DELETE CASCADE ON UPDATE CASCADE;