/*
OUTER JOIN keeps everything, 
it doesn't matter if there is no match 



*/

SELECT * FROM person LEFT OUTER JOIN car ON car.id = person.car_id
UNION 
SELECT * FROM person RIGHT OUTER JOIN car on car.id = person.car_id;


/* or */

SELECT * FROM person FULL OUTER JOIN car on car.id = person.car_id;

