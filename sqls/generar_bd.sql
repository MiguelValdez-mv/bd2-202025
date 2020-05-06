CREATE TABLE "Pto_Ruta" (
  "id_pto_ruta" INT PRIMARY KEY,
  "tipo_visita" VARCHAR(25) NOT NULL,
  "tipo_ruta" VARCHAR(50) NOT NULL
);

CREATE TABLE "Tour" (
  "id_tour" INT PRIMARY KEY,
  "motivo" VARCHAR(50) NOT NULL
);

CREATE TABLE "Viaje" (
  "id_viaje" INT,
  "id_tour" INT,
  "fecha" VARCHAR(50) NOT NULL,
  PRIMARY KEY ("id_viaje", "id_tour")
);

CREATE TABLE "Cliente" (
  "cedula" INT PRIMARY KEY,
  "nombre" VARCHAR(50) NOT NULL,
  "apellido" VARCHAR(50) NOT NULL
);

CREATE TABLE "Hotel" (
  "id_hotel" INT PRIMARY KEY,
  "nombre" VARCHAR(50) NOT NULL,
  "ubicacion" VARCHAR(50) NOT NULL
);

CREATE TABLE "tiene" (
  "id_pto_ruta" INT,
  "id_tour" INT,
  PRIMARY KEY ("id_pto_ruta", "id_tour")
);

CREATE TABLE "hace" (
  "cedula" INT,
  "id_viaje" INT,
  "id_tour" INT,
  PRIMARY KEY ("cedula", "id_viaje", "id_tour")
);

CREATE TABLE "Es_alojado_en" (
  "cedula" INT,
  "id_hotel" INT,
  PRIMARY KEY ("cedula", "id_hotel")
);

CREATE TABLE "Es_asignado_a" (
  "id_hotel" INT,
  "id_viaje" INT,
  "id_tour" INT,
  PRIMARY KEY ("id_hotel", "id_viaje", "id_tour")
);

ALTER TABLE "Viaje" ADD FOREIGN KEY ("id_tour") REFERENCES "Tour" ("id_tour");

ALTER TABLE "tiene" ADD FOREIGN KEY ("id_pto_ruta") REFERENCES "Pto_Ruta" ("id_pto_ruta");

ALTER TABLE "tiene" ADD FOREIGN KEY ("id_tour") REFERENCES "Tour" ("id_tour");

ALTER TABLE "hace" ADD FOREIGN KEY ("cedula") REFERENCES "Cliente" ("cedula");

ALTER TABLE "hace" ADD FOREIGN KEY ("id_viaje") REFERENCES "Viaje" ("id_viaje");

ALTER TABLE "hace" ADD FOREIGN KEY ("id_tour") REFERENCES "Viaje" ("id_tour");

ALTER TABLE "Es_alojado_en" ADD FOREIGN KEY ("cedula") REFERENCES "Cliente" ("cedula");

ALTER TABLE "Es_alojado_en" ADD FOREIGN KEY ("id_hotel") REFERENCES "Hotel" ("id_hotel");

ALTER TABLE "Es_asignado_a" ADD FOREIGN KEY ("id_hotel") REFERENCES "Hotel" ("id_hotel");

ALTER TABLE "Es_asignado_a" ADD FOREIGN KEY ("id_viaje") REFERENCES "Viaje" ("id_viaje");

ALTER TABLE "Es_asignado_a" ADD FOREIGN KEY ("id_tour") REFERENCES "Viaje" ("id_tour");

