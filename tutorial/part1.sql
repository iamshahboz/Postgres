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

time 43:14

 */


