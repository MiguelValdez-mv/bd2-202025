DELIMITER $$
CREATE PROCEDURE Crear_Viaje_Trans(IN idTour INT, IN fechaInicioViaje DATE)
BEGIN
   
    START TRANSACTION;
    INSERT INTO viaje (id_tour,fechainicio,fechafin) VALUES (idTour, fechaInicioViaje, NULL);
    COMMIT;
    
END $$
DELIMITER ;
