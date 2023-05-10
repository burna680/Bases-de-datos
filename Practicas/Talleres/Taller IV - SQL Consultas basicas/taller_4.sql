-- Punto 1
SELECT * 
FROM notas
WHERE NOT (codigo=75 AND numero=1)

-- Punto 2
SELECT nombre, codigo || '.' || numero as materia 
FROM materias

-- Punto 3
SELECT padron, codigo, numero, fecha, nota * 10 as nota 
FROM notas

-- Punto 4
SELECT padron, codigo, numero, fecha, nota * 10 as nota 
FROM notas
ORDER BY padron, codigo, numero, fecha
OFFSET 5 FETCH FIRST 5 ROWS ONLY

-- Punto 4 (version 2)
SELECT padron, codigo, numero, fecha, nota * 10 as nota 
FROM notas
ORDER BY padron, codigo, numero, fecha
LIMIT 5 OFFSET 5

-- Punto 5
SELECT padron, nombre
FROM alumnos
WHERE apellido ILIKE 'molina'

-- Punto 6 
SELECT padron 
FROM alumnos 
WHERE EXTRACT(YEAR FROM fecha_ingreso)= 2010

-- Punto 7 
SELECT nota
FROM notas
WHERE codigo = 75 AND numero=15
ORDER BY nota DESC
FETCH FIRST 1 ROW ONLY


-- Punto 7 (version 2) 
SELECT MAX(nota)
FROM notas
WHERE codigo = 75 AND numero=15

-- Punto 8
SELECT ROUND(AVG(nota),3) as promedio
FROM notas
WHERE codigo = 75


-- Punto 9
SELECT ROUND(AVG(nota),3)
FROM notas
WHERE codigo = 75 AND nota >= 4

-- Punto 10
SELECT  COUNT(DISTINCT(padron)) as cant_alumno_con_nota
FROM notas

-- Punto 11
SELECT padron FROM alumnos EXCEPT (SELECT DISTINCT padron FROM notas)

-- Punto 12
SELECT nombre FROM materias 
UNION
SELECT nombre FROM departamentos

-- Punto 13
SELECT materias.nombre,departamentos.nombre 
FROM materias INNER JOIN departamentos ON materias.codigo=departamentos.codigo


-- Punto 14
SELECT alumnos.padron, alumnos.nombre, alumnos.apellido, materias.nombre
FROM notas 
INNER JOIN materias ON notas.codigo= materias.codigo AND notas.numero=materias.numero
INNER JOIN alumnos ON alumnos.padron=notas.padron
WHERE notas.nota = 10

-- Punto 15
SELECT carreras.nombre, alumnos.padron, alumnos.nombre, alumnos.apellido
FROM carreras
LEFT OUTER JOIN inscripto_en USING (codigo)
LEFT OUTER JOIN alumnos USING (padron)

-- Punto 16

SELECT carreras.nombre, alumnos.padron, alumnos.nombre, alumnos.apellido
FROM carreras
LEFT OUTER JOIN inscripto_en USING (codigo)
LEFT OUTER JOIN alumnos USING (padron)
WHERE alumnos.padron > 75000

-- Punto 17
SELECT notas.padron, notas.codigo, notas.numero
FROM notas
WHERE notas.codigo =75 AND notas.numero=15
GROUP BY notas.padron, notas.codigo, notas.numero
HAVING COUNT(notas.padron)>1


-- Punto 17 (version 2)
SELECT padron
FROM alumnos
WHERE (SELECT COUNT(notas.padron) 
	   FROM notas 
	   WHERE alumnos.padron= notas.padron AND notas.codigo =75 AND notas.numero=15)>1
-- Busco los padrones de los alumnos que tienen más de una nota 
-- Aquellos que cumplen el requisito de más de una nota tienen la condición dentro de 
-- la subconsulta en el WHERE
-- La subconsulta devuelve la cantidad de notas que hay en 75.15 para un determinado alumno. 

-- Punto 18 (version 1)
(SELECT alumnos.padron, alumnos.nombre, alumnos.apellido 
FROM notas INNER JOIN alumnos USING(padron)
EXCEPT (SELECT alumnos.padron, alumnos.nombre, alumnos.apellido 
FROM notas INNER JOIN alumnos USING(padron)
WHERE nota >= 4 AND codigo= 75 AND numero=15))
INTERSECT 
(SELECT alumnos.padron, alumnos.nombre, alumnos.apellido 
FROM notas INNER JOIN alumnos USING(padron)
WHERE nota >= 4 AND codigo= 71 AND numero=14)

-- Punto 19
SELECT *
FROM notas AS notas1 INNER JOIN(SELECT * FROM notas)as notas2 USING (fecha,codigo,numero)
WHERE notas1.padron <> notas2.padron AND notas1.padron < notas2.padron
ORDER BY fecha ASC, codigo ASC, numero ASC

-- la condición de menor aparece porque se está haciendo un INNER JOIN de una
-- tabla con sí misma. Como van a aparecer duplicados, agregamos una condición
-- para eliminar el caso del par de filas:{{padrón1=71000, padrón2=72000},{padrón1=72000, padrón2=71000} 

