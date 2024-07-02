--User table
CREATE TABLE IF NOT EXISTS "users"(
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "username" TEXT UNIQUE NOT NULL CHECK(LENGTH("username") > 8),
    "email" TEXT UNIQUE NOT NULL,
    "password" TEXT NOT NULL CHECK(LENGTH("password") > 8), --not hashed
    "birth_date" DATE NOT NULL CHECK ("birth_date" >= '1900-01-01' AND "birth_date" <= CURRENT_DATE),
    "created_at" DATE NOT NULL DEFAULT CURRENT_DATE,
    "updated_at" DATE
);

--Playlist table
CREATE TABLE IF NOT EXISTS "playlists" (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "title" TEXT NOT NULL CHECK(LENGTH("title") > 0),
    "description" TEXT NOT NULL CHECK(LENGTH("description") > 0),
    "user_id" INTEGER,
    "created_at" DATE NOT NULL DEFAULT CURRENT_DATE,
    "updated_at" DATE,
    FOREIGN KEY("user_id") REFERENCES "users"("id")
);
--the songs inside a playlist table
CREATE TABLE IF NOT EXISTS "playlist_songs" (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "playlist_id" INTEGER,
    "song_id" INTEGER,
    UNIQUE("playlist_id", "song_id"),
    FOREIGN KEY("playlist_id") REFERENCES "playlists"("id"),
    FOREIGN KEY("song_id") REFERENCES "songs"("id")
);

--Liked songs table
CREATE TABLE IF NOT EXISTS "likes" (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "user_id" INTEGER,
    "song_id" INTEGER,
    "created_at" DATE NOT NULL DEFAULT CURRENT_DATE,
    UNIQUE("user_id", "song_id"),
    FOREIGN KEY("user_id") REFERENCES "users"("id"),
    FOREIGN KEY("song_id") REFERENCES "songs"("id")
);

--Comments on the songs table
CREATE TABLE IF NOT EXISTS "comments" (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "content" TEXT NOT NULL CHECK(LENGTH("content") > 0),
    "user_id" INTEGER,
    "song_id" INTEGER,
    "created_at" DATE NOT NULL DEFAULT CURRENT_DATE,
    "updated_at" DATE,
    FOREIGN KEY("user_id") REFERENCES "users"("id"),
    FOREIGN KEY("song_id") REFERENCES "songs"("id")
);

--Song table
CREATE TABLE IF NOT EXISTS "songs" (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "title" TEXT NOT NULL,
    "duration" INTEGER NOT NULL,
    "genre" TEXT NOT NULL,
    "release_date" DATE NOT NULL DEFAULT CURRENT_DATE,
    "likes" INTEGER NOT NULL DEFAULT 0 CHECK("likes" >= 0),
    "comment_count" INTEGER NOT NULL DEFAULT 0,
    "user_id" INTEGER,
    "lyrics" TEXT NOT NULL,
    "created_at" DATE NOT NULL DEFAULT CURRENT_DATE,
    "updated_at" DATE,
    FOREIGN KEY("user_id") REFERENCES "users"("id")
);

--Triggers
-- when someone likes a song
CREATE TRIGGER update_song_likes
AFTER INSERT ON likes
FOR EACH ROW
BEGIN
  UPDATE songs
  SET likes = likes + 1
  WHERE id = NEW.song_id;
END;
--when someone deletes a like(dremove their given  like)
CREATE TRIGGER decrement_song_likes
AFTER DELETE ON likes
FOR EACH ROW
BEGIN
    UPDATE songs
    SET likes = likes - 1
    WHERE id = OLD.song_id;
END;
-- for adding a comment
CREATE TRIGGER increment_comment_count
AFTER INSERT ON comments
FOR EACH ROW
BEGIN
    UPDATE songs
    SET comment_count = comment_count + 1
    WHERE id = NEW.song_id;
END;
-- for removing the comment
CREATE TRIGGER decrement_comment_count
AFTER DELETE ON comments
FOR EACH ROW
BEGIN
    UPDATE songs
    SET comment_count = comment_count - 1
    WHERE id = OLD.song_id;
END;
--Indexes
CREATE INDEX "index_username_from_users" ON "users" ("username");
CREATE INDEX "index_email_from_users" ON "users" ("email");
CREATE INDEX "index_user_id_from_playlists" ON "playlists" ("user_id");
CREATE INDEX "index_song_ids_from_playlists" ON "playlists" ("song_ids");
CREATE INDEX "index_user_id_and_song_id_from_likes" ON "likes" ("user_id", "song_id");
CREATE INDEX "index_song_id_from_comments" ON "comments" ("song_id");
CREATE INDEX "index_user_id_from_comments" ON "comments" ("user_id");
CREATE INDEX "index_user_id_from_songs" ON "songs" ("user_id");
CREATE INDEX "index_genre_from_songs" ON "songs" ("genre");
CREATE INDEX "index_playlist_id_and_song_id_from_playlist_songs" ON "playlist_songs" ("playlist_id", "song_id");
CREATE INDEX "index_user_id_and_song_id_from_comments" ON "comments" ("user_id", "song_id");


