-- FUNCIONES CONDUCTOR


CREATE OR REPLACE FUNCTION AltaConductor(
	pDNI VARCHAR, 
	pNombre VARCHAR, 
	pApellido VARCHAR
) 
RETURNS SETOF Conductor AS
$$
BEGIN
	INSERT INTO Conductor(DNI, nombre, apellido) 
	VALUES (pDNI,pNombre, pApellido);
	
	RETURN QUERY SELECT * FROM Conductor WHERE DNI = pDNI;
END;
$$
LANGUAGE 'plpgsql';

--------------------------
--Se borra un conductor sin operaciones, si al dar de alta se escribió mal el DNI, sólo tiene permisos el Admin
CREATE OR REPLACE FUNCTION BajaConductor(pDNI VARCHAR) 
RETURNS VARCHAR AS
$$
BEGIN
	DELETE FROM Conductor
	WHERE DNI = pDNI;
	RETURN pDNI;
END;
$$
LANGUAGE 'plpgsql';

--------------------------

CREATE OR REPLACE FUNCTION ModificarConductor(
	pDNI VARCHAR,  
	pNombre VARCHAR, 
	pApellido VARCHAR
) 
RETURNS SETOF Conductor AS
$$
BEGIN
	UPDATE Conductor 
	SET 
		nombre = pNombre,
		apellido = pApellido 
	WHERE 
		DNI = pDNI;
		
	RETURN QUERY SELECT * FROM Conductor WHERE DNI = pDNI;
END;
$$
LANGUAGE 'plpgsql';
