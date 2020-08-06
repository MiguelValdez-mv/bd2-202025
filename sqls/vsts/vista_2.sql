/* Realice una vista de solo lectura en la que se muestren los corredores de la 
categoría libre. */

/* creamos el usuario que tendra solo permisos de lectura en el view a crear */
CREATE USER IF NOT EXISTS 'view_user'@'%' identified by 'password';

/* le damos los respectivos permisos */
GRANT SELECT,CREATE VIEW ON ods_db.* TO 'view_user'@'%';

CREATE 
    DEFINER = 'view_user'@'%'
    SQL SECURITY DEFINER
VIEW Corredores_libres AS
select * from ods_db.corredor where Categoría = 'LI';

/* En este caso estamos creando una vista de solo lectura de forma indirecta, esto es 
creando un usuario con solo permisos de lectura en la bd respectiva */