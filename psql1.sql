CREATE TABLE IF NOT EXISTS artist 
       (artist_ID SERIAL PRIMARY KEY,
       first_name VARCHAR(40) NOT NULL,
       last_name VARCHAR(40) NOT NULL,
       nickname VARCHAR(40));

CREATE TABLE IF NOT EXISTS genre 
       (genre_ID SERIAL PRIMARY KEY,
       genre_name VARCHAR(30) NOT NULL);

CREATE TABLE IF NOT EXISTS collection 
       (collection_ID SERIAL PRIMARY KEY,
       collection_name VARCHAR(80) NOT NULL,
       date_collection DATE NOT NULL);

CREATE TABLE IF NOT EXISTS album 
       (album_ID SERIAL PRIMARY KEY,
       album_name VARCHAR(80) NOT NULL,
       date_album DATE NOT NULL);

CREATE TABLE IF NOT EXISTS song 
       (song_ID SERIAL PRIMARY KEY,
       song_name VARCHAR(80) NOT NULL,
       song_duration INT NOT NULL,
       date_song DATE NOT NULL,
       album_id INTEGER NOT NULL REFERENCES album(album_id));

CREATE TABLE IF NOT EXISTS artist_album 
       (artist_album_ID SERIAL PRIMARY KEY,
       artist_ID INTEGER NOT NULL REFERENCES artist(artist_ID),
       album_ID INTEGER NOT NULL REFERENCES album(album_id));

CREATE TABLE IF NOT EXISTS collection_song 
       (collection_song_ID SERIAL PRIMARY KEY,
       collection_ID INTEGER NOT NULL REFERENCES collection(collection_ID),
       song_ID INTEGER NOT NULL REFERENCES song(song_id));

CREATE TABLE IF NOT EXISTS artist_genre 
       (artist_genre_ID SERIAL PRIMARY KEY,
       artist_ID INTEGER NOT NULL REFERENCES artist(artist_ID),
       genre_ID INTEGER NOT NULL REFERENCES genre(genre_id));