--
-- PostgreSQL database dump
--

-- Dumped from database version 17.3 (Debian 17.3-3.pgdg120+1)
-- Dumped by pg_dump version 17.4

-- Started on 2025-03-05 21:43:04

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

--
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 3394 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 223 (class 1259 OID 16416)
-- Name: forex; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.forex (
    id integer NOT NULL,
    news text
);


ALTER TABLE public.forex OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16423)
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
-- TOC entry 217 (class 1259 OID 16389)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    user_id integer,
    product_id integer,
    "timestamp" text,
    status integer DEFAULT 0,
    slip text
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16395)
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
-- TOC entry 219 (class 1259 OID 16396)
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id integer NOT NULL,
    days integer,
    name text,
    detail text,
    price integer
);


ALTER TABLE public.products OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16401)
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
-- TOC entry 221 (class 1259 OID 16402)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username text,
    password text,
    email text,
    phone_number text,
    total_days integer DEFAULT 0,
    role integer DEFAULT 0
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16409)
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
-- TOC entry 3387 (class 0 OID 16416)
-- Dependencies: 223
-- Data for Name: forex; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.forex (id, news) FROM stdin;
1	[{"title":"Overseas Trade Index q\\/q","country":"NZD","date":"2025-03-02T16:45:00-05:00","impact":"Low","forecast":"1.5%","previous":"2.4%"},{"title":"MI Inflation Gauge m\\/m","country":"AUD","date":"2025-03-02T19:00:00-05:00","impact":"Low","forecast":"","previous":"0.1%"},{"title":"ANZ Job Advertisements m\\/m","country":"AUD","date":"2025-03-02T19:30:00-05:00","impact":"Low","forecast":"","previous":"0.2%"},{"title":"Company Operating Profits q\\/q","country":"AUD","date":"2025-03-02T19:30:00-05:00","impact":"Low","forecast":"1.7%","previous":"-4.6%"},{"title":"Final Manufacturing PMI","country":"JPY","date":"2025-03-02T19:30:00-05:00","impact":"Low","forecast":"48.9","previous":"48.9"},{"title":"Caixin Manufacturing PMI","country":"CNY","date":"2025-03-02T20:45:00-05:00","impact":"Low","forecast":"50.4","previous":"50.1"},{"title":"Commodity Prices y\\/y","country":"AUD","date":"2025-03-03T00:30:00-05:00","impact":"Low","forecast":"","previous":"-11.9%"},{"title":"Spanish Manufacturing PMI","country":"EUR","date":"2025-03-03T03:15:00-05:00","impact":"Low","forecast":"51.3","previous":"50.9"},{"title":"Manufacturing PMI","country":"CHF","date":"2025-03-03T03:30:00-05:00","impact":"Low","forecast":"48.3","previous":"47.5"},{"title":"Italian Manufacturing PMI","country":"EUR","date":"2025-03-03T03:45:00-05:00","impact":"Low","forecast":"46.6","previous":"46.3"},{"title":"French Final Manufacturing PMI","country":"EUR","date":"2025-03-03T03:50:00-05:00","impact":"Low","forecast":"45.5","previous":"45.5"},{"title":"German Final Manufacturing PMI","country":"EUR","date":"2025-03-03T03:55:00-05:00","impact":"Low","forecast":"46.1","previous":"46.1"},{"title":"Final Manufacturing PMI","country":"EUR","date":"2025-03-03T04:00:00-05:00","impact":"Low","forecast":"47.3","previous":"47.3"},{"title":"Final Manufacturing PMI","country":"GBP","date":"2025-03-03T04:30:00-05:00","impact":"Low","forecast":"46.4","previous":"46.4"},{"title":"M4 Money Supply m\\/m","country":"GBP","date":"2025-03-03T04:30:00-05:00","impact":"Low","forecast":"0.2%","previous":"0.1%"},{"title":"Mortgage Approvals","country":"GBP","date":"2025-03-03T04:30:00-05:00","impact":"Low","forecast":"66K","previous":"67K"},{"title":"Net Lending to Individuals m\\/m","country":"GBP","date":"2025-03-03T04:30:00-05:00","impact":"Low","forecast":"4.7B","previous":"4.6B"},{"title":"Core CPI Flash Estimate y\\/y","country":"EUR","date":"2025-03-03T05:00:00-05:00","impact":"Medium","forecast":"2.5%","previous":"2.7%"},{"title":"CPI Flash Estimate y\\/y","country":"EUR","date":"2025-03-03T05:00:00-05:00","impact":"Medium","forecast":"2.3%","previous":"2.5%"},{"title":"Manufacturing PMI","country":"CAD","date":"2025-03-03T09:30:00-05:00","impact":"Low","forecast":"","previous":"51.6"},{"title":"Final Manufacturing PMI","country":"USD","date":"2025-03-03T09:45:00-05:00","impact":"Medium","forecast":"51.6","previous":"51.6"},{"title":"ISM Manufacturing PMI","country":"USD","date":"2025-03-03T10:00:00-05:00","impact":"High","forecast":"50.6","previous":"50.9"},{"title":"ISM Manufacturing Prices","country":"USD","date":"2025-03-03T10:00:00-05:00","impact":"Medium","forecast":"56.2","previous":"54.9"},{"title":"Construction Spending m\\/m","country":"USD","date":"2025-03-03T10:00:00-05:00","impact":"Low","forecast":"-0.1%","previous":"0.5%"},{"title":"Wards Total Vehicle Sales","country":"USD","date":"2025-03-03T10:15:00-05:00","impact":"Low","forecast":"16.1M","previous":"15.6M"},{"title":"FOMC Member Musalem Speaks","country":"USD","date":"2025-03-03T12:05:00-05:00","impact":"Low","forecast":"","previous":""},{"title":"President Trump Speaks","country":"USD","date":"2025-03-03T14:39:00-05:00","impact":"Medium","forecast":"","previous":""},{"title":"Building Consents m\\/m","country":"NZD","date":"2025-03-03T16:45:00-05:00","impact":"Low","forecast":"","previous":"-5.6%"},{"title":"Unemployment Rate","country":"JPY","date":"2025-03-03T18:30:00-05:00","impact":"Low","forecast":"2.4%","previous":"2.4%"},{"title":"Capital Spending q\\/y","country":"JPY","date":"2025-03-03T18:50:00-05:00","impact":"Low","forecast":"4.9%","previous":"8.1%"},{"title":"Monetary Base y\\/y","country":"JPY","date":"2025-03-03T18:50:00-05:00","impact":"Low","forecast":"-1.8%","previous":"-2.5%"},{"title":"BRC Shop Price Index y\\/y","country":"GBP","date":"2025-03-03T19:01:00-05:00","impact":"Low","forecast":"-0.5%","previous":"-0.7%"},{"title":"Monetary Policy Meeting Minutes","country":"AUD","date":"2025-03-03T19:30:00-05:00","impact":"Medium","forecast":"","previous":""},{"title":"Retail Sales m\\/m","country":"AUD","date":"2025-03-03T19:30:00-05:00","impact":"Medium","forecast":"0.3%","previous":"-0.1%"},{"title":"Current Account","country":"AUD","date":"2025-03-03T19:30:00-05:00","impact":"Low","forecast":"-11.8B","previous":"-14.1B"},{"title":"10-y Bond Auction","country":"JPY","date":"2025-03-03T22:35:00-05:00","impact":"Low","forecast":"","previous":"1.26|3.2"},{"title":"Consumer Confidence","country":"JPY","date":"2025-03-04T00:00:00-05:00","impact":"Low","forecast":"35.2","previous":"35.2"},{"title":"French Gov Budget Balance","country":"EUR","date":"2025-03-04T02:45:00-05:00","impact":"Low","forecast":"","previous":"-156.3B"},{"title":"Spanish Unemployment Change","country":"EUR","date":"2025-03-04T03:00:00-05:00","impact":"Low","forecast":"45.2K","previous":"38.7K"},{"title":"Italian Monthly Unemployment Rate","country":"EUR","date":"2025-03-04T04:00:00-05:00","impact":"Low","forecast":"6.2%","previous":"6.2%"},{"title":"Unemployment Rate","country":"EUR","date":"2025-03-04T05:00:00-05:00","impact":"Low","forecast":"6.3%","previous":"6.3%"},{"title":"30-y Bond Auction","country":"GBP","date":"2025-03-04T06:32:00-05:00","impact":"Low","forecast":"","previous":"4.98|3.2"},{"title":"RCM\\/TIPP Economic Optimism","country":"USD","date":"2025-03-04T10:10:00-05:00","impact":"Low","forecast":"53.1","previous":"52.0"},{"title":"GDT Price Index","country":"NZD","date":"2025-03-04T10:50:00-05:00","impact":"Low","forecast":"","previous":"-0.6%"},{"title":"FOMC Member Williams Speaks","country":"USD","date":"2025-03-04T14:20:00-05:00","impact":"Low","forecast":"","previous":""},{"title":"RBA Deputy Gov Hauser Speaks","country":"AUD","date":"2025-03-04T16:45:00-05:00","impact":"Low","forecast":"","previous":""},{"title":"ANZ Commodity Prices m\\/m","country":"NZD","date":"2025-03-04T19:00:00-05:00","impact":"Low","forecast":"","previous":"1.8%"},{"title":"GDP q\\/q","country":"AUD","date":"2025-03-04T19:30:00-05:00","impact":"High","forecast":"0.5%","previous":"0.3%"},{"title":"BOJ Gov Ueda Speaks","country":"JPY","date":"2025-03-04T19:30:00-05:00","impact":"Medium","forecast":"","previous":""},{"title":"Caixin Services PMI","country":"CNY","date":"2025-03-04T20:45:00-05:00","impact":"Low","forecast":"50.8","previous":"51.0"},{"title":"President Trump Speaks","country":"USD","date":"2025-03-04T21:00:00-05:00","impact":"High","forecast":"","previous":""},{"title":"CPI m\\/m","country":"CHF","date":"2025-03-05T02:30:00-05:00","impact":"High","forecast":"0.5%","previous":"-0.1%"},{"title":"French Industrial Production m\\/m","country":"EUR","date":"2025-03-05T02:45:00-05:00","impact":"Low","forecast":"0.6%","previous":"-0.4%"},{"title":"Spanish Services PMI","country":"EUR","date":"2025-03-05T03:15:00-05:00","impact":"Low","forecast":"55.4","previous":"54.9"},{"title":"Italian Services PMI","country":"EUR","date":"2025-03-05T03:45:00-05:00","impact":"Low","forecast":"50.9","previous":"50.4"},{"title":"French Final Services PMI","country":"EUR","date":"2025-03-05T03:50:00-05:00","impact":"Low","forecast":"44.6","previous":"44.5"},{"title":"German Final Services PMI","country":"EUR","date":"2025-03-05T03:55:00-05:00","impact":"Low","forecast":"52.2","previous":"52.2"},{"title":"Final Services PMI","country":"EUR","date":"2025-03-05T04:00:00-05:00","impact":"Low","forecast":"50.7","previous":"50.7"},{"title":"Final Services PMI","country":"GBP","date":"2025-03-05T04:30:00-05:00","impact":"Low","forecast":"51.1","previous":"51.1"},{"title":"PPI m\\/m","country":"EUR","date":"2025-03-05T05:00:00-05:00","impact":"Low","forecast":"0.3%","previous":"0.4%"},{"title":"Italian Retail Sales m\\/m","country":"EUR","date":"2025-03-05T05:00:00-05:00","impact":"Low","forecast":"0.3%","previous":"0.6%"},{"title":"ADP Non-Farm Employment Change","country":"USD","date":"2025-03-05T08:15:00-05:00","impact":"High","forecast":"144K","previous":"183K"},{"title":"Labor Productivity q\\/q","country":"CAD","date":"2025-03-05T08:30:00-05:00","impact":"Low","forecast":"0.3%","previous":"-0.4%"},{"title":"Monetary Policy Report Hearings","country":"GBP","date":"2025-03-05T09:30:00-05:00","impact":"Medium","forecast":"","previous":""},{"title":"Final Services PMI","country":"USD","date":"2025-03-05T09:45:00-05:00","impact":"Medium","forecast":"49.7","previous":"49.7"},{"title":"ISM Services PMI","country":"USD","date":"2025-03-05T10:00:00-05:00","impact":"High","forecast":"53.0","previous":"52.8"},{"title":"Factory Orders m\\/m","country":"USD","date":"2025-03-05T10:00:00-05:00","impact":"Low","forecast":"1.5%","previous":"-0.9%"},{"title":"Crude Oil Inventories","country":"USD","date":"2025-03-05T10:30:00-05:00","impact":"Low","forecast":"","previous":"-2.3M"},{"title":"Beige Book","country":"USD","date":"2025-03-05T14:00:00-05:00","impact":"Low","forecast":"","previous":""},{"title":"RBNZ Gov Orr Speaks","country":"NZD","date":"2025-03-05T15:30:00-05:00","impact":"Medium","forecast":"","previous":""},{"title":"Building Approvals m\\/m","country":"AUD","date":"2025-03-05T19:30:00-05:00","impact":"Low","forecast":"-0.1%","previous":"0.7%"},{"title":"Goods Trade Balance","country":"AUD","date":"2025-03-05T19:30:00-05:00","impact":"Low","forecast":"5.68B","previous":"5.09B"},{"title":"30-y Bond Auction","country":"JPY","date":"2025-03-05T22:35:00-05:00","impact":"Low","forecast":"","previous":"2.29|3.7"},{"title":"Unemployment Rate","country":"CHF","date":"2025-03-06T01:45:00-05:00","impact":"Low","forecast":"2.7%","previous":"2.7%"},{"title":"Construction PMI","country":"GBP","date":"2025-03-06T04:30:00-05:00","impact":"Medium","forecast":"49.8","previous":"48.1"},{"title":"Retail Sales m\\/m","country":"EUR","date":"2025-03-06T05:00:00-05:00","impact":"Low","forecast":"0.1%","previous":"-0.2%"},{"title":"Spanish 10-y Bond Auction","country":"EUR","date":"2025-03-06T05:03:00-05:00","impact":"Low","forecast":"","previous":"2.74|2.6"},{"title":"French 10-y Bond Auction","country":"EUR","date":"2025-03-06T05:18:00-05:00","impact":"Low","forecast":"","previous":"3.15|2.2"},{"title":"Euro Summit","country":"EUR","date":"2025-03-06T06:15:00-05:00","impact":"High","forecast":"","previous":""},{"title":"Challenger Job Cuts y\\/y","country":"USD","date":"2025-03-06T07:30:00-05:00","impact":"Low","forecast":"","previous":"-39.5%"},{"title":"Main Refinancing Rate","country":"EUR","date":"2025-03-06T08:15:00-05:00","impact":"High","forecast":"2.65%","previous":"2.90%"},{"title":"Monetary Policy Statement","country":"EUR","date":"2025-03-06T08:15:00-05:00","impact":"High","forecast":"","previous":""},{"title":"Trade Balance","country":"CAD","date":"2025-03-06T08:30:00-05:00","impact":"Low","forecast":"1.4B","previous":"0.7B"},{"title":"Unemployment Claims","country":"USD","date":"2025-03-06T08:30:00-05:00","impact":"High","forecast":"236K","previous":"242K"},{"title":"Revised Nonfarm Productivity q\\/q","country":"USD","date":"2025-03-06T08:30:00-05:00","impact":"Low","forecast":"1.2%","previous":"1.2%"},{"title":"Revised Unit Labor Costs q\\/q","country":"USD","date":"2025-03-06T08:30:00-05:00","impact":"Low","forecast":"3.0%","previous":"3.0%"},{"title":"Trade Balance","country":"USD","date":"2025-03-06T08:30:00-05:00","impact":"Low","forecast":"-93.1B","previous":"-98.4B"},{"title":"ECB Press Conference","country":"EUR","date":"2025-03-06T08:45:00-05:00","impact":"High","forecast":"","previous":""},{"title":"FOMC Member Harker Speaks","country":"USD","date":"2025-03-06T08:45:00-05:00","impact":"Low","forecast":"","previous":""},{"title":"Ivey PMI","country":"CAD","date":"2025-03-06T10:00:00-05:00","impact":"Medium","forecast":"50.6","previous":"47.1"},{"title":"Final Wholesale Inventories m\\/m","country":"USD","date":"2025-03-06T10:00:00-05:00","impact":"Low","forecast":"0.7%","previous":"0.7%"},{"title":"Natural Gas Storage","country":"USD","date":"2025-03-06T10:30:00-05:00","impact":"Low","forecast":"","previous":"-261B"},{"title":"FOMC Member Waller Speaks","country":"USD","date":"2025-03-06T15:30:00-05:00","impact":"Medium","forecast":"","previous":""},{"title":"FOMC Member Bostic Speaks","country":"USD","date":"2025-03-06T19:00:00-05:00","impact":"Low","forecast":"","previous":""},{"title":"Trade Balance","country":"CNY","date":"2025-03-06T22:03:00-05:00","impact":"Low","forecast":"","previous":"753B"},{"title":"USD-Denominated Trade Balance","country":"CNY","date":"2025-03-06T22:04:00-05:00","impact":"Low","forecast":"","previous":"104.8B"},{"title":"German Factory Orders m\\/m","country":"EUR","date":"2025-03-07T02:00:00-05:00","impact":"Low","forecast":"-2.4%","previous":"6.9%"},{"title":"Halifax HPI m\\/m","country":"GBP","date":"2025-03-07T02:00:00-05:00","impact":"Low","forecast":"0.5%","previous":"0.7%"},{"title":"French Trade Balance","country":"EUR","date":"2025-03-07T02:45:00-05:00","impact":"Low","forecast":"-4.1B","previous":"-3.9B"},{"title":"Foreign Currency Reserves","country":"CHF","date":"2025-03-07T03:00:00-05:00","impact":"Low","forecast":"","previous":"736B"},{"title":"ECB President Lagarde Speaks","country":"EUR","date":"2025-03-07T04:30:00-05:00","impact":"Medium","forecast":"","previous":""},{"title":"Final Employment Change q\\/q","country":"EUR","date":"2025-03-07T05:00:00-05:00","impact":"Low","forecast":"0.1%","previous":"0.1%"},{"title":"Revised GDP q\\/q","country":"EUR","date":"2025-03-07T05:00:00-05:00","impact":"Low","forecast":"0.1%","previous":"0.1%"},{"title":"Employment Change","country":"CAD","date":"2025-03-07T08:30:00-05:00","impact":"High","forecast":"17.8K","previous":"76.0K"},{"title":"Unemployment Rate","country":"CAD","date":"2025-03-07T08:30:00-05:00","impact":"High","forecast":"6.7%","previous":"6.6%"},{"title":"Capacity Utilization Rate","country":"CAD","date":"2025-03-07T08:30:00-05:00","impact":"Low","forecast":"79.0%","previous":"79.3%"},{"title":"Average Hourly Earnings m\\/m","country":"USD","date":"2025-03-07T08:30:00-05:00","impact":"High","forecast":"0.3%","previous":"0.5%"},{"title":"Non-Farm Employment Change","country":"USD","date":"2025-03-07T08:30:00-05:00","impact":"High","forecast":"156K","previous":"143K"},{"title":"Unemployment Rate","country":"USD","date":"2025-03-07T08:30:00-05:00","impact":"High","forecast":"4.0%","previous":"4.0%"},{"title":"FOMC Member Bowman Speaks","country":"USD","date":"2025-03-07T10:15:00-05:00","impact":"Low","forecast":"","previous":""},{"title":"FOMC Member Williams Speaks","country":"USD","date":"2025-03-07T10:45:00-05:00","impact":"Low","forecast":"","previous":""},{"title":"FOMC Member Kugler Speaks","country":"USD","date":"2025-03-07T12:20:00-05:00","impact":"Low","forecast":"","previous":""},{"title":"Fed Chair Powell Speaks","country":"USD","date":"2025-03-07T12:30:00-05:00","impact":"High","forecast":"","previous":""},{"title":"FOMC Member Kugler Speaks","country":"USD","date":"2025-03-07T13:00:00-05:00","impact":"Low","forecast":"","previous":""},{"title":"Consumer Credit m\\/m","country":"USD","date":"2025-03-07T15:00:00-05:00","impact":"Low","forecast":"14.0B","previous":"40.8B"},{"title":"MPC Member Mann Speaks","country":"GBP","date":"2025-03-07T15:15:00-05:00","impact":"Low","forecast":"","previous":""},{"title":"CPI y\\/y","country":"CNY","date":"2025-03-08T20:30:00-05:00","impact":"Medium","forecast":"","previous":"0.5%"},{"title":"PPI y\\/y","country":"CNY","date":"2025-03-08T20:30:00-05:00","impact":"Medium","forecast":"","previous":"-2.3%"}]
\.


--
-- TOC entry 3381 (class 0 OID 16389)
-- Dependencies: 217
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, user_id, product_id, "timestamp", status, slip) FROM stdin;
1	10000	1	1740068359612	\N	1740068359608-slip.webp
2	10001	2	1740068521970	1	1740068521967-slip.webp
3	10001	1	1740068769696	1	1740068769693-slip.webp
4	10008	1	1740107776286	1	1740107776258-slip.webp
5	10001	1	1740535098043	1	1740535098038-slip.webp
6	10009	1	1740539351843	1	1740539351838-slip.webp
7	10001	1	1740909175829	0	1740909175825-slip.webp
8	10001	1	1740909241544	0	1740909241541-slip.webp
9	10001	1	1740909407834	0	1740909407832-slip.webp
10	10001	3	1740909526186	0	1740909526183-slip.webp
11	10001	3	1740909577873	0	1740909577871-slip.webp
12	10001	2	1740909594302	0	1740909594299-slip.webp
13	10001	3	1740909787023	0	1740909787019-slip.webp
14	10001	1	1740909965447	0	1740909965443-slip.webp
\.


--
-- TOC entry 3383 (class 0 OID 16396)
-- Dependencies: 219
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, days, name, detail, price) FROM stdin;
2	105	Standard	แพ็กเกจพื้นฐาน 3 เดือนสำหรับมือใหม่ 15 วัน.	1200
3	215	Premium	แพ็กเกจพื้นฐาน 6 เดือนสำหรับมือใหม่ 35 วัน.	2400
1	30	Basic	แพ็กเกจพื้นฐาน 1 เดือนสำหรับมือใหม่	399
\.


--
-- TOC entry 3385 (class 0 OID 16402)
-- Dependencies: 221
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, username, password, email, phone_number, total_days, role) FROM stdin;
10000	play2	123456	play2@gmail.com	0956975152	0	0
10002	test1	123456	test1@gmail.com	123456	0	0
10003	test02	123456	sdfslkdafj	asfasfaf	0	0
10004	kodlor	123456	kodlor	123456	0	0
10005	google	123456	google	123456	0	0
10006	hologram	123456	holo@gmail.com	123456	0	0
10007	test03	123456	test	123456	0	0
10008	hahaha	123456	hahaha	123456	28	0
10001	admin	123456	admin@gmail.com	111	163	1
10009	admin2	123456	admin2	097849564	30	0
\.


--
-- TOC entry 3395 (class 0 OID 0)
-- Dependencies: 224
-- Name: forex_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.forex_id_seq', 1, true);


--
-- TOC entry 3396 (class 0 OID 0)
-- Dependencies: 218
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 14, true);


--
-- TOC entry 3397 (class 0 OID 0)
-- Dependencies: 220
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 3, true);


--
-- TOC entry 3398 (class 0 OID 0)
-- Dependencies: 222
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 10009, true);


--
-- TOC entry 3235 (class 2606 OID 16422)
-- Name: forex forex_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forex
    ADD CONSTRAINT forex_pkey PRIMARY KEY (id);


--
-- TOC entry 3229 (class 2606 OID 16411)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- TOC entry 3231 (class 2606 OID 16413)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- TOC entry 3233 (class 2606 OID 16415)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


-- Completed on 2025-03-05 21:43:04

--
-- PostgreSQL database dump complete
--

