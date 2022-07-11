--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    username character varying(50) NOT NULL,
    score integer
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 'test', NULL);
INSERT INTO public.games VALUES (2, 'user_1657503041893', NULL);
INSERT INTO public.games VALUES (3, 'user_1657503041892', NULL);
INSERT INTO public.games VALUES (4, 'user_1657503563927', NULL);
INSERT INTO public.games VALUES (5, 'user_1657503563926', NULL);
INSERT INTO public.games VALUES (7, 'test', 4);
INSERT INTO public.games VALUES (8, 'test', 3);
INSERT INTO public.games VALUES (9, 'test', 1);
INSERT INTO public.games VALUES (10, 'test', 1);
INSERT INTO public.games VALUES (11, 'test', 1);
INSERT INTO public.games VALUES (12, 'apple', 3);
INSERT INTO public.games VALUES (13, 'apple', 3);
INSERT INTO public.games VALUES (14, 'user_1657504720672', 444);
INSERT INTO public.games VALUES (15, 'user_1657504720672', 533);
INSERT INTO public.games VALUES (16, 'user_1657504720671', 477);
INSERT INTO public.games VALUES (17, 'user_1657504720671', 96);
INSERT INTO public.games VALUES (18, 'user_1657504720672', 964);
INSERT INTO public.games VALUES (19, 'user_1657504720672', 172);
INSERT INTO public.games VALUES (20, 'user_1657504720672', 368);
INSERT INTO public.games VALUES (21, 'user_1657504806296', 10);
INSERT INTO public.games VALUES (22, 'user_1657504806296', 587);
INSERT INTO public.games VALUES (23, 'user_1657504806295', 931);
INSERT INTO public.games VALUES (24, 'user_1657504806295', 493);
INSERT INTO public.games VALUES (25, 'user_1657504806296', 306);
INSERT INTO public.games VALUES (26, 'user_1657504806296', 522);
INSERT INTO public.games VALUES (27, 'user_1657504806296', 158);
INSERT INTO public.games VALUES (28, 'user_1657504839455', 472);
INSERT INTO public.games VALUES (29, 'user_1657504839455', 407);
INSERT INTO public.games VALUES (30, 'user_1657504839454', 843);
INSERT INTO public.games VALUES (31, 'user_1657504839454', 642);
INSERT INTO public.games VALUES (32, 'user_1657504839455', 587);
INSERT INTO public.games VALUES (33, 'user_1657504839455', 989);
INSERT INTO public.games VALUES (34, 'user_1657504839455', 883);


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 34, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- PostgreSQL database dump complete
--

