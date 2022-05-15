-- FUNCIONES TIPOUSUARIO

CREATE OR REPLACE FUNCTION AltaTipoUsuario(
	pTipo VARCHAR --administrador,examinador,administrativo,etc.
) 
RETURNS SETOF TipoUsuario AS
$$
BEGIN
	INSERT INTO TipoUsuario(tipo) 
	VALUES (pTipo); 
	
	RETURN QUERY SELECT * FROM TipoUsuario WHERE tipo = pTipo;
END;
$$
LANGUAGE 'plpgsql';

-----------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION ModificarTipoUsuario(
	pId INT, --idTipoUsuario
	pTipo VARCHAR 
) 
RETURNS SETOF TipoUsuario AS
$$
BEGIN
	UPDATE TipoUsuario
	SET tipo=pTipo
	WHERE id=pId;
	
	RETURN QUERY SELECT * FROM TipoUsuario WHERE id = pId;
END;
$$
LANGUAGE 'plpgsql';