--PostgreSQL is a powerful open source Relational Database Management System.It was initially
--created as a successor to the Ingres database system and was later named PostgreSQL.

--What is JSON.
--JSON stands for Java Script Object Notation. It is a common way to store data,
--especially in web applications. JSON data is written in key-value pairs surrounded by
--double quotes 


--Examples of JSON object
--{"email": "jackjones@gmail.com",
--"country": "United Kingdom"}

--Arrays in JSON are the way to store a collaction of values within a single JSON object.
--An array in json is represented by squire brackets [] containing comma-seperated 
--list of values 

--JSONB is a data type in Postgres that allows you to store and manipulate json data 
--in more effective and efficient way than the regular JSON data type.
--JSONB stores json in binary format which enables faster indexing and query performance 

--Creating tables with JSONB data type 

CREATE TABLE journal(
    id SERIAL PRIMARY KEY,
    day VARCHAR (30) NOT NULL,
    diary_information JSONB
);

--Inserting data 

INSERT INTO journal (day, diary_information)
VALUES ("Tuesday", '{"title": "My first day at work", "Feeling": "Mixed feeling"}');


--- Retrieving information 

SELECT * FROM journal;


---Functions and operators  allow you to store, manipulate and query data in json format 
-- in PostgreSQL

--Here are some commonly used PostgreSQL functions and operators used in working with
--json files

--  -> This operator allows you to extract a specific value from JSON object, you
-- specify the key as a "child" to the "parent"


