--/ Alumna: Bazan Daniela Romina - 3ro Analista en sistemas - 2018 /--
--DML 
use editorial
----*****************************************************************************************************************************
/*EJERCICIO NUMERO 8. 
/*8. Juntas
8.1. Informar las ventas a 60 días. Mostrar el id de título, el título y el total de ventas
(cantidad por precio). Renombrar a la columna calculada.*/
--row = 9
*/
select v.titulo_id,t.titulo, total = v.cantidad * t.precio
from ventas  as v
left join titulos as t 
	on v.titulo_id = t.titulo_id
where v.forma_pago = '60 días'

/*8.2. Informar los autores que hayan escrito varios géneros de libros. Mostrar nombre y
cantidad de géneros ordenados por esta última columna empezando por el mayor.*/
--row = 4
select a.autor_nombre,a.autor_apellido, count(distinct genero) as cantidad
from autores as a
inner join titulo_autor as ta on ta.autor_id = a.autor_id
inner join titulos as t on t.titulo_id = ta.titulo_id
group by a.autor_id,autor_nombre,a.autor_apellido
having count(distinct genero) > 1
order by cantidad desc

/*8.3. Informar para que editorial ha trabajado cada autor. Mostrar Apellido y nombre del
autor y nombre de la editorial. Ordenar por Apellido y nombre del autor y nombre de
la editorial.*/
--este salio! row = 69
select a.autor_apellido, a.autor_nombre, e.editorial_nombre
from autores as a, editoriales as e
inner join titulos as t on t.editorial_id = e.editorial_id
inner join titulo_autor as ta on ta.titulo_id= t.titulo_id and ta.autor_id = autor_id
group by a.autor_apellido, a.autor_nombre, e.editorial_nombre

/*8.4. Informar las ventas por título. Mostrar título, fecha de orden y cantidad, si no tienen
venta al menos mostrar una fila que indique la cantidad en 0. Ordenar por título y
mayor cantidad vendida primero.*/
select t.titulo,v.fecha_orden, cantidad = isnull(v.cantidad,0)
from titulos as t
inner join ventas as v on v.titulo_id = t.titulo_id
order by t.titulo, cantidad

/*8.5. Informar los autores que no tienen títulos. Mostrar nombre y apellido*/
select distinct ta.autor_id,a.autor_apellido,a.autor_nombre
from autores as a
left join titulo_autor as ta on ta.autor_id = a.autor_id
where ta.titulo_id is null

/*8.6. Informar todos los cargos y los empleados que le corresponden de la editorial 'New
Moon Books', si algún cargo está vacante informar como 'Vacante' en apellido.
Mostrar descripción del cargo, apellido y nombre. Ordenar por descripción del cargo,
apellido y nombre.*/
-- falta eso de vacante
select e.nombre,e.apellido,descripcion = c.cargo_descripcion
from empleados as e
inner join cargos as c on c.cargo_id = e.cargo_id
order by descripcion,apellido,nombre


/*8.7. Informar cuantos títulos escribió cada autor inclusive aquellos que no lo hayan hecho aún.
 Mostrar nombre y apellido del autor y cantidad. Ordenar por cantidad mayor
primero, apellido y nombre.*/
--ver!
--select distinct autor_id from titulo_autor
--select distinct autor_id from autores
select a.autor_apellido,a.autor_nombre, cantidad= count(ta.autor_id)
from autores as a
left join titulo_autor as ta on ta.autor_id = a.autor_id 
group by a.autor_apellido,a.autor_nombre
order by cantidad desc

/*8.8. ¿Informar cuantos títulos “Is Anger the Enemy?” vendió cada almacén. Si un almacén
no tuvo ventas del mismo informar con un cero. Mostrar código de almacén y
cantidad.*/
--este salio! row = 4
--select * from ventas
--where titulo_id = 'PS2091'
select codAlmacen = v.almacen_id, cantidad = isnull(sum(v.cantidad),0)
from ventas as v
where titulo_id = 'PS2091'
group by v.almacen_id


/*8.9. Informar los totales de ventas (pesos) al contado entre abril y septiembre del 2014
por cada almacén. Mostrar nombre de almacén, y total de venta. Si un almacén no
tiene ventas mostrar en cero.*/
--row = 4

select al.almacen_nombre,totalVenta = isnull( t.precio * v.cantidad,0), v.fecha_orden, v.forma_pago
from almacenes as al
left join ventas as v on v.almacen_id = al.almacen_id 
left join titulos as t on t.titulo_id = v.titulo_id
where v.forma_pago = 'Al contado' 
and (MONTH(v.fecha_orden) <= 9 and  MONTH(v.fecha_orden) >= 4 )
and (YEAR(v.fecha_orden) = 2014 )

/*8.10. Informar el monto de regalías a pagar por cada autor, inclusive aquellos que no
tengan ventas, de las ventas del año 2013 de la editorial ‘Binnet & Hardley’. Mostrar
apellido y nombre del autor y monto a pagar. Tener en cuenta que hay que operar la
regalía del título y sobre esta la regalía del autor respecto a ese libro*/
--	el numero de la editorial binnet = 0877

select a.autor_apellido,a.autor_nombre, monto = v.cantidad * t.precio * (t.regalias * 100)
from autores as a 
left join titulo_autor as ta on ta.autor_id = a.autor_id
left join titulos as t on t.titulo_id = ta.titulo_id
left join ventas as v on v.titulo_id = t.titulo_id
left join editoriales as e on  t.editorial_id = e.editorial_id
where YEAR( v.fecha_orden ) = 2013 AND e.editorial_nombre = 'Binnet & Hardley' 

