-- Ejercicio 1
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
