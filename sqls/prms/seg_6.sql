/* Cree tres tablas (Enumeradas 1, 2 y 3) en la BD No. 1. Otórguele permisos de escritura 
sobre esa tabla a cada uno de los usuarios (1, 2 y 3) sobre su respectiva tabla, y de 
lectura sobre las otras dos.*/


/* creamos las tablas sobre la BD 1*/
CREATE TABLE db_1.table_1
(
    atributo int(5) not null
);

CREATE TABLE db_1.table_2
(
    atributo int(5) not null
);

CREATE TABLE db_1.table_3
(
    atributo int(5) not null
);

/* usuario 1 */
GRANT INSERT ON db_1.table_1 TO 'user_1'@'%';
GRANT SELECT ON db_1.table_2 TO 'user_1'@'%';
GRANT SELECT ON db_1.table_3 TO 'user_1'@'%';

/* usuario 2 */
GRANT INSERT ON db_1.table_2 TO 'user_2'@'%';
GRANT SELECT ON db_1.table_1 TO 'user_2'@'%';
GRANT SELECT ON db_1.table_3 TO 'user_2'@'%';

/* usuario 3 */
GRANT INSERT ON db_1.table_3 TO 'user_3'@'%';
GRANT SELECT ON db_1.table_1 TO 'user_3'@'%';
GRANT SELECT ON db_1.table_2 TO 'user_3'@'%';