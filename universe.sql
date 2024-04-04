--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

ALTER TABLE ONLY public.planet DROP CONSTRAINT fk_star;
ALTER TABLE ONLY public.moon DROP CONSTRAINT fk_planet;
ALTER TABLE ONLY public.star DROP CONSTRAINT fk_galaxy;
ALTER TABLE ONLY public.star DROP CONSTRAINT star_pkey;
ALTER TABLE ONLY public.star DROP CONSTRAINT star_name_key;
ALTER TABLE ONLY public.planet DROP CONSTRAINT planet_pkey;
ALTER TABLE ONLY public.planet DROP CONSTRAINT planet_name_key;
ALTER TABLE ONLY public.moon DROP CONSTRAINT moon_pkey;
ALTER TABLE ONLY public.moon DROP CONSTRAINT moon_name_key;
ALTER TABLE ONLY public.galaxy DROP CONSTRAINT galaxy_pkey;
ALTER TABLE ONLY public.galaxy DROP CONSTRAINT galaxy_galaxy_name_key;
ALTER TABLE ONLY public.civilization DROP CONSTRAINT civilization_pkey;
ALTER TABLE ONLY public.civilization DROP CONSTRAINT civilization_name_key;
ALTER TABLE public.star ALTER COLUMN star_id DROP DEFAULT;
ALTER TABLE public.planet ALTER COLUMN planet_id DROP DEFAULT;
ALTER TABLE public.moon ALTER COLUMN moon_id DROP DEFAULT;
ALTER TABLE public.galaxy ALTER COLUMN galaxy_id DROP DEFAULT;
ALTER TABLE public.civilization ALTER COLUMN civilization_id DROP DEFAULT;
DROP SEQUENCE public.star_star_id_seq;
DROP TABLE public.star;
DROP SEQUENCE public.planet_id_seq;
DROP TABLE public.planet;
DROP SEQUENCE public.moon_id_seq;
DROP TABLE public.moon;
DROP SEQUENCE public.galaxy_galaxy_id_seq;
DROP TABLE public.galaxy;
DROP SEQUENCE public.civilization_civ_id_seq;
DROP TABLE public.civilization;
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: civilization; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.civilization (
    civilization_id integer NOT NULL,
    name character varying(50) NOT NULL,
    population integer
);


ALTER TABLE public.civilization OWNER TO freecodecamp;

--
-- Name: civilization_civ_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.civilization_civ_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.civilization_civ_id_seq OWNER TO freecodecamp;

--
-- Name: civilization_civ_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.civilization_civ_id_seq OWNED BY public.civilization.civilization_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    galaxy_name character varying(50) NOT NULL,
    size integer,
    numberofstars numeric,
    blackholepresent boolean,
    name character varying(50)
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
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    composition text,
    estimatedmineralvalue numeric,
    planet_name character varying(50),
    populated boolean
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    planet_name character varying(50) NOT NULL,
    lifepresent boolean,
    population numeric,
    star_name character varying(50),
    name character varying(50)
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    star_name character varying(50) NOT NULL,
    circumference integer NOT NULL,
    numberofstars numeric,
    typeofstar character varying(50),
    galaxy_name character varying(50),
    name character varying(50)
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
-- Name: civilization civilization_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.civilization ALTER COLUMN civilization_id SET DEFAULT nextval('public.civilization_civ_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: civilization; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.civilization VALUES (1, 'man', NULL);
INSERT INTO public.civilization VALUES (2, 'tyranid', NULL);
INSERT INTO public.civilization VALUES (3, 'chaos', NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'tempestus', NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'obscurus', NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'solar', NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'maledictum', NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'pacifus', NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'ultima', NULL, NULL, NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (6, '1', NULL, NULL, 'saturn', NULL);
INSERT INTO public.moon VALUES (7, '2', NULL, NULL, 'saturn', NULL);
INSERT INTO public.moon VALUES (8, '3', NULL, NULL, 'saturn', NULL);
INSERT INTO public.moon VALUES (9, '1111114', NULL, NULL, 'saturn', NULL);
INSERT INTO public.moon VALUES (10, '45754633', NULL, NULL, 'saturn', NULL);
INSERT INTO public.moon VALUES (11, '214653', NULL, NULL, 'saturn', NULL);
INSERT INTO public.moon VALUES (12, '78423', NULL, NULL, 'saturn', NULL);
INSERT INTO public.moon VALUES (13, '545487783', NULL, NULL, 'saturn', NULL);
INSERT INTO public.moon VALUES (14, '46593', NULL, NULL, 'saturn', NULL);
INSERT INTO public.moon VALUES (15, '44413', NULL, NULL, 'saturn', NULL);
INSERT INTO public.moon VALUES (16, '456683', NULL, NULL, 'saturn', NULL);
INSERT INTO public.moon VALUES (17, '73443', NULL, NULL, 'saturn', NULL);
INSERT INTO public.moon VALUES (18, '82353', NULL, NULL, 'saturn', NULL);
INSERT INTO public.moon VALUES (19, '7873', NULL, NULL, 'saturn', NULL);
INSERT INTO public.moon VALUES (20, '89983', NULL, NULL, 'saturn', NULL);
INSERT INTO public.moon VALUES (21, '666', NULL, NULL, 'saturn', NULL);
INSERT INTO public.moon VALUES (22, '6666', NULL, NULL, 'saturn', NULL);
INSERT INTO public.moon VALUES (23, '5556663', NULL, NULL, 'saturn', NULL);
INSERT INTO public.moon VALUES (24, '5863', NULL, NULL, 'saturn', NULL);
INSERT INTO public.moon VALUES (25, '1553', NULL, NULL, 'saturn', NULL);
INSERT INTO public.moon VALUES (26, '211223', NULL, NULL, 'saturn', NULL);
INSERT INTO public.moon VALUES (27, '31', NULL, NULL, 'saturn', NULL);
INSERT INTO public.moon VALUES (28, '13', NULL, NULL, 'saturn', NULL);
INSERT INTO public.moon VALUES (29, '32', NULL, NULL, 'saturn', NULL);
INSERT INTO public.moon VALUES (30, '23', NULL, NULL, 'saturn', NULL);
INSERT INTO public.moon VALUES (31, '5623', NULL, NULL, 'saturn', NULL);
INSERT INTO public.moon VALUES (32, '73', NULL, NULL, 'saturn', NULL);
INSERT INTO public.moon VALUES (33, '88883', NULL, NULL, 'saturn', NULL);
INSERT INTO public.moon VALUES (34, '54', NULL, NULL, 'saturn', NULL);
INSERT INTO public.moon VALUES (35, '5553', NULL, NULL, 'saturn', NULL);
INSERT INTO public.moon VALUES (36, '83', NULL, NULL, 'saturn', NULL);
INSERT INTO public.moon VALUES (37, '693', NULL, NULL, 'saturn', NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'earth', NULL, NULL, 'sol', NULL);
INSERT INTO public.planet VALUES (2, 'mars', NULL, NULL, 'sol', NULL);
INSERT INTO public.planet VALUES (3, 'uranus', NULL, NULL, 'sol', NULL);
INSERT INTO public.planet VALUES (4, 'neptune', NULL, NULL, 'sol', NULL);
INSERT INTO public.planet VALUES (5, 'jupiter', NULL, NULL, 'sol', NULL);
INSERT INTO public.planet VALUES (6, 'saturn', NULL, NULL, 'sol', NULL);
INSERT INTO public.planet VALUES (7, 'mercury', NULL, NULL, 'sol', NULL);
INSERT INTO public.planet VALUES (9, 'venus', NULL, NULL, 'sol', NULL);
INSERT INTO public.planet VALUES (10, 'pluto', NULL, NULL, 'sol', NULL);
INSERT INTO public.planet VALUES (11, 'ares', NULL, NULL, 'sol', NULL);
INSERT INTO public.planet VALUES (12, 'zues', NULL, NULL, 'sol', NULL);
INSERT INTO public.planet VALUES (13, 'hera', NULL, NULL, 'sol', NULL);
INSERT INTO public.planet VALUES (14, 'eros', NULL, NULL, 'sol', NULL);
INSERT INTO public.planet VALUES (15, 'io', NULL, NULL, 'sol', NULL);
INSERT INTO public.planet VALUES (16, 'pleeto', NULL, NULL, 'sol', NULL);
INSERT INTO public.planet VALUES (17, 'marth', NULL, NULL, 'sol', NULL);
INSERT INTO public.planet VALUES (18, 'vindictus', NULL, NULL, 'sol', NULL);
INSERT INTO public.planet VALUES (19, 'imperium', NULL, NULL, 'sol', NULL);
INSERT INTO public.planet VALUES (20, 'ooooooo', NULL, NULL, 'sol', NULL);
INSERT INTO public.planet VALUES (27, 'ooweeee', NULL, NULL, 'sol', NULL);
INSERT INTO public.planet VALUES (29, 'erath', NULL, NULL, 'sol', NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'chuck', 9876, NULL, NULL, 'pacifus', NULL);
INSERT INTO public.star VALUES (2, 'sol', 999999, NULL, NULL, 'solar', NULL);
INSERT INTO public.star VALUES (3, 'beetleguese', 59, NULL, NULL, 'ultima', NULL);
INSERT INTO public.star VALUES (4, 'alfa centauri', 909, NULL, NULL, 'ultima', NULL);
INSERT INTO public.star VALUES (5, 'beeta centauri', 910, NULL, NULL, 'ultima', NULL);
INSERT INTO public.star VALUES (6, 'chainsaw', 765784, NULL, NULL, 'maledictum', NULL);


--
-- Name: civilization_civ_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.civilization_civ_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 37, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 29, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: civilization civilization_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.civilization
    ADD CONSTRAINT civilization_name_key UNIQUE (name);


--
-- Name: civilization civilization_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.civilization
    ADD CONSTRAINT civilization_pkey PRIMARY KEY (civilization_id);


--
-- Name: galaxy galaxy_galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_name_key UNIQUE (galaxy_name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


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
    ADD CONSTRAINT planet_name_key UNIQUE (planet_name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (star_name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_name) REFERENCES public.galaxy(galaxy_name);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_name) REFERENCES public.planet(planet_name);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_name) REFERENCES public.star(star_name);


--
-- PostgreSQL database dump complete
--

