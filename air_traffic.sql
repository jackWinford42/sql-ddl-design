-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  passenger INTEGER REFERENCES passengers ON DELETE CASCADE,
  seat TEXT NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline TEXT NOT NULL,
  from_city TEXT NOT NULL,
  from_country TEXT NOT NULL,
  to_city TEXT NOT NULL,
  to_country TEXT NOT NULL,
  round_trip INTEGER REFERENCES returning_flight ON DELETE CASCADE
);

CREATE TABLE passengers
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  nationality TEXT,
  tsa_precheck BOOLEAN DEFAULT false,
  minor BOOLEAN DEFAULT false,
  veteran BOOLEAN DEFAULT false,
  active_duty_military BOOLEAN DEFAULT false,
  elderly BOOLEAN DEFAULT false
)

INSERT INTO passengers
  (first_name, last_name, nationality, tsa_precheck, minor, veteran, active_duty_military, elderly)
VALUES
  ('Jennifer', 'Finch', 'United States', false, false, false, true, false),
  ('Thadeus', 'Gathercoal', 'United States', true, false, false, false, false),
  ('Sonja', 'Pauley', 'Canada', true, false, false, false, true),
  ('Waneta', 'Skeleton', 'Mexico', true, false, false, false, false),
  ('Berkie', 'Wycliff', 'United States', true, false, false, false, false),
  ('Alvin', 'Leathes', 'China', false, false, false, false, false),
  ('Cory', 'Squibbes', 'Russia', false, true, false, false, false)

INSERT INTO tickets
  (first_name, last_name, seat, departure, arrival, airline, from_city, from_country, to_city, to_country)
VALUES
  ( 1, '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 'United', 'Washington DC', 'United States', 'Seattle', 'United States'),
  ( 2, '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 'British Airways', 'Tokyo', 'Japan', 'London', 'United Kingdom'),
  ( 3, '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 'Delta', 'Los Angeles', 'United States', 'Las Vegas', 'United States'),
  ( 1, '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 'Delta', 'Seattle', 'United States', 'Mexico City', 'Mexico'),
  ( 4, '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 'TUI Fly Belgium', 'Paris', 'France', 'Casablanca', 'Morocco'),
  ( 2, '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 'Air China', 'Dubai', 'UAE', 'Beijing', 'China'),
  ( 5, '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 'United', 'New York', 'United States', 'Charlotte', 'United States'),
  ( 6, '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 'American Airlines', 'Cedar Rapids', 'United States', 'Chicago', 'United States'),
  ( 5, '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 'American Airlines', 'Charlotte', 'United States', 'New Orleans', 'United States'),
  ( 7, '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 'Avianca Brasil', 'Sao Paolo', 'Brazil', 'Santiago', 'Chile');