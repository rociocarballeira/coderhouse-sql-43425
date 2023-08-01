CREATE DATABASE IF NOT EXISTS book_dep1;
USE book_dep1 ;
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
telefono VARCHAR(12) NOT NULL,
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
INSERT INTO pais_envios (nombre)
VALUES
('Afganistán'),
('Albania'),
('Alemania'),
('Andorra'),
('Angola'),
('Antigua y Barbuda'),
('Arabia Saudita'),
('Argelia'),
('Argentina'),
('Armenia'),
('Australia'),
('Austria'),
('Azerbaiyán'),
('Bahamas'),
('Bangladés'),
('Barbados'),
('Baréin'),
('Bélgica'),
('Belice'),
('Benín'),
('Bielorrusia'),
('Bolivia'),
('Bosnia y Herzegovina'),
('Botsuana'),
('Brasil'),
('Brunéi'),
('Bulgaria'),
('Burkina Faso'),
('Burundi'),
('Bután'),
('Cabo Verde'),
('Camboya'),
('Camerún'),
('Canadá'),
('Catar'),
('Chad'),
('Chile'),
('China'),
('Chipre'),
('Colombia'),
('Comoras'),
('Corea del Norte'),
('Corea del Sur'),
('Costa de Marfil'),
('Costa Rica'),
('Croacia'),
('Cuba'),
('Dinamarca'),
('Inglaterra'),
('Irlanda');
INSERT INTO editoriales (nombre, direccion, ciudad, telefono, mail)
VALUES 
('Penguin Random House', '41 Uxbridge Road', 'Skelmuir', '07051022380', 'penguin@gmail.com'),
('HarperCollins', '24 Abbey Row', 'Norton', '07825393833', 'hcollins@gmail.com'),
('Hachette', '4 Bury Rd', 'Hampton', '07801108845', 'hachette_ed@gmail.com'),
('Macmillan Publishers', '10 Red Lane', 'Eridge Green', '07948332846', 'mcmillan@gmail.com'),
('Simon & Schuster', '30 Boar Lane', 'Settle', '07083014193', 's_and_s@gmail.com'),
('Bloomsbury Publishing', '16 Guildford Rd', 'East Layton', '07843381347', 'bloomsbury_p@gmail.com'),
('Pearson Education', '84 Old Chapel Road', 'Gaywood', '07040318429', 'pearson@gmail.com' ),
('Cambridge University Press', '6 Fordham Rd', 'Haddington', '07930351222', 'cambridge.press@gmail.com'),
('Oxford University Press', '12 Marlborough Crescent', 'South Newington', '07765158615', 'oxford.u.press@gmail.com'),
('Scholastic Corporation', '73 Wern Ddu Lane', 'Ludgershall', '07069626237', 'scholastic_co@gmail.com');
INSERT INTO categorias (nombre)
VALUES 
    ('Novela'),
    ('Poesía'),
    ('Drama'),
    ('Ciencia ficción'),
    ('Misterio'),
    ('Aventura'),
    ('Romance'),
    ('Fantasía'),
    ('Terror'),
    ('Historia'),
    ('Ensayo'),
    ('Biografía'),
    ('Cuento'),
    ('Fábula'),
    ('Humor'),
    ('Crónica'),
    ('Mitología'),
    ('Epopeya'),
    ('Tragedia'),
    ('Epístola');
    INSERT INTO autores (nombre)
VALUES
    ('William Shakespeare'),
    ('Jane Austen'),
    ('Charles Dickens'),
    ('Mark Twain'),
    ('J.K. Rowling'),
    ('George Orwell'),
    ('Ernest Hemingway'),
    ('Agatha Christie'),
    ('J.R.R. Tolkien'),
    ('Stephen King'),
    ('Virginia Woolf'),
    ('F. Scott Fitzgerald'),
    ('Harper Lee'),
    ('Oscar Wilde'),
    ('Emily Brontë'),
    ('Toni Morrison'),
    ('Arthur Conan Doyle'),
    ('John Steinbeck'),
    ('Aldous Huxley'),
    ('Lewis Carroll'),
    ('James Joyce'),
    ('Roald Dahl'),
    ('Charlotte Brontë'),
    ('George R.R. Martin'),
    ('H.G. Wells'),
    ('Rudyard Kipling'),
    ('Gabriel García Márquez'),
    ('Herman Melville'),
    ('Kurt Vonnegut'),
    ('Salman Rushdie'),
    ('Mary Shelley'),
    ('Sylvia Plath'),
    ('Neil Gaiman'),
    ('George Eliot'),
    ('Zadie Smith'),
    ('Ernest Cline'),
    ('Philip K. Dick'),
    ('Ian McEwan'),
    ('Margaret Atwood'),
    ('Colleen Hoover');
    INSERT INTO libros (titulo, ID_AUTOR, ID_EDITORIAL, anio_publicacion, precio, cantidad, ID_CATEGORIA)
	VALUES
  ('El secreto de la montaña', 1, 2, '2020', 25.99, 50, 1),
  ('Los caminos del viento', 3, 1, '2018', 19.50, 30, 3),
  ('La sombra del pasado', 2, 3, '2019', 21.75, 40, 2),
  ('El jardín de los sueños', 4, 1, '2021', 18.90, 25, 2),
  ('La puerta del tiempo', 5, 2, '2017', 28.50, 60, 3),
  ('El legado perdido', 2, 3, '2022', 22.80, 35, 1),
  ('La senda del destino', 1, 1, '2016', 20.25, 45, 3),
  ('Los hilos del pasado', 3, 2, '2020', 26.70, 55, 1),
  ('El misterio de la noche', 4, 3, '2019', 19.99, 30, 2),
  ('El retorno del héroe', 5, 1, '2018', 23.50, 40, 3);
  INSERT INTO pedidos (ID_EDITORIAL, fecha, total)
VALUES 
(1, '2023-07-01', 150.50),
(2, '2023-07-02', 200.25),
(3, '2023-07-03', 180.00),
(1, '2023-07-04', 120.25),
(2, '2023-07-05', 300.30),
(3, '2023-07-06', 120.50),
(1, '2023-07-07', 220.90),
(2, '2023-07-08', 180.70), 
(3, '2023-07-09', 160.80),
(1, '2023-07-10', 200.40);
INSERT INTO clientes (nombre, apellido, direccion, ciudad, ID_PAIS, telefono, mail)
VALUES
  ('John', 'Doe', '123 Main St', 'New York', 1, 1, 'john.doe@example.com'),
  ('Jane', 'Smith', '456 Oak Ave', 'Los Angeles', 2, 9, 'jane.smith@example.com'),
  ('Michael', 'Johnson', '789 Elm Rd', 'Chicago', 3, 5, 'michael.johnson@example.com'),
  ('Emily', 'Williams', '321 Maple Ln', 'Houston', 1, 5, 'emily.williams@example.com'),
  ('Daniel', 'Brown', '567 Pine Blvd', 'Miami', 4, 6, 'daniel.brown@example.com'),
  ('Sophia', 'Jones', '987 Cedar St', 'Dallas', 2, 8, 'sophia.jones@example.com'),
  ('William', 'Lee', '654 Birch Ave', 'San Francisco', 3, 6, 'william.lee@example.com'),
  ('Olivia', 'Garcia', '852 Willow Rd', 'Seattle', 1, 4, 'olivia.garcia@example.com'),
  ('James', 'Martinez', '159 Oakwood Dr', 'Boston', 4, 5, 'james.martinez@example.com'),
  ('Ava', 'Hernandez', '753 Elmwood Ln', 'Philadelphia', 2, 8, 'ava.hernandez@example.com');
  INSERT INTO compras (ID_CLIENTE, total)
VALUES 
(1, 5000),
(2, 4500),
(3, 4800),
(4, 3200),
(5, 2100),
(6, 8000),
(7, 6000),
(8, 4300),
(9, 2800),
(10, 7650);
  INSERT INTO valoraciones (ID_LIBRO, ID_CLIENTE, puntuacion, valor_entre_1_y_5, comentario)
VALUES
  (1, 1, 4, 4, 'Muy buen libro, me encantó.'),
  (2, 2, 5, 5, 'Excelente historia, no pude dejar de leerlo.'),
  (3, 3, 3, 3, 'Es un libro entretenido, aunque esperaba un poco más.'),
  (4, 4, 4, 4, 'Recomendado, tiene una trama interesante.'),
  (5, 5, 5, 5, 'Increíble libro, lo volvería a leer.'),
  (1, 6, 4, 4, 'Una historia emocionante y bien escrita.'),
  (2, 7, 5, 5, 'Uno de mis libros favoritos.'),
  (3, 8, 3, 3, 'No estuvo mal, pero no es mi tipo de libro.'),
  (4, 9, 4, 4, 'Me gustó mucho, lo recomendaré.'),
  (5, 10, 5, 5, 'Me enganchó desde el principio, lo amé.');
  INSERT INTO detalle_compras (ID_COMPRA, ID_LIBRO, cantidad, precio_unitario)
	VALUES
    (1, 1, 2, 25.99),
    (1, 2, 1, 19.50),
    (1, 3, 3, 12.75),
    (2, 5, 4, 8.90),
    (2, 6, 2, 15.25),
    (3, 1, 1, 25.99),
    (3, 4, 3, 11.50),
    (4, 7, 2, 18.00),
    (5, 8, 1, 32.75),
    (5, 9, 2, 14.90),
    (6, 2, 3, 19.50),
    (6, 5, 1, 8.90),
    (7, 10, 2, 16.99),
    (8, 3, 1, 12.75),
    (8, 6, 3, 15.25),
    (9, 1, 2, 25.99),
    (10, 10, 1, 10.50);
INSERT INTO detalle_pedidos (ID_PEDIDO, ID_LIBRO, cantidad, precio_unitario)
VALUES
  (1, 1, 2, 30.00),
  (1, 3, 1, 15.50),
  (1, 5, 3, 10.25),
  (2, 2, 1, 20.00),
  (2, 4, 2, 12.75),
  (2, 6, 1, 9.90),
  (3, 3, 4, 15.50),
  (3, 5, 2, 10.25),
  (3, 7, 3, 8.80),
  (4, 1, 3, 30.00);
