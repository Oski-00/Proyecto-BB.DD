/* 2. Muestra los nombres de todas las películas con una clasificación por
edades de ‘R’.*/

SELECT "title", "rating" AS "Calificación por edades"
FROM "film"
WHERE "rating" = 'R';

/* 3. Encuentra los nombres de los actores que tengan un “actor_id” entre 30
y 40.*/

SELECT "actor_id", concat("first_name", ' ',"last_name") AS "nombre_completo"
FROM "actor"
WHERE "actor_id" BETWEEN 30 AND 40;

/* 4. Obtén las películas cuyo idioma coincide con el idioma original.*/

SELECT "f".FILM_ID , "f".LANGUAGE_ID, "f".ORIGINAL_LANGUAGE_ID, "l".LANGUAGE_ID , "l"."name"
FROM "film" AS f
LEFT JOIN "language" AS l 
ON "f".LANGUAGE_ID = "l".LANGUAGE_ID;
/*la columna de lenguaje original tiene todos los valores nulos, por lo que NO puedo diferenciar películas que cumplan el criterio
que me indican, en este caso saldría todas porque puedo sólo puedo relacionarlas por la columna langauge_id, y todas tienen  asignado
el 1, por lo que serían todas en Inglés. Observando el modelo, veo que hay dos relaciones entre las tablas "film" y "language" puede que, aunque una está inactiva, 
se esté generando un error. Lo otro que veo es que el tipo de dato de la columna "original_Language_id" es de tipo numérico, por lo que entiendo que hay dos opciones: 
1- El tipo de dato es erróneo y debería ser de texto para indicar el nombre de la lengua original y poder relacionarlo con "langauge_id"
2- El tipo de dato es correcto, tiene que ser un número porque la columna indica que es un "id", por lo que, entonces, nos faltaría otra columna en 
donde nos indicara a qué corresponde ese "id"*/

/* 5. Ordena las películas por duración de forma ascendente.*/

SELECT "film_id", "title", "length"
FROM "film" AS "peliculas"
ORDER BY "length" ASC;

/* 6. Encuentra el nombre y apellido de los actores que tengan ‘Allen’ en su
apellido.*/

SELECT "actor_id", concat("first_name",' ', "last_name") as "nombre_completo"
FROM "actor"
where "last_name" like 'ALLEN';
-- En minúscula no encuentra ninguno -- 

/* 7. Encuentra la cantidad total de películas en cada clasificación de la tabla
“film” y muestra la clasificación junto con el recuento.*/


SELECT COUNT("film_id") AS "total_peliculas", "rating"
from "film"
GROUP BY "rating";

/* 8. Encuentra el título de todas las películas que son ‘PG-13’ o tienen una
duración mayor a 3 horas en la tabla film.*/

SELECT "title","rating", "length"
FROM "film"
WHERE "rating" = 'PG-13' OR "length" > 180;

/* 9. Encuentra la variabilidad de lo que costaría reemplazar las películas.*/

SELECT variance("replacement_cost") AS "Coste_reemplazamiento"
FROM "film";

/*10. Encuentra la mayor y menor duración de una película de nuestra BBDD.*/

SELECT MAX("length")
FROM "film";

SELECT MIN("length")
FROM "film";

/*11. Encuentra lo que costó el antepenúltimo alquiler ordenado por día.*/

SELECT "p".RENTAL_ID , "p".AMOUNT AS "coste_alquiler", "r".RENTAL_DATE
FROM PAYMENT P 
LEFT JOIN RENTAL R 
ON P.RENTAL_ID = R.RENTAL_ID 
ORDER BY "rental_date" DESC
LIMIT 3;

/*12. Encuentra el título de las películas en la tabla “film” que no sean ni ‘NC-
17’ ni ‘G’ en cuanto a su clasificación.*/

SELECT "title","rating"
FROM "film"
WHERE "rating" NOT IN ('NC-17', 'G');

/*13. Encuentra el promedio de duración de las películas para cada
clasificación de la tabla film y muestra la clasificación junto con el
promedio de duración.*/

SELECT ROUND(AVG("length"),2) AS "promedio_duración", "rating"
FROM "film"
GROUP BY "rating";

/*14. Encuentra el título de todas las películas que tengan una duración mayor
a 180 minutos.*/

SELECT "title", "length"
FROM "film"
WHERE "length" > '180';

/*15. ¿Cuánto dinero ha generado en total la empresa?*/

SELECT SUM("amount") AS "total_ventas"
FROM "payment";

/*16. Muestra los 10 clientes con mayor valor de id.*/

SELECT "customer_id", concat ("first_name", ' ', "last_name") AS "nombre cliente"
from"customer"
ORDER BY "customer_id" DESC
LIMIT 10;

/*17. Encuentra el nombre y apellido de los actores que aparecen en la
película con título ‘Egg Igby’.*/

SELECT "title", "film_id"
FROM "film"
WHERE "title" = 'EGG IGBY';
-- Primero busco el id de la película --

SELECT CONCAT("first_name", ' ', "last_name") AS "nombre_actor", "film_id"
FROM ACTOR A 
LEFT JOIN FILM_ACTOR FA 
ON FA.ACTOR_ID = A.ACTOR_ID
WHERE "film_id" = '274';

/*18. Selecciona todos los nombres de las películas únicos.*/

SELECT DISTINCT ("title") AS "nombres_únicos"
FROM "film";

/*19. Encuentra el título de las películas que son comedias y tienen una
duración mayor a 180 minutos en la tabla “film”.*/

SELECT *
FROM "film_category"
WHERE "category_id" = 5;
-- Primero busco que id representa la categoría comedia -- 

SELECT "title", "length" AS "duración"
FROM "film" AS p
WHERE EXISTS 
		(SELECT 1
		FROM "film_category" AS f
		JOIN "category" AS c
		ON f.CATEGORY_ID = c.CATEGORY_ID 
		WHERE f.FILM_ID = p.FILM_ID 
		AND c.CATEGORY_ID = '5')
AND "length" > '180';

/*20. Encuentra las categorías de películas que tienen un promedio de
duración superior a 110 minutos y muestra el nombre de la categoría
junto con el promedio de duración.*/

WITH "promedio" AS
		(SELECT  fc.CATEGORY_ID , AVG(f.LENGTH) AS "duración_promedio"
		FROM "film" AS f
		LEFT JOIN "film_category" AS fc
		ON f.FILM_ID = fc.FILM_ID
		GROUP BY fc.CATEGORY_ID) 
SELECT "name" AS "nombre categoria", "duración_promedio"
FROM "promedio"
LEFT JOIN "category" AS c 
ON "promedio"."category_id" = c.CATEGORY_ID
WHERE "duración_promedio" > '110'
GROUP BY c."name" , "duración_promedio";

/*21. ¿Cuál es la media de duración del alquiler de las películas?*/

SELECT AVG("rental_duration") AS "media_duración_alquiler"
FROM "film";

/*22. Crea una columna con el nombre y apellidos de todos los actores y
actrices.*/

SELECT concat("first_name", ' ', "last_name") AS "nombre y apellidos"
FROM "actor";

/*23. Números de alquiler por día, ordenados por cantidad de alquiler de
forma descendente.*/

SELECT "rental_date", COUNT(*) AS "total_alquiler"
FROM "rental"
GROUP BY "rental_date" 
ORDER BY "total_alquiler" DESC;

/*24. Encuentra las películas con una duración superior al promedio.*/

WITH "duración_promedio" AS 
		(SELECT AVG("length") AS "promedio"
		 FROM "film")
SELECT "title", "length"
FROM "film"
WHERE "length" > (
		SELECT "promedio"
		FROM "duración_promedio")
ORDER BY "title";

/*25. Averigua el número de alquileres registrados por mes.*/

SELECT count(*) AS "num_alquileres", EXTRACT (MONTH FROM "rental_date") AS "mes"
FROM "rental"
GROUP BY "mes"
ORDER BY "mes";

/*26. Encuentra el promedio, la desviación estándar y varianza del total
pagado.*/

-- El promedio --
SELECT AVG("amount") AS "promedio"
FROM "payment";

-- La desviación Estándar --	
	
SELECT STDDEV("amount") AS "desviación"
FROM "payment";

-- Varianza --

SELECT VARIANCE("amount")
FROM "payment";

/*27. ¿Qué películas se alquilan por encima del precio medio?*/

SELECT "title", "rental_rate"
FROM "film"
WHERE "rental_rate" >
		(SELECT AVG("rental_rate")
		FROM "film");

/*28. Muestra el id de los actores que hayan participado en más de 40
películas.*/

SELECT "actor_id", "film_id"
FROM "film_actor"
GROUP BY "film_actor".FILM_ID, "film_actor"."actor_id"
HAVING COUNT("film_actor"."actor_id") > 40;

/*29. Obtener todas las películas y, si están disponibles en el inventario,
mostrar la cantidad disponible.*/

SELECT "film_id", "title"
FROM "film"
WHERE EXISTS (
		SELECT 1
		FROM "inventory"
		WHERE "film"."film_id" = "inventory"."film_id"
		AND "inventory_id" <> 0);

/*30. Obtener los actores y el número de películas en las que ha actuado.*/
		
SELECT concat("first_name" , ' ', "last_name") AS "nombre_actor", COUNT("film_id") AS nº_películas
FROM "film_actor"
LEFT JOIN "actor"
ON "film_actor"."actor_id" = "actor"."actor_id"
GROUP BY "nombre_actor";

/*31. Obtener todas las películas y mostrar los actores que han actuado en
ellas, incluso si algunas películas no tienen actores asociados.*/

WITH "peliculas" AS
		(SELECT f.TITLE, f.FILM_ID, fa.ACTOR_ID
		 FROM "film" AS f
		 LEFT JOIN  FILM_ACTOR AS fa
		 ON fa.FILM_ID = f.FILM_ID)
SELECT  "peliculas".film_id, "peliculas".TITLE, 
		concat("first_name", ' ', "last_name") AS "nombre_actor"
FROM "actor"
LEFT JOIN "peliculas" 
ON "actor".ACTOR_ID = "peliculas".ACTOR_ID
ORDER BY FILM_ID ;	 

/*32. Obtener todos los actores y mostrar las películas en las que han
actuado, incluso si algunos actores no han actuado en ninguna película.*/

WITH "actores" AS
		(SELECT a.ACTOR_ID, fa.FILM_ID, concat(a."first_name", ' ', a."last_name") AS "nombre_actor"
		FROM "actor" AS a
		LEFT JOIN "film_actor" AS fa
		ON a.ACTOR_ID = fa.ACTOR_ID)
SELECT "actores".NOMBRE_ACTOR, "film"."film_id", "film"."title"
FROM "film" 
LEFT JOIN "actores" 
ON "film"."film_id" = "actores"."film_id";

/*33. Obtener todas las películas que tenemos y todos los registros de
alquiler.*/

WITH "t_peliculas" AS
		(SELECT f.TITLE, f.FILM_ID, i.INVENTORY_ID
		 FROM "film" AS f
		 LEFT JOIN "inventory" AS i
		 ON f.FILM_ID = i.FILM_ID)
SELECT "t_peliculas"."film_id", COUNT("rental"."rental_id") AS "registros_alquiler"
		, "t_peliculas"."title"
FROM "rental"
LEFT JOIN "t_peliculas" 
ON "rental"."inventory_id" = "t_peliculas"."inventory_id"
GROUP BY "t_peliculas"."film_id", "t_peliculas"."title"
ORDER BY "t_peliculas"."film_id" ASC ;

/*34. Encuentra los 5 clientes que más dinero se hayan gastado con nosotros.*/

SELECT "customer_id",COUNT("amount") AS "total_gasto_cliente"
FROM "payment"
GROUP BY "customer_id"
ORDER BY "total_gasto_cliente" DESC 
LIMIT 5;

35. Selecciona todos los actores cuyo primer nombre es 'Johnny'.

SELECT "actor_id", "first_name"
FROM "actor"
WHERE "first_name" = 'JOHNNY';
-- En minúsculas no hya ninguno --

/*36. Renombra la columna “first_name” como Nombre y “last_name” como
Apellido.*/

SELECT "first_name" AS "nombre", "last_name" AS "apellido"
FROM "actor";

/*37. Encuentra el ID del actor más bajo y más alto en la tabla actor.*/

SELECT MIN("actor_id")
FROM "actor";

SELECT MAX(actor_id)
FROM "actor";

/*38. Cuenta cuántos actores hay en la tabla “actor”.*/

SELECT COUNT("first_name" IS NOT NULL) AS "total_actores"
FROM "actor";

/*39. Selecciona todos los actores y ordénalos por apellido en orden
ascendente.*/

SELECT "first_name" AS "nombre", "last_name" AS "apellido"
FROM "actor"
ORDER BY "apellido" ASC;

/*40. Selecciona las primeras 5 películas de la tabla “film”.*/

SELECT "film_id", "title"
FROM "film"
LIMIT 5;

/*41. Agrupa los actores por su nombre y cuenta cuántos actores tienen el
mismo nombre. ¿Cuál es el nombre más repetido?*/

SELECT COUNT("actor_id") AS "repetidos", "first_name" AS "nombre"
FROM "actor"
GROUP BY "nombre"
ORDER BY "repetidos" DESC;
-- Los nombres más repetidos son Kenneth, Penelope y Julia --

/*42. Encuentra todos los alquileres y los nombres de los clientes que los
realizaron.*/

SELECT c.FIRST_NAME AS "nombre",c.LAST_NAME AS "apellido", r.RENTAL_ID
FROM "customer" AS c
LEFT JOIN "rental" AS r
ON c.CUSTOMER_ID = r.CUSTOMER_ID;

/* 43. Muestra todos los clientes y sus alquileres si existen, incluyendo
aquellos que no tienen alquileres.*/

SELECT concat(c.FIRST_NAME, ' ', c.LAST_NAME) AS "nombre_cliente", COUNT(*) AS "alquileres"
FROM "customer" AS c
LEFT JOIN "rental" AS r
ON r.CUSTOMER_ID = c.CUSTOMER_ID
GROUP BY "nombre_cliente";

/*44. Realiza un CROSS JOIN entre las tablas film y category. ¿Aporta valor
esta consulta? ¿Por qué? Deja después de la consulta la contestación.*/

SELECT  *
FROM "film" AS f
CROSS JOIN "category" AS c;

/* NO aporta valor esta consulta ya que lo único que estamos haciendo es repetir los datos de las películas tantas veces como
categorías haya, pero sin añadir ningún dato concluyente.*/

/*45. Encuentra los actores que han participado en películas de la categoría
'Action'.*/

WITH "P_acción" AS 
	(SELECT "categoría_acción"."film_id", "peliculas_Acción", fa.ACTOR_ID
	FROM 
		(SELECT fc.FILM_ID,c."name" AS "peliculas_Acción"
		FROM "category" AS c
		RIGHT JOIN "film_category" AS fc
		ON c."category_id" = fc."category_id"
		WHERE c."name" = 'Action') AS "categoría_acción"
	RIGHT JOIN "film_actor" AS fa
	ON "categoría_acción"."film_id" = fa."film_id")
SELECT concat(a.FIRST_NAME, ' ', a.LAST_NAME) AS "Nombre_actor", "peliculas_Acción"
FROM "actor" AS a
LEFT JOIN "P_acción" 
ON "P_acción"."actor_id" = a."actor_id"
WHERE "peliculas_Acción" = 'Action';

/*46. Encuentra todos los actores que no han participado en películas.*/


SELECT concat("first_name", ' ', "last_name") AS "nombre_actor", "actor_id"
FROM "actor"
WHERE NOT EXISTS 
	(SELECT *
	FROM "film_actor"
	WHERE "actor"."actor_id" = "film_actor"."actor_id");

/*47. Selecciona el nombre de los actores y la cantidad de películas en las
que han participado.*/

SELECT concat(a.FIRST_NAME, ' ', a.LAST_NAME) AS "nombre_actor", COUNT(fa.FILM_ID) AS "total_peliculas"
FROM "actor" AS a
LEFT JOIN "film_actor" AS fa
ON a."actor_id" = fa."actor_id"
GROUP BY "nombre_actor"
ORDER BY "total_peliculas" DESC;

/*48. Crea una vista llamada “actor_num_peliculas” que muestre los nombres
de los actores y el número de películas en las que han participado.*/

CREATE VIEW "actor_num_peliculas" AS 
(SELECT concat(a.FIRST_NAME, ' ', a.LAST_NAME) AS "nombre_actor", COUNT(fa.FILM_ID) AS "total_peliculas"
FROM "actor" AS a
LEFT JOIN "film_actor" AS fa
ON a."actor_id" = fa."actor_id"
GROUP BY "nombre_actor"
ORDER BY "total_peliculas" DESC);

/*49. Calcula el número total de alquileres realizados por cada cliente.*/

SELECT concat(c."first_name", ' ',c."last_name") AS "nombre_cliente", count(r."rental_id") AS "total_alquileres"
FROM "customer" AS c
LEFT JOIN "rental" AS r
ON c."customer_id" = r."customer_id"
GROUP BY "nombre_cliente";

/*50. Calcula la duración total de las películas en la categoría 'Action'.*/

WITH "cat_acción" AS 
	(SELECT fc.FILM_ID,c."name" AS "peliculas_Acción"
		FROM "category" AS c
		RIGHT JOIN "film_category" AS fc
		ON c."category_id" = fc."category_id"
		WHERE c."name" = 'Action') 
SELECT "peliculas_Acción", SUM("length") AS "duración_total"
FROM "film"
LEFT JOIN "cat_acción"
ON "cat_acción"."film_id" = "film"."film_id"
WHERE "peliculas_Acción" = 'Action'
GROUP BY "peliculas_Acción";

/*51. Crea una tabla temporal llamada “cliente_rentas_temporal” para
almacenar el total de alquileres por cliente.*/

CREATE TEMPORARY TABLE "cliente_rentas_temporal" AS 
	(SELECT concat(c."first_name", ' ',c."last_name") AS "nombre_cliente", count(r."rental_id") AS "total_alquileres"
	FROM "customer" AS c
	LEFT JOIN "rental" AS r
	ON c."customer_id" = r."customer_id"
	GROUP BY "nombre_cliente");

/*52. Crea una tabla temporal llamada “peliculas_alquiladas” que almacene las
películas que han sido alquiladas al menos 10 veces.*/

CREATE TEMPORARY TABLE "peliculas_alquiladas" as
	(SELECT i."film_id" AS "mas_de_10_alquileres"
	FROM "rental" AS r
	RIGHT JOIN "inventory" AS i
	ON r."inventory_id" = i."inventory_id"
	GROUP BY i."film_id"
	HAVING count(i."film_id")>=10);

/*53. Encuentra el título de las películas que han sido alquiladas por el cliente
con el nombre ‘Tammy Sanders’ y que aún no se han devuelto. Ordena
los resultados alfabéticamente por título de película.*/

WITH "alquileres_Tammy" AS 
	(SELECT r."return_date", concat(c.first_name, ' ', c."last_name") AS "nombre_cliente", i."film_id"
	FROM "customer" AS c
	JOIN "rental" AS r
	ON r."customer_id" = c."customer_id"
	JOIN "inventory" AS i
	ON r."inventory_id" = i."inventory_id"
	WHERE c."first_name" = 'TAMMY' 
	AND r."return_date" IS NULL)
SELECT f."film_id", f."title", al."return_date"
FROM "alquileres_Tammy" AS al 
LEFT JOIN "film" AS f
ON al."film_id" = f."film_id"
WHERE f."film_id" IN (542,914,806);
 
/*54. Encuentra los nombres de los actores que han actuado en al menos una
película que pertenece a la categoría ‘Sci-Fi’. Ordena los resultados
alfabéticamente por apellido.*/

WITH "peliculas_Sci-Fi" as
	(SELECT f."title", c."name", fa."actor_id"
	FROM "film" AS f
	JOIN "film_category" AS fc
	ON f."film_id" = fc."film_id"
	JOIN "category" AS c
	ON fc."category_id" = c."category_id"
	JOIN "film_actor" as fa
	ON f."film_id" = fa."film_id")
SELECT a."first_name", a."last_name", ps."name" AS "categoria"
FROM "peliculas_Sci-Fi" AS ps
RIGHT JOIN "actor" AS a
ON ps."actor_id" = a."actor_id"
WHERE ps."name" = 'Sci-Fi'
ORDER BY a."last_name" ASC;

/*55. Encuentra el nombre y apellido de los actores que han actuado en
películas que se alquilaron después de que la película ‘Spartacus
Cheaper’ se alquilara por primera vez. Ordena los resultados
alfabéticamente por apellido.*/

WITH "pelicula_Spartacus" AS 
	(SELECT a."first_name" , a."last_name", f."title",f."film_id", i."inventory_id"
	FROM "film" AS f
	JOIN "film_actor" as fa
	ON fa."film_id" = f."film_id"
	JOIN "actor" AS a
	ON fa."actor_id" = a."actor_id"
	JOIN "inventory" AS i 
	ON i."film_id" = f."film_id"
	WHERE f."title" = 'SPARTACUS CHEAPER')
SELECT "pelicula_Spartacus"."first_name", "pelicula_Spartacus"."last_name", r."rental_date"
FROM "pelicula_Spartacus"
LEFT JOIN "rental" AS r
ON r."inventory_id" = "pelicula_Spartacus"."inventory_id"
WHERE  r."rental_date" > '2005-07-27'
ORDER BY "pelicula_Spartacus"."last_name" ASC;	

/*56. Encuentra el nombre y apellido de los actores que no han actuado en
ninguna película de la categoría ‘Music’.*/

WITH "peliculas_Music" as
	(SELECT f."title", c."name", fa."actor_id"
	FROM "film" AS f
	JOIN "film_category" AS fc
	ON f."film_id" = fc."film_id"
	JOIN "category" AS c
	ON fc."category_id" = c."category_id"
	JOIN "film_actor" as fa
	ON f."film_id" = fa."film_id"
	WHERE c."name" = 'Music')
SELECT a."first_name", a."last_name"
FROM "peliculas_Music" AS pm
RIGHT JOIN "actor" AS a
ON pm."actor_id" = a."actor_id" 
WHERE pm."name" IS NULL;

/*57. Encuentra el título de todas las películas que fueron alquiladas por más
de 8 días.*/

WITH "título" AS 
	(SELECT f."title", i."inventory_id"
	FROM "film" AS f 
	JOIN "inventory" AS i
	ON i."film_id" = f."film_id")
SELECT t."title", age("return_date", "rental_date") AS "duración_alquiler"
FROM "título" AS t
JOIN "rental" AS r
ON r."inventory_id" = t."inventory_id"
WHERE age("return_date", "rental_date") >= '9 days';

/*58. Encuentra el título de todas las películas que son de la misma categoría
que ‘Animation’.*/

SELECT f."title", c."name", f."film_id"
FROM "film" AS f
JOIN "film_category" AS fc
ON fc."film_id" = f."film_id"
JOIN "category" AS c
ON c."category_id" = fc."category_id"
WHERE c."name" = 'Animation';

/*59. Encuentra los nombres de las películas que tienen la misma duración
que la película con el título ‘Dancing Fever’. Ordena los resultados
alfabéticamente por título de película.*/

SELECT "title", "length"
FROM "film"
WHERE "length" = 144
ORDER BY "title" ASC; 

/*60. Encuentra los nombres de los clientes que han alquilado al menos 7
películas distintas. Ordena los resultados alfabéticamente por apellido.*/

SELECT concat(c."first_name",' ', c."last_name") AS "cliente", COUNT(*) AS "total_alquileres"
FROM "inventory" AS i
JOIN "rental" AS r
ON r."inventory_id" = i."inventory_id"
JOIN "customer" AS c
ON c."customer_id" = r."customer_id"
GROUP BY  c."first_name", c."last_name"
HAVING COUNT(*) >= 7
ORDER BY c."last_name";

/*61. Encuentra la cantidad total de películas alquiladas por categoría y
muestra el nombre de la categoría junto con el recuento de alquileres.*/

WITH "peliculas_alquiladas" AS 
	(SELECT f."film_id", r."rental_id",f."title", fc."category_id"
	FROM "rental" AS r
	JOIN "inventory" AS i
	ON i."inventory_id" = r."inventory_id"
	JOIN "film" AS f
	ON f."film_id" = i."film_id"
	JOIN "film_category" AS fc
	ON fc."film_id" = f."film_id")
SELECT pa."title", c."name" AS "categoria", COUNT(*) AS "total alquileres"
FROM "peliculas_alquiladas" AS pa
LEFT JOIN "category" AS c
ON c."category_id" = pa."category_id"
GROUP BY pa."title", c."name";


/*62. Encuentra el número de películas por categoría estrenadas en 2006.*/

SELECT f."release_year", count(f."film_id") AS "estrenos", c."name"
FROM "film" AS f
JOIN "film_category" AS fc
ON fc."film_id" = f."film_id"
JOIN "category" AS c
ON c."category_id" = fc."category_id"
WHERE f."release_year" = 2006
GROUP BY  c."name", f."release_year";

/*63. Obtén todas las combinaciones posibles de trabajadores con las tiendas
que tenemos.*/


SELECT s."staff_id", concat(s."first_name", ' ', s."last_name") AS "nombre_empleado", st."store_id"
FROM "staff" AS s
CROSS JOIN "store" AS st;

/*64. Encuentra la cantidad total de películas alquiladas por cada cliente y
muestra el ID del cliente, su nombre y apellido junto con la cantidad de
películas alquiladas.*/

WITH "peliculas_cliente" AS 
	(SELECT f."film_id", r."rental_id", f."title", r."customer_id"
	FROM "rental" AS r
	JOIN "inventory" AS i
	ON i."inventory_id" = r."inventory_id"
	JOIN "film" AS f
	ON f."film_id" = i."film_id")
SELECT c."customer_id", c."first_name", c."last_name", 
		COUNT(*) AS "total alquileres"
FROM "peliculas_cliente" AS pc
RIGHT JOIN "customer" AS c
ON c."customer_id" = pc."customer_id"
GROUP BY c."customer_id", c."first_name", c."last_name";











