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
-- Name: games_history; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games_history (
    user_id integer NOT NULL,
    username character varying(22),
    games_played integer,
    best_game integer
);


ALTER TABLE public.games_history OWNER TO freecodecamp;

--
-- Name: games_history_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_history_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_history_user_id_seq OWNER TO freecodecamp;

--
-- Name: games_history_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_history_user_id_seq OWNED BY public.games_history.user_id;


--
-- Name: games_history user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games_history ALTER COLUMN user_id SET DEFAULT nextval('public.games_history_user_id_seq'::regclass);


--
-- Data for Name: games_history; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games_history VALUES (2, 'Alexander', 2, 5);
INSERT INTO public.games_history VALUES (10, 'user_1677668598688', 2, 429);
INSERT INTO public.games_history VALUES (18, 'user_1677669341276', 2, 98);
INSERT INTO public.games_history VALUES (9, 'user_1677668598689', 5, 4);
INSERT INTO public.games_history VALUES (4, 'user_1677667736733', 2, 14);
INSERT INTO public.games_history VALUES (17, 'user_1677669341277', 5, 13);
INSERT INTO public.games_history VALUES (3, 'user_1677667736734', 5, 28);
INSERT INTO public.games_history VALUES (1, 'Maria', 11, 2);
INSERT INTO public.games_history VALUES (12, 'user_1677668613118', 2, 602);
INSERT INTO public.games_history VALUES (6, 'user_1677668123770', 2, 535);
INSERT INTO public.games_history VALUES (11, 'user_1677668613119', 5, 159);
INSERT INTO public.games_history VALUES (5, 'user_1677668123771', 5, 14);
INSERT INTO public.games_history VALUES (8, 'user_1677668145459', 2, 307);
INSERT INTO public.games_history VALUES (14, 'user_1677668638605', 2, 404);
INSERT INTO public.games_history VALUES (7, 'user_1677668145460', 5, 26);
INSERT INTO public.games_history VALUES (13, 'user_1677668638606', 5, 59);
INSERT INTO public.games_history VALUES (16, 'user_1677669156155', 2, 155);
INSERT INTO public.games_history VALUES (15, 'user_1677669156156', 5, 586);


--
-- Name: games_history_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_history_user_id_seq', 18, true);


--
-- Name: games_history games_history_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games_history
    ADD CONSTRAINT games_history_pkey PRIMARY KEY (user_id);


--
-- Name: games_history games_history_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games_history
    ADD CONSTRAINT games_history_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

