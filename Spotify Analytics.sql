# For this project, I downloaded Spotify data from Kaggle, created a table to store the data, and then used SQL to analyze the information.

# Creating the table: 

CREATE TABLE DB.Spotifydata (
id integer PRIMARY KEY,
artist_name varchar NOT NULL,
track_name varchar NOT NULL,
track_id varchar NOT NULL,
popularity integer NOT NULL,
danceability decimal(4,3) NOT NULL,
energy decimal(4,3) NOT NULL,
song_key integer NOT NULL,
loudness decimal(5,3) NOT NULL,
song_mode integer NOT NULL,
speechiness decimal(5,4) NOT NULL,
acousticness decimal(6,5) NOT NULL,
instrumentalness decimal(8,7) NOT NULL,
liveness decimal(5,4) NOT NULL,
valence decimal(4,3) NOT NULL,
tempo decimal(6,3) NOT NULL,
duration_ms integer NOT NULL,
time_signature integer NOT NULL );

# Then, I inserted the Spotify Data .csv into the table.

# Next, I explored the data using the following SQL. 

# First, I determined the avg danceability by artist and track. 

/*What is the average danceability by artist and track? */

SELECT artist_name, track_name, AVG(danceability)

AS average_danceability

FROM Spotifydata;

# Next, I determined who the Top 10 artists are by popularity.

/*Who are the top 10 artists based on popularity? */

SELECT artist_name AS Artist, popularity,track_name AS song

FROM Spotifydata

GROUP BY artist_name

ORDER BY popularity DESC 

LIMIT 10;


# Then, I determined the average danceability by Top 10 popular songs.

/*What's the average danceability for the 10 most popular songs*/

SELECT popularity,AVG(danceability),track_name

FROM spotifydata

GROUP BY track_name

ORDER BY popularity DESC

LIMIT 10;


# Finally, I determined what 5 artiists had the longest songs.

/*What 5 artists released the longest song? */

SELECT artist_name,MAX(duration_ms)

AS duration

FROM spotifydata

GROUP BY artist_name

ORDER BY duration DESC

LIMIT 5;
