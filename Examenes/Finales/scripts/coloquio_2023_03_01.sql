-- Crear la tabla Atletas
CREATE TABLE Atletas (
    cod_atleta SERIAL PRIMARY KEY,
    nombre_apellido VARCHAR(100),
    fecha_nacimiento DATE,
    nacionalidad VARCHAR(50)
);

-- Crear la tabla Competiciones
CREATE TABLE Competiciones (
    cod_competicion SERIAL PRIMARY KEY,
    tipo VARCHAR(50),
    ciudad VARCHAR(100),
    fecha DATE
);

-- Crear la tabla Marcas
CREATE TABLE Marcas (
    cod_atleta INTEGER,
    cod_competicion INTEGER,
    marca VARCHAR(20),
    PRIMARY KEY (cod_atleta, cod_competicion),
    FOREIGN KEY (cod_atleta) REFERENCES Atletas(cod_atleta),
    FOREIGN KEY (cod_competicion) REFERENCES Competiciones(cod_competicion)
);


-- Insertar datos de ejemplo para 50 atletas
INSERT INTO Atletas (nombre_apellido, fecha_nacimiento, nacionalidad) VALUES
('Emil Zatopek', '1922-09-19', 'Checa'),
('Usain Bolt', '1986-08-21', 'Jamaica'),
('Haile Gebrselassie', '1973-04-18', 'Etiopía'),
('Kenenisa Bekele', '1982-06-13', 'Etiopía'),
('Mo Farah', '1983-03-23', 'Reino Unido'),
('Galen Rupp', '1986-05-08', 'Estados Unidos'),
('Eliud Kipchoge', '1984-11-05', 'Kenia'),
('Paula Radcliffe', '1973-12-17', 'Reino Unido'),
('Tirunesh Dibaba', '1985-06-01', 'Etiopía'),
('Ethiopia Kiplagat', '1979-01-15', 'Kenia'),
('Florence Griffith-Joyner', '1959-12-21', 'Estados Unidos'),
('Carl Lewis', '1961-07-01', 'Estados Unidos'),
('Michael Johnson', '1967-09-13', 'Estados Unidos'),
('Allyson Felix', '1985-11-18', 'Estados Unidos'),
('Asafa Powell', '1982-11-23', 'Jamaica'),
('Shelly-Ann Fraser-Pryce', '1986-12-27', 'Jamaica'),
('Steve Prefontaine', '1951-01-25', 'Estados Unidos'),
('Almaz Ayana', '1991-11-21', 'Etiopía'),
('Sifan Hassan', '1993-01-01', 'Países Bajos'),
('Yelena Isinbayeva', '1982-06-03', 'Rusia'),
('David Rudisha', '1988-12-17', 'Kenia'),
('Hicham El Guerrouj', '1974-09-14', 'Marruecos'),
('Javier Sotomayor', '1967-10-13', 'Cuba'),
('Renaud Lavillenie', '1986-09-18', 'Francia'),
('Aries Merritt', '1985-07-24', 'Estados Unidos');

-- Insertar datos de ejemplo para 50 competiciones
INSERT INTO Competiciones (tipo, ciudad, fecha) VALUES
('10000 metros llanos', 'Helsinki', '1952-07-20'),
('10000 metros llanos', 'Melbourne', '1956-12-01'),
('10000 metros llanos', 'Roma', '1960-09-11'),
('10000 metros llanos', 'Tokio', '1964-10-14'),
('10000 metros llanos', 'México D.F.', '1968-10-13'),
('10000 metros llanos', 'Múnich', '1972-09-03'),
('10000 metros llanos', 'Montreal', '1976-07-23'),
('10000 metros llanos', 'Moscú', '1980-07-25'),
('10000 metros llanos', 'Los Ángeles', '1984-08-03'),
('10000 metros llanos', 'Seúl', '1988-09-30'),
('10000 metros llanos', 'Barcelona', '1992-08-08'),
('10000 metros llanos', 'Atlanta', '1996-07-28'),
('10000 metros llanos', 'Sídney', '2000-09-25'),
('10000 metros llanos', 'Atenas', '2004-08-20'),
('10000 metros llanos', 'Pekín', '2008-08-15'),
('10000 metros llanos', 'Londres', '2012-08-04'),
('10000 metros llanos', 'Río de Janeiro', '2016-08-12'),
('10000 metros llanos', 'Tokio', '2021-08-06'),
('10000 metros llanos', 'París', '1924-07-06'),
('10000 metros llanos', 'Ámsterdam', '1928-07-29'),
('10000 metros llanos', 'Los Ángeles', '1932-08-06'),
('10000 metros llanos', 'Berlín', '1936-08-02'),
('10000 metros llanos', 'Londres', '1948-08-06'),
('10000 metros llanos', 'Helsinki', '1952-07-20'),
('10000 metros llanos', 'Melbourne', '1956-12-01'),
('10000 metros llanos', 'Roma', '1960-09-11'),
('10000 metros llanos', 'Tokio', '1964-10-14'),
('10000 metros llanos', 'México D.F.', '1968-10-13'),
('10000 metros llanos', 'Múnich', '1972-09-03'),
('10000 metros llanos', 'Montreal', '1976-07-23'),
('10000 metros llanos', 'Moscú', '1980-07-25'),
('10000 metros llanos', 'Los Ángeles', '1984-08-03'),
('10000 metros llanos', 'Seúl', '1988-09-30'),
('10000 metros llanos', 'Barcelona', '1992-08-08'),
('10000 metros llanos', 'Atlanta', '1996-07-28'),
('10000 metros llanos', 'Sídney', '2000-09-25'),
('10000 metros llanos', 'Atenas', '2004-08-20'),
('10000 metros llanos', 'Pekín', '2008-08-15'),
('10000 metros llanos', 'Londres', '2012-08-04'),
('10000 metros llanos', 'Río de Janeiro', '2016-08-12'),
('10000 metros llanos', 'Tokio', '2021-08-06'),
('10000 metros llanos', 'París', '1924-07-06'),
('10000 metros llanos', 'Ámsterdam', '1928-07-29'),
('10000 metros llanos', 'Los Ángeles', '1932-08-06'),
('10000 metros llanos', 'Berlín', '1936-08-02'),
('10000 metros llanos', 'Londres', '1948-08-06');


-- Insertar datos de ejemplo para la tabla Marcas
INSERT INTO Marcas (cod_atleta, cod_competicion, marca) VALUES
-- Marcas de atletas que superan la marca de Emil Zatopek
(2, 1, '28:20.0'),
(3, 1, '27:55.2'),
(4, 1, '27:30.0'),
(5, 1, '27:25.6'),
(6, 1, '27:15.0'),
(7, 1, '27:40.0'),
(8, 1, '27:10.8'),
(9, 1, '27:45.0'),
(10, 1, '27:28.4'),
(11, 1, '27:20.5'),
(12, 1, '27:15.2'),
(13, 1, '27:30.7'),
(14, 1, '27:35.8'),
(15, 1, '27:10.4'),
(16, 1, '27:05.9'),
(17, 1, '27:40.2'),
(18, 1, '27:22.9'),
(19, 1, '27:38.1'),
(20, 1, '27:20.3'),
(21, 1, '28:20.0'),
(22, 1, '27:55.2'),
(23, 1, '27:30.0'),
(24, 1, '27:25.6'),
(25, 1, '27:15.0'),
(26, 1, '27:40.0'),
(27, 1, '27:10.8'),
(28, 1, '27:45.0'),
(29, 1, '27:28.4'),
(30, 1, '27:20.5'),
(31, 1, '27:15.2'),
(32, 1, '27:30.7'),
(33, 1, '27:35.8'),
(34, 1, '27:10.4'),
(35, 1, '27:05.9'),
(36, 1, '27:40.2'),
(37, 1, '27:22.9'),
(38, 1, '27:38.1'),
(39, 1, '27:20.3'),
-- Marcas de atletas que no superan la marca de Emil Zatopek
(40, 1, '28:30.0'),
(41, 1, '28:10.5'),
(42, 1, '28:45.2'),
(43, 1, '28:20.9'),
(44, 1, '28:55.6'),
(45, 1, '28:30.4'),
(46, 1, '29:05.8'),
(47, 1, '28:48.0'),
(48, 1, '28:40.3'),
(49, 1, '28:52.7'),
(50, 1, '29:10.2');


SELECT DISTINCT cod_atleta, nombre_apellido
FROM Atletas a INNER JOIN Marcas m USING(cod_atleta)
    INNER JOIN Competiciones c USING(cod_competicion)
WHERE tipo='10000 metros llanos' AND
      marca < (SELECT MIN(marca)
               FROM Atletas a INNER JOIN Marcas m USING (cod_atleta) INNER JOIN Competiciones c USING(cod_competicion)
                WHERE tipo='10000 metros llanos' AND
                      a.nombre_apellido= 'Emil Zatopek'
               );