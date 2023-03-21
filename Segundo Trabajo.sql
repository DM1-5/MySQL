/*1. Mostrar la información de todos los clientes.*/
SELECT * FROM Client;

/*2. Mostrar el nombre, el apellido, la fecha de nacimiento del empleado y la edad a la fecha (número de años).*/

SELECT fname AS Nombre, lname AS Apellido, DOB, TIMESTAMPDIFF(YEAR,DOB, NOW()) AS Edad
FROM Staff;

-- Se usa "TIMESTAPDIFF" para calcular la diferencia en la unidad dada entre dos fechas, la fecha actual se obtiene llamando a la funcion "NOW()"

/* 3. Mostrar el nombre y el apellido en minúsculas.*/

SELECT LOWER(fname) as Nombre, LOWER(lname) as Apellido
FROM Staff;

-- Se usa "LOWER()" o "LCASE()" para tener una string completamente en minuscula.

/*4. Mostrar el nombre y el apellido con las iniciales en mayúsculas.*/

SELECT CONCAT(UPPER(SUBSTRING(fname,1,1)),LOWER(SUBSTRING(fname, 2))) as Nombre, CONCAT(UPPER(SUBSTR(lname, 1,1)),LOWER(SUBSTRING(lname,2))) as Apellido
FROM Staff;

-- Concatenamos ("CONCAT()") una substring del desde el primer caracter hasta el primer caracter ("SUBSTRING(string, 1, 1)") y le aplicamos la funcion para convertirla en mayuscula ("UPPER()" o "UCASE()" ) con una substring desde el 2 caracter "SUBSTR(string, 2)" y le aplicamos la funcion (LOWER() o LCASE())

/*5. Listar los clientes quienes solo están interesados en apartamentos*/

SELECT *
FROM Client
WHERE (prefType = 'Flat');

/*6. Listar los clientes que pueden pagar más de 420 al mes.*/

SELECT * 
FROM Client
WHERE maxRent > 420;

/*7. Listar todos los empleados, además mostrar una nueva columna con el valor de cuanto se de debe pagar por el año.*/

SELECT *, salary * 12 AS Anual
FROM Staff;

/*8. Mostrar la información de todos los propietarios o dueños de propiedades pero que aparezcan los nombres de los campos en español.*/

SELECT ownerNo AS Codigo, fname AS Nombre, lname AS Apellido, address AS Direccion, telNo AS telefono 
FROM PrivateOwner;

/*9. Mostrar toda la información de los clientes, pero los nombres deben aparecer en un solo campo (concatenación).*/
SELECT CONCAT(fname,' ',lname) as Nombre, telNo as Telefono, prefType as Tipo, maxRent as Renta_Maxima
FROM Client;

/*10. Hacer los ejercicios de unión, diferencia, intersección de esta presentación.*/

/* 10.1 Mostrar todas las ciudades donde hay una sucursal (Branch) o una propiedad en alquiler. */

SELECT city 
FROM Branch 
UNION
SELECT city
FROM PropertyForRent;

/* 10.2 Listar todas las ciudades donde existen sucursales (Branch) pero que no están en las propiedades para la renta (PropertyForRent). */

SELECT city
FROM Branch
except
SELECT city
FROM PropertyForRent;

/* 10.3 Listar todas las ciudades donde hay una sucursal (Branch) y por lo menos una propiedad para renta. */

SELECT city
FROM Branch
intersect
SELECT city
FROM PropertyForRent;

-- Conclusiones 
-- las Operaciones "except" e "Intercept" Aunque no son autocompletadas por la aplicacion, se pueden utilizar 
-- Se usa "TIMESTAPDIFF" para calcular la diferencia en la unidad dada entre dos fechas, la fecha actual se obtiene llamando a la funcion "NOW()"
-- Se usa "LOWER()" o "LCASE()" para tener una string completamente en minuscula.
-- Concatenamos ("CONCAT()") una substring del desde el primer caracter hasta el primer caracter ("SUBSTRING(string, 1, 1)") y le aplicamos la funcion para convertirla en mayuscula ("UPPER()" o "UCASE()" ) con una substring desde el 2 caracter "SUBSTR(string, 2)" y le aplicamos la funcion (LOWER() o LCASE())
