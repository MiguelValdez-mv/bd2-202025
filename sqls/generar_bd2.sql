/*
 * Fecha Actual: 17 Junio del 2020
 *  Hecho por: Miguel Valdez C.I 26562643S
 */


CREATE TABLE cliente (
  cedula INT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  edad INT NOT NULL
);

CREATE TABLE top10(
  cedula INT,
  id_reserva int AUTO_INCREMENT PRIMARY KEY
);


CREATE TABLE viaje (
  id_viaje INT,
  id_tour INT,
  fechaInicio DATE NOT NULL,
  fechaFin DATE,
  PRIMARY KEY (id_viaje, id_tour)
);

CREATE TABLE tour (
  id INT PRIMARY KEY,
  finalidad VARCHAR(50) NOT NULL,
  dias_duracion INT NOT NULL
);


CREATE TABLE punto_ruta (
  id INT PRIMARY KEY,
  tipo_visita VARCHAR(25) NOT NULL,
  tipo_ruta VARCHAR(50) NOT NULL,
  ciudad VARCHAR(50) NOT NULL
);


CREATE TABLE hotel (
  id INT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  ubicacion VARCHAR(50) NOT NULL,
  categoria VARCHAR(50) NOT NULL,
  id_pto_ruta INT NOT NULL
);


CREATE TABLE punto_ruta_x_tour (
  id_pto_ruta INT,
  id_tour INT,
  PRIMARY KEY (id_pto_ruta, id_tour)
);

CREATE TABLE cliente_x_viaje_x_tour (
  cedula INT,
  id_viaje INT,
  id_tour INT,
  id_reserva int AUTO_INCREMENT,
  PRIMARY KEY (id_reserva)
);

CREATE TABLE cliente_x_hotel (
  cedula INT,
  id_hotel INT,
  PRIMARY KEY (cedula, id_hotel)
);

CREATE TABLE hotel_x_viaje_x_tour (
  id_hotel INT,
  id_viaje INT,
  id_tour INT,
  PRIMARY KEY (id_hotel, id_viaje, id_tour)
);

CREATE TABLE actividades (
  id_tour INT,
  tipo_actividad VARCHAR(50),
  descripcion VARCHAR(50),
    
  PRIMARY KEY (id_tour,tipo_actividad,descripcion)
);




ALTER TABLE viaje ADD FOREIGN KEY (id_tour) REFERENCES tour (id);

ALTER TABLE cliente_x_viaje_x_tour ADD FOREIGN KEY (cedula) REFERENCES cliente (cedula);

ALTER TABLE cliente_x_viaje_x_tour ADD FOREIGN KEY (id_viaje, id_tour) REFERENCES viaje (id_viaje, id_tour);

ALTER TABLE cliente_x_hotel ADD FOREIGN KEY (cedula) REFERENCES cliente (cedula);

ALTER TABLE cliente_x_hotel ADD FOREIGN KEY (id_hotel) REFERENCES hotel (id);

ALTER TABLE hotel_x_viaje_x_tour ADD FOREIGN KEY (id_hotel) REFERENCES hotel (id);

ALTER TABLE hotel_x_viaje_x_tour ADD FOREIGN KEY (id_viaje,id_tour) REFERENCES viaje (id_viaje,id_tour);

ALTER TABLE hotel ADD FOREIGN KEY (id_pto_ruta) REFERENCES punto_ruta (id);

ALTER TABLE punto_ruta_x_tour ADD FOREIGN KEY (id_pto_ruta) REFERENCES punto_ruta (id);

ALTER TABLE punto_ruta_x_tour ADD FOREIGN KEY (id_tour) REFERENCES tour (id);

ALTER TABLE actividades ADD FOREIGN KEY (id_tour) REFERENCES tour (id);