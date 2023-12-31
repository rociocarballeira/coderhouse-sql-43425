CREATE DATABASE IF NOT EXISTS book_dep;
USE book_dep ;
CREATE TABLE Autores (
ID_AUTOR INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR (50) NOT NULL
);
CREATE TABLE Categorias (
ID_CATEGORIA INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR (50) NOT NULL
);
CREATE TABLE Editoriales (
ID_EDITORIAL INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR (30) NOT NULL,
direccion VARCHAR (50) NOT NULL,
ciudad VARCHAR (30) NOT NULL,
telefono VARCHAR (12) NOT NULL,
mail VARCHAR (50)
);
CREATE TABLE Libros (
ID_LIBRO INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
titulo VARCHAR (50) NOT NULL,
ID_AUTOR INT NOT NULL,
FOREIGN KEY (ID_AUTOR)
	REFERENCES Autores (ID_AUTOR),
ID_EDITORIAL INT NOT NULL,
FOREIGN KEY (ID_EDITORIAL)
	REFERENCES Editoriales (ID_EDITORIAL),
anio_publicacion YEAR NOT NULL,
precio DECIMAL (4,2) NOT NULL,
cantidad INT NOT NULL,
ID_CATEGORIA INT NOT NULL,
FOREIGN KEY (ID_CATEGORIA)
	REFERENCES Categorias (ID_CATEGORIA)
);
CREATE TABLE Pedidos (
ID_PEDIDO INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
ID_EDITORIAL INT NOT NULL,
FOREIGN KEY (ID_EDITORIAL)
	REFERENCES Editoriales (ID_EDITORIAL),
fecha DATE NOT NULL,
total DECIMAL (6,2) NOT NULL
);
CREATE TABLE Detalle_Pedidos (
ID_DETALLE_PEDIDO INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
ID_PEDIDO INT NOT NULL,
FOREIGN KEY (ID_PEDIDO)
	REFERENCES Pedidos (ID_PEDIDO),
ID_LIBRO INT NOT NULL,
FOREIGN KEY (ID_LIBRO)
	REFERENCES Libros (ID_LIBRO),
cantidad INT NOT NULL,
precio_unitario DECIMAL (4,2) NOT NULL    
);
CREATE TABLE Pais_Envios (
ID_PAIS INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR (30) NOT NULL
);
CREATE TABLE Clientes (
ID_CLIENTE INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR (30) NOT NULL,
apellido VARCHAR (30) NOT NULL,
direccion VARCHAR (50) NOT NULL,
ciudad VARCHAR (30) NOT NULL,
ID_PAIS INT NOT NULL,
FOREIGN KEY (ID_PAIS)
	REFERENCES Pais_Envios (ID_PAIS),
telefono INT NOT NULL,
mail VARCHAR (100) NOT NULL
);
CREATE TABLE Valoraciones (
ID_VALORACION INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
ID_LIBRO INT NOT NULL,
FOREIGN KEY (ID_LIBRO)
	REFERENCES Libros (ID_LIBRO),
ID_CLIENTE INT NOT NULL,
FOREIGN KEY (ID_CLIENTE)
	REFERENCES Clientes (ID_CLIENTE),
puntuacion INT NOT NULL,
valor_entre_1_y_5 INTEGER CHECK (valor_entre_1_y_5 BETWEEN 1 AND 5),
comentario VARCHAR (300)
);
CREATE TABLE Compras (
ID_COMPRA INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
ID_CLIENTE INT NOT NULL,
FOREIGN KEY (ID_CLIENTE)
	REFERENCES Clientes (ID_CLIENTE),
total DECIMAL (6,2) NOT NULL
);
CREATE TABLE Detalle_Compras (
ID_DETALLE_COMPRA INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
ID_COMPRA INT NOT NULL,
FOREIGN KEY (ID_COMPRA)
	REFERENCES Compras (ID_COMPRA),
ID_LIBRO INT NOT NULL,
FOREIGN KEY (ID_LIBRO)
	REFERENCES Libros (ID_LIBRO),
cantidad INT NOT NULL,
precio_unitario DECIMAL (4,2) NOT NULL
);



