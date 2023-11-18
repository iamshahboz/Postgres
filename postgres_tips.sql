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

-- or you can do 

DO $$ 
DECLARE 
    current_table text;
BEGIN 
    FOR current_table IN (SELECT table_name FROM information_schema.tables 
              WHERE table_schema = 'tjk11' AND 
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
        EXECUTE 'ALTER TABLE tjk11.' || current_table || ' ADD COLUMN c31_f11_multi_search varchar[]';
    END LOOP;
END $$;

--for updating you can do

DO $$ 
DECLARE 
    current_table text;
BEGIN 
    FOR current_table IN (SELECT table_name FROM information_schema.tables 
              WHERE table_schema = 'tjk11' AND 
              table_type = 'BASE TABLE' and 
              (table_name like 'pr_f1_sr%' or table_name like 'f1%'
			  or table_name like 'pr_f1_ppl_sr%'
			  or table_name like 'f1%')) order by table_name 
    LOOP
		raise notice 'tbl %', current_table;
         EXECUTE 'UPDATE tjk11.' || current_table || '
        SET 
        c291_f10_multi_search = tjk11.cust_str_to_arr(tjk11.multi_search_rez_os_mesta_pro(c291_f10::int)),
        d291_f10_multi_search = tjk11.cust_str_to_arr(tjk11.multi_search_rez_os_mesta_pro(d291_f10::int)),
		a31_f11_multi_search = tjk11.cust_str_to_arr(tjk11.multi_search_prim_krim_sresv(a31_f11::int)),
		b31_f11_multi_search = tjk11.cust_str_to_arr(tjk11.multi_search_prim_krim_sresv(a31_f11::int)),
		c31_f11_multi_search = tjk11.cust_str_to_arr(tjk11.multi_search_prim_krim_sresv(c31_f11::int));';

    END LOOP;
END $$;

-- in order to list the tables which has the specific column you can do

SELECT table_name
FROM information_schema.columns
WHERE table_schema = 'tjk11' -- replace with your schema name
  AND column_name = 'c31_f11'; -- replace with your column name



-- this will do search for keyword and return back the name of functions which has 
-- that keyword

SELECT
    proname AS function_name
FROM
    pg_proc
WHERE
    prosrc ILIKE '%a291_f10%'
ORDER BY
    function_name;


