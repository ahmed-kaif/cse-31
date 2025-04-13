# String Operations

## Pattern Matching
% = Any substring
_ = Any character

+ Movie Starts with V
```sql
SELECT * FROM Movie WHERE Movie_Name LIKE "V%"
```
+ Movie Name whose 2nd character is T
```sql
SELECT * FROM Movie WHERE Movie_Name LIKE "_T%"
```
