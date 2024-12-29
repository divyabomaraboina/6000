-- Selecting values
select * from user;
select * from artist;
-- Retriving users with their playlist
SELECT user.*,playlist.*
FROM User
JOIN playlist ON user.userid = playlist.userid;

-- Retriving users with their songs with Artists having genre as Rock
select distinct song.*,Artist.Artistname,Artist.Bio from 
song join Artist on 
song.Artistid=Artist.Artistid where song.genre like '%Rock%' ;  

-- Retriving users playlist and their preferences for generating recommendation.
Select playlist.* , preference.genre from playlist join preference on preference.preferenceId= playlist.preferenceId and 
playlist.userid=preference.userid where genre like '%Pop%';

-- Retriving average Duration of song , max duration of song , highest rating by genre

SELECT MAX(song.duration) AS max_duration, song.genre,max(rating.rating) as max_rating
FROM song join rating on song.songid= rating.songid
GROUP BY song.genre order by  max_duration desc;


-- Retriving album of artists.

select album.albumName,album.releaseDate,
album.songname,artist.artistname,
artist.bio from album join artist on artist.artistid= album.artistid ; 

-- Retrieve all users along with their most recent activity
SELECT User.username, Activity.Action, Activity.Timestamp
FROM User
JOIN Activity ON User.userid = Activity.UserId
ORDER BY Activity.Timestamp DESC
LIMIT 1;

-- Retrieve all users who have rated songs, along with the number of songs they have rated:
SELECT User.username, COUNT(Rating.ratingid) AS num_ratings
FROM User
JOIN Rating ON User.userid = Rating.userid
GROUP BY User.username;

-- Retrieve all songs that belong to playlists created by a user:
SELECT Song.songname, Playlist.playlistName
FROM Song
JOIN Preference ON Song.songid = Preference.songid
JOIN Playlist ON Preference.preferenceId = Playlist.preferenceId
JOIN User ON Playlist.userid = User.userid ;