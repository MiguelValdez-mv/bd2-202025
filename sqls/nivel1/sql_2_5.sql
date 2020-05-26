SELECT count(punto_ruta_x_tour.id_tour) from punto_ruta,punto_ruta_x_tour WHERE
punto_ruta.id = punto_ruta_x_tour.id_pto_ruta AND
punto_ruta.ciudad='Roma' AND
punto_ruta_x_tour.id_tour NOT IN (SELECT cliente_x_viaje_x_tour.id_tour FROM cliente_x_viaje_x_tour)

