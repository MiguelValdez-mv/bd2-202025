/* 
    Cree un procedimiento almacenado que registre en la tabla "top10" los últimos 10 clientes que 
    han comprado un tour.
*/


DELIMITER $$
CREATE PROCEDURE obtener_top_10()
BEGIN
    
    /* eliminamos los valores anteriores de la tabla*/
    DELETE FROM top10 WHERE 1;

    INSERT INTO top10(cedula)
    select distinct cedula from cliente_x_viaje_x_tour order by id_reserva desc limit 10;
    
    /* En ese caso de ordena por id_reserva porque este es autoincrementable
    Por otro lado, tomamos los ultimos 10 clientes (distintos) que han reservado*/

END $$
DELIMITER ;



