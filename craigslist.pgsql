DROP DATABASE IF CRAIGSLIST_db;
CREATE DATABASE CRAIGSLIST_db;
\c CRAIGSLIST_db;

CREATE TABLE users
(
    id SERIAL PRIMARY KEY,
    username VARCHAR(10),
    password VARCHAR(10),
    preferred_region TEXT
);

CREATE TABLE posts
(
    id SERIAL PRIMARY KEY,
    title TEXT,
    description TEXT,
    author INTEGER REFERENCES users ON DELETE CASCADE,
    location TEXT,
    post_region TEXT
);

CREATE TABLE categories
(
    community BOOLEAN DEFAULT false,
    for_sale BOOLEAN DEFAULT false,
    gigs BOOLEAN DEFAULT false,
    housing BOOLEAN DEFAULT false,
    jobs BOOLEAN DEFAULT false,
    resumes BOOLEAN DEFAULT false,
    services BOOLEAN DEFAULT false
);