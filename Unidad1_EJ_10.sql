--/ Alumna: Bazan Daniela Romina - 3ro Analista en sistemas - 2018 /--
--DML 
use editorial
----*****************************************************************************************************************************
/*EJERCICIO NUMERO 10. */

/*10. Subconsultas
10.1. Informar los t�tulos que no hayan tenido ventas entre el a�o 2011 y 2013
exceptuando los que se hayan publicado posteriormente. Mostrar t�tulo, y nombre de
editorial. Resolver este problema dos veces usando In y Exists*/
select t.titulo,e.editorial_nombre
from titulos as t,editoriales as e
where t.titulo_id not in(
select titulo_id
	from ventas 
	where t.titulo_id = titulo_id AND YEAR(fecha_orden) BETWEEN 2011 AND 2013
)

select t.titulo,e.editorial_nombre
from titulos as t,editoriales as e
where NOT EXISTS(
select v.cantidad
from ventas as v 
where t.titulo_id = v.titulo_id AND YEAR(v.fecha_orden) BETWEEN 2011 AND 2013)

/*10.2. Informar las editoriales que no hayan contratado empleados en el a�o 2010
excepto que sean Director editorial, Dise�ador o Editor. Mostrar nombre de editorial.Ordenar.*/
--ROW = 7
select ed.editorial_nombre,ed.editorial_id
from editoriales as ed
where ed.editorial_id in(
	select distinct e.editorial_id from empleados as e
	where  year(e.fecha_contratacion) != 2010 
	and not exists(
	select cargo_id,cargo_descripcion from cargos 
		where cargo_descripcion not like 'Editor' 
			and cargo_descripcion not like 'Director editorial' 
			and cargo_descripcion not like 'Dise�ador'
			and cargo_id = e.cargo_id
	)
)	
/*10.3. Informar los autores que han hecho alg�n t�tulo juntos. Mostrar los nombres y
apellidos de a pares, �sea en una misma fila apellido y nombre de un autor seguido de apellido y nombre del otro autor. 
Ordenar por apellido y nombre de un autor seguido
de apellido y nombre del otro autor.*/
--VER row = 43

select distinct t1.autor_id, t1.titulo_id, t2.autor_id
from titulo_autor as t1
left join ( 
select distinct autor_id,titulo_id
from titulo_autor) as t2
ON t1.titulo_id = t2.titulo_id 

/*10.4. Informar aquellos t�tulos que hayan tenido alguna venta mejor que las ventas
del t�tulo �Onions, Leeks, and Garlic: Cooking Secrets of the Mediterranean�. Mostrar
t�tulo y g�nero. Ordenar por t�tulo. id = tc3218*/
-- ARREGLAR

select t.titulo_id, t.genero
from titulos as t
inner join (
	select titulo_id,cantidad
	from ventas 
) as v on v.titulo_id	= t.titulo_id and t.titulo = 'Onions, Leeks, and Garlic: Cooking Secrets of the Mediterranean' 

/*10.5. Informar los almacenes que hayan vendido m�s del doble que cualquier otro
almac�n. Mostrar Nombre de almac�n y cantidad. Ordenar por mayor venta primero.*/
--row=6 ARREGLAR

select a.almacen_nombre, total = isnull(total,0) 
from almacenes as a
inner join(
	select almacen_id,total = sum(cantidad) 
	from ventas 
	group by almacen_id
)as consulta on consulta.almacen_id = a.almacen_id
order by total desc

/*10.6. Informar el almac�n o los almacenes que haya vendido m�s que todos los
otros. Mostrar Nombre de almac�n y cantidad.*/
--
select  A.almacen_nombre, cantidad
from almacenes as A, ventas as V
where V.cantidad > some (
	select cantidad = sum(cantidad)
	from ventas 
	where almacen_id = A.almacen_id
)

/*10.7. Informar el o los t�tulos que se vendieron m�s que cualquier otro con forma de
pago a 60 d�as.*/

--ARREGLAR

select titulo
from titulos as T,ventas as V
where V.cantidad > some(
	select cantidad = sum(cantidad)
	from ventas 
	where almacen_id = T.titulo_id 
	and forma_pago =  '60 d�as'
)
/*10.8. Informar cuantos t�tulos tiene cada autor. Mostrar c�digo de autor, nombre,
apellido y cantidad de libros.*/
--row = 19

select A.autor_id, A.autor_nombre , A.autor_apellido , cant_libros
from autores as A
inner join (
	select autor_id, cant_libros = count(autor_id)
	from titulo_autor
	group by autor_id
)as AU on  AU.autor_id = A.autor_id 
order by cant_libros desc

/*10.9. Informar el nivel de cargo m�s alto alcanzado por alg�n empleado de cada editor.
 Mostrar Nombre del editor y nivel de cargo. Ordenar por nivel de cargo m�ximo empezando por el mayor.*/
-- ARREGLAR row = 336
select  E.editorial_id, E.nombre , cargo 
from empleados as E
inner join (
	select cargo_id, cargo = nivel_maximo 
	from cargos
	group by cargo_id,nivel_maximo
)as C on C.cargo_id = E.cargo_id 
order by E.editorial_id asc

/*10.10. Mostrar los tres primeros g�neros m�s vendidos. Mostrar g�nero y total de
ventas ordenado por mayor total de venta.*/
select * from titulos

select top 3 T.genero, total = sum(cantidad)
from titulos as T
inner join (
	select titulo_id, cantidad = sum(cantidad)
	from ventas 
	group by titulo_id
)as V on T.titulo_id = V.titulo_id  
order by total desc

/*10.11. Informar los autores que hayan escrito varios g�neros de t�tulos. Mostrar
nombre y cantidad de g�neros ordenados por esta �ltima columna empezando por el
mayor.*/
select * from autores,ventas

select autor_nombre, generos
from autores
inner join(
	select titulo_id, Cantidad = count(genero)
	from titulos
	group by titulo_id
)

/*10.12. Informar cuantos t�tulos escribi� cada autor inclusive aquellos que no lo hayan
hecho a�n. Mostrar nombre y apellido del autor y cantidad. Ordenar por cantidad
mayor primero, apellido y nombre.*/

/*10.13. Informar el monto de regal�as a pagar por cada autor, inclusive aquellos que no
tengan ventas, de las ventas del a�o 2013 de la editorial �Binnet & Hardley�. Mostrar
apellido y nombre del autor y monto a pagar. Tener en cuenta que hay que operar la
regal�a del t�tulo y sobre esta la regal�a del autor respecto a ese libro.*/