-- Day 1: List of queries to the animal table. 
SELECT * FROM animals WHERE name like '%mon';
SELECT * FROM animals WHERE extract(YEAR FROM date_of_birth) BETWEEN '2016' AND '2019';
SELECT * FROM animals WHERE neutered=true AND escape_attempts>3;
SELECT date_of_birth from animals WHERE name='Agumon' OR name='Pikachu';
SELECT name, escape_attempts from animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered=true;
SELECT * FROM animals WHERE name<>'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

-- Task 2 queries.

-- Update weight_kg columns for the values wrongly entered as positive.
UPDATE animals
SET weight_kg = weight_kg * -1
WHERE name = 'Charmander';

UPDATE animals
SET weight_kg = weight_kg * -1
WHERE name = 'Plantmon';

UPDATE animals
SET weight_kg = weight_kg * -1
WHERE name = 'Squirtle';

UPDATE animals
SET weight_kg = weight_kg * -1
WHERE name = 'Angemon';



-- No 1.
BEGIN;
UPDATE animals
SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;

-- No 2.
BEGIN;

UPDATE animals 
SET species = 'digimon'
WHERE name like '%mon';

UPDATE animals 
SET species = 'pokemon'
WHERE species = '';

COMMIT;
SELECT * FROM animals;

--No 3.
BEGIN;
DELETE FROM animals;
ROLLBACK;
SELECT * FROM animals;

--No 4.
BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SELECT * FROM animals;
SAVEPOINT checkpoint1;
UPDATE animals SET weight_kg=weight_kg*-1;
SELECT * FROM animals;
ROLLBACK TO checkpoint1;
UPDATE animals SET weight_kg=weight_kg*-1 where weight_kg<0;
SELECT * FROM animals;
COMMIT;

--No 5
SELECT COUNT(*) AS total FROM animals;

SELECT COUNT(*) AS coolAnimals FROM animals
WHERE escape_attempts=0;

SELECT AVG(weight_kg) AS meanWeight FROM animals;

SELECT neutered, MAX(escape_attempts) AS most_escape_attempts FROM animals GROUP BY neutered;

SELECT species, MIN(weight_kg) AS min_weight, MAX(weight_kg) AS max_weight FROM animals GROUP BY species;

SELECT species, AVG(escape_attempts) AS mean_escape_attempts FROM animals WHERE date_of_birth >= '1990-01-01' AND date_of_birth <= '2000-12-31' GROUP BY species ;

-- Task 3
SELECT name FROM animals INNER JOIN owners ON animals.owner_id=owners.id WHERE owner.full_name='Melody Pond';
SELECT * FROM animals LEFT JOIN species ON animal.species_id=species.id WHERE species.name='Pokemon';
SELECT * FROM owners LEFT JOIN animals ON owners.id=animals.owner_id;
SELECT species.name, COUNT(animals.species_id) FROM animals JOIN species ON species.id = animals.species_id GROUP BY species.name;
SELECT * FROM animals a JOIN owners o ON a.owner_id=o.id JOIN species s ON a.species_id=s.id WHERE o.full_name='Jennifer Orwell' AND s.name='Digimon';
SELECT animals.name from animals JOIN owners ON owners.id = animals.owner_id WHERE animals.escape_attempts = '0' AND animals.owner_id = '5';
SELECT full_name, COUNT(owner_id) FROM owners JOIN animals on owners.id = animals.owner_id GROUP BY full_name ORDER BY COUNT (owner_id) desc limit 1;
