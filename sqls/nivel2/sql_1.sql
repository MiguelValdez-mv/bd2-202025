/* Aquí estamos creando una tabla temporal para luego hallar el máximo*/

CREATE TEMP TABLE temporal AS (
	/* En este select estamos contando la cantidad de museos que tiene cada tour*/
	
    select punto_ruta_x_tour.id_tour as Tour,count(punto_ruta_x_tour.id_pto_ruta) as Museos

    /* Obtenemos primero los puntos de ruta para luego ir a la tabla que asocia los pto ruta con los tours*/
    from punto_ruta join punto_ruta_x_tour 
    on punto_ruta.id = punto_ruta_x_tour.id_pto_ruta

    /* Buscamos solo puntos de ruta que sean Museos*/
    where punto_ruta.tipo_ruta = 'Museo'

    /* Agrupamos la sentencia por id de los tour's*/
    group by punto_ruta_x_tour.id_tour
);

/* Sacamos el máximo del resultado obtenido en la tabla temporal*/
select max(Museos) from temporal