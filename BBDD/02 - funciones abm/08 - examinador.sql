-- FUNCIONES EXAMINADOR


CREATE OR REPLACE FUNCTION AltaExaminador(
	pUsuarioNombre VARCHAR
) 
RETURNS SETOF Examinador AS
$$
BEGIN
	INSERT INTO Examinador(activo,usuarioNombre) 
	VALUES (TRUE,pUsuarioNombre);
	
	RETURN QUERY SELECT * FROM Examinador WHERE usuarioNombre = pUsuarioNombre;
END;
$$
LANGUAGE 'plpgsql';

--------------------------
--ACTIVO A FALSE, o ACTIVO A TRUE
CREATE OR REPLACE FUNCTION ModificarExaminador(
	pId INT, 
	pEstado BOOLEAN
) 
RETURNS SETOF Examinador AS
$$
BEGIN
	UPDATE Examinador 
	SET activo=pEstado
	WHERE 
		id = pId;
	RETURN  QUERY SELECT * FROM Examinador WHERE id = pId;
END;
$$
LANGUAGE 'plpgsql';

