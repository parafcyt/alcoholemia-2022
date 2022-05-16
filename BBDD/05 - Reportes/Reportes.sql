select * from prueba

--PRUEBAS ENTRE FECHAS

select p.id, p.fecha, p.hora, p.conductordni, c.nombre as nombreConductor, c.apellido as apellidoconductor, p.dominioId, e.nombre as equiponombre, u.nombrereal as examinadornombre 
from prueba p
join conductor c
on c.dni=p.conductordni
join prestamo prest
on p.prestamoid =prest.id
join equipo e
on prest.equipoid =e.id
join examinador exa
on prest.equipoid=exa.id
join usuario u
on u.nombreusuario=exa.usuarionombre
WHERE P.Fecha BETWEEN '2021-05-15' AND '2022-05-15'
order by p.fecha, p.hora asc

--TODAS LAS PRUEBAS DE UN CONDUCTOR DNI

select p.id, p.fecha, p.hora, p.conductordni, c.nombre as nombreConductor, c.apellido as apellidoconductor, p.dominioId, e.nombre as equiponombre, u.nombrereal as examinadornombre
from prueba p
join conductor c
on c.dni=p.conductordni
join prestamo prest
on p.prestamoid =prest.id
join equipo e
on prest.equipoid =e.id
join examinador exa
on prest.equipoid=exa.id
join usuario u
on u.nombreusuario=exa.usuarionombre
WHERE p.conductordni='1581170920'

--TODAS LAS PRUEBAS DE UN AUTO
select p.id, p.fecha, p.hora, p.conductordni, c.nombre as nombreConductor, c.apellido as apellidoconductor, p.dominioId, e.nombre as equiponombre, u.nombrereal as examinadornombre
from prueba p
join conductor c
on c.dni=p.conductordni
join prestamo prest
on p.prestamoid =prest.id
join equipo e
on prest.equipoid =e.id
join examinador exa
on prest.equipoid=exa.id
join usuario u
on u.nombreusuario=exa.usuarionombre
WHERE p.dominioid='wba3b1c50f5078825'


--TODAS LAS PRUEBAS DE UN EXAMINADOR
select p.id, p.fecha, p.hora, p.conductordni, c.nombre as nombreConductor, c.apellido as apellidoconductor, p.dominioId, e.nombre as equiponombre, u.nombrereal as examinadornombre
from prueba p
join conductor c
on c.dni=p.conductordni
join prestamo prest
on p.prestamoid =prest.id
join equipo e
on prest.equipoid =e.id
join examinador exa
on prest.equipoid=exa.id
join usuario u
on u.nombreusuario=exa.usuarionombre
WHERE u.nombreusuario='fbithell8'

--TODAS LAS PRUEBAS DE UN EQUIPO
select p.id, p.fecha, p.hora, p.conductordni, c.nombre as nombreConductor, c.apellido as apellidoconductor, p.dominioId, e.nombre as equiponombre, u.nombrereal as examinadornombre
from prueba p
join conductor c
on c.dni=p.conductordni
join prestamo prest
on p.prestamoid =prest.id
join equipo e
on prest.equipoid =e.id
join examinador exa
on prest.equipoid=exa.id
join usuario u
on u.nombreusuario=exa.usuarionombre
WHERE e.nombre='Zontrax'

-- cantidad de pruebas, positivas y negativas entre fechas agrupado por examinador

select * from prueba
select e.usuarionombre AS NombreExaminador,
		COUNT(*) AS TotalPruebas,
		SUM(case WHEN p.resultado > 0.0 THEN 1 ELSE 0 END) 	AS CantidadPositivos,
		SUM(case WHEN p.resultado <= 0.0 THEN 1 ELSE 0 END) 	AS CantidadNegativos
from prueba p
join prestamo prest
on p.prestamoid=prest.id
join examinador e
on prest.examinadorid=e.id
group by e.usuarionombre


-- cantidad de controles entre fechas

-- cantidad de controles entre meses del mismo año

-- cantidad de controles entre años

-- cantidad de test positivos y negativos entre fechas, agrupados por mes del mismo año

-- cantidad de test positivos y negativos entre meses del mismo año

-- cantidad de test positivos y negativos entre años

-- promedio de graduaciones entre fechas, agrupados por mes del mismo año

-- promedio de graduaciones entre meses del mismo año??

-- promedio de graduaciones entre años??









