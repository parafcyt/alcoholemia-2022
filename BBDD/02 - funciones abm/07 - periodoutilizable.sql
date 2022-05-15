-- FUNCIONES PERIODOUTILIZABLE


CREATE OR REPLACE FUNCTION AltaPeriodoUtilizable(
	pEquipoId INT,
	pFechaInicio DATE, 
	pFechaVencimiento DATE,
	pNroIngreso INT

) 
RETURNS SETOF PeriodoUtilizable AS
$$
DECLARE mId INT;
BEGIN
	INSERT INTO PeriodoUtilizable(equipoId,activo, fechaInicio, fechaVencimiento, nroIngreso) 
	VALUES (pEquipoId,TRUE,pFechaInicio, pFechaVencimiento, pNroIngreso)
	RETURNING id INTO mId;
	
	RETURN QUERY SELECT * FROM PeriodoUtilizable WHERE id = mId;
END;
$$
LANGUAGE 'plpgsql';

--------------------------
--ACTIVO A FALSE
CREATE OR REPLACE FUNCTION BajaPeriodoUtilizable(pId INT) 
RETURNS SETOF PeriodoUtilizable AS
$$
BEGIN
	UPDATE PeriodoUtilizable 
	SET activo=FALSE
	WHERE 
		id = pId;
	RETURN  QUERY SELECT * FROM PeriodoUtilizable WHERE id = pId;
END;
$$
LANGUAGE 'plpgsql';

--------------------------
--sólo fechaVencimiento/nroIngreso
CREATE OR REPLACE FUNCTION ModificarPeriodoUtilizable(
	pId INT,  
	pFechaVencimiento DATE,
	pNumeroIngreso INT
) 
RETURNS SETOF PeriodoUtilizable AS
$$
BEGIN
	UPDATE PeriodoUtilizable 
	SET 
		fechaVencimiento = pFechaVencimiento,
		nroIngreso = pNroIngreso
	WHERE 
		nombreUsuario = pNombreUsuario;
		
	RETURN QUERY SELECT * FROM PeriodoUtilizable WHERE id = pId;
END;
$$
LANGUAGE 'plpgsql';
