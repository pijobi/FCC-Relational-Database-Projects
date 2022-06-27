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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(20) NOT NULL,
    contains_wormhole boolean,
    description text,
    galaxy_shapes_id integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: galaxy_shapes; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_shapes (
    name character varying(10) NOT NULL,
    dark_matter_variant boolean,
    galaxy_shapes_id integer NOT NULL
);


ALTER TABLE public.galaxy_shapes OWNER TO freecodecamp;

--
-- Name: galaxy_shapes_galaxy_shapes_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_shapes_galaxy_shapes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_shapes_galaxy_shapes_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_shapes_galaxy_shapes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_shapes_galaxy_shapes_id_seq OWNED BY public.galaxy_shapes.galaxy_shapes_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(20) NOT NULL,
    lunar_bases_installed integer,
    moon_color text,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(20) NOT NULL,
    is_habitable boolean,
    joined_empire boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: resources; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.resources (
    name character varying(20),
    quantity_in_tons integer NOT NULL,
    resources_id integer NOT NULL
);


ALTER TABLE public.resources OWNER TO freecodecamp;

--
-- Name: resources_resources_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.resources_resources_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.resources_resources_id_seq OWNER TO freecodecamp;

--
-- Name: resources_resources_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.resources_resources_id_seq OWNED BY public.resources.resources_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(20) NOT NULL,
    energy_reserve numeric,
    star_color text,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_shapes galaxy_shapes_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_shapes ALTER COLUMN galaxy_shapes_id SET DEFAULT nextval('public.galaxy_shapes_galaxy_shapes_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: resources resources_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.resources ALTER COLUMN resources_id SET DEFAULT nextval('public.resources_resources_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'John', true, 'Too cool for school.', 2);
INSERT INTO public.galaxy VALUES (2, 'Jacob', true, 'Under analysis.', 4);
INSERT INTO public.galaxy VALUES (3, 'Jingle', true, 'Unknown', 5);
INSERT INTO public.galaxy VALUES (4, 'Heimer', false, 'Dont go there.', 2);
INSERT INTO public.galaxy VALUES (5, 'Schmidt', false, 'Come here instead.', 3);
INSERT INTO public.galaxy VALUES (6, 'Dunkerton', true, 'Ugh...', 6);


--
-- Data for Name: galaxy_shapes; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_shapes VALUES ('elliptical', true, 1);
INSERT INTO public.galaxy_shapes VALUES ('elliptical', false, 2);
INSERT INTO public.galaxy_shapes VALUES ('spiral', true, 3);
INSERT INTO public.galaxy_shapes VALUES ('spiral', false, 4);
INSERT INTO public.galaxy_shapes VALUES ('irregular', true, 5);
INSERT INTO public.galaxy_shapes VALUES ('irregular', false, 6);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Junk', 0, 'Red', 1);
INSERT INTO public.moon VALUES (2, 'Nmon', 1, 'White', 1);
INSERT INTO public.moon VALUES (3, 'Lefteye', 3, 'Grey', 2);
INSERT INTO public.moon VALUES (10, 'Bart', 0, 'Red', 3);
INSERT INTO public.moon VALUES (11, 'Pork', 1, 'Yellow', 4);
INSERT INTO public.moon VALUES (12, 'Skark', 3, 'Grey', 5);
INSERT INTO public.moon VALUES (13, 'Loei', 0, 'Red', 3);
INSERT INTO public.moon VALUES (14, 'Velok', 1, 'Yellow', 7);
INSERT INTO public.moon VALUES (15, 'Dunesi', 3, 'Green', 7);
INSERT INTO public.moon VALUES (16, 'Stuart', 4, 'Red', 12);
INSERT INTO public.moon VALUES (17, 'Belbiss', 1, 'Yellow', 9);
INSERT INTO public.moon VALUES (18, 'Roood', 3, 'Green', 11);
INSERT INTO public.moon VALUES (22, 'Lei', 4, 'Red', 12);
INSERT INTO public.moon VALUES (23, 'Frod', 1, 'Yellow', 9);
INSERT INTO public.moon VALUES (24, 'Redad', 3, 'Green', 11);
INSERT INTO public.moon VALUES (25, 'Lai', 4, 'Red', 12);
INSERT INTO public.moon VALUES (26, 'F3od', 1, 'Yellow', 10);
INSERT INTO public.moon VALUES (27, 'Radad', 3, 'Green', 11);
INSERT INTO public.moon VALUES (28, 'Borf', 4, 'Red', 12);
INSERT INTO public.moon VALUES (29, 'Fnodod', 1, 'Yellow', 10);
INSERT INTO public.moon VALUES (30, 'Ralaod', 3, 'Green', 11);
INSERT INTO public.moon VALUES (31, 'Drif', 4, 'Red', 12);
INSERT INTO public.moon VALUES (32, 'Fnodxod', 1, 'Yellow', 10);
INSERT INTO public.moon VALUES (33, 'Ralaodni', 3, 'Green', 11);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Abra', true, true, 1);
INSERT INTO public.planet VALUES (2, 'Corruptus', true, true, 1);
INSERT INTO public.planet VALUES (3, 'Vagabond', false, false, 2);
INSERT INTO public.planet VALUES (4, 'Deadzone', false, false, 2);
INSERT INTO public.planet VALUES (5, 'Crete', true, false, 3);
INSERT INTO public.planet VALUES (6, 'Zilcho', false, false, 3);
INSERT INTO public.planet VALUES (7, 'Praktikum', false, true, 4);
INSERT INTO public.planet VALUES (8, 'Shillingsborough', true, false, 4);
INSERT INTO public.planet VALUES (9, 'Klaston', true, false, 5);
INSERT INTO public.planet VALUES (10, 'Flort', false, false, 6);
INSERT INTO public.planet VALUES (11, 'Floort', false, false, 6);
INSERT INTO public.planet VALUES (12, 'Flooort', false, true, 6);


--
-- Data for Name: resources; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.resources VALUES ('Jujubium', 100000, 1);
INSERT INTO public.resources VALUES ('Jinkxite', 20000000, 2);
INSERT INTO public.resources VALUES ('Drugs', 1, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Bunkus', 34, 'Blue', 1);
INSERT INTO public.star VALUES (2, 'Doreeee', 34444, 'Blue', 1);
INSERT INTO public.star VALUES (3, 'Strange', 24, 'Green', 2);
INSERT INTO public.star VALUES (4, 'Liltint', 326, 'Magenta', 3);
INSERT INTO public.star VALUES (5, 'Dorkus', 999, 'Clear', 4);
INSERT INTO public.star VALUES (6, 'Goonk', 2994, 'Yellow', 5);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_shapes_galaxy_shapes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_shapes_galaxy_shapes_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 33, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: resources_resources_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.resources_resources_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_shapes galaxy_shapes_galaxy_shapes_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_shapes
    ADD CONSTRAINT galaxy_shapes_galaxy_shapes_id_key UNIQUE (galaxy_shapes_id);


--
-- Name: galaxy_shapes galaxy_shapes_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_shapes
    ADD CONSTRAINT galaxy_shapes_pkey PRIMARY KEY (galaxy_shapes_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: resources resources_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.resources
    ADD CONSTRAINT resources_name_key UNIQUE (name);


--
-- Name: resources resources_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.resources
    ADD CONSTRAINT resources_pkey PRIMARY KEY (resources_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy galaxy_galaxy_shapes_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_shapes_id_fkey FOREIGN KEY (galaxy_shapes_id) REFERENCES public.galaxy_shapes(galaxy_shapes_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

