USE book_dep1;
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

