-- FUNCTION: sandbox.totalrecords()

-- DROP FUNCTION IF EXISTS sandbox.totalrecords();

CREATE OR REPLACE FUNCTION sandbox.totalrecords(
	)
    RETURNS json
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$
declare
	f1_result integer;
	f2_result integer;
	f3_result integer;
	f5_result integer;
	f6_result integer;
	f7_result integer;
	f8_result integer;
	f9_result integer;
	date_ integer;
	current_year integer;
	last_srez integer;
	total integer;
BEGIN
	current_year:= EXTRACT(YEAR FROM CURRENT_DATE);

    EXECUTE 'SELECT count(*) FROM test.forma1_' || current_year INTO f1_result;
	EXECUTE 'SELECT count(*) FROM test.forma2_' || current_year INTO f2_result;
	EXECUTE 'SELECT count(*) FROM test.forma3_' || current_year INTO f3_result;
	EXECUTE 'SELECT count(*) FROM test.forma5_' || current_year INTO f5_result;
	EXECUTE 'SELECT count(*) FROM test.forma6_' || current_year INTO f6_result;
	EXECUTE 'SELECT count(*) FROM test.forma7_' || current_year INTO f7_result;
	EXECUTE 'SELECT count(*) FROM test.forma8_' || current_year INTO f8_result;
	EXECUTE 'SELECT count(*) FROM test.forma9_' || current_year INTO f9_result;

   RETURN json_build_object('f1',f1_result,
						   	'f2', f2_result,
						   	'f3', f3_result,
						   	'f5', f5_result,
						   	'f6', f6_result,
						   	'f7', f7_result,
						   	'f8', f8_result,
						   	'f9', f9_result );
END;
$BODY$;

ALTER FUNCTION sandbox.totalrecords()
    OWNER TO postgres;

SELECT sandbox.totalrecords();
