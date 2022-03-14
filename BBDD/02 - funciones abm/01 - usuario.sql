-- FUNCIONES USUARIO

-- Id SERIAL PRIMARY KEY,
-- 	Activo BOOLEAN NOT NULL,
-- 	NombreReal VARCHAR NOT NULL,
-- 	NombreUsuario VARCHAR NOT NULL, --nombre para login
-- 	Contrasenia VARCHAR NOT NULL,
-- 	TipoUsuario VARCHAR NOT NULL	--administrador,administrativo,examinador

CREATE OR REPLACE FUNCTION AltaUsuario(
	pNombreReal VARCHAR, 
	pNombreUsuario VARCHAR, 
	pContrasenia VARCHAR, 
	pTipoUsuario VARCHAR
) 
RETURNS SETOF Usuario AS
$$
DECLARE mId INT;
BEGIN
	INSERT INTO Usuario(Activo, NombreReal, NombreUsuario, Contrasenia, TipoUsuario) 
	VALUES (TRUE,pNombreReal, pNombreUsuario, pContrasenia, pTipoUsuario) 
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
	pTipoUsuario VARCHAR
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
		TipoUsuario = pTipoUsuario 
	WHERE 
		Id = pId 
	RETURNING Id INTO mId;
	
	RETURN QUERY SELECT * FROM Usuario WHERE Id = mId;
END;
$$
LANGUAGE 'plpgsql';
