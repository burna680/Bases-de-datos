-- Crear la tabla Archivos
CREATE TABLE Archivos (
    file_id SERIAL PRIMARY KEY,
    client_id INTEGER,
    nombre VARCHAR(100),
    fecha_ultimo_backup DATE
);

-- Crear la tabla CopiasSeguridad
CREATE TABLE CopiasSeguridad (
    file_id INTEGER,
    disk_id SERIAL,
    fecha_backup DATE,
    PRIMARY KEY (file_id, disk_id),
    FOREIGN KEY (file_id) REFERENCES Archivos(file_id)
);

-- Crear la tabla DataCenters
CREATE TABLE DataCenters (
    data_center_id SERIAL PRIMARY KEY,
    ciudad VARCHAR(100),
    latitud DECIMAL(9,6),
    longitud DECIMAL(9,6)
);

-- Crear la tabla Discos
CREATE TABLE Discos (
    disk_id SERIAL PRIMARY KEY,
    marca VARCHAR(50),
    capacidad INTEGER,
    data_center_id INTEGER,
    FOREIGN KEY (data_center_id) REFERENCES DataCenters(data_center_id)
);


-- Insertar datos de ejemplo en Archivos
INSERT INTO Archivos (client_id, nombre, fecha_ultimo_backup) VALUES
(1, 'archivo1.txt', '2023-01-01'),
(1, 'archivo2.txt', '2023-01-02'),
(2, 'documento.doc', '2023-01-01'),
(2, 'imagen.jpg', '2023-01-03'),
(3, 'datos.xlsx', '2023-01-02'),
(3, 'presentacion.ppt', '2023-01-01'),
(4, 'backup.bak', '2023-01-03'),
(4, 'video.mp4', '2023-01-02'),
(5, 'reporte.pdf', '2023-01-03'),
(5, 'script.sql', '2023-01-01');

-- Insertar datos de ejemplo en CopiasSeguridad
INSERT INTO CopiasSeguridad (file_id, disk_id, fecha_backup) VALUES
--Archivos que NO tienen copia
(3, 2, '2023-01-01'),
(4, 2, '2023-01-03'),
(5, 3, '2023-01-02'),
(6, 3, '2023-01-01'),
(7, 4, '2023-01-03'),
(8, 4, '2023-01-02'),
(9, 5, '2023-01-03'),
(10, 5, '2023-01-01'),
--Archivos que tienen copia                                                                    ,
(1, 1, '2023-01-01'),
(2, 1, '2023-01-02'),
(1, 2, '2023-01-01'),
(1, 3, '2023-01-01'),
(2, 2, '2023-01-01');

-- Insertar datos de ejemplo en DataCenters
INSERT INTO DataCenters (ciudad, latitud, longitud) VALUES
('Ciudad1', 40.7128, -74.0060),
('Ciudad2', 34.0522, -118.2437),
('Ciudad3', 51.5074, -0.1278),
('Ciudad4', -33.8688, 151.2093),
('Ciudad5', 35.6895, 139.6917);

-- Insertar datos de ejemplo en Discos
INSERT INTO Discos (marca, capacidad, data_center_id) VALUES
('Marca1', 1000, 1),
('Marca2', 2000, 2),
('Marca3', 1500, 3),
('Marca4', 3000, 4),
('Marca5', 2500, 5);

SELECT c1.file_id
FROM CopiasSeguridad c1 INNER JOIN Discos d1 USING (disk_id)
    INNER JOIN DataCenters dc1 USING(data_center_id)
WHERE NOT EXISTS (
    SELECT *
    FROM CopiasSeguridad c2 INNER JOIN Discos d2 USING (disk_id)
    INNER JOIN DataCenters dc2 USING(data_center_id)
    WHERE c1.file_id=c2.file_id AND
          dc1.ciudad <> dc2.ciudad
);
