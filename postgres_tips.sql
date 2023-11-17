-- If you want to see the list of all tables in the schema you can do like this


SELECT table_name 
FROM information_schema.tables
WHERE table_schema = 'test' and table_type = 'BASE TABLE';

-- if you want to remove a column from table you can do like this

ALTER TABLE [ptable_name]
DROP COLUMN [column_name];


-- if you want to add a column to all the tables of specific schema you can do 

DO $$ 
DECLARE 
    current_table text;
BEGIN 
    FOR current_table IN (SELECT table_name FROM information_schema.tables WHERE table_schema = 'tjk11' AND table_type = 'BASE TABLE') 
    LOOP
        EXECUTE 'ALTER TABLE test.' || current_table || ' ADD COLUMN a291_f10_multi_search varchar[]';
    END LOOP;
END $$;

