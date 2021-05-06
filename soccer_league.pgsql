DROP DATABASE IF soccer_league_db;
CREATE DATABASE soccer_league_db;
\c soccer_league_db;

CREATE TABLE teams
(
    id SERIAL PRIMARY KEY,
    team_name TEXT,
    coach_name TEXT
)

CREATE TABLE players
(
    id SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    season_total_goals INTEGER,
    team INTEGER REFERENCES teams ON DELETE CASCADE
)

CREATE TABLE goals
(
    id SERIAL PRIMARY KEY,
    player INTEGER REFERENCES players ON DELETE CASCADE,
    game INTEGER REFERENCES games ON DELETE CASCADE
)

CREATE TABLE games
(
    id SERIAL PRIMARY KEY,
    team_one INTEGER REFERENCES teams ON DELETE CASCADE,
    team_two INTEGER REFERENCES teams ON DELETE CASCADE,
    referee INTEGER REFERENCES referees ON DELETE CASCADE,
    assistant_referee_one INTEGER REFERENCES referees ON DELETE CASCADE,
    assistant_referee_one INTEGER REFERENCES referees ON DELETE CASCADE,
    time DATE,
    location TEXT
)

CREATE TABLE referees
(
    id SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    assistant_referee_two TEXT
)

CREATE TABLE ranking
(
    team_ID INTEGER REFERENCES teams ON DELETE CASCADE,
    team_name TEXT REFERENCES teams ON DELETE CASCADE,
    league_name TEXT REFERENCES leagues ON DELETE CASCADE,
    rank INTEGER
)

CREATE TABLE leagues
(
    id SERIAL PRIMARY KEY,
    start_date DATE,
    end_date DATE,
    league_name TEXT
)