# Level 1
**Query 1.1:** Find the name, genre, and IMDB rating of all the movies.
```sql
SELECT Movie_Name, Genre, IMDB_Rating FROM `movie`;
```
**Query 1.2:** Display all the distinct movie-genres.
```sql
SELECT Genre FROM `movie` GROUP BY Genre;
```
 Query 1.3: Find the name and current age of all the actors.
```sql
SELECT Actor_Name, (2025 - Birth_Year) as Age FROM `actor`;
SELECT Actor_Name, (Year(CURRENT_DATE) - Birth_Year) as Age FROM `actor`;
```
**Query 1.4:** Find all the movies of the thriller genre with an IMDB rating
greater than or equal to 8.0.
```sql
SELECT Movie_Name, IMDB_Rating FROM `movie` 
WHERE Genre = "Thriller" AND IMDB_Rating >= 8.0;
```
**Query 1.5:** Find the name, release year, IMDB rating, and the name of the
director of all the movies.
```sql
SELECT Movie_Name, Year, IMDB_Rating, Director_Name FROM `movie` as M 
JOIN `director` as D on M.Director_ID = D.Person_ID;
```
# Level 2

**Query 1.6:** Find the name and number of awards of those directors whose
name starts with a ‘R’ or a ‘A’.
```sql 
SELECT Director_Name, No_Of_Awards FROM `director` 
WHERE Director_Name LIKE "R%" OR Director_Name LIKE "A%";
```
**Query 1.7:** Find the name and birth year of those directors whose name
contains an ‘a’ as its 2nd last character.
```sql
SELECT Director_Name, Birth_Year FROM `director` WHERE Director_Name LIKE "%a_";
SELECT Director_Name, Birth_Year FROM `director` 
WHERE SUBSTR(Director_Name, -2, 1) = 'a';
```

**Query 1.8:** Find the name, release year, and genre of all the movies which
contain the word ‘Byomkesh’ anywhere in their name.
```sql
SELECT Movie_Name, Year, Genre FROM `movie` WHERE Movie_Name LIKE "%Byomkesh%";
```

**Query 1.9:** Find the name and IMDB rating of all the movies whose name
consists of only 2 characters.
```sql 
SELECT Movie_Name, IMDB_Rating FROM `movie` WHERE LENGTH(Movie_Name) = 2;
```
**Query 1.10:** Find the name and genre of all the movies whose name consists
of at least 3 characters.
```sql
SELECT Movie_Name, Genre FROM `movie` WHERE LENGTH(Movie_Name) >= 3;
```
**Query 1.Last:** Find the name and IMDB rating of all the movies which
contain at most 9 characters in their name.
```sql
SELECT Movie_Name, IMDB_Rating FROM `movie` WHERE LENGTH(Movie_Name) <= 9;
```
