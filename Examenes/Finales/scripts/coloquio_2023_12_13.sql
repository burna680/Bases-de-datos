-- Tabla de Vuelos
CREATE TABLE Vuelos (
    cod_vuelo VARCHAR(10) PRIMARY KEY,
    nro_pista_asignada INT,
    hora_inicio_pista TIMESTAMP,
    hora_fin_pista TIMESTAMP
);

-- Vuelos en días distintos
INSERT INTO Vuelos VALUES (1, 1, '2024-02-05 08:00', '2024-02-05 10:00');
INSERT INTO Vuelos VALUES (2, 2, '2024-02-06 09:00', '2024-02-06 11:00');
INSERT INTO Vuelos VALUES (3, 3, '2024-02-07 10:00', '2024-02-07 12:00');
INSERT INTO Vuelos VALUES (4, 4, '2024-02-08 11:00', '2024-02-08 13:00');
INSERT INTO Vuelos VALUES (5, 5, '2024-02-09 12:00', '2024-02-09 14:00');
INSERT INTO Vuelos VALUES (6, 6, '2024-02-10 13:00', '2024-02-10 15:00');
INSERT INTO Vuelos VALUES (7, 7, '2024-02-11 14:00', '2024-02-11 16:00');
INSERT INTO Vuelos VALUES (8, 8, '2024-02-12 15:00', '2024-02-12 17:00');
INSERT INTO Vuelos VALUES (9, 9, '2024-02-13 16:00', '2024-02-13 18:00');
INSERT INTO Vuelos VALUES (10, 10, '2024-02-14 17:00', '2024-02-14 19:00');

-- Vuelos el mismo día pero en distintas pistas
INSERT INTO Vuelos VALUES (11, 1, '2024-02-15 10:00', '2024-02-15 12:00');
INSERT INTO Vuelos VALUES (12, 2, '2024-02-15 11:00', '2024-02-15 13:00');
INSERT INTO Vuelos VALUES (13, 3, '2024-02-15 12:00', '2024-02-15 14:00');
INSERT INTO Vuelos VALUES (14, 4, '2024-02-15 13:00', '2024-02-15 15:00');
INSERT INTO Vuelos VALUES (15, 5, '2024-02-15 14:00', '2024-02-15 16:00');
INSERT INTO Vuelos VALUES (16, 6, '2024-02-15 15:00', '2024-02-15 17:00');
INSERT INTO Vuelos VALUES (17, 7, '2024-02-15 16:00', '2024-02-15 18:00');
INSERT INTO Vuelos VALUES (18, 8, '2024-02-15 17:00', '2024-02-15 19:00');
INSERT INTO Vuelos VALUES (19, 9, '2024-02-15 18:00', '2024-02-15 20:00');
INSERT INTO Vuelos VALUES (20, 10, '2024-02-15 19:00', '2024-02-15 21:00');

-- Vuelos el mismo día en la misma pista (superpuestos)
INSERT INTO Vuelos VALUES (21, 1, '2024-02-16 10:00', '2024-02-16 12:00');
INSERT INTO Vuelos VALUES (22, 1, '2024-02-16 11:00', '2024-02-16 13:00');
INSERT INTO Vuelos VALUES (23, 2, '2024-02-16 12:00', '2024-02-16 14:00');
INSERT INTO Vuelos VALUES (24, 2, '2024-02-16 13:00', '2024-02-16 15:00');
INSERT INTO Vuelos VALUES (25, 3, '2024-02-16 14:00', '2024-02-16 16:00');
INSERT INTO Vuelos VALUES (26, 3, '2024-02-16 15:00', '2024-02-16 17:00');
INSERT INTO Vuelos VALUES (27, 4, '2024-02-16 16:00', '2024-02-16 18:00');
INSERT INTO Vuelos VALUES (28, 4, '2024-02-16 17:00', '2024-02-16 19:00');
INSERT INTO Vuelos VALUES (29, 5, '2024-02-16 18:00', '2024-02-16 20:00');
INSERT INTO Vuelos VALUES (30, 5, '2024-02-16 19:00', '2024-02-16 21:00');



SELECT *
FROM Vuelos v1
WHERE EXISTS (
    SELECT *
    FROM Vuelos v2
    WHERE EXTRACT(DOY FROM v1.hora_inicio_pista)=EXTRACT(DOY FROM v2.hora_inicio_pista)
        AND v1.cod_vuelo<>v2.cod_vuelo
        AND v1.nro_pista_asignada=v2.nro_pista_asignada
    )
ORDER BY v1.nro_pista_asignada;












SELECT v1.cod_vuelo, v2.cod_vuelo, v1.nro_pista_asignada,v2.nro_pista_asignada,   EXTRACT(DOY FROM v1.hora_inicio_pista) as dia_vuelo_1 ,EXTRACT(DOY FROM v2.hora_inicio_pista) as dia_vuelo_2
FROM Vuelos v1 INNER JOIN Vuelos v2 USING (nro_pista_asignada)
WHERE EXTRACT(DOY FROM v1.hora_inicio_pista)= EXTRACT(DOY FROM v2.hora_inicio_pista)
    AND v1.cod_vuelo <> v2.cod_vuelo
