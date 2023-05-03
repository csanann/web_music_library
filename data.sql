-- file: data.sql

-- TRUNCATE TABLE artists RESTART IDENTITY; -- replace with your own table name.
-- to keep the tables but only remove their contents and reset their primary key sequences

DROP TABLE IF EXISTS albums;
CREATE TABLE albums (
  id SERIAL PRIMARY KEY,
  title TEXT,
  artist_id INTEGER
);

DROP TABLE IF EXISTS artists;
CREATE TABLE artists (
  id SERIAL PRIMARY KEY,
  name TEXT
);

