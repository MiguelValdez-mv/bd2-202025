/*
Cree un disparador que al momento en que se carga o modifica un tour, verifique si el mismo es para 
niños (utilice la función creada en la práctica 6) y lo marque en un campo de la tabla "para_ninos" 
como verdadero.
*/

/* TRIGGER INSERT */
DELIMITER $$
CREATE OR REPLACE TRIGGER marcar_tour_niño_insert
BEFORE INSERT ON tour
FOR EACH ROW  
BEGIN  
   SET NEW.tour_niños = Tour_Apto_Niños(NEW.id);
END $$
DELIMITER ;

/* TRIGGER UPDATE */
DELIMITER $$
CREATE OR REPLACE TRIGGER marcar_tour_niño_update
BEFORE UPDATE ON tour
FOR EACH ROW  
BEGIN  
   SET NEW.tour_niños = Tour_Apto_Niños(NEW.id);
END $$
DELIMITER ;
