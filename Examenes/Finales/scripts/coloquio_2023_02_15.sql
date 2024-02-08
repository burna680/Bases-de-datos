CREATE TABLE Temperaturas_Feb (
    cod_estacion INT,
    fecha DATE,
    hora TIME,
    latitud FLOAT,
    longitud FLOAT,
    localidad VARCHAR(100),
    temperatura FLOAT,
    PRIMARY KEY (cod_estacion, fecha, hora)
);

INSERT INTO Temperaturas_Feb (cod_estacion, fecha, hora, latitud, longitud, localidad, temperatura) VALUES
(1, '2024-02-01', '00:00:00', -34.6037, -58.3816, 'Ciudad de Buenos Aires', 25.5),
(2, '2024-02-01', '01:00:00', -34.6037, -58.3816, 'Ciudad de Buenos Aires', 24.8),
(3, '2024-02-01', '02:00:00', -34.6037, -58.3816, 'Ciudad de Buenos Aires', 23.3),
(4, '2024-02-01', '03:00:00', -34.6037, -58.3816, 'Ciudad de Buenos Aires', 22.7),
(5, '2024-02-01', '04:00:00', -34.6037, -58.3816, 'Ciudad de Buenos Aires', 21.9),
(6, '2024-02-01', '05:00:00', -34.6037, -58.3816, 'Ciudad de Buenos Aires', 20.5),
(7, '2024-02-01', '06:00:00', -34.6037, -58.3816, 'Ciudad de Buenos Aires', 19.8),
(8, '2024-02-01', '07:00:00', -34.6037, -58.3816, 'Ciudad de Buenos Aires', 18.2),
(9, '2024-02-01', '08:00:00', -34.6037, -58.3816, 'Ciudad de Buenos Aires', 17.4),
(10, '2024-02-01', '09:00:00', -34.6037, -58.3816, 'Ciudad de Buenos Aires', 16.9),
(11, '2024-02-01', '10:00:00', -34.6037, -58.3816, 'Ciudad de Buenos Aires', 16.3),
(12, '2024-02-01', '11:00:00', -34.6037, -58.3816, 'Ciudad de Buenos Aires', 15.8),
(13, '2024-02-01', '12:00:00', -34.6037, -58.3816, 'Ciudad de Buenos Aires', 15.4),
(14, '2024-02-01', '13:00:00', -34.6037, -58.3816, 'Ciudad de Buenos Aires', 15.1),
(15, '2024-02-01', '14:00:00', -34.6037, -58.3816, 'Ciudad de Buenos Aires', 15.0),
(16, '2024-02-01', '15:00:00', -34.6037, -58.3816, 'Ciudad de Buenos Aires', 14.9),
(17, '2024-02-01', '16:00:00', -34.6037, -58.3816, 'Ciudad de Buenos Aires', 14.8),
(18, '2024-02-01', '17:00:00', -34.6037, -58.3816, 'Ciudad de Buenos Aires', 14.7),
(19, '2024-02-01', '18:00:00', -34.6037, -58.3816, 'Ciudad de Buenos Aires', 14.6),
(20, '2024-02-01', '19:00:00', -34.6037, -58.3816, 'Ciudad de Buenos Aires', 14.5),
(21, '2024-02-01', '20:00:00', -34.6037, -58.3816, 'Ciudad de Buenos Aires', 14.5),
(22, '2024-02-01', '21:00:00', -34.6037, -58.3816, 'Ciudad de Buenos Aires', 14.4),
(23, '2024-02-01', '22:00:00', -34.6037, -58.3816, 'Ciudad de Buenos Aires', 14.4),
(24, '2024-02-01', '23:00:00', -34.6037, -58.3816, 'Ciudad de Buenos Aires', 14.3),
(25, '2024-02-02', '00:00:00', -34.6037, -58.3816, 'Ciudad de Buenos Aires', 14.3),
(26, '2024-02-02', '01:00:00', -34.6037, -58.3816, 'Ciudad de Buenos Aires', 14.2),
(27, '2024-02-02', '02:00:00', -34.6037, -58.3816, 'Ciudad de Buenos Aires', 14.2),
(28, '2024-02-02', '03:00:00', -34.6037, -58.3816, 'Ciudad de Buenos Aires', 14.1),
(29, '2024-02-02', '04:00:00', -34.6037, -58.3816, 'Ciudad de Buenos Aires', 14.1),
(30, '2024-02-02', '05:00:00', -34.6037, -58.3816, 'Ciudad de Buenos Aires', 14.0),
(31, '2024-02-02', '06:00:00', -34.6037, -58.3816, 'Ciudad de Buenos Aires', 14.0),
(32, '2024-02-02', '07:00:00', -34.6037, -58.3816, 'Ciudad de Buenos Aires', 13.9),
(33, '2024-02-02', '08:00:00', -34.6037, -58.3816, 'Ciudad de Buenos Aires', 13.9),
(34, '2024-02-02', '09:00:00', -34.6037, -58.3816, 'Ciudad de Buenos Aires', 13.9),
(35, '2024-02-02', '10:00:00', -34.6037, -58.3816, 'Ciudad de Buenos Aires', 13.8),
(36, '2024-02-02', '11:00:00', -34.6037, -58.3816, 'Ciudad de Buenos Aires', 13.8),
(37, '2024-02-02', '12:00:00', -34.6037, -58.3816, 'Ciudad de Buenos Aires', 13.8),
(38, '2024-02-02', '13:00:00', -34.6037, -58.3816, 'Ciudad de Buenos Aires', 13.8),
(39, '2024-02-02', '14:00:00', -34.6037, -58.3816, 'Ciudad de Buenos Aires', 13.7),
(40, '2024-02-02', '15:00:00', -34.6037, -58.3816, 'Ciudad de Buenos Aires', 13.7),
(41, '2024-02-02', '16:00:00', -34.6037, -58.3816, 'Ciudad de Buenos Aires', 13.7),
(42, '2024-02-02', '17:00:00', -34.6037, -58.3816, 'Ciudad de Buenos Aires', 13.7),
(43, '2024-02-02', '18:00:00', -34.6037, -58.3816, 'Ciudad de Buenos Aires', 13.7),
(44, '2024-02-02', '19:00:00', -34.6037, -58.3816, 'Ciudad de Buenos Aires', 13.7),
(45, '2024-02-02', '20:00:00', -34.6037, -58.3816, 'Ciudad de Buenos Aires', 13.7),
(46, '2024-02-02', '21:00:00', -34.6037, -58.3816, 'Ciudad de Buenos Aires', 13.7),
(47, '2024-02-02', '22:00:00', -34.6037, -58.3816, 'Ciudad de Buenos Aires', 13.7),
(48, '2024-02-02', '23:00:00', -34.6037, -58.3816, 'Ciudad de Buenos Aires', 13.7),
(49, '2024-02-03', '00:00:00', -34.6037, -58.3816, 'Ciudad de Buenos Aires', 13.7),
(50, '2024-02-03', '01:00:00', -34.6037, -58.3816, 'Ciudad de Buenos Aires', 13.7);
INSERT INTO Temperaturas_Feb (cod_estacion, fecha, hora, latitud, longitud, localidad, temperatura) VALUES
(1, '2024-02-04', '08:00:00', -34.6037, -58.3816, 'Ciudad de Buenos Aires', 20.5),
(1, '2024-02-04', '12:00:00', -34.6037, -58.3816, 'Ciudad de Buenos Aires', 25.3),
(1, '2024-02-05', '12:00:00', -34.6037, -58.3816, 'Ciudad de Buenos Aires', 24.8),
(2, '2024-02-05', '08:00:00', -34.5467, -58.4386, 'Ciudad de Buenos Aires', 21.5),
(1, '2023-02-07', '08:00:00', -34.6037, -58.3816, 'Ciudad de Buenos Aires', 23.0),
(1, '2023-02-07', '12:00:00', -34.6037, -58.3816, 'Ciudad de Buenos Aires', 27.1),
(1, '2023-02-08', '08:00:00', -34.6037, -58.3816, 'Ciudad de Buenos Aires', 22.5),
(1, '2023-02-08', '12:00:00', -34.6037, -58.3816, 'Ciudad de Buenos Aires', 26.3),
(1, '2023-02-09', '08:00:00', -34.6037, -58.3816, 'Ciudad de Buenos Aires', 21.8),
(1, '2023-02-09', '12:00:00', -34.6037, -58.3816, 'Ciudad de Buenos Aires', 25.6),
(1, '2023-02-10', '08:00:00', -34.6037, -58.3816, 'Ciudad de Buenos Aires', 20.9),
(1, '2023-02-10', '12:00:00', -34.6037, -58.3816, 'Ciudad de Buenos Aires', 24.9),
(1, '2023-02-11', '08:00:00', -34.6037, -58.3816, 'Ciudad de Buenos Aires', 22.2),
(1, '2023-02-11', '12:00:00', -34.6037, -58.3816, 'Ciudad de Buenos Aires', 26.8),
(1, '2023-02-12', '08:00:00', -34.6037, -58.3816, 'Ciudad de Buenos Aires', 23.3),
(1, '2023-02-12', '12:00:00', -34.6037, -58.3816, 'Ciudad de Buenos Aires', 27.5),
(1, '2023-02-13', '08:00:00', -34.6037, -58.3816, 'Ciudad de Buenos Aires', 22.8),
(1, '2023-02-13', '12:00:00', -34.6037, -58.3816, 'Ciudad de Buenos Aires', 26.1),
(1, '2023-02-14', '08:00:00', -34.6037, -58.3816, 'Ciudad de Buenos Aires', 21.5),
(1, '2023-02-14', '12:00:00', -34.6037, -58.3816, 'Ciudad de Buenos Aires', 25.0),
(1, '2023-02-15', '08:00:00', -34.6037, -58.3816, 'Ciudad de Buenos Aires', 20.7),
(1, '2023-02-15', '12:00:00', -34.6037, -58.3816, 'Ciudad de Buenos Aires', 24.8),
(1, '2023-02-16', '08:00:00', -34.6037, -58.3816, 'Ciudad de Buenos Aires', 22.1),
(1, '2023-02-16', '12:00:00', -34.6037, -58.3816, 'Ciudad de Buenos Aires', 26.2),
(1, '2023-02-17', '08:00:00', -34.6037, -58.3816, 'Ciudad de Buenos Aires', 23.0),
(1, '2023-02-17', '12:00:00', -34.6037, -58.3816, 'Ciudad de Buenos Aires', 27.3),
(1, '2023-02-18', '08:00:00', -34.6037, -58.3816, 'Ciudad de Buenos Aires', 22.3),
(1, '2023-02-18', '12:00:00', -34.6037, -58.3816, 'Ciudad de Buenos Aires', 26.0),
(1, '2023-02-19', '08:00:00', -34.6037, -58.3816, 'Ciudad de Buenos Aires', 21.8),
(1, '2023-02-19', '12:00:00', -34.6037, -58.3816, 'Ciudad de Buenos Aires', 25.4),
(1, '2023-02-20', '08:00:00', -34.6037, -58.3816, 'Ciudad de Buenos Aires', 22.0),
(1, '2023-02-20', '12:00:00', -34.6037, -58.3816, 'Ciudad de Buenos Aires', 26.8),
(2, '2023-02-05', '08:00:00', -34.5467, -58.4386, 'Ciudad de Buenos Aires', 20.8),
(2, '2023-02-05', '12:00:00', -34.5467, -58.4386, 'Ciudad de Buenos Aires', 24.2),
(2, '2023-02-06', '08:00:00', -34.5467, -58.4386, 'Ciudad de Buenos Aires', 19.5),
(2, '2023-02-06', '12:00:00', -34.5467, -58.4386, 'Ciudad de Buenos Aires', 23.8),
(2, '2023-02-07', '08:00:00', -34.5467, -58.4386, 'Ciudad de Buenos Aires', 21.0),
(2, '2023-02-07', '12:00:00', -34.5467, -58.4386, 'Ciudad de Buenos Aires', 24.8),
(2, '2023-02-08', '08:00:00', -34.5467, -58.4386, 'Ciudad de Buenos Aires', 20.5),
(2, '2023-02-08', '12:00:00', -34.5467, -58.4386, 'Ciudad de Buenos Aires', 24.3),
(2, '2023-02-09', '08:00:00', -34.5467, -58.4386, 'Ciudad de Buenos Aires', 19.8),
(2, '2023-02-09', '12:00:00', -34.5467, -58.4386, 'Ciudad de Buenos Aires', 23.6),
(2, '2023-02-10', '08:00:00', -34.5467, -58.4386, 'Ciudad de Buenos Aires', 20.3),
(2, '2023-02-10', '12:00:00', -34.5467, -58.4386, 'Ciudad de Buenos Aires', 24.0),
(2, '2023-02-11', '08:00:00', -34.5467, -58.4386, 'Ciudad de Buenos Aires', 21.5),
(2, '2023-02-11', '12:00:00', -34.5467, -58.4386, 'Ciudad de Buenos Aires', 25.1),
(2, '2023-02-12', '08:00:00', -34.5467, -58.4386, 'Ciudad de Buenos Aires', 20.9),
(2, '2023-02-12', '12:00:00', -34.5467, -58.4386, 'Ciudad de Buenos Aires', 24.7),
(2, '2023-02-13', '08:00:00', -34.5467, -58.4386, 'Ciudad de Buenos Aires', 21.3),
(2, '2023-02-13', '12:00:00', -34.5467, -58.4386, 'Ciudad de Buenos Aires', 24.9),
(2, '2023-02-14', '08:00:00', -34.5467, -58.4386, 'Ciudad de Buenos Aires', 21.7),
(2, '2023-02-14', '12:00:00', -34.5467, -58.4386, 'Ciudad de Buenos Aires', 25.3),
(2, '2023-02-15', '08:00:00', -34.5467, -58.4386, 'Ciudad de Buenos Aires', 21.0),
(2, '2023-02-15', '12:00:00', -34.5467, -58.4386, 'Ciudad de Buenos Aires', 24.6),
(2, '2023-02-16', '08:00:00', -34.5467, -58.4386, 'Ciudad de Buenos Aires', 21.9),
(2, '2023-02-16', '12:00:00', -34.5467, -58.4386, 'Ciudad de Buenos Aires', 25.5),
(2, '2023-02-17', '08:00:00', -34.5467, -58.4386, 'Ciudad de Buenos Aires', 22.3),
(2, '2023-02-17', '12:00:00', -34.5467, -58.4386, 'Ciudad de Buenos Aires', 26.1),
(2, '2023-02-18', '08:00:00', -34.5467, -58.4386, 'Ciudad de Buenos Aires', 22.7),
(2, '2023-02-18', '12:00:00', -34.5467, -58.4386, 'Ciudad de Buenos Aires', 26.2),
(2, '2023-02-19', '08:00:00', -34.5467, -58.4386, 'Ciudad de Buenos Aires', 22.1),
(2, '2023-02-19', '12:00:00', -34.5467, -58.4386, 'Ciudad de Buenos Aires', 25.8),
(2, '2023-02-20', '08:00:00', -34.5467, -58.4386, 'Ciudad de Buenos Aires', 22.5),
(2, '2023-02-20', '12:00:00', -34.5467, -58.4386, 'Ciudad de Buenos Aires', 26.3);


-- Primera query errónea
SELECT DISTINCT fecha, MAX(temperatura) OVER(PARTITION BY fecha ORDER BY temperatura) AS temperatura_maxima
FROM temperaturas_feb
WHERE localidad= 'Ciudad de Buenos Aires'
FETCH FIRST 10 ROWS ONLY;

-- Segunda query correcta
SELECT DISTINCT t.fecha, t.temperatura
FROM temperaturas_feb t
WHERE t.localidad= 'Ciudad de Buenos Aires'
AND t.temperatura= (
        SELECT MAX(t1.temperatura)
        FROM temperaturas_feb t1
        WHERE t1.localidad = t.localidad
          AND t1.fecha = t.fecha
    )
ORDER BY t.temperatura DESC
OFFSET 0 ROWS FETCH FIRST 10 ROWS ONLY;


