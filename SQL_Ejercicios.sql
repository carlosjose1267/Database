-----------------------------------------------------------------------------------------------------------------
-- Ejercicio1
-----------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE
FUNCTION Obtener_num_empleados(var1 in departments.department_id%TYPE)
RETURN NUMBER
IS v_result NUMBER;
BEGIN
    select count(*)
    into v_result
    from employees where department_id = var1;
    return v_result;
END Obtener_num_empleados;
/

 -- Ejecucion de la funcion (FORMA 1)
 declare
   ids number:=10; 
   BEGIN
        DBMS_OUTPUT.PUT_LINE('El salario es ' || Obtener_num_empleados(ids));
   END;


  -- Ejecucion de la funcion (FORMA 2)
 select Obtener_num_empleados(department_id)  as cantidad_empleados, first_name as nombre_empleado
 from employees  where department_id = '10';

-----------------------------------------------------------------------------------------------------------------
-- Ejercicio2
-----------------------------------------------------------------------------------------------------------------
BEGIN 
    for t IN (select first_name from employees join departments 
    on employees.department_id = departments.department_id 
    where departments.department_name = 'Administration'
    ) 
    LOOP
        DBMS_OUTPUT.PUT_LINE(t.first_name);
    END loop;
    END;
    
-----------------------------------------------------------------------------------------------------------------
-- Ejercicio3
-----------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE
FUNCTION Obtener_media(var1 in departments.department_id%TYPE)
RETURN NUMBER
IS v_result NUMBER;
BEGIN
    select AVG(salary)
    into v_result
    from employees where department_id = var1;
    return v_result;
END Obtener_media;
/
                                                                       
    -- Ejecucion de la funcion (FORMA 1)
   declare
   ids number:=100; 
   BEGIN
        DBMS_OUTPUT.PUT_LINE('El salario es ' || Obtener_media(ids));
   END;
   
   -- Ejecucion de la funcion (FORMA 2)                                                            
                                                               
  select Obtener_media(department_id) as cantidad_media
  from employees  where department_id = '100' group by department_id;
   
 -----------------------------------------------------------------------------------------------------------------
-- Ejercicio4
----------------------------------------------------------------------------------------------------------------- 
 CREATE OR REPLACE
 PROCEDURE antiguedad(id_empleado IN NUMBER) AS
 dato NUMBER;
 BEGIN
     SELECT ABS(EXTRACT(YEAR FROM To_Date(sysdate)) - EXTRACT(YEAR FROM hire_date))
     into dato
     from employees WHERE employee_id=id_empleado;
      DBMS_OUTPUT.PUT_LINE('La antiguedad del empleado en años es: '||dato);
 END;
/
 -- Ejecucion del procedimiento   
                                                              
 execute antiguedad('103')                                                               
