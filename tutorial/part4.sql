--alias. 
/*
Imagine you have a query and as the result you have two tables with the same names which is not good.
What you can do is, to have an alias 

*/
SELECT first_name as "customer_name" from person;


--coalesce 
/*

There might be a situation in which you have to handle NULL values.
It allow us to have a default value in case the first one is not present 


*/

--lets create a table 
CREATE TABLE items (
    ID serial PRIMARY KEY,
    product VARCHAR (100) NOT NULL,
    price NUMERIC NOT NULL,
    discount NUMERIC
);

INSERT INTO items (product, price, discount)
VALUES
    ('A', 1000, 10),
    ('B', 1500, 20),
    ('C', 800, 5),
    ('D', 500, NULL);

-- if you do select 
SELECT product, (price-discount) AS net_price 
FROM items;

-- as output for product D you will see empty

/*
You can handle null values now

*/

SELECT product, (price - COALESCE(discount, 0)) AS net_price from items;
