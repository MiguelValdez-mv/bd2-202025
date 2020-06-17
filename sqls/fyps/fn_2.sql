/* Realice una función almacenada que dado un tour devuelva la cantidad de ciudades por las que pasa */

/*------ Ejemplo usando mysql ------*/
DELIMITER $$
CREATE FUNCTION Ciudades_Tour(idTour int) RETURNS bigint
BEGIN
    DECLARE num_ciudades bigint;
    select count(distinct punto_ruta.ciudad) into num_ciudades from punto_ruta_x_tour,punto_ruta 
    where punto_ruta_x_tour.id_tour = idTour and
    punto_ruta_x_tour.id_pto_ruta = punto_ruta.id;

    return num_ciudades;
END$$
DELIMITER



/*------ Ejemplo usando plpgsql ------*/
CREATE OR REPLACE  FUNCTION Ciudades_Tour(idTour int) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
DECLARE
    num_ciudades bigint;
BEGIN
    select count (distinct punto_ruta.ciudad) into num_ciudades from punto_ruta_x_tour,punto_ruta 
    where punto_ruta_x_tour.id_tour = idTour and
    punto_ruta_x_tour.id_pto_ruta = punto_ruta.id;

    return num_ciudades;
END
$$;

