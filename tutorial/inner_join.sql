/*
By default when you say JOIN INNER JOIN will be used 

You have a table A and a table B, what you want to do is to combine these two.
INNER JOIN takes whatever is common in both tables. 

Example

Table Person

id     first_name     last_name     gender     email                   country_of_birth     car_id
1      Adriana        Matuschek     Femele     amatuschek2@gmail.com   Cameroon             1

Table Car 

id     make          model          price
1      Land Rower    Sterling       87665
2      GMC           Sedan          42155



*/

SELECT * FROM person JOIN car ON person.car_id = car.id;
