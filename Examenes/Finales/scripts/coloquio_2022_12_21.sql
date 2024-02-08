-- Instala la extensión Faker si aún no lo has hecho
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Crea la función para generar DNI aleatorio
CREATE OR REPLACE FUNCTION generate_random_dni() RETURNS VARCHAR AS $$
BEGIN
  RETURN LPAD(FLOOR(random() * 1000000000)::INTEGER::VARCHAR, 9, '0');
END;
$$ LANGUAGE plpgsql;

CREATE TABLE Empleados (
    id_empleado SERIAL PRIMARY KEY,
    DNI VARCHAR(10) NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    ultimo_barrio VARCHAR(50),
    ultimo_dia_login DATE,
    calif INTEGER
);

CREATE TABLE Comercios (
    id_comercio SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    barrio VARCHAR(50) NOT NULL,
    calificacion INTEGER,
    tipo_contrato VARCHAR(50)
);


-- Crea la función para generar DNI aleatorio
CREATE OR REPLACE FUNCTION generate_random_dni() RETURNS VARCHAR AS $$
BEGIN
  RETURN LPAD(FLOOR(random() * 1000000000)::INTEGER::VARCHAR, 9, '0');
END;
$$ LANGUAGE plpgsql;

-- Genera datos ficticios para la tabla Empleados
INSERT INTO Empleados (DNI, nombre, ultimo_barrio, ultimo_dia_login, calif)
SELECT
  generate_random_dni(),
  'Empleado' || i,
  'Barrio' || (FLOOR(random() * 5) + 1),
  CURRENT_DATE - (random() * 365 * 5)::INTEGER,
  FLOOR(random() * 5) + 1
FROM generate_series(1, 100) AS i;

-- Genera datos ficticios para la tabla Comercios
INSERT INTO Comercios (nombre, direccion, barrio, calificacion, tipo_contrato)
SELECT
  'Comercio' || i,
  'Direccion' || i,
  'Barrio' || (FLOOR(random() * 5) + 1),
    FLOOR(random() * 10),
  CASE WHEN random() < 0.5 THEN 'Contrato1' ELSE 'Contrato2' END
FROM generate_series(1, 100) AS i;


-- Query a probar

SELECT DISTINCT c.barrio
FROM Comercios c
WHERE NOT EXISTS ( SELECT *
    FROM Comercios c2
    WHERE c.calificacion >7)