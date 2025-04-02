-- Adrián Risco Sánchez

--Consulta 1
SELECT nombre
FROM visita 
	INNER JOIN jesuita
		ON jesuita.idJesuita=visita.idJesuita;
		
-- Consulta 2
SELECT nombre,lugar
FROM visita 
	INNER JOIN jesuita
		ON jesuita.idJesuita=visita.idJesuita
	INNER JOIN lugar
		ON lugar.ip=visita.ip;

-- Consulta 3
INSERT INTO jesuita(codigo,nombre,nombreAlumno,firma,firmaIngles) VALUES ('4rfv','San Juan Carlos','Juan Carlos','JCJCJC','JCJCJC');

-- Consulta 4
INSERT INTO lugar(ip,nombre_maquina,lugar) VALUES ('80.23.69.57.3','1daw03','Madrid');
INSERT INTO lugar(ip,nombre_maquina,lugar) VALUES ('80.23.69.57.4','1daw04','Saratov');

-- Consulta 5
	-- LEFT
SELECT nombre,lugar,firma,firmaIngles
FROM jesuita 
	LEFT JOIN visita
		ON jesuita.idJesuita=visita.idJesuita
	LEFT JOIN lugar
		ON lugar.ip=visita.ip;

	-- RIGHT
SELECT nombre,lugar,firma,firmaIngles
FROM jesuita 
	RIGHT JOIN visita
		ON jesuita.idJesuita=visita.idJesuita
	RIGHT JOIN lugar
		ON lugar.ip=visita.ip;

-- Consulta 6
SELECT nombre,lugar,firma,firmaIngles,nombre_maquina,lugar.ip
FROM lugar 
	LEFT JOIN visita
		ON lugar.ip=visita.ip
	LEFT JOIN jesuita
		ON jesuita.idJesuita=visita.idJesuita;

-- Consulta 7
SELECT nombre,lugar,firma,firmaIngles,nombre_maquina,lugar.ip
FROM lugar 
	LEFT JOIN visita
		ON lugar.ip=visita.ip
	LEFT JOIN jesuita
		ON jesuita.idJesuita=visita.idJesuita
WHERE idJesuita IS NULL;

-- Consulta 8
SELECT nombre,lugar,firma,firmaIngles,nombre_maquina,lugar.ip
FROM jesuita 
	LEFT JOIN visita
		ON jesuita.idJesuita=visita.idJesuita
	LEFT JOIN lugar
		ON lugar.ip=visita.ip
UNION
SELECT nombre,lugar,firma,firmaIngles,nombre_maquina,lugar.ip
FROM lugar 
	RIGHT JOIN visita
		ON lugar.ip=visita.ip
	RIGHT JOIN jesuita
		ON jesuita.idJesuita=visita.idJesuita;
		
-- Consulta 9
SELECT DISTINCT nombre
FROM visita 
	INNER JOIN jesuita
		ON jesuita.idJesuita=visita.idJesuita;

-- Consulta 10
SELECT DISTINCT lugar
FROM visita
	INNER JOIN lugar
		ON lugar.ip=visita.ip;

-- Consultas Extra

-- Consulta 1
SELECT nombre FROM jesuita
WHERE nombre LIKE 'San%';

-- Consulta 2
SELECT ip FROM lugar
WHERE ip LIKE '%0';

-- Consulta 3
SELECT nombre
FROM visita 
	INNER JOIN jesuita
		ON jesuita.idJesuita=visita.idJesuita
WHERE nombre LIKE '%n';

-- Consulta 4
SELECT nombre,visita.ip
FROM jesuita 
	INNER JOIN visita
		ON jesuita.idJesuita=visita.idJesuita
	INNER JOIN lugar
		ON lugar.ip=visita.ip
WHERE nombre LIKE '%n' OR visita.ip LIKE '%1';
