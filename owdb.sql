--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.0

-- Started on 2025-04-11 14:24:46 +07

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
-- TOC entry 217 (class 1259 OID 16389)
-- Name: forex; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.forex (
    news text,
    id integer NOT NULL
);


ALTER TABLE public.forex OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16394)
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
-- TOC entry 219 (class 1259 OID 16395)
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
-- TOC entry 220 (class 1259 OID 16401)
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
-- TOC entry 221 (class 1259 OID 16402)
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
-- TOC entry 222 (class 1259 OID 16407)
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
-- TOC entry 223 (class 1259 OID 16408)
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
-- TOC entry 224 (class 1259 OID 16415)
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
-- TOC entry 225 (class 1259 OID 16416)
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
-- TOC entry 226 (class 1259 OID 16437)
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
-- TOC entry 3646 (class 0 OID 16389)
-- Dependencies: 217
-- Data for Name: forex; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.forex (news, id) FROM stdin;
[{"title":"Prelim Industrial Production m/m","country":"JPY","date":"2025-03-30T19:50:00-04:00","impact":"Low","forecast":"1.9%","previous":"-1.1%"},{"title":"Retail Sales y/y","country":"JPY","date":"2025-03-30T19:50:00-04:00","impact":"Low","forecast":"2.4%","previous":"3.9%"},{"title":"MI Inflation Gauge m/m","country":"AUD","date":"2025-03-30T20:00:00-04:00","impact":"Low","forecast":"","previous":"-0.2%"},{"title":"ANZ Business Confidence","country":"NZD","date":"2025-03-30T20:00:00-04:00","impact":"Low","forecast":"","previous":"58.4"},{"title":"Private Sector Credit m/m","country":"AUD","date":"2025-03-30T20:30:00-04:00","impact":"Low","forecast":"0.5%","previous":"0.5%"},{"title":"Manufacturing PMI","country":"CNY","date":"2025-03-30T21:30:00-04:00","impact":"High","forecast":"50.4","previous":"50.2"},{"title":"Non-Manufacturing PMI","country":"CNY","date":"2025-03-30T21:30:00-04:00","impact":"Medium","forecast":"50.5","previous":"50.4"},{"title":"Housing Starts y/y","country":"JPY","date":"2025-03-31T01:00:00-04:00","impact":"Low","forecast":"-2.3%","previous":"-4.6%"},{"title":"German Import Prices m/m","country":"EUR","date":"2025-03-31T02:00:00-04:00","impact":"Low","forecast":"0.0%","previous":"1.1%"},{"title":"German Retail Sales m/m","country":"EUR","date":"2025-03-31T02:00:00-04:00","impact":"Low","forecast":"0.0%","previous":"0.2%"},{"title":"German Prelim CPI m/m","country":"EUR","date":"2025-03-31T02:29:00-04:00","impact":"High","forecast":"0.3%","previous":"0.4%"},{"title":"M4 Money Supply m/m","country":"GBP","date":"2025-03-31T04:30:00-04:00","impact":"Low","forecast":"1.1%","previous":"1.3%"},{"title":"Mortgage Approvals","country":"GBP","date":"2025-03-31T04:30:00-04:00","impact":"Low","forecast":"66K","previous":"66K"},{"title":"Net Lending to Individuals m/m","country":"GBP","date":"2025-03-31T04:30:00-04:00","impact":"Low","forecast":"4.9B","previous":"5.9B"},{"title":"Italian Prelim CPI m/m","country":"EUR","date":"2025-03-31T05:00:00-04:00","impact":"Low","forecast":"0.0%","previous":"0.2%"},{"title":"Chicago PMI","country":"USD","date":"2025-03-31T09:45:00-04:00","impact":"Low","forecast":"45.5","previous":"45.5"},{"title":"BRC Shop Price Index y/y","country":"GBP","date":"2025-03-31T19:01:00-04:00","impact":"Low","forecast":"","previous":"-0.7%"},{"title":"Unemployment Rate","country":"JPY","date":"2025-03-31T19:30:00-04:00","impact":"Low","forecast":"2.5%","previous":"2.5%"},{"title":"Tankan Manufacturing Index","country":"JPY","date":"2025-03-31T19:50:00-04:00","impact":"Low","forecast":"12","previous":"14"},{"title":"Tankan Non-Manufacturing Index","country":"JPY","date":"2025-03-31T19:50:00-04:00","impact":"Low","forecast":"33","previous":"33"},{"title":"Retail Sales m/m","country":"AUD","date":"2025-03-31T20:30:00-04:00","impact":"Medium","forecast":"0.3%","previous":"0.3%"},{"title":"Final Manufacturing PMI","country":"JPY","date":"2025-03-31T20:30:00-04:00","impact":"Low","forecast":"48.3","previous":"48.3"},{"title":"Caixin Manufacturing PMI","country":"CNY","date":"2025-03-31T21:45:00-04:00","impact":"Low","forecast":"50.6","previous":"50.8"},{"title":"Cash Rate","country":"AUD","date":"2025-03-31T23:30:00-04:00","impact":"High","forecast":"4.10%","previous":"4.10%"},{"title":"RBA Rate Statement","country":"AUD","date":"2025-03-31T23:30:00-04:00","impact":"High","forecast":"","previous":""},{"title":"RBA Press Conference","country":"AUD","date":"2025-04-01T00:30:00-04:00","impact":"Medium","forecast":"","previous":""},{"title":"Commodity Prices y/y","country":"AUD","date":"2025-04-01T01:30:00-04:00","impact":"Low","forecast":"","previous":"-8.2%"},{"title":"Nationwide HPI m/m","country":"GBP","date":"2025-04-01T02:02:00-04:00","impact":"Low","forecast":"0.2%","previous":"0.4%"},{"title":"Retail Sales y/y","country":"CHF","date":"2025-04-01T02:30:00-04:00","impact":"Low","forecast":"1.5%","previous":"1.3%"},{"title":"Spanish Manufacturing PMI","country":"EUR","date":"2025-04-01T03:15:00-04:00","impact":"Low","forecast":"49.8","previous":"49.7"},{"title":"Manufacturing PMI","country":"CHF","date":"2025-04-01T03:30:00-04:00","impact":"Low","forecast":"50.4","previous":"49.6"},{"title":"Italian Manufacturing PMI","country":"EUR","date":"2025-04-01T03:45:00-04:00","impact":"Low","forecast":"47.9","previous":"47.4"},{"title":"French Final Manufacturing PMI","country":"EUR","date":"2025-04-01T03:50:00-04:00","impact":"Low","forecast":"48.9","previous":"48.9"},{"title":"German Final Manufacturing PMI","country":"EUR","date":"2025-04-01T03:55:00-04:00","impact":"Low","forecast":"48.4","previous":"48.3"},{"title":"Final Manufacturing PMI","country":"EUR","date":"2025-04-01T04:00:00-04:00","impact":"Low","forecast":"48.7","previous":"48.7"},{"title":"Italian Monthly Unemployment Rate","country":"EUR","date":"2025-04-01T04:00:00-04:00","impact":"Low","forecast":"6.3%","previous":"6.3%"},{"title":"MPC Member Greene Speaks","country":"GBP","date":"2025-04-01T04:15:00-04:00","impact":"Low","forecast":"","previous":""},{"title":"Final Manufacturing PMI","country":"GBP","date":"2025-04-01T04:30:00-04:00","impact":"Low","forecast":"44.6","previous":"44.6"},{"title":"Core CPI Flash Estimate y/y","country":"EUR","date":"2025-04-01T05:00:00-04:00","impact":"Medium","forecast":"2.5%","previous":"2.6%"},{"title":"CPI Flash Estimate y/y","country":"EUR","date":"2025-04-01T05:00:00-04:00","impact":"Medium","forecast":"2.2%","previous":"2.4%"},{"title":"Unemployment Rate","country":"EUR","date":"2025-04-01T05:00:00-04:00","impact":"Low","forecast":"6.2%","previous":"6.2%"},{"title":"ECB President Lagarde Speaks","country":"EUR","date":"2025-04-01T08:30:00-04:00","impact":"Medium","forecast":"","previous":""},{"title":"FOMC Member Barkin Speaks","country":"USD","date":"2025-04-01T09:00:00-04:00","impact":"Low","forecast":"","previous":""},{"title":"Manufacturing PMI","country":"CAD","date":"2025-04-01T09:30:00-04:00","impact":"Low","forecast":"","previous":"47.8"},{"title":"Final Manufacturing PMI","country":"USD","date":"2025-04-01T09:45:00-04:00","impact":"Medium","forecast":"49.8","previous":"49.8"},{"title":"ISM Manufacturing PMI","country":"USD","date":"2025-04-01T10:00:00-04:00","impact":"High","forecast":"49.5","previous":"50.3"},{"title":"JOLTS Job Openings","country":"USD","date":"2025-04-01T10:00:00-04:00","impact":"High","forecast":"7.69M","previous":"7.74M"},{"title":"ISM Manufacturing Prices","country":"USD","date":"2025-04-01T10:00:00-04:00","impact":"Medium","forecast":"64.6","previous":"62.4"},{"title":"Construction Spending m/m","country":"USD","date":"2025-04-01T10:00:00-04:00","impact":"Low","forecast":"0.3%","previous":"-0.2%"},{"title":"Wards Total Vehicle Sales","country":"USD","date":"2025-04-01T10:15:00-04:00","impact":"Low","forecast":"16.1M","previous":"16.0M"},{"title":"RCM/TIPP Economic Optimism","country":"USD","date":"2025-04-01T10:34:00-04:00","impact":"Low","forecast":"50.1","previous":"49.8"},{"title":"GDT Price Index","country":"NZD","date":"2025-04-01T10:57:00-04:00","impact":"Low","forecast":"","previous":"0.0%"},{"title":"Building Consents m/m","country":"NZD","date":"2025-04-01T17:45:00-04:00","impact":"Low","forecast":"","previous":"2.6%"},{"title":"RBA Assist Gov Kent Speaks","country":"AUD","date":"2025-04-01T19:25:00-04:00","impact":"Low","forecast":"","previous":""},{"title":"Monetary Base y/y","country":"JPY","date":"2025-04-01T19:50:00-04:00","impact":"Low","forecast":"-1.5%","previous":"-1.8%"},{"title":"Building Approvals m/m","country":"AUD","date":"2025-04-01T20:30:00-04:00","impact":"Low","forecast":"-1.4%","previous":"6.3%"},{"title":"French Gov Budget Balance","country":"EUR","date":"2025-04-02T02:45:00-04:00","impact":"Low","forecast":"-30.2B","previous":"-17.3B"},{"title":"Spanish Unemployment Change","country":"EUR","date":"2025-04-02T03:00:00-04:00","impact":"Low","forecast":"-2.5K","previous":"-6.0K"},{"title":"German 10-y Bond Auction","country":"EUR","date":"2025-04-02T05:42:00-04:00","impact":"Low","forecast":"","previous":"2.92|2.1"},{"title":"ADP Non-Farm Employment Change","country":"USD","date":"2025-04-02T08:15:00-04:00","impact":"High","forecast":"118K","previous":"77K"},{"title":"Factory Orders m/m","country":"USD","date":"2025-04-02T10:00:00-04:00","impact":"Low","forecast":"0.5%","previous":"1.7%"},{"title":"Crude Oil Inventories","country":"USD","date":"2025-04-02T10:30:00-04:00","impact":"Low","forecast":"-1.9M","previous":"-3.3M"},{"title":"President Trump Speaks","country":"USD","date":"2025-04-02T16:00:00-04:00","impact":"High","forecast":"","previous":""},{"title":"FOMC Member Kugler Speaks","country":"USD","date":"2025-04-02T16:30:00-04:00","impact":"Low","forecast":"","previous":""},{"title":"ANZ Commodity Prices m/m","country":"NZD","date":"2025-04-02T20:00:00-04:00","impact":"Low","forecast":"","previous":"3.0%"},{"title":"Goods Trade Balance","country":"AUD","date":"2025-04-02T20:30:00-04:00","impact":"Low","forecast":"5.38B","previous":"5.62B"},{"title":"RBA Financial Stability Review","country":"AUD","date":"2025-04-02T20:30:00-04:00","impact":"Low","forecast":"","previous":""},{"title":"Caixin Services PMI","country":"CNY","date":"2025-04-02T21:45:00-04:00","impact":"Low","forecast":"51.5","previous":"51.4"},{"title":"10-y Bond Auction","country":"JPY","date":"2025-04-02T23:35:00-04:00","impact":"Low","forecast":"","previous":"1.40|2.7"},{"title":"CPI m/m","country":"CHF","date":"2025-04-03T02:30:00-04:00","impact":"High","forecast":"0.1%","previous":"0.6%"},{"title":"Spanish Services PMI","country":"EUR","date":"2025-04-03T03:15:00-04:00","impact":"Low","forecast":"55.6","previous":"56.2"},{"title":"Italian Services PMI","country":"EUR","date":"2025-04-03T03:45:00-04:00","impact":"Low","forecast":"52.6","previous":"53.0"},{"title":"French Final Services PMI","country":"EUR","date":"2025-04-03T03:50:00-04:00","impact":"Low","forecast":"46.6","previous":"46.6"},{"title":"German Final Services PMI","country":"EUR","date":"2025-04-03T03:55:00-04:00","impact":"Low","forecast":"50.2","previous":"50.2"},{"title":"Final Services PMI","country":"EUR","date":"2025-04-03T04:00:00-04:00","impact":"Low","forecast":"50.4","previous":"50.4"},{"title":"Gov Board Member Tschudin Speaks","country":"CHF","date":"2025-04-03T04:30:00-04:00","impact":"Low","forecast":"","previous":""},{"title":"Final Services PMI","country":"GBP","date":"2025-04-03T04:30:00-04:00","impact":"Low","forecast":"53.2","previous":"53.2"},{"title":"PPI m/m","country":"EUR","date":"2025-04-03T05:00:00-04:00","impact":"Low","forecast":"0.3%","previous":"0.8%"},{"title":"OPEC-JMMC Meetings","country":"All","date":"2025-04-03T05:15:00-04:00","impact":"Medium","forecast":"","previous":""},{"title":"French 10-y Bond Auction","country":"EUR","date":"2025-04-03T05:18:00-04:00","impact":"Low","forecast":"","previous":"3.51|2.7"},{"title":"ECB Monetary Policy Meeting Accounts","country":"EUR","date":"2025-04-03T07:30:00-04:00","impact":"Low","forecast":"","previous":""},{"title":"Challenger Job Cuts y/y","country":"USD","date":"2025-04-03T07:30:00-04:00","impact":"Low","forecast":"","previous":"103.2%"},{"title":"Trade Balance","country":"CAD","date":"2025-04-03T08:30:00-04:00","impact":"Low","forecast":"3.4B","previous":"4.0B"},{"title":"Unemployment Claims","country":"USD","date":"2025-04-03T08:30:00-04:00","impact":"High","forecast":"225K","previous":"224K"},{"title":"Trade Balance","country":"USD","date":"2025-04-03T08:30:00-04:00","impact":"Low","forecast":"-122.5B","previous":"-131.4B"},{"title":"Final Services PMI","country":"USD","date":"2025-04-03T09:45:00-04:00","impact":"Medium","forecast":"54.1","previous":"54.3"},{"title":"ISM Services PMI","country":"USD","date":"2025-04-03T10:00:00-04:00","impact":"High","forecast":"53.0","previous":"53.5"},{"title":"Natural Gas Storage","country":"USD","date":"2025-04-03T10:30:00-04:00","impact":"Low","forecast":"","previous":"37B"},{"title":"FOMC Member Jefferson Speaks","country":"USD","date":"2025-04-03T12:00:00-04:00","impact":"Low","forecast":"","previous":""},{"title":"FOMC Member Cook Speaks","country":"USD","date":"2025-04-03T14:30:00-04:00","impact":"Low","forecast":"","previous":""},{"title":"Household Spending y/y","country":"JPY","date":"2025-04-03T19:30:00-04:00","impact":"Low","forecast":"-0.9%","previous":"0.8%"},{"title":"Bank Holiday","country":"CNY","date":"2025-04-03T20:01:00-04:00","impact":"Holiday","forecast":"","previous":""},{"title":"Unemployment Rate","country":"CHF","date":"2025-04-04T01:45:00-04:00","impact":"Low","forecast":"2.7%","previous":"2.7%"},{"title":"German Factory Orders m/m","country":"EUR","date":"2025-04-04T02:00:00-04:00","impact":"Low","forecast":"3.4%","previous":"-7.0%"},{"title":"French Industrial Production m/m","country":"EUR","date":"2025-04-04T02:45:00-04:00","impact":"Low","forecast":"0.5%","previous":"-0.6%"},{"title":"Italian Retail Sales m/m","country":"EUR","date":"2025-04-04T04:00:00-04:00","impact":"Low","forecast":"0.2%","previous":"-0.4%"},{"title":"Construction PMI","country":"GBP","date":"2025-04-04T04:30:00-04:00","impact":"Medium","forecast":"46.3","previous":"44.6"},{"title":"Housing Equity Withdrawal q/q","country":"GBP","date":"2025-04-04T04:30:00-04:00","impact":"Low","forecast":"-10.8B","previous":"-12.5B"},{"title":"Employment Change","country":"CAD","date":"2025-04-04T08:30:00-04:00","impact":"High","forecast":"10.4K","previous":"1.1K"},{"title":"Unemployment Rate","country":"CAD","date":"2025-04-04T08:30:00-04:00","impact":"High","forecast":"6.7%","previous":"6.6%"},{"title":"Average Hourly Earnings m/m","country":"USD","date":"2025-04-04T08:30:00-04:00","impact":"High","forecast":"0.3%","previous":"0.3%"},{"title":"Non-Farm Employment Change","country":"USD","date":"2025-04-04T08:30:00-04:00","impact":"High","forecast":"137K","previous":"151K"},{"title":"Unemployment Rate","country":"USD","date":"2025-04-04T08:30:00-04:00","impact":"High","forecast":"4.1%","previous":"4.1%"},{"title":"Fed Chair Powell Speaks","country":"USD","date":"2025-04-04T11:25:00-04:00","impact":"High","forecast":"","previous":""},{"title":"FOMC Member Barr Speaks","country":"USD","date":"2025-04-04T12:00:00-04:00","impact":"Low","forecast":"","previous":""},{"title":"FOMC Member Waller Speaks","country":"USD","date":"2025-04-04T12:45:00-04:00","impact":"Medium","forecast":"","previous":""},{"title":"Daylight Saving Time Shift","country":"NZD","date":"2025-04-05T10:00:00-04:00","impact":"Holiday","forecast":"","previous":""},{"title":"Daylight Saving Time Shift","country":"AUD","date":"2025-04-05T12:00:00-04:00","impact":"Holiday","forecast":"","previous":""}]	1
\.


--
-- TOC entry 3648 (class 0 OID 16395)
-- Dependencies: 219
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, user_id, product_id, "timestamp", status, slip, referral_id) FROM stdin;
1	10000	1	1740068359612	\N	1740068359608-slip.webp	\N
2	10001	2	1740068521970	1	1740068521967-slip.webp	\N
3	10001	1	1740068769696	1	1740068769693-slip.webp	\N
4	10002	1	1743504685986	0	1743504685983-slip.webp	\N
5	10027	1	1744018806779	1	1744018806774-slip.webp	\N
6	10027	1	1744019237199	1	1744019237195-slip.webp	\N
7	10027	1	1744019412984	1	1744019412981-slip.webp	\N
8	10027	1	1744019471948	1	1744019471944-slip.webp	\N
9	10027	1	1744019541560	1	1744019541556-slip.webp	\N
10	10027	1	1744019645035	1	1744019645031-slip.webp	\N
11	10028	2	1744020165153	1	1744020165150-slip.webp	\N
12	10029	1	1744098686497	0	1744098686493-slip.webp	10017
13	10029	1	1744098938026	1	1744098938022-slip.webp	10017
\.


--
-- TOC entry 3650 (class 0 OID 16402)
-- Dependencies: 221
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, days, name, detail, price, special, img) FROM stdin;
2	105	Standard	แพ็กเกจพื้นฐาน 3 เดือนสำหรับมือใหม่ 15 วัน.	1490	1	/qr/1490th.webp
3	215	Premium	แพ็กเกจพื้นฐาน 6 เดือนสำหรับมือใหม่ 35 วัน.	2900	1	/qr/2900th.webp
1	30	Basic	แพ็กเกจพื้นฐาน 1 เดือนสำหรับมือใหม่	499	0	/qr/499th.webp
\.


--
-- TOC entry 3652 (class 0 OID 16408)
-- Dependencies: 223
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.teams (id, team_name, status, owner_id, broker_link, members, total_money, broker_money) FROM stdin;
15	Bitcoin	2	10014	https://fxglobal-trade.com	0	0	0
16	ginggoiteam	2	10015	https://github.com/p1ay2invokio/outwittrader	0	0	0
17	booboo team	2	10016	https://test	0	0	0
19	young	2	10027	https://localhost/sokdjafsjgjs	0	0	0
18	Jobber	2	10017	https://ojsadfkljwejr	4	497.6	500
\.


--
-- TOC entry 3654 (class 0 OID 16416)
-- Dependencies: 225
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, username, password, email, phone_number, total_days, role, name, surname, age, gender, thai_id, bod, job, salary, bank_account, bank_name, bank_img, thai_id_img, face_img, team_id, referral_id) FROM stdin;
10010	boy	123456	boy@gmail.com	0684168484	0	0	Boy	KO	50	ชาย	0681068408	01-08/50	เทส	50	8016816804	เทส	uploads\\rp10010\\1743614021794-bank_img.webp	uploads\\rp10010\\1743614021795-thai_id_img.webp	uploads\\rp10010\\1743614021793-face_img.webp	10	\N
10012	camp	123456	camp@gmail.com	06816847	0	0	BoonJa	camp	560	ชาย	10681068448	1/5/58	โปรแกรมเมอร์	600	801610	test	uploads\\rp10012\\1743614658242-bank_img.webp	uploads\\rp10012\\1743614658243-thai_id_img.webp	uploads\\rp10012\\1743614658242-face_img.webp	12	\N
10008	pom	123456	pom@gmail.com	098486168	0	0	oijasdlfkj	akdljflkasj	30	ชาย	17890684864	01/05/25	เทรดเดอร์	600	5441354	กสิกร	uploads\\rp10008\\1743572664441-bank_img.webp	uploads\\rp10008\\1743572664443-thai_id_img.webp	uploads\\rp10008\\1743572664440-face_img.webp	\N	\N
10013	vovo	123456	vovo@gmail.com	09843541384	0	0	แอนนี่	จ้า	80	หญิง	1681684	1/6/8	ไม่มี	600	684684	KBank	/slip/rp10013/1743616868572-bank_img.webp	/slip/rp10013/1743616868574-thai_id_img.webp	/slip/rp10013/1743616868572-face_img.webp	13	\N
10009	jo	123456	jo@gmail.com	09840684	0	0	jo	jo	20	male	577585684	018/8084/04	test	300	06816180	k	uploads\\rp10009\\1743575492315-bank_img.webp	uploads\\rp10009\\1743575492319-thai_id_img.webp	uploads\\rp10009\\1743575492315-face_img.webp	1	\N
10002	hoho	123456	hoho@gmail.com	0984065184	0	0	รัฐนนท์	บุญมาตา	35	ชาย	1705599686201	05/01/2542	นักศึกษา	7000	584874525	กสิกร	uploads\\rp10002\\1743517085919-bank_img.webp	uploads\\rp10002\\1743517085921-thai_id_img.webp	uploads\\rp10002\\1743517085918-face_img.webp	\N	\N
10014	A	123456	A@gmail.com	0956478754	0	0	สมหมาย	ขายดี	35	ชาย	15148747984	01/09/2548	ธุรกิจส่วนตัว	100000	1847784	กสิกร	/slip/rp10014/1743619575044-bank_img.webp	/slip/rp10014/1743619575045-thai_id_img.webp	/slip/rp10014/1743619575044-face_img.webp	15	\N
10004	wed	123456	wed@gmail.com	0984065416877	0	0	เฮลโล่	จ้า	15	ชาย	1890849847	01/05/68	เทส	500	9801984	84984087	uploads\\rp10004\\1743518921239-bank_img.webp	uploads\\rp10004\\1743518921242-thai_id_img.webp	uploads\\rp10004\\1743518921238-face_img.webp	\N	\N
10005	rubick	123456	rubick@gmail.com	098468487	0	0	rubick	address	45	Male	98016816840	01/06/25		0	09816810684	KBank	uploads\\rp10005\\1743519067880-bank_img.webp	uploads\\rp10005\\1743519067881-thai_id_img.webp	uploads\\rp10005\\1743519067880-face_img.webp	\N	\N
10006	friday	123456	Friday@gmail.com	08946817778	0	0	ศุกร์	ภากร	32	ชาย	085168487	01/05/06	ธุรกิจส่วนตัว	300	150014725	SCB	uploads\\rp10006\\1743519438530-bank_img.webp	uploads\\rp10006\\1743519438531-thai_id_img.webp	uploads\\rp10006\\1743519438529-face_img.webp	\N	\N
10016	boo	123456	booooo@gmail.com	0924849223	2	0	boooo	oisjdfs	24	male	092348904	01/42/41	students	200	2910283012983	KBank	/slip/rp10016/1743988540975-bank_img.webp	/slip/rp10016/1743988540976-thai_id_img.webp	/slip/rp10016/1743988540975-face_img.webp	17	0
10015	ginggoi	123456	ginggoi@gmail.com	093843857	0	0	สิดา	เทพเทส	25	หญิง	1283849356	01/09/2134	แพทย์	800	87655677	กสิกร	/slip/rp10015/1743848609319-bank_img.webp	/slip/rp10015/1743848609320-thai_id_img.webp	/slip/rp10015/1743848609318-face_img.webp	16	\N
10018	asdfkljaf	123456	xzcklvjxzklj@gmail.com	01284971240	0	0			0					0						\N	\N
10019	iouwefiuqw	123456	uoisuadfoi@gmail.com	09109284908214	0	0			0					0						\N	\N
10020	iuhiosfij	1	non@gmail.com	1	0	0			0					0						\N	10017
10021	tttttt	1	jkhjkhjkhppppp@gmail.com	1	0	0			0					0						\N	\N
10022	jojojojojo	1	jojojojojcojslkfj@gmail.com	0812948129048	0	0			0					0						\N	10017
10023	asdkfj	1	badbad@gmail.com	1	0	0			0					0						\N	10017
10024	lkjsf	1	zlkjkldjsfkj	1	0	0			0					0						\N	10017
10025	ljqlkjeqwklje	1	fdlksgjklfjvk	1	0	0			0					0						\N	10017
10026	ijqeqoiweoqwiueopppppeeee	1	lskajdfkjsdfkljkljklJLajklj	1	0	0			0					0						\N	10017
10017	skdlfj	123456	askldjg	05959435	0	2	admin	ja	29	female	2098120479129048	01/02/46	students	900	119230123	Bank	/slip/rp10017/1743998242672-bank_img.webp	/slip/rp10017/1743998242674-thai_id_img.webp	/slip/rp10017/1743998242671-face_img.webp	18	0
10011	mouse	123456	Mouse@gmail.com	098463541684	4	0	mouse	mickey	14	หญิง	0564181	01/48/58	นักเรียน	600	8604168484	SCB	uploads\\rp10011\\1743614366800-bank_img.webp	uploads\\rp10011\\1743614366801-thai_id_img.webp	uploads\\rp10011\\1743614366800-face_img.webp	11	\N
10003	monday	123456	monday@gmail.com	0984638487	18	0			10					0						\N	\N
10000	play2	123456	play2@gmail.com	0956975152	3	0	test	test	10	ชาย	1234563	01/05/36	test	50	561651541	test				\N	\N
10001	admin	123456	admin@gmail.com	111	88	2	test	test	10	ชาย	1234563	01/05/36	test	50	561651541	test				\N	\N
10028	ocjsoisijdfsdf	1	boonsadfijfj@oijsakldjf.com	123456	104	1			0					0						\N	10017
10007	sunday	123456	sunday@gmail.com	09846516874	9	0	เพลย์ทู	เทส	50	ชาย	43453543	10/05/95	เทส	500	08510968181	KBank	uploads\\rp10007\\1743523453088-bank_img.webp	uploads\\rp10007\\1743523453090-thai_id_img.webp	uploads\\rp10007\\1743523453087-face_img.webp	0	\N
10027	ioiqjweij123213	1	plkajeijr@gmail.com	0918230981293	179	1	hvjhvhg	yggjgjk	54		342542342	01/90/78	tgiggu	6000	89789676	scb	/slip/rp10027/1744016305363-bank_img.webp	/slip/rp10027/1744016305363-thai_id_img.webp	/slip/rp10027/1744016305361-face_img.webp	19	10017
10029	nemo	1	nemo@gmail.com	1	30	1			0					0						\N	10017
\.


--
-- TOC entry 3661 (class 0 OID 0)
-- Dependencies: 218
-- Name: forex_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.forex_id_seq', 1, true);


--
-- TOC entry 3662 (class 0 OID 0)
-- Dependencies: 220
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 13, true);


--
-- TOC entry 3663 (class 0 OID 0)
-- Dependencies: 222
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 3, true);


--
-- TOC entry 3664 (class 0 OID 0)
-- Dependencies: 224
-- Name: teams_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.teams_id_seq', 19, true);


--
-- TOC entry 3665 (class 0 OID 0)
-- Dependencies: 226
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 10029, true);


--
-- TOC entry 3492 (class 2606 OID 16440)
-- Name: forex forex_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forex
    ADD CONSTRAINT forex_pkey PRIMARY KEY (id);


--
-- TOC entry 3494 (class 2606 OID 16442)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- TOC entry 3496 (class 2606 OID 16444)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- TOC entry 3498 (class 2606 OID 16446)
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (id);


--
-- TOC entry 3500 (class 2606 OID 16448)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


-- Completed on 2025-04-11 14:24:46 +07

--
-- PostgreSQL database dump complete
--

