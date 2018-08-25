--/ Alumna: Bazan Daniela Romina - 3ro Analista en sistemas - 2018 /--
--DML 
use editorial
----*****************************************************************************************************************************
/*5. Ordenación
5.1. Listar los empleados ordenados por apellido, por nombre y por inicial del segundo nombre.*/
SELECT apellido,nombre,inicial_segundo_nombre
FROM empleados
ORDER BY  apellido,nombre,inicial_segundo_nombre  ASC

/*5.2. Listar los títulos pertenecientes al género ‘business’. Por cada fila, listar el id, el título
y el precio. Ordenar los datos por precio en forma descendente e id de artículo en forma ascendente.*/
select titulo_id,titulo,precio
from titulos
where genero like '%business%'
order by precio DESC , titulo_id  ASC

/*5.3. Informar la venta más importante con forma de pago a 60 días.
 Mostrar el almacén, el número de orden, la fecha de la factura y el título.*/

select top 1 almacen_id,numero_orden,fecha_orden,t.titulo
from  titulos as t,ventas as v
where (t.titulo_id = v.titulo_id) and  v.forma_pago LIKE '60 D[i,í]AS%'
order by  v.cantidad * precio desc





