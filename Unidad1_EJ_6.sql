--/ Alumna: Bazan Daniela Romina - 3ro Analista en sistemas - 2018 /--
--DML 
use editorial
----*****************************************************************************************************************************
/*EJERCICIO NUMERO 6: Funciones agregadas. No olvidar renombrar las columnas obtenidas por función agregada.*/

/*6.1. Mostrar el promedio de venta anual de todos los títulos*/
select t.titulo, funcion_agregada = (sum(v.cantidad) /count( v.cantidad))
from titulos as t, ventas as v
where v.titulo_id =  t.titulo_id
group by t.titulo

/*6.2. Mostrar el máximo de adelanto de todos los títulos*/
/*select t.titulo, funcion_agregada = max(t.adelanto)
from titulos as t
group by t.titulo*/
select max(adelanto) as maximo_adelanto
from titulos

/*6.3. Informar cuantos planes de regalías tiene el título MC3021*/

select t.titulo, funcion_agregada = COUNT(p.titulo_id)
from titulos as t, plan_regalias as p
WHERE t.titulo_id = 'MC3021'
group by t.titulo

/*6.4. Obtener el total de ventas realizadas a 30 días en el año 2014*/
/*select anio= year(v.fecha_orden), funcion_agregada = sum(v.cantidad)
from  ventas as v
where year(v.fecha_orden) like '2014' and v.forma_pago like '%30 D[í,i]as%'
group by year(v.fecha_orden) */
select count(*) as total_ventas
from ventas
where forma_pago = '30 dias' and year(fecha_orden) = 2014

/*6.5. Informar cuantas formas de pago  existen*/
select forma_pago = count(distinct forma_pago)
from ventas

select distinct forma_pago
from ventas