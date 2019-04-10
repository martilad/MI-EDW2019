
--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.16
-- Dumped by pg_dump version 9.5.16

-- Started on 2019-03-27 21:04:53

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12355)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner:
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2124 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner:
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 182 (class 1259 OID 57576)
-- Name: attendance; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.attendance (
    student_id integer,
    session_id integer,
    present integer
);


ALTER TABLE public.attendance OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 57599)
-- Name: behaviour_entry; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.behaviour_entry (
    session_id bigint,
    student_id bigint,
    exercise character varying(256),
    activity character varying(256),
    start_time timestamp without time zone,
    end_time timestamp without time zone,
    idle_time bigint,
    mouse_wheel bigint,
    mouse_wheel_click bigint,
    mouse_click_left bigint,
    mouse_click_right bigint,
    mouse_movement bigint,
    keystroke bigint
);


ALTER TABLE public.behaviour_entry OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 57726)
-- Name: final_grades; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.final_grades (
    student_id integer,
    "ES1.1" double precision,
    "ES1.2" double precision,
    "ES2.1" double precision,
    "ES2.2" double precision,
    "ES3.1" double precision,
    "ES3.2" double precision,
    "ES3.3" double precision,
    "ES3.4" double precision,
    "ES3.5" double precision,
    "ES4.1" double precision,
    "ES4.2" double precision,
    "ES5.1" double precision,
    "ES5.2" double precision,
    "ES5.3" double precision,
    "ES6.1" double precision,
    "ES6.2" double precision,
    total double precision,
    attempt integer
);


ALTER TABLE public.final_grades OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 57612)
-- Name: intermediate_grades; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.intermediate_grades (
    student_id integer,
    session_id integer,
    points double precision
);


ALTER TABLE public.intermediate_grades OWNER TO postgres;

--
-- TOC entry 181 (class 1259 OID 57564)
-- Name: student; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student (
    id integer,
    first_name text,
    last_name text,
    last_update timestamp without time zone
);


ALTER TABLE public.student OWNER TO postgres;

--
-- TOC entry 2112 (class 0 OID 57576)
-- Dependencies: 182
-- Data for Name: attendance; Type: TABLE DATA; Schema: public; Owner: postgres
--
--
-- TOC entry 2123 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2019-03-27 21:04:54

--
-- PostgreSQL database dump complete
--
