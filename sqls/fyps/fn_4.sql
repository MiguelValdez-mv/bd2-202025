/* 
Realice una función almacenada que indique si un tour es apto para niños.

Más del 50% de los hoteles son categoría familiar. -> 100%
Dura entre 4 y 8 días. -> 6 dias
Incluye menos de 5 ciudades. -> 1 ciudad
Menos del 20% de las actividades son museos.

*/


DELIMITER $$
CREATE FUNCTION Tour_Apto_Niños(idTour int) RETURNS BOOLEAN
BEGIN
    declare cant_hoteles_familiares bigint;
    declare cant_total_categorias bigint;
    declare duracion_tour bigint;
    declare cant_ciudades  bigint;
    declare cant_act_museos bigint;
    declare cant_act_tot bigint;


    /* Contamos cuantos hoteles del tour dado son Familiares*/
    select count(hotel.categoria) into cant_hoteles_familiares from hotel, hotel_x_viaje_x_tour
    where hotel.categoria = 'Familiar' 
    and hotel.id = hotel_x_viaje_x_tour.id_hotel
    and  hotel_x_viaje_x_tour.id_tour = idTour;

    /* Contamos la cantidad de hoteles con sus respectivas categorias*/
    select count(hotel.categoria) into cant_total_categorias from hotel, hotel_x_viaje_x_tour
    where hotel.id = hotel_x_viaje_x_tour.id_hotel
    and  hotel_x_viaje_x_tour.id_tour = idTour;

    /* Hallamos la duración del tour especificado*/
    select dias_duracion into duracion_tour from tour
    where id = idTour;

    /* cantidad de ciudades del tour indicado */
    select count(distinct punto_ruta.ciudad) into cant_ciudades from punto_ruta, punto_ruta_x_tour 
    where punto_ruta.id = punto_ruta_x_tour.id_pto_ruta
    and punto_ruta_x_tour.id_tour = idTour;

    /* Hallamos la cantidad de actividades de tipo museo del tour dado*/
    select count(actividades.tipo_actividad) into cant_act_museos from actividades
    where actividades.id_tour = idTour and
    actividades.tipo_actividad = 'Museo';

    /* Hallamos la cantidad de actividades del tour dado*/
    select count(actividades.tipo_actividad) into cant_act_tot from actividades
    where actividades.id_tour = idTour; 

    RETURN IF(((cant_hoteles_familiares/cant_total_categorias)*100) > 50,

        IF(duracion_tour >= 4 AND duracion_tour <=8,

            IF(cant_ciudades < 5,

                IF(((cant_act_museos/cant_act_tot )*100) < 20, 
                  TRUE
                ,FALSE )
            ,FALSE)
        ,FALSE)
    ,FALSE);
END $$
DELIMITER ; 
