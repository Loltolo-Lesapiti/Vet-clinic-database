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

--Task 3
CREATE TABLE owners(
    id INT GENERATED ALWAYS AS IDENTITY,
    full_name VARCHAR(50),
    age INT,
    PRIMARY KEY(id)
);
CREATE TABLE species(
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(50),
    age INT,
    PRIMARY KEY(id)
);
ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD COLUMN species_id INT REFERENCES species (id);
ALTER TABLE animals ADD COLUMN owner_id INT REFERENCES owners (id);

-- Task 4
CREATE TABLE vets(
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(50), 
    age INT,
    date_of_graduation DATE,
    PRIMARY KEY(id)
    );

CREATE TABLE specializations(
    vets_id INT REFERENCES vets (id),
    species_id INT REFERENCES species (id)
    );

CREATE TABLE visits(
    vets_id INT REFERENCES vets(id),
    animal_id INT REFERENCES animals(id),
    visit_date DATE
    );
    -- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);
-- Add indexs
CREATE INDEX ON visits (animal_id);
CREATE INDEX ON visits (vets_id);
CREATE INDEX ON owners (email);