/* Realice una función almacenada que dado un tour y un tipo de actividad, retorne el porcentaje de esa 
actividad en relación al número total de actividades del tour. */

DELIMITER $$
CREATE FUNCTION Porcentaje_Actividad(idTour int, tipoActividad VARCHAR(50)) RETURNS FLOAT(7,4)
BEGIN
    declare cant_act_indicada bigint;
    cant_total_acts bigint;

    /* Hallamos el numero de aparción total de la actividad*/
    select count(tipo_actividad) into cant_act_indicada from actividades 
    where id_tour = idTour and 
    tipo_actividad = tipoActividad;
    
    /* Hallamos el numero actividades disponibles en dicho tour*/
    select count(tipo_actividad) into cant_total_acts from actividades 
    where actividades.id_tour = idTour;

    RETURN (cant_act_indicada / cant_total_acts) * 100;
END $$
DELIMITER ;
