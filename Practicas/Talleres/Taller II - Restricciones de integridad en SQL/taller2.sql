DROP TABLE IF EXISTS matches;
DROP TABLE IF EXISTS teams;
 
CREATE TABLE teams(
	team VARCHAR(20) 	CONSTRAINT PK_teams PRIMARY KEY,
	players_used 		INT NOT NULL,
	avg_age 			FLOAT NOT NULL,
	possession 			FLOAT NOT NULL,
	games 				INT NOT NULL,
	goals 				INT NOT NULL,
	assists 			INT NOT NULL,
	cards_yellow 		INT NOT NULL,
	cards_red 			INT	NOT NULL
);

COPY teams
FROM 'G:\LUCAS\Facultad\Base de datos\Talleres\Datos\teams.csv'
DELIMITER ';'
CSV HEADER
ENCODING 'LATIN1';

CREATE TABLE matches(
	team1 VARCHAR(20)	CONSTRAINT FK_team1 REFERENCES teams(team) ON UPDATE CASCADE,
	team2 VARCHAR(20)	CONSTRAINT FK_team2 REFERENCES teams(team) ON UPDATE CASCADE,
	goals_team1			INT NOT NULL,
	goals_team2			INT NOT NULL,
	stage VARCHAR(30)	,
	CONSTRAINT PK_matches PRIMARY KEY(team1,team2,stage)
);



COPY matches
FROM 'G:\LUCAS\Facultad\Base de datos\Talleres\Datos\matches.csv'
DELIMITER ';'
CSV HEADER
ENCODING 'LATIN1';


-- Intentamos violar la restriccion de unicidad

INSERT INTO teams(
	team, players_used, avg_age, possession, games, goals, assists, cards_yellow, cards_red)
	VALUES ('ARGENTINA', 10, 1, 1, 7, 1, 1, 1, 1 );

--  Rta: 
--		ERROR:  llave duplicada viola restricción de unicidad «pk_teams»
-- 		DETAIL:  Ya existe la llave (team)=(ARGENTINA).

-- Intentamos violar la restriccion de integridad referencial, con INSERT

INSERT INTO matches(
	team1, team2, goals_team1, goals_team2, stage)
	VALUES ('ARGENTINA', 'ALBANIA', 3, 0, 'Semi-final');

--  Rta: 
--		ERROR:  inserción o actualización en la tabla «matches» viola la llave foránea «fk_team2»
--		DETAIL:  La llave (team2)=(ALBANIA) no está presente en la tabla «teams»

-- Intentamos violar la restriccion de integridad referencial definida, con DELETE

DELETE FROM teams
	WHERE team='ARGENTINA';
-- Rta: 
--		ERROR:  update o delete en «teams» viola la llave foránea «fk_team1» en la tabla «matches»
-- 		DETAIL:  La llave (team)=(ARGENTINA) todavía es referida desde la tabla «matches».


-- Intentamos actualizar un elemento que se referencia en otra  tabla

UPDATE teams
	SET team='ARG'
	WHERE team='ARGENTINA';
	
-- Rta1:
-- 		ERROR:  update o delete en «teams» viola la llave foránea «fk_team1» en la tabla «matches»
-- 		DETAIL:  La llave (team)=(ARGENTINA) todavía es referida desde la tabla «matches».
-- RTA2:
-- 		Cambiando la definición de la tabla, en la CONSTRAIN, se puede cambiar el elemento y los que referencia
