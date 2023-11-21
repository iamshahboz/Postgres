-- FUNCTION: sandbox.end_of_month(date)

-- DROP FUNCTION IF EXISTS sandbox.end_of_month(date);

CREATE OR REPLACE FUNCTION sandbox.func(
	)
    RETURNS json
    LANGUAGE 'sql'
    COST 100
    IMMUTABLE STRICT PARALLEL UNSAFE
AS $BODY$

select json_build_object(
'f1', (SELECT COUNT (*) FROM tjk11.pr_f1_sr_2023),
'f2', (SELECT COUNT (*) FROM tjk11.l_f2_sr_2023),
'f3', (SELECT COUNT (*) FROM tjk11.resh_sr_2023)
)


$BODY$;

ALTER FUNCTION sandbox.func()
    OWNER TO postgres;

SELECT sandbox.func();