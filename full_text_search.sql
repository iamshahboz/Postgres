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