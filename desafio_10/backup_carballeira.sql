/* Para realizar el backup de la bbdd de book depository los pasos a seguir fueron los siguientes:
1. Crear una nueva bbdd a la que nombre book_dep1_backup con la estructura de tablas ya que el archivo dump es solo de data.
2. Dentro del apartado data export guardar el dump como archivo unico, conteniendo solo la data.
3. Hacer el data import del archivo sql a la bbdd nueva creada en el paso 1. 
Observacion: Se realizo el backup de todas las tablas contenidas en la bbdd original. 
*/
CREATE DATABASE IF NOT EXISTS book_dep1_backup ;
USE book_dep1_backup ;
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
    -- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: book_dep1
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `autores`
--

LOCK TABLES `autores` WRITE;
/*!40000 ALTER TABLE `autores` DISABLE KEYS */;
INSERT INTO `autores` VALUES (1,'William Shakespeare'),(2,'Jane Austen'),(3,'Charles Dickens'),(4,'Mark Twain'),(5,'J.K. Rowling'),(6,'George Orwell'),(7,'Ernest Hemingway'),(8,'Agatha Christie'),(9,'J.R.R. Tolkien'),(10,'Stephen King'),(11,'Virginia Woolf'),(12,'F. Scott Fitzgerald'),(13,'Harper Lee'),(14,'Oscar Wilde'),(15,'Emily Brontë'),(16,'Toni Morrison'),(17,'Arthur Conan Doyle'),(18,'John Steinbeck'),(19,'Aldous Huxley'),(20,'Lewis Carroll'),(21,'James Joyce'),(22,'Roald Dahl'),(23,'Charlotte Brontë'),(24,'George R.R. Martin'),(25,'H.G. Wells'),(26,'Rudyard Kipling'),(27,'Gabriel García Márquez'),(28,'Herman Melville'),(29,'Kurt Vonnegut'),(30,'Salman Rushdie'),(31,'Mary Shelley'),(32,'Sylvia Plath'),(33,'Neil Gaiman'),(34,'George Eliot'),(35,'Zadie Smith'),(36,'Ernest Cline'),(37,'Philip K. Dick'),(38,'Ian McEwan'),(39,'Margaret Atwood'),(40,'Colleen Hoover');
/*!40000 ALTER TABLE `autores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Novela'),(2,'Poesía'),(3,'Drama'),(4,'Ciencia ficción'),(5,'Misterio'),(6,'Aventura'),(7,'Romance'),(8,'Fantasía'),(9,'Terror'),(10,'Historia'),(11,'Ensayo'),(12,'Biografía'),(13,'Cuento'),(14,'Fábula'),(15,'Humor'),(16,'Crónica'),(17,'Mitología'),(18,'Epopeya'),(19,'Tragedia'),(20,'Epístola');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'John','Doe','123 Main St','New York',1,'1','john.doe@example.com'),(2,'Jane','Smith','456 Oak Ave','Los Angeles',2,'9','jane.smith@example.com'),(3,'Michael','Johnson','789 Elm Rd','Chicago',3,'5','michael.johnson@example.com'),(4,'Emily','Williams','321 Maple Ln','Houston',1,'5','emily.williams@example.com'),(5,'Daniel','Brown','567 Pine Blvd','Miami',4,'6','daniel.brown@example.com'),(6,'Sophia','Jones','987 Cedar St','Dallas',2,'8','sophia.jones@example.com'),(7,'William','Lee','654 Birch Ave','San Francisco',3,'6','william.lee@example.com'),(8,'Olivia','Garcia','852 Willow Rd','Seattle',1,'4','olivia.garcia@example.com'),(9,'James','Martinez','159 Oakwood Dr','Boston',4,'5','james.martinez@example.com'),(10,'Ava','Hernandez','753 Elmwood Ln','Philadelphia',2,'8','ava.hernandez@example.com');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `compras`
--

LOCK TABLES `compras` WRITE;
/*!40000 ALTER TABLE `compras` DISABLE KEYS */;
INSERT INTO `compras` VALUES (1,1,5000.00),(2,2,4500.00),(3,3,4800.00),(4,4,3200.00),(5,5,2100.00),(6,6,8000.00),(7,7,6000.00),(8,8,4300.00),(9,9,2800.00),(10,10,7650.00);
/*!40000 ALTER TABLE `compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `detalle_compras`
--

LOCK TABLES `detalle_compras` WRITE;
/*!40000 ALTER TABLE `detalle_compras` DISABLE KEYS */;
INSERT INTO `detalle_compras` VALUES (1,1,1,2,25.99),(2,1,2,1,19.50),(3,1,3,3,12.75),(4,2,5,4,8.90),(5,2,6,2,15.25),(6,3,1,1,25.99),(7,3,4,3,11.50),(8,4,7,2,18.00),(9,5,8,1,32.75),(10,5,9,2,14.90),(11,6,2,3,19.50),(12,6,5,1,8.90),(13,7,10,2,16.99),(14,8,3,1,12.75),(15,8,6,3,15.25),(16,9,1,2,25.99),(17,10,10,1,10.50);
/*!40000 ALTER TABLE `detalle_compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `detalle_pedidos`
--

LOCK TABLES `detalle_pedidos` WRITE;
/*!40000 ALTER TABLE `detalle_pedidos` DISABLE KEYS */;
INSERT INTO `detalle_pedidos` VALUES (1,1,1,2,30.00),(2,1,3,1,15.50),(3,1,5,3,10.25),(4,2,2,1,20.00),(5,2,4,2,12.75),(6,2,6,1,9.90),(7,3,3,4,15.50),(8,3,5,2,10.25),(9,3,7,3,8.80),(10,4,1,3,30.00);
/*!40000 ALTER TABLE `detalle_pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `editoriales`
--

LOCK TABLES `editoriales` WRITE;
/*!40000 ALTER TABLE `editoriales` DISABLE KEYS */;
INSERT INTO `editoriales` VALUES (1,'Penguin Random House','41 Uxbridge Road','Skelmuir','07051022380','penguin@gmail.com'),(2,'HarperCollins','24 Abbey Row','Norton','07825393833','hcollins@gmail.com'),(3,'Hachette','4 Bury Rd','Hampton','07801108845','hachette_ed@gmail.com'),(4,'Macmillan Publishers','10 Red Lane','Eridge Green','07948332846','mcmillan@gmail.com'),(5,'Simon & Schuster','30 Boar Lane','Settle','07083014193','s_and_s@gmail.com'),(6,'Bloomsbury Publishing','16 Guildford Rd','East Layton','07843381347','bloomsbury_p@gmail.com'),(7,'Pearson Education','84 Old Chapel Road','Gaywood','07040318429','pearson@gmail.com'),(8,'Cambridge University Press','6 Fordham Rd','Haddington','07930351222','cambridge.press@gmail.com'),(9,'Oxford University Press','12 Marlborough Crescent','South Newington','07765158615','oxford.u.press@gmail.com'),(10,'Scholastic Corporation','73 Wern Ddu Lane','Ludgershall','07069626237','scholastic_co@gmail.com');
/*!40000 ALTER TABLE `editoriales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `libros`
--

LOCK TABLES `libros` WRITE;
/*!40000 ALTER TABLE `libros` DISABLE KEYS */;
INSERT INTO `libros` VALUES (1,'El secreto de la montaña',1,2,2020,25.99,50,1),(2,'Los caminos del viento',3,1,2018,19.50,30,3),(3,'La sombra del pasado',2,3,2019,21.75,40,2),(4,'El jardín de los sueños',4,1,2021,18.90,25,2),(5,'La puerta del tiempo',5,2,2017,28.50,60,3),(6,'El legado perdido',2,3,2022,22.80,35,1),(7,'La senda del destino',1,1,2016,20.25,45,3),(8,'Los hilos del pasado',3,2,2020,26.70,55,1),(9,'El misterio de la noche',4,3,2019,19.99,30,2),(10,'El retorno del héroe',5,1,2018,23.50,40,3);
/*!40000 ALTER TABLE `libros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `logclientes`
--

LOCK TABLES `logclientes` WRITE;
/*!40000 ALTER TABLE `logclientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `logclientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `loglibros`
--

LOCK TABLES `loglibros` WRITE;
/*!40000 ALTER TABLE `loglibros` DISABLE KEYS */;
/*!40000 ALTER TABLE `loglibros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `pais_envios`
--

LOCK TABLES `pais_envios` WRITE;
/*!40000 ALTER TABLE `pais_envios` DISABLE KEYS */;
INSERT INTO `pais_envios` VALUES (1,'Afganistán'),(2,'Albania'),(3,'Alemania'),(4,'Andorra'),(5,'Angola'),(6,'Antigua y Barbuda'),(7,'Arabia Saudita'),(8,'Argelia'),(9,'Argentina'),(10,'Armenia'),(11,'Australia'),(12,'Austria'),(13,'Azerbaiyán'),(14,'Bahamas'),(15,'Bangladés'),(16,'Barbados'),(17,'Baréin'),(18,'Bélgica'),(19,'Belice'),(20,'Benín'),(21,'Bielorrusia'),(22,'Bolivia'),(23,'Bosnia y Herzegovina'),(24,'Botsuana'),(25,'Brasil'),(26,'Brunéi'),(27,'Bulgaria'),(28,'Burkina Faso'),(29,'Burundi'),(30,'Bután'),(31,'Cabo Verde'),(32,'Camboya'),(33,'Camerún'),(34,'Canadá'),(35,'Catar'),(36,'Chad'),(37,'Chile'),(38,'China'),(39,'Chipre'),(40,'Colombia'),(41,'Comoras'),(42,'Corea del Norte'),(43,'Corea del Sur'),(44,'Costa de Marfil'),(45,'Costa Rica'),(46,'Croacia'),(47,'Cuba'),(48,'Dinamarca'),(49,'Inglaterra'),(50,'Irlanda');
/*!40000 ALTER TABLE `pais_envios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (1,1,'2023-07-01',150.50),(2,2,'2023-07-02',200.25),(3,3,'2023-07-03',180.00),(4,1,'2023-07-04',120.25),(5,2,'2023-07-05',300.30),(6,3,'2023-07-06',120.50),(7,1,'2023-07-07',220.90),(8,2,'2023-07-08',180.70),(9,3,'2023-07-09',160.80),(10,1,'2023-07-10',200.40);
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `valoraciones`
--

LOCK TABLES `valoraciones` WRITE;
/*!40000 ALTER TABLE `valoraciones` DISABLE KEYS */;
INSERT INTO `valoraciones` VALUES (1,1,1,4,4,'Muy buen libro, me encantó.'),(2,2,2,5,5,'Excelente historia, no pude dejar de leerlo.'),(3,3,3,3,3,'Es un libro entretenido, aunque esperaba un poco más.'),(4,4,4,4,4,'Recomendado, tiene una trama interesante.'),(5,5,5,5,5,'Increíble libro, lo volvería a leer.'),(6,1,6,4,4,'Una historia emocionante y bien escrita.'),(7,2,7,5,5,'Uno de mis libros favoritos.'),(8,3,8,3,3,'No estuvo mal, pero no es mi tipo de libro.'),(9,4,9,4,4,'Me gustó mucho, lo recomendaré.'),(10,5,10,5,5,'Me enganchó desde el principio, lo amé.');
/*!40000 ALTER TABLE `valoraciones` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-24 21:13:37
