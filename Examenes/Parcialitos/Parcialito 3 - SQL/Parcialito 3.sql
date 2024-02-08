-- Parcialito 3 - SQL 
-- Padron 99608, Burna Lucas 

-- Punto a 
WITH aprobadas 
AS (SELECT padron, apellido, nombre, COUNT(padron) AS n_aprobadas
	FROM notas 
	INNER JOIN alumnos USING (padron)
	WHERE nota>=4
	GROUP BY padron,apellido, nombre
	ORDER BY n_aprobadas DESC)
SELECT padron,apellido, nombre
FROM aprobadas
WHERE n_aprobadas = (SELECT MAX(n_aprobadas) FROM aprobadas)


-- Punto b
(SELECT padron,apellido
 	FROM notas 
	INNER JOIN alumnos USING(padron)
	WHERE (codigo = 71 AND numero=14)) -- Los que tienen nota en 71.14 
INTERSECT(	SELECT padron,apellido 
		 	FROM notas 
			INNER JOIN alumnos USING(padron)
			WHERE (codigo = 71 AND numero=15)) -- Los que tienen nota en 71.15
INTERSECT(	SELECT padron,apellido
		  	FROM notas -- Los que no tienen nota en 75.01 y 75.15
			RIGHT OUTER JOIN alumnos USING (padron)
			WHERE NOT((codigo =75 AND numero=15) OR (codigo=75 AND numero=01)))
ORDER BY padron

-- Punto c
SELECT DISTINCT carreras.codigo as carrera ,notas.codigo as departamento, AVG(nota) OVER (ORDER BY carreras.codigo,materias.codigo) AS promedios
FROM alumnos 
INNER JOIN inscripto_en USING(padron)
INNER JOIN carreras USING(codigo)
INNER JOIN notas USING (padron)
INNER JOIN materias ON(notas.codigo=materias.codigo AND notas.numero=materias.numero)
ORDER BY carreras.codigo, notas.codigo DESC;

-- Chequeo

SELECT carreras.codigo as carrera ,notas.codigo as departamento,notas.numero as materia, notas.padron, alumnos.apellido,alumnos.nombre,nota
FROM alumnos 
INNER JOIN inscripto_en USING(padron)
INNER JOIN carreras USING(codigo)
INNER JOIN notas USING (padron)
INNER JOIN materias ON(notas.codigo=materias.codigo AND notas.numero=materias.numero)
ORDER BY carreras.codigo, notas.codigo DESC, padron ASC;

-- Punto d
SELECT DISTINCT padron,apellido, AVG(nota) 
FROM alumnos
INNER JOIN notas USING (padron)
GROUP BY padron
HAVING (COUNT(nota)>3) AND (AVG(nota)>=5)

-- Punto e
SELECT DISTINCT padron,notas.codigo as departamento, notas.numero as materia, nota
FROM alumnos
INNER JOIN notas USING (padron)
GROUP BY fecha_ingreso, padron , departamento, materia, nota 
HAVING fecha_ingreso = (SELECT MIN(fecha_ingreso) FROM alumnos )

-- Punto f
WITH estudiante_71000
AS (SELECT notas.codigo, notas.numero, padron,nota
   FROM alumnos
   INNER JOIN notas USING (padron)
   WHERE padron= 71000 AND nota>=4)
SELECT notas.padron
FROM alumnos
INNER JOIN notas USING (padron)
INNER JOIN estudiante_71000 ON (estudiante_71000.codigo=notas.codigo AND estudiante_71000.numero=notas.numero)
WHERE alumnos.padron <> (SELECT DISTINCT padron FROM estudiante_71000)
GROUP BY notas.padron
HAVING COUNT(notas.nota)>=(SELECT COUNT(estudiante_71000.nota) FROM estudiante_71000)