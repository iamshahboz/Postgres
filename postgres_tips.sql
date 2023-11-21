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
    FOR current_table IN (SELECT table_name FROM information_schema.tables WHERE table_schema = 'test' AND table_type = 'BASE TABLE') 
    LOOP
        EXECUTE 'ALTER TABLE test.' || current_table || ' ADD COLUMN age integer';
    END LOOP;
END $$;

-- or you can do 

DO $$ 
DECLARE 
    current_table text;
BEGIN 
    FOR current_table IN (SELECT table_name FROM information_schema.tables 
              WHERE table_schema = 'test' AND 
              table_type = 'BASE TABLE' and 
              (table_name like 'pr_f1_sr%' or table_name like 'f1%'
			  or table_name like 'f2%'
			  or table_name like 'f3%'
			  or table_name like 'f5%'
			  or table_name like 'f5_sr%%'
			  or table_name like 'f6%'
			  or table_name like 'f6_sr%'
			  or table_name like 'l_f2_sr%'
			  or table_name like 'pr_f1_ppl_sr%'
			  or table_name like 'resh_ppl_sr%'
			  or table_name like 'resh_sr%')) order by table_name 
    LOOP
		raise notice 'tbl %', current_table;
        EXECUTE 'ALTER TABLE tjk11.' || current_table || ' ADD COLUMN age integer';
    END LOOP;
END $$;



-- this will do search for keyword and return back the name of functions with schema names which has 
-- that keyword

SELECT
    nspname AS schema_name,
    proname AS function_name
FROM
    pg_proc
JOIN
    pg_namespace ON pg_proc.pronamespace = pg_namespace.oid
WHERE
    prosrc ILIKE '%age%'
ORDER BY
    function_name;


