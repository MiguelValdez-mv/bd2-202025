/*
Cree un procedimiento almacenado que marque en un campo de la tabla clientes, a los que sean considerados 
"clientes frecuentes" (los que han tomado más de tres paquetes en los últimos 365 días)

*/


DELIMITER $$
CREATE PROCEDURE cliente_frecuente()
BEGIN
    
    update cliente inner join cliente_x_viaje_x_tour on cliente.cedula = cliente_x_viaje_x_tour.cedula
    set es_frecuente = IF(      
        (
            select count(*) from cliente, cliente_x_viaje_x_tour
            where cliente.cedula = cliente_x_viaje_x_tour.cedula
            and YEAR(NOW()) - YEAR(cliente_x_viaje_x_tour.fecha_reserva) <= 1
        ) > 2, true, false )
    where cliente.cedula = cliente_x_viaje_x_tour.cedula;
   
END $$
DELIMITER ;