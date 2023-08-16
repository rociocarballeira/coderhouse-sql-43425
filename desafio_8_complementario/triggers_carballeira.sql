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

//

DELIMITER ;
