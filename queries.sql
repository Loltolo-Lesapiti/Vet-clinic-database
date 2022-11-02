-- Day 1: List of queries to the animal table. 
SELECT * FROM animals WHERE name like '%mon';
SELECT * FROM animals WHERE extract(YEAR FROM date_of_birth) BETWEEN '2016' AND '2019';
SELECT * FROM animals WHERE neutered=true AND escape_attempts>3;
SELECT date_of_birth from animals WHERE name='Agumon' OR name='Pikachu';
SELECT name, escape_attempts from animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered=true;
SELECT * FROM animals WHERE name<>'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;
