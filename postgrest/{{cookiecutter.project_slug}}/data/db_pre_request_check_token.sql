

CREATE SCHEMA auth;
GRANT USAGE ON SCHEMA auth TO anonymous, ncurrit;

CREATE OR REPLACE FUNCTION auth.check_token() RETURNS void
    LANGUAGE plpgsql AS
BEGIN
    /*
        1. JWT looks like this
           {
            "user_id": "id",
            "role": "role_name",
            "email": "email@domain.com",
            "iat": "the time when this JWT was issued",
            "exp": "10 minutes from issue",
            "jiti": "jwt id...learn more about this one...maybe record it in db"
           }
        2. Have 'session' table in db that keeps track of a specially coded claim of:
           a. when last JWT was issued, or
           b. unique identifier of last-issued JWT
        3. select v_previous_claim_issued_timestamp = specially coded claim from 'session' table
        4. v_time_right_now = now()
        5. if v_time_right_now < v_previous_claim_issued_timestamp:
             then: JWT is invalid (raise insufficient_privilege)
             otherwise: issue new JWT and record v_time_right_now in 'session' table
        6. On 'logout' set 'session' table to time in the future...past the exp time
           (so if same claim is used within 10 minutes it will be invalid) and don't return JWT in response. Raise insufficient_privilege. 
    */
    if current_setting('request.jwt.claims', true)::json->>'email' = 'disgruntled@mycompany.com' then
        raise insufficient_privilege using hint = 'Nope, we are on to you.';
    end if;
END;
$$;




-- create or replace function auth.check_token() returns void
--   language plpgsql
--   as $$
-- begin
--   if current_setting('request.jwt.claims', true)::json->>'email' =
--      'disgruntled@mycompany.com' then
--     raise insufficient_privilege
--       using hint = 'Nope, we are on to you';
--   end if;
-- end
-- $$;