--
-- PostgreSQL database dump
--

-- Dumped from database version 15.13
-- Dumped by pg_dump version 15.13

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
-- Name: oecd_productivity; Type: TABLE; Schema: public; Owner: oecd_user
--

CREATE TABLE public.oecd_productivity (
    id integer NOT NULL,
    country_code character varying(3),
    country_name character varying(100),
    industry_code character varying(20),
    industry_name character varying(200),
    year integer,
    measure character varying(50),
    value numeric(10,2),
    unit character varying(50),
    transformation character varying(50),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.oecd_productivity OWNER TO oecd_user;

--
-- Name: oecd_productivity_id_seq; Type: SEQUENCE; Schema: public; Owner: oecd_user
--

CREATE SEQUENCE public.oecd_productivity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oecd_productivity_id_seq OWNER TO oecd_user;

--
-- Name: oecd_productivity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oecd_user
--

ALTER SEQUENCE public.oecd_productivity_id_seq OWNED BY public.oecd_productivity.id;


--
-- Name: oecd_productivity id; Type: DEFAULT; Schema: public; Owner: oecd_user
--

ALTER TABLE ONLY public.oecd_productivity ALTER COLUMN id SET DEFAULT nextval('public.oecd_productivity_id_seq'::regclass);


--
-- Data for Name: oecd_productivity; Type: TABLE DATA; Schema: public; Owner: oecd_user
--

COPY public.oecd_productivity (id, country_code, country_name, industry_code, industry_name, year, measure, value, unit, transformation, created_at) FROM stdin;
1	PRT	Portugal	B_D_E	Mining and quarrying; Energy, water supply and waste management services	2023	GVAHRS	93.21	IX	_Z	2025-05-26 19:47:29.575039
2	CZE	Czechia	BTNXL	Business economy excluding real estate	2023	GVAHRS	118.49	IX	_Z	2025-05-26 19:47:29.575039
3	NLD	Netherlands	F	Construction	2023	GVAHRS	-0.31	PA	GY	2025-05-26 19:47:29.575039
4	PRT	Portugal	ATU	All ISIC activities	2023	GVAHRS	0.61	PA	GY	2025-05-26 19:47:29.575039
5	AUT	Austria	F	Construction	2023	GVAHRS	76.25	IX	_Z	2025-05-26 19:47:29.575039
6	DNK	Denmark	B_D_E	Mining and quarrying; Energy, water supply and waste management services	2023	GVAHRS	3.70	PA	GY	2025-05-26 19:47:29.575039
7	NLD	Netherlands	BTNXL	Business economy excluding real estate	2023	GVAHRS	104.74	IX	_Z	2025-05-26 19:47:29.575039
8	IRL	Ireland	F	Construction	2023	GVAHRS	79.55	IX	_Z	2025-05-26 19:47:29.575039
9	SVK	Slovak Republic	A	Agriculture, forestry and fishing	2023	GVAHRS	128.91	IX	_Z	2025-05-26 19:47:29.575039
10	EST	Estonia	A	Agriculture, forestry and fishing	2023	GVAHRS	-2.73	PA	GY	2025-05-26 19:47:29.575039
11	GRC	Greece	GTI	Wholesale and retail trade; repair of motor vehicles and motorcycles; transportation and storage; accommodation and food service activities	2023	GVAHRS	83.95	IX	_Z	2025-05-26 19:47:29.575039
12	HRV	Croatia	C	Manufacturing	2023	GVAHRS	0.38	PA	GY	2025-05-26 19:47:29.575039
13	NLD	Netherlands	GTI	Wholesale and retail trade; repair of motor vehicles and motorcycles; transportation and storage; accommodation and food service activities	2023	GVAHRS	-2.73	PA	GY	2025-05-26 19:47:29.575039
14	NLD	Netherlands	K	Financial and insurance activities	2023	GVAHRS	-3.14	PA	GY	2025-05-26 19:47:29.575039
15	ROU	Romania	C	Manufacturing	2023	GVAHRS	-3.48	PA	GY	2025-05-26 19:47:29.575039
16	SVK	Slovak Republic	M_N	Professional, scientific and technical activities; administrative and support service activities	2023	GVAHRS	-13.83	PA	GY	2025-05-26 19:47:29.575039
17	FIN	Finland	M_N	Professional, scientific and technical activities; administrative and support service activities	2023	GVAHRS	0.37	PA	GY	2025-05-26 19:47:29.575039
18	HUN	Hungary	A	Agriculture, forestry and fishing	2023	GVAHRS	81.80	PA	GY	2025-05-26 19:47:29.575039
19	BGR	Bulgaria	A	Agriculture, forestry and fishing	2023	GVAHRS	180.80	IX	_Z	2025-05-26 19:47:29.575039
20	CAN	Canada	ATU	All ISIC activities	2023	GVAHRS	103.62	IX	_Z	2025-05-26 19:47:29.575039
21	GBR	United Kingdom	GTI	Wholesale and retail trade; repair of motor vehicles and motorcycles; transportation and storage; accommodation and food service activities	2023	GVAHRS	98.56	IX	_Z	2025-05-26 19:47:29.575039
22	IRL	Ireland	K	Financial and insurance activities	2023	GVAHRS	85.26	IX	_Z	2025-05-26 19:47:29.575039
23	NLD	Netherlands	ATU	All ISIC activities	2023	GVAHRS	102.16	IX	_Z	2025-05-26 19:47:29.575039
24	BGR	Bulgaria	J	Information and communication	2023	GVAHRS	-4.88	PA	GY	2025-05-26 19:47:29.575039
25	CRI	Costa Rica	M_N	Professional, scientific and technical activities; administrative and support service activities	2023	GVAHRS	146.51	IX	_Z	2025-05-26 19:47:29.575039
26	CZE	Czechia	ATU	All ISIC activities	2023	GVAHRS	-0.29	PA	GY	2025-05-26 19:47:29.575039
27	GBR	United Kingdom	F	Construction	2023	GVAHRS	108.58	IX	_Z	2025-05-26 19:47:29.575039
28	LTU	Lithuania	J	Information and communication	2023	GVAHRS	8.26	PA	GY	2025-05-26 19:47:29.575039
29	LUX	Luxembourg	F	Construction	2023	GVAHRS	-5.25	PA	GY	2025-05-26 19:47:29.575039
30	LUX	Luxembourg	K	Financial and insurance activities	2023	GVAHRS	-9.42	PA	GY	2025-05-26 19:47:29.575039
31	LVA	Latvia	J	Information and communication	2023	GVAHRS	122.01	IX	_Z	2025-05-26 19:47:29.575039
32	SWE	Sweden	F	Construction	2023	GVAHRS	99.24	IX	_Z	2025-05-26 19:47:29.575039
33	SWE	Sweden	GTI	Wholesale and retail trade; repair of motor vehicles and motorcycles; transportation and storage; accommodation and food service activities	2023	GVAHRS	104.65	IX	_Z	2025-05-26 19:47:29.575039
34	SWE	Sweden	K	Financial and insurance activities	2023	GVAHRS	103.55	IX	_Z	2025-05-26 19:47:29.575039
35	CAN	Canada	GTI	Wholesale and retail trade; repair of motor vehicles and motorcycles; transportation and storage; accommodation and food service activities	2023	GVAHRS	0.14	PA	GY	2025-05-26 19:47:29.575039
36	CRI	Costa Rica	ATU	All ISIC activities	2023	GVAHRS	6.86	PA	GY	2025-05-26 19:47:29.575039
37	DEU	Germany	BTE	Industry (except construction)	2023	GVAHRS	-0.29	PA	GY	2025-05-26 19:47:29.575039
38	DNK	Denmark	A	Agriculture, forestry and fishing	2023	GVAHRS	124.84	IX	_Z	2025-05-26 19:47:29.575039
39	GBR	United Kingdom	C	Manufacturing	2023	GVAHRS	109.88	IX	_Z	2025-05-26 19:47:29.575039
40	HUN	Hungary	C	Manufacturing	2023	GVAHRS	-3.03	PA	GY	2025-05-26 19:47:29.575039
41	FRA	France	C	Manufacturing	2023	GVAHRS	1.48	PA	GY	2025-05-26 19:47:29.575039
42	ITA	Italy	J	Information and communication	2023	GVAHRS	103.46	IX	_Z	2025-05-26 19:47:29.575039
43	BEL	Belgium	J	Information and communication	2023	GVAHRS	0.27	PA	GY	2025-05-26 19:47:29.575039
44	CAN	Canada	F	Construction	2023	GVAHRS	-4.91	PA	GY	2025-05-26 19:47:29.575039
45	GRC	Greece	F	Construction	2023	GVAHRS	114.15	IX	_Z	2025-05-26 19:47:29.575039
46	HRV	Croatia	ATU	All ISIC activities	2023	GVAHRS	110.94	IX	_Z	2025-05-26 19:47:29.575039
47	MEX	Mexico	F	Construction	2023	GVAHRS	90.66	IX	_Z	2025-05-26 19:47:29.575039
48	MEX	Mexico	GTI	Wholesale and retail trade; repair of motor vehicles and motorcycles; transportation and storage; accommodation and food service activities	2023	GVAHRS	96.24	IX	_Z	2025-05-26 19:47:29.575039
49	MEX	Mexico	J	Information and communication	2023	GVAHRS	7.79	PA	GY	2025-05-26 19:47:29.575039
50	NOR	Norway	ATU	All ISIC activities	2023	GVAHRS	-0.15	PA	GY	2025-05-26 19:47:29.575039
51	ITA	Italy	M_N	Professional, scientific and technical activities; administrative and support service activities	2023	GVAHRS	107.68	IX	_Z	2025-05-26 19:47:29.575039
52	AUT	Austria	GTI	Wholesale and retail trade; repair of motor vehicles and motorcycles; transportation and storage; accommodation and food service activities	2023	GVAHRS	100.71	IX	_Z	2025-05-26 19:47:29.575039
53	SVK	Slovak Republic	C	Manufacturing	2023	GVAHRS	125.53	IX	_Z	2025-05-26 19:47:29.575039
54	BEL	Belgium	A	Agriculture, forestry and fishing	2023	GVAHRS	84.93	IX	_Z	2025-05-26 19:47:29.575039
55	CAN	Canada	A	Agriculture, forestry and fishing	2023	GVAHRS	-1.75	PA	GY	2025-05-26 19:47:29.575039
56	CAN	Canada	C	Manufacturing	2023	GVAHRS	-3.57	PA	GY	2025-05-26 19:47:29.575039
57	CRI	Costa Rica	J	Information and communication	2023	GVAHRS	103.05	IX	_Z	2025-05-26 19:47:29.575039
58	ISL	Iceland	K	Financial and insurance activities	2023	GVAHRS	162.74	IX	_Z	2025-05-26 19:47:29.575039
59	MEX	Mexico	A	Agriculture, forestry and fishing	2023	GVAHRS	111.96	IX	_Z	2025-05-26 19:47:29.575039
60	MEX	Mexico	C	Manufacturing	2023	GVAHRS	93.70	IX	_Z	2025-05-26 19:47:29.575039
61	NLD	Netherlands	C	Manufacturing	2023	GVAHRS	-2.93	PA	GY	2025-05-26 19:47:29.575039
62	BEL	Belgium	C	Manufacturing	2023	GVAHRS	100.61	IX	_Z	2025-05-26 19:47:29.575039
63	ITA	Italy	BTE	Industry (except construction)	2023	GVAHRS	-3.06	PA	GY	2025-05-26 19:47:29.575039
64	POL	Poland	BTE	Industry (except construction)	2023	GVAHRS	121.72	IX	_Z	2025-05-26 19:47:29.575039
65	CZE	Czechia	GTI	Wholesale and retail trade; repair of motor vehicles and motorcycles; transportation and storage; accommodation and food service activities	2023	GVAHRS	118.88	IX	_Z	2025-05-26 19:47:29.575039
66	ESP	Spain	C	Manufacturing	2023	GVAHRS	0.61	PA	GY	2025-05-26 19:47:29.575039
67	ESP	Spain	M_N	Professional, scientific and technical activities; administrative and support service activities	2023	GVAHRS	118.81	IX	_Z	2025-05-26 19:47:29.575039
68	GBR	United Kingdom	A	Agriculture, forestry and fishing	2023	GVAHRS	111.45	IX	_Z	2025-05-26 19:47:29.575039
69	BGR	Bulgaria	BTE	Industry (except construction)	2023	GVAHRS	122.15	IX	_Z	2025-05-26 19:47:29.575039
70	BGR	Bulgaria	K	Financial and insurance activities	2023	GVAHRS	162.35	IX	_Z	2025-05-26 19:47:29.575039
71	CZE	Czechia	K	Financial and insurance activities	2023	GVAHRS	171.45	IX	_Z	2025-05-26 19:47:29.575039
72	FRA	France	GTI	Wholesale and retail trade; repair of motor vehicles and motorcycles; transportation and storage; accommodation and food service activities	2023	GVAHRS	-1.52	PA	GY	2025-05-26 19:47:29.575039
73	NOR	Norway	K	Financial and insurance activities	2023	GVAHRS	108.73	IX	_Z	2025-05-26 19:47:29.575039
74	POL	Poland	C	Manufacturing	2023	GVAHRS	123.72	IX	_Z	2025-05-26 19:47:29.575039
75	PRT	Portugal	J	Information and communication	2023	GVAHRS	91.13	IX	_Z	2025-05-26 19:47:29.575039
76	SVN	Slovenia	ATU	All ISIC activities	2023	GVAHRS	117.91	IX	_Z	2025-05-26 19:47:29.575039
77	DEU	Germany	C	Manufacturing	2023	GVAHRS	1.36	PA	GY	2025-05-26 19:47:29.575039
78	DEU	Germany	M_N	Professional, scientific and technical activities; administrative and support service activities	2023	GVAHRS	114.52	IX	_Z	2025-05-26 19:47:29.575039
79	EST	Estonia	BTE	Industry (except construction)	2023	GVAHRS	-8.46	PA	GY	2025-05-26 19:47:29.575039
80	FRA	France	ATU	All ISIC activities	2023	GVAHRS	100.41	IX	_Z	2025-05-26 19:47:29.575039
81	GRC	Greece	ATU	All ISIC activities	2023	GVAHRS	0.37	PA	GY	2025-05-26 19:47:29.575039
82	IRL	Ireland	A	Agriculture, forestry and fishing	2023	GVAHRS	198.05	IX	_Z	2025-05-26 19:47:29.575039
83	AUT	Austria	A	Agriculture, forestry and fishing	2023	GVAHRS	129.91	IX	_Z	2025-05-26 19:47:29.575039
84	DEU	Germany	J	Information and communication	2023	GVAHRS	109.72	IX	_Z	2025-05-26 19:47:29.575039
85	ROU	Romania	ATU	All ISIC activities	2023	GVAHRS	129.12	IX	_Z	2025-05-26 19:47:29.575039
86	SVN	Slovenia	J	Information and communication	2023	GVAHRS	1.83	PA	GY	2025-05-26 19:47:29.575039
87	AUT	Austria	M_N	Professional, scientific and technical activities; administrative and support service activities	2023	GVAHRS	-1.13	PA	GY	2025-05-26 19:47:29.575039
88	FIN	Finland	BTE	Industry (except construction)	2023	GVAHRS	105.47	IX	_Z	2025-05-26 19:47:29.575039
89	HUN	Hungary	ATU	All ISIC activities	2023	GVAHRS	118.44	IX	_Z	2025-05-26 19:47:29.575039
90	IRL	Ireland	M_N	Professional, scientific and technical activities; administrative and support service activities	2023	GVAHRS	-2.27	PA	GY	2025-05-26 19:47:29.575039
91	GBR	United Kingdom	K	Financial and insurance activities	2023	GVAHRS	102.56	IX	_Z	2025-05-26 19:47:29.575039
92	GRC	Greece	K	Financial and insurance activities	2023	GVAHRS	118.15	IX	_Z	2025-05-26 19:47:29.575039
93	IRL	Ireland	GTI	Wholesale and retail trade; repair of motor vehicles and motorcycles; transportation and storage; accommodation and food service activities	2023	GVAHRS	106.55	IX	_Z	2025-05-26 19:47:29.575039
94	LTU	Lithuania	A	Agriculture, forestry and fishing	2023	GVAHRS	168.60	IX	_Z	2025-05-26 19:47:29.575039
95	POL	Poland	A	Agriculture, forestry and fishing	2023	GVAHRS	135.57	IX	_Z	2025-05-26 19:47:29.575039
96	POL	Poland	ATU	All ISIC activities	2023	GVAHRS	123.76	IX	_Z	2025-05-26 19:47:29.575039
97	ESP	Spain	A	Agriculture, forestry and fishing	2023	GVAHRS	8.13	PA	GY	2025-05-26 19:47:29.575039
98	EST	Estonia	M_N	Professional, scientific and technical activities; administrative and support service activities	2023	GVAHRS	134.70	IX	_Z	2025-05-26 19:47:29.575039
99	POL	Poland	M_N	Professional, scientific and technical activities; administrative and support service activities	2023	GVAHRS	0.96	PA	GY	2025-05-26 19:47:29.575039
100	CRI	Costa Rica	A	Agriculture, forestry and fishing	2023	GVAHRS	-1.46	PA	GY	2025-05-26 19:47:29.575039
101	FIN	Finland	C	Manufacturing	2023	GVAHRS	103.99	IX	_Z	2025-05-26 19:47:29.575039
102	CAN	Canada	K	Financial and insurance activities	2023	GVAHRS	-3.64	PA	GY	2025-05-26 19:47:29.575039
103	DEU	Germany	A	Agriculture, forestry and fishing	2023	GVAHRS	1.81	PA	GY	2025-05-26 19:47:29.575039
104	MEX	Mexico	K	Financial and insurance activities	2023	GVAHRS	120.21	IX	_Z	2025-05-26 19:47:29.575039
105	POL	Poland	GTI	Wholesale and retail trade; repair of motor vehicles and motorcycles; transportation and storage; accommodation and food service activities	2023	GVAHRS	1.90	PA	GY	2025-05-26 19:47:29.575039
106	BGR	Bulgaria	C	Manufacturing	2023	GVAHRS	134.50	IX	_Z	2025-05-26 19:47:29.575039
107	DNK	Denmark	ATU	All ISIC activities	2023	GVAHRS	109.09	IX	_Z	2025-05-26 19:47:29.575039
108	ISL	Iceland	M_N	Professional, scientific and technical activities; administrative and support service activities	2023	GVAHRS	100.62	IX	_Z	2025-05-26 19:47:29.575039
109	POL	Poland	F	Construction	2023	GVAHRS	5.40	PA	GY	2025-05-26 19:47:29.575039
110	SVK	Slovak Republic	BTE	Industry (except construction)	2023	GVAHRS	120.61	IX	_Z	2025-05-26 19:47:29.575039
111	BGR	Bulgaria	M_N	Professional, scientific and technical activities; administrative and support service activities	2023	GVAHRS	0.34	PA	GY	2025-05-26 19:47:29.575039
112	KOR	Korea	ATU	All ISIC activities	2023	GVAHRS	2.30	PA	GY	2025-05-26 19:47:29.575039
113	LUX	Luxembourg	C	Manufacturing	2023	GVAHRS	4.63	PA	GY	2025-05-26 19:47:29.575039
114	LVA	Latvia	BTE	Industry (except construction)	2023	GVAHRS	2.88	PA	GY	2025-05-26 19:47:29.575039
115	NOR	Norway	C	Manufacturing	2023	GVAHRS	101.02	IX	_Z	2025-05-26 19:47:29.575039
116	FRA	France	F	Construction	2023	GVAHRS	1.85	PA	GY	2025-05-26 19:47:29.575039
117	LVA	Latvia	GTI	Wholesale and retail trade; repair of motor vehicles and motorcycles; transportation and storage; accommodation and food service activities	2023	GVAHRS	132.86	IX	_Z	2025-05-26 19:47:29.575039
118	CAN	Canada	BTE	Industry (except construction)	2023	GVAHRS	100.98	IX	_Z	2025-05-26 19:47:29.575039
119	ESP	Spain	BTE	Industry (except construction)	2023	GVAHRS	-0.59	PA	GY	2025-05-26 19:47:29.575039
120	GBR	United Kingdom	ATU	All ISIC activities	2023	GVAHRS	0.00	PA	GY	2025-05-26 19:47:29.575039
121	IRL	Ireland	C	Manufacturing	2023	GVAHRS	130.84	IX	_Z	2025-05-26 19:47:29.575039
122	ISL	Iceland	J	Information and communication	2023	GVAHRS	10.07	PA	GY	2025-05-26 19:47:29.575039
123	LVA	Latvia	M_N	Professional, scientific and technical activities; administrative and support service activities	2023	GVAHRS	135.44	IX	_Z	2025-05-26 19:47:29.575039
124	ROU	Romania	F	Construction	2023	GVAHRS	7.84	PA	GY	2025-05-26 19:47:29.575039
125	AUT	Austria	K	Financial and insurance activities	2023	GVAHRS	132.56	IX	_Z	2025-05-26 19:47:29.575039
126	FIN	Finland	A	Agriculture, forestry and fishing	2023	GVAHRS	112.83	IX	_Z	2025-05-26 19:47:29.575039
127	HRV	Croatia	F	Construction	2023	GVAHRS	0.76	PA	GY	2025-05-26 19:47:29.575039
128	HRV	Croatia	GTI	Wholesale and retail trade; repair of motor vehicles and motorcycles; transportation and storage; accommodation and food service activities	2023	GVAHRS	0.47	PA	GY	2025-05-26 19:47:29.575039
129	ISL	Iceland	F	Construction	2023	GVAHRS	101.37	IX	_Z	2025-05-26 19:47:29.575039
130	ISL	Iceland	GTI	Wholesale and retail trade; repair of motor vehicles and motorcycles; transportation and storage; accommodation and food service activities	2023	GVAHRS	115.57	IX	_Z	2025-05-26 19:47:29.575039
131	ROU	Romania	GTI	Wholesale and retail trade; repair of motor vehicles and motorcycles; transportation and storage; accommodation and food service activities	2023	GVAHRS	0.61	PA	GY	2025-05-26 19:47:29.575039
132	FRA	France	BTE	Industry (except construction)	2023	GVAHRS	98.83	IX	_Z	2025-05-26 19:47:29.575039
133	GRC	Greece	J	Information and communication	2023	GVAHRS	102.42	IX	_Z	2025-05-26 19:47:29.575039
134	HUN	Hungary	ATU	All ISIC activities	2023	GVAHRS	1.12	PA	GY	2025-05-26 19:47:29.575039
135	IRL	Ireland	BTE	Industry (except construction)	2023	GVAHRS	130.36	IX	_Z	2025-05-26 19:47:29.575039
136	ISL	Iceland	BTE	Industry (except construction)	2023	GVAHRS	-2.11	PA	GY	2025-05-26 19:47:29.575039
137	ISL	Iceland	M_N	Professional, scientific and technical activities; administrative and support service activities	2023	GVAHRS	0.74	PA	GY	2025-05-26 19:47:29.575039
138	KOR	Korea	ATU	All ISIC activities	2023	GVAHRS	126.23	IX	_Z	2025-05-26 19:47:29.575039
139	CRI	Costa Rica	K	Financial and insurance activities	2023	GVAHRS	144.68	IX	_Z	2025-05-26 19:47:29.575039
140	HRV	Croatia	M_N	Professional, scientific and technical activities; administrative and support service activities	2023	GVAHRS	103.19	IX	_Z	2025-05-26 19:47:29.575039
141	ISL	Iceland	A	Agriculture, forestry and fishing	2023	GVAHRS	147.61	IX	_Z	2025-05-26 19:47:29.575039
142	SWE	Sweden	J	Information and communication	2023	GVAHRS	114.17	IX	_Z	2025-05-26 19:47:29.575039
143	AUT	Austria	M_N	Professional, scientific and technical activities; administrative and support service activities	2023	GVAHRS	110.16	IX	_Z	2025-05-26 19:47:29.575039
144	CRI	Costa Rica	F	Construction	2023	GVAHRS	96.32	IX	_Z	2025-05-26 19:47:29.575039
145	CZE	Czechia	C	Manufacturing	2023	GVAHRS	128.11	IX	_Z	2025-05-26 19:47:29.575039
146	ESP	Spain	GTI	Wholesale and retail trade; repair of motor vehicles and motorcycles; transportation and storage; accommodation and food service activities	2023	GVAHRS	1.10	PA	GY	2025-05-26 19:47:29.575039
147	FIN	Finland	F	Construction	2023	GVAHRS	-10.49	PA	GY	2025-05-26 19:47:29.575039
148	FIN	Finland	GTI	Wholesale and retail trade; repair of motor vehicles and motorcycles; transportation and storage; accommodation and food service activities	2023	GVAHRS	-2.47	PA	GY	2025-05-26 19:47:29.575039
149	HRV	Croatia	J	Information and communication	2023	GVAHRS	112.47	IX	_Z	2025-05-26 19:47:29.575039
150	NOR	Norway	J	Information and communication	2023	GVAHRS	-0.20	PA	GY	2025-05-26 19:47:29.575039
151	PRT	Portugal	C	Manufacturing	2023	GVAHRS	108.45	IX	_Z	2025-05-26 19:47:29.575039
152	CRI	Costa Rica	GTI	Wholesale and retail trade; repair of motor vehicles and motorcycles; transportation and storage; accommodation and food service activities	2023	GVAHRS	109.69	IX	_Z	2025-05-26 19:47:29.575039
153	DNK	Denmark	K	Financial and insurance activities	2023	GVAHRS	92.45	IX	_Z	2025-05-26 19:47:29.575039
154	LTU	Lithuania	ATU	All ISIC activities	2023	GVAHRS	117.13	IX	_Z	2025-05-26 19:47:29.575039
155	LUX	Luxembourg	M_N	Professional, scientific and technical activities; administrative and support service activities	2023	GVAHRS	109.52	IX	_Z	2025-05-26 19:47:29.575039
156	CAN	Canada	M_N	Professional, scientific and technical activities; administrative and support service activities	2023	GVAHRS	103.11	IX	_Z	2025-05-26 19:47:29.575039
157	DEU	Germany	K	Financial and insurance activities	2023	GVAHRS	-0.41	PA	GY	2025-05-26 19:47:29.575039
158	LVA	Latvia	A	Agriculture, forestry and fishing	2023	GVAHRS	-9.72	PA	GY	2025-05-26 19:47:29.575039
159	NLD	Netherlands	J	Information and communication	2023	GVAHRS	-1.85	PA	GY	2025-05-26 19:47:29.575039
160	CAN	Canada	A	Agriculture, forestry and fishing	2023	GVAHRS	117.23	IX	_Z	2025-05-26 19:47:29.575039
161	DEU	Germany	F	Construction	2023	GVAHRS	0.17	PA	GY	2025-05-26 19:47:29.575039
162	DEU	Germany	GTI	Wholesale and retail trade; repair of motor vehicles and motorcycles; transportation and storage; accommodation and food service activities	2023	GVAHRS	-1.72	PA	GY	2025-05-26 19:47:29.575039
163	PRT	Portugal	A	Agriculture, forestry and fishing	2023	GVAHRS	6.65	PA	GY	2025-05-26 19:47:29.575039
164	DNK	Denmark	GTI	Wholesale and retail trade; repair of motor vehicles and motorcycles; transportation and storage; accommodation and food service activities	2023	GVAHRS	1.62	PA	GY	2025-05-26 19:47:29.575039
165	LUX	Luxembourg	A	Agriculture, forestry and fishing	2023	GVAHRS	101.64	IX	_Z	2025-05-26 19:47:29.575039
166	POL	Poland	K	Financial and insurance activities	2023	GVAHRS	-8.41	PA	GY	2025-05-26 19:47:29.575039
167	SVK	Slovak Republic	GTI	Wholesale and retail trade; repair of motor vehicles and motorcycles; transportation and storage; accommodation and food service activities	2023	GVAHRS	123.55	IX	_Z	2025-05-26 19:47:29.575039
168	MEX	Mexico	GTI	Wholesale and retail trade; repair of motor vehicles and motorcycles; transportation and storage; accommodation and food service activities	2023	GVAHRS	1.63	PA	GY	2025-05-26 19:47:29.575039
169	NLD	Netherlands	C	Manufacturing	2023	GVAHRS	117.84	IX	_Z	2025-05-26 19:47:29.575039
170	AUT	Austria	J	Information and communication	2023	GVAHRS	118.89	IX	_Z	2025-05-26 19:47:29.575039
171	DNK	Denmark	C	Manufacturing	2023	GVAHRS	10.40	PA	GY	2025-05-26 19:47:29.575039
172	FIN	Finland	K	Financial and insurance activities	2023	GVAHRS	127.86	IX	_Z	2025-05-26 19:47:29.575039
173	IRL	Ireland	ATU	All ISIC activities	2023	GVAHRS	-7.18	PA	GY	2025-05-26 19:47:29.575039
174	ROU	Romania	J	Information and communication	2023	GVAHRS	216.88	IX	_Z	2025-05-26 19:47:29.575039
175	ESP	Spain	K	Financial and insurance activities	2023	GVAHRS	-0.01	PA	GY	2025-05-26 19:47:29.575039
176	ITA	Italy	F	Construction	2023	GVAHRS	117.85	IX	_Z	2025-05-26 19:47:29.575039
177	LUX	Luxembourg	J	Information and communication	2023	GVAHRS	6.98	PA	GY	2025-05-26 19:47:29.575039
178	MEX	Mexico	F	Construction	2023	GVAHRS	10.97	PA	GY	2025-05-26 19:47:29.575039
179	GRC	Greece	BTE	Industry (except construction)	2023	GVAHRS	1.15	PA	GY	2025-05-26 19:47:29.575039
180	LUX	Luxembourg	BTE	Industry (except construction)	2023	GVAHRS	100.21	IX	_Z	2025-05-26 19:47:29.575039
181	SVN	Slovenia	C	Manufacturing	2023	GVAHRS	1.45	PA	GY	2025-05-26 19:47:29.575039
182	SVN	Slovenia	K	Financial and insurance activities	2023	GVAHRS	154.00	IX	_Z	2025-05-26 19:47:29.575039
183	BEL	Belgium	M_N	Professional, scientific and technical activities; administrative and support service activities	2023	GVAHRS	110.68	IX	_Z	2025-05-26 19:47:29.575039
184	CZE	Czechia	J	Information and communication	2023	GVAHRS	4.55	PA	GY	2025-05-26 19:47:29.575039
185	DNK	Denmark	F	Construction	2023	GVAHRS	5.74	PA	GY	2025-05-26 19:47:29.575039
186	ITA	Italy	GTI	Wholesale and retail trade; repair of motor vehicles and motorcycles; transportation and storage; accommodation and food service activities	2023	GVAHRS	109.79	IX	_Z	2025-05-26 19:47:29.575039
187	LTU	Lithuania	ATU	All ISIC activities	2023	GVAHRS	-2.78	PA	GY	2025-05-26 19:47:29.575039
188	LVA	Latvia	ATU	All ISIC activities	2023	GVAHRS	118.95	IX	_Z	2025-05-26 19:47:29.575039
189	BGR	Bulgaria	ATU	All ISIC activities	2023	GVAHRS	-0.23	PA	GY	2025-05-26 19:47:29.575039
190	CAN	Canada	M_N	Professional, scientific and technical activities; administrative and support service activities	2023	GVAHRS	-0.52	PA	GY	2025-05-26 19:47:29.575039
191	FRA	France	ATU	All ISIC activities	2023	GVAHRS	0.69	PA	GY	2025-05-26 19:47:29.575039
192	MEX	Mexico	M_N	Professional, scientific and technical activities; administrative and support service activities	2023	GVAHRS	54.53	IX	_Z	2025-05-26 19:47:29.575039
193	BEL	Belgium	M_N	Professional, scientific and technical activities; administrative and support service activities	2023	GVAHRS	-1.92	PA	GY	2025-05-26 19:47:29.575039
194	EST	Estonia	C	Manufacturing	2023	GVAHRS	-1.23	PA	GY	2025-05-26 19:47:29.575039
195	HRV	Croatia	K	Financial and insurance activities	2023	GVAHRS	16.97	PA	GY	2025-05-26 19:47:29.575039
196	LVA	Latvia	ATU	All ISIC activities	2023	GVAHRS	2.65	PA	GY	2025-05-26 19:47:29.575039
197	DNK	Denmark	M_N	Professional, scientific and technical activities; administrative and support service activities	2023	GVAHRS	-2.82	PA	GY	2025-05-26 19:47:29.575039
198	PRT	Portugal	M_N	Professional, scientific and technical activities; administrative and support service activities	2023	GVAHRS	116.41	IX	_Z	2025-05-26 19:47:29.575039
199	SVK	Slovak Republic	J	Information and communication	2023	GVAHRS	-4.66	PA	GY	2025-05-26 19:47:29.575039
200	SWE	Sweden	C	Manufacturing	2023	GVAHRS	117.29	IX	_Z	2025-05-26 19:47:29.575039
201	BGR	Bulgaria	GTI	Wholesale and retail trade; repair of motor vehicles and motorcycles; transportation and storage; accommodation and food service activities	2023	GVAHRS	119.93	IX	_Z	2025-05-26 19:47:29.575039
202	CRI	Costa Rica	F	Construction	2023	GVAHRS	12.85	PA	GY	2025-05-26 19:47:29.575039
203	CZE	Czechia	J	Information and communication	2023	GVAHRS	139.35	IX	_Z	2025-05-26 19:47:29.575039
204	FIN	Finland	A	Agriculture, forestry and fishing	2023	GVAHRS	-9.43	PA	GY	2025-05-26 19:47:29.575039
205	FRA	France	BTE	Industry (except construction)	2023	GVAHRS	4.73	PA	GY	2025-05-26 19:47:29.575039
206	HUN	Hungary	A	Agriculture, forestry and fishing	2023	GVAHRS	190.41	IX	_Z	2025-05-26 19:47:29.575039
207	ISL	Iceland	ATU	All ISIC activities	2023	GVAHRS	1.23	PA	GY	2025-05-26 19:47:29.575039
208	ISL	Iceland	BTE	Industry (except construction)	2023	GVAHRS	118.06	IX	_Z	2025-05-26 19:47:29.575039
209	PRT	Portugal	F	Construction	2023	GVAHRS	-1.29	PA	GY	2025-05-26 19:47:29.575039
210	AUT	Austria	K	Financial and insurance activities	2023	GVAHRS	-6.56	PA	GY	2025-05-26 19:47:29.575039
211	EST	Estonia	F	Construction	2023	GVAHRS	-7.31	PA	GY	2025-05-26 19:47:29.575039
212	EST	Estonia	GTI	Wholesale and retail trade; repair of motor vehicles and motorcycles; transportation and storage; accommodation and food service activities	2023	GVAHRS	-4.22	PA	GY	2025-05-26 19:47:29.575039
213	HRV	Croatia	J	Information and communication	2023	GVAHRS	-9.73	PA	GY	2025-05-26 19:47:29.575039
214	POL	Poland	J	Information and communication	2023	GVAHRS	-13.90	PA	GY	2025-05-26 19:47:29.575039
215	ROU	Romania	J	Information and communication	2023	GVAHRS	12.70	PA	GY	2025-05-26 19:47:29.575039
216	SVN	Slovenia	F	Construction	2023	GVAHRS	13.05	PA	GY	2025-05-26 19:47:29.575039
217	CAN	Canada	J	Information and communication	2023	GVAHRS	-2.42	PA	GY	2025-05-26 19:47:29.575039
218	CRI	Costa Rica	C	Manufacturing	2023	GVAHRS	135.98	IX	_Z	2025-05-26 19:47:29.575039
219	CZE	Czechia	C	Manufacturing	2023	GVAHRS	3.04	PA	GY	2025-05-26 19:47:29.575039
220	MEX	Mexico	J	Information and communication	2023	GVAHRS	128.49	IX	_Z	2025-05-26 19:47:29.575039
221	SVK	Slovak Republic	F	Construction	2023	GVAHRS	93.57	IX	_Z	2025-05-26 19:47:29.575039
222	SVK	Slovak Republic	K	Financial and insurance activities	2023	GVAHRS	101.49	IX	_Z	2025-05-26 19:47:29.575039
223	SVN	Slovenia	K	Financial and insurance activities	2023	GVAHRS	-1.67	PA	GY	2025-05-26 19:47:29.575039
224	ESP	Spain	J	Information and communication	2023	GVAHRS	104.14	IX	_Z	2025-05-26 19:47:29.575039
225	EST	Estonia	K	Financial and insurance activities	2023	GVAHRS	-10.26	PA	GY	2025-05-26 19:47:29.575039
226	GBR	United Kingdom	BTE	Industry (except construction)	2023	GVAHRS	-0.53	PA	GY	2025-05-26 19:47:29.575039
227	ITA	Italy	A	Agriculture, forestry and fishing	2023	GVAHRS	-0.70	PA	GY	2025-05-26 19:47:29.575039
228	ITA	Italy	ATU	All ISIC activities	2023	GVAHRS	-1.62	PA	GY	2025-05-26 19:47:29.575039
229	LVA	Latvia	M_N	Professional, scientific and technical activities; administrative and support service activities	2023	GVAHRS	-0.43	PA	GY	2025-05-26 19:47:29.575039
230	SVN	Slovenia	C	Manufacturing	2023	GVAHRS	117.92	IX	_Z	2025-05-26 19:47:29.575039
231	LUX	Luxembourg	ATU	All ISIC activities	2023	GVAHRS	96.86	IX	_Z	2025-05-26 19:47:29.575039
232	SVN	Slovenia	J	Information and communication	2023	GVAHRS	124.31	IX	_Z	2025-05-26 19:47:29.575039
233	SWE	Sweden	F	Construction	2023	GVAHRS	2.61	PA	GY	2025-05-26 19:47:29.575039
234	DNK	Denmark	K	Financial and insurance activities	2023	GVAHRS	-10.75	PA	GY	2025-05-26 19:47:29.575039
235	FIN	Finland	GTI	Wholesale and retail trade; repair of motor vehicles and motorcycles; transportation and storage; accommodation and food service activities	2023	GVAHRS	104.69	IX	_Z	2025-05-26 19:47:29.575039
236	HUN	Hungary	BTE	Industry (except construction)	2023	GVAHRS	96.76	IX	_Z	2025-05-26 19:47:29.575039
237	PRT	Portugal	K	Financial and insurance activities	2023	GVAHRS	119.48	IX	_Z	2025-05-26 19:47:29.575039
238	CZE	Czechia	K	Financial and insurance activities	2023	GVAHRS	11.06	PA	GY	2025-05-26 19:47:29.575039
239	ESP	Spain	F	Construction	2023	GVAHRS	-0.03	PA	GY	2025-05-26 19:47:29.575039
240	IRL	Ireland	A	Agriculture, forestry and fishing	2023	GVAHRS	13.66	PA	GY	2025-05-26 19:47:29.575039
241	IRL	Ireland	BTE	Industry (except construction)	2023	GVAHRS	-19.03	PA	GY	2025-05-26 19:47:29.575039
242	LUX	Luxembourg	M_N	Professional, scientific and technical activities; administrative and support service activities	2023	GVAHRS	-2.61	PA	GY	2025-05-26 19:47:29.575039
243	ESP	Spain	C	Manufacturing	2023	GVAHRS	105.07	IX	_Z	2025-05-26 19:47:29.575039
244	MEX	Mexico	K	Financial and insurance activities	2023	GVAHRS	7.37	PA	GY	2025-05-26 19:47:29.575039
245	EST	Estonia	J	Information and communication	2023	GVAHRS	147.17	IX	_Z	2025-05-26 19:47:29.575039
246	FIN	Finland	F	Construction	2023	GVAHRS	89.88	IX	_Z	2025-05-26 19:47:29.575039
247	NLD	Netherlands	J	Information and communication	2023	GVAHRS	114.79	IX	_Z	2025-05-26 19:47:29.575039
248	ROU	Romania	M_N	Professional, scientific and technical activities; administrative and support service activities	2023	GVAHRS	144.52	IX	_Z	2025-05-26 19:47:29.575039
249	BEL	Belgium	ATU	All ISIC activities	2023	GVAHRS	102.87	IX	_Z	2025-05-26 19:47:29.575039
250	FIN	Finland	BTE	Industry (except construction)	2023	GVAHRS	1.92	PA	GY	2025-05-26 19:47:29.575039
251	LTU	Lithuania	M_N	Professional, scientific and technical activities; administrative and support service activities	2023	GVAHRS	-9.88	PA	GY	2025-05-26 19:47:29.575039
314	GBR	United Kingdom	A	Agriculture, forestry and fishing	2023	GVAHRS	-6.38	PA	GY	2025-05-26 19:47:29.575039
252	SWE	Sweden	GTI	Wholesale and retail trade; repair of motor vehicles and motorcycles; transportation and storage; accommodation and food service activities	2023	GVAHRS	-1.03	PA	GY	2025-05-26 19:47:29.575039
253	BGR	Bulgaria	A	Agriculture, forestry and fishing	2023	GVAHRS	-0.20	PA	GY	2025-05-26 19:47:29.575039
254	DEU	Germany	K	Financial and insurance activities	2023	GVAHRS	112.06	IX	_Z	2025-05-26 19:47:29.575039
255	FRA	France	A	Agriculture, forestry and fishing	2023	GVAHRS	5.93	PA	GY	2025-05-26 19:47:29.575039
256	LVA	Latvia	A	Agriculture, forestry and fishing	2023	GVAHRS	92.89	IX	_Z	2025-05-26 19:47:29.575039
257	POL	Poland	C	Manufacturing	2023	GVAHRS	3.67	PA	GY	2025-05-26 19:47:29.575039
258	CRI	Costa Rica	BTE	Industry (except construction)	2023	GVAHRS	134.03	IX	_Z	2025-05-26 19:47:29.575039
259	DNK	Denmark	J	Information and communication	2023	GVAHRS	120.55	IX	_Z	2025-05-26 19:47:29.575039
260	ESP	Spain	J	Information and communication	2023	GVAHRS	2.38	PA	GY	2025-05-26 19:47:29.575039
261	HRV	Croatia	GTI	Wholesale and retail trade; repair of motor vehicles and motorcycles; transportation and storage; accommodation and food service activities	2023	GVAHRS	125.44	IX	_Z	2025-05-26 19:47:29.575039
262	ISL	Iceland	F	Construction	2023	GVAHRS	0.48	PA	GY	2025-05-26 19:47:29.575039
263	ISL	Iceland	K	Financial and insurance activities	2023	GVAHRS	-1.92	PA	GY	2025-05-26 19:47:29.575039
264	MEX	Mexico	A	Agriculture, forestry and fishing	2023	GVAHRS	2.68	PA	GY	2025-05-26 19:47:29.575039
265	SVK	Slovak Republic	BTE	Industry (except construction)	2023	GVAHRS	20.94	PA	GY	2025-05-26 19:47:29.575039
266	DEU	Germany	J	Information and communication	2023	GVAHRS	1.35	PA	GY	2025-05-26 19:47:29.575039
267	LUX	Luxembourg	GTI	Wholesale and retail trade; repair of motor vehicles and motorcycles; transportation and storage; accommodation and food service activities	2023	GVAHRS	87.94	IX	_Z	2025-05-26 19:47:29.575039
268	IRL	Ireland	C	Manufacturing	2023	GVAHRS	-21.67	PA	GY	2025-05-26 19:47:29.575039
269	ISL	Iceland	ATU	All ISIC activities	2023	GVAHRS	114.72	IX	_Z	2025-05-26 19:47:29.575039
270	AUT	Austria	C	Manufacturing	2023	GVAHRS	-2.63	PA	GY	2025-05-26 19:47:29.575039
271	CZE	Czechia	GTI	Wholesale and retail trade; repair of motor vehicles and motorcycles; transportation and storage; accommodation and food service activities	2023	GVAHRS	2.10	PA	GY	2025-05-26 19:47:29.575039
272	FRA	France	GTI	Wholesale and retail trade; repair of motor vehicles and motorcycles; transportation and storage; accommodation and food service activities	2023	GVAHRS	92.02	IX	_Z	2025-05-26 19:47:29.575039
273	POL	Poland	M_N	Professional, scientific and technical activities; administrative and support service activities	2023	GVAHRS	118.87	IX	_Z	2025-05-26 19:47:29.575039
274	ROU	Romania	K	Financial and insurance activities	2023	GVAHRS	98.04	IX	_Z	2025-05-26 19:47:29.575039
275	CAN	Canada	F	Construction	2023	GVAHRS	89.58	IX	_Z	2025-05-26 19:47:29.575039
276	CAN	Canada	GTI	Wholesale and retail trade; repair of motor vehicles and motorcycles; transportation and storage; accommodation and food service activities	2023	GVAHRS	105.35	IX	_Z	2025-05-26 19:47:29.575039
277	DEU	Germany	C	Manufacturing	2023	GVAHRS	115.25	IX	_Z	2025-05-26 19:47:29.575039
278	DNK	Denmark	BTE	Industry (except construction)	2023	GVAHRS	9.98	PA	GY	2025-05-26 19:47:29.575039
279	FRA	France	K	Financial and insurance activities	2023	GVAHRS	111.93	IX	_Z	2025-05-26 19:47:29.575039
280	GRC	Greece	C	Manufacturing	2023	GVAHRS	1.98	PA	GY	2025-05-26 19:47:29.575039
281	HRV	Croatia	F	Construction	2023	GVAHRS	128.00	IX	_Z	2025-05-26 19:47:29.575039
282	HUN	Hungary	C	Manufacturing	2023	GVAHRS	100.66	IX	_Z	2025-05-26 19:47:29.575039
283	ITA	Italy	BTE	Industry (except construction)	2023	GVAHRS	101.02	IX	_Z	2025-05-26 19:47:29.575039
284	ROU	Romania	F	Construction	2023	GVAHRS	100.65	IX	_Z	2025-05-26 19:47:29.575039
285	ROU	Romania	GTI	Wholesale and retail trade; repair of motor vehicles and motorcycles; transportation and storage; accommodation and food service activities	2023	GVAHRS	132.97	IX	_Z	2025-05-26 19:47:29.575039
286	ISL	Iceland	GTI	Wholesale and retail trade; repair of motor vehicles and motorcycles; transportation and storage; accommodation and food service activities	2023	GVAHRS	3.17	PA	GY	2025-05-26 19:47:29.575039
287	ITA	Italy	M_N	Professional, scientific and technical activities; administrative and support service activities	2023	GVAHRS	-2.95	PA	GY	2025-05-26 19:47:29.575039
288	POL	Poland	BTE	Industry (except construction)	2023	GVAHRS	3.74	PA	GY	2025-05-26 19:47:29.575039
289	SVN	Slovenia	M_N	Professional, scientific and technical activities; administrative and support service activities	2023	GVAHRS	116.13	IX	_Z	2025-05-26 19:47:29.575039
290	BGR	Bulgaria	BTE	Industry (except construction)	2023	GVAHRS	1.84	PA	GY	2025-05-26 19:47:29.575039
291	ESP	Spain	M_N	Professional, scientific and technical activities; administrative and support service activities	2023	GVAHRS	0.67	PA	GY	2025-05-26 19:47:29.575039
292	EST	Estonia	C	Manufacturing	2023	GVAHRS	122.00	IX	_Z	2025-05-26 19:47:29.575039
293	FIN	Finland	J	Information and communication	2023	GVAHRS	108.85	IX	_Z	2025-05-26 19:47:29.575039
294	FRA	France	F	Construction	2023	GVAHRS	88.07	IX	_Z	2025-05-26 19:47:29.575039
295	HRV	Croatia	K	Financial and insurance activities	2023	GVAHRS	116.43	IX	_Z	2025-05-26 19:47:29.575039
296	LVA	Latvia	BTE	Industry (except construction)	2023	GVAHRS	120.98	IX	_Z	2025-05-26 19:47:29.575039
297	BEL	Belgium	BTE	Industry (except construction)	2023	GVAHRS	0.71	PA	GY	2025-05-26 19:47:29.575039
298	HUN	Hungary	K	Financial and insurance activities	2023	GVAHRS	140.68	IX	_Z	2025-05-26 19:47:29.575039
299	ITA	Italy	A	Agriculture, forestry and fishing	2023	GVAHRS	92.46	IX	_Z	2025-05-26 19:47:29.575039
300	MEX	Mexico	C	Manufacturing	2023	GVAHRS	-0.29	PA	GY	2025-05-26 19:47:29.575039
301	PRT	Portugal	BTE	Industry (except construction)	2023	GVAHRS	105.38	IX	_Z	2025-05-26 19:47:29.575039
302	LUX	Luxembourg	A	Agriculture, forestry and fishing	2023	GVAHRS	3.12	PA	GY	2025-05-26 19:47:29.575039
303	NOR	Norway	J	Information and communication	2023	GVAHRS	106.54	IX	_Z	2025-05-26 19:47:29.575039
304	SWE	Sweden	J	Information and communication	2023	GVAHRS	-0.59	PA	GY	2025-05-26 19:47:29.575039
305	AUT	Austria	C	Manufacturing	2023	GVAHRS	115.05	IX	_Z	2025-05-26 19:47:29.575039
306	BEL	Belgium	BTE	Industry (except construction)	2023	GVAHRS	96.97	IX	_Z	2025-05-26 19:47:29.575039
307	CRI	Costa Rica	BTE	Industry (except construction)	2023	GVAHRS	1.63	PA	GY	2025-05-26 19:47:29.575039
308	DNK	Denmark	J	Information and communication	2023	GVAHRS	2.29	PA	GY	2025-05-26 19:47:29.575039
309	EST	Estonia	ATU	All ISIC activities	2023	GVAHRS	117.67	IX	_Z	2025-05-26 19:47:29.575039
310	MEX	Mexico	M_N	Professional, scientific and technical activities; administrative and support service activities	2023	GVAHRS	-4.55	PA	GY	2025-05-26 19:47:29.575039
311	HUN	Hungary	BTE	Industry (except construction)	2023	GVAHRS	-4.29	PA	GY	2025-05-26 19:47:29.575039
312	LTU	Lithuania	F	Construction	2023	GVAHRS	117.99	IX	_Z	2025-05-26 19:47:29.575039
313	LTU	Lithuania	GTI	Wholesale and retail trade; repair of motor vehicles and motorcycles; transportation and storage; accommodation and food service activities	2023	GVAHRS	122.45	IX	_Z	2025-05-26 19:47:29.575039
315	HUN	Hungary	M_N	Professional, scientific and technical activities; administrative and support service activities	2023	GVAHRS	-4.19	PA	GY	2025-05-26 19:47:29.575039
316	IRL	Ireland	K	Financial and insurance activities	2023	GVAHRS	11.55	PA	GY	2025-05-26 19:47:29.575039
317	NOR	Norway	K	Financial and insurance activities	2023	GVAHRS	-1.35	PA	GY	2025-05-26 19:47:29.575039
318	POL	Poland	J	Information and communication	2023	GVAHRS	120.28	IX	_Z	2025-05-26 19:47:29.575039
319	ESP	Spain	F	Construction	2023	GVAHRS	85.46	IX	_Z	2025-05-26 19:47:29.575039
320	GBR	United Kingdom	GTI	Wholesale and retail trade; repair of motor vehicles and motorcycles; transportation and storage; accommodation and food service activities	2023	GVAHRS	-0.68	PA	GY	2025-05-26 19:47:29.575039
321	IRL	Ireland	GTI	Wholesale and retail trade; repair of motor vehicles and motorcycles; transportation and storage; accommodation and food service activities	2023	GVAHRS	-3.02	PA	GY	2025-05-26 19:47:29.575039
322	ITA	Italy	C	Manufacturing	2023	GVAHRS	103.09	IX	_Z	2025-05-26 19:47:29.575039
323	ROU	Romania	A	Agriculture, forestry and fishing	2023	GVAHRS	128.05	IX	_Z	2025-05-26 19:47:29.575039
324	CAN	Canada	C	Manufacturing	2023	GVAHRS	99.75	IX	_Z	2025-05-26 19:47:29.575039
325	DEU	Germany	F	Construction	2023	GVAHRS	85.46	IX	_Z	2025-05-26 19:47:29.575039
326	DEU	Germany	GTI	Wholesale and retail trade; repair of motor vehicles and motorcycles; transportation and storage; accommodation and food service activities	2023	GVAHRS	108.62	IX	_Z	2025-05-26 19:47:29.575039
327	FRA	France	A	Agriculture, forestry and fishing	2023	GVAHRS	107.95	IX	_Z	2025-05-26 19:47:29.575039
328	LTU	Lithuania	C	Manufacturing	2023	GVAHRS	-8.34	PA	GY	2025-05-26 19:47:29.575039
329	NOR	Norway	BTE	Industry (except construction)	2023	GVAHRS	106.54	IX	_Z	2025-05-26 19:47:29.575039
330	CRI	Costa Rica	J	Information and communication	2023	GVAHRS	5.85	PA	GY	2025-05-26 19:47:29.575039
331	DEU	Germany	BTE	Industry (except construction)	2023	GVAHRS	108.79	IX	_Z	2025-05-26 19:47:29.575039
332	GBR	United Kingdom	F	Construction	2023	GVAHRS	2.19	PA	GY	2025-05-26 19:47:29.575039
333	GRC	Greece	A	Agriculture, forestry and fishing	2023	GVAHRS	-27.09	PA	GY	2025-05-26 19:47:29.575039
334	IRL	Ireland	ATU	All ISIC activities	2023	GVAHRS	128.27	IX	_Z	2025-05-26 19:47:29.575039
335	ROU	Romania	M_N	Professional, scientific and technical activities; administrative and support service activities	2023	GVAHRS	2.97	PA	GY	2025-05-26 19:47:29.575039
336	AUT	Austria	ATU	All ISIC activities	2023	GVAHRS	105.96	IX	_Z	2025-05-26 19:47:29.575039
337	GBR	United Kingdom	K	Financial and insurance activities	2023	GVAHRS	-3.35	PA	GY	2025-05-26 19:47:29.575039
338	LTU	Lithuania	M_N	Professional, scientific and technical activities; administrative and support service activities	2023	GVAHRS	128.17	IX	_Z	2025-05-26 19:47:29.575039
339	LUX	Luxembourg	ATU	All ISIC activities	2023	GVAHRS	-3.10	PA	GY	2025-05-26 19:47:29.575039
340	AUT	Austria	F	Construction	2023	GVAHRS	-6.89	PA	GY	2025-05-26 19:47:29.575039
341	FIN	Finland	ATU	All ISIC activities	2023	GVAHRS	-0.75	PA	GY	2025-05-26 19:47:29.575039
342	ISL	Iceland	A	Agriculture, forestry and fishing	2023	GVAHRS	3.51	PA	GY	2025-05-26 19:47:29.575039
343	ISL	Iceland	C	Manufacturing	2023	GVAHRS	-2.58	PA	GY	2025-05-26 19:47:29.575039
344	SVN	Slovenia	BTE	Industry (except construction)	2023	GVAHRS	3.57	PA	GY	2025-05-26 19:47:29.575039
345	BEL	Belgium	C	Manufacturing	2023	GVAHRS	-1.13	PA	GY	2025-05-26 19:47:29.575039
346	BEL	Belgium	J	Information and communication	2023	GVAHRS	112.70	IX	_Z	2025-05-26 19:47:29.575039
347	CRI	Costa Rica	K	Financial and insurance activities	2023	GVAHRS	1.08	PA	GY	2025-05-26 19:47:29.575039
348	HUN	Hungary	GTI	Wholesale and retail trade; repair of motor vehicles and motorcycles; transportation and storage; accommodation and food service activities	2023	GVAHRS	123.40	IX	_Z	2025-05-26 19:47:29.575039
349	NLD	Netherlands	M_N	Professional, scientific and technical activities; administrative and support service activities	2023	GVAHRS	112.01	IX	_Z	2025-05-26 19:47:29.575039
350	AUT	Austria	GTI	Wholesale and retail trade; repair of motor vehicles and motorcycles; transportation and storage; accommodation and food service activities	2023	GVAHRS	-3.90	PA	GY	2025-05-26 19:47:29.575039
351	NLD	Netherlands	F	Construction	2023	GVAHRS	112.26	IX	_Z	2025-05-26 19:47:29.575039
352	EST	Estonia	F	Construction	2023	GVAHRS	160.34	IX	_Z	2025-05-26 19:47:29.575039
353	EST	Estonia	J	Information and communication	2023	GVAHRS	-7.03	PA	GY	2025-05-26 19:47:29.575039
354	GBR	United Kingdom	J	Information and communication	2023	GVAHRS	142.61	IX	_Z	2025-05-26 19:47:29.575039
355	HRV	Croatia	M_N	Professional, scientific and technical activities; administrative and support service activities	2023	GVAHRS	2.67	PA	GY	2025-05-26 19:47:29.575039
356	HUN	Hungary	F	Construction	2023	GVAHRS	87.76	IX	_Z	2025-05-26 19:47:29.575039
357	HUN	Hungary	J	Information and communication	2023	GVAHRS	3.84	PA	GY	2025-05-26 19:47:29.575039
358	NLD	Netherlands	GTI	Wholesale and retail trade; repair of motor vehicles and motorcycles; transportation and storage; accommodation and food service activities	2023	GVAHRS	106.17	IX	_Z	2025-05-26 19:47:29.575039
359	ROU	Romania	C	Manufacturing	2023	GVAHRS	109.67	IX	_Z	2025-05-26 19:47:29.575039
360	ITA	Italy	ATU	All ISIC activities	2023	GVAHRS	102.97	IX	_Z	2025-05-26 19:47:29.575039
361	LTU	Lithuania	BTE	Industry (except construction)	2023	GVAHRS	-8.34	PA	GY	2025-05-26 19:47:29.575039
362	PRT	Portugal	C	Manufacturing	2023	GVAHRS	-3.08	PA	GY	2025-05-26 19:47:29.575039
363	SWE	Sweden	BTE	Industry (except construction)	2023	GVAHRS	-5.80	PA	GY	2025-05-26 19:47:29.575039
364	EST	Estonia	GTI	Wholesale and retail trade; repair of motor vehicles and motorcycles; transportation and storage; accommodation and food service activities	2023	GVAHRS	116.97	IX	_Z	2025-05-26 19:47:29.575039
365	NOR	Norway	M_N	Professional, scientific and technical activities; administrative and support service activities	2023	GVAHRS	0.71	PA	GY	2025-05-26 19:47:29.575039
366	BEL	Belgium	ATU	All ISIC activities	2023	GVAHRS	0.13	PA	GY	2025-05-26 19:47:29.575039
367	FRA	France	C	Manufacturing	2023	GVAHRS	103.64	IX	_Z	2025-05-26 19:47:29.575039
368	HRV	Croatia	A	Agriculture, forestry and fishing	2023	GVAHRS	234.05	IX	_Z	2025-05-26 19:47:29.575039
369	PRT	Portugal	K	Financial and insurance activities	2023	GVAHRS	-1.79	PA	GY	2025-05-26 19:47:29.575039
370	SVK	Slovak Republic	J	Information and communication	2023	GVAHRS	95.76	IX	_Z	2025-05-26 19:47:29.575039
371	SVN	Slovenia	GTI	Wholesale and retail trade; repair of motor vehicles and motorcycles; transportation and storage; accommodation and food service activities	2023	GVAHRS	118.59	IX	_Z	2025-05-26 19:47:29.575039
372	BGR	Bulgaria	F	Construction	2023	GVAHRS	-3.13	PA	GY	2025-05-26 19:47:29.575039
373	FRA	France	M_N	Professional, scientific and technical activities; administrative and support service activities	2023	GVAHRS	1.73	PA	GY	2025-05-26 19:47:29.575039
374	IRL	Ireland	F	Construction	2023	GVAHRS	0.57	PA	GY	2025-05-26 19:47:29.575039
375	ITA	Italy	K	Financial and insurance activities	2023	GVAHRS	96.30	IX	_Z	2025-05-26 19:47:29.575039
376	MEX	Mexico	ATU	All ISIC activities	2023	GVAHRS	93.77	IX	_Z	2025-05-26 19:47:29.575039
439	HRV	Croatia	ATU	All ISIC activities	2023	GVAHRS	0.68	PA	GY	2025-05-26 19:47:29.575039
377	NOR	Norway	GTI	Wholesale and retail trade; repair of motor vehicles and motorcycles; transportation and storage; accommodation and food service activities	2023	GVAHRS	-0.21	PA	GY	2025-05-26 19:47:29.575039
378	SVK	Slovak Republic	ATU	All ISIC activities	2023	GVAHRS	2.42	PA	GY	2025-05-26 19:47:29.575039
379	SWE	Sweden	A	Agriculture, forestry and fishing	2023	GVAHRS	-12.08	PA	GY	2025-05-26 19:47:29.575039
380	SWE	Sweden	C	Manufacturing	2023	GVAHRS	-6.16	PA	GY	2025-05-26 19:47:29.575039
381	HRV	Croatia	C	Manufacturing	2023	GVAHRS	106.86	IX	_Z	2025-05-26 19:47:29.575039
382	LVA	Latvia	J	Information and communication	2023	GVAHRS	1.14	PA	GY	2025-05-26 19:47:29.575039
383	NOR	Norway	A	Agriculture, forestry and fishing	2023	GVAHRS	105.80	IX	_Z	2025-05-26 19:47:29.575039
384	CAN	Canada	ATU	All ISIC activities	2023	GVAHRS	-1.69	PA	GY	2025-05-26 19:47:29.575039
385	CZE	Czechia	ATU	All ISIC activities	2023	GVAHRS	111.19	IX	_Z	2025-05-26 19:47:29.575039
386	ESP	Spain	GTI	Wholesale and retail trade; repair of motor vehicles and motorcycles; transportation and storage; accommodation and food service activities	2023	GVAHRS	108.73	IX	_Z	2025-05-26 19:47:29.575039
387	GRC	Greece	K	Financial and insurance activities	2023	GVAHRS	8.48	PA	GY	2025-05-26 19:47:29.575039
388	LTU	Lithuania	A	Agriculture, forestry and fishing	2023	GVAHRS	5.52	PA	GY	2025-05-26 19:47:29.575039
389	NOR	Norway	F	Construction	2023	GVAHRS	-2.29	PA	GY	2025-05-26 19:47:29.575039
390	BEL	Belgium	K	Financial and insurance activities	2023	GVAHRS	2.13	PA	GY	2025-05-26 19:47:29.575039
391	CRI	Costa Rica	C	Manufacturing	2023	GVAHRS	3.99	PA	GY	2025-05-26 19:47:29.575039
392	AUT	Austria	BTE	Industry (except construction)	2023	GVAHRS	114.08	IX	_Z	2025-05-26 19:47:29.575039
393	CAN	Canada	J	Information and communication	2023	GVAHRS	99.14	IX	_Z	2025-05-26 19:47:29.575039
394	FIN	Finland	K	Financial and insurance activities	2023	GVAHRS	-3.46	PA	GY	2025-05-26 19:47:29.575039
395	MEX	Mexico	ATU	All ISIC activities	2023	GVAHRS	1.40	PA	GY	2025-05-26 19:47:29.575039
396	GBR	United Kingdom	BTE	Industry (except construction)	2023	GVAHRS	103.34	IX	_Z	2025-05-26 19:47:29.575039
397	POL	Poland	GTI	Wholesale and retail trade; repair of motor vehicles and motorcycles; transportation and storage; accommodation and food service activities	2023	GVAHRS	129.78	IX	_Z	2025-05-26 19:47:29.575039
398	SVK	Slovak Republic	K	Financial and insurance activities	2023	GVAHRS	-8.11	PA	GY	2025-05-26 19:47:29.575039
399	BGR	Bulgaria	GTI	Wholesale and retail trade; repair of motor vehicles and motorcycles; transportation and storage; accommodation and food service activities	2023	GVAHRS	0.57	PA	GY	2025-05-26 19:47:29.575039
400	FRA	France	M_N	Professional, scientific and technical activities; administrative and support service activities	2023	GVAHRS	100.10	IX	_Z	2025-05-26 19:47:29.575039
401	LVA	Latvia	F	Construction	2023	GVAHRS	117.31	IX	_Z	2025-05-26 19:47:29.575039
402	ROU	Romania	BTE	Industry (except construction)	2023	GVAHRS	104.05	IX	_Z	2025-05-26 19:47:29.575039
403	SVK	Slovak Republic	ATU	All ISIC activities	2023	GVAHRS	118.33	IX	_Z	2025-05-26 19:47:29.575039
404	BGR	Bulgaria	K	Financial and insurance activities	2023	GVAHRS	0.43	PA	GY	2025-05-26 19:47:29.575039
405	EST	Estonia	ATU	All ISIC activities	2023	GVAHRS	-6.44	PA	GY	2025-05-26 19:47:29.575039
406	LUX	Luxembourg	J	Information and communication	2023	GVAHRS	107.35	IX	_Z	2025-05-26 19:47:29.575039
407	LVA	Latvia	K	Financial and insurance activities	2023	GVAHRS	70.90	IX	_Z	2025-05-26 19:47:29.575039
408	POL	Poland	K	Financial and insurance activities	2023	GVAHRS	138.30	IX	_Z	2025-05-26 19:47:29.575039
409	SVN	Slovenia	F	Construction	2023	GVAHRS	131.30	IX	_Z	2025-05-26 19:47:29.575039
410	SWE	Sweden	M_N	Professional, scientific and technical activities; administrative and support service activities	2023	GVAHRS	107.52	IX	_Z	2025-05-26 19:47:29.575039
411	PRT	Portugal	BTE	Industry (except construction)	2023	GVAHRS	-1.13	PA	GY	2025-05-26 19:47:29.575039
412	PRT	Portugal	F	Construction	2023	GVAHRS	96.01	IX	_Z	2025-05-26 19:47:29.575039
413	PRT	Portugal	GTI	Wholesale and retail trade; repair of motor vehicles and motorcycles; transportation and storage; accommodation and food service activities	2023	GVAHRS	104.70	IX	_Z	2025-05-26 19:47:29.575039
414	SVK	Slovak Republic	F	Construction	2023	GVAHRS	-5.23	PA	GY	2025-05-26 19:47:29.575039
415	SVK	Slovak Republic	GTI	Wholesale and retail trade; repair of motor vehicles and motorcycles; transportation and storage; accommodation and food service activities	2023	GVAHRS	2.19	PA	GY	2025-05-26 19:47:29.575039
416	BGR	Bulgaria	F	Construction	2023	GVAHRS	83.94	IX	_Z	2025-05-26 19:47:29.575039
417	DNK	Denmark	C	Manufacturing	2023	GVAHRS	150.47	IX	_Z	2025-05-26 19:47:29.575039
418	ESP	Spain	K	Financial and insurance activities	2023	GVAHRS	114.56	IX	_Z	2025-05-26 19:47:29.575039
419	GRC	Greece	C	Manufacturing	2023	GVAHRS	107.47	IX	_Z	2025-05-26 19:47:29.575039
420	AUT	Austria	J	Information and communication	2023	GVAHRS	-2.11	PA	GY	2025-05-26 19:47:29.575039
421	NOR	Norway	C	Manufacturing	2023	GVAHRS	-0.40	PA	GY	2025-05-26 19:47:29.575039
422	NOR	Norway	M_N	Professional, scientific and technical activities; administrative and support service activities	2023	GVAHRS	107.35	IX	_Z	2025-05-26 19:47:29.575039
423	ROU	Romania	K	Financial and insurance activities	2023	GVAHRS	7.81	PA	GY	2025-05-26 19:47:29.575039
424	SVN	Slovenia	GTI	Wholesale and retail trade; repair of motor vehicles and motorcycles; transportation and storage; accommodation and food service activities	2023	GVAHRS	0.90	PA	GY	2025-05-26 19:47:29.575039
425	CRI	Costa Rica	GTI	Wholesale and retail trade; repair of motor vehicles and motorcycles; transportation and storage; accommodation and food service activities	2023	GVAHRS	7.10	PA	GY	2025-05-26 19:47:29.575039
426	CZE	Czechia	M_N	Professional, scientific and technical activities; administrative and support service activities	2023	GVAHRS	118.53	IX	_Z	2025-05-26 19:47:29.575039
427	LTU	Lithuania	BTE	Industry (except construction)	2023	GVAHRS	112.30	IX	_Z	2025-05-26 19:47:29.575039
428	ROU	Romania	ATU	All ISIC activities	2023	GVAHRS	2.92	PA	GY	2025-05-26 19:47:29.575039
429	SVN	Slovenia	A	Agriculture, forestry and fishing	2023	GVAHRS	5.43	PA	GY	2025-05-26 19:47:29.575039
430	HUN	Hungary	GTI	Wholesale and retail trade; repair of motor vehicles and motorcycles; transportation and storage; accommodation and food service activities	2023	GVAHRS	-6.45	PA	GY	2025-05-26 19:47:29.575039
431	SVK	Slovak Republic	C	Manufacturing	2023	GVAHRS	19.46	PA	GY	2025-05-26 19:47:29.575039
432	ESP	Spain	ATU	All ISIC activities	2023	GVAHRS	103.23	IX	_Z	2025-05-26 19:47:29.575039
433	GRC	Greece	J	Information and communication	2023	GVAHRS	-1.31	PA	GY	2025-05-26 19:47:29.575039
434	SWE	Sweden	ATU	All ISIC activities	2023	GVAHRS	-1.00	PA	GY	2025-05-26 19:47:29.575039
435	SWE	Sweden	BTE	Industry (except construction)	2023	GVAHRS	111.34	IX	_Z	2025-05-26 19:47:29.575039
436	AUT	Austria	BTE	Industry (except construction)	2023	GVAHRS	-1.88	PA	GY	2025-05-26 19:47:29.575039
437	BEL	Belgium	GTI	Wholesale and retail trade; repair of motor vehicles and motorcycles; transportation and storage; accommodation and food service activities	2023	GVAHRS	0.21	PA	GY	2025-05-26 19:47:29.575039
438	DNK	Denmark	A	Agriculture, forestry and fishing	2023	GVAHRS	-5.94	PA	GY	2025-05-26 19:47:29.575039
440	PRT	Portugal	A	Agriculture, forestry and fishing	2023	GVAHRS	175.20	IX	_Z	2025-05-26 19:47:29.575039
441	CZE	Czechia	A	Agriculture, forestry and fishing	2023	GVAHRS	107.17	IX	_Z	2025-05-26 19:47:29.575039
442	CZE	Czechia	F	Construction	2023	GVAHRS	75.52	IX	_Z	2025-05-26 19:47:29.575039
443	GBR	United Kingdom	M_N	Professional, scientific and technical activities; administrative and support service activities	2023	GVAHRS	2.62	PA	GY	2025-05-26 19:47:29.575039
444	CZE	Czechia	BTE	Industry (except construction)	2023	GVAHRS	-1.68	PA	GY	2025-05-26 19:47:29.575039
445	FIN	Finland	ATU	All ISIC activities	2023	GVAHRS	104.31	IX	_Z	2025-05-26 19:47:29.575039
446	GRC	Greece	M_N	Professional, scientific and technical activities; administrative and support service activities	2023	GVAHRS	130.49	IX	_Z	2025-05-26 19:47:29.575039
447	NLD	Netherlands	A	Agriculture, forestry and fishing	2023	GVAHRS	-0.89	PA	GY	2025-05-26 19:47:29.575039
448	NLD	Netherlands	M_N	Professional, scientific and technical activities; administrative and support service activities	2023	GVAHRS	2.42	PA	GY	2025-05-26 19:47:29.575039
449	PRT	Portugal	J	Information and communication	2023	GVAHRS	-0.97	PA	GY	2025-05-26 19:47:29.575039
450	BEL	Belgium	GTI	Wholesale and retail trade; repair of motor vehicles and motorcycles; transportation and storage; accommodation and food service activities	2023	GVAHRS	103.19	IX	_Z	2025-05-26 19:47:29.575039
451	BGR	Bulgaria	M_N	Professional, scientific and technical activities; administrative and support service activities	2023	GVAHRS	125.79	IX	_Z	2025-05-26 19:47:29.575039
452	LTU	Lithuania	K	Financial and insurance activities	2023	GVAHRS	91.81	IX	_Z	2025-05-26 19:47:29.575039
453	NOR	Norway	F	Construction	2023	GVAHRS	96.87	IX	_Z	2025-05-26 19:47:29.575039
454	BGR	Bulgaria	C	Manufacturing	2023	GVAHRS	3.27	PA	GY	2025-05-26 19:47:29.575039
455	ESP	Spain	BTE	Industry (except construction)	2023	GVAHRS	99.13	IX	_Z	2025-05-26 19:47:29.575039
456	GBR	United Kingdom	ATU	All ISIC activities	2023	GVAHRS	105.45	IX	_Z	2025-05-26 19:47:29.575039
457	LUX	Luxembourg	C	Manufacturing	2023	GVAHRS	101.06	IX	_Z	2025-05-26 19:47:29.575039
458	SVN	Slovenia	A	Agriculture, forestry and fishing	2023	GVAHRS	105.27	IX	_Z	2025-05-26 19:47:29.575039
459	BEL	Belgium	F	Construction	2023	GVAHRS	91.95	IX	_Z	2025-05-26 19:47:29.575039
460	BEL	Belgium	K	Financial and insurance activities	2023	GVAHRS	113.28	IX	_Z	2025-05-26 19:47:29.575039
461	EST	Estonia	M_N	Professional, scientific and technical activities; administrative and support service activities	2023	GVAHRS	-15.05	PA	GY	2025-05-26 19:47:29.575039
462	IRL	Ireland	J	Information and communication	2023	GVAHRS	5.11	PA	GY	2025-05-26 19:47:29.575039
463	LVA	Latvia	K	Financial and insurance activities	2023	GVAHRS	-5.87	PA	GY	2025-05-26 19:47:29.575039
464	NOR	Norway	GTI	Wholesale and retail trade; repair of motor vehicles and motorcycles; transportation and storage; accommodation and food service activities	2023	GVAHRS	106.53	IX	_Z	2025-05-26 19:47:29.575039
465	ROU	Romania	BTE	Industry (except construction)	2023	GVAHRS	-0.45	PA	GY	2025-05-26 19:47:29.575039
466	SVN	Slovenia	M_N	Professional, scientific and technical activities; administrative and support service activities	2023	GVAHRS	0.02	PA	GY	2025-05-26 19:47:29.575039
467	FRA	France	K	Financial and insurance activities	2023	GVAHRS	-2.82	PA	GY	2025-05-26 19:47:29.575039
468	HUN	Hungary	F	Construction	2023	GVAHRS	-3.13	PA	GY	2025-05-26 19:47:29.575039
469	LVA	Latvia	F	Construction	2023	GVAHRS	18.61	PA	GY	2025-05-26 19:47:29.575039
470	LVA	Latvia	GTI	Wholesale and retail trade; repair of motor vehicles and motorcycles; transportation and storage; accommodation and food service activities	2023	GVAHRS	1.47	PA	GY	2025-05-26 19:47:29.575039
471	FIN	Finland	C	Manufacturing	2023	GVAHRS	0.22	PA	GY	2025-05-26 19:47:29.575039
472	HUN	Hungary	K	Financial and insurance activities	2023	GVAHRS	-0.09	PA	GY	2025-05-26 19:47:29.575039
473	PRT	Portugal	M_N	Professional, scientific and technical activities; administrative and support service activities	2023	GVAHRS	4.32	PA	GY	2025-05-26 19:47:29.575039
474	CZE	Czechia	BTE	Industry (except construction)	2023	GVAHRS	116.15	IX	_Z	2025-05-26 19:47:29.575039
475	EST	Estonia	A	Agriculture, forestry and fishing	2023	GVAHRS	75.80	IX	_Z	2025-05-26 19:47:29.575039
476	CRI	Costa Rica	A	Agriculture, forestry and fishing	2023	GVAHRS	121.65	IX	_Z	2025-05-26 19:47:29.575039
477	FRA	France	J	Information and communication	2023	GVAHRS	2.76	PA	GY	2025-05-26 19:47:29.575039
478	CRI	Costa Rica	ATU	All ISIC activities	2023	GVAHRS	124.61	IX	_Z	2025-05-26 19:47:29.575039
479	GBR	United Kingdom	J	Information and communication	2023	GVAHRS	-1.49	PA	GY	2025-05-26 19:47:29.575039
480	LUX	Luxembourg	GTI	Wholesale and retail trade; repair of motor vehicles and motorcycles; transportation and storage; accommodation and food service activities	2023	GVAHRS	-6.63	PA	GY	2025-05-26 19:47:29.575039
481	GRC	Greece	ATU	All ISIC activities	2023	GVAHRS	97.73	IX	_Z	2025-05-26 19:47:29.575039
482	HRV	Croatia	BTE	Industry (except construction)	2023	GVAHRS	-0.12	PA	GY	2025-05-26 19:47:29.575039
483	MEX	Mexico	BTE	Industry (except construction)	2023	GVAHRS	87.02	IX	_Z	2025-05-26 19:47:29.575039
484	AUT	Austria	A	Agriculture, forestry and fishing	2023	GVAHRS	6.07	PA	GY	2025-05-26 19:47:29.575039
485	EST	Estonia	BTE	Industry (except construction)	2023	GVAHRS	106.15	IX	_Z	2025-05-26 19:47:29.575039
486	LVA	Latvia	C	Manufacturing	2023	GVAHRS	127.16	IX	_Z	2025-05-26 19:47:29.575039
487	SWE	Sweden	M_N	Professional, scientific and technical activities; administrative and support service activities	2023	GVAHRS	2.56	PA	GY	2025-05-26 19:47:29.575039
488	ISL	Iceland	C	Manufacturing	2023	GVAHRS	110.12	IX	_Z	2025-05-26 19:47:29.575039
489	ISL	Iceland	J	Information and communication	2023	GVAHRS	139.38	IX	_Z	2025-05-26 19:47:29.575039
490	SVN	Slovenia	ATU	All ISIC activities	2023	GVAHRS	2.32	PA	GY	2025-05-26 19:47:29.575039
491	DEU	Germany	ATU	All ISIC activities	2023	GVAHRS	107.03	IX	_Z	2025-05-26 19:47:29.575039
492	DEU	Germany	M_N	Professional, scientific and technical activities; administrative and support service activities	2023	GVAHRS	-0.15	PA	GY	2025-05-26 19:47:29.575039
493	DNK	Denmark	BTE	Industry (except construction)	2023	GVAHRS	139.86	IX	_Z	2025-05-26 19:47:29.575039
494	ITA	Italy	K	Financial and insurance activities	2023	GVAHRS	-7.63	PA	GY	2025-05-26 19:47:29.575039
495	NOR	Norway	A	Agriculture, forestry and fishing	2023	GVAHRS	-6.85	PA	GY	2025-05-26 19:47:29.575039
496	NOR	Norway	BTE	Industry (except construction)	2023	GVAHRS	-0.79	PA	GY	2025-05-26 19:47:29.575039
497	SWE	Sweden	A	Agriculture, forestry and fishing	2023	GVAHRS	87.90	IX	_Z	2025-05-26 19:47:29.575039
498	CRI	Costa Rica	M_N	Professional, scientific and technical activities; administrative and support service activities	2023	GVAHRS	16.64	PA	GY	2025-05-26 19:47:29.575039
499	ESP	Spain	A	Agriculture, forestry and fishing	2023	GVAHRS	91.91	IX	_Z	2025-05-26 19:47:29.575039
500	FIN	Finland	M_N	Professional, scientific and technical activities; administrative and support service activities	2023	GVAHRS	104.13	IX	_Z	2025-05-26 19:47:29.575039
501	LTU	Lithuania	C	Manufacturing	2023	GVAHRS	116.86	IX	_Z	2025-05-26 19:47:29.575039
502	LUX	Luxembourg	K	Financial and insurance activities	2023	GVAHRS	85.34	IX	_Z	2025-05-26 19:47:29.575039
503	POL	Poland	A	Agriculture, forestry and fishing	2023	GVAHRS	23.48	PA	GY	2025-05-26 19:47:29.575039
504	FIN	Finland	J	Information and communication	2023	GVAHRS	-2.51	PA	GY	2025-05-26 19:47:29.575039
505	HRV	Croatia	A	Agriculture, forestry and fishing	2023	GVAHRS	17.13	PA	GY	2025-05-26 19:47:29.575039
506	LTU	Lithuania	GTI	Wholesale and retail trade; repair of motor vehicles and motorcycles; transportation and storage; accommodation and food service activities	2023	GVAHRS	-3.59	PA	GY	2025-05-26 19:47:29.575039
507	NLD	Netherlands	BTE	Industry (except construction)	2023	GVAHRS	101.66	IX	_Z	2025-05-26 19:47:29.575039
508	PRT	Portugal	ATU	All ISIC activities	2023	GVAHRS	106.38	IX	_Z	2025-05-26 19:47:29.575039
509	ROU	Romania	A	Agriculture, forestry and fishing	2023	GVAHRS	8.78	PA	GY	2025-05-26 19:47:29.575039
510	DNK	Denmark	ATU	All ISIC activities	2023	GVAHRS	2.00	PA	GY	2025-05-26 19:47:29.575039
511	HUN	Hungary	J	Information and communication	2023	GVAHRS	137.32	IX	_Z	2025-05-26 19:47:29.575039
512	IRL	Ireland	M_N	Professional, scientific and technical activities; administrative and support service activities	2023	GVAHRS	115.02	IX	_Z	2025-05-26 19:47:29.575039
513	LTU	Lithuania	F	Construction	2023	GVAHRS	9.20	PA	GY	2025-05-26 19:47:29.575039
514	SVN	Slovenia	BTE	Industry (except construction)	2023	GVAHRS	119.64	IX	_Z	2025-05-26 19:47:29.575039
515	NLD	Netherlands	ATU	All ISIC activities	2023	GVAHRS	-1.23	PA	GY	2025-05-26 19:47:29.575039
516	ROU	Romania	BTNXL	Business economy excluding real estate	2023	GVAHRS	123.41	IX	_Z	2025-05-26 19:47:29.575039
517	ISL	Iceland	BTNXL	Business economy excluding real estate	2023	GVAHRS	0.77	PA	GY	2025-05-26 19:47:29.575039
518	NLD	Netherlands	B_D_E	Mining and quarrying; Energy, water supply and waste management services	2023	GVAHRS	56.85	IX	_Z	2025-05-26 19:47:29.575039
519	FRA	France	BTNXL	Business economy excluding real estate	2023	GVAHRS	98.24	IX	_Z	2025-05-26 19:47:29.575039
520	SWE	Sweden	ATU	All ISIC activities	2023	GVAHRS	104.94	IX	_Z	2025-05-26 19:47:29.575039
521	SWE	Sweden	K	Financial and insurance activities	2023	GVAHRS	-5.36	PA	GY	2025-05-26 19:47:29.575039
522	CZE	Czechia	F	Construction	2023	GVAHRS	-3.72	PA	GY	2025-05-26 19:47:29.575039
523	EST	Estonia	K	Financial and insurance activities	2023	GVAHRS	62.98	IX	_Z	2025-05-26 19:47:29.575039
524	GRC	Greece	GTI	Wholesale and retail trade; repair of motor vehicles and motorcycles; transportation and storage; accommodation and food service activities	2023	GVAHRS	0.51	PA	GY	2025-05-26 19:47:29.575039
525	PRT	Portugal	GTI	Wholesale and retail trade; repair of motor vehicles and motorcycles; transportation and storage; accommodation and food service activities	2023	GVAHRS	0.54	PA	GY	2025-05-26 19:47:29.575039
526	GRC	Greece	F	Construction	2023	GVAHRS	8.30	PA	GY	2025-05-26 19:47:29.575039
527	NLD	Netherlands	K	Financial and insurance activities	2023	GVAHRS	97.80	IX	_Z	2025-05-26 19:47:29.575039
528	SVK	Slovak Republic	M_N	Professional, scientific and technical activities; administrative and support service activities	2023	GVAHRS	103.88	IX	_Z	2025-05-26 19:47:29.575039
529	BEL	Belgium	A	Agriculture, forestry and fishing	2023	GVAHRS	2.74	PA	GY	2025-05-26 19:47:29.575039
530	CAN	Canada	K	Financial and insurance activities	2023	GVAHRS	123.36	IX	_Z	2025-05-26 19:47:29.575039
531	DEU	Germany	A	Agriculture, forestry and fishing	2023	GVAHRS	142.16	IX	_Z	2025-05-26 19:47:29.575039
532	DNK	Denmark	M_N	Professional, scientific and technical activities; administrative and support service activities	2023	GVAHRS	100.77	IX	_Z	2025-05-26 19:47:29.575039
533	ITA	Italy	J	Information and communication	2023	GVAHRS	-2.76	PA	GY	2025-05-26 19:47:29.575039
534	LTU	Lithuania	J	Information and communication	2023	GVAHRS	92.41	IX	_Z	2025-05-26 19:47:29.575039
535	LUX	Luxembourg	F	Construction	2023	GVAHRS	84.95	IX	_Z	2025-05-26 19:47:29.575039
536	GBR	United Kingdom	C	Manufacturing	2023	GVAHRS	2.52	PA	GY	2025-05-26 19:47:29.575039
537	MEX	Mexico	BTE	Industry (except construction)	2023	GVAHRS	-0.31	PA	GY	2025-05-26 19:47:29.575039
538	NOR	Norway	ATU	All ISIC activities	2023	GVAHRS	103.00	IX	_Z	2025-05-26 19:47:29.575039
539	POL	Poland	ATU	All ISIC activities	2023	GVAHRS	2.14	PA	GY	2025-05-26 19:47:29.575039
540	SVK	Slovak Republic	A	Agriculture, forestry and fishing	2023	GVAHRS	20.55	PA	GY	2025-05-26 19:47:29.575039
541	BGR	Bulgaria	J	Information and communication	2023	GVAHRS	107.05	IX	_Z	2025-05-26 19:47:29.575039
542	FIN	Finland	GTNXL	Services of the business economy excluding real estate	2023	GVAHRS	-1.47	PA	GY	2025-05-26 19:47:29.575039
543	NOR	Norway	BTNXL	Business economy excluding real estate	2023	GVAHRS	-0.10	PA	GY	2025-05-26 19:47:29.575039
544	DNK	Denmark	BTNXL	Business economy excluding real estate	2023	GVAHRS	113.93	IX	_Z	2025-05-26 19:47:29.575039
545	HRV	Croatia	BTNXL	Business economy excluding real estate	2023	GVAHRS	0.75	PA	GY	2025-05-26 19:47:29.575039
546	IRL	Ireland	GTNXL	Services of the business economy excluding real estate	2023	GVAHRS	1.91	PA	GY	2025-05-26 19:47:29.575039
547	ROU	Romania	BTNXL	Business economy excluding real estate	2023	GVAHRS	2.18	PA	GY	2025-05-26 19:47:29.575039
548	BGR	Bulgaria	GTNXL	Services of the business economy excluding real estate	2023	GVAHRS	-0.15	PA	GY	2025-05-26 19:47:29.575039
549	LVA	Latvia	GTNXL	Services of the business economy excluding real estate	2023	GVAHRS	127.28	IX	_Z	2025-05-26 19:47:29.575039
550	ESP	Spain	B_D_E	Mining and quarrying; Energy, water supply and waste management services	2023	GVAHRS	-2.42	PA	GY	2025-05-26 19:47:29.575039
551	IRL	Ireland	BTNXL	Business economy excluding real estate	2023	GVAHRS	132.70	IX	_Z	2025-05-26 19:47:29.575039
552	ISL	Iceland	GTNXL	Services of the business economy excluding real estate	2023	GVAHRS	118.94	IX	_Z	2025-05-26 19:47:29.575039
553	ISL	Iceland	B_D_E	Mining and quarrying; Energy, water supply and waste management services	2023	GVAHRS	119.12	IX	_Z	2025-05-26 19:47:29.575039
554	GRC	Greece	B_D_E	Mining and quarrying; Energy, water supply and waste management services	2023	GVAHRS	104.40	IX	_Z	2025-05-26 19:47:29.575039
555	GRC	Greece	BTNXL	Business economy excluding real estate	2023	GVAHRS	97.02	IX	_Z	2025-05-26 19:47:29.575039
556	AUT	Austria	B_D_E	Mining and quarrying; Energy, water supply and waste management services	2023	GVAHRS	107.26	IX	_Z	2025-05-26 19:47:29.575039
557	AUT	Austria	GTNXL	Services of the business economy excluding real estate	2023	GVAHRS	107.98	IX	_Z	2025-05-26 19:47:29.575039
558	CZE	Czechia	B_D_E	Mining and quarrying; Energy, water supply and waste management services	2023	GVAHRS	70.01	IX	_Z	2025-05-26 19:47:29.575039
559	CZE	Czechia	GTNXL	Services of the business economy excluding real estate	2023	GVAHRS	129.69	IX	_Z	2025-05-26 19:47:29.575039
560	LUX	Luxembourg	GTNXL	Services of the business economy excluding real estate	2023	GVAHRS	-5.56	PA	GY	2025-05-26 19:47:29.575039
561	HUN	Hungary	BTNXL	Business economy excluding real estate	2023	GVAHRS	-3.83	PA	GY	2025-05-26 19:47:29.575039
562	FIN	Finland	BTNXL	Business economy excluding real estate	2023	GVAHRS	105.50	IX	_Z	2025-05-26 19:47:29.575039
563	BEL	Belgium	BTNXL	Business economy excluding real estate	2023	GVAHRS	101.24	IX	_Z	2025-05-26 19:47:29.575039
564	MEX	Mexico	B_D_E	Mining and quarrying; Energy, water supply and waste management services	2023	GVAHRS	63.66	IX	_Z	2025-05-26 19:47:29.575039
565	NOR	Norway	BTNXL	Business economy excluding real estate	2023	GVAHRS	104.11	IX	_Z	2025-05-26 19:47:29.575039
566	ESP	Spain	BTNXL	Business economy excluding real estate	2023	GVAHRS	0.30	PA	GY	2025-05-26 19:47:29.575039
567	BGR	Bulgaria	GTNXL	Services of the business economy excluding real estate	2023	GVAHRS	128.23	IX	_Z	2025-05-26 19:47:29.575039
568	FIN	Finland	GTNXL	Services of the business economy excluding real estate	2023	GVAHRS	108.55	IX	_Z	2025-05-26 19:47:29.575039
569	LTU	Lithuania	GTNXL	Services of the business economy excluding real estate	2023	GVAHRS	-3.19	PA	GY	2025-05-26 19:47:29.575039
570	IRL	Ireland	GTNXL	Services of the business economy excluding real estate	2023	GVAHRS	143.95	IX	_Z	2025-05-26 19:47:29.575039
571	LVA	Latvia	BTNXL	Business economy excluding real estate	2023	GVAHRS	124.68	IX	_Z	2025-05-26 19:47:29.575039
572	BEL	Belgium	B_D_E	Mining and quarrying; Energy, water supply and waste management services	2023	GVAHRS	8.55	PA	GY	2025-05-26 19:47:29.575039
573	DNK	Denmark	B_D_E	Mining and quarrying; Energy, water supply and waste management services	2023	GVAHRS	87.02	IX	_Z	2025-05-26 19:47:29.575039
574	ESP	Spain	GTNXL	Services of the business economy excluding real estate	2023	GVAHRS	0.86	PA	GY	2025-05-26 19:47:29.575039
575	MEX	Mexico	GTNXL	Services of the business economy excluding real estate	2023	GVAHRS	1.42	PA	GY	2025-05-26 19:47:29.575039
576	POL	Poland	GTNXL	Services of the business economy excluding real estate	2023	GVAHRS	130.06	IX	_Z	2025-05-26 19:47:29.575039
577	DEU	Germany	GTNXL	Services of the business economy excluding real estate	2023	GVAHRS	111.60	IX	_Z	2025-05-26 19:47:29.575039
578	ISL	Iceland	BTNXL	Business economy excluding real estate	2023	GVAHRS	115.63	IX	_Z	2025-05-26 19:47:29.575039
579	LUX	Luxembourg	B_D_E	Mining and quarrying; Energy, water supply and waste management services	2023	GVAHRS	11.29	PA	GY	2025-05-26 19:47:29.575039
580	PRT	Portugal	GTNXL	Services of the business economy excluding real estate	2023	GVAHRS	107.35	IX	_Z	2025-05-26 19:47:29.575039
581	BEL	Belgium	B_D_E	Mining and quarrying; Energy, water supply and waste management services	2023	GVAHRS	76.72	IX	_Z	2025-05-26 19:47:29.575039
582	CRI	Costa Rica	GTNXL	Services of the business economy excluding real estate	2023	GVAHRS	127.58	IX	_Z	2025-05-26 19:47:29.575039
583	SVN	Slovenia	GTNXL	Services of the business economy excluding real estate	2023	GVAHRS	121.18	IX	_Z	2025-05-26 19:47:29.575039
584	ISL	Iceland	B_D_E	Mining and quarrying; Energy, water supply and waste management services	2023	GVAHRS	-2.98	PA	GY	2025-05-26 19:47:29.575039
585	BGR	Bulgaria	BTNXL	Business economy excluding real estate	2023	GVAHRS	0.18	PA	GY	2025-05-26 19:47:29.575039
586	SWE	Sweden	GTNXL	Services of the business economy excluding real estate	2023	GVAHRS	109.01	IX	_Z	2025-05-26 19:47:29.575039
587	AUT	Austria	GTNXL	Services of the business economy excluding real estate	2023	GVAHRS	-3.36	PA	GY	2025-05-26 19:47:29.575039
588	IRL	Ireland	BTNXL	Business economy excluding real estate	2023	GVAHRS	-8.87	PA	GY	2025-05-26 19:47:29.575039
589	FIN	Finland	BTNXL	Business economy excluding real estate	2023	GVAHRS	-0.91	PA	GY	2025-05-26 19:47:29.575039
590	LVA	Latvia	B_D_E	Mining and quarrying; Energy, water supply and waste management services	2023	GVAHRS	7.88	PA	GY	2025-05-26 19:47:29.575039
591	POL	Poland	GTNXL	Services of the business economy excluding real estate	2023	GVAHRS	-0.73	PA	GY	2025-05-26 19:47:29.575039
592	NLD	Netherlands	GTNXL	Services of the business economy excluding real estate	2023	GVAHRS	106.13	IX	_Z	2025-05-26 19:47:29.575039
593	NOR	Norway	B_D_E	Mining and quarrying; Energy, water supply and waste management services	2023	GVAHRS	-2.81	PA	GY	2025-05-26 19:47:29.575039
594	CZE	Czechia	GTNXL	Services of the business economy excluding real estate	2023	GVAHRS	1.43	PA	GY	2025-05-26 19:47:29.575039
595	CZE	Czechia	BTNXL	Business economy excluding real estate	2023	GVAHRS	-0.27	PA	GY	2025-05-26 19:47:29.575039
596	AUT	Austria	BTNXL	Business economy excluding real estate	2023	GVAHRS	-3.21	PA	GY	2025-05-26 19:47:29.575039
597	FRA	France	B_D_E	Mining and quarrying; Energy, water supply and waste management services	2023	GVAHRS	75.23	IX	_Z	2025-05-26 19:47:29.575039
598	HRV	Croatia	B_D_E	Mining and quarrying; Energy, water supply and waste management services	2023	GVAHRS	90.92	IX	_Z	2025-05-26 19:47:29.575039
599	DEU	Germany	BTNXL	Business economy excluding real estate	2023	GVAHRS	108.01	IX	_Z	2025-05-26 19:47:29.575039
600	GRC	Greece	BTNXL	Business economy excluding real estate	2023	GVAHRS	1.66	PA	GY	2025-05-26 19:47:29.575039
601	LUX	Luxembourg	B_D_E	Mining and quarrying; Energy, water supply and waste management services	2023	GVAHRS	80.83	IX	_Z	2025-05-26 19:47:29.575039
602	LUX	Luxembourg	BTNXL	Business economy excluding real estate	2023	GVAHRS	94.49	IX	_Z	2025-05-26 19:47:29.575039
603	EST	Estonia	B_D_E	Mining and quarrying; Energy, water supply and waste management services	2023	GVAHRS	68.83	IX	_Z	2025-05-26 19:47:29.575039
604	HUN	Hungary	B_D_E	Mining and quarrying; Energy, water supply and waste management services	2023	GVAHRS	67.36	IX	_Z	2025-05-26 19:47:29.575039
605	PRT	Portugal	BTNXL	Business economy excluding real estate	2023	GVAHRS	0.26	PA	GY	2025-05-26 19:47:29.575039
606	GBR	United Kingdom	B_D_E	Mining and quarrying; Energy, water supply and waste management services	2023	GVAHRS	-10.77	PA	GY	2025-05-26 19:47:29.575039
607	GRC	Greece	GTNXL	Services of the business economy excluding real estate	2023	GVAHRS	1.41	PA	GY	2025-05-26 19:47:29.575039
608	CRI	Costa Rica	BTNXL	Business economy excluding real estate	2023	GVAHRS	7.62	PA	GY	2025-05-26 19:47:29.575039
609	ESP	Spain	B_D_E	Mining and quarrying; Energy, water supply and waste management services	2023	GVAHRS	79.94	IX	_Z	2025-05-26 19:47:29.575039
610	LTU	Lithuania	BTNXL	Business economy excluding real estate	2023	GVAHRS	-3.46	PA	GY	2025-05-26 19:47:29.575039
611	HRV	Croatia	GTNXL	Services of the business economy excluding real estate	2023	GVAHRS	117.68	IX	_Z	2025-05-26 19:47:29.575039
612	ROU	Romania	GTNXL	Services of the business economy excluding real estate	2023	GVAHRS	140.96	IX	_Z	2025-05-26 19:47:29.575039
613	SVN	Slovenia	BTNXL	Business economy excluding real estate	2023	GVAHRS	121.36	IX	_Z	2025-05-26 19:47:29.575039
614	CRI	Costa Rica	BTNXL	Business economy excluding real estate	2023	GVAHRS	127.32	IX	_Z	2025-05-26 19:47:29.575039
615	SVK	Slovak Republic	B_D_E	Mining and quarrying; Energy, water supply and waste management services	2023	GVAHRS	98.68	IX	_Z	2025-05-26 19:47:29.575039
616	DEU	Germany	B_D_E	Mining and quarrying; Energy, water supply and waste management services	2023	GVAHRS	-11.21	PA	GY	2025-05-26 19:47:29.575039
617	EST	Estonia	B_D_E	Mining and quarrying; Energy, water supply and waste management services	2023	GVAHRS	-24.60	PA	GY	2025-05-26 19:47:29.575039
618	POL	Poland	BTNXL	Business economy excluding real estate	2023	GVAHRS	1.44	PA	GY	2025-05-26 19:47:29.575039
619	GBR	United Kingdom	GTNXL	Services of the business economy excluding real estate	2023	GVAHRS	0.08	PA	GY	2025-05-26 19:47:29.575039
620	BGR	Bulgaria	B_D_E	Mining and quarrying; Energy, water supply and waste management services	2023	GVAHRS	100.50	IX	_Z	2025-05-26 19:47:29.575039
621	POL	Poland	BTNXL	Business economy excluding real estate	2023	GVAHRS	124.81	IX	_Z	2025-05-26 19:47:29.575039
622	PRT	Portugal	BTNXL	Business economy excluding real estate	2023	GVAHRS	104.99	IX	_Z	2025-05-26 19:47:29.575039
623	SVK	Slovak Republic	GTNXL	Services of the business economy excluding real estate	2023	GVAHRS	-3.64	PA	GY	2025-05-26 19:47:29.575039
624	HUN	Hungary	GTNXL	Services of the business economy excluding real estate	2023	GVAHRS	-3.72	PA	GY	2025-05-26 19:47:29.575039
625	ITA	Italy	GTNXL	Services of the business economy excluding real estate	2023	GVAHRS	106.37	IX	_Z	2025-05-26 19:47:29.575039
626	BEL	Belgium	GTNXL	Services of the business economy excluding real estate	2023	GVAHRS	105.09	IX	_Z	2025-05-26 19:47:29.575039
627	SWE	Sweden	B_D_E	Mining and quarrying; Energy, water supply and waste management services	2023	GVAHRS	-5.92	PA	GY	2025-05-26 19:47:29.575039
628	HUN	Hungary	GTNXL	Services of the business economy excluding real estate	2023	GVAHRS	131.07	IX	_Z	2025-05-26 19:47:29.575039
629	CAN	Canada	BTE	Industry (except construction)	2023	GVAHRS	-3.95	PA	GY	2025-05-26 19:47:29.575039
630	HRV	Croatia	BTE	Industry (except construction)	2023	GVAHRS	102.61	IX	_Z	2025-05-26 19:47:29.575039
631	POL	Poland	F	Construction	2023	GVAHRS	106.40	IX	_Z	2025-05-26 19:47:29.575039
632	BGR	Bulgaria	ATU	All ISIC activities	2023	GVAHRS	125.99	IX	_Z	2025-05-26 19:47:29.575039
633	GBR	United Kingdom	M_N	Professional, scientific and technical activities; administrative and support service activities	2023	GVAHRS	106.35	IX	_Z	2025-05-26 19:47:29.575039
634	ITA	Italy	C	Manufacturing	2023	GVAHRS	-2.37	PA	GY	2025-05-26 19:47:29.575039
635	CZE	Czechia	A	Agriculture, forestry and fishing	2023	GVAHRS	0.90	PA	GY	2025-05-26 19:47:29.575039
636	DNK	Denmark	F	Construction	2023	GVAHRS	101.73	IX	_Z	2025-05-26 19:47:29.575039
637	DNK	Denmark	GTI	Wholesale and retail trade; repair of motor vehicles and motorcycles; transportation and storage; accommodation and food service activities	2023	GVAHRS	110.67	IX	_Z	2025-05-26 19:47:29.575039
638	GRC	Greece	BTE	Industry (except construction)	2023	GVAHRS	101.36	IX	_Z	2025-05-26 19:47:29.575039
639	LVA	Latvia	C	Manufacturing	2023	GVAHRS	2.16	PA	GY	2025-05-26 19:47:29.575039
640	NLD	Netherlands	A	Agriculture, forestry and fishing	2023	GVAHRS	103.34	IX	_Z	2025-05-26 19:47:29.575039
641	CZE	Czechia	M_N	Professional, scientific and technical activities; administrative and support service activities	2023	GVAHRS	-3.51	PA	GY	2025-05-26 19:47:29.575039
642	ESP	Spain	ATU	All ISIC activities	2023	GVAHRS	0.82	PA	GY	2025-05-26 19:47:29.575039
643	NLD	Netherlands	BTE	Industry (except construction)	2023	GVAHRS	-6.29	PA	GY	2025-05-26 19:47:29.575039
644	AUT	Austria	ATU	All ISIC activities	2023	GVAHRS	-2.11	PA	GY	2025-05-26 19:47:29.575039
645	GRC	Greece	A	Agriculture, forestry and fishing	2023	GVAHRS	79.29	IX	_Z	2025-05-26 19:47:29.575039
646	HUN	Hungary	M_N	Professional, scientific and technical activities; administrative and support service activities	2023	GVAHRS	131.24	IX	_Z	2025-05-26 19:47:29.575039
647	IRL	Ireland	J	Information and communication	2023	GVAHRS	212.06	IX	_Z	2025-05-26 19:47:29.575039
648	BEL	Belgium	F	Construction	2023	GVAHRS	-1.50	PA	GY	2025-05-26 19:47:29.575039
649	FRA	France	J	Information and communication	2023	GVAHRS	112.90	IX	_Z	2025-05-26 19:47:29.575039
650	ITA	Italy	GTI	Wholesale and retail trade; repair of motor vehicles and motorcycles; transportation and storage; accommodation and food service activities	2023	GVAHRS	-2.70	PA	GY	2025-05-26 19:47:29.575039
651	DEU	Germany	ATU	All ISIC activities	2023	GVAHRS	-0.05	PA	GY	2025-05-26 19:47:29.575039
652	GRC	Greece	M_N	Professional, scientific and technical activities; administrative and support service activities	2023	GVAHRS	3.68	PA	GY	2025-05-26 19:47:29.575039
653	ITA	Italy	F	Construction	2023	GVAHRS	4.43	PA	GY	2025-05-26 19:47:29.575039
654	LTU	Lithuania	K	Financial and insurance activities	2023	GVAHRS	13.26	PA	GY	2025-05-26 19:47:29.575039
655	LUX	Luxembourg	BTE	Industry (except construction)	2023	GVAHRS	7.12	PA	GY	2025-05-26 19:47:29.575039
656	CRI	Costa Rica	B_D_E	Mining and quarrying; Energy, water supply and waste management services	2023	GVAHRS	-13.29	PA	GY	2025-05-26 19:47:29.575039
657	IRL	Ireland	B_D_E	Mining and quarrying; Energy, water supply and waste management services	2023	GVAHRS	85.17	IX	_Z	2025-05-26 19:47:29.575039
658	NLD	Netherlands	B_D_E	Mining and quarrying; Energy, water supply and waste management services	2023	GVAHRS	-16.04	PA	GY	2025-05-26 19:47:29.575039
659	SVN	Slovenia	B_D_E	Mining and quarrying; Energy, water supply and waste management services	2023	GVAHRS	22.57	PA	GY	2025-05-26 19:47:29.575039
660	LTU	Lithuania	GTNXL	Services of the business economy excluding real estate	2023	GVAHRS	120.07	IX	_Z	2025-05-26 19:47:29.575039
661	GBR	United Kingdom	B_D_E	Mining and quarrying; Energy, water supply and waste management services	2023	GVAHRS	80.97	IX	_Z	2025-05-26 19:47:29.575039
662	FRA	France	GTNXL	Services of the business economy excluding real estate	2023	GVAHRS	0.14	PA	GY	2025-05-26 19:47:29.575039
663	EST	Estonia	BTNXL	Business economy excluding real estate	2023	GVAHRS	122.42	IX	_Z	2025-05-26 19:47:29.575039
664	AUT	Austria	BTNXL	Business economy excluding real estate	2023	GVAHRS	106.29	IX	_Z	2025-05-26 19:47:29.575039
665	NLD	Netherlands	BTNXL	Business economy excluding real estate	2023	GVAHRS	-1.95	PA	GY	2025-05-26 19:47:29.575039
666	GBR	United Kingdom	BTNXL	Business economy excluding real estate	2023	GVAHRS	107.29	IX	_Z	2025-05-26 19:47:29.575039
667	LUX	Luxembourg	BTNXL	Business economy excluding real estate	2023	GVAHRS	-4.18	PA	GY	2025-05-26 19:47:29.575039
668	MEX	Mexico	BTNXL	Business economy excluding real estate	2023	GVAHRS	90.74	IX	_Z	2025-05-26 19:47:29.575039
669	NOR	Norway	B_D_E	Mining and quarrying; Energy, water supply and waste management services	2023	GVAHRS	101.82	IX	_Z	2025-05-26 19:47:29.575039
670	SVN	Slovenia	GTNXL	Services of the business economy excluding real estate	2023	GVAHRS	0.42	PA	GY	2025-05-26 19:47:29.575039
671	SWE	Sweden	BTNXL	Business economy excluding real estate	2023	GVAHRS	107.72	IX	_Z	2025-05-26 19:47:29.575039
672	SWE	Sweden	B_D_E	Mining and quarrying; Energy, water supply and waste management services	2023	GVAHRS	78.94	IX	_Z	2025-05-26 19:47:29.575039
673	GRC	Greece	GTNXL	Services of the business economy excluding real estate	2023	GVAHRS	94.05	IX	_Z	2025-05-26 19:47:29.575039
674	NLD	Netherlands	GTNXL	Services of the business economy excluding real estate	2023	GVAHRS	-0.75	PA	GY	2025-05-26 19:47:29.575039
675	EST	Estonia	BTNXL	Business economy excluding real estate	2023	GVAHRS	-7.66	PA	GY	2025-05-26 19:47:29.575039
676	BGR	Bulgaria	BTNXL	Business economy excluding real estate	2023	GVAHRS	123.24	IX	_Z	2025-05-26 19:47:29.575039
677	HRV	Croatia	B_D_E	Mining and quarrying; Energy, water supply and waste management services	2023	GVAHRS	-3.00	PA	GY	2025-05-26 19:47:29.575039
678	GBR	United Kingdom	GTNXL	Services of the business economy excluding real estate	2023	GVAHRS	108.35	IX	_Z	2025-05-26 19:47:29.575039
679	SVN	Slovenia	BTNXL	Business economy excluding real estate	2023	GVAHRS	2.71	PA	GY	2025-05-26 19:47:29.575039
680	FRA	France	B_D_E	Mining and quarrying; Energy, water supply and waste management services	2023	GVAHRS	21.82	PA	GY	2025-05-26 19:47:29.575039
681	LVA	Latvia	B_D_E	Mining and quarrying; Energy, water supply and waste management services	2023	GVAHRS	108.31	IX	_Z	2025-05-26 19:47:29.575039
682	SVK	Slovak Republic	BTNXL	Business economy excluding real estate	2023	GVAHRS	113.90	IX	_Z	2025-05-26 19:47:29.575039
683	POL	Poland	B_D_E	Mining and quarrying; Energy, water supply and waste management services	2023	GVAHRS	4.79	PA	GY	2025-05-26 19:47:29.575039
684	FIN	Finland	B_D_E	Mining and quarrying; Energy, water supply and waste management services	2023	GVAHRS	8.62	PA	GY	2025-05-26 19:47:29.575039
685	NOR	Norway	GTNXL	Services of the business economy excluding real estate	2023	GVAHRS	108.66	IX	_Z	2025-05-26 19:47:29.575039
686	ROU	Romania	B_D_E	Mining and quarrying; Energy, water supply and waste management services	2023	GVAHRS	11.48	PA	GY	2025-05-26 19:47:29.575039
687	SVK	Slovak Republic	GTNXL	Services of the business economy excluding real estate	2023	GVAHRS	114.48	IX	_Z	2025-05-26 19:47:29.575039
688	SVK	Slovak Republic	BTNXL	Business economy excluding real estate	2023	GVAHRS	3.86	PA	GY	2025-05-26 19:47:29.575039
689	BGR	Bulgaria	B_D_E	Mining and quarrying; Energy, water supply and waste management services	2023	GVAHRS	-1.47	PA	GY	2025-05-26 19:47:29.575039
690	HUN	Hungary	B_D_E	Mining and quarrying; Energy, water supply and waste management services	2023	GVAHRS	-14.96	PA	GY	2025-05-26 19:47:29.575039
691	LTU	Lithuania	B_D_E	Mining and quarrying; Energy, water supply and waste management services	2023	GVAHRS	-5.87	PA	GY	2025-05-26 19:47:29.575039
692	BEL	Belgium	GTNXL	Services of the business economy excluding real estate	2023	GVAHRS	-0.59	PA	GY	2025-05-26 19:47:29.575039
693	DEU	Germany	BTNXL	Business economy excluding real estate	2023	GVAHRS	-0.50	PA	GY	2025-05-26 19:47:29.575039
694	ITA	Italy	BTNXL	Business economy excluding real estate	2023	GVAHRS	105.10	IX	_Z	2025-05-26 19:47:29.575039
695	LTU	Lithuania	B_D_E	Mining and quarrying; Energy, water supply and waste management services	2023	GVAHRS	90.17	IX	_Z	2025-05-26 19:47:29.575039
696	DNK	Denmark	GTNXL	Services of the business economy excluding real estate	2023	GVAHRS	106.77	IX	_Z	2025-05-26 19:47:29.575039
697	EST	Estonia	GTNXL	Services of the business economy excluding real estate	2023	GVAHRS	-7.65	PA	GY	2025-05-26 19:47:29.575039
698	ITA	Italy	BTNXL	Business economy excluding real estate	2023	GVAHRS	-2.77	PA	GY	2025-05-26 19:47:29.575039
699	POL	Poland	B_D_E	Mining and quarrying; Energy, water supply and waste management services	2023	GVAHRS	117.26	IX	_Z	2025-05-26 19:47:29.575039
700	MEX	Mexico	GTNXL	Services of the business economy excluding real estate	2023	GVAHRS	93.09	IX	_Z	2025-05-26 19:47:29.575039
701	DNK	Denmark	GTNXL	Services of the business economy excluding real estate	2023	GVAHRS	-0.44	PA	GY	2025-05-26 19:47:29.575039
702	HRV	Croatia	GTNXL	Services of the business economy excluding real estate	2023	GVAHRS	0.96	PA	GY	2025-05-26 19:47:29.575039
703	LTU	Lithuania	BTNXL	Business economy excluding real estate	2023	GVAHRS	117.60	IX	_Z	2025-05-26 19:47:29.575039
704	ROU	Romania	B_D_E	Mining and quarrying; Energy, water supply and waste management services	2023	GVAHRS	80.02	IX	_Z	2025-05-26 19:47:29.575039
705	GBR	United Kingdom	BTNXL	Business economy excluding real estate	2023	GVAHRS	0.12	PA	GY	2025-05-26 19:47:29.575039
706	EST	Estonia	GTNXL	Services of the business economy excluding real estate	2023	GVAHRS	123.67	IX	_Z	2025-05-26 19:47:29.575039
707	ESP	Spain	GTNXL	Services of the business economy excluding real estate	2023	GVAHRS	111.59	IX	_Z	2025-05-26 19:47:29.575039
708	FRA	France	BTNXL	Business economy excluding real estate	2023	GVAHRS	1.29	PA	GY	2025-05-26 19:47:29.575039
709	HUN	Hungary	BTNXL	Business economy excluding real estate	2023	GVAHRS	112.40	IX	_Z	2025-05-26 19:47:29.575039
710	ROU	Romania	GTNXL	Services of the business economy excluding real estate	2023	GVAHRS	2.69	PA	GY	2025-05-26 19:47:29.575039
711	HRV	Croatia	BTNXL	Business economy excluding real estate	2023	GVAHRS	113.44	IX	_Z	2025-05-26 19:47:29.575039
712	LUX	Luxembourg	GTNXL	Services of the business economy excluding real estate	2023	GVAHRS	93.17	IX	_Z	2025-05-26 19:47:29.575039
713	NOR	Norway	GTNXL	Services of the business economy excluding real estate	2023	GVAHRS	0.28	PA	GY	2025-05-26 19:47:29.575039
714	PRT	Portugal	GTNXL	Services of the business economy excluding real estate	2023	GVAHRS	1.17	PA	GY	2025-05-26 19:47:29.575039
715	ISL	Iceland	GTNXL	Services of the business economy excluding real estate	2023	GVAHRS	2.35	PA	GY	2025-05-26 19:47:29.575039
716	PRT	Portugal	B_D_E	Mining and quarrying; Energy, water supply and waste management services	2023	GVAHRS	10.84	PA	GY	2025-05-26 19:47:29.575039
717	CZE	Czechia	B_D_E	Mining and quarrying; Energy, water supply and waste management services	2023	GVAHRS	-21.29	PA	GY	2025-05-26 19:47:29.575039
718	SWE	Sweden	GTNXL	Services of the business economy excluding real estate	2023	GVAHRS	0.18	PA	GY	2025-05-26 19:47:29.575039
719	GRC	Greece	B_D_E	Mining and quarrying; Energy, water supply and waste management services	2023	GVAHRS	3.96	PA	GY	2025-05-26 19:47:29.575039
720	ITA	Italy	B_D_E	Mining and quarrying; Energy, water supply and waste management services	2023	GVAHRS	-7.48	PA	GY	2025-05-26 19:47:29.575039
721	LVA	Latvia	GTNXL	Services of the business economy excluding real estate	2023	GVAHRS	0.69	PA	GY	2025-05-26 19:47:29.575039
722	IRL	Ireland	B_D_E	Mining and quarrying; Energy, water supply and waste management services	2023	GVAHRS	58.90	PA	GY	2025-05-26 19:47:29.575039
723	FRA	France	GTNXL	Services of the business economy excluding real estate	2023	GVAHRS	100.13	IX	_Z	2025-05-26 19:47:29.575039
724	SWE	Sweden	BTNXL	Business economy excluding real estate	2023	GVAHRS	-1.41	PA	GY	2025-05-26 19:47:29.575039
725	CRI	Costa Rica	GTNXL	Services of the business economy excluding real estate	2023	GVAHRS	9.14	PA	GY	2025-05-26 19:47:29.575039
726	LVA	Latvia	BTNXL	Business economy excluding real estate	2023	GVAHRS	2.79	PA	GY	2025-05-26 19:47:29.575039
727	SVN	Slovenia	B_D_E	Mining and quarrying; Energy, water supply and waste management services	2023	GVAHRS	139.48	IX	_Z	2025-05-26 19:47:29.575039
728	DEU	Germany	GTNXL	Services of the business economy excluding real estate	2023	GVAHRS	-0.65	PA	GY	2025-05-26 19:47:29.575039
729	DNK	Denmark	BTNXL	Business economy excluding real estate	2023	GVAHRS	3.01	PA	GY	2025-05-26 19:47:29.575039
730	ITA	Italy	B_D_E	Mining and quarrying; Energy, water supply and waste management services	2023	GVAHRS	85.74	IX	_Z	2025-05-26 19:47:29.575039
731	FIN	Finland	B_D_E	Mining and quarrying; Energy, water supply and waste management services	2023	GVAHRS	105.71	IX	_Z	2025-05-26 19:47:29.575039
732	DEU	Germany	B_D_E	Mining and quarrying; Energy, water supply and waste management services	2023	GVAHRS	63.31	IX	_Z	2025-05-26 19:47:29.575039
733	AUT	Austria	B_D_E	Mining and quarrying; Energy, water supply and waste management services	2023	GVAHRS	1.08	PA	GY	2025-05-26 19:47:29.575039
734	SVK	Slovak Republic	B_D_E	Mining and quarrying; Energy, water supply and waste management services	2023	GVAHRS	37.65	PA	GY	2025-05-26 19:47:29.575039
735	MEX	Mexico	B_D_E	Mining and quarrying; Energy, water supply and waste management services	2023	GVAHRS	2.44	PA	GY	2025-05-26 19:47:29.575039
736	BEL	Belgium	BTNXL	Business economy excluding real estate	2023	GVAHRS	-0.49	PA	GY	2025-05-26 19:47:29.575039
737	CRI	Costa Rica	B_D_E	Mining and quarrying; Energy, water supply and waste management services	2023	GVAHRS	136.04	IX	_Z	2025-05-26 19:47:29.575039
738	MEX	Mexico	BTNXL	Business economy excluding real estate	2023	GVAHRS	1.37	PA	GY	2025-05-26 19:47:29.575039
739	ITA	Italy	GTNXL	Services of the business economy excluding real estate	2023	GVAHRS	-3.48	PA	GY	2025-05-26 19:47:29.575039
740	ESP	Spain	BTNXL	Business economy excluding real estate	2023	GVAHRS	105.24	IX	_Z	2025-05-26 19:47:29.575039
\.


--
-- Name: oecd_productivity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oecd_user
--

SELECT pg_catalog.setval('public.oecd_productivity_id_seq', 740, true);


--
-- Name: oecd_productivity oecd_productivity_pkey; Type: CONSTRAINT; Schema: public; Owner: oecd_user
--

ALTER TABLE ONLY public.oecd_productivity
    ADD CONSTRAINT oecd_productivity_pkey PRIMARY KEY (id);


--
-- Name: idx_productivity_country_year; Type: INDEX; Schema: public; Owner: oecd_user
--

CREATE INDEX idx_productivity_country_year ON public.oecd_productivity USING btree (country_code, year);


--
-- PostgreSQL database dump complete
--

