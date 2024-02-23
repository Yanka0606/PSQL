
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

      
      
      --задание1

INSERT INTO artist(first_name, last_name, nickname)
VALUES ('Михаил', 'Горшенёв', 'Горшок'),
       ('Сергей', 'Шнуров', 'Шнур'),
       ('Игорь', 'Сукачёв', NULL),
       ('Сергей', 'Михалок', 'Ляпис Трубецкой');
	   
INSERT INTO genre(genre_name)
VALUES ('рок'),
       ('панк-рок'),
       ('Фолк-рок'),
       ('поп-рок');
	   
INSERT INTO collection(collection_name, date_collection)
VALUES ('Сборник русского рока', TO_DATE('2000', 'YYYY')),
       ('Лучшее из Ленинграда', TO_DATE('2019', 'YYYY')),
       ('Лирическое', TO_DATE('2000', 'YYYY')),
       ('Сборник для вечеринки', TO_DATE('2000', 'YYYY'));
	   
INSERT INTO album(album_name, date_album)
VALUES ('Король и Шут. Акустический альбом', TO_DATE('1999', 'YYYY')),
       ('Как в старой сказке', TO_DATE('2020', 'YYYY')),
	   ('Театръ демона', TO_DATE('2010', 'YYYY')),
       ('Дачники', TO_DATE('2000', 'YYYY')),
       ('Пираты XXI века', TO_DATE('2002', 'YYYY')),
	   ('Перезвоны', TO_DATE('2005', 'YYYY')),
	   ('Реки', TO_DATE('1993', 'YYYY')),
	   ('Ты кинула', TO_DATE('1998', 'YYYY')),
	   ('Всем девченкам нравится...', TO_DATE('2000', 'YYYY'));
	   
INSERT INTO song(song_name, song_duration, date_song, album_id)
VALUES ('Кукла колдуна', 202, TO_DATE('1999', 'YYYY'), 1),
       ('Прыгну со скалы', 191, TO_DATE('1999', 'YYYY'), 1),
       ('Ели мясо мужики', 133, TO_DATE('1999', 'YYYY'), 1),
       ('Проклятый старый дом', 257, TO_DATE('2020', 'YYYY'), 2),
	   ('Воспоминания о былой любви', 295, TO_DATE('2020', 'YYYY'), 2),
	   ('Танец злобного гения', 235, TO_DATE('2010', 'YYYY'), 3),
	   ('Дачники', 130, TO_DATE('2000', 'YYYY'), 4),
	   ('Когда нет денег', 178, TO_DATE('2000', 'YYYY'), 4),
	   ('Терминатор', 235, TO_DATE('2000', 'YYYY'), 4),
	   ('Космос', 101, TO_DATE('2000', 'YYYY'), 4),
	   ('WWW', 187, TO_DATE('2002', 'YYYY'), 5),
	   ('У меня есть всё', 267, TO_DATE('2002', 'YYYY'), 5),
	   ('Люди не летают', 164, TO_DATE('2002', 'YYYY'), 5),
	   ('Перезвоны', 202, TO_DATE('2005', 'YYYY'), 6),
	   ('Я милого узнаю по походке', 215, TO_DATE('2005', 'YYYY'), 6),
	   ('Белый колпак', 310, TO_DATE('1993', 'YYYY'), 7),
	   ('Дорожная', 314, TO_DATE('1993', 'YYYY'), 7),
	   ('На перекрестке Луны', 402, TO_DATE('1993', 'YYYY'), 7),
	   ('Ау', 234, TO_DATE('1998', 'YYYY'), 8),
	   ('Ты кинула', 237, TO_DATE('1998', 'YYYY'), 8),
	   ('Облака', 298, TO_DATE('1998', 'YYYY'), 8),
	   ('Любовь повернулась ко мне задом', 242, TO_DATE('2000', 'YYYY'), 9),
	   ('Крошка моя', 204, TO_DATE('2000', 'YYYY'), 9);
	   
INSERT INTO artist_album(artist_ID, album_ID)
VALUES (1, 1),
       (1, 2),
       (1, 3),
	   (2, 4),
	   (2, 5),
	   (3, 6),
	   (3, 7),
	   (4, 8),
	   (4, 9);
	   
INSERT INTO collection_song(collection_ID, song_ID)
VALUES (1, 1),
       (1, 2),
       (1, 3),
	   (1, 11),
	   (1, 20),
	   (2, 7),
	   (2, 8),
	   (2, 9),
	   (2, 10),
	   (2, 11),
	   (2, 12),
	   (3, 16),
       (3, 17),
	   (4, 3),
	   (4, 6),
	   (4, 9),
	   (4, 12),
	   (4, 19),
       (4, 20);
	   
INSERT INTO artist_genre(artist_ID, genre_ID)
VALUES (1, 1),
       (1, 2),
       (1, 3),
	   (2, 1),
	   (2, 4),
	   (3, 1),
	   (3, 4),
	   (4, 4);
	  
	  --задание2
	   
/* Самая продолжительная песня */
SELECT song_name AS Название_песни, 
       song_duration AS Продолжительность_с, 
       song_duration/60 + (MOD(CAST(song_duration AS DECIMAL), 60)/100) AS Продолжительность_мин
  FROM song
 WHERE song_duration = (SELECT MAX(song_duration) FROM song);

/* Треки продолжительностью 3.5 минут (210 секунд) и более */
SELECT song_name AS Название_песни, 
       song_duration/60+(MOD(CAST(song_duration AS DECIMAL), 60)/100) AS Продолжительность_мин
  FROM song
 WHERE song_duration >= 210;

/* Название сборников, вышедших в период с 2018 по 2020 год включительно */
SELECT collection_name, 
       date_collection
  FROM collection
 WHERE date_collection >= '2018-01-01' AND date_collection <= '2020-01-01';

/* Исполнители, чьё имя состоит не из одного слова. В данном запросе найдем "Никнейм" исполнителя, состоящий не из одного слова */
SELECT nickname AS Ник
  FROM artist
 WHERE nickname NOT LIKE '% %';

/* Название треков, которые содержат слово "мой" ("моя") или "my" */
SELECT song_name AS Название_песни
  FROM song
 WHERE song_name LIKE 'my %' 
       OR song_name LIKE 'мой %' 
       OR song_name LIKE 'моя %'
       OR song_name LIKE '% my'
       OR song_name LIKE '% мой'
       OR song_name LIKE '% моя';

      
      --задание3
/* Количество исполнителей в каждом жанре */
SELECT genre.genre_name AS Жанр, 
       COUNT(genre.genre_name) AS Количество_исполнителей
  FROM artist 
       INNER JOIN artist_genre 
       ON artist.artist_id = artist_genre.artist_id
       INNER JOIN genre 
       ON genre.genre_id = artist_genre.genre_id
 GROUP BY genre.genre_name;

/* Количество треков, вошедших в альбомы 2019-2020 годов */
SELECT COUNT(song.song_name) AS Количество_треков
  FROM song 
       INNER JOIN artist_album 
       ON song.album_id = artist_album.album_id
       INNER JOIN album 
       ON artist_album.album_id = album.album_id
 WHERE date_album >= '2019-01-01' AND date_album <= '2020-01-01';

/* Средняя продолжительность треков по каждому альбому */
SELECT album.album_name AS Альбом,
       ROUND(AVG(song.song_duration), 2) AS Средняя_продолжительность_трека
  FROM album
       INNER JOIN song
       ON album.album_id = song.album_id
 GROUP BY Альбом

/* Все исполнители, которые не выпустили альбомы в 2020 году */
SELECT CONCAT(artist.first_name, ' ', artist.last_name) AS Исполнитель
  FROM artist
 WHERE CONCAT(artist.first_name, ' ', artist.last_name) NOT IN --Находим исполнителя, который выпускал альбом в 2020 году
       (SELECT CONCAT(artist.first_name, ' ', artist.last_name) AS Исполнитель
          FROM artist
               INNER JOIN artist_album
               ON artist_album.artist_id = artist.artist_id
               INNER JOIN album
               ON album.album_id = artist_album.album_id
         WHERE album.date_album >= '2020-01-01' AND album.date_album <= '2020-12-31'
        )
 GROUP BY Исполнитель;
    
/* Названия сборников, в которых присутствует конкретный исполнитель (по выбору). Ищем 'Ляпис Трубецкой'*/
SELECT collection.collection_name AS Сборник
  FROM collection
       INNER JOIN collection_song
       ON collection_song.collection_id = collection.collection_id
       INNER JOIN song
       ON song.song_id = collection_song.song_id
       INNER JOIN album
       ON album.album_id = song.album_id
       INNER JOIN artist_album
       ON artist_album.album_id = album.album_id
       INNER JOIN artist
       ON artist.artist_id = artist_album.album_id
       WHERE artist.nickname LIKE 'Ляпис Трубецкой'
 GROUP BY Сборник;


--задание4 


/* Названия альбомов, в которых присутствуют исполнители более чем одного жанра */
SELECT album.album_name AS Альбом
  FROM album
       INNER JOIN artist_album
       ON artist_album.album_id = album.album_id
       INNER JOIN artist
       ON artist.artist_id = artist_album.album_id
       INNER JOIN artist_genre 
       ON artist.artist_id = artist_genre.artist_id
       INNER JOIN genre 
       ON genre.genre_id = artist_genre.genre_id
 GROUP BY Альбом
 HAVING COUNT(genre.genre_name) > 1;

/* Наименования треков, которые не входят в сборники */
SELECT song.song_name AS Трек
  FROM song 
 WHERE song.song_name NOT IN 
       (SELECT song.song_name AS Трек
          FROM song 
               INNER JOIN collection_song
               ON collection_song.song_id = song.song_id
               INNER JOIN collection
               ON collection.collection_id = collection_song.collection_id)     
               
/* Исполнитель или исполнители, написавшие самый короткий по продолжительности трек */
SELECT CONCAT(artist.first_name, ' ', artist.last_name) AS Исполнитель
  FROM artist
       INNER JOIN artist_album
       ON artist_album.artist_id = artist.artist_id
       INNER JOIN album
       ON album.album_id = artist_album.album_id
       INNER JOIN song
       ON album.album_id = song.album_id
 WHERE song.song_duration = 
       (SELECT MIN(song.song_duration) FROM song)
 
/* Названия альбомов, содержащих наименьшее количество треков */
 SELECT Альбом, MIN(Количество_треков)
   FROM (SELECT album.album_name AS Альбом, COUNT(song.song_name) AS Количество_треков
          FROM album
         INNER JOIN song
               ON album.album_id = song.album_id
         GROUP BY album.album_name)
  GROUP BY Альбом