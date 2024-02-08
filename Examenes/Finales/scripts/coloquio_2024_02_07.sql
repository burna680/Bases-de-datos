CREATE TABLE AreasProtegidas (
    nombre_area VARCHAR(100) PRIMARY KEY,
    superficie_ha NUMERIC,
    ano_creacion INTEGER
);

CREATE TABLE Guardaparques (
    legajo INTEGER PRIMARY KEY,
    apellido VARCHAR(100),
    nombre VARCHAR(100),
    telefono VARCHAR(20)
);

CREATE TABLE Cuidan (
    legajo INTEGER,
    nombre_area VARCHAR(100),
    PRIMARY KEY (legajo, nombre_area),
    FOREIGN KEY (legajo) REFERENCES Guardaparques(legajo),
    FOREIGN KEY (nombre_area) REFERENCES AreasProtegidas(nombre_area)
);

-- Datos de áreas protegidas
INSERT INTO AreasProtegidas VALUES ('Parque Nacional Iguazú', 6729, 1934);
INSERT INTO AreasProtegidas VALUES ('Parque Nacional Los Glaciares', 4459, 1937);
INSERT INTO AreasProtegidas VALUES ('Parque Nacional Nahuel Huapi', 7104, 1934);
INSERT INTO AreasProtegidas VALUES ('Parque Nacional Tierra del Fuego', 6303, 1960);
INSERT INTO AreasProtegidas VALUES ('Reserva de la Biosfera de Calakmul', 7233, 1989);
INSERT INTO AreasProtegidas VALUES ('Reserva de juguete 1', 100001, 1900);
INSERT INTO AreasProtegidas VALUES ('Reserva de juguete 2', 100002, 1901);

-- Datos de guardaparques
INSERT INTO Guardaparques VALUES (1, 'Pérez', 'Juan', '123456789');
INSERT INTO Guardaparques VALUES (2, 'Gómez', 'María', '987654321');
INSERT INTO Guardaparques VALUES (3, 'Martínez', 'Carlos', '555666777');
INSERT INTO Guardaparques VALUES (4, 'López', 'Laura', '333222111');

-- Asignación de áreas a guardaparques
INSERT INTO Cuidan VALUES (1, 'Parque Nacional Iguazú');
INSERT INTO Cuidan VALUES (1, 'Parque Nacional Nahuel Huapi');
INSERT INTO Cuidan VALUES (2, 'Parque Nacional Los Glaciares');
INSERT INTO Cuidan VALUES (3, 'Parque Nacional Tierra del Fuego');
INSERT INTO Cuidan VALUES (3, 'Reserva de la Biosfera de Calakmul');
INSERT INTO Cuidan VALUES (1, 'Reserva de juguete 1');
INSERT INTO Cuidan VALUES (1, 'Reserva de juguete 2');


SELECT g.legajo,g.nombre,g.apellido, COUNT(a.nombre_area)
FROM Guardaparques g INNER JOIN Cuidan C on g.legajo = C.legajo INNER JOIN areasprotegidas a on c.nombre_area = a.nombre_area
WHERE a.superficie_ha >100000
GROUP BY g.legajo
HAVING COUNT(a.nombre_area) >=2