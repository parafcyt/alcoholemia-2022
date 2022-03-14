-- FUNCIONES USUARIO


CREATE OR REPLACE FUNCTION AltaUsuario(
	pNombreReal VARCHAR, 
	pNombreUsuario VARCHAR, 
	pContrasenia VARCHAR, 
	pIdTipoUsuario INT
) 
RETURNS SETOF Usuario AS
$$
DECLARE mId INT;
BEGIN
	INSERT INTO Usuario(Activo, NombreReal, NombreUsuario, Contrasenia, IdTipoUsuario) 
	VALUES (TRUE,pNombreReal, pNombreUsuario, pContrasenia, pIdTipoUsuario) 
	RETURNING Id INTO mId;
	
	RETURN QUERY SELECT * FROM Usuario WHERE Id = mId;
END;
$$
LANGUAGE 'plpgsql';

--------------------------

CREATE OR REPLACE FUNCTION BajaUsuario(pId INT) 
RETURNS SETOF Usuario AS
$$
DECLARE mId INT;
BEGIN
	UPDATE Usuario 
	SET Activo=FALSE
	WHERE 
		Id = pId 
	RETURNING Id INTO mId;
	
	RETURN  QUERY SELECT * FROM Usuario WHERE Id = mId;
END;
$$
LANGUAGE 'plpgsql';

--------------------------

CREATE OR REPLACE FUNCTION ModificarUsuario(
	pId INT, 
	pNombreReal VARCHAR, 
	pNombreUsuario VARCHAR, 
	pContrasenia VARCHAR, 
	pIdTipoUsuario INT
) 
RETURNS SETOF Usuario AS
$$
DECLARE mId INT;
BEGIN
	UPDATE Usuario 
	SET 
		NombreReal = pNombreReal, 
		NombreUsuario = pNombreUsuario, 
		Contrasenia = pContrasenia, 
		IdTipoUsuario = pIdTipoUsuario 
	WHERE 
		Id = pId 
	RETURNING Id INTO mId;
	
	RETURN QUERY SELECT * FROM Usuario WHERE Id = mId;
END;
$$
LANGUAGE 'plpgsql';
