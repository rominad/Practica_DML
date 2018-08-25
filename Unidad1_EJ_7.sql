
--/ Alumna: Bazan Daniela Romina - 3ro Analista en sistemas - 2018 /--
--DML 
use editorial
----*****************************************************************************************************************************
/*EJERCICIO NUMERO 7. Funciones agregadas con agrupaci�n. Renombrar las columnas obtenidas por funci�n
agregada.*/
/*7.1. Informar cuantos t�tulos tiene cada autor. Mostrar c�digo de autor y cantidad de libros.*/
select autor_id , COUNT(*) as cantidad_titulos
from titulo_autor
group by autor_id

/*7.2. Informar el total de unidades vendidas por n�mero de orden del almac�n 7131.
Mostrar n�mero de orden y total vendido.*/
select numero_orden, sum(cantidad) as total_vendido
from ventas as v
where v.almacen_id = '7131'
group by numero_orden

/*7.3. Informar la �ltima orden generada por cada almac�n con forma de pago a 30 d�as y 60
d�as. Mostrar c�digo de almac�n, fecha de la orden y forma de pago. Ordenar por
fecha de orden.*/
select almacen_id,forma_pago, max(fecha_orden) as ultima_orden
from ventas
where forma_pago = '30 d�as' or
	  forma_pago = '60 d�as'
group by almacen_id, forma_pago
order by ultima_orden

/*7.4. Informar el nivel de cargo m�s alto alcanzado por alg�n empleado de cada editorial.
Mostrar Nombre de la editorial y nivel de cargo. Ordenar por nivel de cargo m�ximo
empezando por el mayor*/

select ed.editorial_nombre,em.nivel_cargo, max(em.nivel_cargo) as maximo_cargo
from empleados as em, editoriales as ed
where em.editorial_id = ed.editorial_id
	group by ed.editorial_nombre, em.nivel_cargo
	order by maximo_cargo

/*7.5. Mostrar los tres primeros g�neros m�s vendidos. Mostrar g�nero y total de ventas
ordenado por mayor total de venta. SE USA HAVING*/
select * from titulos

select  t.genero, sum(v.cantidad) as total_cantidad
from titulos as t,ventas as v
where t.titulo_id =  v.titulo_id
group by t.genero
--having count(*) < 3
order by total_cantidad  desc


/*7.6. Informar aquellos t�tulos que tengan m�s de un autor. Mostrar c�digo de t�tulo y
cantidad de autores.*/
select  t.titulo_id,count(ta.autor_id) as cant_autores
from titulos as t, titulo_autor as ta
where t.titulo_id = ta.titulo_id
group by t.titulo_id
--having (t.titulo_id = 'BU1032') OR (t.titulo_id = 'BU1111')

/*7.7. Informar el total de regal�as obtenidas por cada t�tulo que haya tenido 40 o m�s unidades vendidas.
 Mostrar el t�tulo y el monto en pesos de las regal�as y ordenar por
mayor regal�a primero.*/

select t.titulo_id,sum(t.regalias) as total_regalias
from titulos as t, ventas as v
	group by t.titulo_id
	having sum(v.cantidad) > 40
	order by total_regalias asc

/*7.8. Informar los autores que hayan escrito varios g�neros de t�tulos. Mostrar nombre y
cantidad de g�neros ordenados por esta �ltima columna empezando por el mayor.*/
select * from autores

select a.autor_nombre, genero =  sum(t.genero)
from autores as a, titulos as t, titulo_autor as ta
where a.autor_id = ta.autor_id and ta.autor_id = t.titulo_id
	group by genero
	order by t.genero asc

