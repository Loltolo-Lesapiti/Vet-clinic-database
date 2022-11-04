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

-- Task 4

SELECT an.name, ve.name, vi.visit_date
FROM animals an
INNER JOIN visits vi
ON an.id = vi.animal_id
INNER JOIN vets ve
ON ve.id = vi.vet_id
WHERE ve.name = 'William Tatcher' 
ORDER BY vi.visit_date DESC LIMIT 1;

SELECT COUNT(DISTINCT(animals.name)) AS animals_seenby_Stephanie
FROM visits vi
INNER JOIN animals an
ON an.id = vi.animals_id 
INNER JOIN vets ve 
ON vi.vets_id = ve.id 
WHERE ve.name = 'Stephanie Mendez';

SELECT DISTINCT ve.name, s.name 
FROM vets ve
LEFT JOIN specializations sp
on ve.id = sp.vet_id 
LEFT JOIN animals an 
on sp.species_id = an.species_id 
LEFT JOIN species s
ON  an.species_id = s.id 
ORDER BY ve.name;

SELECT ve.name, an.name,vi.visit_date 
FROM animals an
INNER JOIN visits vi
ON an.id = vi.animal_id
INNER JOIN vets ve
ON ve.id = vi.vet_id
WHERE ve.name = 'Stephanie Mendez' 
AND vi.visit_date BETWEEN '2020-04-01' AND '2020-08-30';

SELECT an.name,
COUNT(vi.animal_id) AS most_number_of_visits
FROM animals an
INNER JOIN visits vi
ON an.id = vi.animal_id
INNER JOIN vets ve
ON ve.id = vi.vet_id
GROUP BY an.name
ORDER BY COUNT(vi.animal_id) DESC LIMIT 1;

SELECT an.name, ve.name,vi.visit_date
FROM animals an
INNER JOIN visits vi
ON an.id = vi.animal_id
INNER JOIN vets ve
ON ve.id = vi.vet_id
WHERE ve.name = 'Maisy Smith'
ORDER BY visit_date ASC LIMIT 1;

SELECT an.name, an.date_of_birth,an.escape_attempts,an.neutered,an.weight_kg,
ve.name,ve.age,ve.date_of_graduation,
vi.visit_date
FROM animals an
INNER JOIN visits vi
ON an.id = vi.animal_id
INNER JOIN vets ve
ON ve.id = vi.vet_id
ORDER BY vi.visit_date DESC LIMIT 1;

SELECT ve.name,
COUNT(vi.vet_id) AS visits_counts_for_no_SPecVet
FROM species s
RIGHT JOIN specializations sp
ON s.id = sp.species_id
RIGHT JOIN vets ve
ON ve.id = sp.vet_id
RIGHT JOIN visits vi
ON ve.id = vi.vet_id
WHERE ve.name = 'Maisy Smith'
GROUP BY ve.name;

SELECT DISTINCT ve.name,an.name,
MAX(s.name) AS animal_species
FROM animals an
RIGHT JOIN visits vi
ON an.id = vi.animal_id
RIGHT JOIN species s
ON s.id = an.species_id
INNER JOIN vets ve
ON ve.id = vi.vet_id
WHERE ve.name = 'Maisy Smith' 
GROUP BY ve.name, an.name
ORDER BY an.name ASC LIMIT 1;