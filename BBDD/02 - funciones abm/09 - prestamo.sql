-- FUNCIONES PRESTAMO


CREATE OR REPLACE FUNCTION AltaPrestamo(
	pFechaPrestamo DATE,
	pHoraPrestamo TIME,
	pNroInicial INT,
	pExaminadorId INT,
	pEquipoId INT
) 
RETURNS SETOF Prestamo AS
$$
DECLARE mId INT;
BEGIN
	INSERT INTO Prestamo(activo,fechaPrestamo, horaPrestamo, nroInicial, examinadorId, equipoId) 
	VALUES (TRUE,pFechaPrestamo, pHoraPrestamo, pNroInicial, pExaminadorId, pEquipoId)
	RETURNING Id INTO mId;
	
	RETURN QUERY SELECT * FROM Prestamo WHERE id = mId;
END;
$$
LANGUAGE 'plpgsql';

--------------------------
--ACTIVO A FALSE
CREATE OR REPLACE FUNCTION BajaPrestamo(
	pId INT,
	pFechaDevolucion DATE,
	pHoraDevolucion TIME,
	pNroDevolucion INT
) 
RETURNS SETOF Prestamo AS
$$
BEGIN
	UPDATE Prestamo 
	SET activo=FALSE
	WHERE 
		id = pId;
	RETURN  QUERY SELECT * FROM Prestamo WHERE id = pId;
END;
$$
LANGUAGE 'plpgsql';

