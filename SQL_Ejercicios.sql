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

    -- ejecucion de la funcion 
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

    -- ejecucion de la funcion 
    ------------------
   declare
   ids number:=100; 
   BEGIN
        DBMS_OUTPUT.PUT_LINE('El salario es ' || Obtener_media(ids));
   END;
   -----------------

