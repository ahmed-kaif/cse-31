❖ Query 1.1: Display the name and IMBb rating of all the movies according to
their IMDB rating (in descending order); if multiple movies have the same
IMDB rating then rearrange those movies alphabetically according to their
names.
```sql 
SELECT Movie_Name, IMDB_Rating FROM `movie` ORDER BY IMDB_Rating DESC, Movie_Name ASC; 
```

❖ Query 1.2: Find the total number of movies in the database.
```sql
SELECT COUNT(Movie_ID) FROM `movie`; 

```
❖ Query 1.3: Find how many movie-genres are there in the database.
```sql
SELECT COUNT(DISTINCT(Genre)) as No_of_Genre FROM `movie`; 
```

❖ Query 1.4: Find the total number of movies in each genre.
```sql
SELECT Genre, COUNT(Movie_Name) FROM `movie` GROUP BY Genre; 
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
SELECT Movie_Name, Genre, IMDB_Rating, Director_Name FROM `movie` as M JOIN `director` as D on M.Director_ID = D.Person_ID WHERE Director_Name IN ('Saytajit Ray', 'Zahir Raihan', 'Rituparno Ghosh', 'Kaushik Ganguly'); 
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
SELECT D.Director_Name, COUNT(M.Movie_Name) as No_Of_Films FROM `movie` as M JOIN `director` as D on M.Director_ID = D.Person_ID GROUP BY D.Director_Name; 
```

