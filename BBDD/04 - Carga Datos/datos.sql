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
('1581170920', 'Vanna', 'McIlraith');



insert into Dominio (patente, descripcion) values 
('WBSDE93422C959092', '1500 Club Coupe'),
('JN1CV6EKXEM902606', 'TundraMax'),
('WBA3B1C50F5078825', 'SL-Class');



--***
-- deberian insertarse por los triggers no?
-- insert into Examinador (usuarioNombre) values 
-- ('test'),
-- ('fbithell8'),
-- ('stimpany9');


insert into Equipo (nombre, nroActual) values 
('Wrapsafe', 0),
('Zontrax', 0),
('Bitwolf', 0);


insert into PeriodoUtilizable (activo, fechaInicio, fechaVencimiento, nroIngreso, equipoId) values 
(true, '2022-05-14','2022-10-14', 299, 1),
(true, '2022-03-14','2022-11-14', 796, 2),
(true, '2022-01-14','2022-12-14', 198, 3);


insert into Prestamo (activo, fechaPrestamo, horaPrestamo, nroInicial, examinadorId, equipoId) values 
(true, '2022-05-14', '1:08', 299, 2, 1),
(true, '2022-05-14', '16:52', 796, 3, 2),
(true, '2022-05-14', '23:34', 198, 4, 3);


--prestamo 1
insert into Prueba (fecha, hora, nroMuestra, resultado, nroActa, nroRetencion, conductorDNI, dominioId, prestamoId) values 
('2022-05-15', '12:50', 299, 0.0, null, null, '8927785576', 'wbsde93422c959092', 7);


--prestamo 2
insert into Prueba (fecha, hora, nroMuestra, resultado, nroActa, nroRetencion, conductorDNI, dominioId, prestamoId) values 
('2022-05-15', '3:16', 796, 0.0, null, null, '7719134508', 'jn1cv6ekxem902606', 8);


--prestamo 3
insert into Prueba (fecha, hora, nroMuestra, resultado, nroActa, nroRetencion, conductorDNI, dominioId, prestamoId) values 
('2022-05-15', '22:06', 198, 0.0, null, null, '1581170920', 'wba3b1c50f5078825', 9);

