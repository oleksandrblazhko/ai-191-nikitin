CREATE OR REPLACE FUNCTION get_data(worker_name VARCHAR, v_user_name VARCHAR, v_token VARCHAR)
RETURNS TABLE(id INTEGER, name VARCHAR, bd DATE)
AS $$
DECLARE 
	str VARCHAR;
BEGIN
	CALL sso_control(v_user_name, v_token);
	str := 'SELECT p_id, name, bd FROM worker WHERE name = ''' || worker_name || '''';
	RAISE NOTICE 'Query=%', str;
	RETURN QUERY EXECUTE str;
END;
$$ LANGUAGE plpgsql;