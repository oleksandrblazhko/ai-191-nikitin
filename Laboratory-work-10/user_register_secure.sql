CREATE OR REPLACE FUNCTION password_is_secure(password varchar)
    RETURNS BOOLEAN
AS $$
BEGIN
	RETURN password ~ '^(?=(?:.*\d){4,})(?=(?:.*[a-z]){2,})(?=(?:.*[A-Z]){2,})(?=(?:.*[!@#$%^&*]){2,}).{17,}$';
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION user_register_secure(
    v_user_name varchar, 
	v_password varchar
)
	RETURNS INTEGER
AS $$
BEGIN
	IF NOT EXISTS ( SELECT FROM user_pass_combo_jay 
						WHERE user_pass_combo_jay.password = v_password) THEN
		IF password_is_secure(v_password) THEN
			INSERT INTO users (user_name, password_hash) 
				VALUES (v_user_name,
					md5(v_password)); -- внесення хеш-значення паролю
			RETURN 1;
		ELSE
			RAISE NOTICE 'Passname = % is not secure',v_password;
			RETURN -1;
		END IF;
	ELSE 
		RAISE NOTICE 'Passname = % is bad passname',v_password;
		RETURN -1;
	END IF;
END;
$$ LANGUAGE plpgsql;