/* 
Cree un disparador que cada vez que un cliente reserva o compra un tour, verifique si el mismo es 
cliente frecuente y lo marque en la tabla de cliente como frecuente.
*/

DELIMITER $$
CREATE OR REPLACE TRIGGER marcar_cliente
AFTER INSERT ON cliente_x_viaje_x_tour
FOR EACH ROW  
BEGIN  
   CALL cliente_frecuente();
END $$
DELIMITER ;

/* 
En este caso cada vez que un cliente reserva o compra un tour, el mismo deberá ser registrado
en la tabla cliente_x_viaje_x_tour
*/
