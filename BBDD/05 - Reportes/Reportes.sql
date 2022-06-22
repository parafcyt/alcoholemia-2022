select * from prueba;

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
order by p.fecha, p.hora asc;

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
WHERE p.conductordni='1581170920';

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
WHERE p.dominioid='wba3b1c50f5078825';


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
WHERE u.nombreusuario='fbithell8';

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
WHERE e.nombre='Zontrax';

-- cantidad de pruebas, positivas y negativas entre fechas agrupado por examinador

select * from prueba;
select e.usuarionombre AS NombreExaminador,
		COUNT(*) AS TotalPruebas,
		SUM(case WHEN p.resultado > 0.0 THEN 1 ELSE 0 END) 	AS CantidadPositivos,
		SUM(case WHEN p.resultado <= 0.0 THEN 1 ELSE 0 END) 	AS CantidadNegativos
from prueba p
join prestamo prest
on p.prestamoid=prest.id
join examinador e
on prest.examinadorid=e.id
group by e.usuarionombre;


-- cantidad de controles entre fechas
select id, fecha from prueba order by fecha asc;
select id, fecha from prueba where fecha >= '2021-05-27';
select count(*), id from prueba where fecha >= '2022-05-15' and fecha <= '2022-11-30' group by id;

select count(*) as CantidadPruebas from prueba where fecha >= '2022-05-15' and fecha <= '2022-11-30';

-- cantidad de controles entre meses del mismo año
DROP VIEW if exists pruebaAnio;
CREATE OR REPLACE VIEW pruebaAnio AS SELECT id, extract(year from fecha) as anio, extract(month from fecha) as mes, fecha from prueba;
SELECT * FROM pruebaAnio;

drop function if exists controlesEntreMeses;

CREATE OR REPLACE FUNCTION controlesEntreMeses (anioI numeric, mesInicio numeric, mesFinal numeric) RETURNS table(mmes numeric,ccantControles bigint) 
AS $$
BEGIN
    return query select mes, count(*) as CantControles from pruebaAnio  where mes>=mesInicio and mes<=mesFinal and anio=anioI group by mes;
END;
$$LANGUAGE plpgsql;

select * from controlesEntreMeses(2021,4,6);

-- cantidad de controles entre años
select * from pruebaAnio;

CREATE OR REPLACE FUNCTION controlesEntreAnios (anioInicio numeric, anioFinal numeric) RETURNS TABLE (aanio numeric, ccantControles bigint)
AS $$
BEGIN
    return query select anio, count(*) from pruebaAnio where anio>=anioInicio and anio<=anioFinal group by anio;
END;
$$LANGUAGE plpgsql;

select * from controlesEntreAnios(2022,2023);

-- cantidad de test positivos y negativos entre fechas, agrupados por mes del mismo año

select * from prueba

select count

-- cantidad de test positivos y negativos entre meses del mismo año

-- cantidad de test positivos y negativos entre años

-- promedio de graduaciones entre fechas, agrupados por mes del mismo año

-- promedio de graduaciones entre meses del mismo año??

-- promedio de graduaciones entre años??







