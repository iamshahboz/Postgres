
--Here are some tips for optimizing Postgres queries

--1 Use Indexes 

/*
Suppose you have a table named users with columns id, name and email
If you frequently search for users by their email, you can create index on the email
column like this 

*/
CREATE index users_email_idx on users(email);


/*
Suppose you have a query that joins two tables and returns the total number of rows 
*/

EXPLAIN SELECT COUNT(*) FROM table1 JOIN table2  ON table1.id = table2.table1_id;

--This command will output the execution plan for the query which can help you
--identify the performance issues 

--Avoid using wildcard characters 

SELECT * FROM users WHERE email LIKE '%@example.com';

--This query will perform the sequential scan of the entire users table which can be slow 


SELECT * FROM users WHERE email LIKE '@example.com%'

--this query will use the index we created earlier

--You can also use LIMIT 

SELECT * FROM users LIMIT 100;

--5 Use appropriate data type 

ALTER TABLE users ALTER column age TYPE smallint;


-- Use prepared statement 

SELECT * FROM users WHERE name = 'John';
-- If you execute this miltiple times with different names you can improve 
-- the performance by using prepared statements 


-- you can do like this 

PREPARE get_users_by_name (text) as SELECT * FROM users WHERE name =$1;
EXECUTE get_users_by_name('John')
EXECUTE get_users_by_name('Jane')

--6 Use IN predicate when querying an index column

SELECT * FROM sales WHERE product_id = 4 or product_id = 7

--Improved query
SELECT * FROM sales WHERE product_id IN (4,7)


--7 Use UNION ALL insted of UNION if possibe, because the first one is faster

SELECT customer_id FROM sales UNION SELECT customer_id FROM customers;

--improved query

SELECT customer_id FROM sales UNION ALL SELECT customer_id FROM customers;


--Avoid using aggregate functions on the right side of the operator

SELECT * FROM sales WHERE EXTRACT (YEAR FROM TO_DATE(time_id,'DD-MM-YYYY'))=2021
AND EXTRACT (MONTH FROM TO_DATE (time_id,'DD-MM-YYYY')) = 2002;

--Improved query

SELECT * FROM sales WHERE TRUNC(TO_DATE('12-01-2001','mm/dd/yyyy')) AND
TRUNC (TO_DATE(TO_DATE('12-30-2001','mm/dd/yyyy')));


--8 SELECT FIELD instead of SELECT *

--inefficient 
SELECT * FROM customers;

--efficient

SELECT first_name, last_name, address, city, state, zip FROM customers;


--9 Avoid using SELECT DISTINCT


