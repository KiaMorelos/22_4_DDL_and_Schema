DROP DATABASE IF EXISTS medic_center_db;
CREATE DATABASE medic_center_db;

\c medic_center_db

CREATE TABLE doctors (
    id SERIAL PRIMARY KEY,
    name TEXT,
    practice TEXT
);

CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    dob TEXT,
    name TEXT,
    insurance TEXT
);

CREATE TABLE diseases (
    id SERIAL PRIMARY KEY,
    disease TEXT,
    info TEXT
);

CREATE TABLE visits (
    id SERIAL PRIMARY KEY,
    doctor_id INTEGER REFERENCES doctors,
    patient_id INTEGER REFERENCES patients,
    date_of TEXT,
    visit_notes TEXT
);

CREATE TABLE diagnoses (
    id SERIAL PRIMARY KEY,
    disease_id INTEGER REFERENCES diseases,
    visit_id INTEGER REFERENCES visits
);
