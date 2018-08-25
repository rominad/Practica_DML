--/ Alumna: Bazan Daniela Romina - 3ro Analista en sistemas - 2018 /--
--DML 
use editorial
----*****************************************************************************************************************************
/*4. Operaciones con cadenas
4.1. Mostrar los nombres de los autores que empiecen con “L”.*/
SELECT * 
FROM autores
where autor_nombre LIKE 'l%'
/*4.2. Mostrar los nombres de los autores que tengan una “A” en su nombre.*/
SELECT * 
FROM autores
where autor_nombre LIKE '%a%'
/*4.3. Mostrar los nombres de los autores que empiecen con letras que van de la T a la Y.*/
SELECT * 
FROM autores
where autor_nombre LIKE '[t-y]%'
/*4.4. Mostrar los títulos que no tengan un “Computer” en su titulo.*/
SELECT * 
FROM titulos
where titulo NOT LIKE '%computer%'