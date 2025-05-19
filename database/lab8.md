❖ Query 1.1: Find the name, genre, and IMDB rating of all the movies.
```sql
SELECT Movie_Name, Genre, IMDB_Rating FROM `movie`;
```

❖ Query 1.2: Display all the distinct movie-genres.
```sql
SELECT Genre FROM `movie` GROUP BY Genre;
```


❖ Query 1.3: Find the name and current age of all the actors.
```sql
SELECT Actor_Name, (2025 - Birth_Year) as Age FROM `actor`;
SELECT Actor_Name, (Year(CURRENT_DATE) - Birth_Year) as Age FROM `actor`; 
```
❖ Query 1.4: Find all the movies of the thriller genre with an IMDB rating
greater than or equal to 8.0.
```sql
SELECT Movie_Name, IMDB_Rating FROM `movie` WHERE Genre = "Thriller" AND IMDB_Rating >= 8.0;
```
❖ Query 1.5: Find the name, release year, IMDB rating, and the name of the
director of all the movies.
```sql
SELECT Movie_Name, Year, IMDB_Rating, Director_Name FROM `movie` as M JOIN `director` as D on M.Director_ID = D.Person_ID;
```

Level # 2

❖ Query 1.6: Find the name and number of awards of those directors whose
name starts with a ‘R’ or a ‘A’.
```sql 
SELECT Director_Name, No_Of_Awards FROM `director` WHERE Director_Name LIKE "R%" OR Director_Name LIKE "A%";
```
❖ Query 1.7: Find the name and birth year of those directors whose name
contains an ‘a’ as its 2nd last character.
```sql
SELECT Director_Name, Birth_Year FROM `director` WHERE Director_Name LIKE "%a_";
SELECT Director_Name, Birth_Year FROM `director` WHERE SUBSTR(Director_Name, -2, 1) = 'a'; 
```

❖ Query 1.8: Find the name, release year, and genre of all the movies which
contain the word ‘Byomkesh’ anywhere in their name.
```sql
SELECT Movie_Name, Year, Genre FROM `movie` WHERE Movie_Name LIKE "%Byomkesh%"; 
```

❖ Query 1.9: Find the name and IMDB rating of all the movies whose name
consists of only 2 characters.
```sql 
SELECT Movie_Name, IMDB_Rating FROM `movie` WHERE LENGTH(Movie_Name) = 2;
```
❖ Query 1.10: Find the name and genre of all the movies whose name consists
of at least 3 characters.
```sql
SELECT Movie_Name, Genre FROM `movie` WHERE LENGTH(Movie_Name) >= 3;
```
❖ Query 1.Last: Find the name and IMDB rating of all the movies which
contain at most 9 characters in their name.
```sql
SELECT Movie_Name, IMDB_Rating FROM `movie` WHERE LENGTH(Movie_Name) <= 9;
```


Lab 6th Cycle
❖ Query 1.1: Display the name and IMBb rating of all the movies according to
their IMDB rating (in descending order); if multiple movies have the same
IMDB rating then rearrange those movies alphabetically according to their
names.
```sql
SELECT Movie_Name, IMDB_Rating FROM `movie` ORDER BY IMDB_Rating DESC, Movie_Name ASC;
```


❖ Query 1.2: Find the total number of movies in the database.
```sql
SELECT COUNT(Movie_ID) as `Total Movies` FROM `movie`;
```

❖ Query 1.3: Find how many movie-genres are there in the database.
```sql
SELECT COUNT(DISTINCT(Genre)) as No_of_Genre FROM `movie`;
```


❖ Query 1.4: Find the total number of movies in each genre.
```sql
SELECT Genre, COUNT(Movie_ID) as `No Of Movies` FROM `movie` GROUP BY Genre;
```


❖ Query 1.5: Find the average IMDB rating of all the movies of the drama
genre.
```sql
SELECT ROUND(AVG(IMDb_Rating),2) as `Avg_IMDb_Rating` FROM `movie` WHERE Genre = 'Drama';
```


Level # 2
❖ Query 2.1: Find the number of movies directed by a director on average.
```sql
SELECT SUM(No_Of_Films) / COUNT(Person_ID) as `Avg_No_of_Movie` FROM `director`;
```


❖ Query 2.2: Find the name, genre, IMDb rating and the name of the director
of all the movies directed by Satyajit Ray, Zahir Raihan, Rituparno Ghosh
and Kaushik Ganguly.
```sql
SELECT Movie_Name, Genre, IMDB_Rating, Director_Name FROM `movie` as M JOIN `director` as D on M.Director_ID = D.Person_ID WHERE Director_Name IN ('Satyajit Ray', 'Zahir Raihan', 'Rituparno Ghosh', 'Kaushik Ganguly');
```


❖ Query 2.3: Find the name and current age of all the directors and actors.
```sql
(SELECT Director_Name as Name, (Year(CURRENT_DATE) - Birth_Year) as Age FROM `director`) UNION (SELECT Actor_Name as Name, (Year(CURRENT_DATE) - Birth_Year) as Age FROM `actor`);
```

❖ Query 2.4: Find the name, current age, number of films as an actor and
number of films as a director of those actors who directed at least one film.
```sql
SELECT A.Actor_Name as Name, (Year(CURRENT_DATE) - A.Birth_Year) as Age, A.`No_Of_Films` as `No of Film as Actor`, D.`No_Of_Films` as `No of Film as Director` FROM `actor` as A JOIN `director` as D on A.Actor_Name = D.Director_Name;
```


❖ Query 2.5: Consider that there is no No_of_Films attribute in the Director
relation. Now find the name of all the directors and number of movies
directed by each director.
```sql
SELECT D.Director_Name, COUNT(M.Movie_ID) as No_Of_Films FROM `movie` as M JOIN `director` as D on M.Director_ID = D.Person_ID GROUP BY D.Director_Name;
```




Lab 7th Cycle

❖ Query 1.1: Display the name, IMDb rating and genre of all the movies with
an IMDB rating greater than or equal to 8.0.
❖ Query 1.2: Find how many movies are there in each genre with an IMDB
rating less than or equal to 8.0.
SELECT Genre, COUNT(Movie_ID) No_of_Movies FROM `movie` WHERE IMDB_Rating <= 8.0 GROUP BY Genre;

❖ Query 1.3: Find the name and the average IMDb rating of those genres
whose average IMDb rating is less than or equal to 8.0.
SELECT Genre, AVG(IMDB_Rating) FROM `movie` GROUP BY Genre HAVING AVG(IMDB_Rating) <= 8.0;



❖ Query 1.4: Find the name, number of films and number of awards of the
director who directed the most number of movies.
SELECT Director_Name, No_Of_Films, No_Of_Awards FROM `director` WHERE No_Of_Films = (SELECT MAX(No_Of_Films) FROM `director`);



❖ Query 1.5: Find the name, current age, number of films and number of
awards of the youngest actor.
SELECT Actor_Name, No_Of_Films, No_Of_Awards FROM `actor` WHERE Birth_Year = (SELECT MAX(Birth_Year) FROM `actor`);




Level # 2
❖ Query 2.1: Find the name, number of films as a director, number of films as
an actor, number of awards as a director and number of awards as an actor of
all the directors. (If a director never acted in any film then number of films
and number of awards as an actor will be null)
SELECT D.Director_Name as Name, D.No_Of_Films as `No of Films as Director`, D.No_Of_Awards `No of Awards as Director`, A.No_Of_Films `No of Films as Actor`, A.No_Of_Awards `No of Awards as Actor` FROM `director` as D LEFT OUTER JOIN `actor` as A using (Person_ID);


❖ Query 2.2: Find the name, number of films as a director, number of films as
an actor, number of awards as a director and number of awards as an actor of
all the actors and directors.
SELECT * FROM `director` LEFT OUTER JOIN `actor` USING (Person_ID) UNION SELECT * FROM `director` RIGHT OUTER JOIN `actor` USING (Person_ID);



❖ Query 2.3: Find the name, number of films and number of awards of those
actors who never directed any film.
SELECT Actor_Name, No_Of_Films, No_Of_Awards FROM `actor` WHERE Person_ID not in (SELECT Person_ID FROM director);


❖ Query 2.4: Find the name, IMDb rating and genre of those movies whose
IMDb Rating is above average.
SELECT Movie_Name, IMDB_Rating, Genre FROM `movie` WHERE IMDB_Rating > (SELECT AVG(IMDB_Rating) FROM `movie`);


❖ Query 2.5: Among the average IMDb ratings of all the movie genres, find
the highest average IMDb rating.

SELECT Genre, AVG(IMDB_Rating) as Avg_Rating FROM `movie` GROUP BY Genre Having Avg_Rating = (SELECT Max(Avg_Rating) FROM (SELECT Genre, AVG(IMDB_Rating) as Avg_Rating FROM `movie` GROUP BY Genre) as Genre_avg);

with genre_avg(genre, avg_val) as (select Genre, AVG(IMDB_Rating) as Avg_Rating FROM `movie` GROUP BY Genre), max_avg(val) as (select max(avg_val) from genre_avg)
select * from genre_avg where genre_avg.avg_val = max_avg.val;

Cycle 8 Queries

Cycle 8 Queries

Level # 1
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
# Level 2
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

