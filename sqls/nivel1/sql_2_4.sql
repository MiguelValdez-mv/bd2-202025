SELECT hotel.id_pto_Ruta
FROM hotel, punto_ruta
WHERE punto_ruta.id = hotel.id_pto_Ruta
GROUP BY hotel.id_pto_Ruta
HAVING COUNT(*) >= 2