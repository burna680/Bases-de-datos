-- Crear la tabla Productos
CREATE TABLE Productos (
    cod_barras_producto VARCHAR(50) PRIMARY KEY,
    nombre_producto VARCHAR(100),
    categoria VARCHAR(50)
);

-- Crear la tabla PreciosRelevados
CREATE TABLE PreciosRelevados (
    cod_barras_producto VARCHAR(50),
    fecha DATE,
    precio NUMERIC(10, 2),
    PRIMARY KEY (cod_barras_producto, fecha),
    FOREIGN KEY (cod_barras_producto) REFERENCES Productos(cod_barras_producto)
);

-- Insertar ejemplos de productos
INSERT INTO Productos (cod_barras_producto, nombre_producto, categoria) VALUES
('123456789', 'Detergente', 'LIMPIEZA'),
('234567890', 'Desinfectante', 'LIMPIEZA'),
('345678901', 'Limpiavidrios', 'LIMPIEZA'),
('456789012', 'Bolsas de basura', 'LIMPIEZA'),
('567890123', 'Esponjas', 'LIMPIEZA'),
('678901234', 'Desodorante de ambientes', 'LIMPIEZA'),
('789012345', 'Jabón en barra', 'LIMPIEZA'),
('890123456', 'Lavandina', 'LIMPIEZA'),
('901234567', 'Lustramuebles', 'LIMPIEZA'),
('012345678', 'Paños de limpieza', 'LIMPIEZA');

-- Insertar ejemplos de precios relevados
INSERT INTO PreciosRelevados (cod_barras_producto, fecha, precio) VALUES
-- Precios de Detergente
('123456789', '2022-02-01', 10.50),
('123456789', '2023-02-01', 12.30),
-- Precios de Desinfectante
('234567890', '2022-02-01', 8.75),
('234567890', '2023-02-01', 9.20),
-- Precios de Limpiavidrios
('345678901', '2022-02-01', 6.80),
('345678901', '2023-02-01', 7.50),
-- Precios de Bolsas de basura
('456789012', '2022-02-01', 15.25),
('456789012', '2023-02-01', 16.80),
-- Precios de Esponjas
('567890123', '2022-02-01', 3.50),
('567890123', '2023-02-01', 3.80),
-- Precios de Desodorante de ambientes
('678901234', '2022-02-01', 12.80),
('678901234', '2023-02-01', 13.50),
-- Precios de Jabón en barra
('789012345', '2022-02-01', 2.75),
('789012345', '2023-02-01', 3.10),
-- Precios de Lavandina
('890123456', '2022-02-01', 8.20),
('890123456', '2023-02-01', 9.00),
-- Precios de Lustramuebles
('901234567', '2022-02-01', 11.00),
('901234567', '2023-02-01', 11.80),
-- Precios de Paños de limpieza
('012345678', '2022-02-01', 6.00),
('012345678', '2023-02-01', 6.50);

WITH inflacion_interanual
AS (
    SELECT *, pr.precio - LAG(pr.precio,1) OVER( PARTITION BY p.cod_barras_producto ORDER BY fecha) as diff_precios
    FROM Productos p INNER JOIN PreciosRelevados pr on p.cod_barras_producto = pr.cod_barras_producto
    WHERE categoria= 'LIMPIEZA'
)
SELECT AVG(diff_precios) as inflacion
FROM inflacion_interanual;
