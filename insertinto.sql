-- Insert de la tabla conductor
INSERT INTO conductor
(idconductor, nombre, apellidos)
VALUES(1,'carlos','cobo');

INSERT INTO conductor
(idconductor, nombre, apellidos)
VALUES(2,'pepe','garcia');

INSERT INTO conductor
(idconductor, nombre, apellidos)
VALUES(3,'federico','gomez');

INSERT INTO conductor
(idconductor, nombre, apellidos)
VALUES(4,'rolan','mayora');

INSERT INTO conductor
(idconductor, nombre, apellidos)
VALUES(5,'cristian','doh');

INSERT INTO conductor
(idconductor, nombre, apellidos)
VALUES(6,'nicolas','pasta');

INSERT INTO conductor
(idconductor, nombre, apellidos)
VALUES(7,'vladimir','hernandez');

INSERT INTO conductor
(idconductor, nombre, apellidos)
VALUES(8,'maria','db');

INSERT INTO conductor
(idconductor, nombre, apellidos)
VALUES(9,'virginia','hernandez');

INSERT INTO conductor
(idconductor, nombre, apellidos)
VALUES(10,'manolo','jimenez');

-- Insert de la tabla vehiculo

INSERT INTO vehiculo
(idvehiculo, tipo, velocidad, conductor_idconductor)
VALUES(50,'coche','60', 1);

INSERT INTO vehiculo
(idvehiculo, tipo, velocidad, conductor_idconductor)
VALUES(60,'coche','60', 2);

INSERT INTO vehiculo
(idvehiculo, tipo, velocidad, conductor_idconductor)
VALUES(84,'moto','60', 3);

INSERT INTO vehiculo
(idvehiculo, tipo, velocidad, conductor_idconductor)
VALUES(95,'coche','30', 4);

INSERT INTO vehiculo
(idvehiculo, tipo, velocidad, conductor_idconductor)
VALUES(118,'coche','100', 5);

INSERT INTO vehiculo
(idvehiculo, tipo, velocidad, conductor_idconductor)
VALUES(133,'coche','100', 6);

INSERT INTO vehiculo
(idvehiculo, tipo, velocidad, conductor_idconductor)
VALUES(143,'coche','80', 7);

INSERT INTO vehiculo
(idvehiculo, tipo, velocidad, conductor_idconductor)
VALUES(178,'ambulancia','110', 8);

INSERT INTO vehiculo
(idvehiculo, tipo, velocidad, conductor_idconductor)
VALUES(184,'coche','65', 9);

INSERT INTO vehiculo
(idvehiculo, tipo, velocidad, conductor_idconductor)
VALUES(193,'coche','70', 10);

-- Insert de las multas

INSERT INTO multa
(idmulta, descripcion, precio, conductor_idconductor)
VALUES('190','Muy poca velocidad','200', 4);

INSERT INTO multa
(idmulta, descripcion, precio, conductor_idconductor)
VALUES('192','Exceso de velocidad','300', 5);

INSERT INTO multa
(idmulta, descripcion, precio, conductor_idconductor)
VALUES('195','Exceso de velocidad','350', 6);
