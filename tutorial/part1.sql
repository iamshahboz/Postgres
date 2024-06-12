/*
Note, that all the commands are run in psql

Create database 

*/
CREATE DATABASE test_db;

/* list the databases */
\l 

/* how to connect to databases */

psql -h localhost -p 5432 -U postgres test

/* Delete db */
DROP DATABASE test_db;

/* Create table

CREATE TABLE table_name (
    Column name + data type + constraints if any
)

 */

 CREATE TABLE person(
    id SERIAL NOT NULL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender VARCHAR(7) NOT NULL,
    date_of_birth DATE NOT NULL
    email VARCHAR(150)
 );

 /* 
 \d person - this command will describe the table we created
 */

 /* inserting data to the table 
 note that you should never use double quotes
  */

  INSERT INTO person(
    first_name,
    last_name,
    gender,
    date_of_birth,
    email 
  ) VALUES ('Anna','Tamanova','FEMELE', date '1992-09-12','annatam@gmail.com');
 

 
 



