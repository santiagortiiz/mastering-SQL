If current owner is not postgres you can use this:

REASSIGN OWNED BY old_role [, ...] TO new_role
But if the current owner is postgres you definitely get error so you have to use @dvanrensburg answer but if you want to execute commands in same sql use these command based on need:

Database

ALTER DATABASE target_database OWNER TO new_onwer;
Tables

DO
LANGUAGE plpgsql
$$
DECLARE
  stmt text;
BEGIN
  FOR stmt IN
    WITH temp as (
    SELECT 'ALTER TABLE '|| schemaname || '."' || tablename ||'" OWNER TO newuser' as command
    FROM pg_tables WHERE NOT schemaname IN ('pg_catalog', 'information_schema')
    ORDER BY schemaname, tablename )
    SELECT command from temp
  LOOP
    EXECUTE stmt;
  END LOOP;
END;
$$;
Sequences

DO
LANGUAGE plpgsql
$$
DECLARE
  stmt text;
BEGIN
  FOR stmt IN
    WITH temp as (
    SELECT 'ALTER SEQUENCE '|| sequence_schema || '."' || sequence_name ||'" OWNER TO newuser;' as command
    FROM information_schema.sequences WHERE NOT sequence_schema IN ('pg_catalog', 'information_schema')
    ORDER BY sequence_schema, sequence_name)
    select command from temp
  LOOP
    EXECUTE stmt;
  END LOOP;
END;
$$;
Views

DO
LANGUAGE plpgsql
$$
DECLARE
  stmt text;
BEGIN
  FOR stmt IN
    WITH temp as (
    SELECT 'ALTER VIEW '|| table_schema || '."' || table_name ||'" OWNER TO newuser;' as command
    FROM information_schema.views WHERE NOT table_schema IN ('pg_catalog', 'information_schema')
    ORDER BY table_schema, table_name)
    select command from temp
  LOOP
    EXECUTE stmt;
  END LOOP;
END;
$$;
Schemas

DO
LANGUAGE plpgsql
$$
DECLARE
  stmt text;
BEGIN
  FOR stmt IN
    WITH schema_names as(
    SELECT distinct(schemaname) FROM pg_tables WHERE NOT schemaname IN ('pg_catalog', 'information_schema')
    ORDER BY schemaname)
    SELECT 'ALTER SCHEMA '|| schemaname ||' OWNER TO newuser;' as command
    FROM schema_names
  LOOP
    EXECUTE stmt;
  END LOOP;
END;
$$;
Also note the functions and other components of the database that may need to change memberships

Functions and trigger functions

    DO
    LANGUAGE plpgsql
    $$
    DECLARE
      stmt text;
    BEGIN
      FOR stmt IN
        WITH temp as(
        SELECT 'alter function '||nsp.nspname||'.'||p.proname||'('||pg_get_function_identity_arguments(p.oid)||') owner to newuser;' as command
        FROM pg_proc p
        JOIN pg_namespace nsp ON p.pronamespace = nsp.oid
        WHERE NOT  nsp.nspname IN ('pg_catalog', 'information_schema'))
        SELECT command FROM temp
      LOOP
        EXECUTE stmt;
      END LOOP;
    END;
    $$;