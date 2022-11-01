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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(20),
    abbreviation character varying(3) NOT NULL
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellations_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellations_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellations_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellations_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellations_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    diameter_thousands_km numeric(4,1),
    constellation_name character varying(20) NOT NULL,
    origin_name text,
    visible_naked_eye boolean
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
    name character varying(30) NOT NULL,
    diameter_km integer,
    year_discovered integer,
    planet_id integer NOT NULL,
    distance_from_planet_thousand_km numeric(5,1)
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
    moon_orbit integer,
    type character varying(20),
    has_life boolean NOT NULL,
    star_id integer NOT NULL,
    diameter_thousand_km numeric(4,1) NOT NULL
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    solar_luminosity integer,
    designation character varying(30) NOT NULL,
    constellation_name character varying(20) NOT NULL
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellations_constellation_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Sagittarius', 'Sgr');
INSERT INTO public.constellation VALUES (2, 'Andromeda', 'And');
INSERT INTO public.constellation VALUES (3, 'Triangulum', 'Tri');
INSERT INTO public.constellation VALUES (4, 'Draco', 'Dra');
INSERT INTO public.constellation VALUES (5, 'Canes Venatici', 'CVn');
INSERT INTO public.constellation VALUES (6, 'Sculptor', 'Scl');
INSERT INTO public.constellation VALUES (7, 'Ursa Major', 'UMa');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 220.0, 'Andromeda', 'Appears in the constellation of Andromeda', true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum Galaxy', 61.1, 'Triangulum', 'Located in the Triangulum constellation', true);
INSERT INTO public.galaxy VALUES (4, 'Tadpole Galaxy', 280.0, 'Draco', 'Resemblance to a tadpole', false);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool Galaxy', 60.0, 'Canes Venatici', 'Its gravitational appearance looks like a whirlpool', false);
INSERT INTO public.galaxy VALUES (6, 'Sculptor Galaxy', 90.0, 'Sculptor', 'Appears in the Sculptor Constellation', true);
INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100.0, 'Sagittarius', 'Looks like a band of light from Earth', true);
INSERT INTO public.galaxy VALUES (7, 'Bode Galaxy', 90.0, 'Ursa Major', 'Named after Johann Elert Bode, who discovered it in 1774', true);
INSERT INTO public.galaxy VALUES (8, 'Pinwheel Galaxy', 169.3, 'Ursa Major', 'Appearance of a pinwheel toy', false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Earth-s moon', 3475, 1609, 3, 384.4);
INSERT INTO public.moon VALUES (2, 'Europa', 3100, 1610, 5, 420.6);
INSERT INTO public.moon VALUES (3, 'Ganymede', 5262, 1610, 5, 665.7);
INSERT INTO public.moon VALUES (4, 'TITAN', 5149, 1655, 6, 778.7);
INSERT INTO public.moon VALUES (5, 'Enceladus', 504, 1789, 6, 148.0);
INSERT INTO public.moon VALUES (6, 'Ariel', 1157, 1851, 7, 190.0);
INSERT INTO public.moon VALUES (7, 'Oberon', 1522, 1787, 7, 584.0);
INSERT INTO public.moon VALUES (8, 'Puck', 162, 1985, 7, 86.0);
INSERT INTO public.moon VALUES (9, 'Rosalind', 72, 1986, 7, 70.0);
INSERT INTO public.moon VALUES (10, 'Titania', 1600, 1787, 7, 426.0);
INSERT INTO public.moon VALUES (11, 'Umbriel', 1200, 1851, 7, 266.0);
INSERT INTO public.moon VALUES (12, 'Galatea', 175, 1989, 8, 61.0);
INSERT INTO public.moon VALUES (13, 'Hippocammp', 35, 2013, 8, 105.0);
INSERT INTO public.moon VALUES (14, 'Halimede', 124, 2002, 8, 16.0);
INSERT INTO public.moon VALUES (15, 'Larissa', 194, 1989, 8, 74.0);
INSERT INTO public.moon VALUES (16, 'Naiad', 60, 1989, 8, 48.0);
INSERT INTO public.moon VALUES (17, 'Nereid', 715, 1949, 8, 5504.0);
INSERT INTO public.moon VALUES (18, 'Proteus', 420, 1989, 8, 117.6);
INSERT INTO public.moon VALUES (19, 'Psamathe', 80, 2003, 8, 46.7);
INSERT INTO public.moon VALUES (20, 'Triton', 2700, 1846, 8, 354.7);
INSERT INTO public.moon VALUES (21, 'Thalassa', 82, 1989, 8, 50.0);
INSERT INTO public.moon VALUES (22, 'Charon', 1212, 1978, 9, 19.6);
INSERT INTO public.moon VALUES (23, 'Hydra', 51, 2005, 9, 64.7);
INSERT INTO public.moon VALUES (24, 'Kerberos', 19, 2011, 9, 57.8);
INSERT INTO public.moon VALUES (25, 'Nix', 50, 2005, 9, 48.7);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 0, 'Terrestrial Planet', false, 1, 1.5);
INSERT INTO public.planet VALUES (2, 'Venus', 0, 'Terrestrial Planet', false, 1, 12.1);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'Terrestrial Planet', true, 1, 12.6);
INSERT INTO public.planet VALUES (4, 'Mars', 2, 'Terrestrial Planet', false, 1, 6.6);
INSERT INTO public.planet VALUES (5, 'Jupiter', 80, 'Gas Giant', false, 1, 142.9);
INSERT INTO public.planet VALUES (6, 'Saturn', 83, 'Gas Giant', false, 1, 116.4);
INSERT INTO public.planet VALUES (7, 'Uranus', 27, 'Ice Giant', false, 1, 116.4);
INSERT INTO public.planet VALUES (8, 'Neptune', 14, 'Ice Giant', false, 1, 49.2);
INSERT INTO public.planet VALUES (9, 'Pluto', 5, 'Dwarf Planet', false, 1, 2.2);
INSERT INTO public.planet VALUES (10, 'Ceres', 0, 'Dwarf Planet', false, 1, 0.9);
INSERT INTO public.planet VALUES (11, 'Makemake', 0, 'Dwarf Planet', false, 1, 1.4);
INSERT INTO public.planet VALUES (12, 'Haumea', 2, 'Dwarf Planet', false, 1, 1.2);
INSERT INTO public.planet VALUES (13, 'Eris', 1, 'Dwarf Planet', false, 1, 2.2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'The sun', 1, 'sol', 'Sagittarius');
INSERT INTO public.star VALUES (2, 'Mirach', 1995, 'HR 337', 'Andromeda');
INSERT INTO public.star VALUES (3, 'Almach', 2000, 'HR 603', 'Andromeda');
INSERT INTO public.star VALUES (4, 'Titawin', 4, 'HR 458', 'Andromeda');
INSERT INTO public.star VALUES (5, 'Nunki', 3300, 'HR 7121', 'Sagittarius');
INSERT INTO public.star VALUES (6, 'Alcor', 14, 'HR 5062', 'Ursa Major');
INSERT INTO public.star VALUES (7, 'Mizar', 33, 'HR 5054', 'Ursa Major');
INSERT INTO public.star VALUES (8, 'Nasti', 1, 'HD 68988', 'Ursa Major');
INSERT INTO public.star VALUES (9, 'Cor Caroli', 101, 'HR 4915', 'Canes Venatici');
INSERT INTO public.star VALUES (10, 'La Superba', 9400, 'HHR 4846', 'Canes Venatici');


--
-- Name: constellations_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellations_constellation_id_seq', 7, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 25, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);


--
-- Name: constellation constellations_abbreviation_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellations_abbreviation_key UNIQUE (abbreviation);


--
-- Name: constellation constellations_constellation_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellations_constellation_id_key UNIQUE (constellation_id);


--
-- Name: constellation constellations_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellations_pkey PRIMARY KEY (constellation_id);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_designation_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_designation_key UNIQUE (designation);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


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
-- PostgreSQL database dump complete
--

