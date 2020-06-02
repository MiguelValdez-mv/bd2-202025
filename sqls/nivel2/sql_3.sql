select tour.id from cliente, cliente_x_viaje_x_tour
cliente.edad >= 18 
and cliente.cedula = cliente_x_viaje_x_tour.cedula
and cliente_x_viaje_x_tour.id_tour = tour.id