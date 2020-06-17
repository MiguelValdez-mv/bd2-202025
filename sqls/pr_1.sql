/* 
Realice un procedimiento almacenado "Crear Viaje" que dado un TOUR (Ruta) y una fecha de inicio, 
realice las operaciones necesarias para crear la estructura del viaje en la Base de Datos.
*/

DELIMITER $$
CREATE PROCEDURE Crear_Viaje(IN idTour INT, IN fechaInicioViaje DATE)
BEGIN
    declare new_id_viaje int;

    /* Obtenemos el ultimo 1 obtenido en la tabla viaje */
    set new_id_viaje = ( select id_viaje from viaje
    order by id_viaje desc
    limit 1) + 1;
       
    /* Insertamos los datos obtenidos por parametros en la tabla Viajes*/
    INSERT INTO viaje (id_viaje,id_tour,fechainicio,fechafin) VALUES (new_id_viaje, idTour, fechaInicioViaje, NULL);
    
END$$
DELIMITER ;