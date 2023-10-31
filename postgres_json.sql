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

SELECT day, diary_information->'Feeling' as Feeling
FROM journal;

-- ->> This operator allows you to extract a JSON object field as text without the quotes
--around it from a json object 

SELECT day, diary_information->> 'Feeling' as Feeling 
FROM journal;

--json_agg This function aggregates JSON values into a json array

--For instance 
SELECT json_agg(my_column) FROM my_table; --will return a json array containing the values
-- in the "my_column" column of "my_table" table 

--jsonb_set This function updates a JSON object with the new value. For example 

UPDATE my_table SET json_column = jsonb_set(
    json_column, '{field_name}, "new_value"'

) WHERE id=1


--For example 
UPDATE journal 
SET diary_information = jsonb_set(
    diary_information, '{Feeling}', '"Exited"'
) WHERE id =1;


--JSON_BUILD_OBJECT 
--You can use JSON_BUILD_OBJECT function to insert a plain text record and this will
--convert it to JSON data.

JSON_BUILD_OBJECT('Morning','Everybody is annoying today','Evening','Cannot wait to go home')


--This will create a value that looks like this 
{"Morning":"Everybody is annoying today","Evening":"Cannot wait to go home"}


--Using this function in an insert statement 

INSERT INTO journal (day,feeling)
VALUES (
    'Wednesday', 
    JSON_BUILD_OBJECT(
        'Tired',
        'Everybody is annoying today',
        'Hungry',
        'Can not wait to go home'
    )
);

--How to insert JSON arrays into tables

--Suppose you have a table callaed employees with columns id, name and skills.
--The skill column stores an array of JSON object representing the skills of each
--employee 

--To insert a new employee record with the following details 

/*

id 1
name John
skills [{"name": "Python","level":"Intermediate"},{"name": "JavaScript","level":"Expert"}]

You can use the following statement

*/

INSERT INTO employees (id,name,skills)
VALUES 
(
    1, 'John', '[{"name":"Python","level":"Intermediate"},{"name":"JavaScript","level":"Expert"}]'

);




