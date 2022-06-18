CREATE DATABASE fake_craigs_db;

\c fake_craigs_db

CREATE TABLE regions (
    id SERIAL PRIMARY KEY,
    city TEXT,
    state TEXT
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username TEXT,
    password TEXT,
    region_id INTEGER REFERENCES regions
);

CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    category TEXT
);

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    title TEXT,
    text_of TEXT,
    location TEXT,
    user_id INTEGER REFERENCES users,
    region_id INTEGER REFERENCES regions,
    category_id INTEGER REFERENCES categories
);

