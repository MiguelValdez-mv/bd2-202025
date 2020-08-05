/* Cree las consultas necesarias para que cada uno de los sea administrador total de una de 
las bases de datos y no tenga acceso a las otras dos. */

grant all privileges on db_1.* to 'user_1'@'%' identified by 'password';
grant all privileges on db_2.* to 'user_2'@'%' identified by 'password';
grant all privileges on db_3.* to 'user_3'@'%' identified by 'password';