
/* Nota: esta es una solucion alternativa. La solucion más optima sería creando una tabla temporal
a partir de un select que nos permitiera saber la cantidad de museos que tiene cada tour
y posteriormente hallar el máximo de esa tabla, pero por errores en phpMyAdmin no se pudo implementar dicha
solución*/

select tabla1.* from 
    (/* En este select estamos contando la cantidad de museos que tiene cada tour*/
    select punto_ruta_x_tour.id_tour as Tour,count(punto_ruta_x_tour.id_pto_ruta) as Museos

    /* Obtenemos primero los puntos de ruta para luego ir a la tabla que asocia los pto ruta con los tours*/
    from punto_ruta join punto_ruta_x_tour 
    on punto_ruta.id = punto_ruta_x_tour.id_pto_ruta

    /* Buscamos solo puntos de ruta que sean Museos*/
    where punto_ruta.tipo_ruta = 'Museo'

    /* Agrupamos la sentencia por id de los tour's*/
    group by punto_ruta_x_tour.id_tour) tabla1
join
    (select max(Museos) as maximo from
       (/* Usamos el select anterios para hallar el máximo valor de la tabla*/
        select punto_ruta_x_tour.id_tour as Tour,count(punto_ruta_x_tour.id_pto_ruta) as Museos
        from punto_ruta join punto_ruta_x_tour 
        on punto_ruta.id = punto_ruta_x_tour.id_pto_ruta
        where punto_ruta.tipo_ruta = 'Museo'
        group by punto_ruta_x_tour.id_tour) tour_x_museos) tabla2
ON tabla1.Museos = tabla2.maximo