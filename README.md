![image](https://github.com/user-attachments/assets/7ca73752-fc75-431f-a08f-59adcf0f7d9a)

ANÁLISIS DE BASES DE DATOS: ALQUILER DE PELÍCULAS.

1- DESCIRPCIÓN DEL PROYECTO.

Este proyecto se basa en el análisis de una base de datos dada. Los datos que se muestran en la misma corresponden a los alquileres de películas de una determinada tienda.
El análisis de los datos se basa en dar respuesta a un total de 64 preguntas en las que se intenta dar respuesta a los aspectos más relevantes que se muestran en los datos.

La técnica para poder obtener los datos se basa en realizar diferentes consultas SQL para intentar dar respuesta a las preguntas planteadas de las manera más correcta posible.

2- ESTRUCTURA DEL PROYECTO.

El proyecto se estructura de la siguiente manera:

-- datos: se basa en una base de datos de SQL dada.

-- src: se incluyen el script realizado con el análisis y las respuestas a las preguntas planteadas.

-- resultados: se incluyen los resultados obtenidos.

-- readme.md: en el que describo el proyecto realizado.

La base de datos analizada se encontraba distribuida de la siguiente manera:

![image](https://github.com/user-attachments/assets/144321cb-d16f-4d6f-a294-bb9921bd51e3)

Los datos se organizaban en las tablas y columnas que especifico a continuación:

- TABLA PAYMENT:

Recoge los datos de los importes pagados por los diferentes clientes por los alquileres, así como los miembros del staff que han intervenido. Esta tabla está dividida en las siguientes columnas.

Payment_id: datos de tipo numérico,
Customer_id: datos de tipo numérico,
Staff_id: datos de tipo numérico,
Rental_id: datos de tipo numérico,
Amount: dato de tipo numérico y
Payment_date: datos de tipo fecha.

- TABLA RENTAL

Recoge los datos de los alquileres que se han realizado por los diferentes clientes e indica las fechas correspondientes a cuándo se alquiló la película y cuando se devolvió. Los datos se dividen en las siguientes columnas.

Rental_id: datos de tipo numérico,
Rental date: datos de tipo fecha,
Inventory_id: datos de tipo numérico,
Customer_id: datosd e tipo numérico,
Return_date: datos de tipo fecha,
Staff_id: datos de tipo numérico y
Last_update: datos de tipo fecha.

- TABLA CUSTOMER

Recoge los datos asociados a los clientes y se dividen en las siguientes columnas:

Customer_id: datos de tipo numérico,
Store_id: datos de tipo numérico,
Fisrt_name: datos de tipo texto,
Last_name: datos de tipo texto,
email: datos de tipo texto,
adress_id: datos de tipo numérico,
Activebool: datos de tipo booleano,
Create_date: datos de tipo fecha,
Last_update: datos de tipo fecha y
Active: datos de tipo numérico.

- TABLA STORE

Recoge los datos de las tiendas de alquiler y se dividen en las siguientes columnas:

Store_id: datos de tipo numérico,
Manager_staff_id: datos de tipo numérico,
Adress_id: datos de tipo numérico y
Last_update: datos de tipo fecha.

- TABLA STAFF

Recoge los datos de los empleados de las tiendas y se dividen en las siguientes columnas:

Staff_id: datos de tipo numérico,
First_name: datos de tipo texto,
Last_name: datos de tipo texto,
Adress_id: datos de tipo numérico,
email: datos de tipo texto,
Store_id: datos de tipo numérico,
Active: datos de tipo booleano,
Username: datos de tipo texto,
Password: datos de tipo texto,
Last_update: datos de tipo fecha y
Picture: datos de tipo imagen.

- TABLA ADRESS

Recoge los datos de las direcciones de las tiendas de alquiler y se dividen en las siguientes columnas:

Adress_id: datos de tipo numérico,
Adress: datos de tipo texto,
Adress2: datos de tipo texto,
District: datos de tipo texto,
City_id: datos de tipo numérico,
Postal_code: datos de tipo texto,
Phone: datos de tipo texto y
Last_update: datos tipo fecha.

- TABLA CITY

Recoge los datos sobre las ciudades relacionados con las tiendas de alquiler y se dividen en las siguientes columnas:

City_id: datos de tipo numérico,
City: datos de tipo texto,
Country_id: datos de tipo numérico y
Last_update: datos de tipo fecha.

- TABLA COUNTRY

Recoge los datos sobre los países relacionados con las tiendas de alquiler y se dividen en las siguientes columnas:

Country_id: datos de tipo numérico,
Country: datos de tipo texto y
Last_update: datos de tipo fecha.

- TABLA INVENTORY

Recoge los datos de los stocks de las películas relacionados con las tiendas y se dividen en las siguientes columnas:

Inventory_id: datos de tipo numérico,
Film_id: datos de tipo numérico,
Store_id: datos de tipo numérico y
Last_update: datos de tipo fecha.

- TABLA FILM

Recoge los datos asociados a las características propias de las películas y se dividen en las siguientes columnas:

Film_ id: datos de tipo numérico,
Title: datos de tipo texto,
Description: datos de tipo texto,
Release_year: datos de tipo numérico,
Language_id: datos de tipo numérico,
Original_language_id: datos de tipo numérico,
Rental_duration: datos de tipo numérico,
rental_rate: datos de tipo numérico,
Length: datos de tipo numérico,
Replacement_cost: datos de tipo numérico,
Rating: datos de tipo texto,
Last_update: datos de tipo fecha,
Special_features: datosd de tipo texto y
Fulltext: datos de tipo texto.

- TABLA FILM_CATEGORY

Recoge los datos sobre las categorías de las diferentes películas y se dividen en las siguientes columnas:

Film_id: datos de tipo numérico,
Category_id: datos de tipo numérico y
Last_update: datos de tipo fecha.

- TABLA CATEGORY

Recoge los datos de los nombres de las categorías asociadas a las películas y se dividen en las siguientes columnas:

Category_id: datos de tipo numérico,
Name: datos de tipo texto y
Last_update: datos de tipo fecha.

- TABLA LANGUAGE

Recoge los datos sobre los idiomas de las diferentes películas y se dividen en las siguientes columnas:

Language_id: datos de tipo numérico,
Name: datos de tipo texto y 
Last_update: datos de tipo fecha.

- TABLA FILM_ACTOR

Recoge los datos relacionados con los actores y las películas realizadas y se dividen en las siguientes columnas;

Actor_id: datos de tipo numérico,
Film_id: datos de tipo numérico y
Last_update: datos de tipo fecha.

- TABLA ACTOR

Recoge los datos directos de los actores y se dividen en las siguientes columnas

Actor_id: datos de tipo numérico,
First_name: datos de tipo texto,
Last_name: datos de tipo texto y
Last_update_ datos de tipo fecha.

3- INSTALACIÓN Y REQUISITOS

La base de datos analizada se trata de un archivo de SQL que hemos analizado mediante los siguientes programas:

DBEAVER: aplicación cliente SQL y herramienta de administración de bases de datos relacionales. La versión utilizada para este propyecto es la 25.0.0

POSTGRESQL: sistema de gestión de bases de datos relacionales de código abierto. La versión utilizada para este proyecto es la 17

4- RESULTADOS Y CONCLUSIONES.

Dentro de las preguntas planteadas para este proyecto, nos encontramos con varios resultados que pueden resultarnos útiles para hacernos una idea del tipo de alquileres y películas que estamos analizando.

- De todas las películas analizadas nos encontramos con 195 de ellas que se califican como "R", para mayores de edad.

![image](https://github.com/user-attachments/assets/88e94c5b-0233-454e-a16b-f71c06599b25)

- Por calificaciones, la mayoría de las películas se encuientran dentro de la calificación PG-13.

![image](https://github.com/user-attachments/assets/e63773d0-c30e-465e-8401-a1937ebe81a7)

- La duración máxima de una película es de 185 min.

![image](https://github.com/user-attachments/assets/0aa9c38b-1321-4460-9e69-30b866b8e8a2)

- La duración mínima de una película es de 46 min.

![image](https://github.com/user-attachments/assets/e93b0b7b-64b5-4ef4-bd21-943d17cd6118)

- EL mayor promedio de duración de las películas son las que están calificadas como PG-13.

![image](https://github.com/user-attachments/assets/bde0e0ce-a7a4-4d0f-9bb5-83d854efc56b)

- El total de las ventas es de 67.416,51 $

![image](https://github.com/user-attachments/assets/fa0922d0-2390-4185-9227-fba4c35cb6a9)

- La duración media de los alquileres es de 4,9.

![image](https://github.com/user-attachments/assets/bb2a29be-eaa6-48e2-9429-7cc15ec04f8f)

- Los meses en donde hay más alquileres son los de julio y agosto.

![image](https://github.com/user-attachments/assets/337d97a8-bc7d-4454-aa81-c7874c299169)

- El promedio de pago por alquiler es de 4,20 $

![image](https://github.com/user-attachments/assets/c7330124-22a1-4d87-9344-631af1560569)

-- El cliente que más gasto hizo pagos por valor de 46 $

![image](https://github.com/user-attachments/assets/aa1b1ab3-ca45-45e6-9d85-8bb7b8f2c125)

- Hay registrados un total de 200 actores en las peliculas que tenemos.

![image](https://github.com/user-attachments/assets/0a7fa0e3-36f6-4f0c-88bf-28c243962a95)

- La actriz Susan Davis es la que ha participado en más películas.

![image](https://github.com/user-attachments/assets/fcc269ff-ea57-43ae-9615-c8ea1e8d122a)

- Cristina Chambers es la clienta que más alquileres ha realizado

![image](https://github.com/user-attachments/assets/a8eabb87-2b5d-4c17-a50a-16c07b456397)


5- PRÓXIMOS PASOS

El proyecto, se encuentra realizado en su totalidad, ya que se ha dado respuesta a las 64 preguntas planteadas. Sería posible plantearnos nuevas preguntas que incidan más en analizar los datos de las tiendas y del staff del negocio. Así mismo, podríamos buscar los datos de fechas posteriores a las analizadas para poder hacer comparativas.

6- Contribuciones.

En este proyecto se acepta cualquier contribución que pueda aportar un valor adicional al análisis inicial realizado.

8- Autor.

- Óscar Pérez Chico
- https://github.com/Oski-00/Proyecto-BB.DD
