-- FUNCIONES USUARIO


CREATE OR REPLACE FUNCTION AltaUsuario(
	pNombreUsuario VARCHAR, --del login
	pContrasenia VARCHAR, --del login
	pNombreReal VARCHAR, --del dni
	pTipoUsuarioId INT
) 
RETURNS SETOF Usuario AS
$$
BEGIN
	INSERT INTO Usuario(activo, nombreReal, nombreUsuario, contrasenia, tipoUsuarioId) 
	VALUES (TRUE,pNombreReal, pNombreUsuario, pContrasenia, pTipoUsuarioId); 
	
	RETURN QUERY SELECT * FROM Usuario WHERE NombreUsuario = pNombreUsuario;
END;
$$
LANGUAGE 'plpgsql';

--------------------------

CREATE OR REPLACE FUNCTION BajaUsuario(pNombreUsuario VARCHAR) 
RETURNS SETOF Usuario AS
$$
BEGIN
	UPDATE Usuario 
	SET activo=FALSE
	WHERE 
		nombreUsuario = pNombreUsuario;
	RETURN  QUERY SELECT * FROM Usuario WHERE nombreUsuario = pNombreUsuario;
END;
$$
LANGUAGE 'plpgsql';

--------------------------

CREATE OR REPLACE FUNCTION ModificarUsuario(
	pNombreUsuario VARCHAR,  
	pContrasenia VARCHAR,
	pNombreReal VARCHAR, 
	pTipoUsuarioId INT
) 
RETURNS SETOF Usuario AS
$$
BEGIN
	UPDATE Usuario 
	SET 
		nombreUsuario = pNombreUsuario,
		contrasenia = pContrasenia, 
		nombreReal = pNombreReal, 
		tipoUsuarioId = pTipoUsuarioId 
	WHERE 
		nombreUsuario = pNombreUsuario;
		
	RETURN QUERY SELECT * FROM Usuario WHERE nombreUsuario = pNombreUsuario;
END;
$$
LANGUAGE 'plpgsql';
