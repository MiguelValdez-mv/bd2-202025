SELECT Hotel.id_pto_Ruta
FROM Hotel, Pto_Ruta
WHERE Pto_Ruta.id_pto_ruta = Hotel.id_pto_Ruta
GROUP BY Hotel.id_pto_Ruta
HAVING COUNT(*) >= 2