SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE postgres;


CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';


\connect postgres

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

COMMENT ON DATABASE postgres IS 'default administrative connection database';

CREATE SCHEMA public;

COMMENT ON SCHEMA public IS 'standard public schema';

SET default_tablespace = '';

SET default_table_access_method = heap;

CREATE TABLE public.battle (
    id uuid NOT NULL,
    enemyid uuid NOT NULL,
    playerid uuid NOT NULL,
    dicethrown integer NOT NULL,
    playername character varying(255) NOT NULL,
    enemyname character varying(255) NOT NULL,
    result character varying(255)
);

CREATE TABLE public.enemy (
    id uuid NOT NULL,
    nickname character varying(255) NOT NULL,
    life integer NOT NULL,
    attack integer NOT NULL,
    defesa integer NOT NULL,
);

CREATE TABLE public.player (
    id uuid NOT NULL,
    nickname character varying(255) NOT NULL,
    life integer NOT NULL,
    attack integer NOT NULL,
    defesa integer NOT NULL,
    defensa integer
);