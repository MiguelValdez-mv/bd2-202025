/*
Cree un procedimiento almacenado que marque en un campo de la tabla clientes, a los que sean considerados 
"clientes frecuentes" (los que han tomado más de tres paquetes en los últimos 365 días)

*/


DELIMITER $$
CREATE PROCEDURE cliente_frecuente()
BEGIN
    
    update cliente actual
    set actual.es_frecuente = if( (select count(*) from cliente,cliente_x_viaje_x_tour
                                where cliente.cedula = cliente_x_viaje_x_tour.cedula
                                and actual.cedula = cliente.cedula
                                and cliente_x_viaje_x_tour.fecha_reserva > NOW() - interval 1 year) >=3,
                                true,
                                false 
                            );
END $$
DELIMITER ;