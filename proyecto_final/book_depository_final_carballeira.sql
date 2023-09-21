DROP DATABASE IF EXISTS book_dep;
CREATE DATABASE IF NOT EXISTS book_dep;
USE book_dep;
CREATE TABLE Autores (
ID_AUTOR INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR (50) NOT NULL
);
CREATE TABLE Categorias (
ID_CATEGORIA INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR (50) NOT NULL
);
CREATE TABLE Idioma (
ID_IDIOMA INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
idioma VARCHAR (10) NOT NULL
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
	REFERENCES Autores (ID_AUTOR)
    ON DELETE CASCADE
	ON UPDATE CASCADE,
ID_EDITORIAL INT NOT NULL,
FOREIGN KEY (ID_EDITORIAL)
	REFERENCES Editoriales (ID_EDITORIAL)
    ON DELETE CASCADE
	ON UPDATE CASCADE,
anio_publicacion YEAR NOT NULL,
precio DECIMAL (4,2) NOT NULL,
cantidad INT NOT NULL,
ID_CATEGORIA INT NOT NULL,
FOREIGN KEY (ID_CATEGORIA)
	REFERENCES Categorias (ID_CATEGORIA)
    ON DELETE CASCADE
	ON UPDATE CASCADE,
ID_IDIOMA INT NOT NULL,
FOREIGN KEY (ID_IDIOMA)
	REFERENCES Idioma (ID_IDIOMA)
    ON DELETE CASCADE
	ON UPDATE CASCADE    
);
CREATE TABLE Pedidos (
ID_PEDIDO INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
ID_EDITORIAL INT NOT NULL,
FOREIGN KEY (ID_EDITORIAL)
	REFERENCES Editoriales (ID_EDITORIAL)
    ON DELETE CASCADE
	ON UPDATE CASCADE,
fecha DATE NOT NULL,
total DECIMAL (6,2) NOT NULL
);
CREATE TABLE Detalle_Pedidos (
ID_DETALLE_PEDIDO INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
ID_PEDIDO INT NOT NULL UNIQUE,
FOREIGN KEY (ID_PEDIDO)
	REFERENCES Pedidos (ID_PEDIDO)
    ON DELETE CASCADE
	ON UPDATE CASCADE,
ID_LIBRO INT NOT NULL,
FOREIGN KEY (ID_LIBRO)
	REFERENCES Libros (ID_LIBRO)
    ON DELETE CASCADE
	ON UPDATE CASCADE,
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
	REFERENCES Pais_Envios (ID_PAIS)
    ON DELETE CASCADE
	ON UPDATE CASCADE,
telefono VARCHAR(12) NOT NULL,
mail VARCHAR (100) NOT NULL
);
CREATE TABLE Valoraciones (
ID_VALORACION INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
ID_LIBRO INT NOT NULL,
FOREIGN KEY (ID_LIBRO)
	REFERENCES Libros (ID_LIBRO)
    ON DELETE CASCADE
	ON UPDATE CASCADE,
ID_CLIENTE INT NOT NULL,
FOREIGN KEY (ID_CLIENTE)
	REFERENCES Clientes (ID_CLIENTE)
    ON DELETE CASCADE
	ON UPDATE CASCADE,
puntuacion INTEGER CHECK (puntuacion BETWEEN 1 AND 5) NOT NULL,
comentario VARCHAR (300)
);
CREATE TABLE Compras (
ID_COMPRA INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
ID_CLIENTE INT NOT NULL,
FOREIGN KEY (ID_CLIENTE)
	REFERENCES Clientes (ID_CLIENTE)
    ON DELETE CASCADE
	ON UPDATE CASCADE,
total DECIMAL (6,2) NOT NULL
);
CREATE TABLE Detalle_Compras (
ID_DETALLE_COMPRA INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
ID_COMPRA INT NOT NULL UNIQUE,
FOREIGN KEY (ID_COMPRA)
	REFERENCES Compras (ID_COMPRA)
    ON DELETE CASCADE
	ON UPDATE CASCADE,
ID_LIBRO INT NOT NULL,
FOREIGN KEY (ID_LIBRO)
	REFERENCES Libros (ID_LIBRO)
    ON DELETE CASCADE
	ON UPDATE CASCADE,
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
    INSERT INTO Idioma (idioma)
    VALUES
    ('ingles'),
    ('espanol');
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
    INSERT INTO libros (titulo, ID_AUTOR, ID_EDITORIAL, anio_publicacion, precio, cantidad, ID_CATEGORIA, ID_IDIOMA)
	VALUES
  ('El secreto de la montaña', 1, 2, '2020', 25.99, 50, 1,2),
  ('Los caminos del viento', 3, 1, '2018', 19.50, 30, 3,2),
  ('La sombra del pasado', 2, 3, '2019', 21.75, 40, 2,2),
  ('El jardín de los sueños', 4, 1, '2021', 18.90, 25, 2,2),
  ('La puerta del tiempo', 5, 2, '2017', 28.50, 60, 3,2),
  ('El legado perdido', 2, 3, '2022', 22.80, 35, 1,2),
  ('La senda del destino', 1, 1, '2016', 20.25, 45, 3,2),
  ('Los hilos del pasado', 3, 2, '2020', 26.70, 55, 1,2),
  ('El misterio de la noche', 4, 3, '2019', 19.99, 30, 2,2),
  ('El retorno del héroe', 5, 1, '2018', 23.50, 40, 3,2),
  ('To Kill a Mockingbird', 1, 2, '2020', 25.99, 50, 1,1),
	('1984', 3, 1, '2018', 19.50, 30, 3,1), 
	('The Great Gatsby', 2, 3, '2019', 21.75, 40, 2,1),
	('The Catcher in the Rye', 4, 1, '2021', 18.90, 12, 2,1),
	('The Lord of the Rings', 5, 2, '2017', 28.50, 60, 3,1),
	('Pride and Prejudice', 2, 3, '2022', 22.80, 35, 1,1),
	('The Harry Potter Series', 1, 1, '2016', 20.25, 45, 3,1),
	('The Hobbit', 3, 2, '2020', 26.70, 55, 1,1),
	('The Da Vinci Code', 4, 3, '2019', 19.99, 30, 2,1),
	('The Hunger Games', 5, 1, '2018', 23.50, 40, 3,1),
	('The Shining', 2, 3, '2022', 22.80, 35, 1,1),
	('To the Lighthouse', 1, 1, '2016', 20.25, 45, 3,1),
	('The Road', 3, 2, '2020', 26.70, 55, 1,1),
	('The Girl with the Dragon Tattoo', 4, 3, '2019', 19.99, 30, 2,1),
	('The Alchemist', 5, 1, '2018', 23.50, 40, 3,1),
	('Gone with the Wind', 1, 2, '2020', 25.99, 50, 1,1),
	('The Color Purple', 3, 1, '2018', 19.50, 30, 3,1), 
	('One Hundred Years of Solitude', 2, 3, '2019', 21.75, 40, 2,1),
	('The Odyssey', 4, 1, '2021', 18.90, 5, 2,1),
	('Brave New World', 5, 2, '2017', 28.50, 60, 3,1);
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
('Ava', 'Hernandez', '753 Elmwood Ln', 'Philadelphia', 2, 8, 'ava.hernandez@example.com'),
('Tobin', 'Tollemache', '5 Magdeline Way', 'Ostrowsko', 14, '478-494-8171', 'ttollemache0@kickstarter.com'),
('Emilia', 'Dysert', '744 Fordem Junction', 'Brka', 21, '382-510-8893', 'edysert1@chron.com'),
('Leonerd', 'Darnbrough', '78160 Westport Parkway', 'Shiyuan', 16, '403-451-2427', 'ldarnbrough2@facebook.com'),
('Cayla', 'Bachellier', '352 Commercial Drive', 'Pacobamba', 25, '690-772-6719', 'cbachellier3@networkadvertising.org'),
('Thelma', 'McMickan', '455 Kedzie Court', 'Concepcion', 16, '945-166-0781', 'tmcmickan4@time.com'),
('Loralyn', 'Joncic', '0 Ilene Place', 'Landskrona', 12, '292-372-6645', 'ljoncic6@themeforest.net'),
('Diane', 'Beake', '924 Mendota Road', 'Pizarro', 24, '972-539-3795', 'dbeake7@goo.ne.jp'),
('Stephine', 'Fauning', '8 Paget Circle', 'Betim', 5, '106-690-8203', 'sfauning8@dailymotion.com'),
('Natka', 'Shayler', '18123 Mcguire Drive', 'Tabug', 33, '123-761-1779', 'nshayler9@goo.ne.jp'),
('Nerte', 'Jenkyn', '8948 Caliangt Hill', 'Kousa', 6, '990-415-2192', 'njenkyna@usda.gov'),
('Trudy', 'Blincoe', '6787 Monica Lane', 'Zhangguanying', 6, '412-707-0034', 'tblincoeb@fc2.com'),
('Carlyle', 'Walbrun', '49 Scoville Circle', 'Chernelytsya', 47, '220-101-1708', 'cwalbrunc@businessweek.com'),
('Stephanus', 'Geraghty', '2113 Coleman Crossing', 'Shkurinskaya', 46, '502-175-6934', 'sgeraghtyd@usa.gov'),
('Tamra', 'Sizzey', '428 Pierstorff Plaza', 'Nūbā', 4, '838-250-5033', 'tsizzeye@nps.gov'),
('Igor', 'Middis', '456 High Crossing Place', 'Magitang', 23, '413-548-9577', 'imiddisf@google.de'),
('Anselma', 'Vaulkhard', '545 Hayes Parkway', 'Paris 13', 35, '645-826-0068', 'avaulkhardg@icq.com'),
('Violante', 'Landers', '06929 Declaration Junction', 'Taraco', 47, '711-809-2719', 'vlandersh@nsw.gov.au'),
('Wells', 'Daleman', '511 Rockefeller Circle', 'Oula Xiuma', 3, '626-911-4591', 'wdalemani@dropbox.com'),
('Dougie', 'Basey', '60 Jenifer Hill', 'Ondangwa', 45, '503-989-5086', 'dbaseyj@blog.com'),
('Tabor', 'Courtin', '922 Esch Plaza', 'Warugunung', 31, '920-462-4980', 'tcourtink@wired.com'),
('Helene', 'Vorley', '899 Hagan Plaza', 'Cijayana', 40, '126-671-9385', 'hvorleyl@amazonaws.com'),
('Ellissa', 'Gallahue', '6 Rusk Terrace', 'Šardice', 21, '562-181-8062', 'egallahuem@flickr.com'),
('Kanya', 'Peacocke', '282 Montana Center', 'Mitrovicë', 34, '575-462-8560', 'kpeacocken@admin.ch'),
('Elsy', 'Reeme', '290 Donald Terrace', 'Lavradio', 23, '747-208-8750', 'ereemeo@wired.com'),
('Sheeree', 'De Andreis', '31 Almo Trail', 'Poshekhon’ye', 38, '601-655-0332', 'sdeandreisp@toplist.cz'),
('Feodor', 'Beidebeke', '2 Leroy Court', 'Bagorejo', 17, '827-379-7589', 'fbeidebekeq@free.fr'),
('Ulrica', 'Largan', '56 Arapahoe Trail', 'Puan Selatan', 5, '432-101-6416', 'ularganr@tmall.com'),
('Felisha', 'Hillyatt', '323 Elka Park', 'Ladhewāla Warāich', 31, '256-508-1267', 'fhillyatts@comcast.net'),
('Luella', 'Tarney', '63349 Hansons Road', 'Sacramento', 30, '916-220-1608', 'ltarneyt@elpais.com'),
('Rriocard', 'Baudou', '1 Forest Parkway', 'Bunol', 5, '887-928-8358', 'rbaudouu@gravatar.com'),
('Ollie', 'Spaduzza', '2239 Jay Park', 'Cirangga Kidul', 23, '673-673-7011', 'ospaduzzav@time.com'),
('Merla', 'Tocque', '7 Northwestern Junction', 'Nyima', 40, '293-147-6239', 'mtocquew@si.edu'),
('Gib', 'Willcott', '35 Lotheville Lane', 'Trollhättan', 24, '512-112-3211', 'gwillcottx@mediafire.com'),
('Patience', 'Spavon', '00 Hagan Plaza', 'Pag-asa', 6, '294-860-7058', 'pspavony@yolasite.com'),
('Mikael', 'Cridlin', '8 Colorado Parkway', 'Springfield', 11, '617-792-9176', 'mcridlinz@oracle.com'),
('Alethea', 'Courson', '63 Lillian Place', 'Rybie', 8, '460-437-6722', 'acourson10@utexas.edu'),
('Addi', 'Josefs', '40303 International Hill', 'Wat Sing', 4, '397-809-4898', 'ajosefs11@ft.com'),
('Hannis', 'Garthland', '735 Gale Center', 'Chengguan', 1, '628-532-1240', 'hgarthland12@spotify.com'),
('Beatrice', 'Anand', '1056 Eastlawn Avenue', 'Liaozhong', 14, '587-910-8294', 'banand13@google.co.uk'),
('Clea', 'Arman', '3191 Cody Street', 'Unidos', 6, '428-333-4374', 'carman14@bravesites.com'),
('Corette', 'Cosbey', '017 Forster Junction', 'Changshengqiao', 6, '659-390-0197', 'ccosbey15@goo.gl'),
('Kathi', 'McCreery', '732 Butternut Street', 'Klang', 2, '620-144-9020', 'kmccreery16@mediafire.com'),
('Herta', 'Raymen', '4463 Prairie Rose Place', 'Cuito', 26, '774-220-1931', 'hraymen17@tiny.cc'),
('Maxine', 'Fermin', '3 Shopko Court', 'Aveleda', 46, '755-647-1659', 'mfermin18@mozilla.org'),
('Wylie', 'MacDowal', '4 Canary Plaza', 'Canhestros', 50, '310-706-6784', 'wmacdowal19@techcrunch.com'),
('Sutton', 'Basili', '212 Northfield Center', 'Talangnan', 47, '961-409-7218', 'sbasili1a@spiegel.de'),
('Maurizio', 'Poole', '4 Hintze Pass', 'Zahlé', 19, '429-135-0235', 'mpoole1b@springer.com'),
('Clementina', 'Hartness', '4 Hansons Street', 'Kuanfeu', 11, '792-254-5228', 'chartness1c@statcounter.com'),
('Stanford', 'Ainsby', '31535 Farragut Parkway', 'Yingkeng', 15, '907-971-9822', 'sainsby1d@earthlink.net');
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
  INSERT INTO valoraciones (ID_LIBRO, ID_CLIENTE, puntuacion, comentario)
VALUES
  (1, 1, 4, 'Muy buen libro, me encantó.'),
  (2, 2, 5, 'Excelente historia, no pude dejar de leerlo.'),
  (3, 3, 3, 'Es un libro entretenido, aunque esperaba un poco más.'),
  (4, 4, 4, 'Recomendado, tiene una trama interesante.'),
  (5, 5, 5, 'Increíble libro, lo volvería a leer.'),
  (1, 6, 4, 'Una historia emocionante y bien escrita.'),
  (2, 7, 5, 'Uno de mis libros favoritos.'),
  (3, 8, 3, 'No estuvo mal, pero no es mi tipo de libro.'),
  (4, 9, 4, 'Me gustó mucho, lo recomendaré.'),
  (5, 10, 5, 'Me enganchó desde el principio, lo amé.');
  INSERT INTO detalle_compras (ID_COMPRA, ID_LIBRO, cantidad, precio_unitario)
	VALUES
    (1, 1, 2, 25.99),
    (2, 2, 1, 19.50),
    (3, 3, 3, 12.75),
    (4, 5, 4, 8.90),
    (5, 6, 2, 15.25),
    (6, 1, 1, 25.99),
    (7, 4, 3, 11.50),
    (8, 7, 2, 18.00),
    (9, 8, 1, 32.75),
    (10, 9, 2, 14.90);
    
INSERT INTO detalle_pedidos (ID_PEDIDO, ID_LIBRO, cantidad, precio_unitario)
VALUES
  (1, 1, 2, 30.00),
  (2, 3, 1, 15.50),
  (3, 5, 3, 10.25),
  (4, 2, 1, 20.00),
  (5, 4, 2, 12.75),
  (6, 6, 1, 9.90),
  (7, 3, 4, 15.50),
  (8, 5, 2, 10.25),
  (9, 7, 3, 8.80),
  (10, 1, 3, 30.00);
  
  -- Vistas
  USE book_dep;
-- Vista para visualizar cuales son los libros con stock bajo para hacer un pedido proximamente
CREATE VIEW vista_bajo_stock AS
SELECT ID_LIBRO, titulo, cantidad
FROM libros
WHERE cantidad < 30;
-- Vista para visualizar los libros mas vendidos
CREATE VIEW vista_libros_mas_vendidos AS
SELECT ID_LIBRO, SUM(cantidad) AS total_vendido
FROM detalle_compras
GROUP BY ID_LIBRO
ORDER BY total_vendido DESC;
-- Vista para visualizar cuales son los clientes que mas compran
CREATE VIEW vista_clientes_mas_frecuentes AS
SELECT ID_CLIENTE, COUNT(*) AS total_compras
FROM compras
GROUP BY ID_CLIENTE
ORDER BY total_compras DESC;
-- Vista para visualizar en que paises hay mas usuarios registrados
CREATE VIEW vista_paises_con_mas_usuarios AS
SELECT ID_PAIS, COUNT(*) AS total_usuarios
FROM clientes
GROUP BY ID_PAIS
ORDER BY total_usuarios DESC;
-- Vista para visualizar libros con mejores valoraciones
CREATE VIEW vista_libros_mejor_valorados AS
SELECT ID_LIBRO, AVG(puntuacion) AS promedio_valoracion
FROM valoraciones
GROUP BY ID_LIBRO
ORDER BY promedio_valoracion DESC;
  
  -- Funciones
  USE book_dep;

-- Funcion 1 sirve para saber la editorial de un libro ingresando su id
DELIMITER //

CREATE FUNCTION obtener_editorial_por_libro(libro_id INT) RETURNS VARCHAR(50) DETERMINISTIC
BEGIN
    DECLARE nombre_editorial VARCHAR(50);

    SELECT e.nombre INTO nombre_editorial
    FROM Editoriales e
    JOIN Libros l ON e.ID_EDITORIAL = l.ID_EDITORIAL
    WHERE l.ID_LIBRO = libro_id;

    RETURN nombre_editorial;
END;
//

DELIMITER ;

-- Funcion 2 permite calcular (haciendo la multiplicacion) precio total de un pedido ingresando id de libro y su cantidad
DELIMITER //

CREATE FUNCTION calcular_precio_total(libro_id INT, cantidad INT) RETURNS DECIMAL(6,2) DETERMINISTIC
BEGIN
    DECLARE precio_unitario DECIMAL(6,2);
    DECLARE total DECIMAL(6,2);

    SELECT precio INTO precio_unitario
    FROM Libros
    WHERE ID_LIBRO = libro_id;

    SET total = precio_unitario * cantidad;

    RETURN total;
END;
//

DELIMITER ;

-- Stored Procedures
USE book_dep
-- Stored procedure 1: sirve para ordenar una tabla ingresando 2 parametros,  el nombre del campo por el cual se desea ordenar y la dirección de orden (ascendente o descendente).
DELIMITER //
CREATE PROCEDURE SP_GET_OrdenarTabla(IN tabla_nombre VARCHAR(50), IN campo_orden VARCHAR(50), IN direccion_orden VARCHAR(10))
BEGIN
    SET @sql_query = CONCAT('SELECT * FROM ', tabla_nombre, ' ORDER BY ', campo_orden, ' ', direccion_orden);
    PREPARE stmt FROM @sql_query;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END //
DELIMITER ;
DELIMITER //
-- Stored procedure 2: sirve para insertar o eliminar registros especificos segun su id. 
CREATE PROCEDURE SP_GET_OperacionTabla(IN operacion INT, IN tabla_nombre VARCHAR(50), IN id_registro INT)
BEGIN
    IF operacion = 1 THEN
        -- Insertar registro
        SET @sql_query = CONCAT('INSERT INTO ', tabla_nombre, ' (columna1, columna2, ...) VALUES (valor1, valor2, ...)');
        PREPARE stmt FROM @sql_query;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;
    ELSEIF operacion = 2 THEN
        -- Eliminar registro
        SET @sql_query = CONCAT('DELETE FROM ', tabla_nombre, ' WHERE ID = ', id_registro);
        PREPARE stmt FROM @sql_query;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;
    END IF;
END //
DELIMITER ;

-- Triggers
CREATE TABLE LogLibros (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    accion VARCHAR(50),
    usuario VARCHAR(50),
    fecha DATE,
    hora TIME
);

CREATE TABLE LogClientes (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    accion VARCHAR(50),
    usuario VARCHAR(50),
    fecha DATE,
    hora TIME
);
CREATE TABLE LogCompraLibros (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    ID_LIBRO INT NOT NULL,
    FechaHora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CantidadComprada INT NOT NULL,
    FOREIGN KEY (ID_LIBRO)
        REFERENCES Libros (ID_LIBRO)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

DELIMITER //

-- Trigger para la tabla Libros
CREATE TRIGGER Before_Insert_Libros
BEFORE INSERT ON Libros FOR EACH ROW
BEGIN
    SET NEW.anio_publicacion = IF(NEW.anio_publicacion IS NULL, YEAR(NOW()), NEW.anio_publicacion);
    SET NEW.precio = IF(NEW.precio < 0, 0, NEW.precio);
END;

CREATE TRIGGER After_Insert_Libros
AFTER INSERT ON Libros FOR EACH ROW
BEGIN
    INSERT INTO LogLibros (accion, usuario, fecha, hora)
    VALUES ('Inserción', USER(), CURDATE(), CURTIME());
END;

-- Trigger para la tabla Clientes
CREATE TRIGGER Before_Delete_Clientes
BEFORE DELETE ON Clientes FOR EACH ROW
BEGIN
    DECLARE cant_pedidos INT;
    SELECT COUNT(*) INTO cant_pedidos FROM Pedidos WHERE ID_CLIENTE = OLD.ID_CLIENTE;
    IF cant_pedidos > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No se puede eliminar un cliente con pedidos pendientes';
    END IF;
END;

CREATE TRIGGER After_Delete_Clientes
AFTER DELETE ON Clientes FOR EACH ROW
BEGIN
    INSERT INTO LogClientes (accion, usuario, fecha, hora)
    VALUES ('Eliminación', USER(), CURDATE(), CURTIME());
END;

-- Trigger para actualizar cantidad de libros despues de que un cliente realice una compra
CREATE TRIGGER after_insert_detalle_compras
AFTER INSERT ON Detalle_Compras
FOR EACH ROW
BEGIN
    UPDATE Libros
    SET cantidad = cantidad - NEW.cantidad
    WHERE ID_LIBRO = NEW.ID_LIBRO;
END;


//
DELIMITER ;