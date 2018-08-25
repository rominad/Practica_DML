--/ Alumna: Bazan Daniela Romina - 3ro Analista en sistemas - 2018 /--
--DML 
use editorial
----*****************************************************************************************************************************
/*5. Ordenaci�n
5.1. Listar los empleados ordenados por apellido, por nombre y por inicial del segundo nombre.*/
SELECT apellido,nombre,inicial_segundo_nombre
FROM empleados
ORDER BY  apellido,nombre,inicial_segundo_nombre  ASC

/*5.2. Listar los t�tulos pertenecientes al g�nero �business�. Por cada fila, listar el id, el t�tulo
y el precio. Ordenar los datos por precio en forma descendente e id de art�culo en forma ascendente.*/
select titulo_id,titulo,precio
from titulos
where genero like '%business%'
order by precio DESC , titulo_id  ASC

/*5.3. Informar la venta m�s importante con forma de pago a 60 d�as.
 Mostrar el almac�n, el n�mero de orden, la fecha de la factura y el t�tulo.*/

select top 1 almacen_id,numero_orden,fecha_orden,t.titulo
from  titulos as t,ventas as v
where (t.titulo_id = v.titulo_id) and  v.forma_pago LIKE '60 D[i,�]AS%'
order by  v.cantidad * precio desc





