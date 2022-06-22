--TRIGGERS

--***Al generar un nuevo PeriodoUtilizable, 1ero. si existe un PeriodoUtilizable para ese equipo, que lo de de baja, 
--y que se actualice en Equipo el nroActual.***

CREATE OR REPLACE FUNCTION ActualizarNroActualEquipoInsertPeriodoUtilizable() 
RETURNS TRIGGER AS
$$
DECLARE mId INT;
BEGIN
	--Baja de PeriodoUtilizable si está activo para este equipo
	SELECT MAX(id)INTO mId FROM PeriodoUtilizable WHERE (equipoId=NEW.equipoId) AND (activo=TRUE);
	IF (mId IS NOT NULL) THEN --is not null?
		PERFORM BajaPeriodoUtilizable(mId); 
	END IF;
	
	--Actualizar en Equipo el nroActual
	UPDATE Equipo
	SET nroActual= NEW.nroIngreso
	WHERE id=NEW.equipoId;
	
	RETURN NEW;
	
END;
$$
LANGUAGE 'plpgsql';

CREATE TRIGGER InsertPeriodoUtilizable BEFORE INSERT ON PeriodoUtilizable 
FOR EACH ROW
EXECUTE PROCEDURE ActualizarNroActualEquipoInsertPeriodoUtilizable();



--***Al generar una nueva Prueba, actualizar el nroActual(nroActual+1) en el Equipo correspondiente.***

CREATE OR REPLACE FUNCTION ActualizarNroActualEquipoInsertPrueba()
RETURNS TRIGGER AS
$$
DECLARE mEquipoId INT;
BEGIN
	SELECT equipoId INTO mEquipoId FROM Prestamo WHERE id=NEW.prestamoId;
	UPDATE Equipo
	SET nroActual=nroActual+1
	WHERE id=mEquipoId;
	
	RETURN NEW;
END;
$$
LANGUAGE 'plpgsql';

CREATE TRIGGER InsertPrueba AFTER INSERT ON Prueba 
FOR EACH ROW
EXECUTE PROCEDURE ActualizarNroActualEquipoInsertPrueba();


--***Ejemplo de normalizar VARCHARS***
--***Al ingresar un nuevo Dominio, antes pongo todos los datos: patente y descripcion en minúsculas.***

CREATE OR REPLACE FUNCTION MinusculasDominioInsertDominio()
RETURNS TRIGGER AS
$$
BEGIN
	NEW.patente=LOWER(NEW.patente);
	NEW.descripcion=LOWER(NEW.descripcion);
	
	RETURN NEW;
END;
$$
LANGUAGE 'plpgsql';


CREATE TRIGGER InsertDominio BEFORE INSERT ON Dominio 
FOR EACH ROW
EXECUTE PROCEDURE MinusculasDominioInsertDominio();



--***Al dar de alta un Usuario, le de alta un Examinador***

-- CREATE OR REPLACE FUNCTION AltaUsuarioInsertExaminador()
-- RETURNS TRIGGER AS
-- $$
-- BEGIN	
-- 	PERFORM AltaExaminador(NEW.nombreUsuario);	
-- 	RETURN NEW;
-- END;
-- $$
-- LANGUAGE 'plpgsql';

-- CREATE TRIGGER InsertUsuario AFTER INSERT ON Usuario
-- FOR EACH ROW
-- EXECUTE PROCEDURE AltaUsuarioInsertExaminador();


--***al dar de baja un usuario, dar de baja el examinador
CREATE OR REPLACE FUNCTION BajaUsuarioUpdateExaminador()
RETURNS TRIGGER AS
$$
BEGIN	
	IF (NEW.activo=false) THEN
		PERFORM ModificacionExaminador(NEW.nombreusuario, false);
	END IF;
	
	RETURN NEW;
END;
$$
LANGUAGE 'plpgsql';


CREATE TRIGGER UpdateUsuario AFTER UPDATE ON Usuario
FOR EACH ROW
EXECUTE PROCEDURE BajaUsuarioUpdateExaminador();

--***LO QUE BORRE***
--Después de insert or update un Usuario, donde tipoUsuario es 3, que de de alta o ponga en activo su examinador.

CREATE OR REPLACE FUNCTION InsertarUsuarioInsertUpdateExaminador()
RETURNS TRIGGER AS
$$
DECLARE 
	mId INT;

BEGIN
	IF (NEW.tipoUsuarioId=3)THEN
		SELECT id INTO mId FROM Examinador WHERE usuarioNombre=NEW.nombreUsuario;
			IF (mId IS NOT NULL) THEN
				PERFORM ModificacionExaminador(NEW.nombreusuario, TRUE);
			ELSE
				PERFORM AltaExaminador(NEW.nombreUsuario); 
			END IF;
	END IF;
	
	RETURN NEW;
END;
$$
LANGUAGE 'plpgsql';

CREATE TRIGGER UpdateExaminador AFTER INSERT OR UPDATE ON Usuario
FOR EACH ROW
EXECUTE PROCEDURE InsertarUsuarioInsertUpdateExaminador();


