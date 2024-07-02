
--inserting new users (the first user is my self and the password is my actual password, JUST KIDDING!)
INSERT INTO "users" ("username", "email", "password", "birth_date") VALUES ("AmirHoseinHayati", "amirhosein@hayati.com", "password123", "1999-11-11");
INSERT INTO "users" ("username", "email", "password", "birth_date") VALUES ("Armowon1099", "arman@mowon.com", "password321", "2000-11-11");
INSERT INTO "users" ("username", "email", "password", "birth_date") VALUES ("MamadGarfild", "Mamad@garfild.com", "password431", "1995-11-11");
INSERT INTO "users" ("username", "email", "password", "birth_date") VALUES ("hooshmand1099", "hooshmand@tala.com", "password531", "1994-11-11");
INSERT INTO "users" ("username", "email", "password", "birth_date") VALUES ("sakineSexy", "sakineSexy@tala.com", "password512", "1993-11-11");
INSERT INTO "users" ("username", "email", "password", "birth_date") VALUES ("NotDravenDraaaaven", "Draven@Draven.com", "password515", "1991-11-11");
INSERT INTO "users" ("username", "email", "password", "birth_date") VALUES ("DarthMamad", "darth@tala.com", "password213", "1996-11-11");
INSERT INTO "users" ("username", "email", "password", "birth_date") VALUES ("artaJigarTala", "artaJigar@tala.com", "password219", "1996-11-11");

--users need to upload some tracks
INSERT INTO "songs" ("title", "duration", "genre", "user_id", "lyrics") VALUES ("Hyperlandia", 6, "electronic", (SELECT id FROM users WHERE username = "MamadGarfild"), "blah blah blah blah");
INSERT INTO "songs" ("title", "duration", "genre", "user_id", "lyrics") VALUES ("Innerbloom", 9, "electronic", (SELECT id FROM users WHERE username = "Armowon1099"), "blah blah blah blah");
INSERT INTO "songs" ("title", "duration", "genre", "user_id", "lyrics") VALUES ("Rain", 4, "metal", (SELECT id FROM users WHERE username = "artaJigarTala"), "blah blah blah blah");
INSERT INTO "songs" ("title", "duration", "genre", "user_id", "lyrics") VALUES ("Blood Sport", 4, "metal", (SELECT id FROM users WHERE username = "MamadGarfild"), "blah blah blah blah");
INSERT INTO "songs" ("title", "duration", "genre", "user_id", "lyrics") VALUES ("Ill be HERE", 3, "electronic", (SELECT id FROM users WHERE username = "hooshmand1099"), "blah blah blah blah");
INSERT INTO "songs" ("title", "duration", "genre", "user_id", "lyrics") VALUES ("monophobia", 4, "electronic", (SELECT id FROM users WHERE username = "sakineSexy"), "blah blah blah blah");
INSERT INTO "songs" ("title", "duration", "genre", "user_id", "lyrics") VALUES ("Pocket Story", 4, "synthwave", (SELECT id FROM users WHERE username = "NotDravenDraaaaven"), "blah blah blah blah");
INSERT INTO "songs" ("title", "duration", "genre", "user_id", "lyrics") VALUES ("Enigma", 4, "electronic", (SELECT id FROM users WHERE username = "NotDravenDraaaaven"), "blah blah blah blah");
INSERT INTO "songs" ("title", "duration", "genre", "user_id", "lyrics") VALUES ("take me there", 6, "electronic", (SELECT id FROM users WHERE username = "sakineSexy"), "blah blah blah blah");
INSERT INTO "songs" ("title", "duration", "genre", "user_id", "lyrics") VALUES ("get away", 5, "electronic", (SELECT id FROM users WHERE username = "Armowon1099"), "blah blah blah blah");
INSERT INTO "songs" ("title", "duration", "genre", "user_id", "lyrics") VALUES ("boa", 3, "hiphop", (SELECT id FROM users WHERE username = "MamadGarfild"), "blah blah blah blah");
INSERT INTO "songs" ("title", "duration", "genre", "user_id", "lyrics") VALUES ("shy girl", 4, "drom_and_bass", (SELECT id FROM users WHERE username = "MamadGarfild"), "blah blah blah blah");
INSERT INTO "songs" ("title", "duration", "genre", "user_id", "lyrics") VALUES ("turbo killer", 9, "dark_synth", (SELECT id FROM users WHERE username = "MamadGarfild"), "blah blah blah blah");
INSERT INTO "songs" ("title", "duration", "genre", "user_id", "lyrics") VALUES ("shake that", 6, "hiphop", (SELECT id FROM users WHERE username = "artaJigarTala"), "blah blah blah blah");
INSERT INTO "songs" ("title", "duration", "genre", "user_id", "lyrics") VALUES ("without you", 6, "electronic", (SELECT id FROM users WHERE username = "MamadGarfild"), "blah blah blah blah");
INSERT INTO "songs" ("title", "duration", "genre", "user_id", "lyrics") VALUES ("Hush", 9, "synthwave", (SELECT id FROM users WHERE username = "Armowon1099"), "blah blah blah blah");
INSERT INTO "songs" ("title", "duration", "genre", "user_id", "lyrics") VALUES ("rave angel", 4, "pop", (SELECT id FROM users WHERE username = "artaJigarTala"), "blah blah blah blah");

--now i want to create two playlist for my self(AmirHoseinHayati)
INSERT INTO "playlists" ("title", "description", "user_id") VALUES ("SUPER DUPER COOL PLAYLIST", "house of edm", (SELECT id FROM users WHERE username = "AmirHoseinHayati"));
INSERT INTO "playlists" ("title", "description", "user_id") VALUES ("synthwave", "cool synthwaves", (SELECT id FROM users WHERE username = "AmirHoseinHayati"));

--lets add a couple songs to both playlists
INSERT INTO "playlist_songs" ("playlist_id", "song_id") VALUES ((SELECT id FROM playlists WHERE title = "SUPER DUPER COOL PLAYLIST"), (SELECT id FROM songs WHERE title = "Hyperlandia"));
INSERT INTO "playlist_songs" ("playlist_id", "song_id") VALUES ((SELECT id FROM playlists WHERE title = "SUPER DUPER COOL PLAYLIST"), (SELECT id FROM songs WHERE title = "Innerbloom"));
INSERT INTO "playlist_songs" ("playlist_id", "song_id") VALUES ((SELECT id FROM playlists WHERE title = "SUPER DUPER COOL PLAYLIST"), (SELECT id FROM songs WHERE title = "Ill be HERE"));
INSERT INTO "playlist_songs" ("playlist_id", "song_id") VALUES ((SELECT id FROM playlists WHERE title = "SUPER DUPER COOL PLAYLIST"), (SELECT id FROM songs WHERE title = "monophobia"));
INSERT INTO "playlist_songs" ("playlist_id", "song_id") VALUES ((SELECT id FROM playlists WHERE title = "SUPER DUPER COOL PLAYLIST"), (SELECT id FROM songs WHERE title = "Enigma"));
INSERT INTO "playlist_songs" ("playlist_id", "song_id") VALUES ((SELECT id FROM playlists WHERE title = "SUPER DUPER COOL PLAYLIST"), (SELECT id FROM songs WHERE title = "take me there"));
INSERT INTO "playlist_songs" ("playlist_id", "song_id") VALUES ((SELECT id FROM playlists WHERE title = "SUPER DUPER COOL PLAYLIST"), (SELECT id FROM songs WHERE title = "get away"));
INSERT INTO "playlist_songs" ("playlist_id", "song_id") VALUES ((SELECT id FROM playlists WHERE title = "SUPER DUPER COOL PLAYLIST"), (SELECT id FROM songs WHERE title = "without you"));
INSERT INTO "playlist_songs" ("playlist_id", "song_id") VALUES ((SELECT id FROM playlists WHERE title = "synthwave"), (SELECT id FROM songs WHERE title = "Pocket Story"));
INSERT INTO "playlist_songs" ("playlist_id", "song_id") VALUES ((SELECT id FROM playlists WHERE title = "synthwave"), (SELECT id FROM songs WHERE title = "Hush"));
INSERT INTO "playlist_songs" ("playlist_id", "song_id") VALUES ((SELECT id FROM playlists WHERE title = "synthwave"), (SELECT id FROM songs WHERE title = "turbo killer"));

--now user(AmirHoseinHayati) likes a couple songs
INSERT INTO "likes" ("user_id", "song_id") VALUES ((SELECT id FROM users WHERE username = "AmirHoseinHayati"), (SELECT id FROM songs WHERE title = "Hyperlandia"));
INSERT INTO "likes" ("user_id", "song_id") VALUES ((SELECT id FROM users WHERE username = "AmirHoseinHayati"), (SELECT id FROM songs WHERE title = "Hush"));
INSERT INTO "likes" ("user_id", "song_id") VALUES ((SELECT id FROM users WHERE username = "AmirHoseinHayati"), (SELECT id FROM songs WHERE title = "monophobia"));
INSERT INTO "likes" ("user_id", "song_id") VALUES ((SELECT id FROM users WHERE username = "AmirHoseinHayati"), (SELECT id FROM songs WHERE title = "shake that"));
INSERT INTO "likes" ("user_id", "song_id") VALUES ((SELECT id FROM users WHERE username = "AmirHoseinHayati"), (SELECT id FROM songs WHERE title = "Enigma"));

--lets undo the last like
DELETE FROM "likes" WHERE user_id = (SELECT id FROM users WHERE username = "AmirHoseinHayati") AND song_id = (SELECT id FROM songs WHERE title = "Enigma");

--now lets add a comment
INSERT INTO "comments" ("content", "user_id", "song_id") VALUES ("omg this is the best song i've ever listened to thank you for uploading such a masterpiece", (SELECT id FROM users WHERE username = "AmirHoseinHayati"), (SELECT id FROM songs WHERE title = "shake that"));
INSERT INTO "comments" ("content", "user_id", "song_id") VALUES ("oh yes!", (SELECT id FROM users WHERE username = "AmirHoseinHayati"), (SELECT id FROM songs WHERE title = "shake that"));
INSERT INTO "comments" ("content", "user_id", "song_id") VALUES ("i changed my mind this song is trash!", (SELECT id FROM users WHERE username = "AmirHoseinHayati"), (SELECT id FROM songs WHERE title = "shake that"));
INSERT INTO "comments" ("content", "user_id", "song_id") VALUES ("i like it", (SELECT id FROM users WHERE username = "AmirHoseinHayati"), (SELECT id FROM songs WHERE title = "shake that"));
INSERT INTO "comments" ("content", "user_id", "song_id") VALUES ("tons of love from iran", (SELECT id FROM users WHERE username = "AmirHoseinHayati"), (SELECT id FROM songs WHERE title = "Hyperlandia"));
INSERT INTO "comments" ("content", "user_id", "song_id") VALUES ("i like it", (SELECT id FROM users WHERE username = "AmirHoseinHayati"), (SELECT id FROM songs WHERE title = "monophobia"));
INSERT INTO "comments" ("content", "user_id", "song_id") VALUES ("master piece", (SELECT id FROM users WHERE username = "AmirHoseinHayati"), (SELECT id FROM songs WHERE title = "Enigma"));
INSERT INTO "comments" ("content", "user_id", "song_id") VALUES ("i like it", (SELECT id FROM users WHERE username = "AmirHoseinHayati"), (SELECT id FROM songs WHERE title = "turbo killer"));
INSERT INTO "comments" ("content", "user_id", "song_id") VALUES ("letsssss goooo", (SELECT id FROM users WHERE username = "AmirHoseinHayati"), (SELECT id FROM songs WHERE title = "Pocket Story"));

--the third comment was a mistake i want to remove it so now lets remove the comment with id of 3
DELETE FROM comments WHERE id = 3;

---for demonestrating the index usage and optimization
-- SELECT
--   u.username,
--   p.title AS playlist_title,
--   s.title AS song_title,
--   s.genre
-- FROM users u
-- JOIN playlists p ON u.id = p.user_id
-- JOIN playlist_songs ps ON p.id = ps.playlist_id
-- JOIN songs s ON ps.song_id = s.id
-- WHERE u.username = 'AmirHoseinHayati'
-- ORDER BY p.title, s.title
-- LIMIT 10;


--at last lets make the above query a view
CREATE VIEW user_playlists AS
SELECT
  u.username,
  p.title AS playlist_title,
  s.title AS song_title,
  s.genre
FROM users u
JOIN playlists p ON u.id = p.user_id
JOIN playlist_songs ps ON p.id = ps.playlist_id
JOIN songs s ON ps.song_id = s.id
WHERE u.username = 'AmirHoseinHayati'
ORDER BY p.title, s.title
LIMIT 10;

--another one
CREATE VIEW latest_songs AS
SELECT
  u.username,
  s.id,
  s.title,
  s.duration,
  s.genre,
  s.release_date,
  s.likes,
  s.comment_count
FROM songs s
INNER JOIN users u ON u.id = s.user_id
ORDER BY s.release_date DESC
LIMIT 10;
