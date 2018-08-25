--/ Alumna: Bazan Daniela Romina - 3ro Analista en sistemas - 2018 /--
--DML 
use editorial

----*****************************************************************************************************************************
--2. Consultas básicas con Where
--******************************
/*2.1. Listar los títulos pertenecientes al editor 1389. Por cada fila, listar el título, el tipo y la
fecha de publicación.*/
select distinct t.editorial_id, t.titulo,t.genero,t.fecha_publicacion
from titulo_autor as ta,  titulos as t
where t.editorial_id = '1389'
/*2.2. Tomando las ventas mostrar el id de título, el título y el total de ventas que se obtiene
de multiplicar la cantidad por precio. Renombrar a la columna calculada como “Total
de venta”.*/
select v.titulo_id, t.titulo , 'Total de Venta' = v.cantidad * t.precio
from ventas as v, titulos as t
/*2.3. Listar los id de almacén, números de orden y la cantidad para las ventas que realizo el
título “Prolonged Data Deprivation: Four Case Studies” el día 29 de mayo de 2013.*/
select a.almacen_id, v.numero_orden,v.cantidad,v.fecha_orden,t.titulo,t.titulo_id
from almacenes as a,ventas as v, titulos as t
where a.almacen_id = v.almacen_id and v.titulo_id = t.titulo_id and t.titulo = 'Prolonged Data Deprivation: Four Case Studies' AND v.fecha_orden = '2013-05-29'
/*2.4. Listar el nombre, la inicial del segundo nombre y el apellido de los empleados de las
editoriales “Lucerne Publishing” y “New Moon Books”*/
select e.nombre, e.inicial_segundo_nombre, e.apellido,ed.editorial_nombre,e.editorial_id,ed.editorial_id
from empleados as e, editoriales as ed
where e.editorial_id = ed.editorial_id  
	and (ed.editorial_nombre = 'Lucerne Publishing' OR ed.editorial_nombre = 'New Moon Books')
/*2.5. Mostrar los títulos que no sean de la editorial “Algodata Infosystems”. Informar titulo
y Editorial.*/
select t.titulo, ed.editorial_nombre
from titulos as t, editoriales as ed
where t.editorial_id = ed.editorial_id and ed.editorial_nombre <> 'Algodata Infosystems'
/*2.6. Listar los títulos que tengan más regalías que cualquier otro título.*/
select distinct t.titulo
from titulos as t ,titulos as t2
where t.regalias > t2.regalias 

/*2.7. Informar los empleados contratados en febrero, junio y agosto de cualquier año.
Mostrar apellido, nombre y fecha de contratación y ordenar por mes empezando por
los de febrero.*/
select e.apellido, e.nombre, e.fecha_contratacion
from empleados as e
where MONTH(e.fecha_contratacion) = 2 OR  MONTH(e.fecha_contratacion) = 6 OR  MONTH(e.fecha_contratacion) = 8
order by MONTH(e.fecha_contratacion) asc
/*2.8. Informar las ventas de los siguientes títulos: 'Cooking with Computers: Surreptitious
Balance Sheets', 'The Psychology of Computer Cooking', 'Emotional Security: A New
Algorithm'. Mostrar titulo, nombre de almacén, fecha de orden, número de orden y
cantidad. Ordenar por títulos.*/
select t.titulo, a.almacen_nombre, v.fecha_orden,v.numero_orden, v.cantidad
from titulos as t, almacenes as a, ventas as v
where a.almacen_id = v.almacen_id and t.titulo_id = v.titulo_id 
	  and(t.titulo = 'Cooking with Computers: Surreptitious Balance Sheets' 
	  OR t.titulo = 'The Psychology of Computer Cooking' 
	  OR t.titulo = 'Emotional Security: A New Algorithm' )
order by t.titulo asc
/*2.9. Informar las publicaciones del año 2011 exceptuando las de los géneros business,
psychology y trad_cook. Mostrar titulo y género. Ordenar por género y titulo.*/
select  t.titulo, t.genero
from titulos as t
where year( t.fecha_publicacion) = 2011 
AND t.genero <> 'business' 
AND t.genero <> 'psychology' 
AND t.genero <> 'trad_cook'
order by t.genero, t.titulo

--*******************************************************************
