SELECT count(tiene.id_tour) from Pto_Ruta,tiene WHERE
Pto_Ruta.id_pto_ruta = tiene.id_pto_ruta AND
Pto_Ruta.Ciudad="Roma" AND
tiene.id_tour NOT IN (SELECT hace.id_tour FROM hace)
