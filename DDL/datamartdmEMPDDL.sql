-- Dumped from database version 9.5.16
-- Dumped by pg_dump version 9.5.16

-- Started on 2019-05-03 16:56:41

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
-- TOC entry 2104 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner:
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 183 (class 1259 OID 66219)
-- Name: dmemp; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dmemp (
    student_id bigint,
    session_id bigint,
    duration double precision,
    total double precision,
    session_points double precision
);


ALTER TABLE public.dmemp OWNER TO postgres;

--
-- TOC entry 2095 (class 0 OID 66219)
-- Dependencies: 183
-- Data for Name: dmemp; Type: TABLE DATA; Schema: public; Owner: postgres
--
