--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

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
-- Name: access_rights; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.access_rights (
    access_level integer NOT NULL,
    user_level character varying(50)
);


ALTER TABLE public.access_rights OWNER TO postgres;

--
-- Name: reports; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reports (
    id integer NOT NULL,
    name character varying(50),
    number character varying(50),
    access_rights_access_level integer
);


ALTER TABLE public.reports OWNER TO postgres;

--
-- Name: reports_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reports_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.reports_id_seq OWNER TO postgres;

--
-- Name: reports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reports_id_seq OWNED BY public.reports.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(50),
    email character varying(50),
    phone character varying(50),
    access_rights_user_level character varying(50)
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: users_reports; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_reports (
    id integer NOT NULL,
    user_id integer,
    report_id integer
);


ALTER TABLE public.users_reports OWNER TO postgres;

--
-- Name: users_reports_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_reports_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_reports_id_seq OWNER TO postgres;

--
-- Name: users_reports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_reports_id_seq OWNED BY public.users_reports.id;


--
-- Name: reports id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reports ALTER COLUMN id SET DEFAULT nextval('public.reports_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: users_reports id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_reports ALTER COLUMN id SET DEFAULT nextval('public.users_reports_id_seq'::regclass);


--
-- Data for Name: access_rights; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.access_rights (access_level, user_level) FROM stdin;
1	admin
2	moderator
3	user
\.


--
-- Data for Name: reports; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reports (id, name, number, access_rights_access_level) FROM stdin;
1	report_1	001	1
2	report_2	002	1
3	report_3	003	1
4	report_4	004	2
5	report_5	005	2
6	report_6	006	3
7	report_7	007	3
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, phone, access_rights_user_level) FROM stdin;
1	John Smith	john@example.com	123-456-7890	admin
2	Emma Johnson	emma@example.com	234-567-8901	moderator
3	Michael Brown	michael@example.com	345-678-9012	moderator
4	Sarah Miller	sarah@example.com	456-789-0123	user
5	David Wilson	david@example.com	567-890-1234	user
6	Jennifer Davis	jennifer@example.com	678-901-2345	user
7	Daniel Martinez	daniel@example.com	789-012-3456	user
\.


--
-- Data for Name: users_reports; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_reports (id, user_id, report_id) FROM stdin;
1	1	1
2	1	2
3	1	3
4	1	6
5	2	1
6	2	3
7	2	5
8	3	7
9	3	4
10	6	4
11	6	5
12	6	6
\.


--
-- Name: reports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reports_id_seq', 7, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 7, true);


--
-- Name: users_reports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_reports_id_seq', 12, true);


--
-- Name: access_rights access_rights_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.access_rights
    ADD CONSTRAINT access_rights_pkey PRIMARY KEY (access_level);


--
-- Name: reports reports_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reports
    ADD CONSTRAINT reports_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users_reports users_reports_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_reports
    ADD CONSTRAINT users_reports_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

