--/ Alumna: Bazan Daniela Romina - 3ro Analista en sistemas - 2018 /--
--DML 
use editorial
----*****************************************************************************************************************************
--1. Consultas básicas
--********************
/*1.1. Listar los cargos.*/
SELECT * from  cargos
/*1.2. Listar todas las columnas de empleados y la descripción del cargo que tienen.*/
SELECT empleados.*, cargo_descripcion
FROM empleados,cargos
WHERE empleados.cargo_id = cargos.cargo_id

/*1.3. Listar la tabla empleados y reemplazar los nombres de columnas que tengan guion bajo por espacio*/
SELECT  empleado_id as 'empleado id',nombre,
		inicial_segundo_nombre as 'inicial segundo nombre',apellido,
		cargo_id as 'cargo id',
		nivel_cargo as 'nivel cargo',
		editorial_id as 'editorial id',
		fecha_contratacion as 'fecha contratacion'
FROM empleados
/*1.4. Obtener la fecha actual del sistema con el nombre de “Fecha y hora actual”*/
 SELECT GETDATE() as 'Fecha y hora actual'
 /* -- 1.5. Mostrar por cada título su nombre y cuanto corresponde de regalías por cada 1000 títulos vendidos.
 Esta columna se debe mostrar como “Regalías x cada 1000 unidades”. Titulo.regalías es un porcentaje.*/
 SELECT titulo, 'Regalías x cada 1000 unidades' = precio * 1000 * regalias
from  titulos
/*1.6. Listar los nombres de autores sin repetirlos.*/
 SELECT distinct autores.autor_nombre 
from  autores
/*1.7. Listar los países de las editoriales sin repetirlos.*/
 SELECT distinct pais
from  editoriales
/*1.8. Listar los nombres de almacén que hayan tenido ventas sin repetirlos.*/
 SELECT distinct almacenes.almacen_nombre
from  almacenes,ventas
where almacenes.almacen_id = ventas.almacen_id

 --SELECT distinct almacenes.almacen_nombre
--from  almacenes,ventas
--where ventas.cantidad > 0
/*1.9. Listar las primeras 5 ventas*/
 SELECT top 5 cantidad
from ventas
----*****************************************************************************************************************************
