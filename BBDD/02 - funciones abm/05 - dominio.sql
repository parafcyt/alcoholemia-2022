-- FUNCIONES DOMINIO


CREATE OR REPLACE FUNCTION AltaDominio(
	pPatente VARCHAR, 
	pDescripcion VARCHAR
) 
RETURNS SETOF Dominio AS
$$
BEGIN
	INSERT INTO Dominio(patente, descripcion) 
	VALUES (pPatente,pDescripcion); 
	
	RETURN QUERY SELECT * FROM Dominio WHERE patente = pPatente;
END;
$$
LANGUAGE 'plpgsql';

--------------------------
--Se borra un dominio sin operaciones, si al dar de alta se escribió mal la patente, sólo tiene permisos el Admin
CREATE OR REPLACE FUNCTION BajaDominio(pPatente VARCHAR) 
RETURNS VARCHAR AS
$$
BEGIN
	DELETE FROM Dominio
	WHERE patente = pPatente
	RETURNING patente;
END;
$$
LANGUAGE 'plpgsql';

--------------------------

CREATE OR REPLACE FUNCTION ModificarDominio(
	pPatente VARCHAR,  
	pDescripcion VARCHAR
) 
RETURNS SETOF Dominio AS
$$
BEGIN
	UPDATE Dominio 
	SET 
		descripcion = pDescripcion
	WHERE 
		patente = pPatente;
		
	RETURN QUERY SELECT * FROM Dominio WHERE patente = pPatente;
END;
$$
LANGUAGE 'plpgsql';
