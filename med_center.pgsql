DROP DATABASE IF MED_CENTER_db;
CREATE DATABASE MED_CENTER_db;
\c MED_CENTER_db;

CREATE TABLE doctors
(
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(10),
    last_name VARCHAR(10)
);

CREATE TABLE patients
(
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(10),
    last_name VARCHAR(10)
);

CREATE TABLE diseases
(
    id SERIAL PRIMARY KEY,
    flu BOOLEAN DEFAULT false,
    covid-19 BOOLEAN DEFAULT false,
    conjunctivitis BOOLEAN DEFAULT false,
    mononucleosis  BOOLEAN DEFAULT false,
    pneumonia BOOLEAN DEFAULT false,
    acne BOOLEAN DEFAULT false,
    asthma BOOLEAN DEFAULT false,
    chickenpox BOOLEAN DEFAULT false,
    shingles BOOLEAN DEFAULT false
);

CREATE TABLE medical_cases
(
    id SERIAL PRIMARY KEY,
    patient_ID INTEGER REFERENCES patients ON DELETE CASCADE,
    doctor_ID INTEGER REFERENCES doctors ON DELETE CASCADE,
    diseases INTEGER REFERENCES diseases ON DELETE CASCADE
);