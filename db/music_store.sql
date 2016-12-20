DROP TABLE IF EXISTS albums;
DROP TABLE IF EXISTS artists;


CREATE TABLE artists
(
  id SERIAL8 primary key,
  name VARCHAR(255) not null
);

CREATE TABLE albums
(
  id SERIAL8 primary key,
  name VARCHAR(255) not null,
  quantity INT2,
  genre VARCHAR(255),
  artist_id INT8 references artists(id)
);
