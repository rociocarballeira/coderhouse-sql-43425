USE book_dep1
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







