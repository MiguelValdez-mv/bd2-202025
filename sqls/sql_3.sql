SELECT max(Consulta.Museos) from (
SELECT tiene.id_tour as Tour, count(tiene.id_pto_ruta) as Museos from tiene,Pto_Ruta 
where Pto_Ruta.tipo_ruta="Museo" AND
Pto_Ruta.id_pto_ruta=tiene.id_pto_ruta
group by tiene.id_tour
) as Consulta