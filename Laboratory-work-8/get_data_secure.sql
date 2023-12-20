CREATE OR REPLACE FUNCTION get_data(worker_name VARCHAR)
RETURNS TABLE(id INTEGER, name VARCHAR, bd DATE)
AS $$
DECLARE 
	str VARCHAR;
BEGIN
	str := 'SELECT p_id, name, bd FROM worker WHERE name = $1';
	RAISE NOTICE 'Query=%', str;
	RETURN QUERY EXECUTE str;
END;
$$ LANGUAGE plpgsql;