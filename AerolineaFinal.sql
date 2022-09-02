-- Schema Project

CREATE SCHEMA  Aerolinea;

-- -----------------------------------------------------
-- Table Aerolinea.pagos
-- -----------------------------------------------------

CREATE TABLE Aerolinea.PAGOS(
  ID_Pago INT PRIMARY KEY NOT NULL,
  Estado_Pago VARCHAR(50) NOT NULL,
  Fecha_Pago DATE NULL,
  Valor_Pago FLOAT NOT NULL
							);


-- -----------------------------------------------------
-- Table `Project`.`Vendedores`
-- -----------------------------------------------------
CREATE TABLE Aerolinea.VENDEDORES(
  ID_Vendedores INT PRIMARY KEY NOT NULL,
  Cédula VARCHAR(45) NOT NULL,
  Nombre  VARCHAR(50) NOT NULL,
  Apellido VARCHAR(50) NOT NULL,
  Edad INT NOT NULL ,
  Sexo VARCHAR(50) NOT NULL,
  Direccion VARCHAR(50) NOT NULL,
  Ciudad VARCHAR(50) NOT NULL
								);
 



-- -----------------------------------------------------
-- Table `Project`.`Clientes`
-- -----------------------------------------------------
CREATE TABLE Aerolinea.CLIENTES(
  ID_Cliente INT PRIMARY KEY NOT NULL,
  Nombre VARCHAR(45) NOT NULL,
  Sexo VARCHAR(45) NOT NULL,
  Apellido VARCHAR(45) NOT NULL,
  Telefono INT NULL,
  Email VARCHAR(45) NOT NULL,
  Ciudad VARCHAR(45) NOT NULL,
  Departamento VARCHAR(45) NOT NULL
								);


-- -----------------------------------------------------
-- Table `Project`.`Reservas`
-- -----------------------------------------------------
CREATE TABLE Aerolinea.RESERVAS (
  ID_Reserva INT PRIMARY KEY NOT NULL,
  ID_Vendedor INT NOT NULL,
  ID_Cliente INT NOT NULL,
  Estado_Reserva VARCHAR(45) NOT NULL,
  Fecha_Reserva DATE NOT NULL,
  Clase_vuelo VARCHAR(45) NOT NULL
								);



-- -----------------------------------------------------
-- Table `Project`.`Pagos_has_Reservas`
-- -----------------------------------------------------
CREATE TABLE  Aerolinea.PAGOS_RESERVAS (
  Pagos_ID_Pago INT NOT NULL,
  Reservas_ID_Reserva INT NOT NULL,
  PRIMARY KEY (Pagos_ID_Pago, Reservas_ID_Reserva));


-- -----------------------------------------------------
-- Table `Project`.`Aeropuertos`
-- -----------------------------------------------------
CREATE TABLE  Aerolinea.AEROPUERTOS (
  ID_Aeropuerto INT PRIMARY KEY NOT NULL,
  Nombre VARCHAR(45) NOT NULL,
  Ciudad VARCHAR(45) NOT NULL
									);



-- -----------------------------------------------------
-- Table `Project`.`Aviones`
-- -----------------------------------------------------
CREATE TABLE  Aerolinea.AVIONES (
  Matricula VARCHAR(45) PRIMARY KEY NOT NULL,
  Modelo VARCHAR(45) NOT NULL,
  Fabricante VARCHAR(45) NOT NULL,
  ID_Aeropuerto INT NOT NULL
								);
  



-- -----------------------------------------------------
-- Table `Project`.`Vuelos`
-- -----------------------------------------------------
CREATE TABLE  Aerolinea.VUELOS (
  ID_Vuelo INT PRIMARY KEY NOT NULL,
  ID_Aeropuerto INT NOT NULL,
  Origen VARCHAR(45) NOT NULL,	
  Llegada VARCHAR(45) NOT NULL,
  Modelo VARCHAR(45) NOT NULL,
  TiempoPartida TIMESTAMP(6) NOT NULL,
  TiempoLlegada TIMESTAMP(6) NOT NULL,
  Aviones_Matricula VARCHAR(45) NOT NULL
							   );



-- -----------------------------------------------------
-- Table `Project`.`Reservas_has_Vuelos`
-- -----------------------------------------------------
CREATE TABLE  Aerolinea.RESERVAS_VUELOS (
  Reservas_ID_Reserva INT NOT NULL,
  Vuelos_ID_Vuelo INT NOT NULL,
  PRIMARY KEY (Reservas_ID_Reserva, Vuelos_ID_Vuelo));


-- -----------------------------------------------------
-- Table `Project`.`Precio_Vuelos
-- -----------------------------------------------------
CREATE TABLE Aerolinea.PRECIO_VUELOS (
  Precio_Vuelo float NOT NULL,
  ID_Vuelo INT NOT NULL
									);


-- -----------------------------------------------------
-- Table `Project`.`Pilotos`
-- -----------------------------------------------------
CREATE TABLE  Aerolinea.Pilotos(
	
  Cedula VARCHAR(45) PRIMARY KEY NOT NULL,
  Nombre VARCHAR(45) NOT NULL,
  Apellido VARCHAR(45) NOT NULL,
  Nro_Licencia INT UNIQUE NOT NULL,
  Direccion VARCHAR(45) NOT NULL,
  Ciudad VARCHAR(45) NOT NULL,
  Telefono VARCHAR(45) NOT NULL,
  Sexo VARCHAR(45) NOT NULL,
  Edad INT NOT NULL
	);

CREATE TABLE Aerolinea.AVIONES_PILOTOS (
  Aviones_Matricula VARCHAR(45) NOT NULL,
  Pilotos_Cédula VARCHAR(45) NOT NULL,
  PRIMARY KEY (Aviones_Matricula, Pilotos_Cédula));
  
-- --------------------------------------------- --------
-- FK
-- -----------------------------------------------------

  
ALTER TABLE Aerolinea.RESERVAS
ADD CONSTRAINT FK_VENDEDORES_RESERVAS FOREIGN KEY(ID_Vendedor)
REFERENCES Aerolinea.VENDEDORES (ID_Vendedores)
on delete restrict on update restrict;

ALTER TABLE Aerolinea.RESERVAS
ADD CONSTRAINT FK_CLIENTES_RESERVAS FOREIGN KEY(ID_Cliente)
REFERENCES Aerolinea.CLIENTES (ID_Cliente)
on delete restrict on update restrict;

ALTER TABLE Aerolinea.PAGOS_RESERVAS
ADD CONSTRAINT FK_PAGOS_PAGOSRESERVAS FOREIGN KEY(Pagos_ID_Pago)
REFERENCES Aerolinea.PAGOS (ID_Pago)
on delete restrict on update restrict;

ALTER TABLE Aerolinea.PAGOS_RESERVAS
ADD CONSTRAINT FK_RESERVAS_PAGOSRESERVAS FOREIGN KEY(Reservas_ID_Reserva)
REFERENCES Aerolinea.RESERVAS (ID_Reserva)
on delete restrict on update restrict;

ALTER TABLE Aerolinea.AVIONES
ADD CONSTRAINT FK_AEROPUERTOS_AVIONES FOREIGN KEY(ID_Aeropuerto)
REFERENCES Aerolinea.AEROPUERTOS (ID_Aeropuerto)
on delete restrict on update restrict;

ALTER TABLE Aerolinea.VUELOS
ADD CONSTRAINT FK_AEROPUERTO_VUELOS FOREIGN KEY(ID_Aeropuerto)
REFERENCES Aerolinea.AEROPUERTOS (ID_Aeropuerto)
on delete restrict on update restrict;

ALTER TABLE Aerolinea.VUELOS
ADD CONSTRAINT FK_AVIONES_VUELOS FOREIGN KEY(Aviones_Matricula)
REFERENCES Aerolinea.AVIONES(Matricula)
on delete restrict on update restrict;

ALTER TABLE Aerolinea.RESERVAS_VUELOS
ADD CONSTRAINT FK_RESERVA_RESERVASVUELOS FOREIGN KEY(Reservas_ID_Reserva)
REFERENCES Aerolinea.RESERVAS (ID_Reserva)
on delete restrict on update restrict;

ALTER TABLE Aerolinea.RESERVAS_VUELOS
ADD CONSTRAINT FK_VUELOS_RESERVASVUELOS FOREIGN KEY(Vuelos_ID_Vuelo)
REFERENCES Aerolinea.VUELOS (ID_Vuelo)
on delete restrict on update restrict;

ALTER TABLE Aerolinea.PRECIO_VUELOS
ADD CONSTRAINT FK_VUELOS_PRECIOVUELOS FOREIGN KEY(ID_Vuelo)
REFERENCES Aerolinea.VUELOS (ID_Vuelo)
on delete restrict on update restrict;