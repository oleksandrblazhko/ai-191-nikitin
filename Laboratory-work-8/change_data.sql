CREATE OR REPLACE FUNCTION change_data(worker_name VARCHAR, new_id INTEGER)
RETURNS VOID AS
$$
DECLARE 
    str VARCHAR;
BEGIN
    str := 'UPDATE worker SET p_id = ''' || new_id || ''' WHERE name = ''' || worker_name || '''';
    RAISE NOTICE 'Query=%', str;
    EXECUTE str;
END;
$$ LANGUAGE plpgsql;