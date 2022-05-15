-- FUNCIONES PRUEBA


CREATE OR REPLACE FUNCTION AltaPrueba(
	pFecha DATE,
	pHora TIME,
	pNroMuestra INT,
	pResultado INT,
	pNroActa INT,
	pNroRetencion INT,
	pConductorDni VARCHAR,
	pDominioId VARCHAR,
	pPrestamoId INT
) 
RETURNS SETOF Prueba AS
$$
DECLARE mId INT;
BEGIN
	INSERT INTO Prueba(fecha, hora, nroMuestra, resultado, nroActa, nroRetencion, conductorDni, dominioId, prestamoId) 
	VALUES (pFecha, pHora, pNroMuestra, pResultado, pNroActa, pNroRetencion, pConductorDni, pDominioId, pPrestamoId)
	RETURNING Id INTO mId;
	
	RETURN QUERY SELECT * FROM Prestamo WHERE id = mId;
END;
$$
LANGUAGE 'plpgsql';

--------------------------
--luego de verificar la prueba
CREATE OR REPLACE FUNCTION ModificacionPrueba(
	pId INT,
	pRechazado TIME,
	pDescripcionRechazo VARCHAR,
	pVerificadorNombre VARCHAR --del login
) 
RETURNS SETOF Prueba AS
$$
BEGIN
	UPDATE Prueba 
	SET verificado = TRUE,
		rechazado = pRechazado,
		descripcionRechazo = pDescripcionRechazo,
		verificadorNombre = pVerificadorNombre
	WHERE 
		id = pId;
	RETURN  QUERY SELECT * FROM Prueba WHERE id = pId;
END;
$$
LANGUAGE 'plpgsql';

