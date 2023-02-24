DROP DATABASE IF EXISTS `gestortareas`;
CREATE DATABASE `gestortareas`;
USE `gestortareas`;

CREATE TABLE `tipo_usuario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idnew_table_UNIQUE` (`id`)
);

INSERT INTO tipo_usuario (id, nombre)
  VALUES (1, "Administrador");
  
INSERT INTO tipo_usuario (id, nombre)
  VALUES (2, "visitante");

CREATE TABLE `usuario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idTipoUsuario` int(45) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  foreign key(idTipoUsuario) references tipo_usuario(id)
);

INSERT INTO usuario (id, idTipoUsuario, nombre, password, email)
  VALUES (1, 1, "Raul", "12345678", "raul@gmail.com");
  
INSERT INTO usuario (id, idTipoUsuario, nombre, password, email)
  VALUES (2, 2, "Cesar", "12345678", "cesar@gmail.com");
  
  
CREATE TABLE `estado` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
);

INSERT INTO estado (id, nombre)
  VALUES (1, "Pendiente");
  
INSERT INTO estado (id, nombre)
  VALUES (2, "En progreso");
  
INSERT INTO estado (id, nombre)
  VALUES (3, "Hecho");
  
CREATE TABLE `prioridad` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
);

INSERT INTO prioridad(id, nombre)
  VALUES (1, "Urgente");
  
INSERT INTO prioridad(id, nombre)
  VALUES (2, "No urgente");
  
CREATE TABLE `categoria` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
);

INSERT INTO categoria(id, nombre)
  VALUES (1, "Desarrollo de Software");

INSERT INTO categoria(id, nombre)
  VALUES (2, "Testing");  
  
INSERT INTO categoria(id, nombre)
  VALUES (3, "Despliegues");  
  
  
CREATE TABLE `tarea` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idUsuarioPropietario` int(45) NOT NULL,
  `idUsuarioAsignado` int(45) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `Fecha` TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `fechaEstimadaFinalizacion` TIMESTAMP NOT NULL,
  `fechaDeEdicion` TIMESTAMP NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `idEstado` int(45) NOT NULL,
  `idPrioridad` int(45) NOT NULL,
  `idCategoria` int(45) NOT NULL,
  PRIMARY KEY (`id`),
  foreign key(idUsuarioPropietario) references usuario(id),
  foreign key(idUsuarioAsignado) references usuario(id),
  foreign key(idEstado) references estado(id),
  foreign key(idPrioridad) references prioridad(id),
  foreign key(idCategoria) references categoria(id)
);

INSERT INTO tarea (id, idUsuarioPropietario, idUsuarioAsignado, nombre, descripcion, fechaEstimadaFinalizacion, idEstado, idPrioridad, idCategoria)
  VALUES (1, 1, 1, "Comprar un tickete áereo", "Ingresar a la página web de la áereolinea y comprar un tickete", '1970-01-01 00:00:01', 1, 1, 1);
  
INSERT INTO tarea (id, idUsuarioPropietario, idUsuarioAsignado, nombre, descripcion, fecha, fechaEstimadaFinalizacion, fechaDeEdicion, idEstado, idPrioridad, idCategoria)
  VALUES (2, 2, 2, "Comprar un tickete áereo", "Ingresar a la página web de la áereolinea y comprar un tickete", '1970-01-01 00:00:01', '1971-01-01 00:00:01', '1971-01-01 00:00:01', 1, 1, 1);
  
CREATE TABLE `tarea_historico` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idTarea` int NOT NULL,
  PRIMARY KEY (`id`),
  foreign key(idTarea) references tarea(id)
);

INSERT INTO tarea_historico(id, idTarea)
  VALUES (1, 1);   






