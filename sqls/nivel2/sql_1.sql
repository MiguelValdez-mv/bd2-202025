
select punto_ruta_x_tour.id_tour as Tour,count(punto_ruta_x_tour.id_pto_ruta) as Museos
from punto_ruta join punto_ruta_x_tour 
on punto_ruta.id = punto_ruta_x_tour.id_pto_ruta
where punto_ruta.tipo_ruta = 'Museo'
group by punto_ruta_x_tour.id_tour
order by count(punto_ruta_x_tour.id_pto_ruta) desc
limit 1

