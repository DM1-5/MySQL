
/* 1. Listar los códigos del cliente, nombre, apellido, código de la propiedad, fecha de la visita y comentarios de todos los clientes quienes han visitado propiedades para la renta, ordenados de forma cronológica. */

SELECT c.clientNo AS Codigo_Cliente, c.fname AS Nombre, lname AS Apellido, propertyNo AS Codigo_Propiedad, v.viewDate AS Fecha, v.`comment` as Comentario
FROM Client c
NATURAL JOIN Viewing v
ORDER BY v.viewDate;

/*2. ¿Cuáles son las propiedades que se les recomienda a cada cliente basado en el máximo que pueden pagar? */

SELECT c.clientNo AS Codigo_Cliente, CONCAT(c.fname,' ',c.lname) as Nombre, c.maxRent AS Renta_Maxima, pfr.*
From Client c 
JOIN PropertyForRent pfr 
WHERE (c.prefType = pfr.type and c.maxRent > pfr.rent)
ORDER BY c.clientNo;

/*3. Mostrar los apellidos, nombres y códigos de identificación de todas las personas registradas en la base de datos Dreamhome. */

SELECT lname AS Apellido, fname AS Nombre, clientNo as Codigo_identificacion
FROM Client
ORDER BY lname;

/*4. Mostrar el nombre del cliente que no coloco comentarios, además muestre el código de la propiedad*/

SELECT CONCAT(c.fname,' ',c.lname) AS Nombre, v.propertyNo
FROM Client c
NATURAL JOIN Viewing v
WHERE `comment` is null;

/*5. Mostrar la información de todos los empleados junto a la propiedad que le fue asignada para rentar.*/

SELECT s.*, pfr.propertyNo
FROM Staff s
NATURAL JOIN PropertyForRent pfr
ORDER BY staffNo;

/*6. Listar todos los detalles del personal de la empresa quienes trabajan en la sucursal de Glasgow*/

SELECT s.* 
FROM Staff s 
WHERE (branchNo = 'B003');

SELECT s.* 
FROM Staff s
JOIN Branch b USING (branchNo)
where b.city = 'Glasgow';

SELECT s.* 
FROM Staff s
NATURAL JOIN Branch b 
where b.city = 'Glasgow';

/*7. Listar las propiedades ubicadas en Glasgow o London.*/

SELECT * 
FROM Branch 
WHERE (city = 'Glasgow' or city = 'London')
ORDER BY branchNo;

/*8. Mostrar la sucursal, la dirección de la sucursal, la ciudad de la sucursal, los nombres del personal asociado a cada sucursal, además de las direcciones y ciudades de las propiedades para rentar.*/

SELECT b.branchNo AS codigo_sucursal, b.city AS ciudad_sucursal, b.street AS calle_sucursal,  s.fname AS Nombre, s.lname AS Apellido, pfr.propertyNo AS Codigo_propiedad, pfr.city AS Ciudad_propiedad, pfr.street AS Calle_propiedad
FROM Branch b 
JOIN Staff s USING (branchNo)
JOIN PropertyForRent pfr USING(staffNo)
ORDER BY b.branchNo;

-- Conclusiones 
-- INNER JOIN y JOIN son las mismas operaciones 
-- FULL OUTER JOIN no esta implementado en MySQL por lo tanto tampoco está implementado en Mariadb
-- NATURAL JOIN es como usar un JOIN sin agregar el campo a comparar

SELECT * 
FROM Client
INNER JOIN Viewing USING (clientNo);

SELECT * 
FROM Client
JOIN Viewing USING (clientNo);

SELECT * 
FROM Client
NATURAL JOIN Viewing;

SELECT * 
FROM Client c
LEFT JOIN Viewing v on (c.clientNo = v.clientNo);

SELECT * 
FROM Client c
RIGHT JOIN Viewing v on (c.clientNo = v.clientNo);