-- First we create a test table with fields and insert data to it 

create table test.dragon (
id serial primary key,
name varchar(20) not null,
artist varchar(20) not null,
text text not null
);

INSERT INTO test.dragon (name, artist, text)
VALUES(
	'Jackie',
    'Sharehold',
	'
	The City of Paris is the centre of the Île-de-France region, or Paris Region, with an official estimated population of 12,271,794 inhabitants on January 1, 2023, or about 19% of the population of France,[2] making the region France''s primate city. The Paris Region had a GDP of €765 billion in 2021, the highest in the European Union.[8] 
	According to the Economist Intelligence Unit Worldwide Cost of Living Survey, in 2022, Paris was the city with the ninth-highest cost of living in the world
	')

-- Then we select all from that table to 

SELECT * FROM test.dragon;

--Usage of full text search

--1. Partial matching

/*
this query will return results not just Jack but also variations like Jackie, Jack and etc

*/

SELECT name, artist, text FROM test.dragon WHERE to_tsvector(name) @@ to_tsquery('Jack:*');



--2. Relevance ranking 

/*
This query orders the results based on their relevance to the term 'Paris'.
*/

SELECT name, artist, text FROM test.dragon WHERE to_tsvector(text) @@ to_tsquery('Paris') ORDER BY ts_rank(to_tsvector(text), to_tsquery('Paris')) DESC;

-- 3. Multilingual Search

--Russian text added to check for the multilanguage capability of full text search

INSERT INTO test.dragon (name, artist, text)
VALUES(
	'Алексей','Валерий Миладзе',
	'
	Столица Франции Париж – один из главных европейских городов и мировой центр культуры, искусства, моды и гастрономии. 
	В центральной части города, построенной в XIX веке, проходят широкие бульвары и протекает река Сена. 
	Самые известные достопримечательности Парижа – Эйфелева башня и собор Парижской Богоматери в готическом стиле, возведенный в XII веке.
	')

---

/*
and now the query  is searching for the term Paris both in English and Russian
*/

SELECT name, artist, text
FROM test.dragon
WHERE to_tsvector('russian', text) @@ to_tsquery('russian', 'Париж')
   OR to_tsvector('english', text) @@ to_tsquery('english', 'Paris');



-- 4. Complex queries with Boolean operators

/*
You want to find documents that contain either 'Paris' or 'London' or both
*/

SELECT name, artist, text FROM test.dragon WHERE to_tsvector(text) @@ to_tsquery('Paris | London');

-- Search in multiple fields

SELECT name, artist, text FROM test.dragon
WHERE to_tsvector(name || ' ' || text ) @@ to_tsquery('Jack')

-- All the methods we have seen earlier they might be slow when you have a very big database

--Now we see how we can make it faster 

ALTER TABLE test.dragon
ADD COLUMN document tsvector;

update test.dragon 
set document = to_tsvector(name || ' ' || artist || ' ' || text);

--now we can select like this

SELECT name, artist, text FROM test.dragon 
WHERE document @@ to_tsquery('Jack');

--Just to see the difference you can run these both queries 

explain analyse SELECT name, artist, text FROM test.dragon
WHERE to_tsvector(name || ' ' || text ) @@ to_tsquery('Jack')

explain analyse SELECT name, artist, text FROM test.dragon 
WHERE document @@ to_tsquery('Jack');

--To make it even faster you can create index 

CREATE INDEX document_idx on test.dragon USING GIN (document);

--then execute the queries again


