/* Cree las consultas necesarias para que el usuario 2 pueda realizar consultas sobre las 
bases de datos 1 y 3. */

grant select on db_1.* to 'user_2'@'%' identified by 'password';
grant select on db_3.* to 'user_2'@'%' identified by 'password';



