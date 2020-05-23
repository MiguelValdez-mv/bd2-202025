select hace.cedula, COUNT(Viaje.fecha) from hace, Viaje where
hace.id_viaje = Viaje.id_viaje AND
hace.id_tour = Viaje.id_tour 
GROUP BY hace.cedula
HAVING COUNT(Viaje.fecha) >= 2