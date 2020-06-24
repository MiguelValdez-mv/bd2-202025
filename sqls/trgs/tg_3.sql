/*
Cree un disparador que impida que se cree un tour si el mismo no pasa por dos ciudades al menos.
*/

DELIMITER $$
CREATE OR REPLACE TRIGGER impedir_tour
BEFORE INSERT ON viaje
FOR EACH ROW  
BEGIN  
    if (Ciudades_Tour(NEW.id_tour) < 2) then
        signal sqlstate '45000' SET MESSAGE_TEXT = "Error! Este tour no tiene 2 ciudades al menos...";
    end if;
END $$
DELIMITER ;