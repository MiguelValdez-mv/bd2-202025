/* Realice una función que retorne el número de clientes que tienen reserva en un tour (por id) */


/*------ Ejemplo usando mysql ------*/
DELIMITER $$
CREATE FUNCTION Clientes_en_Reserva(idTour int) RETURNS bigint
BEGIN
    declare num_clientes bigint;
     select count(cliente_x_viaje_x_tour.cedula) into num_clientes from cliente_x_viaje_x_tour 
    /* Comparamos si el id enviado por parametro corresponde con el de la tabla*/
    where cliente_x_viaje_x_tour.id_tour = idTour;

    RETURN num_clientes;
END $$
DELIMITER ;


