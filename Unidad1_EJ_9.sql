--/ Alumna: Bazan Daniela Romina - 3ro Analista en sistemas - 2018 /--
--DML 
use editorial
----*****************************************************************************************************************************
/*EJERCICIO NUMERO 9 Uni�n 
9.1. Informar las ciudades y estado donde residen los autores, las editoriales y los
almacenes descartando valores duplicados. Ordenar por nombre de ciudad.*/
select distinct ciudad,estado
from autores 
union
select ciudad,estado
from editoriales


/*9.2. Informar cuantos t�tulos se han publicado en el primer semestre del 2011 y en el primer
semestre del 2017. Mostrar dos columnas y dos filas: en la primera columna la
descripci�n del periodo y en la segunda la cantidad de t�tulos.*/

select top 1 descripcion = titulo, cantidadTitulos = venta_anual, fecha_publicacion
from titulos
where YEAR(fecha_publicacion) = 2011 and MONTH(fecha_publicacion) Between 1 and 6
union
select top 1 descripcion = titulo, cantidadTitulos = venta_anual, fecha_publicacion
from titulos
where YEAR(fecha_publicacion) = 2017 and MONTH(fecha_publicacion) BETWEEN 1 AND 6


/*9.3. Emitir un informe comparativo entre las ventas del a�o 2012 y el a�o 2014. El informe
debe tener las siguientes columnas: c�digo de t�tulo, titulo, a�o y cantidad de vendida
en el a�o (cada uno correspondiente al c�digo de t�tulo de la fila correspondiente).
Tener presente que un t�tulo puede tener ventas en un a�o y no en el otro, en cuyo
caso debe aparecer igual en el informe el a�o sin ventas. Ordenar por t�tulo y a�o.*/
 
select titulo_id,titulo,fecha_publicacion,venta_anual
from titulos
union
select almacen_id,forma_pago,fecha_orden,cantidad
 from ventas
 order by titulo,fecha_publicacion