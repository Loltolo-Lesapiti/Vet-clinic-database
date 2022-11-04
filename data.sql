-- SQL code to insert data into the animals table
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Agumon' ,'2020-02-03', 0, true, 10.23);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Gabumon', '2018-11-15', 2, true, 8);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Pikachu', '2021-01-07', 1, false, 15.04);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Devimon', '2017-05-12', 5, true, 11);


-- Task 2 data insertions
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Charmander' ,'2020-02-08', 0, false, 11);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Plantmon' ,'2021-11-15', 2, true, 5.7);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Squirtle' ,'1993-04-02', 3, false, 12.13);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Angemon' ,'2005-06-12', 1, true, 45);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Boarmon' ,'2005-06-07', 7, true, 20.4);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Blossom' ,'1998-10-13', 3, true, 17);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Ditto' ,'2022-05-14', 4, true, 22);

-- Update the wrongly entered weight_kg values that were wrongly entered as positive in the queries file.

-- Task 3
INSERT INTO owners (full_name, age) VALUES
   ('Sam Smith', 34),
   ('Jennifer Orwell', 19),
   ('Bob', 45),
   ('Melody Pond', 77),
   ('Dean Winchester', 14),
   ('Jodie Whittaker', 38);

INSERT INTO species (name) VALUES
   ('Pokemon'),
   ('Digimon');

UPDATE animals
SET species_id=2
WHERE name LIKE '%mon';

UPDATE animals
SET species_id=1
WHERE species_id WHERE name NOT LIKE '%mon';

UPDATE animals
SET owner_id=1
WHERE name='Agumon';

UPDATE animals
SET owner_id=2
WHERE name IN ('Gabumon', 'Pikachu');

UPDATE animals
SET owner_id=3
WHERE name IN ('Devimon', 'Plantmon');

UPDATE animals
SET owner_id=4
WHERE name IN ('Charmander', 'Squirtle', 'Blossom');

UPDATE animals
SET owner_id=5
WHERE name IN ('Angemon', 'Boarmon');

--Task 4
INSERT INTO vets(name, age, date_of_graduation) VALUES
('William Tatcher', 45, '2000-04-23'),
('Maisy Smith', 26, '2019-01-17'),
('Stephanie Mendez', 64, '1981-05-04'),
('Jack Harkness', 38, '2008-06-08');

INSERT INTO specializations (vets_id,species_id) 
VALUES ((SELECT id FROM vets WHERE name = 'William Tatcher'),(SELECT id from species WHERE name = 'Pokemon'));
INSERT INTO specializations (vets_id,species_id) 
VALUES ((SELECT id FROM vets WHERE name = 'Stephanie Mendez'),(SELECT id from species WHERE name = 'Digimon'));
INSERT INTO specializations (vets_id,species_id)
VALUES ((SELECT id FROM vets WHERE name = 'Stephanie Mendez'),(SELECT id from species WHERE name = 'Pokemon'));
INSERT INTO specializations (vets_id,species_id)
VALUES ((SELECT id FROM vets WHERE name = 'Jack Harkness'),(SELECT id from species WHERE name = 'Digimon')); 

INSERT INTO visits(animal_id, vets_id, visit_date)
VALUES
   ((SELECT id from animals where name = 'Agumon'),(SELECT id from vets where name = 'Stephanie Mendez'),'2020-07-22'),
   ((SELECT id from animals where name = 'Gabumon'),(SELECT id from vets where name = 'Jack Harkness'),'2021-02-02'),
   ((SELECT id from animals where name = 'Pikachu'),(SELECT id from vets where name = 'Maisy Smith'),'2020-01-05'),
   ((SELECT id from animals where name = 'Pikachu'),(SELECT id from vets where name = 'Maisy Smith'),'2020-03-08'),
   ((SELECT id from animals where name = 'Pikachu'),(SELECT id from vets where name = 'Maisy Smith'),'2020-05-14'),
   ((SELECT id from animals where name = 'Devimon'),(SELECT id from vets where name = 'Stephanie Mendez'),'2021-05-04'),
   ((SELECT id from animals where name = 'Charmander'),(SELECT id from vets where name = 'Jack Harkness'),'2021-02-24'),
   ((SELECT id from animals where name = 'Plantmon'),(SELECT id from vets where name = 'Maisy Smith'),'2019-12-21'),
   ((SELECT id from animals where name = 'Plantmon'),(SELECT id from vets where name = 'William Tatcher'),'2020-08-10'),
   ((SELECT id from animals where name = 'Plantmon'),(SELECT id from vets where name = 'Maisy Smith'),'2021-04-07'),
   ((SELECT id from animals where name = 'Squirtle'),(SELECT id from vets where name = 'Stephanie Mendez'),'2019-09-29'),
   ((SELECT id from animals where name = 'Angemon'),(SELECT id from vets where name = 'Jack Harkness'),'2020-10-03'),
   ((SELECT id from animals where name = 'Angemon'),(SELECT id from vets where name = 'Jack Harkness'),'2020-11-04'),
   ((SELECT id from animals where name = 'Boarmon'),(SELECT id from vets where name = 'Maisy Smith'),'2019-01-24'),
   ((SELECT id from animals where name = 'Boarmon'),(SELECT id from vets where name = 'Maisy Smith'),'2019-05-15'),
   ((SELECT id from animals where name = 'Boarmon'),(SELECT id from vets where name = 'Maisy Smith'),'2020-02-27'),
   ((SELECT id from animals where name = 'Boarmon'),(SELECT id from vets where name = 'Maisy Smith'),'2020-08-03'),
   ((SELECT id from animals where name = 'Blossom'),(SELECT id from vets where name = 'Stephanie Mendez'),'2020-05-24'),
   ((SELECT id from animals where name = 'Blossom'),(SELECT id from vets where name = 'William Tatcher'),'2021-01-11');
