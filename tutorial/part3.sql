/* Lets say we want to grab the people who's country of birth is France or China or Brasil */

SELECT * FROM person WHERE country_of_birth = 'France' OR country_of_birth = 'China' OR country_of_birth = 'Brasil';

-- we can use IN operator to simplify the query
SELECT * FROM person WHERE country_of_birth IN ('France','China','Brasil');

-- to select data from a range we can use BETWEEN keyword
SELECT * FROM person WHERE date_of_birth BETWEEN DATE '2020-01-01' AND '2024-01-01';

-- we can use LIKE operator to search for a pattern
SELECT * FROM person WHERE email LIKE '%@bloomberg.com';

-- lets say we want to select all the people who's name starts with 'S'
SELECT * FROM person WHERE first_name LIKE 'S%';

-- we can use ILIKE to ingore the case sensitivity
SELECT * FROM person WHERE first_name ILIKE 's%';

-- we can group the data based on the column
-- lets say we want to find out how many people are there from each country
SELECT DISTINCT country_of_birth, COUNT(*) FROM person GROUP BY country_of_birth;

-- we have HAVING keyword which works with GROUP BY and it is used to filter the data after grouping
-- in addition lets say we want to grab all the countries which have at least 40 people
SELECT country_of_birth, COUNT(*) FROM person GROUP BY country_of_birth HAVING COUNT (*) > 40;




