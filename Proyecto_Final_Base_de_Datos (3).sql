CREATE DATABASE IF NOT EXISTS `Desarrollo_y_Administraccion_de_bases_de datos`;


USE `Desarrollo_y_Administraccion_de_bases_de datos` ;


CREATE TABLE IF NOT EXISTS `Desarrollo_y_Administraccion_de_bases_de datos`.`Login` (
  `idLogin` INT NOT NULL AUTO_INCREMENT,
  `Usuario` VARCHAR(45) NULL,
  `Contraseña` BLOB NULL,
  `rol` INT NULL,
  PRIMARY KEY (`idLogin`)
);

insert into Login (Usuario, Contraseña) values ('Mpimentel','Mpimentel182!!');
insert into Login (Usuario, Contraseña) values ('RFrias','RFrias@@321');
insert into Login (Usuario, Contraseña) values ('WPeña','Wpeña12343$$');
insert into Login (Usuario, Contraseña) values ('YMelo','Ymelo2389%$');
insert into Login (Usuario, Contraseña) values ('GMelo','Gmelo^^%$');
insert into Login (Usuario, Contraseña) values ('JPimentel','JPimentel1820');
insert into Login (Usuario, Contraseña) values ('Epimentel','Epimentel%%$');
insert into Login (Usuario, Contraseña) values ('HFrias','HFrias@21');
insert into Login (Usuario, Contraseña) values ('FRPeña','FRpeña13$$');
insert into Login (Usuario, Contraseña) values ('Fpimentel','Mpimentel##@!!');




CREATE TABLE IF NOT EXISTS `Desarrollo_y_Administraccion_de_bases_de datos`.`Trabajos` (
  `idTrabajos` INT NOT NULL AUTO_INCREMENT,
  `Titulo` VARCHAR(45) NULL,
  `Precio_Minimo` INT NULL,
  `Precio_Maximo` INT NULL,
  PRIMARY KEY (`idTrabajos`)
);

insert into Trabajos (Titulo, Precio_Minimo, Precio_Maximo) values ('Creacion de Base de Datos','25000','75000');
insert into Trabajos (Titulo, Precio_Minimo, Precio_Maximo) values ('Correccion de Errores','25000','250000');
insert into Trabajos (Titulo, Precio_Minimo, Precio_Maximo) values ('Administraccion de Base de Datos SQL','30000','75000');
insert into Trabajos (Titulo, Precio_Minimo, Precio_Maximo) values ('Administraccion de Base de Datos Oracle','25000','250000');
insert into Trabajos (Titulo, Precio_Minimo, Precio_Maximo) values ('Creacion de Base de Datos SQL','25000','75000');
insert into Trabajos (Titulo, Precio_Minimo, Precio_Maximo) values ('Correccion de Errores SQL','25000','250000');
insert into Trabajos (Titulo, Precio_Minimo, Precio_Maximo) values ('Creacion de Base de Datos Oracle','25000','75000');
insert into Trabajos (Titulo, Precio_Minimo, Precio_Maximo) values ('Correccion de Errores Oracle','25000','250000');
insert into Trabajos (Titulo, Precio_Minimo, Precio_Maximo) values ('Creacion de Base de Datos Mysqlserver2019','25000','75000');
insert into Trabajos (Titulo, Precio_Minimo, Precio_Maximo) values ('Correccion de Errores MysqlServer2019','25000','250000');



CREATE TABLE IF NOT EXISTS `Desarrollo_y_Administraccion_de_bases_de datos`.`Trabajadores` (
  `idWorker` INT NOT NULL AUTO_INCREMENT,
  `Nombres` VARCHAR(45) ,
  `Apellidos` VARCHAR(45),
  `Proyecto_Solicitado` VARCHAR(45) NULL,
  `Telefono` VARCHAR(45) NULL,
  `Salario` INT NULL,
  `fk_idTrabajos` INT NOT NULL,
  PRIMARY KEY (`idWorker`),
  FOREIGN KEY (`fk_idTrabajos`)
  REFERENCES `Desarrollo_y_Administraccion_de_bases_de datos`.`Trabajos` (`idTrabajos`)
);



CREATE TABLE IF NOT EXISTS `Desarrollo_y_Administraccion_de_bases_de datos`.`usuarios` (
  `idAdmin` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NULL,
  `Apellidos` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NULL,
  `Telefono` VARCHAR(45) NULL,
  `fk_idLogin` INT NOT NULL,
  `fk_idWorker` INT NOT NULL,
  PRIMARY KEY (`idAdmin`),
  FOREIGN KEY (`fk_idLogin`)
    REFERENCES `Desarrollo_y_Administraccion_de_bases_de datos`.`Login` (`idLogin`),
  FOREIGN KEY (`fk_idWorker`)
    REFERENCES `Desarrollo_y_Administraccion_de_bases_de datos`.`Trabajadores` (`idWorker`)
);


CREATE TABLE IF NOT EXISTS `Desarrollo_y_Administraccion_de_bases_de datos`.`Clientes` (
  `idClientes` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NULL,
  `Apellido` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NULL,
  `Telefono` VARCHAR(45) NULL,
  `fk_idAdmin` INT NOT NULL,
  PRIMARY KEY (`idClientes`),
    FOREIGN KEY (`fk_idAdmin`)
    REFERENCES `Desarrollo_y_Administraccion_de_bases_de datos`.`usuarios` (`idAdmin`)
 );



CREATE TABLE IF NOT EXISTS `Desarrollo_y_Administraccion_de_bases_de datos`.`Proyectos` (
  `idProyectos` INT NOT NULL AUTO_INCREMENT,
  `Titulo` VARCHAR(45) NULL,
  `Descripcion` TEXT(500) NULL,
  `Fecha_inicio` VARCHAR(45) NULL,
  `Fecha_entrega` VARCHAR(45) NULL,
  `Precio` INT NULL,
  `fk_idClientes` INT NOT NULL,
  `fk_idWorker` INT NOT NULL,
  PRIMARY KEY (`idProyectos`),
  FOREIGN KEY (`fk_idClientes`)
  REFERENCES `Desarrollo_y_Administraccion_de_bases_de datos`.`Clientes` (`idClientes`),
  FOREIGN KEY (`fk_idWorker`)
  REFERENCES `Desarrollo_y_Administraccion_de_bases_de datos`.`Trabajadores` (`idWorker`)
);

