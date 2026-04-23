-- Table: buildings (Read-only)
-- building_name	capacity
-- 1e	24
-- 1w	32
-- 2e	16
-- 2w	20



-- Table: employees (Read-only)
-- role	name	building	years_employed
-- Engineer	Becky A.	1e	4
-- Engineer	Dan B.	1e	2
-- Engineer	Sharon F.	1e	6
-- Engineer	Dan M.	1e	4
-- Engineer	Malcom S.	1e	1
-- Artist	Tylar S.	2w	2
-- Artist	Sherman D.	2w	8
-- Artist	Jakob J.	2w	6
-- Artist	Lillia A.	2w	7
-- Artist	Brandon J.	2w	7
-- Manager	Scott K.	1e	9
-- Manager	Shirlee M.	1e	3
-- Manager	Daria O.	2w	6

 Questions::1 =>> Find the list of all buildings that have employees 

 SELECT  DISTINCT building 
from employees;

Questions::2 => Find the list of all buildings and their capacity

SELECT  DISTINCT building_name , capacity 
from buildings;

Questions:: 3=> List all buildings and the distinct employee roles in each building (including empty buildings)

SELECT  b.building_name  , e.role
from buildings b
left join employees e on e.building=b.building_name
GROUP BY b.building_name, e.role

Questions 3==> Find the name and role of all employees who have not been assigned to a building

SELECT name , role
FROM employees
where building Is  null

Questions:: 4 => Find the names of the buildings that hold no employees 

SELECT b.building_name 
FROM buildings b
left join employees e on e.building=b.building_name
where name is null




-- Table: movies (Read-only)
-- id	title	director	year	length_minutes
-- 1	Toy Story	John Lasseter	1995	81
-- 2	A Bug's Life	John Lasseter	1998	95
-- 3	Toy Story 2	John Lasseter	1999	93
-- 4	Monsters, Inc.	Pete Docter	2001	92
-- 5	Finding Nemo	Andrew Stanton	2003	107
-- 6	The Incredibles	Brad Bird	2004	116
-- 7	Cars	John Lasseter	2006	117
-- 8	Ratatouille	Brad Bird	2007	115
-- 9	WALL-E	Andrew Stanton	2008	104
-- 10	Up	Pete Docter	2009	101
-- 11	Toy Story 3	Lee Unkrich	2010	103
-- 12	Cars 2	John Lasseter	2011	120
-- 13	Brave	Brenda Chapman	2012	102
-- 14	Monsters University	Dan Scanlon	2013	110



-- Table: boxoffice (Read-only)
-- movie_id	rating	domestic_sales	international_sales
-- 5	8.2	380843261	555900000
-- 14	7.4	268492764	475066843
-- 8	8	206445654	417277164
-- 12	6.4	191452396	368400000
-- 3	7.9	245852179	239163000
-- 6	8	261441092	370001000
-- 9	8.5	223808164	297503696
-- 11	8.4	415004880	648167031
-- 1	8.3	191796233	170162503
-- 7	7.2	244082982	217900167
-- 10	8.3	293004164	438338580
-- 4	8.1	289916256	272900000
-- 2	7.2	162798565	200600000
-- 13	7.2	237283207	301700000


Questions ::1==> List all movies and their combined sales in millions of dollars ✓

SELECT  m.title , (b.domestic_sales+b.international_sales)/1000000 as combined
from movies m
left join boxoffice b on b.movie_id=m.id

Question::2=> List all movies and their ratings in percent 
SELECT  m.title , b.rating * 10 AS rating_percent
from movies m
left join boxoffice b on b.movie_id=m.id

Question:: 3 => List all movies that were released on even number years 

SELECT  m.title 
from movies m
where m.year%2=0;


-- Table: employees
-- role	name	building	years_employed
-- Engineer	Becky A.	1e	4
-- Engineer	Dan B.	1e	2
-- Engineer	Sharon F.	1e	6
-- Engineer	Dan M.	1e	4
-- Engineer	Malcom S.	1e	1
-- Artist	Tylar S.	2w	2
-- Artist	Sherman D.	2w	8
-- Artist	Jakob J.	2w	6
-- Artist	Lillia A.	2w	7
-- Artist	Brandon J.	2w	7



Questions:: 1--> Find the longest time that an employee has been at the studio 

SELECT Max(years_employed) as longestTime
from employees;

Questions :: 2 --> For each role, find the average number of years employed by employees in that role 

SELECT avg(years_employed) as avgYear , role
from Employees
group by role


 Questions:: 3--> Find the total number of employee years worked in each building

 SELECT sum(years_employed) as totalYear , building
from Employees
group by building