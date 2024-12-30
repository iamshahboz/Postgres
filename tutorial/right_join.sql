/*
The idea of the RIGHT JOIN is the same as LEFT JOIN
but instead of keeping the rows in the original table (the one we are querying from )
it keeps a row on the joined table 

If the corresponding original table don't have value we set it to NULL



*/

SELECT * FROM person RIGHT JOIN car ON car.id = person.car_id;