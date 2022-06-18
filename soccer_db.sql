CREATE DATABASE soccer_db;

\c soccer_db

CREATE TABLE teams (
    id SERIAL PRIMARY KEY,
    name TEXT,
    city TEXT
);

CREATE TABLE players (
    id SERIAL PRIMARY KEY,
    name TEXT,
    team_id INTEGER REFERENCES teams
);

CREATE TABLE referees (
    id SERIAL PRIMARY KEY,
    name TEXT
);

CREATE TABLE seasons (
    id SERIAL PRIMARY KEY,
    start_date TEXT,
    end_date TEXT
);

CREATE TABLE matches (
    id SERIAL PRIMARY KEY,
    date_of TEXT,
    location TEXT,
    team1_id INTEGER REFERENCES teams,
    team2_id INTEGER REFERENCES teams,
    season_id INTEGER REFERENCES seasons,
    referee_id INTEGER REFERENCES referees
);

CREATE TABLE goals (
    id SERIAL PRIMARY KEY,
    match_id INTEGER REFERENCES matches,
    player_id INTEGER REFERENCES players
);

CREATE TABLE outcomes (
    id SERIAL PRIMARY KEY,
    match_id INTEGER REFERENCES matches,
    outcomes TEXT
);