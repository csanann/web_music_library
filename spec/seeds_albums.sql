-- file: spec/seeds_albums.sql


TRUNCATE TABLE albums RESTART IDENTITY; 


INSERT INTO albums (title, release_year, artist_id) VALUES ('Bossanova', '1999', '1');
INSERT INTO albums (title, release_year, artist_id) VALUES ('Surfer Rosa', '2001', '1');