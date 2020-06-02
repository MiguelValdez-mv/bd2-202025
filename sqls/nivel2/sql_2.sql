SELECT count(punto_ruta_x_tour.id_tour)  from 
punto_ruta join punto_ruta_x_tour on punto_ruta.id = punto_ruta_x_tour.id_pto_ruta
left join cliente_x_viaje_x_tour on punto_ruta_x_tour.id_tour = cliente_x_viaje_x_tour.id_tour  
where punto_ruta.ciudad = 'Roma' 
and cliente_x_viaje_x_tour.id_tour is NULL




