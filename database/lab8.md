# Cycle 8 Queries

## Level 1
❖ Query 1.1: Find the name and age of all the movie-characters who are not
Teenagers.
```sql
SELECT Character_Name, Age FROM `movie_characters` WHERE Age < 13 OR Age > 19;
```

❖ Query 1.2: Find the movie ID of all the movies and the number of
movie-characters in each movie.
```sql
SELECT Movie_ID, COUNT(Character_ID) FROM `movie_character_relationship` GROUP BY Movie_ID;
```

❖ Query 1.3: Find the movie name of all the movies and the number of
movie-characters in each movie.
```sql
SELECT Movie_Name, COUNT(Character_ID) FROM `movie_character_relationship` NATURAL JOIN `movie` GROUP BY Movie_Name;
```
❖ Query 1.4: Find the name, year of release, IMDB rating and the name of the
director of all the movies that contain at most 12 characters (including
spaces) in their name.
```sql
SELECT Movie_Name, Year, IMDB_Rating, Director_Name FROM `movie` join `director` on `movie`.`Director_ID` = `director`.`Person_ID` WHERE LENGTH(Movie_Name) <= 12;
```
❖ Query 2.5: Display the name and the IMDb rating of the movie with the
highest IMDb rating in each genre.

```sql
SELECT Movie_Name, IMDB_Rating FROM `movie` WHERE (Genre, IMDB_Rating) In (SELECT Genre, MAX(IMDB_Rating) as max_rating FROM `movie` GROUP BY Genre);
```
## Level 2
❖ Query 2.1: Find the name, year of release, IMDB rating of all the movies of
Byomkesh (N.B.: A movie of Byomkesh may not contain the term
‘Byomkesh’ in its name).
```sql
SELECT Movie_Name, Year, IMDB_Rating FROM `movie` WHERE `movie`.`Movie_ID` in (SELECT Movie_ID FROM `movie_character_relationship` WHERE `movie_character_relationship`.Character_ID = (SELECT Character_ID FROM `movie_characters` WHERE Character_Name = "Byomkesh Bakshi"));
```
❖ Query 2.2: Find the name of all the movies and, the name & the age of the
youngest movie-character in each movie.
```sql
SELECT Movie_Name, Character_Name, Age FROM `movie` NATURAL JOIN `movie_character_relationship` NATURAL JOIN `movie_characters` WHERE (Movie_ID, Age) in (SELECT Movie_ID, MIN(Age) as min_age FROM movie_character_relationship NATURAL JOIN movie NATURAL JOIN movie_characters GROUP By Movie_ID);
```
❖ Query 2.3: Find the name and age of all the characters from the movies of
Feluda (N.B.: A movie of Feluda may not contain the term ‘Feluda’ in its
name).
```sql
(SELECT * FROM movie_character_relationship NATURAL JOIN movie NATURAL JOIN movie_characters);
SELECT Character_Name, Age FROM movie_characters WHERE Character_ID in (SELECT Character_ID FROM movie_character_relationship WHERE Movie_ID in (SELECT Movie_ID FROM `movie_character_relationship` WHERE `movie_character_relationship`.Character_ID = (SELECT Character_ID FROM `movie_characters` WHERE Character_Name = "Feluda")));
```

