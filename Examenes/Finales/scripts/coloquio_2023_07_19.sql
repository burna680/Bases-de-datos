-- Crear la tabla Hoyos
CREATE TABLE Hoyos (
    nro_hoyo INTEGER PRIMARY KEY,
    handicap INTEGER,
    par INTEGER
);

-- Crear la tabla Socios
CREATE TABLE Socios (
    nro_socio INTEGER PRIMARY KEY,
    apellido VARCHAR(50),
    nombre VARCHAR(50)
);

-- Crear la tabla Partidas
CREATE TABLE Partidas (
    cod_partida SERIAL PRIMARY KEY,
    fecha DATE,
    hora TIME
);

-- Crear la tabla JugadoresPartidas
CREATE TABLE JugadoresPartidas (
    cod_partida INTEGER,
    nro_socio INTEGER,
    PRIMARY KEY (cod_partida, nro_socio),
    FOREIGN KEY (cod_partida) REFERENCES Partidas(cod_partida),
    FOREIGN KEY (nro_socio) REFERENCES Socios(nro_socio)
);

-- Crear la tabla Puntuaciones
CREATE TABLE Puntuaciones (
    cod_partida INTEGER,
    nro_hoyo INTEGER,
    nro_socio INTEGER,
    puntuacion INTEGER,
    PRIMARY KEY (cod_partida, nro_hoyo, nro_socio),
    FOREIGN KEY (cod_partida) REFERENCES Partidas(cod_partida),
    FOREIGN KEY (nro_hoyo) REFERENCES Hoyos(nro_hoyo),
    FOREIGN KEY (nro_socio) REFERENCES Socios(nro_socio)
);

-- Insertar datos de ejemplo en Hoyos
INSERT INTO Hoyos (nro_hoyo, handicap, par) VALUES
(1, 3, 4),
(2, 5, 4),
(3, 2, 3),
(4, 4, 5),
(5, 6, 4),
(6, 3, 4),
(7, 5, 5),
(8, 4, 4),
(9, 2, 3),
(10, 6, 5);

-- Insertar datos de ejemplo en Socios
INSERT INTO Socios (nro_socio, apellido, nombre) VALUES
(1, 'García', 'Juan'),
(2, 'López', 'María'),
(3, 'Martínez', 'Pedro'),
(4, 'Fernández', 'Ana'),
(5, 'Rodríguez', 'Carlos'),
(6, 'Gómez', 'Laura'),
(7, 'Pérez', 'Miguel'),
(8, 'Díaz', 'Carmen'),
(9, 'Sanchez', 'Jorge'),
(10, 'Martín', 'Sofía');

-- Insertar datos de ejemplo en Partidas
INSERT INTO Partidas (fecha, hora) VALUES
('2023-01-01', '10:00'),
('2023-01-02', '11:30'),
('2023-01-03', '09:15'),
('2023-01-04', '14:00'),
('2023-01-05', '08:45'),
('2023-01-06', '13:30'),
('2023-01-07', '10:45'),
('2023-01-08', '12:00'),
('2023-01-09', '15:15'),
('2023-01-10', '08:30');

-- Insertar datos de ejemplo en JugadoresPartidas
INSERT INTO JugadoresPartidas (cod_partida, nro_socio) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 5),
(3, 1),
(4, 2),
(4, 3),
(5, 4),
(5, 5),
(6, 6),
(6, 7),
(7, 8),
(7, 9),
(8, 10),
(8, 6),
(9, 7),
(9, 8),
(10, 9),
(10, 10);

-- Insertar datos de ejemplo en Puntuaciones
INSERT INTO Puntuaciones (cod_partida, nro_hoyo, nro_socio, puntuacion) VALUES
(1, 1, 1, 3),
(1, 2, 1, 4),
(2, 1, 2, 3),
(2, 2, 2, 5),
(3, 1, 3, 2),
(3, 2, 3, 4),
(4, 1, 4, 4),
(4, 2, 4, 5),
(5, 1, 5, 4),
(5, 2, 5, 6),
(6, 1, 6, 3),
(6, 2, 6, 4),
(7, 1, 7, 3),
(7, 2, 7, 5),
(8, 1, 8, 4),
(8, 2, 8, 5),
(9, 1, 9, 2),
(9, 2, 9, 4),
(10, 1, 10, 4),
(10, 2, 10, 6);

--Query del enunciado
SELECT DISTINCT nro_socio , apellido , nombre
FROM Socios NATURAL JOIN Puntuaciones NATURAL JOIN Hoyos
WHERE puntuacion <= par
AND handicap <= 6;

-- Query solución al ejercicio
-- "Encuentre el numero de socio, apellido y nombre de aquellos/as socios/as que jamas hayan
-- completado un hoyo en una cantidad de golpes (es decir, ‘puntuacion’) mayor que la cantidad
-- indicada por el par del hoyo.

SELECT DISTINCT s.nro_socio, s.apellido, s.nombre
FROM Socios s
WHERE NOT EXISTS (  SELECT 1
                    FROM Hoyos h
                    WHERE EXISTS (
                        SELECT 1
                        FROM Puntuaciones p
                        WHERE p.nro_socio = s.nro_socio
                            AND p.nro_hoyo = h.nro_hoyo
                            AND p.puntuacion > h.par
                        )
    )