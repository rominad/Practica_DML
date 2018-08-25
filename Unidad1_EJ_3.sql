--/ Alumna: Bazan Daniela Romina - 3ro Analista en sistemas - 2018 /--
--DML 
use editorial
----*****************************************************************************************************************************
/*3. Manejo de valores nulos*/
/*3.1. Mostrar aquellos libros que tienen el precio en nulo. Mostrar id de título, nombre y
nombre del editor.*/
select  t.titulo_id,t.titulo,e.editorial_nombre,precio
from titulos as t,editoriales as e
where precio is null 
and (t.editorial_id = e.editorial_id)
/*3.2. Mostrar todos los libros. Mostrar id de título, nombre y nombre del editor y el precio.
Aquellos que tienen el precio en nulo cambiarlo por 0.*/
select titulo_id,titulo,e.editorial_nombre,'Precio'= ISNULL(precio,0) 
 from titulos as t,editoriales as e
 where t.editorial_id = e.editorial_id
/*3.3. Mostrar los descuentos que tengan una cantidad mínima establecida. Informar tipo
descuento, cantidad mínima y descuento*/
select tipo_descuento,descuento,cantidad_minima 
from descuentos 
where cantidad_minima  IS NOT NULL
/*3.4. Mostrar los títulos y el adelanto que le corresponde a cada uno, si este valor fuera
nulo informar le valor predeterminado de 1000 pesos.*/
SELECT titulo, 'Adelanto' = ISNULL(adelanto,1000) 
FROM titulos