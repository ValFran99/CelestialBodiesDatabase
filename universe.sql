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
-- Name: dwarf_planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.dwarf_planet (
    name character varying(40) NOT NULL,
    dwarf_planet_id integer NOT NULL,
    is_spherical boolean,
    star_id integer,
    mass_in_earths numeric,
    radius_in_km integer,
    has_moons boolean
);


ALTER TABLE public.dwarf_planet OWNER TO freecodecamp;

--
-- Name: dwarf_planet_dwarf_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.dwarf_planet_dwarf_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dwarf_planet_dwarf_planet_id_seq OWNER TO freecodecamp;

--
-- Name: dwarf_planet_dwarf_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.dwarf_planet_dwarf_planet_id_seq OWNED BY public.dwarf_planet.dwarf_planet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    distance_to_earth_in_million_ly numeric,
    galaxy_type text,
    size_in_ly numeric
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
    name character varying(30) NOT NULL,
    moon_id integer NOT NULL,
    planet_id integer,
    is_spherical boolean,
    radius_in_km integer,
    orbital_period_in_days numeric NOT NULL,
    distance_to_surface_in_km numeric NOT NULL
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
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL,
    star_id integer,
    has_life boolean,
    mass_in_earths numeric,
    radius_in_km integer,
    has_moons boolean
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
    name character varying(30) NOT NULL,
    star_id integer NOT NULL,
    galaxy_id integer,
    luminosity_in_suns numeric,
    solar_radii_in_suns numeric,
    has_planets boolean,
    distance_to_earth_in_ly numeric
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
-- Name: dwarf_planet dwarf_planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarf_planet ALTER COLUMN dwarf_planet_id SET DEFAULT nextval('public.dwarf_planet_dwarf_planet_id_seq'::regclass);


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
-- Data for Name: dwarf_planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.dwarf_planet VALUES ('Ceres', 1, true, 1, 0.00016, 473, false);
INSERT INTO public.dwarf_planet VALUES ('Pluto', 2, true, 1, 0.0022, 1188, true);
INSERT INTO public.dwarf_planet VALUES ('Eris', 3, true, 1, 0.0028, 1163, true);
INSERT INTO public.dwarf_planet VALUES ('Makemake', 4, true, 1, 0.0005, 715, true);
INSERT INTO public.dwarf_planet VALUES ('Haumea', 5, true, 1, 0.0007, 816, true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Andromeda', 2, 2.5, 'Barred Spiral', 152000);
INSERT INTO public.galaxy VALUES ('Milky Way', 1, 0, 'Barred Spiral', 87400);
INSERT INTO public.galaxy VALUES ('Black Eye', 4, 17.3, 'Barred Spiral', 53800);
INSERT INTO public.galaxy VALUES ('Condor', 5, 212, 'Barred Spiral', 522000);
INSERT INTO public.galaxy VALUES ('Hoag''s Object', 6, 612.8, 'Ring', 121000);
INSERT INTO public.galaxy VALUES ('Bode''s Galaxy', 7, 17.4, 'Grand Design Spiral', 96000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Moon', 1, 1, true, 1737, 27.32, 384399);
INSERT INTO public.moon VALUES ('Phobos', 2, 4, false, 11, 0.32, 6000);
INSERT INTO public.moon VALUES ('Deimos', 3, 4, false, 6, 1.26, 23460);
INSERT INTO public.moon VALUES ('Metis', 4, 5, false, 22, 0.29, 128000);
INSERT INTO public.moon VALUES ('Adrestea', 5, 5, false, 8, 0.3, 129000);
INSERT INTO public.moon VALUES ('Amalthea', 6, 5, false, 83, 0.5, 181000);
INSERT INTO public.moon VALUES ('Thebe', 7, 5, false, 49, 0.67, 222000);
INSERT INTO public.moon VALUES ('Io', 8, 5, true, 1821, 1.76, 421700);
INSERT INTO public.moon VALUES ('Europa', 9, 5, true, 1561, 3.55, 670900);
INSERT INTO public.moon VALUES ('Ganymede', 10, 5, true, 2634, 7.15, 1070400);
INSERT INTO public.moon VALUES ('Callisto', 11, 5, true, 2410, 16.69, 1880000);
INSERT INTO public.moon VALUES ('Mimas', 12, 6, true, 198, 0.94, 185520);
INSERT INTO public.moon VALUES ('Enceladus', 13, 6, true, 252, 1.37, 237948);
INSERT INTO public.moon VALUES ('Tethys', 14, 6, true, 533, 1.89, 294619);
INSERT INTO public.moon VALUES ('Dione', 15, 6, true, 562, 2.73, 377396);
INSERT INTO public.moon VALUES ('Rhea', 16, 6, true, 764, 4.52, 527108);
INSERT INTO public.moon VALUES ('Titan', 17, 6, true, 2576, 5.57, 1221870);
INSERT INTO public.moon VALUES ('Iapetus', 18, 6, true, 736, 79.32, 3560820);
INSERT INTO public.moon VALUES ('Miranda', 19, 7, true, 236, 1.41, 129390);
INSERT INTO public.moon VALUES ('Ariel', 20, 7, true, 579, 2.52, 190900);
INSERT INTO public.moon VALUES ('Umbriel', 21, 7, true, 585, 4.14, 266000);
INSERT INTO public.moon VALUES ('Titania', 22, 7, true, 789, 8.71, 436300);
INSERT INTO public.moon VALUES ('Oberon', 23, 7, true, 761, 13.46, 583519);
INSERT INTO public.moon VALUES ('Triton', 24, 8, true, 1353, 5.88, 354759);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Earth', 1, 1, true, 1, 6371, true);
INSERT INTO public.planet VALUES ('Mercury', 2, 1, false, 0.055, 2440, false);
INSERT INTO public.planet VALUES ('Venus', 3, 1, false, 0.815, 6052, false);
INSERT INTO public.planet VALUES ('Mars', 4, 1, false, 0.107, 3390, true);
INSERT INTO public.planet VALUES ('Jupiter', 5, 1, false, 317.8, 69911, true);
INSERT INTO public.planet VALUES ('Saturn', 6, 1, false, 95.16, 58232, true);
INSERT INTO public.planet VALUES ('Uranus', 7, 1, false, 14.9, 25362, true);
INSERT INTO public.planet VALUES ('Neptune', 8, 1, false, 17.1, 24622, true);
INSERT INTO public.planet VALUES ('Kepler-90b', 9, 9, false, 2.27, 8346, false);
INSERT INTO public.planet VALUES ('Kepler-90c', 10, 9, false, 1.81, 7581, false);
INSERT INTO public.planet VALUES ('Kepler-90d', 11, 9, false, 8.9, 17897, false);
INSERT INTO public.planet VALUES ('Kepler-90e', 12, 9, false, 7.56, 16568, false);
INSERT INTO public.planet VALUES ('Kepler-90f', 13, 9, false, 8.65, 17967, false);
INSERT INTO public.planet VALUES ('Kepler-90g', 14, 9, false, 254.33, 50545, false);
INSERT INTO public.planet VALUES ('Kepler-90h', 15, 9, false, 381.49, 70470, false);
INSERT INTO public.planet VALUES ('Kepler-90i', 16, 9, false, 2.3, 8409, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('Sun', 1, 1, 1, 1, true, 0.000016);
INSERT INTO public.star VALUES ('Antares', 3, 1, 75900, 680, false, 550);
INSERT INTO public.star VALUES ('UY Scuti', 6, 1, 340000, 1708, false, 9500);
INSERT INTO public.star VALUES ('Betelgeuse', 4, 1, 126000, 764, false, 643);
INSERT INTO public.star VALUES ('KW Sagittarii', 5, 1, 176000, 1009, false, 7890);
INSERT INTO public.star VALUES ('Polaris', 7, 1, 1260, 37.5, false, 433);
INSERT INTO public.star VALUES ('Alpha Centauri A', 8, 1, 1.5, 1.2, true, 4.3);
INSERT INTO public.star VALUES ('Kepler-90', 9, 1, 1.77, 1.2, true, 2790);


--
-- Name: dwarf_planet_dwarf_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.dwarf_planet_dwarf_planet_id_seq', 5, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 24, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 16, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 9, true);


--
-- Name: dwarf_planet dwarf_planet_dwarf_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarf_planet
    ADD CONSTRAINT dwarf_planet_dwarf_planet_id_key UNIQUE (dwarf_planet_id);


--
-- Name: dwarf_planet dwarf_planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarf_planet
    ADD CONSTRAINT dwarf_planet_pkey PRIMARY KEY (dwarf_planet_id);


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
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: dwarf_planet dwarf_planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarf_planet
    ADD CONSTRAINT dwarf_planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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

