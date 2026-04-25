  Question::1 ==> Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name). If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.
The STATION table is described as follows:


SELECT * FROM (
    SELECT city, LENGTH(city) AS le
    FROM station
    ORDER BY LENGTH(city), city
    FETCH FIRST 1 ROW ONLY
) AS t1

UNION

SELECT * FROM (
    SELECT city, LENGTH(city) AS le
    FROM station
    ORDER BY LENGTH(city) DESC, city
    FETCH FIRST 1 ROW ONLY
) AS t2;  