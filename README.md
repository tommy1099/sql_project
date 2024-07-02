# Design Document

by Amir Hosein Hayati

Video overview: [Youtube Link](https://youtu.be/nmHMIIPh5Dg?si=TWp2uG__ksSY9Gv-)

[![](https://mermaid.ink/img/pako:eNqtVW1v2jAQ_iuW-zUgCGxApn1YVzRN2otUmDStdJEbH2Dh2JHtqE2B_z4nJpCkRaBR-0Piu-denvPZXuNIUsABBnXDyEKReCaQHakGpdFm02rJNUo4yTjTRqMARQqIAf0KSkuxyBFpwiWhNcTaLfLx9cd0_GV8ixg9yKbj39MCKUgMDTHEhPGGLCFaP0pV8XDzaTpGD0yZZUhteg2Fy5mGxDQUaUJriq37HPhuZau12RwEYUkyksIQJnTT4BymhhnepElBR4olhknx0kNempDRt2K1I3Ei1VJWmoWvKXNPl2fm8jlVa2vHRNXgP2pd4miqSL3WBXoBQjWbRwEHoqHRV6UjzlblYaiKIxnHIEwYyVSYMza0iM4zxSJ9YS13kd2p3BxOZSkPS9JNoDupAXpUzBgQ4UPWwJ1T7nyr4CzGb9tBxTY0KVf2pqYvmeZCuufpIGceigvp2Kyxh2NQ9nKj9vItos6wWYK9_3BgfylRqxn2KvLPk0muunMeZrgNqm17s2hjvWTJN_IAHK3RnHEeoJ-KiAV8sJGck6MW1_Jpb3TNSbR6aWM3lJmsCrzyaT6PQeupXM07-ayD7xj9-9GhW78m49t7dCRSL8rnCSL2crAW2ii5gnpAZ3I_E67kJDVykokIB0al4GEl08USB3PCtV255tq9g3tpQsQfKePSxC5xsMZPOOiOBu2eP-oMup1-f-R3h0MPZzjw_XbHjp7f9630_eDdcOvh58JD18NAmZHqu3t0i7d3-w9si0M3?type=png)](https://mermaid.live/edit#pako:eNqtVW1v2jAQ_iuW-zUgCGxApn1YVzRN2otUmDStdJEbH2Dh2JHtqE2B_z4nJpCkRaBR-0Piu-denvPZXuNIUsABBnXDyEKReCaQHakGpdFm02rJNUo4yTjTRqMARQqIAf0KSkuxyBFpwiWhNcTaLfLx9cd0_GV8ixg9yKbj39MCKUgMDTHEhPGGLCFaP0pV8XDzaTpGD0yZZUhteg2Fy5mGxDQUaUJriq37HPhuZau12RwEYUkyksIQJnTT4BymhhnepElBR4olhknx0kNempDRt2K1I3Ei1VJWmoWvKXNPl2fm8jlVa2vHRNXgP2pd4miqSL3WBXoBQjWbRwEHoqHRV6UjzlblYaiKIxnHIEwYyVSYMza0iM4zxSJ9YS13kd2p3BxOZSkPS9JNoDupAXpUzBgQ4UPWwJ1T7nyr4CzGb9tBxTY0KVf2pqYvmeZCuufpIGceigvp2Kyxh2NQ9nKj9vItos6wWYK9_3BgfylRqxn2KvLPk0muunMeZrgNqm17s2hjvWTJN_IAHK3RnHEeoJ-KiAV8sJGck6MW1_Jpb3TNSbR6aWM3lJmsCrzyaT6PQeupXM07-ayD7xj9-9GhW78m49t7dCRSL8rnCSL2crAW2ii5gnpAZ3I_E67kJDVykokIB0al4GEl08USB3PCtV255tq9g3tpQsQfKePSxC5xsMZPOOiOBu2eP-oMup1-f-R3h0MPZzjw_XbHjp7f9630_eDdcOvh58JD18NAmZHqu3t0i7d3-w9si0M3)

## Scope

- The purpose of this database is to create a platform similar to SoundCloud where users can upload songs, create playlists, write comments, and interact with each other's content. The database includes entities such as users, playlists, songs, comments, and likes.
- The database is focused on music-related data and user interactions. It does not include entities or data related to other types of media or non-music related user activities.

## Functional Requirements

- Users should be able to create an account and manage their profile information Upload songs, create playlists and add songs to them write comments on songs Like songs

- The database should not allow users to upload non-music files or content Directly modify or delete other users' data (e.g., comments, playlists) Perform administrative tasks like managing user roles or permissions


## Representation

### Entities

- User
```
id (int, primary key)
username (string)
email (string)
password (string)
date_of_birth (date)
created_at (timestamp)
updated_at (timestamp)
```

- Playlist

```id (int, primary key)
title (string)
description (string)
user_id (int, foreign key referencing USER)
created_at (timestamp)
updated_at (timestamp)
```


- Song

```id (int, primary key)
title (string)
duration (int, seconds)
genre (string)
release_date (date)
likes (int)
comment_count (int)
uploaded_by_user_id (int, foreign key referencing USER)
lyrics (text)
created_at (timestamp)
updated_at (timestamp)
```

- Comment

 ```id (int, primary key)
content (text)
user_id (int, foreign key referencing USER)
song_id (int, foreign key referencing SONG)
created_at (timestamp)
updated_at (timestamp)
```

- Like

```id (int, primary key)
user_id (int, foreign key referencing USER)
song_id (int, foreign key referencing SONG)
created_at (timestamp)
```



### Relationships

- A user can create multiple playlists, and a playlist is created by one user (one to many relationship).

- A user can upload multiple songs, and a song is uploaded by one user (one to many relationship).

- A playlist can contain multiple songs, and a song can be part of multiple playlists (many to many relationship).

- A user can like multiple songs, and a song can be liked by multiple users (many to many relationship).

- A user can play multiple songs, and a song can be played by multiple users (many to-many relationship).

## Optimizations
```
CREATE INDEX "index_username" ON "User" ("username");
```
- This index will speed up queries that filter or sort users by their username.
```
CREATE INDEX "index_email" ON "User" ("email");
```
- This index will speed up queries that filter or sort users by their email address.
```
CREATE INDEX "index_user_id_from_playlist" ON "Playlist" ("user_id");
```
- This index will speed up queries that filter or join playlists by the user who created them.
```
CREATE INDEX "index_user_id_and_song_id_from_like" ON "Like" ("user_id", "song_id");
```
- This composite index will speed up queries that filter or sort likes by the combination of user and song.

```
CREATE INDEX "index_song_id_from_comment" ON "Comment" ("song_id");
```
- This index will speed up queries that filter or join comments by the song they are associated with.
```
CREATE INDEX "index_user_id_from_comment" ON "Comment" ("user_id");
```
- This index will speed up queries that filter or join comments by the user who made them.
```
CREATE INDEX "index_user_id_from_song" ON "Song" ("user_id");
```
- This index will speed up queries that filter or join songs by the user who uploaded them.
```
CREATE INDEX "index_genre_from_song" ON "Song" ("genre");
```
- This index will speed up queries that filter or sort songs by their genre.
```
CREATE INDEX "index_playlist_id_and_song_id_from_playlist_songs" ON "playlist_songs" ("playlist_id", "song_id");

```
- This index will help optimize the performance of the triggers that update the playlists table when a song is added or removed from a playlist.
```
CREATE INDEX "index_user_id_and_song_id_from_comments" ON "comments" ("user_id", "song_id");

```
- This index will help optimize the performance of the triggers that update the songs table when a comment is added or removed.

## Limitations

- It does not support playlists being shared or collaborated on by multiple users.
- It does not include features for reporting inappropriate content or flagging issues with songs, comments, or users.
- It does not support advanced search or recommendation features.
