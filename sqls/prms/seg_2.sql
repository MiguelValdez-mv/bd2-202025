/* Cree tres usuarios (Enumerados 1, 2 y 3) */

CREATE USER IF NOT EXISTS 'user_1'@'%' identified by 'password',
						  'user_2'@'%' identified by 'password',
					      'user_3'@'%' identified by 'password';