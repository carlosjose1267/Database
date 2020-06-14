---------------------
--Cursor1--
---------------------

DECLARE
   Cantidad_del_salario VARCHAR2(20);
   Nombre_del_oficio VARCHAR(20);
   Nombre_del_empleado VARCHAR(20);

   CURSOR MenorSalario is   
    SELECT * FROM (
      SELECT employees.salary, jobs.job_title, first_name FROM employees
      INNER JOIN jobs ON employees.job_id = jobs.job_id
      where employees.job_id = 'ST_CLERK' ORDER BY employees.salary ASC
    ) WHERE rownum <= 2;
    

BEGIN
   OPEN MenorSalario;
    Dbms_output.PUT_LINE(
         'Empleados con menor salario del oficio Stock Clerk:'
    );
   FOR i IN 1..2 LOOP
      FETCH MenorSalario INTO Cantidad_del_salario, Nombre_del_oficio, Nombre_del_empleado;
        Dbms_output.PUT_LINE(
         Cantidad_del_salario||' , '||
         Nombre_del_oficio||' , '||
         Nombre_del_empleado);
   END LOOP;
   CLOSE MenorSalario;
END; 
