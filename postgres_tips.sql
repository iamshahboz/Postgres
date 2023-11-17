-- If you want to see the list of all tables in the schema you can do like this


SELECT table_name 
FROM information_schema.tables
WHERE table_schema = 'test' and table_type = 'BASE TABLE';
