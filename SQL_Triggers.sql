-- Auditoria y control de eventos
create or replace trigger control_conn
AFTER logon on database
begin
	insert into control_conexiones(usuario, momento, evento) 
	values(ORA_LOGIN_USER, systimestamp, ORA_SYSEVENT);
end;

-- integridad referencial 1
CREATE OR REPLACE TRIGGER REG_EMP 
AFTER UPDATE ON EMPLOYEES for each row
BEGIN
  insert into reg_empleados(nombre, apellido, fecha) 
	values(:NEW.FIRST_NAME, :NEW.LAST_NAME, :NEW.HIRE_DATE);
END;

-- integridad referencial 2
create or replace trigger msmborrado
after delete on employees
begin
   RAISE_APPLICATION_ERROR(-20250, 'Se han borrado uno o mas registros');
end;

-- integridad de los datos 1
create or replace trigger controlsalario
before insert or update on employees
for each row
begin
if:new.salary>21000 and :new.job_ID!='AD_PRES' then
RAISE_APPLICATION_ERROR(-20200, 'No se puede ganar mas salario que el presidente');
end if;
end;


-- integridad de los datos 2
create or replace trigger notantosalario
before update of salary on employees
for each row
begin   
    if :new.salary>:old.salary*1.10 then 
    RAISE_APPLICATION_ERROR(-20231, 'No se puede subir mas de un 10% el salario');
    end if;
end;


-- Calculos derivados 
create or replace NONEDITIONABLE TRIGGER Diferencia_de_salario
    AFTER UPDATE ON employees for each row
DECLARE
   salario_resultado_diferencial number;
BEGIN
    salario_resultado_diferencial := :NEW.salary  - :OLD.salary; 
   INSERT INTO diferencia_del_salario (emp_id, Antiguo_Salario, Nuevo_Salario, Diferencia_Salarial)
   VALUES(:NEW.employee_id, :OLD.salary,:NEW.salary, salario_resultado_diferencial);
END;
