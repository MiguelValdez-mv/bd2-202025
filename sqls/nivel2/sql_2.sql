/* Select distinct para evitar valores repetidos*/
select distinct punto_ruta_x_tour.id_tour from

/* Obtenemos primeramente los id's de los puntos de ruta para luego pasar a la tabla que asocia los puntos
de ruta con los tours*/
punto_ruta join punto_ruta_x_tour on punto_ruta.id = punto_ruta_x_tour.id_pto_ruta

/* Según el resultado obtenido en Join anterior obtenemos los tours que tienen asociado a un cliente*/
left join cliente_x_viaje_x_tour on punto_ruta_x_tour.id_tour = cliente_x_viaje_x_tour.id_tour

/* Buscamos solamente los tours que pasen por roma*/
where punto_ruta.ciudad = 'Roma'

/* Decimos is NULL porque no queremos que en este caso los tours NO tengan asociado un cliente*/
and cliente_x_viaje_x_tour.id_tour is NULL











