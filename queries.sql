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

SELECT neutered, SUM(escape_attempts) AS most_escape_attempts FROM animals GROUP BY neutered;

SELECT species, MIN(weight_kg) AS min_weight, MAX(weight_kg) AS max_weight FROM animals GROUP BY species;

SELECT species, AVG(escape_attempts) AS mean_escape_attempts FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species ;



