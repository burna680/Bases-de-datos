-- Drop Ejemplares table
DROP TABLE IF EXISTS Ejemplares;
-- Drop Reservas table
DROP TABLE IF EXISTS Reservas;
-- Drop Reservas table and all dependent objects
DROP TABLE IF EXISTS Reservas CASCADE;
-- Drop Ejemplares table
DROP TABLE IF EXISTS Especies;

-- Create Reservas table
CREATE TABLE Reservas (
    nombre_reserva VARCHAR(255) PRIMARY KEY,
    superficie DECIMAL,
    ano_creacion INTEGER
);

-- Create Ejemplares table with a foreign key reference to Reservas
CREATE TABLE Ejemplares (
    id SERIAL PRIMARY KEY,
    nombre_reserva VARCHAR(255) REFERENCES Reservas(nombre_reserva),
    nombre_especie VARCHAR(255),
    cantidad_ejemplares INTEGER,
    UNIQUE(nombre_reserva, nombre_especie) -- Ensure uniqueness of (nombre_reserva, nombre_especie) pairs
);

-- Create Especies table
CREATE TABLE Especies (
    nombre_especie VARCHAR(255) PRIMARY KEY,
    familia VARCHAR(255),
    en_extincion BOOLEAN
);

-- Insert example data into Reservas table
INSERT INTO Reservas (nombre_reserva, superficie, ano_creacion)
VALUES
    ('Amazon Rainforest', 5500000, 1970),
    ('Yellowstone National Park', 2219790, 1872),
    ('Great Barrier Reef', 344400, 1975),
    ('Yosemite National Park', 3081877, 1890),
    ('Kruger National Park', 1948500, 1898),
    ('Galápagos Islands', 7881, 1959);

-- Insert example data into Especies table
INSERT INTO Especies (nombre_especie, familia, en_extincion)
VALUES
    ('Tiger', 'Felidae', FALSE),
    ('Panda', 'Ursidae', TRUE),
    ('Blue Whale', 'Balaenopteridae', FALSE),
    ('Red Panda', 'Ursidae', TRUE),
    ('Giraffe', 'Giraffidae', FALSE),
    ('Komodo Dragon', 'Varanidae', TRUE),
    ('California Condor', 'Cathartidae', TRUE);

-- Insert example data into Ejemplares table
INSERT INTO Ejemplares (nombre_reserva, nombre_especie, cantidad_ejemplares)
VALUES
    ('Amazon Rainforest', 'Tiger', 100),
    ('Yellowstone National Park', 'Panda', 50),
    ('Great Barrier Reef', 'Blue Whale', 5),
    ('Yellowstone National Park', 'Red Panda', 10),
    ('Amazon Rainforest', 'Giraffe', 8),
    ('Yosemite National Park', 'Komodo Dragon', 3),
    ('Galápagos Islands', 'California Condor', 5),
    ('Kruger National Park', 'Giraffe', 15),
    ('Galápagos Islands', 'Galápagos Tortoise', 20),
    ('Great Barrier Reef', 'California Condor', 2);

-- Protected species in specific reservas
SELECT *
FROM Ejemplares ej INNER JOIN Especies es USING (nombre_especie)
WHERE es.en_extincion= TRUE;

-- Code verification
WITH especies_unicas
AS (
    SELECT *
    FROM Ejemplares ej INNER JOIN Especies es USING (nombre_especie)
    WHERE es.en_extincion= TRUE
        AND NOT EXISTS ( SELECT 1
                         FROM Ejemplares ej2 INNER JOIN Especies es2 USING (nombre_especie)
                         WHERE ej.nombre_reserva <> ej2.nombre_reserva
                            AND ej.nombre_especie = ej2.nombre_especie))
SELECT especies_unicas.nombre_reserva, COUNT(*) as criticidad
FROM especies_unicas
GROUP BY especies_unicas.nombre_reserva