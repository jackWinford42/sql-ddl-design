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
    disease_name TEXT,
    chronic BOOLEAN DEFAULT false,
    family_history_of_disease BOOLEAN DEFAULT false,
    deadly BOOLEAN DEFAULT false
);

CREATE TABLE medical_cases
(
    id SERIAL PRIMARY KEY,
    patient_ID INTEGER REFERENCES patients ON DELETE CASCADE,
    doctor_ID INTEGER REFERENCES doctors ON DELETE CASCADE,
    diseases INTEGER REFERENCES diseases ON DELETE CASCADE
);