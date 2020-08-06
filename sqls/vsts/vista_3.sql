/* Cree una vista donde se tenga un listado de cantidad de corredores por talla. */

CREATE VIEW Corredores_x_talla AS 
select count(*), Talla from ods_db.cálculos group by Talla;

