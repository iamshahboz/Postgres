/*

It allows us to combine two tables like INNER JOINS, the difference is
a LEFT JOIN includes all the rows from the TABLE A as well as the records from TABLE B 
that have corresponding relationship and also the ones which don't have corresponding 
relationship.

Example 

Table Person

id     first_name     last_name     gender     email                   country_of_birth     car_id
1      Adriana        Matuschek     Femele     amatuschek2@gmail.com   Cameroon             
2      Tom            Kalantrick    Male       tomKa@gmail.com         Italy                2


Table Car 

id     make          model          price
1      Land Rower    Sterling       87665
2      GMC           Sedan          42155


If you go with INNER JOIN you will get Tom because Adriana don't have a car 

But with LEFT JOIN you will get both 

go to 
joins.spathon.com


*/

SELECT * FROM person LEFT JOIN car ON car.id = person.car_id;

