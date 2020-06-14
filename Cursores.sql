---------------------
--Cursor1--
---------------------

DECLARE
-- Declaramos las variables 
   Cantidad_del_salario VARCHAR2(20);
   Nombre_del_oficio VARCHAR(20);
   Nombre_del_empleado VARCHAR(20);
-- Creamos el cursos y metemos lo que nos devuelve la consulta (conjunto de filas) en el cursor "MenorSalario"
   CURSOR MenorSalario is   
    SELECT * FROM (
      SELECT employees.salary, jobs.job_title, first_name FROM employees
      INNER JOIN jobs ON employees.job_id = jobs.job_id
      where employees.job_id = 'ST_CLERK' ORDER BY employees.salary ASC
    ) WHERE rownum <= 2;
    
-- Abrimos el cursor y creamos un bucle para extraer lo que nos devolvia la consulta y las metemos en las variables previamente creadas
-- posteriormente lo sacamos pon la salida "output" (por pantalla) y cerramos el bucle for y el cursor.
BEGIN
   OPEN MenorSalario;
   FOR i IN 1..2 LOOP
      FETCH MenorSalario INTO Cantidad_del_salario, Nombre_del_oficio, Nombre_del_empleado;
        Dbms_output.PUT_LINE(
         Cantidad_del_salario||' , '||
         Nombre_del_oficio||' , '||
         Nombre_del_empleado);
   END LOOP;
   CLOSE MenorSalario;
END; 
 
