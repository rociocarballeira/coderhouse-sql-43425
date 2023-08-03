USE book_dep1;

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


