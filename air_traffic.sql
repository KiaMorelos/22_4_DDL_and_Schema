-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE airlines
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE passengers 
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

CREATE TABLE regions
(
  id SERIAL PRIMARY KEY,
  city TEXT NOT NULL,
  state TEXT,
  country TEXT NOT NULL
);

CREATE TABLE seats 
(
  id SERIAL PRIMARY KEY,
  seat_number TEXT
);

CREATE TABLE flights
(
  id SERIAL PRIMARY KEY,
  departure TEXT NOT NULL,
  arrival TEXT NOT NULL,
  airline_id INTEGER REFERENCES airlines,
  region_id_from INTEGER REFERENCES regions,
  region_id_to INTEGER REFERENCES regions
);

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  passenger_id INTEGER REFERENCES passengers,
  flight_id INTEGER REFERENCES flights,
  seat_id INTEGER REFERENCES seats
);


INSERT INTO airlines (name) VALUES ('SOUTHWEST'), ('UNITED'), ('DELTA');
INSERT INTO regions (city, state, country) 
  VALUES 
    ('Portland', 'Oregon', 'United Sates'),
    ('Las Vegas', 'Nevada', 'United Sates'),
    ('Mexico City', NULL, 'Mexico'),
    ('Sydney', NULL, 'Australia');

INSERT INTO seats (seat_number) 
  VALUES 
    ('1A'),('1B'), ('2A'), ('2B'), ('3A'), ('3B');

INSERT INTO passengers(first_name, last_name) 
  VALUES
    ('Jane', 'Doe'),
    ('John', 'Doe'),
    ('Jennifer', 'Finch'),
    ('Vash', 'The Stampede');

INSERT INTO flights (departure, arrival, airline_id, region_id_from, region_id_to)
  VALUES 
    ('2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 2, 1),
    ('2018-04-09 09:00:00', '2018-04-09 12:00:00', 3, 1, 4),
    ('2018-04-09 09:00:00', '2018-04-09 12:00:00', 2, 3, 1),
    ('2018-04-09 09:00:00', '2018-04-09 12:00:00', 1, 4, 1);

INSERT INTO tickets (passenger_id, flight_id, seat_id)
  VALUES
    (1,1,1),
    (2,2,2),
    (3,4,4),
    (4, 3, 3);








--   CREATE TABLE tickets
-- (
--   id SERIAL PRIMARY KEY,
--   first_name TEXT NOT NULL,
--   last_name TEXT NOT NULL,
--   seat TEXT NOT NULL,
--   departure TIMESTAMP NOT NULL,
--   arrival TIMESTAMP NOT NULL,
--   airline TEXT NOT NULL,
--   from_city TEXT NOT NULL,
--   from_country TEXT NOT NULL,
--   to_city TEXT NOT NULL,
--   to_country TEXT NOT NULL
-- );

-- INSERT INTO tickets
--   (first_name, last_name, seat, departure, arrival, airline, from_city, from_country, to_city, to_country)
-- VALUES
--   ('Jennifer', 'Finch', '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 'United', 'Washington DC', 'United States', 'Seattle', 'United States'),
--   ('Thadeus', 'Gathercoal', '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 'British Airways', 'Tokyo', 'Japan', 'London', 'United Kingdom'),
--   ('Sonja', 'Pauley', '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 'Delta', 'Los Angeles', 'United States', 'Las Vegas', 'United States'),
--   ('Jennifer', 'Finch', '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 'Delta', 'Seattle', 'United States', 'Mexico City', 'Mexico'),
--   ('Waneta', 'Skeleton', '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 'TUI Fly Belgium', 'Paris', 'France', 'Casablanca', 'Morocco'),
--   ('Thadeus', 'Gathercoal', '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 'Air China', 'Dubai', 'UAE', 'Beijing', 'China'),
--   ('Berkie', 'Wycliff', '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 'United', 'New York', 'United States', 'Charlotte', 'United States'),
--   ('Alvin', 'Leathes', '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 'American Airlines', 'Cedar Rapids', 'United States', 'Chicago', 'United States'),
--   ('Berkie', 'Wycliff', '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 'American Airlines', 'Charlotte', 'United States', 'New Orleans', 'United States'),
--   ('Cory', 'Squibbes', '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 'Avianca Brasil', 'Sao Paolo', 'Brazil', 'Santiago', 'Chile');