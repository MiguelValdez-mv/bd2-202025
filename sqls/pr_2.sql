/* 
    Cree un procedimiento almacenado que registre en la tabla "top10" los últimos 10 clientes que 
    han comprado un tour.
*/


DELIMITER $$
CREATE PROCEDURE obtener_top_10()
BEGIN
    

    INSERT INTO top10( id_reserva, cedula)
    select  id_reserva, cedula from cliente_x_viaje_x_tour
    order by id_reserva desc
    limit 10;

    /* En ese caso de ordena por id_reserva porque este es autoincrementable*/

END $$
DELIMITER ;