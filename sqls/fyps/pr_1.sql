/* 
Realice un procedimiento almacenado "Crear Viaje" que dado un TOUR (Ruta) y una fecha de inicio, 
realice las operaciones necesarias para crear la estructura del viaje en la Base de Datos.
*/

DELIMITER $$
CREATE PROCEDURE Crear_Viaje(IN idTour INT, IN fechaInicioViaje DATE)
BEGIN
    /* Nota: el id_viaje es autoincrementable, por eso no se toma en cuenta en el insert*/
      
    /* Insertamos los datos obtenidos por parametros en la tabla Viajes*/
    INSERT INTO viaje (id_tour,fechainicio,fechafin) VALUES (idTour, fechaInicioViaje, NULL);
    
END $$
DELIMITER ;


