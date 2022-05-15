-- FUNCIONES EQUIPO


CREATE OR REPLACE FUNCTION AltaEquipo(
	pNombre VARCHAR
) 
RETURNS SETOF Equipo AS
$$
BEGIN
	INSERT INTO Equipo(activo, nombre) 
	VALUES (TRUE,pNombre); 
	
	RETURN QUERY SELECT * FROM Equipo WHERE nombre = pNombre;
END;
$$
LANGUAGE 'plpgsql';

--------------------------
--de activo a pasivo
CREATE OR REPLACE FUNCTION BajaEquipo(pId INT) 
RETURNS SETOF Equipo AS
$$
BEGIN
	UPDATE Equipo 
	SET activo=FALSE
	WHERE 
		id = pId;
	RETURN  QUERY SELECT * FROM Equipo WHERE id = pId;
END;
$$
LANGUAGE 'plpgsql';

--------------------------
--si se escribió mal el nombre
CREATE OR REPLACE FUNCTION ModificarEquipo(
	pId INT,
	pNombre VARCHAR
) 
RETURNS SETOF Equipo AS
$$
BEGIN
	UPDATE Equipo 
	SET 
		nombre = pNombre
	WHERE 
		id = pId;
		
	RETURN QUERY SELECT * FROM Equipo WHERE id = pId;
END;
$$
LANGUAGE 'plpgsql';
