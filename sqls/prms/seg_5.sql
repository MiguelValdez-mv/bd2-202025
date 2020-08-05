/* Cree un nuevo usuario llamado “sitio_web”, y otórguele permisos de lectura sobre las tres 
bases de datos, y permisos de escritura sobre la BD número 3 siempre y cuando su conexión se 
realice desde el equipo “serverweb”. */

/* creamos el usuario */
CREATE USER IF NOT EXISTS 'sitio_web'@'%' identified by 'password';

/* privilegios de lectura */
grant select on db_1.* to 'sitio_web'@'%' identified by 'password';
grant select on db_2.* to 'sitio_web'@'%' identified by 'password';
grant select on db_3.* to 'sitio_web'@'%' identified by 'password';

/* permisos de escritura desde equipo serverweb */
GRANT INSERT ON db3.* TO 'sitio_web'@'serverweb';
