
select tabla1.Tour from 
    (
        /* Tours activos de mayores de edad*/
        select viaje.id_tour as Tour from

        /* Primero tendriamos que ir a la tabla clientes para saber la edad, luego ir a la tabla  cliente_x_viaje_x_tour
        para saber los tours que esos clientes han reservado*/
        cliente join cliente_x_viaje_x_tour on cliente.cedula = cliente_x_viaje_x_tour.cedula

        /* luego vamos a la tabla viaje para obtener la fecha*/
        join viaje on cliente_x_viaje_x_tour.id_tour = viaje.id_tour and cliente_x_viaje_x_tour.id_viaje = viaje.id_viaje

        /* Queremos que el cliente sea mayor de edad*/
        where cliente.edad >= 18 and 

        /* Además el tour debe de estar "activo" */
        viaje.fechaInicio > CURRENT_DATE
    ) tabla1
left join
    (
        /* Tours activos de mayores de edad*/
        select viaje.id_tour as Tour from
        cliente join cliente_x_viaje_x_tour on cliente.cedula = cliente_x_viaje_x_tour.cedula
        join viaje on cliente_x_viaje_x_tour.id_tour = viaje.id_tour and cliente_x_viaje_x_tour.id_viaje = viaje.id_viaje
        where cliente.edad < 18 and 
        viaje.fechaInicio > CURRENT_DATE
    ) tabla2
ON tabla1.Tour = tabla2.Tour

/* Tomamos los no comunes de la primera tabla*/
where tabla2.Tour is null