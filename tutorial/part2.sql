/*
Lets select country of birth from the person table
*/
SELECT country_of_birth FROM person;

-- you may notice that the country of birth is duplicated, we can use DISTINCT to remove duplications

SELECT DISTINCT country_of_birth FROM person ORDER BY country_of_birth; -- this retrieves all the countries without duplications

-- we can use WHERE to filter the data, for example, we can select all the people born in Canada

SELECT * FROM person WHERE country_of_birth = 'Canada';

-- we can have multiple conditions in the WHERE clause

SELECT * FROM person WHERE country_of_birth = 'Canada' AND gender = 'Male';

-- we can use OR operator as well
SELECT * FROM person WHERE country_of_birth ='Canada' OR country_of_birth = 'China';

-- we can perform comparison operations 
SELECT 1 = 1; -- this will return true
SELECT 1 = 2; -- this will return false








