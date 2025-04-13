--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

-- Started on 2025-04-13 21:09:00

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 217 (class 1259 OID 16465)
-- Name: forex; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.forex (
    news text,
    id integer NOT NULL
);


ALTER TABLE public.forex OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16470)
-- Name: forex_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.forex ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.forex_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 219 (class 1259 OID 16471)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    user_id integer,
    product_id integer,
    "timestamp" text,
    status integer DEFAULT 0,
    slip text,
    referral_id integer
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16477)
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.orders ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 221 (class 1259 OID 16478)
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id integer NOT NULL,
    days integer,
    name text,
    detail text,
    price integer,
    special smallint,
    img text
);


ALTER TABLE public.products OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16483)
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.products ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 223 (class 1259 OID 16484)
-- Name: teams; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teams (
    id integer NOT NULL,
    team_name text,
    status smallint DEFAULT 0,
    owner_id integer NOT NULL,
    broker_link text DEFAULT ''::text,
    members integer DEFAULT 0 NOT NULL,
    total_money double precision DEFAULT 0.00,
    broker_money double precision DEFAULT 0.00 NOT NULL
);


ALTER TABLE public.teams OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16494)
-- Name: teams_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.teams ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.teams_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 225 (class 1259 OID 16495)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username text,
    password text,
    email text,
    phone_number text,
    total_days integer DEFAULT 0,
    role integer DEFAULT 0,
    name text DEFAULT ''::text,
    surname text DEFAULT ''::text,
    age integer DEFAULT 0,
    gender text DEFAULT ''::text,
    thai_id text DEFAULT ''::text,
    bod text DEFAULT ''::text,
    job text DEFAULT ''::text,
    salary integer DEFAULT 0,
    bank_account text DEFAULT ''::text,
    bank_name text DEFAULT ''::text,
    bank_img text DEFAULT ''::text,
    thai_id_img text DEFAULT ''::text,
    face_img text DEFAULT ''::text,
    team_id integer,
    referral_id integer
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16515)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.users ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.users_id_seq
    START WITH 10000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 4891 (class 0 OID 16465)
-- Dependencies: 217
-- Data for Name: forex; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.forex (news, id) FROM stdin;
\.


--
-- TOC entry 4893 (class 0 OID 16471)
-- Dependencies: 219
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, user_id, product_id, "timestamp", status, slip, referral_id) FROM stdin;
\.


--
-- TOC entry 4895 (class 0 OID 16478)
-- Dependencies: 221
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, days, name, detail, price, special, img) FROM stdin;
2	105	Standard	แพ็กเกจพื้นฐาน 3 เดือนสำหรับมือใหม่ 15 วัน.	1490	1	/qr/1490th.webp
3	215	Premium	แพ็กเกจพื้นฐาน 6 เดือนสำหรับมือใหม่ 35 วัน.	2900	1	/qr/2900th.webp
1	30	Basic	แพ็กเกจพื้นฐาน 1 เดือนสำหรับมือใหม่	499	0	/qr/499th.webp
\.


--
-- TOC entry 4897 (class 0 OID 16484)
-- Dependencies: 223
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.teams (id, team_name, status, owner_id, broker_link, members, total_money, broker_money) FROM stdin;
\.


--
-- TOC entry 4899 (class 0 OID 16495)
-- Dependencies: 225
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, username, password, email, phone_number, total_days, role, name, surname, age, gender, thai_id, bod, job, salary, bank_account, bank_name, bank_img, thai_id_img, face_img, team_id, referral_id) FROM stdin;
\.


--
-- TOC entry 4906 (class 0 OID 0)
-- Dependencies: 218
-- Name: forex_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.forex_id_seq', 1, true);


--
-- TOC entry 4907 (class 0 OID 0)
-- Dependencies: 220
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 18, true);


--
-- TOC entry 4908 (class 0 OID 0)
-- Dependencies: 222
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 3, true);


--
-- TOC entry 4909 (class 0 OID 0)
-- Dependencies: 224
-- Name: teams_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.teams_id_seq', 23, true);


--
-- TOC entry 4910 (class 0 OID 0)
-- Dependencies: 226
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 10034, true);


--
-- TOC entry 4737 (class 2606 OID 16518)
-- Name: forex forex_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forex
    ADD CONSTRAINT forex_pkey PRIMARY KEY (id);


--
-- TOC entry 4739 (class 2606 OID 16520)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- TOC entry 4741 (class 2606 OID 16522)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- TOC entry 4743 (class 2606 OID 16524)
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (id);


--
-- TOC entry 4745 (class 2606 OID 16526)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


-- Completed on 2025-04-13 21:09:00

--
-- PostgreSQL database dump complete
--

