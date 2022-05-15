-- FUNCIONES EXAMINADOR

CREATE OR REPLACE FUNCTION AltaExaminador(
	pUsuarioNombre VARCHAR 
) 
RETURNS SETOF Examinador AS
$$
BEGIN
	INSERT INTO Examinador(
	activo, usuarioNombre)
	VALUES (TRUE, pUsuarioNombre);
	
	RETURN QUERY SELECT * FROM Examinador WHERE usuarioNombre = pUsuarioNombre;
END;
$$
LANGUAGE 'plpgsql';

-----------------------------------------------------------------------------
--ACTIVO SI O NO
CREATE OR REPLACE FUNCTION ModificacionExaminador(
	pUsuarioNombre VARCHAR,
	pActivo BOOLEAN
) 
RETURNS SETOF Examinador AS
$$
BEGIN
	UPDATE Examinador
	SET activo=pActivo
	WHERE usuarioNombre=pUsuarioNombre;
	
	RETURN QUERY SELECT * FROM Examinador WHERE id = pId;
END;
$$
LANGUAGE 'plpgsql';