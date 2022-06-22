--bbdd vacia
insert into TipoUsuario (tipo) values 
('administrador'),
('administrativo'),
('base');


insert into Usuario (nombreUsuario, activo, nombreReal, contrasenia, tipoUsuarioId) values 
('test', true, 'Darn Spelling', 'demo', 3),
('acogswell1', true, 'Antonina Cogswell', 'ghbzDXCU8', 2),
('fbithell8', true, 'Florella Bithell', 'kPVtwqDuw2Y', 3),
('stimpany9', true, 'Skipton Timpany', 'cPymrpA7WzF', 3),
('admin', true, 'Admin', 'demo', 1);


insert into Conductor (DNI, nombre, apellido) values 
('8927785576', 'Ynes', 'Gludor'),
('7719134508', 'Franciska', 'Van Der Walt'),
('1581170920', 'Vanna', 'McIlraith'),
('f65348954', 'Ynes', 'Zuzunaga'),
('01998564', 'Claudia', 'Correa'),
('67855694', 'Pedro', 'Martinez'),
('f02887459', 'Pedro', 'Perez'),
('06895524', 'Maria', 'Perez'),
('22875477', 'Juan', 'Perez'),
('14548873', 'Diego', 'Zuzunaga'),
('3298405', 'Diego', 'Perez');




insert into Dominio (patente, descripcion) values 
('WBSDE93422C959092', '1500 Club Coupe'),
('JN1CV6EKXEM902606', 'TundraMax'),
('WBA3B1C50F5078825', 'SL-Class'),
('AE600AA', 'Renault 12'),
('AE100AA', 'Sandero'),
('AC200AA', 'Corsa 4 puertas');


--***
-- deberian insertarse por los triggers no?
-- insert into Examinador (usuarioNombre) values 
-- ('test'),
-- ('fbithell8'),
-- ('stimpany9');


insert into Equipo (nombre, nroActual) values 
('Wrapsafe', 0),
('Zontrax', 1),
('Bitwolf', 1);


insert into PeriodoUtilizable (activo,fechaInicio, fechaVencimiento, nroIngreso, equipoId) values 
(FALSE,'2021-05-27','2022-10-14', 200, 1),
(FALSE,'2019-03-09','2022-11-14', 300, 2),
(FALSE,'2019-11-04','2021-12-14', 14, 3),
(TRUE,'2022-10-14','2023-01-01', 299, 1),
(TRUE,'2022-11-14','2022-12-24', 796, 2),
(TRUE,'2021-12-14','2022-02-12', 198, 3);



insert into Prestamo (activo, fechaPrestamo, horaPrestamo, nroInicial, fechadevolucion, horadevolucion, nrodevolucion, examinadorId, equipoId) values 
(TRUE,'2021-05-27', '01:08', 200, '2021-07-20','02:14',260, 2, 1),
(TRUE,'2019-03-09', '16:52', 100, '2021-08-05','17:04',236, 3, 2),
(TRUE,'2019-11-10', '23:34', 198, '2021-01-31','22:45',250, 1, 3),
(TRUE,'2022-10-16', '14:08', 270, '2022-12-20','02:14',400, 3, 1),
(TRUE,'2022-11-20', '04:20', 300, '2022-12-20','09:50',400, 2, 2),
(TRUE,'2021-12-15', '05:04', 280, '2022-01-10','02:14',500, 1, 3);	
	

--prueba 1
insert into Prueba (fecha, hora, nroMuestra, resultado, nroActa, nroRetencion, conductorDNI, dominioId, prestamoId) values 
('2022-05-15', '12:50', 299, 0.5, 10, null, '8927785576', 'wbsde93422c959092', 1);


--prueba 2
insert into Prueba (fecha, hora, nroMuestra, resultado, nroActa, nroRetencion, conductorDNI, dominioId, prestamoId) values 
('2022-05-15', '3:16', 796, 1.0, 14, 5, '7719134508', 'jn1cv6ekxem902606', 2);


--prueba 3
insert into Prueba (fecha, hora, nroMuestra, resultado, nroActa, nroRetencion, conductorDNI, dominioId, prestamoId) values 
('2022-05-15', '22:06', 198, 0.6, 20, 10, '7719134508', 'wba3b1c50f5078825', 3);


--prueba 4
insert into Prueba (fecha, hora, nroMuestra, resultado, nroActa, nroRetencion, conductorDNI, dominioId, prestamoId) values 
('2021-05-27', '14:06', 100, 0.5, 22, null, '1581170920', 'wba3b1c50f5078825', 3);

--prueba 5
insert into Prueba (fecha, hora, nroMuestra, resultado, nroActa, nroRetencion, conductorDNI, dominioId, prestamoId) values 
('2021-05-27', '15:10', 101, 0, null, null, 'f65348954', 'wba3b1c50f5078825', 3);
