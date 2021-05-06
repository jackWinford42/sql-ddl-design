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
  from_city INTEGER REFERENCES cities ON DELETE CASCADE,
  from_country INTEGER REFERENCES countries ON DELETE CASCADE,
  to_city INTEGER REFERENCES cities ON DELETE CASCADE,
  to_country INTEGER REFERENCES countries ON DELETE CASCADE,
  round_trip INTEGER REFERENCES returning_flight ON DELETE CASCADE
);

CREATE TABLE passengers
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  nationality INTEGER REFERENCES countries ON DELETE CASCADE,
  tsa_precheck BOOLEAN DEFAULT false,
  minor BOOLEAN DEFAULT false,
  veteran BOOLEAN DEFAULT false,
  active_duty_military BOOLEAN DEFAULT false,
  elderly BOOLEAN DEFAULT false
);

CREATE TABLE countries
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE cities
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
)

INSERT INTO country
  (name)
VALUES
  ('United States'),
  ('Japan'),
  ('United Kingdom'),
  ('Mexico'),
  ('France'),
  ('Morocco'),
  ('UAE'),
  ('China'),
  ('Brazil'),
  ('Chile');

INSERT INTO city
  (name)
VALUES
  ('Washington DC'),
  ('Seattle'),
  ('Tokyo'),
  ('London'),
  ('Los Angeles'),
  ('Las Vegas'),
  ('Mexico City'),
  ('Paris'),
  ('Casablanca'),
  ('Dubai'),
  ('Beijing'),
  ('New York'),
  ('Charlotte'),
  ('Cedar Rapids'),
  ('Chicago'),
  ('New Orleans'),
  ('Sao Paolo'),
  ('Santiago');

INSERT INTO passengers
  (first_name, last_name, nationality, tsa_precheck, minor, veteran, active_duty_military, elderly)
VALUES
  ('Jennifer', 'Finch', 1, false, false, false, true, false),
  ('Thadeus', 'Gathercoal', 1, true, false, false, false, false),
  ('Sonja', 'Pauley', 2, true, false, false, false, true),
  ('Waneta', 'Skeleton', 3, true, false, false, false, false),
  ('Berkie', 'Wycliff', 1, true, false, false, false, false),
  ('Alvin', 'Leathes', 4, false, false, false, false, false),
  ('Cory', 'Squibbes', 5, false, true, false, false, false);

INSERT INTO tickets
  (first_name, last_name, seat, departure, arrival, airline, from_city, from_country, to_city, to_country)
VALUES
  ( 1, '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 'United', 1, 1, 2, 1),
  ( 2, '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 'British Airways', 3, 2, 4, 3),
  ( 3, '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 'Delta', 5, 1, 6, 1),
  ( 1, '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 'Delta', 2, 1, 7, 4),
  ( 4, '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 'TUI Fly Belgium', 8, 5, 9, 6),
  ( 2, '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 'Air China', 10, 7, 11, 8),
  ( 5, '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 'United', 12, 1, 13, 1),
  ( 6, '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 'American Airlines', 14, 1, 15, 1),
  ( 5, '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 'American Airlines', 13, 1, 16, 1),
  ( 7, '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 'Avianca Brasil', 17, 9, 18, 10);