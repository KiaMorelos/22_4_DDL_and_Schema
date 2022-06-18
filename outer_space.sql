-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE galaxies
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE orbits
(
  id SERIAL PRIMARY KEY,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around TEXT NOT NULL
);

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbit_id INTEGER references orbits,
  galaxy_id INTEGER REFERENCES galaxies,
  has_moons BOOLEAN NOT NULL
);

CREATE TABLE moons 
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  planet_id INTEGER REFERENCES planets,
  galaxy_id INTEGER REFERENCES galaxies
);

INSERT INTO galaxies (name) VALUES ('The Milky Way');

INSERT INTO orbits(orbital_period_in_years, orbits_around) 
  VALUES 
  (1.00, 'The Sun'),
  (1.88, 'The Sun'),
  (0.62, 'The Sun'),
  (164.8, 'The Sun'),
  (0.03, 'Proxima Centauri'),
  (0.23, 'Gliese 876');

INSERT INTO planets (name, galaxy_id, has_moons, orbit_id) 
  VALUES
    ('Earth', 1, true, 1),
    ('Mars', 1, true, 2),
    ('Venus', 1, false, 3),
    ('Neptune', 1, true, 4),
    ('Proxima Centauri b', 1, false, 5),
    ('Gliese 876 b', 1, false, 6);

INSERT INTO moons (name, planet_id, galaxy_id)
  VALUES
    ('The Moon', 1, 1),
    ('Phobos', 2, 1),
    ('Deimos', 2, 1),
    ('Naiad', 4, 1),
    ('Thalassa', 4, 1),
    ('Despina', 4, 1),
    ('Galatea', 4, 1),
    ('Larissa', 4, 1),
    ('S/2004 N 1', 4, 1),
    ('Proteus', 4, 1),
    ('Triton', 4, 1),
    ('Nereid', 4, 1),
    ('Halimede', 4, 1),
    ('Sao', 4, 1),
    ('Laomedeia', 4, 1),
    ('Psamathe', 4, 1),
    ('Neso', 4, 1);

--ORIGINAL CODE:
-- CREATE TABLE planets
-- (
--   id SERIAL PRIMARY KEY,
--   name TEXT NOT NULL,
--   orbital_period_in_years FLOAT NOT NULL,
--   orbits_around TEXT NOT NULL,
--   galaxy TEXT NOT NULL,
--   moons TEXT[]
-- );

-- INSERT INTO planets
--   (name, orbital_period_in_years, orbits_around, galaxy, moons)
-- VALUES
--   ('Earth', 1.00, 'The Sun', 'Milky Way', '{"The Moon"}'),
--   ('Mars', 1.88, 'The Sun', 'Milky Way', '{"Phobos", "Deimos"}'),
--   ('Venus', 0.62, 'The Sun', 'Milky Way', '{}'),
--   ('Neptune', 164.8, 'The Sun', 'Milky Way', '{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}'),
--   ('Proxima Centauri b', 0.03, 'Proxima Centauri', 'Milky Way', '{}'),
--   ('Gliese 876 b', 0.23, 'Gliese 876', 'Milky Way', '{}');