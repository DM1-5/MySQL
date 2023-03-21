/*1. Usando el comando DISTINCT (consultar por internet como funciona) mostrar solo la lista de propiedades que han sido visitadas.*/

SELECT DISTINCT propertyNo AS Propiedad
FROM Viewing;

/*2. ¿Cuáles son las personas con el sueldo más alto y el más bajo?*/

SELECT * 
FROM Staff
WHERE salary = (
SELECT MIN(salary)
FROM Staff)
UNION
SELECT * 
FROM Staff
WHERE salary = (
SELECT MAX(salary)
FROM Staff)
GROUP BY salary;

/*3. ¿Cuanto se debe pagar laboralmente por cada sucursal?*/
SELECT branchNo,SUM(salary) AS Salario_Por_Sucursal
FROM Staff 
GROUP BY branchNo;

/*4. ¿Cuál es el máximo, mínimo y el promedio del salario de los empleados?*/
SELECT MIN(salary) AS Minimo, AVG(salary) AS Media,MAX(salary) AS Maximo
FROM Staff;

/*5. Mostrar por cada sucursal, por cada cargo y por el sexo, el número de personas y el pago total del salario.*/

SELECT branchNo, position, sex, SUM(salary), COUNT(1)
FROM Staff
GROUP BY branchNo, position, sex;

/*6. Cuál es el cliente que más ha visitado propiedades para alquiler?*/

SELECT clientNo, COUNT(*) AS Cantidad_visitas
FROM Viewing 
NATURAL JOIN Client 
GROUP BY clientNo
HAVING Cantidad_visitas = (
	SELECT COUNT(*) AS Cantidad_maxima
	FROM Viewing
	GROUP BY clientNo
	ORDER BY Cantidad_maxima DESC
	LIMIT 1
);
/*7. ¿Cuál es la ubicación y la propiedad más visita para arrendar?*/

SELECT pfr.propertyNo, pfr.street, pfr.city, pfr.postcode, COUNT(*) AS Vistas
FROM PropertyForRent pfr
NATURAL JOIN Viewing
GROUP BY propertyNo
HAVING Vistas = (
	SELECT COUNT(*) as Veces
	FROM Viewing
	GROUP BY propertyNo
	ORDER BY Veces DESC
	LIMIT 1
);

/*8. ¿Cuál es la persona que más propiedades tiene a su cargo para alquilar?*/

SELECT s.*, COUNT(*) AS Propiedades
FROM PropertyForRent pfr
NATURAL JOIN Staff s
GROUP BY staffNo
HAVING Propiedades = (
	SELECT COUNT(*) AS Propiedades
	FROM PropertyForRent
	GROUP BY staffNo
	ORDER BY Propiedades DESC
	LIMIT 1
);

/*9. ¿Cuál es el propietario que más propiedades tiene para arrendar y cuáles son esas propiedades? */

SELECT * 
FROM PropertyForRent
JOIN (
SELECT ownerNo, COUNT(*) AS Propiedades 
FROM PropertyForRent
GROUP BY ownerNo
HAVING Propiedades = (
	SELECT COUNT(*) AS Propiedades 
	FROM PropertyForRent
	GROUP BY ownerNo
	ORDER BY Propiedades DESC
	LIMIT 1
) ) tabla USING (ownerNo)
ORDER BY ownerNo

/*10. Realizar y analizar todas las consultas del capítulo 5 y 6 para reforzar los conocimientos. */

