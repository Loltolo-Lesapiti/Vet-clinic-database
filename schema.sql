-- SQL to create animals table inside the Vet-clinic-database create as CREATE DATABASE vet-clinic
CREATE TABLE animals(
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(50),
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL,
    species VARCHAR(50),
    PRIMARY KEY(id)
);


