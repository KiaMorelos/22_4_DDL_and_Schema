-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE artists
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE producers
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE albums
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  release_date DATE NOT NULL,
  artist_id INTEGER REFERENCES artists
);

CREATE TABLE songs 
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  album_id INTEGER REFERENCES albums,
  artist_id INTEGER REFERENCES artists,
  duration_in_seconds INTEGER NOT NULL
);

CREATE TABLE albums_producers
(
  id SERIAL PRIMARY KEY,
  album_id INTEGER REFERENCES albums,
  producer_id INTEGER REFERENCES producers
);


INSERT INTO artists (name)
  VALUES
    ('Linkin Park'),
    ('Queen'),
    ('Hanson');

INSERT INTO albums (name, release_date, artist_id)
  VALUES
    ('Meteora', '2002-06-06', 1),
    ('A Night at the Opera', '1975-10-31', 2),
    ('Middle of Nowhere', '1997-04-15', 3);

INSERT INTO songs (name, album_id, duration_in_seconds)
  VALUES
    ('MMMBop', 3, 238),
    ('Faint', 1, 220),
    ('Bohemian Rhapshody', 2, 355);

INSERT INTO producers (name)
  VALUES
    ('Dust Brothers'),
    ('Stephen Lironi'),
    ('Roy Thomas Baker'),
    ('Mike Shinoda');

INSERT INTO albums_producers (album_id, producer_id)
  VALUES
    (1, 4),
    (2, 3),
    (3, 2),
    (3, 1);


-- CREATE TABLE songs
-- (
--   id SERIAL PRIMARY KEY,
--   title TEXT NOT NULL,
--   duration_in_seconds INTEGER NOT NULL,
--   release_date DATE NOT NULL,
--   artists TEXT[] NOT NULL,
--   album TEXT NOT NULL,
--   producers TEXT[] NOT NULL
-- );

-- INSERT INTO songs
--   (title, duration_in_seconds, release_date, artists, album, producers)
-- VALUES
--   ('MMMBop', 238, '04-15-1997', '{"Hanson"}', 'Middle of Nowhere', '{"Dust Brothers", "Stephen Lironi"}'),
--   ('Bohemian Rhapsody', 355, '10-31-1975', '{"Queen"}', 'A Night at the Opera', '{"Roy Thomas Baker"}'),
--   ('One Sweet Day', 282, '11-14-1995', '{"Mariah Cary", "Boyz II Men"}', 'Daydream', '{"Walter Afanasieff"}'),
--   ('Shallow', 216, '09-27-2018', '{"Lady Gaga", "Bradley Cooper"}', 'A Star Is Born', '{"Benjamin Rice"}'),
--   ('How You Remind Me', 223, '08-21-2001', '{"Nickelback"}', 'Silver Side Up', '{"Rick Parashar"}'),
--   ('New York State of Mind', 276, '10-20-2009', '{"Jay Z", "Alicia Keys"}', 'The Blueprint 3', '{"Al Shux"}'),
--   ('Dark Horse', 215, '12-17-2013', '{"Katy Perry", "Juicy J"}', 'Prism', '{"Max Martin", "Cirkut"}'),
--   ('Moves Like Jagger', 201, '06-21-2011', '{"Maroon 5", "Christina Aguilera"}', 'Hands All Over', '{"Shellback", "Benny Blanco"}'),
--   ('Complicated', 244, '05-14-2002', '{"Avril Lavigne"}', 'Let Go', '{"The Matrix"}'),
--   ('Say My Name', 240, '11-07-1999', '{"Destiny''s Child"}', 'The Writing''s on the Wall', '{"Darkchild"}');
