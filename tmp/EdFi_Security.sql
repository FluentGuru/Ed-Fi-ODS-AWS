--
-- PostgreSQL database dump
--

-- Dumped from database version 11.6
-- Dumped by pg_dump version 12.2

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

--
-- Name: dbo; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA dbo;


ALTER SCHEMA dbo OWNER TO postgres;

SET default_tablespace = '';

--
-- Name: actions; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo.actions (
    actionid integer NOT NULL,
    actionname character varying(255) NOT NULL,
    actionuri character varying(2048) NOT NULL
);


ALTER TABLE dbo.actions OWNER TO postgres;

--
-- Name: actions_actionid_seq; Type: SEQUENCE; Schema: dbo; Owner: postgres
--

CREATE SEQUENCE dbo.actions_actionid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE dbo.actions_actionid_seq OWNER TO postgres;

--
-- Name: actions_actionid_seq; Type: SEQUENCE OWNED BY; Schema: dbo; Owner: postgres
--

ALTER SEQUENCE dbo.actions_actionid_seq OWNED BY dbo.actions.actionid;


--
-- Name: applications; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo.applications (
    applicationid integer NOT NULL,
    applicationname character varying
);


ALTER TABLE dbo.applications OWNER TO postgres;

--
-- Name: applications_applicationid_seq; Type: SEQUENCE; Schema: dbo; Owner: postgres
--

CREATE SEQUENCE dbo.applications_applicationid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE dbo.applications_applicationid_seq OWNER TO postgres;

--
-- Name: applications_applicationid_seq; Type: SEQUENCE OWNED BY; Schema: dbo; Owner: postgres
--

ALTER SEQUENCE dbo.applications_applicationid_seq OWNED BY dbo.applications.applicationid;


--
-- Name: authorizationstrategies; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo.authorizationstrategies (
    authorizationstrategyid integer NOT NULL,
    displayname character varying(255) NOT NULL,
    authorizationstrategyname character varying(255) NOT NULL,
    application_applicationid integer NOT NULL
);


ALTER TABLE dbo.authorizationstrategies OWNER TO postgres;

--
-- Name: authorizationstrategies_authorizationstrategyid_seq; Type: SEQUENCE; Schema: dbo; Owner: postgres
--

CREATE SEQUENCE dbo.authorizationstrategies_authorizationstrategyid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE dbo.authorizationstrategies_authorizationstrategyid_seq OWNER TO postgres;

--
-- Name: authorizationstrategies_authorizationstrategyid_seq; Type: SEQUENCE OWNED BY; Schema: dbo; Owner: postgres
--

ALTER SEQUENCE dbo.authorizationstrategies_authorizationstrategyid_seq OWNED BY dbo.authorizationstrategies.authorizationstrategyid;


--
-- Name: claimsetresourceclaims; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo.claimsetresourceclaims (
    claimsetresourceclaimid integer NOT NULL,
    action_actionid integer NOT NULL,
    claimset_claimsetid integer NOT NULL,
    resourceclaim_resourceclaimid integer NOT NULL,
    authorizationstrategyoverride_authorizationstrategyid integer,
    validationrulesetnameoverride character varying(255)
);


ALTER TABLE dbo.claimsetresourceclaims OWNER TO postgres;

--
-- Name: claimsetresourceclaims_claimsetresourceclaimid_seq; Type: SEQUENCE; Schema: dbo; Owner: postgres
--

CREATE SEQUENCE dbo.claimsetresourceclaims_claimsetresourceclaimid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE dbo.claimsetresourceclaims_claimsetresourceclaimid_seq OWNER TO postgres;

--
-- Name: claimsetresourceclaims_claimsetresourceclaimid_seq; Type: SEQUENCE OWNED BY; Schema: dbo; Owner: postgres
--

ALTER SEQUENCE dbo.claimsetresourceclaims_claimsetresourceclaimid_seq OWNED BY dbo.claimsetresourceclaims.claimsetresourceclaimid;


--
-- Name: claimsets; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo.claimsets (
    claimsetid integer NOT NULL,
    claimsetname character varying(255) NOT NULL,
    application_applicationid integer NOT NULL
);


ALTER TABLE dbo.claimsets OWNER TO postgres;

--
-- Name: claimsets_claimsetid_seq; Type: SEQUENCE; Schema: dbo; Owner: postgres
--

CREATE SEQUENCE dbo.claimsets_claimsetid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE dbo.claimsets_claimsetid_seq OWNER TO postgres;

--
-- Name: claimsets_claimsetid_seq; Type: SEQUENCE OWNED BY; Schema: dbo; Owner: postgres
--

ALTER SEQUENCE dbo.claimsets_claimsetid_seq OWNED BY dbo.claimsets.claimsetid;


--
-- Name: resourceclaimauthorizationmetadatas; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo.resourceclaimauthorizationmetadatas (
    resourceclaimauthorizationstrategyid integer NOT NULL,
    action_actionid integer NOT NULL,
    authorizationstrategy_authorizationstrategyid integer,
    resourceclaim_resourceclaimid integer NOT NULL,
    validationrulesetname character varying(255)
);


ALTER TABLE dbo.resourceclaimauthorizationmetadatas OWNER TO postgres;

--
-- Name: resourceclaimauthorizationmet_resourceclaimauthorizationstr_seq; Type: SEQUENCE; Schema: dbo; Owner: postgres
--

CREATE SEQUENCE dbo.resourceclaimauthorizationmet_resourceclaimauthorizationstr_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE dbo.resourceclaimauthorizationmet_resourceclaimauthorizationstr_seq OWNER TO postgres;

--
-- Name: resourceclaimauthorizationmet_resourceclaimauthorizationstr_seq; Type: SEQUENCE OWNED BY; Schema: dbo; Owner: postgres
--

ALTER SEQUENCE dbo.resourceclaimauthorizationmet_resourceclaimauthorizationstr_seq OWNED BY dbo.resourceclaimauthorizationmetadatas.resourceclaimauthorizationstrategyid;


--
-- Name: resourceclaims; Type: TABLE; Schema: dbo; Owner: postgres
--

CREATE TABLE dbo.resourceclaims (
    resourceclaimid integer NOT NULL,
    displayname character varying(255) NOT NULL,
    resourcename character varying(2048) NOT NULL,
    claimname character varying(2048) NOT NULL,
    parentresourceclaimid integer,
    application_applicationid integer NOT NULL
);


ALTER TABLE dbo.resourceclaims OWNER TO postgres;

--
-- Name: resourceclaims_resourceclaimid_seq; Type: SEQUENCE; Schema: dbo; Owner: postgres
--

CREATE SEQUENCE dbo.resourceclaims_resourceclaimid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE dbo.resourceclaims_resourceclaimid_seq OWNER TO postgres;

--
-- Name: resourceclaims_resourceclaimid_seq; Type: SEQUENCE OWNED BY; Schema: dbo; Owner: postgres
--

ALTER SEQUENCE dbo.resourceclaims_resourceclaimid_seq OWNED BY dbo.resourceclaims.resourceclaimid;


--
-- Name: DeployJournal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."DeployJournal" (
    schemaversionsid integer NOT NULL,
    scriptname character varying(255) NOT NULL,
    applied timestamp without time zone NOT NULL
);


ALTER TABLE public."DeployJournal" OWNER TO postgres;

--
-- Name: DeployJournal_schemaversionsid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."DeployJournal_schemaversionsid_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."DeployJournal_schemaversionsid_seq" OWNER TO postgres;

--
-- Name: DeployJournal_schemaversionsid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."DeployJournal_schemaversionsid_seq" OWNED BY public."DeployJournal".schemaversionsid;


--
-- Name: actions actionid; Type: DEFAULT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo.actions ALTER COLUMN actionid SET DEFAULT nextval('dbo.actions_actionid_seq'::regclass);


--
-- Name: applications applicationid; Type: DEFAULT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo.applications ALTER COLUMN applicationid SET DEFAULT nextval('dbo.applications_applicationid_seq'::regclass);


--
-- Name: authorizationstrategies authorizationstrategyid; Type: DEFAULT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo.authorizationstrategies ALTER COLUMN authorizationstrategyid SET DEFAULT nextval('dbo.authorizationstrategies_authorizationstrategyid_seq'::regclass);


--
-- Name: claimsetresourceclaims claimsetresourceclaimid; Type: DEFAULT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo.claimsetresourceclaims ALTER COLUMN claimsetresourceclaimid SET DEFAULT nextval('dbo.claimsetresourceclaims_claimsetresourceclaimid_seq'::regclass);


--
-- Name: claimsets claimsetid; Type: DEFAULT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo.claimsets ALTER COLUMN claimsetid SET DEFAULT nextval('dbo.claimsets_claimsetid_seq'::regclass);


--
-- Name: resourceclaimauthorizationmetadatas resourceclaimauthorizationstrategyid; Type: DEFAULT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo.resourceclaimauthorizationmetadatas ALTER COLUMN resourceclaimauthorizationstrategyid SET DEFAULT nextval('dbo.resourceclaimauthorizationmet_resourceclaimauthorizationstr_seq'::regclass);


--
-- Name: resourceclaims resourceclaimid; Type: DEFAULT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo.resourceclaims ALTER COLUMN resourceclaimid SET DEFAULT nextval('dbo.resourceclaims_resourceclaimid_seq'::regclass);


--
-- Name: DeployJournal schemaversionsid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DeployJournal" ALTER COLUMN schemaversionsid SET DEFAULT nextval('public."DeployJournal_schemaversionsid_seq"'::regclass);


--
-- Data for Name: actions; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo.actions (actionid, actionname, actionuri) FROM stdin;
1	Create	http://ed-fi.org/odsapi/actions/create
2	Read	http://ed-fi.org/odsapi/actions/read
3	Update	http://ed-fi.org/odsapi/actions/update
4	Delete	http://ed-fi.org/odsapi/actions/delete
\.


--
-- Data for Name: applications; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo.applications (applicationid, applicationname) FROM stdin;
1	Ed-Fi ODS API
\.


--
-- Data for Name: authorizationstrategies; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo.authorizationstrategies (authorizationstrategyid, displayname, authorizationstrategyname, application_applicationid) FROM stdin;
1	No Further Authorization Required	NoFurtherAuthorizationRequired	1
2	Relationships with Education Organizations and People	RelationshipsWithEdOrgsAndPeople	1
3	Relationships with Education Organizations only	RelationshipsWithEdOrgsOnly	1
4	Namespace Based	NamespaceBased	1
5	Relationships with People only	RelationshipsWithPeopleOnly	1
6	Relationships with Students only	RelationshipsWithStudentsOnly	1
7	Relationships with Students only (through StudentEducationOrganizationResponsibilityAssociation)	RelationshipsWithStudentsOnlyThroughResponsibility	1
\.


--
-- Data for Name: claimsetresourceclaims; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo.claimsetresourceclaims (claimsetresourceclaimid, action_actionid, claimset_claimsetid, resourceclaim_resourceclaimid, authorizationstrategyoverride_authorizationstrategyid, validationrulesetnameoverride) FROM stdin;
1	1	1	10	\N	\N
2	3	1	9	\N	\N
3	2	1	6	\N	\N
4	2	1	10	\N	\N
5	4	1	6	\N	\N
6	1	1	9	\N	\N
7	2	1	5	\N	\N
8	1	1	97	\N	\N
9	1	1	7	\N	\N
10	3	1	7	\N	\N
11	4	1	7	\N	\N
12	4	1	9	\N	\N
13	2	1	1	\N	\N
14	2	1	3	\N	\N
15	1	1	6	\N	\N
16	1	1	3	\N	\N
17	3	1	6	\N	\N
18	3	1	3	\N	\N
19	3	1	10	\N	\N
20	2	1	4	\N	\N
21	2	1	2	\N	\N
22	3	1	97	\N	\N
23	4	1	5	\N	\N
24	4	1	3	\N	\N
25	4	1	97	\N	\N
26	3	1	5	\N	\N
27	2	1	97	\N	\N
28	4	1	10	\N	\N
29	2	1	7	\N	\N
30	2	1	9	\N	\N
31	1	1	5	\N	\N
32	1	2	4	\N	\N
33	2	2	4	\N	\N
34	4	2	6	\N	\N
35	2	2	8	\N	\N
36	4	2	4	\N	\N
37	3	2	2	\N	\N
38	1	2	11	\N	\N
39	3	2	9	\N	\N
40	4	2	5	\N	\N
41	3	2	10	\N	\N
42	1	2	3	\N	\N
43	1	2	10	\N	\N
44	3	2	4	\N	\N
45	3	2	8	\N	\N
46	1	2	6	\N	\N
47	4	2	3	\N	\N
48	3	2	97	\N	\N
49	2	2	6	\N	\N
50	4	2	11	\N	\N
51	2	2	10	\N	\N
52	4	2	10	\N	\N
53	3	2	5	\N	\N
54	4	2	7	\N	\N
55	1	2	9	\N	\N
56	4	2	2	\N	\N
57	2	2	5	\N	\N
58	1	2	5	\N	\N
59	3	2	3	\N	\N
60	1	2	2	\N	\N
61	1	2	97	\N	\N
62	3	2	11	\N	\N
63	2	2	11	\N	\N
64	1	2	8	\N	\N
65	2	2	9	\N	\N
66	2	2	3	\N	\N
67	3	2	6	\N	\N
68	3	2	7	\N	\N
69	1	2	7	\N	\N
70	2	2	2	\N	\N
71	2	2	7	\N	\N
72	4	2	97	\N	\N
73	4	2	9	\N	\N
74	2	2	1	\N	\N
75	2	2	97	\N	\N
76	1	2	59	1	\N
77	2	2	59	1	\N
78	3	2	59	1	\N
79	4	2	59	1	\N
80	2	3	4	\N	\N
81	2	3	51	\N	\N
82	2	3	68	\N	\N
83	2	3	74	\N	\N
84	2	3	157	\N	\N
85	2	3	224	\N	\N
86	2	3	230	\N	\N
87	2	3	235	\N	\N
88	2	3	240	\N	\N
89	2	3	248	\N	\N
90	2	3	251	\N	\N
91	2	3	276	\N	\N
92	2	3	279	\N	\N
100	2	5	7	\N	\N
101	2	5	144	\N	\N
102	2	5	145	\N	\N
103	2	5	251	\N	\N
104	1	6	2	1	\N
105	1	6	3	1	\N
106	1	6	4	1	\N
107	1	6	18	1	\N
108	1	6	51	1	\N
111	1	6	59	1	\N
112	1	6	68	1	\N
115	1	6	103	1	\N
117	1	6	112	1	\N
118	1	6	144	1	\N
119	1	6	145	1	\N
120	1	6	147	1	\N
122	1	6	157	1	\N
124	1	6	191	1	\N
127	2	7	1	\N	\N
128	2	7	2	\N	\N
129	1	7	3	\N	\N
130	2	7	3	\N	\N
131	3	7	3	\N	\N
132	4	7	3	\N	\N
133	2	7	4	\N	\N
134	1	7	5	\N	\N
135	2	7	5	\N	\N
136	3	7	5	\N	\N
137	4	7	5	\N	\N
138	1	7	6	\N	\N
139	2	7	6	\N	\N
140	3	7	6	\N	\N
141	4	7	6	\N	\N
142	1	7	7	\N	\N
143	2	7	7	\N	\N
144	3	7	7	\N	\N
145	4	7	7	\N	\N
146	1	7	9	\N	\N
147	2	7	9	\N	\N
148	3	7	9	\N	\N
149	4	7	9	\N	\N
150	1	7	10	\N	\N
151	2	7	10	\N	\N
152	3	7	10	\N	\N
153	4	7	10	\N	\N
154	1	7	97	\N	\N
155	2	7	97	\N	\N
156	3	7	97	\N	\N
157	4	7	97	\N	\N
158	1	7	218	\N	\N
159	2	7	218	\N	\N
160	3	7	218	\N	\N
161	4	7	218	\N	\N
162	2	7	155	\N	\N
163	3	7	155	\N	\N
164	1	4	14	\N	\N
165	2	4	14	\N	\N
166	3	4	14	\N	\N
167	4	4	14	\N	\N
168	1	4	7	\N	\N
169	2	4	7	\N	\N
170	3	4	7	\N	\N
171	4	4	7	\N	\N
172	1	4	144	\N	\N
173	2	4	144	\N	\N
174	3	4	144	\N	\N
175	4	4	144	\N	\N
177	1	4	3	\N	\N
178	2	4	3	\N	\N
179	3	4	3	\N	\N
180	4	4	3	\N	\N
181	2	4	251	\N	\N
182	2	4	2	\N	\N
183	2	4	1	\N	\N
196	1	4	145	\N	\N
197	2	4	145	\N	\N
198	3	4	145	\N	\N
199	4	4	145	\N	\N
200	1	8	2	1	\N
201	1	8	3	1	\N
202	1	8	4	1	\N
203	2	8	2	1	\N
204	2	8	3	1	\N
205	2	8	4	1	\N
206	3	8	2	1	\N
207	3	8	3	1	\N
208	3	8	4	1	\N
209	4	8	2	1	\N
210	4	8	3	1	\N
211	4	8	4	1	\N
212	2	8	1	1	\N
213	1	9	9	\N	\N
214	2	9	9	\N	\N
215	3	9	9	\N	\N
216	4	9	9	\N	\N
217	1	9	14	\N	\N
218	2	9	14	\N	\N
219	3	9	14	\N	\N
220	4	9	14	\N	\N
221	1	9	116	\N	\N
222	2	9	116	\N	\N
223	3	9	116	\N	\N
224	4	9	116	\N	\N
225	1	9	201	\N	\N
226	2	9	201	\N	\N
227	3	9	201	\N	\N
228	4	9	201	\N	\N
229	1	4	177	\N	\N
230	2	4	177	\N	\N
231	1	2	309	\N	\N
232	2	2	309	\N	\N
233	3	2	309	\N	\N
234	4	2	309	\N	\N
235	1	6	325	\N	\N
236	1	10	4	\N	\N
237	2	10	4	\N	\N
238	3	10	4	\N	\N
239	4	10	4	\N	\N
240	1	10	11	\N	\N
241	2	10	11	\N	\N
242	3	10	11	\N	\N
243	4	10	11	\N	\N
244	1	10	77	\N	\N
245	2	10	77	\N	\N
246	3	10	77	\N	\N
247	4	10	77	\N	\N
248	1	10	178	\N	\N
249	2	10	178	\N	\N
250	3	10	178	\N	\N
251	4	10	178	\N	\N
252	1	10	251	\N	\N
253	2	10	251	\N	\N
254	3	10	251	\N	\N
255	4	10	251	\N	\N
256	1	10	276	\N	\N
257	2	10	276	\N	\N
258	3	10	276	\N	\N
259	4	10	276	\N	\N
260	1	10	310	\N	\N
261	2	10	310	\N	\N
262	3	10	310	\N	\N
263	4	10	310	\N	\N
264	1	10	321	\N	\N
265	2	10	321	\N	\N
266	3	10	321	\N	\N
267	4	10	321	\N	\N
268	1	10	345	\N	\N
269	2	10	345	\N	\N
270	3	10	345	\N	\N
271	4	10	345	\N	\N
272	2	10	2	\N	\N
\.


--
-- Data for Name: claimsets; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo.claimsets (claimsetid, claimsetname, application_applicationid) FROM stdin;
1	SIS Vendor	1
2	Ed-Fi Sandbox	1
3	Roster Vendor	1
4	Assessment Vendor	1
5	Assessment Read	1
6	Bootstrap Descriptors and EdOrgs	1
7	District Hosted SIS Vendor	1
8	Ed-Fi ODS Admin App	1
9	AB Connect	1
10	Education Preparation Program	1
\.


--
-- Data for Name: resourceclaimauthorizationmetadatas; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo.resourceclaimauthorizationmetadatas (resourceclaimauthorizationstrategyid, action_actionid, authorizationstrategy_authorizationstrategyid, resourceclaim_resourceclaimid, validationrulesetname) FROM stdin;
1	1	1	178	\N
2	1	1	77	\N
3	3	1	4	\N
4	2	1	1	\N
5	3	1	178	\N
6	1	1	5	\N
7	3	1	77	\N
8	2	1	68	\N
9	4	1	77	\N
10	2	1	4	\N
11	4	1	5	\N
12	1	1	8	\N
13	2	1	8	\N
14	2	1	3	\N
15	4	1	178	\N
16	4	1	4	\N
17	3	1	8	\N
18	1	1	4	\N
19	2	1	77	\N
20	2	1	178	\N
21	2	1	2	\N
22	3	4	9	\N
23	3	4	97	\N
24	4	4	3	\N
26	1	4	11	\N
27	3	4	3	\N
28	2	4	7	\N
29	3	4	7	\N
30	1	4	7	\N
31	3	4	11	\N
32	1	4	2	\N
33	2	4	97	\N
34	4	4	11	\N
35	2	4	11	\N
36	4	4	2	\N
37	4	4	7	\N
38	3	4	2	\N
39	1	4	9	\N
40	1	4	97	\N
41	4	4	9	\N
42	4	4	97	\N
43	1	4	3	\N
44	2	2	10	\N
45	2	2	5	\N
46	3	2	6	\N
47	4	2	272	\N
48	2	2	272	\N
49	1	2	6	\N
50	4	2	6	\N
51	3	2	10	\N
52	3	2	5	\N
53	4	2	10	\N
54	3	2	272	\N
55	2	2	6	\N
56	1	6	272	\N
57	1	3	10	\N
58	1	2	170	\N
59	2	2	170	\N
60	3	2	170	\N
61	4	2	170	\N
25	2	1	9	\N
62	1	3	310	\N
63	2	3	310	\N
64	3	3	310	\N
65	4	3	310	\N
66	1	1	319	\N
67	2	1	319	\N
68	3	1	319	\N
69	4	1	319	\N
70	1	1	320	\N
71	2	1	320	\N
72	3	1	320	\N
73	4	1	320	\N
74	1	3	325	\N
75	2	3	325	\N
76	3	3	325	\N
77	4	3	325	\N
78	1	1	345	\N
79	2	1	345	\N
80	3	1	345	\N
81	4	1	345	\N
\.


--
-- Data for Name: resourceclaims; Type: TABLE DATA; Schema: dbo; Owner: postgres
--

COPY dbo.resourceclaims (resourceclaimid, displayname, resourcename, claimname, parentresourceclaimid, application_applicationid) FROM stdin;
1	types	types	http://ed-fi.org/ods/identity/claims/domains/edFiTypes	\N	1
2	systemDescriptors	systemDescriptors	http://ed-fi.org/ods/identity/claims/domains/systemDescriptors	\N	1
3	managedDescriptors	managedDescriptors	http://ed-fi.org/ods/identity/claims/domains/managedDescriptors	\N	1
4	educationOrganizations	educationOrganizations	http://ed-fi.org/ods/identity/claims/domains/educationOrganizations	\N	1
6	relationshipBasedData	relationshipBasedData	http://ed-fi.org/ods/identity/claims/domains/relationshipBasedData	\N	1
7	assessmentMetadata	assessmentMetadata	http://ed-fi.org/ods/identity/claims/domains/assessmentMetadata	\N	1
8	identity	identity	http://ed-fi.org/ods/identity/claims/domains/identity	\N	1
9	educationStandards	educationStandards	http://ed-fi.org/ods/identity/claims/domains/educationStandards	\N	1
10	primaryRelationships	primaryRelationships	http://ed-fi.org/ods/identity/claims/domains/primaryRelationships	\N	1
11	surveyDomain	surveyDomain	http://ed-fi.org/ods/identity/claims/domains/surveyDomain	\N	1
12	absenceEventCategoryDescriptor	absenceEventCategoryDescriptor	http://ed-fi.org/ods/identity/claims/absenceEventCategoryDescriptor	2	1
13	academicHonorCategoryDescriptor	academicHonorCategoryDescriptor	http://ed-fi.org/ods/identity/claims/academicHonorCategoryDescriptor	2	1
14	academicSubjectDescriptor	academicSubjectDescriptor	http://ed-fi.org/ods/identity/claims/academicSubjectDescriptor	2	1
15	academicWeek	academicWeek	http://ed-fi.org/ods/identity/claims/academicWeek	6	1
16	accommodationDescriptor	accommodationDescriptor	http://ed-fi.org/ods/identity/claims/accommodationDescriptor	3	1
17	account	account	http://ed-fi.org/ods/identity/claims/account	6	1
18	accountabilityRating	accountabilityRating	http://ed-fi.org/ods/identity/claims/accountabilityRating	6	1
19	accountClassificationDescriptor	accountClassificationDescriptor	http://ed-fi.org/ods/identity/claims/accountClassificationDescriptor	2	1
20	accountCode	accountCode	http://ed-fi.org/ods/identity/claims/accountCode	6	1
21	achievementCategoryDescriptor	achievementCategoryDescriptor	http://ed-fi.org/ods/identity/claims/achievementCategoryDescriptor	2	1
22	actual	actual	http://ed-fi.org/ods/identity/claims/actual	6	1
23	additionalCreditTypeDescriptor	additionalCreditTypeDescriptor	http://ed-fi.org/ods/identity/claims/additionalCreditTypeDescriptor	2	1
24	addressTypeDescriptor	addressTypeDescriptor	http://ed-fi.org/ods/identity/claims/addressTypeDescriptor	2	1
25	administrationEnvironmentDescriptor	administrationEnvironmentDescriptor	http://ed-fi.org/ods/identity/claims/administrationEnvironmentDescriptor	2	1
26	administrativeFundingControlDescriptor	administrativeFundingControlDescriptor	http://ed-fi.org/ods/identity/claims/administrativeFundingControlDescriptor	2	1
27	ancestryEthnicOriginDescriptor	ancestryEthnicOriginDescriptor	http://ed-fi.org/ods/identity/claims/ancestryEthnicOriginDescriptor	2	1
28	assessment	assessment	http://ed-fi.org/ods/identity/claims/assessment	7	1
29	assessmentCategoryDescriptor	assessmentCategoryDescriptor	http://ed-fi.org/ods/identity/claims/assessmentCategoryDescriptor	2	1
30	assessmentIdentificationSystemDescriptor	assessmentIdentificationSystemDescriptor	http://ed-fi.org/ods/identity/claims/assessmentIdentificationSystemDescriptor	2	1
31	assessmentItem	assessmentItem	http://ed-fi.org/ods/identity/claims/assessmentItem	7	1
32	assessmentItemCategoryDescriptor	assessmentItemCategoryDescriptor	http://ed-fi.org/ods/identity/claims/assessmentItemCategoryDescriptor	2	1
33	assessmentItemResultDescriptor	assessmentItemResultDescriptor	http://ed-fi.org/ods/identity/claims/assessmentItemResultDescriptor	2	1
34	assessmentPeriodDescriptor	assessmentPeriodDescriptor	http://ed-fi.org/ods/identity/claims/assessmentPeriodDescriptor	3	1
35	assessmentReportingMethodDescriptor	assessmentReportingMethodDescriptor	http://ed-fi.org/ods/identity/claims/assessmentReportingMethodDescriptor	3	1
36	assessmentScoreRangeLearningStandard	assessmentScoreRangeLearningStandard	http://ed-fi.org/ods/identity/claims/assessmentScoreRangeLearningStandard	7	1
37	attemptStatusDescriptor	attemptStatusDescriptor	http://ed-fi.org/ods/identity/claims/attemptStatusDescriptor	2	1
38	attendanceEventCategoryDescriptor	attendanceEventCategoryDescriptor	http://ed-fi.org/ods/identity/claims/attendanceEventCategoryDescriptor	2	1
39	barrierToInternetAccessInResidenceDescriptor	barrierToInternetAccessInResidenceDescriptor	http://ed-fi.org/ods/identity/claims/barrierToInternetAccessInResidenceDescriptor	2	1
40	behaviorDescriptor	behaviorDescriptor	http://ed-fi.org/ods/identity/claims/behaviorDescriptor	2	1
41	bellSchedule	bellSchedule	http://ed-fi.org/ods/identity/claims/bellSchedule	6	1
42	budget	budget	http://ed-fi.org/ods/identity/claims/budget	6	1
43	calendar	calendar	http://ed-fi.org/ods/identity/claims/calendar	6	1
44	calendarDate	calendarDate	http://ed-fi.org/ods/identity/claims/calendarDate	6	1
45	calendarEventDescriptor	calendarEventDescriptor	http://ed-fi.org/ods/identity/claims/calendarEventDescriptor	2	1
46	calendarTypeDescriptor	calendarTypeDescriptor	http://ed-fi.org/ods/identity/claims/calendarTypeDescriptor	2	1
47	careerPathwayDescriptor	careerPathwayDescriptor	http://ed-fi.org/ods/identity/claims/careerPathwayDescriptor	2	1
48	charterApprovalAgencyTypeDescriptor	charterApprovalAgencyTypeDescriptor	http://ed-fi.org/ods/identity/claims/charterApprovalAgencyTypeDescriptor	2	1
49	charterStatusDescriptor	charterStatusDescriptor	http://ed-fi.org/ods/identity/claims/charterStatusDescriptor	2	1
50	citizenshipStatusDescriptor	citizenshipStatusDescriptor	http://ed-fi.org/ods/identity/claims/citizenshipStatusDescriptor	2	1
51	classPeriod	classPeriod	http://ed-fi.org/ods/identity/claims/classPeriod	6	1
52	classroomPositionDescriptor	classroomPositionDescriptor	http://ed-fi.org/ods/identity/claims/classroomPositionDescriptor	2	1
53	cohort	cohort	http://ed-fi.org/ods/identity/claims/cohort	6	1
54	cohortScopeDescriptor	cohortScopeDescriptor	http://ed-fi.org/ods/identity/claims/cohortScopeDescriptor	2	1
5	people	people	http://ed-fi.org/ods/identity/claims/domains/people	4	1
55	cohortTypeDescriptor	cohortTypeDescriptor	http://ed-fi.org/ods/identity/claims/cohortTypeDescriptor	2	1
56	cohortYearTypeDescriptor	cohortYearTypeDescriptor	http://ed-fi.org/ods/identity/claims/cohortYearTypeDescriptor	2	1
57	communityOrganization	communityOrganization	http://ed-fi.org/ods/identity/claims/communityOrganization	4	1
58	communityProvider	communityProvider	http://ed-fi.org/ods/identity/claims/communityProvider	4	1
59	communityProviderLicense	communityProviderLicense	http://ed-fi.org/ods/identity/claims/communityProviderLicense	6	1
60	competencyLevelDescriptor	competencyLevelDescriptor	http://ed-fi.org/ods/identity/claims/competencyLevelDescriptor	2	1
61	competencyObjective	competencyObjective	http://ed-fi.org/ods/identity/claims/competencyObjective	6	1
62	contactTypeDescriptor	contactTypeDescriptor	http://ed-fi.org/ods/identity/claims/contactTypeDescriptor	2	1
63	contentClassDescriptor	contentClassDescriptor	http://ed-fi.org/ods/identity/claims/contentClassDescriptor	2	1
64	continuationOfServicesReasonDescriptor	continuationOfServicesReasonDescriptor	http://ed-fi.org/ods/identity/claims/continuationOfServicesReasonDescriptor	2	1
65	contractedStaff	contractedStaff	http://ed-fi.org/ods/identity/claims/contractedStaff	6	1
66	costRateDescriptor	costRateDescriptor	http://ed-fi.org/ods/identity/claims/costRateDescriptor	2	1
67	countryDescriptor	countryDescriptor	http://ed-fi.org/ods/identity/claims/countryDescriptor	2	1
68	course	course	http://ed-fi.org/ods/identity/claims/course	6	1
69	courseAttemptResultDescriptor	courseAttemptResultDescriptor	http://ed-fi.org/ods/identity/claims/courseAttemptResultDescriptor	2	1
70	courseDefinedByDescriptor	courseDefinedByDescriptor	http://ed-fi.org/ods/identity/claims/courseDefinedByDescriptor	2	1
71	courseGPAApplicabilityDescriptor	courseGPAApplicabilityDescriptor	http://ed-fi.org/ods/identity/claims/courseGPAApplicabilityDescriptor	2	1
72	courseIdentificationSystemDescriptor	courseIdentificationSystemDescriptor	http://ed-fi.org/ods/identity/claims/courseIdentificationSystemDescriptor	2	1
73	courseLevelCharacteristicDescriptor	courseLevelCharacteristicDescriptor	http://ed-fi.org/ods/identity/claims/courseLevelCharacteristicDescriptor	2	1
74	courseOffering	courseOffering	http://ed-fi.org/ods/identity/claims/courseOffering	6	1
75	courseRepeatCodeDescriptor	courseRepeatCodeDescriptor	http://ed-fi.org/ods/identity/claims/courseRepeatCodeDescriptor	2	1
76	courseTranscript	courseTranscript	http://ed-fi.org/ods/identity/claims/courseTranscript	6	1
77	credential	credential	http://ed-fi.org/ods/identity/claims/credential	9	1
78	credentialFieldDescriptor	credentialFieldDescriptor	http://ed-fi.org/ods/identity/claims/credentialFieldDescriptor	2	1
79	credentialTypeDescriptor	credentialTypeDescriptor	http://ed-fi.org/ods/identity/claims/credentialTypeDescriptor	2	1
80	creditCategoryDescriptor	creditCategoryDescriptor	http://ed-fi.org/ods/identity/claims/creditCategoryDescriptor	2	1
81	creditTypeDescriptor	creditTypeDescriptor	http://ed-fi.org/ods/identity/claims/creditTypeDescriptor	2	1
82	cteProgramServiceDescriptor	cteProgramServiceDescriptor	http://ed-fi.org/ods/identity/claims/cteProgramServiceDescriptor	2	1
83	curriculumUsedDescriptor	curriculumUsedDescriptor	http://ed-fi.org/ods/identity/claims/curriculumUsedDescriptor	2	1
84	deliveryMethodDescriptor	deliveryMethodDescriptor	http://ed-fi.org/ods/identity/claims/deliveryMethodDescriptor	2	1
85	diagnosisDescriptor	diagnosisDescriptor	http://ed-fi.org/ods/identity/claims/diagnosisDescriptor	2	1
86	diplomaLevelDescriptor	diplomaLevelDescriptor	http://ed-fi.org/ods/identity/claims/diplomaLevelDescriptor	2	1
87	diplomaTypeDescriptor	diplomaTypeDescriptor	http://ed-fi.org/ods/identity/claims/diplomaTypeDescriptor	2	1
88	disabilityDescriptor	disabilityDescriptor	http://ed-fi.org/ods/identity/claims/disabilityDescriptor	2	1
89	disabilityDesignationDescriptor	disabilityDesignationDescriptor	http://ed-fi.org/ods/identity/claims/disabilityDesignationDescriptor	2	1
90	disabilityDeterminationSourceTypeDescriptor	disabilityDeterminationSourceTypeDescriptor	http://ed-fi.org/ods/identity/claims/disabilityDeterminationSourceTypeDescriptor	2	1
91	disciplineAction	disciplineAction	http://ed-fi.org/ods/identity/claims/disciplineAction	6	1
92	disciplineActionLengthDifferenceReasonDescriptor	disciplineActionLengthDifferenceReasonDescriptor	http://ed-fi.org/ods/identity/claims/disciplineActionLengthDifferenceReasonDescriptor	2	1
93	disciplineDescriptor	disciplineDescriptor	http://ed-fi.org/ods/identity/claims/disciplineDescriptor	2	1
94	disciplineIncident	disciplineIncident	http://ed-fi.org/ods/identity/claims/disciplineIncident	6	1
95	disciplineIncidentParticipationCodeDescriptor	disciplineIncidentParticipationCodeDescriptor	http://ed-fi.org/ods/identity/claims/disciplineIncidentParticipationCodeDescriptor	2	1
96	educationalEnvironmentDescriptor	educationalEnvironmentDescriptor	http://ed-fi.org/ods/identity/claims/educationalEnvironmentDescriptor	2	1
97	educationContent	educationContent	http://ed-fi.org/ods/identity/claims/educationContent	\N	1
98	educationOrganizationCategoryDescriptor	educationOrganizationCategoryDescriptor	http://ed-fi.org/ods/identity/claims/educationOrganizationCategoryDescriptor	2	1
99	educationOrganizationIdentificationSystemDescriptor	educationOrganizationIdentificationSystemDescriptor	http://ed-fi.org/ods/identity/claims/educationOrganizationIdentificationSystemDescriptor	2	1
100	educationOrganizationInterventionPrescriptionAssociation	educationOrganizationInterventionPrescriptionAssociation	http://ed-fi.org/ods/identity/claims/educationOrganizationInterventionPrescriptionAssociation	6	1
101	educationOrganizationNetwork	educationOrganizationNetwork	http://ed-fi.org/ods/identity/claims/educationOrganizationNetwork	4	1
102	educationOrganizationNetworkAssociation	educationOrganizationNetworkAssociation	http://ed-fi.org/ods/identity/claims/educationOrganizationNetworkAssociation	4	1
103	educationOrganizationPeerAssociation	educationOrganizationPeerAssociation	http://ed-fi.org/ods/identity/claims/educationOrganizationPeerAssociation	6	1
104	educationPlanDescriptor	educationPlanDescriptor	http://ed-fi.org/ods/identity/claims/educationPlanDescriptor	2	1
105	educationServiceCenter	educationServiceCenter	http://ed-fi.org/ods/identity/claims/educationServiceCenter	4	1
106	electronicMailTypeDescriptor	electronicMailTypeDescriptor	http://ed-fi.org/ods/identity/claims/electronicMailTypeDescriptor	2	1
107	employmentStatusDescriptor	employmentStatusDescriptor	http://ed-fi.org/ods/identity/claims/employmentStatusDescriptor	2	1
108	entryGradeLevelReasonDescriptor	entryGradeLevelReasonDescriptor	http://ed-fi.org/ods/identity/claims/entryGradeLevelReasonDescriptor	2	1
109	entryTypeDescriptor	entryTypeDescriptor	http://ed-fi.org/ods/identity/claims/entryTypeDescriptor	2	1
110	eventCircumstanceDescriptor	eventCircumstanceDescriptor	http://ed-fi.org/ods/identity/claims/eventCircumstanceDescriptor	2	1
111	exitWithdrawTypeDescriptor	exitWithdrawTypeDescriptor	http://ed-fi.org/ods/identity/claims/exitWithdrawTypeDescriptor	2	1
112	feederSchoolAssociation	feederSchoolAssociation	http://ed-fi.org/ods/identity/claims/feederSchoolAssociation	6	1
113	grade	grade	http://ed-fi.org/ods/identity/claims/grade	6	1
114	gradebookEntry	gradebookEntry	http://ed-fi.org/ods/identity/claims/gradebookEntry	6	1
115	gradebookEntryTypeDescriptor	gradebookEntryTypeDescriptor	http://ed-fi.org/ods/identity/claims/gradebookEntryTypeDescriptor	2	1
116	gradeLevelDescriptor	gradeLevelDescriptor	http://ed-fi.org/ods/identity/claims/gradeLevelDescriptor	2	1
117	gradePointAverageTypeDescriptor	gradePointAverageTypeDescriptor	http://ed-fi.org/ods/identity/claims/gradePointAverageTypeDescriptor	2	1
118	gradeTypeDescriptor	gradeTypeDescriptor	http://ed-fi.org/ods/identity/claims/gradeTypeDescriptor	2	1
119	gradingPeriod	gradingPeriod	http://ed-fi.org/ods/identity/claims/gradingPeriod	6	1
120	gradingPeriodDescriptor	gradingPeriodDescriptor	http://ed-fi.org/ods/identity/claims/gradingPeriodDescriptor	2	1
121	graduationPlan	graduationPlan	http://ed-fi.org/ods/identity/claims/graduationPlan	6	1
122	graduationPlanTypeDescriptor	graduationPlanTypeDescriptor	http://ed-fi.org/ods/identity/claims/graduationPlanTypeDescriptor	2	1
123	gunFreeSchoolsActReportingStatusDescriptor	gunFreeSchoolsActReportingStatusDescriptor	http://ed-fi.org/ods/identity/claims/gunFreeSchoolsActReportingStatusDescriptor	2	1
124	homelessPrimaryNighttimeResidenceDescriptor	homelessPrimaryNighttimeResidenceDescriptor	http://ed-fi.org/ods/identity/claims/homelessPrimaryNighttimeResidenceDescriptor	2	1
125	homelessProgramServiceDescriptor	homelessProgramServiceDescriptor	http://ed-fi.org/ods/identity/claims/homelessProgramServiceDescriptor	2	1
126	identificationDocumentUseDescriptor	identificationDocumentUseDescriptor	http://ed-fi.org/ods/identity/claims/identificationDocumentUseDescriptor	2	1
127	incidentLocationDescriptor	incidentLocationDescriptor	http://ed-fi.org/ods/identity/claims/incidentLocationDescriptor	2	1
128	indicatorDescriptor	indicatorDescriptor	http://ed-fi.org/ods/identity/claims/indicatorDescriptor	2	1
129	indicatorGroupDescriptor	indicatorGroupDescriptor	http://ed-fi.org/ods/identity/claims/indicatorGroupDescriptor	2	1
130	indicatorLevelDescriptor	indicatorLevelDescriptor	http://ed-fi.org/ods/identity/claims/indicatorLevelDescriptor	2	1
131	institutionTelephoneNumberTypeDescriptor	institutionTelephoneNumberTypeDescriptor	http://ed-fi.org/ods/identity/claims/institutionTelephoneNumberTypeDescriptor	2	1
132	interactivityStyleDescriptor	interactivityStyleDescriptor	http://ed-fi.org/ods/identity/claims/interactivityStyleDescriptor	2	1
133	internetAccessDescriptor	internetAccessDescriptor	http://ed-fi.org/ods/identity/claims/internetAccessDescriptor	2	1
134	internetAccessTypeInResidenceDescriptor	internetAccessTypeInResidenceDescriptor	http://ed-fi.org/ods/identity/claims/internetAccessTypeInResidenceDescriptor	2	1
135	internetPerformanceInResidenceDescriptor	internetPerformanceInResidenceDescriptor	http://ed-fi.org/ods/identity/claims/internetPerformanceInResidenceDescriptor	2	1
136	intervention	intervention	http://ed-fi.org/ods/identity/claims/intervention	6	1
137	interventionClassDescriptor	interventionClassDescriptor	http://ed-fi.org/ods/identity/claims/interventionClassDescriptor	2	1
138	interventionEffectivenessRatingDescriptor	interventionEffectivenessRatingDescriptor	http://ed-fi.org/ods/identity/claims/interventionEffectivenessRatingDescriptor	2	1
139	interventionPrescription	interventionPrescription	http://ed-fi.org/ods/identity/claims/interventionPrescription	6	1
140	interventionStudy	interventionStudy	http://ed-fi.org/ods/identity/claims/interventionStudy	6	1
141	languageDescriptor	languageDescriptor	http://ed-fi.org/ods/identity/claims/languageDescriptor	2	1
142	languageInstructionProgramServiceDescriptor	languageInstructionProgramServiceDescriptor	http://ed-fi.org/ods/identity/claims/languageInstructionProgramServiceDescriptor	2	1
143	languageUseDescriptor	languageUseDescriptor	http://ed-fi.org/ods/identity/claims/languageUseDescriptor	2	1
144	learningObjective	learningObjective	http://ed-fi.org/ods/identity/claims/learningObjective	9	1
145	learningStandard	learningStandard	http://ed-fi.org/ods/identity/claims/learningStandard	9	1
146	learningStandardCategoryDescriptor	learningStandardCategoryDescriptor	http://ed-fi.org/ods/identity/claims/learningStandardCategoryDescriptor	2	1
147	learningStandardEquivalenceAssociation	learningStandardEquivalenceAssociation	http://ed-fi.org/ods/identity/claims/learningStandardEquivalenceAssociation	9	1
148	learningStandardEquivalenceStrengthDescriptor	learningStandardEquivalenceStrengthDescriptor	http://ed-fi.org/ods/identity/claims/learningStandardEquivalenceStrengthDescriptor	2	1
149	learningStandardScopeDescriptor	learningStandardScopeDescriptor	http://ed-fi.org/ods/identity/claims/learningStandardScopeDescriptor	2	1
150	levelOfEducationDescriptor	levelOfEducationDescriptor	http://ed-fi.org/ods/identity/claims/levelOfEducationDescriptor	2	1
151	licenseStatusDescriptor	licenseStatusDescriptor	http://ed-fi.org/ods/identity/claims/licenseStatusDescriptor	2	1
152	licenseTypeDescriptor	licenseTypeDescriptor	http://ed-fi.org/ods/identity/claims/licenseTypeDescriptor	2	1
153	limitedEnglishProficiencyDescriptor	limitedEnglishProficiencyDescriptor	http://ed-fi.org/ods/identity/claims/limitedEnglishProficiencyDescriptor	2	1
154	localeDescriptor	localeDescriptor	http://ed-fi.org/ods/identity/claims/localeDescriptor	2	1
155	localEducationAgency	localEducationAgency	http://ed-fi.org/ods/identity/claims/localEducationAgency	4	1
156	localEducationAgencyCategoryDescriptor	localEducationAgencyCategoryDescriptor	http://ed-fi.org/ods/identity/claims/localEducationAgencyCategoryDescriptor	2	1
157	location	location	http://ed-fi.org/ods/identity/claims/location	6	1
158	magnetSpecialProgramEmphasisSchoolDescriptor	magnetSpecialProgramEmphasisSchoolDescriptor	http://ed-fi.org/ods/identity/claims/magnetSpecialProgramEmphasisSchoolDescriptor	2	1
159	mediumOfInstructionDescriptor	mediumOfInstructionDescriptor	http://ed-fi.org/ods/identity/claims/mediumOfInstructionDescriptor	2	1
160	methodCreditEarnedDescriptor	methodCreditEarnedDescriptor	http://ed-fi.org/ods/identity/claims/methodCreditEarnedDescriptor	2	1
161	migrantEducationProgramServiceDescriptor	migrantEducationProgramServiceDescriptor	http://ed-fi.org/ods/identity/claims/migrantEducationProgramServiceDescriptor	2	1
162	monitoredDescriptor	monitoredDescriptor	http://ed-fi.org/ods/identity/claims/monitoredDescriptor	2	1
163	neglectedOrDelinquentProgramDescriptor	neglectedOrDelinquentProgramDescriptor	http://ed-fi.org/ods/identity/claims/neglectedOrDelinquentProgramDescriptor	2	1
164	neglectedOrDelinquentProgramServiceDescriptor	neglectedOrDelinquentProgramServiceDescriptor	http://ed-fi.org/ods/identity/claims/neglectedOrDelinquentProgramServiceDescriptor	2	1
165	networkPurposeDescriptor	networkPurposeDescriptor	http://ed-fi.org/ods/identity/claims/networkPurposeDescriptor	2	1
166	objectiveAssessment	objectiveAssessment	http://ed-fi.org/ods/identity/claims/objectiveAssessment	7	1
167	oldEthnicityDescriptor	oldEthnicityDescriptor	http://ed-fi.org/ods/identity/claims/oldEthnicityDescriptor	2	1
168	openStaffPosition	openStaffPosition	http://ed-fi.org/ods/identity/claims/openStaffPosition	6	1
169	operationalStatusDescriptor	operationalStatusDescriptor	http://ed-fi.org/ods/identity/claims/operationalStatusDescriptor	2	1
171	otherNameTypeDescriptor	otherNameTypeDescriptor	http://ed-fi.org/ods/identity/claims/otherNameTypeDescriptor	2	1
172	parent	parent	http://ed-fi.org/ods/identity/claims/parent	5	1
173	participationDescriptor	participationDescriptor	http://ed-fi.org/ods/identity/claims/participationDescriptor	2	1
174	participationStatusDescriptor	participationStatusDescriptor	http://ed-fi.org/ods/identity/claims/participationStatusDescriptor	2	1
175	payroll	payroll	http://ed-fi.org/ods/identity/claims/payroll	6	1
176	performanceBaseConversionDescriptor	performanceBaseConversionDescriptor	http://ed-fi.org/ods/identity/claims/performanceBaseConversionDescriptor	2	1
177	performanceLevelDescriptor	performanceLevelDescriptor	http://ed-fi.org/ods/identity/claims/performanceLevelDescriptor	3	1
178	person	person	http://ed-fi.org/ods/identity/claims/person	6	1
179	personalInformationVerificationDescriptor	personalInformationVerificationDescriptor	http://ed-fi.org/ods/identity/claims/personalInformationVerificationDescriptor	2	1
180	platformTypeDescriptor	platformTypeDescriptor	http://ed-fi.org/ods/identity/claims/platformTypeDescriptor	2	1
181	populationServedDescriptor	populationServedDescriptor	http://ed-fi.org/ods/identity/claims/populationServedDescriptor	2	1
182	postingResultDescriptor	postingResultDescriptor	http://ed-fi.org/ods/identity/claims/postingResultDescriptor	2	1
183	postSecondaryEvent	postSecondaryEvent	http://ed-fi.org/ods/identity/claims/postSecondaryEvent	6	1
184	postSecondaryEventCategoryDescriptor	postSecondaryEventCategoryDescriptor	http://ed-fi.org/ods/identity/claims/postSecondaryEventCategoryDescriptor	2	1
185	postSecondaryInstitution	postSecondaryInstitution	http://ed-fi.org/ods/identity/claims/postSecondaryInstitution	4	1
186	postSecondaryInstitutionLevelDescriptor	postSecondaryInstitutionLevelDescriptor	http://ed-fi.org/ods/identity/claims/postSecondaryInstitutionLevelDescriptor	2	1
187	primaryLearningDeviceAccessDescriptor	primaryLearningDeviceAccessDescriptor	http://ed-fi.org/ods/identity/claims/primaryLearningDeviceAccessDescriptor	2	1
188	primaryLearningDeviceAwayFromSchoolDescriptor	primaryLearningDeviceAwayFromSchoolDescriptor	http://ed-fi.org/ods/identity/claims/primaryLearningDeviceAwayFromSchoolDescriptor	2	1
189	primaryLearningDeviceProviderDescriptor	primaryLearningDeviceProviderDescriptor	http://ed-fi.org/ods/identity/claims/primaryLearningDeviceProviderDescriptor	2	1
190	proficiencyDescriptor	proficiencyDescriptor	http://ed-fi.org/ods/identity/claims/proficiencyDescriptor	2	1
191	program	program	http://ed-fi.org/ods/identity/claims/program	6	1
192	programAssignmentDescriptor	programAssignmentDescriptor	http://ed-fi.org/ods/identity/claims/programAssignmentDescriptor	2	1
193	programCharacteristicDescriptor	programCharacteristicDescriptor	http://ed-fi.org/ods/identity/claims/programCharacteristicDescriptor	2	1
194	programSponsorDescriptor	programSponsorDescriptor	http://ed-fi.org/ods/identity/claims/programSponsorDescriptor	2	1
195	programTypeDescriptor	programTypeDescriptor	http://ed-fi.org/ods/identity/claims/programTypeDescriptor	2	1
196	progressDescriptor	progressDescriptor	http://ed-fi.org/ods/identity/claims/progressDescriptor	2	1
197	progressLevelDescriptor	progressLevelDescriptor	http://ed-fi.org/ods/identity/claims/progressLevelDescriptor	2	1
198	providerCategoryDescriptor	providerCategoryDescriptor	http://ed-fi.org/ods/identity/claims/providerCategoryDescriptor	2	1
199	providerProfitabilityDescriptor	providerProfitabilityDescriptor	http://ed-fi.org/ods/identity/claims/providerProfitabilityDescriptor	2	1
200	providerStatusDescriptor	providerStatusDescriptor	http://ed-fi.org/ods/identity/claims/providerStatusDescriptor	2	1
201	publicationStatusDescriptor	publicationStatusDescriptor	http://ed-fi.org/ods/identity/claims/publicationStatusDescriptor	2	1
202	questionFormDescriptor	questionFormDescriptor	http://ed-fi.org/ods/identity/claims/questionFormDescriptor	2	1
203	raceDescriptor	raceDescriptor	http://ed-fi.org/ods/identity/claims/raceDescriptor	2	1
204	reasonExitedDescriptor	reasonExitedDescriptor	http://ed-fi.org/ods/identity/claims/reasonExitedDescriptor	2	1
206	recognitionTypeDescriptor	recognitionTypeDescriptor	http://ed-fi.org/ods/identity/claims/recognitionTypeDescriptor	2	1
207	relationDescriptor	relationDescriptor	http://ed-fi.org/ods/identity/claims/relationDescriptor	2	1
208	repeatIdentifierDescriptor	repeatIdentifierDescriptor	http://ed-fi.org/ods/identity/claims/repeatIdentifierDescriptor	2	1
209	reportCard	reportCard	http://ed-fi.org/ods/identity/claims/reportCard	6	1
210	reporterDescriptionDescriptor	reporterDescriptionDescriptor	http://ed-fi.org/ods/identity/claims/reporterDescriptionDescriptor	2	1
211	residencyStatusDescriptor	residencyStatusDescriptor	http://ed-fi.org/ods/identity/claims/residencyStatusDescriptor	2	1
212	responseIndicatorDescriptor	responseIndicatorDescriptor	http://ed-fi.org/ods/identity/claims/responseIndicatorDescriptor	2	1
213	responsibilityDescriptor	responsibilityDescriptor	http://ed-fi.org/ods/identity/claims/responsibilityDescriptor	2	1
214	restraintEvent	restraintEvent	http://ed-fi.org/ods/identity/claims/restraintEvent	6	1
215	restraintEventReasonDescriptor	restraintEventReasonDescriptor	http://ed-fi.org/ods/identity/claims/restraintEventReasonDescriptor	2	1
216	resultDatatypeTypeDescriptor	resultDatatypeTypeDescriptor	http://ed-fi.org/ods/identity/claims/resultDatatypeTypeDescriptor	2	1
217	retestIndicatorDescriptor	retestIndicatorDescriptor	http://ed-fi.org/ods/identity/claims/retestIndicatorDescriptor	2	1
218	school	school	http://ed-fi.org/ods/identity/claims/school	4	1
219	schoolCategoryDescriptor	schoolCategoryDescriptor	http://ed-fi.org/ods/identity/claims/schoolCategoryDescriptor	2	1
220	schoolChoiceImplementStatusDescriptor	schoolChoiceImplementStatusDescriptor	http://ed-fi.org/ods/identity/claims/schoolChoiceImplementStatusDescriptor	2	1
221	schoolFoodServiceProgramServiceDescriptor	schoolFoodServiceProgramServiceDescriptor	http://ed-fi.org/ods/identity/claims/schoolFoodServiceProgramServiceDescriptor	2	1
222	schoolTypeDescriptor	schoolTypeDescriptor	http://ed-fi.org/ods/identity/claims/schoolTypeDescriptor	2	1
223	schoolYearType	schoolYearType	http://ed-fi.org/ods/identity/claims/schoolYearType	1	1
224	section	section	http://ed-fi.org/ods/identity/claims/section	6	1
225	sectionAttendanceTakenEvent	sectionAttendanceTakenEvent	http://ed-fi.org/ods/identity/claims/sectionAttendanceTakenEvent	6	1
226	sectionCharacteristicDescriptor	sectionCharacteristicDescriptor	http://ed-fi.org/ods/identity/claims/sectionCharacteristicDescriptor	2	1
227	separationDescriptor	separationDescriptor	http://ed-fi.org/ods/identity/claims/separationDescriptor	2	1
228	separationReasonDescriptor	separationReasonDescriptor	http://ed-fi.org/ods/identity/claims/separationReasonDescriptor	2	1
229	serviceDescriptor	serviceDescriptor	http://ed-fi.org/ods/identity/claims/serviceDescriptor	2	1
230	session	session	http://ed-fi.org/ods/identity/claims/session	6	1
231	sexDescriptor	sexDescriptor	http://ed-fi.org/ods/identity/claims/sexDescriptor	2	1
232	sourceSystemDescriptor	sourceSystemDescriptor	http://ed-fi.org/ods/identity/claims/sourceSystemDescriptor	2	1
233	specialEducationProgramServiceDescriptor	specialEducationProgramServiceDescriptor	http://ed-fi.org/ods/identity/claims/specialEducationProgramServiceDescriptor	2	1
234	specialEducationSettingDescriptor	specialEducationSettingDescriptor	http://ed-fi.org/ods/identity/claims/specialEducationSettingDescriptor	2	1
235	staff	staff	http://ed-fi.org/ods/identity/claims/staff	5	1
236	staffAbsenceEvent	staffAbsenceEvent	http://ed-fi.org/ods/identity/claims/staffAbsenceEvent	6	1
237	staffClassificationDescriptor	staffClassificationDescriptor	http://ed-fi.org/ods/identity/claims/staffClassificationDescriptor	2	1
238	staffCohortAssociation	staffCohortAssociation	http://ed-fi.org/ods/identity/claims/staffCohortAssociation	6	1
239	staffDisciplineIncidentAssociation	staffDisciplineIncidentAssociation	http://ed-fi.org/ods/identity/claims/staffDisciplineIncidentAssociation	6	1
240	staffEducationOrganizationAssignmentAssociation	staffEducationOrganizationAssignmentAssociation	http://ed-fi.org/ods/identity/claims/staffEducationOrganizationAssignmentAssociation	10	1
241	staffEducationOrganizationContactAssociation	staffEducationOrganizationContactAssociation	http://ed-fi.org/ods/identity/claims/staffEducationOrganizationContactAssociation	6	1
242	staffEducationOrganizationEmploymentAssociation	staffEducationOrganizationEmploymentAssociation	http://ed-fi.org/ods/identity/claims/staffEducationOrganizationEmploymentAssociation	10	1
243	staffIdentificationSystemDescriptor	staffIdentificationSystemDescriptor	http://ed-fi.org/ods/identity/claims/staffIdentificationSystemDescriptor	2	1
244	staffLeave	staffLeave	http://ed-fi.org/ods/identity/claims/staffLeave	6	1
245	staffLeaveEventCategoryDescriptor	staffLeaveEventCategoryDescriptor	http://ed-fi.org/ods/identity/claims/staffLeaveEventCategoryDescriptor	2	1
246	staffProgramAssociation	staffProgramAssociation	http://ed-fi.org/ods/identity/claims/staffProgramAssociation	6	1
247	staffSchoolAssociation	staffSchoolAssociation	http://ed-fi.org/ods/identity/claims/staffSchoolAssociation	6	1
248	staffSectionAssociation	staffSectionAssociation	http://ed-fi.org/ods/identity/claims/staffSectionAssociation	6	1
249	stateAbbreviationDescriptor	stateAbbreviationDescriptor	http://ed-fi.org/ods/identity/claims/stateAbbreviationDescriptor	2	1
250	stateEducationAgency	stateEducationAgency	http://ed-fi.org/ods/identity/claims/stateEducationAgency	4	1
251	student	student	http://ed-fi.org/ods/identity/claims/student	5	1
252	studentAcademicRecord	studentAcademicRecord	http://ed-fi.org/ods/identity/claims/studentAcademicRecord	6	1
253	studentAssessment	studentAssessment	http://ed-fi.org/ods/identity/claims/studentAssessment	7	1
254	studentCharacteristicDescriptor	studentCharacteristicDescriptor	http://ed-fi.org/ods/identity/claims/studentCharacteristicDescriptor	2	1
255	studentCohortAssociation	studentCohortAssociation	http://ed-fi.org/ods/identity/claims/studentCohortAssociation	6	1
256	studentCompetencyObjective	studentCompetencyObjective	http://ed-fi.org/ods/identity/claims/studentCompetencyObjective	6	1
257	studentCTEProgramAssociation	studentCTEProgramAssociation	http://ed-fi.org/ods/identity/claims/studentCTEProgramAssociation	6	1
258	studentDisciplineIncidentAssociation	studentDisciplineIncidentAssociation	http://ed-fi.org/ods/identity/claims/studentDisciplineIncidentAssociation	6	1
259	studentDisciplineIncidentBehaviorAssociation	studentDisciplineIncidentBehaviorAssociation	http://ed-fi.org/ods/identity/claims/studentDisciplineIncidentBehaviorAssociation	6	1
260	studentDisciplineIncidentNonOffenderAssociation	studentDisciplineIncidentNonOffenderAssociation	http://ed-fi.org/ods/identity/claims/studentDisciplineIncidentNonOffenderAssociation	6	1
261	studentEducationOrganizationAssociation	studentEducationOrganizationAssociation	http://ed-fi.org/ods/identity/claims/studentEducationOrganizationAssociation	6	1
262	studentEducationOrganizationResponsibilityAssociation	studentEducationOrganizationResponsibilityAssociation	http://ed-fi.org/ods/identity/claims/studentEducationOrganizationResponsibilityAssociation	6	1
263	studentGradebookEntry	studentGradebookEntry	http://ed-fi.org/ods/identity/claims/studentGradebookEntry	6	1
264	studentHomelessProgramAssociation	studentHomelessProgramAssociation	http://ed-fi.org/ods/identity/claims/studentHomelessProgramAssociation	6	1
265	studentIdentificationSystemDescriptor	studentIdentificationSystemDescriptor	http://ed-fi.org/ods/identity/claims/studentIdentificationSystemDescriptor	2	1
266	studentInterventionAssociation	studentInterventionAssociation	http://ed-fi.org/ods/identity/claims/studentInterventionAssociation	6	1
267	studentInterventionAttendanceEvent	studentInterventionAttendanceEvent	http://ed-fi.org/ods/identity/claims/studentInterventionAttendanceEvent	6	1
268	studentLanguageInstructionProgramAssociation	studentLanguageInstructionProgramAssociation	http://ed-fi.org/ods/identity/claims/studentLanguageInstructionProgramAssociation	6	1
269	studentLearningObjective	studentLearningObjective	http://ed-fi.org/ods/identity/claims/studentLearningObjective	6	1
270	studentMigrantEducationProgramAssociation	studentMigrantEducationProgramAssociation	http://ed-fi.org/ods/identity/claims/studentMigrantEducationProgramAssociation	6	1
271	studentNeglectedOrDelinquentProgramAssociation	studentNeglectedOrDelinquentProgramAssociation	http://ed-fi.org/ods/identity/claims/studentNeglectedOrDelinquentProgramAssociation	6	1
272	studentParentAssociation	studentParentAssociation	http://ed-fi.org/ods/identity/claims/studentParentAssociation	6	1
273	studentParticipationCodeDescriptor	studentParticipationCodeDescriptor	http://ed-fi.org/ods/identity/claims/studentParticipationCodeDescriptor	2	1
274	studentProgramAssociation	studentProgramAssociation	http://ed-fi.org/ods/identity/claims/studentProgramAssociation	6	1
275	studentProgramAttendanceEvent	studentProgramAttendanceEvent	http://ed-fi.org/ods/identity/claims/studentProgramAttendanceEvent	6	1
276	studentSchoolAssociation	studentSchoolAssociation	http://ed-fi.org/ods/identity/claims/studentSchoolAssociation	10	1
277	studentSchoolAttendanceEvent	studentSchoolAttendanceEvent	http://ed-fi.org/ods/identity/claims/studentSchoolAttendanceEvent	6	1
278	studentSchoolFoodServiceProgramAssociation	studentSchoolFoodServiceProgramAssociation	http://ed-fi.org/ods/identity/claims/studentSchoolFoodServiceProgramAssociation	6	1
279	studentSectionAssociation	studentSectionAssociation	http://ed-fi.org/ods/identity/claims/studentSectionAssociation	6	1
280	studentSectionAttendanceEvent	studentSectionAttendanceEvent	http://ed-fi.org/ods/identity/claims/studentSectionAttendanceEvent	6	1
281	studentSpecialEducationProgramAssociation	studentSpecialEducationProgramAssociation	http://ed-fi.org/ods/identity/claims/studentSpecialEducationProgramAssociation	6	1
282	studentTitleIPartAProgramAssociation	studentTitleIPartAProgramAssociation	http://ed-fi.org/ods/identity/claims/studentTitleIPartAProgramAssociation	6	1
283	survey	survey	http://ed-fi.org/ods/identity/claims/survey	11	1
284	surveyCategoryDescriptor	surveyCategoryDescriptor	http://ed-fi.org/ods/identity/claims/surveyCategoryDescriptor	2	1
285	surveyCourseAssociation	surveyCourseAssociation	http://ed-fi.org/ods/identity/claims/surveyCourseAssociation	6	1
286	surveyLevelDescriptor	surveyLevelDescriptor	http://ed-fi.org/ods/identity/claims/surveyLevelDescriptor	2	1
287	surveyProgramAssociation	surveyProgramAssociation	http://ed-fi.org/ods/identity/claims/surveyProgramAssociation	6	1
288	surveyQuestion	surveyQuestion	http://ed-fi.org/ods/identity/claims/surveyQuestion	11	1
289	surveyQuestionResponse	surveyQuestionResponse	http://ed-fi.org/ods/identity/claims/surveyQuestionResponse	11	1
290	surveyResponse	surveyResponse	http://ed-fi.org/ods/identity/claims/surveyResponse	11	1
291	surveyResponseEducationOrganizationTargetAssociation	surveyResponseEducationOrganizationTargetAssociation	http://ed-fi.org/ods/identity/claims/surveyResponseEducationOrganizationTargetAssociation	6	1
292	surveyResponseStaffTargetAssociation	surveyResponseStaffTargetAssociation	http://ed-fi.org/ods/identity/claims/surveyResponseStaffTargetAssociation	6	1
293	surveySection	surveySection	http://ed-fi.org/ods/identity/claims/surveySection	11	1
294	surveySectionAssociation	surveySectionAssociation	http://ed-fi.org/ods/identity/claims/surveySectionAssociation	6	1
295	surveySectionResponse	surveySectionResponse	http://ed-fi.org/ods/identity/claims/surveySectionResponse	11	1
296	surveySectionResponseEducationOrganizationTargetAssociation	surveySectionResponseEducationOrganizationTargetAssociation	http://ed-fi.org/ods/identity/claims/surveySectionResponseEducationOrganizationTargetAssociation	6	1
297	surveySectionResponseStaffTargetAssociation	surveySectionResponseStaffTargetAssociation	http://ed-fi.org/ods/identity/claims/surveySectionResponseStaffTargetAssociation	6	1
298	teachingCredentialBasisDescriptor	teachingCredentialBasisDescriptor	http://ed-fi.org/ods/identity/claims/teachingCredentialBasisDescriptor	2	1
299	teachingCredentialDescriptor	teachingCredentialDescriptor	http://ed-fi.org/ods/identity/claims/teachingCredentialDescriptor	2	1
300	technicalSkillsAssessmentDescriptor	technicalSkillsAssessmentDescriptor	http://ed-fi.org/ods/identity/claims/technicalSkillsAssessmentDescriptor	2	1
301	telephoneNumberTypeDescriptor	telephoneNumberTypeDescriptor	http://ed-fi.org/ods/identity/claims/telephoneNumberTypeDescriptor	2	1
302	termDescriptor	termDescriptor	http://ed-fi.org/ods/identity/claims/termDescriptor	2	1
303	titleIPartAParticipantDescriptor	titleIPartAParticipantDescriptor	http://ed-fi.org/ods/identity/claims/titleIPartAParticipantDescriptor	2	1
304	titleIPartAProgramServiceDescriptor	titleIPartAProgramServiceDescriptor	http://ed-fi.org/ods/identity/claims/titleIPartAProgramServiceDescriptor	2	1
305	titleIPartASchoolDesignationDescriptor	titleIPartASchoolDesignationDescriptor	http://ed-fi.org/ods/identity/claims/titleIPartASchoolDesignationDescriptor	2	1
306	tribalAffiliationDescriptor	tribalAffiliationDescriptor	http://ed-fi.org/ods/identity/claims/tribalAffiliationDescriptor	2	1
307	visaDescriptor	visaDescriptor	http://ed-fi.org/ods/identity/claims/visaDescriptor	2	1
308	weaponDescriptor	weaponDescriptor	http://ed-fi.org/ods/identity/claims/weaponDescriptor	2	1
170	organizationDepartment	organizationDepartment	http://ed-fi.org/ods/identity/claims/organizationDepartment	4	1
205	reasonNotTestedDescriptor	reasonNotTestedDescriptor	http://ed-fi.org/ods/identity/claims/reasonNotTestedDescriptor	3	1
309	tpdm	tpdm	http://ed-fi.org/ods/identity/claims/domains/tpdm	\N	1
310	performanceEvaluation	performanceEvaluation	http://ed-fi.org/ods/identity/claims/domains/tpdm/performanceEvaluation	309	1
311	performanceEvaluation	performanceEvaluation	http://ed-fi.org/ods/identity/claims/tpdm/performanceEvaluation	310	1
312	evaluation	evaluation	http://ed-fi.org/ods/identity/claims/tpdm/evaluation	310	1
313	evaluationObjective	evaluationObjective	http://ed-fi.org/ods/identity/claims/tpdm/evaluationObjective	310	1
314	evaluationElement	evaluationElement	http://ed-fi.org/ods/identity/claims/tpdm/evaluationElement	310	1
315	rubricDimension	rubricDimension	http://ed-fi.org/ods/identity/claims/tpdm/rubricDimension	310	1
316	evaluationRating	evaluationRating	http://ed-fi.org/ods/identity/claims/tpdm/evaluationRating	310	1
317	evaluationObjectiveRating	evaluationObjectiveRating	http://ed-fi.org/ods/identity/claims/tpdm/evaluationObjectiveRating	310	1
318	evaluationElementRating	evaluationElementRating	http://ed-fi.org/ods/identity/claims/tpdm/evaluationElementRating	310	1
319	performanceEvaluationRating	performanceEvaluationRating	http://ed-fi.org/ods/identity/claims/tpdm/performanceEvaluationRating	310	1
320	noFurtherAuthorizationRequiredData	noFurtherAuthorizationRequiredData	http://ed-fi.org/ods/identity/claims/domains/tpdm/noFurtherAuthorizationRequiredData	309	1
321	candidatePreparation	candidatePreparation	http://ed-fi.org/ods/identity/claims/domains/tpdm/candidatePreparation	320	1
322	candidateEducatorPreparationProgramAssociation	candidateEducatorPreparationProgramAssociation	http://ed-fi.org/ods/identity/claims/tpdm/candidateEducatorPreparationProgramAssociation	321	1
323	students	students	http://ed-fi.org/ods/identity/claims/domains/tpdm/students	320	1
324	financialAid	financialAid	http://ed-fi.org/ods/identity/claims/tpdm/financialAid	323	1
325	educatorPreparationProgram	educatorPreparationProgram	http://ed-fi.org/ods/identity/claims/tpdm/educatorPreparationProgram	309	1
326	descriptors	descriptors	http://ed-fi.org/ods/identity/claims/domains/tpdm/descriptors	2	1
327	accreditationStatusDescriptor	accreditationStatusDescriptor	http://ed-fi.org/ods/identity/claims/tpdm/accreditationStatusDescriptor	326	1
328	aidTypeDescriptor	aidTypeDescriptor	http://ed-fi.org/ods/identity/claims/tpdm/aidTypeDescriptor	326	1
329	certificationRouteDescriptor	certificationRouteDescriptor	http://ed-fi.org/ods/identity/claims/tpdm/certificationRouteDescriptor	326	1
330	coteachingStyleObservedDescriptor	coteachingStyleObservedDescriptor	http://ed-fi.org/ods/identity/claims/tpdm/coteachingStyleObservedDescriptor	326	1
331	credentialStatusDescriptor	credentialStatusDescriptor	http://ed-fi.org/ods/identity/claims/tpdm/credentialStatusDescriptor	326	1
332	educatorRoleDescriptor	educatorRoleDescriptor	http://ed-fi.org/ods/identity/claims/tpdm/educatorRoleDescriptor	326	1
333	englishLanguageExamDescriptor	englishLanguageExamDescriptor	http://ed-fi.org/ods/identity/claims/tpdm/englishLanguageExamDescriptor	326	1
334	ePPProgramPathwayDescriptor	ePPProgramPathwayDescriptor	http://ed-fi.org/ods/identity/claims/tpdm/ePPProgramPathwayDescriptor	326	1
335	evaluationElementRatingLevelDescriptor	evaluationElementRatingLevelDescriptor	http://ed-fi.org/ods/identity/claims/tpdm/evaluationElementRatingLevelDescriptor	326	1
336	evaluationPeriodDescriptor	evaluationPeriodDescriptor	http://ed-fi.org/ods/identity/claims/tpdm/evaluationPeriodDescriptor	326	1
337	evaluationRatingLevelDescriptor	evaluationRatingLevelDescriptor	http://ed-fi.org/ods/identity/claims/tpdm/evaluationRatingLevelDescriptor	326	1
338	evaluationRatingStatusDescriptor	evaluationRatingStatusDescriptor	http://ed-fi.org/ods/identity/claims/tpdm/evaluationRatingStatusDescriptor	326	1
339	evaluationTypeDescriptor	evaluationTypeDescriptor	http://ed-fi.org/ods/identity/claims/tpdm/evaluationTypeDescriptor	326	1
340	genderDescriptor	genderDescriptor	http://ed-fi.org/ods/identity/claims/tpdm/genderDescriptor	326	1
341	objectiveRatingLevelDescriptor	objectiveRatingLevelDescriptor	http://ed-fi.org/ods/identity/claims/tpdm/objectiveRatingLevelDescriptor	326	1
342	performanceEvaluationRatingLevelDescriptor	performanceEvaluationRatingLevelDescriptor	http://ed-fi.org/ods/identity/claims/tpdm/performanceEvaluationRatingLevelDescriptor	326	1
343	performanceEvaluationTypeDescriptor	performanceEvaluationTypeDescriptor	http://ed-fi.org/ods/identity/claims/tpdm/performanceEvaluationTypeDescriptor	326	1
344	rubricRatingLevelDescriptor	rubricRatingLevelDescriptor	http://ed-fi.org/ods/identity/claims/tpdm/rubricRatingLevelDescriptor	326	1
345	candidate	candidate	http://ed-fi.org/ods/identity/claims/tpdm/candidate	5	1
346	surveyResponsePersonTargetAssociation	surveyResponsePersonTargetAssociation	http://ed-fi.org/ods/identity/claims/tpdm/surveyResponsePersonTargetAssociation	11	1
347	surveySectionResponsePersonTargetAssociation	surveySectionResponsePersonTargetAssociation	http://ed-fi.org/ods/identity/claims/tpdm/surveySectionResponsePersonTargetAssociation	11	1
\.


--
-- Data for Name: DeployJournal; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."DeployJournal" (schemaversionsid, scriptname, applied) FROM stdin;
1	Artifacts.PgSql.Structure.Security.0010-Schemas.sql	2021-11-17 14:42:33.109539
2	Artifacts.PgSql.Structure.Security.0020-Tables.sql	2021-11-17 14:42:33.161897
3	Artifacts.PgSql.Structure.Security.0030-ForeignKeys.sql	2021-11-17 14:42:33.187047
4	Artifacts.PgSql.Structure.Security.0040-Indexes.sql	2021-11-17 14:42:33.226622
5	Artifacts.PgSql.Data.Security.0001-ResourceClaimMetadata_generated.sql	2021-11-17 14:42:33.328865
6	Artifacts.PgSql.Data.Security.1000-CreateDistrictHostedSISClaimSet.sql	2021-11-17 14:42:33.337013
7	Artifacts.PgSql.Data.Security.1010-AssessmentVendorClaimSetUpdatePerformanceLevels.sql	2021-11-17 14:42:33.343869
8	Artifacts.PgSql.Data.Security.1019-AddSandboxClaimset.sql	2021-11-17 14:42:33.346191
9	Artifacts.PgSql.Data.Security.1020-DataStandard3.2b-ResourceClaimMetadata.sql	2021-11-17 14:42:33.348448
10	Artifacts.PgSql.Data.Security.1030-DataStandard3.3a-ResourceClaimMetadata.sql	2021-11-17 14:42:33.353798
11	Artifacts.PgSql.Data.Security.1050-RemoveBulkServerClaimSets.sql	2021-11-17 14:42:33.356591
12	Artifacts.PgSql.Data.Security.1060-RemoveRedundantBootstrapPermissions.sql	2021-11-17 14:42:33.360094
13	Artifacts.PgSql.Data.Security.1070-OrganizationDepartmentMetadata.sql	2021-11-17 14:42:33.366219
14	Artifacts.PgSql.Data.Security.1080-AssessmentVendorClaimSetUpdateLearningStandard.sql	2021-11-17 14:42:33.369777
15	Artifacts.PgSql.Data.Security.1090-ManagedReasonNotTestedDescriptor.sql	2021-11-17 14:42:33.37239
16	Artifacts.PgSql.Data.Security.2000-AdminApp-ClaimSets.sql	2021-11-17 14:42:33.380395
17	Artifacts.PgSql.Data.Security.2010-RenameStrategyForStudentResponsibility.sql	2021-11-17 14:42:33.382541
18	EdFi.Suite3.Ods.Extensions.TPDM.Core.1.1.0.5.3.38.Artifacts.PgSql.Data.Security.1010-TPDM-ResourceClaims.sql	2021-11-17 14:42:33.430916
19	EdFi.Suite3.Ods.Extensions.TPDM.Core.1.1.0.5.3.38.Artifacts.PgSql.Data.Security.1011-TPDM-Candidate.sql	2021-11-17 14:42:33.434885
20	EdFi.Suite3.Ods.Extensions.TPDM.Core.1.1.0.5.3.38.Artifacts.PgSql.Data.Security.1020-TPDM-EducationPreparationProgram-ClaimSet.sql	2021-11-17 14:42:33.43971
\.


--
-- Name: actions_actionid_seq; Type: SEQUENCE SET; Schema: dbo; Owner: postgres
--

SELECT pg_catalog.setval('dbo.actions_actionid_seq', 4, true);


--
-- Name: applications_applicationid_seq; Type: SEQUENCE SET; Schema: dbo; Owner: postgres
--

SELECT pg_catalog.setval('dbo.applications_applicationid_seq', 1, true);


--
-- Name: authorizationstrategies_authorizationstrategyid_seq; Type: SEQUENCE SET; Schema: dbo; Owner: postgres
--

SELECT pg_catalog.setval('dbo.authorizationstrategies_authorizationstrategyid_seq', 7, true);


--
-- Name: claimsetresourceclaims_claimsetresourceclaimid_seq; Type: SEQUENCE SET; Schema: dbo; Owner: postgres
--

SELECT pg_catalog.setval('dbo.claimsetresourceclaims_claimsetresourceclaimid_seq', 272, true);


--
-- Name: claimsets_claimsetid_seq; Type: SEQUENCE SET; Schema: dbo; Owner: postgres
--

SELECT pg_catalog.setval('dbo.claimsets_claimsetid_seq', 10, true);


--
-- Name: resourceclaimauthorizationmet_resourceclaimauthorizationstr_seq; Type: SEQUENCE SET; Schema: dbo; Owner: postgres
--

SELECT pg_catalog.setval('dbo.resourceclaimauthorizationmet_resourceclaimauthorizationstr_seq', 81, true);


--
-- Name: resourceclaims_resourceclaimid_seq; Type: SEQUENCE SET; Schema: dbo; Owner: postgres
--

SELECT pg_catalog.setval('dbo.resourceclaims_resourceclaimid_seq', 347, true);


--
-- Name: DeployJournal_schemaversionsid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."DeployJournal_schemaversionsid_seq"', 20, true);


--
-- Name: actions actions_pk; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo.actions
    ADD CONSTRAINT actions_pk PRIMARY KEY (actionid);


--
-- Name: applications applications_pk; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo.applications
    ADD CONSTRAINT applications_pk PRIMARY KEY (applicationid);


--
-- Name: authorizationstrategies authorizationstrategies_pk; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo.authorizationstrategies
    ADD CONSTRAINT authorizationstrategies_pk PRIMARY KEY (authorizationstrategyid);


--
-- Name: claimsetresourceclaims claimsetresourceclaims_pk; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo.claimsetresourceclaims
    ADD CONSTRAINT claimsetresourceclaims_pk PRIMARY KEY (claimsetresourceclaimid);


--
-- Name: claimsets claimsets_pk; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo.claimsets
    ADD CONSTRAINT claimsets_pk PRIMARY KEY (claimsetid);


--
-- Name: resourceclaimauthorizationmetadatas resourceclaimauthorizationmetadatas_pk; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo.resourceclaimauthorizationmetadatas
    ADD CONSTRAINT resourceclaimauthorizationmetadatas_pk PRIMARY KEY (resourceclaimauthorizationstrategyid);


--
-- Name: resourceclaims resourceclaims_pk; Type: CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo.resourceclaims
    ADD CONSTRAINT resourceclaims_pk PRIMARY KEY (resourceclaimid);


--
-- Name: DeployJournal PK_DeployJournal_Id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DeployJournal"
    ADD CONSTRAINT "PK_DeployJournal_Id" PRIMARY KEY (schemaversionsid);


--
-- Name: ix_authorizationstrategies_application_applicationid; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE INDEX ix_authorizationstrategies_application_applicationid ON dbo.authorizationstrategies USING btree (application_applicationid);


--
-- Name: ix_claimsetresourceclaims_action_actionid; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE INDEX ix_claimsetresourceclaims_action_actionid ON dbo.claimsetresourceclaims USING btree (action_actionid);


--
-- Name: ix_claimsetresourceclaims_authstratover_authstratid; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE INDEX ix_claimsetresourceclaims_authstratover_authstratid ON dbo.claimsetresourceclaims USING btree (authorizationstrategyoverride_authorizationstrategyid);


--
-- Name: ix_claimsetresourceclaims_claimset_claimsetid; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE INDEX ix_claimsetresourceclaims_claimset_claimsetid ON dbo.claimsetresourceclaims USING btree (claimset_claimsetid);


--
-- Name: ix_claimsetresourceclaims_resourceclaim_resourceclaimid; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE INDEX ix_claimsetresourceclaims_resourceclaim_resourceclaimid ON dbo.claimsetresourceclaims USING btree (resourceclaim_resourceclaimid);


--
-- Name: ix_claimsets_application_applicationid; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE INDEX ix_claimsets_application_applicationid ON dbo.claimsets USING btree (application_applicationid);


--
-- Name: ix_resourceclaimauthorizationmetadatas_action_actionid; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE INDEX ix_resourceclaimauthorizationmetadatas_action_actionid ON dbo.resourceclaimauthorizationmetadatas USING btree (action_actionid);


--
-- Name: ix_resourceclaimauthorizationmetadatas_authstrat_authstratid; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE INDEX ix_resourceclaimauthorizationmetadatas_authstrat_authstratid ON dbo.resourceclaimauthorizationmetadatas USING btree (authorizationstrategy_authorizationstrategyid);


--
-- Name: ix_resourceclaimauthorizationmetadatas_rescla_resclaid; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE INDEX ix_resourceclaimauthorizationmetadatas_rescla_resclaid ON dbo.resourceclaimauthorizationmetadatas USING btree (resourceclaim_resourceclaimid);


--
-- Name: ix_resourceclaims_application_applicationid; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE INDEX ix_resourceclaims_application_applicationid ON dbo.resourceclaims USING btree (application_applicationid);


--
-- Name: ix_resourceclaims_parentresourceclaimid; Type: INDEX; Schema: dbo; Owner: postgres
--

CREATE INDEX ix_resourceclaims_parentresourceclaimid ON dbo.resourceclaims USING btree (parentresourceclaimid);


--
-- Name: authorizationstrategies fk_authorizationstrategies_applications; Type: FK CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo.authorizationstrategies
    ADD CONSTRAINT fk_authorizationstrategies_applications FOREIGN KEY (application_applicationid) REFERENCES dbo.applications(applicationid) ON DELETE CASCADE;


--
-- Name: claimsetresourceclaims fk_claimsetresourceclaims_actions; Type: FK CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo.claimsetresourceclaims
    ADD CONSTRAINT fk_claimsetresourceclaims_actions FOREIGN KEY (action_actionid) REFERENCES dbo.actions(actionid) ON DELETE CASCADE;


--
-- Name: claimsetresourceclaims fk_claimsetresourceclaims_authorizationstrategies; Type: FK CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo.claimsetresourceclaims
    ADD CONSTRAINT fk_claimsetresourceclaims_authorizationstrategies FOREIGN KEY (authorizationstrategyoverride_authorizationstrategyid) REFERENCES dbo.authorizationstrategies(authorizationstrategyid);


--
-- Name: claimsetresourceclaims fk_claimsetresourceclaims_claimsets; Type: FK CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo.claimsetresourceclaims
    ADD CONSTRAINT fk_claimsetresourceclaims_claimsets FOREIGN KEY (claimset_claimsetid) REFERENCES dbo.claimsets(claimsetid) ON DELETE CASCADE;


--
-- Name: claimsetresourceclaims fk_claimsetresourceclaims_resourceclaims; Type: FK CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo.claimsetresourceclaims
    ADD CONSTRAINT fk_claimsetresourceclaims_resourceclaims FOREIGN KEY (resourceclaim_resourceclaimid) REFERENCES dbo.resourceclaims(resourceclaimid);


--
-- Name: claimsets fk_claimsets_applications; Type: FK CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo.claimsets
    ADD CONSTRAINT fk_claimsets_applications FOREIGN KEY (application_applicationid) REFERENCES dbo.applications(applicationid) ON DELETE CASCADE;


--
-- Name: resourceclaimauthorizationmetadatas fk_resourceclaimauthorizationstrategies_actions; Type: FK CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo.resourceclaimauthorizationmetadatas
    ADD CONSTRAINT fk_resourceclaimauthorizationstrategies_actions FOREIGN KEY (action_actionid) REFERENCES dbo.actions(actionid) ON DELETE CASCADE;


--
-- Name: resourceclaimauthorizationmetadatas fk_resourceclaimauthorizationstrategies_authorizationstrategies; Type: FK CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo.resourceclaimauthorizationmetadatas
    ADD CONSTRAINT fk_resourceclaimauthorizationstrategies_authorizationstrategies FOREIGN KEY (authorizationstrategy_authorizationstrategyid) REFERENCES dbo.authorizationstrategies(authorizationstrategyid);


--
-- Name: resourceclaimauthorizationmetadatas fk_resourceclaimauthorizationstrategies_resourceclaims; Type: FK CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo.resourceclaimauthorizationmetadatas
    ADD CONSTRAINT fk_resourceclaimauthorizationstrategies_resourceclaims FOREIGN KEY (resourceclaim_resourceclaimid) REFERENCES dbo.resourceclaims(resourceclaimid);


--
-- Name: resourceclaims fk_resourceclaims_applications; Type: FK CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo.resourceclaims
    ADD CONSTRAINT fk_resourceclaims_applications FOREIGN KEY (application_applicationid) REFERENCES dbo.applications(applicationid) ON DELETE CASCADE;


--
-- Name: resourceclaims fk_resourceclaims_resourceclaims; Type: FK CONSTRAINT; Schema: dbo; Owner: postgres
--

ALTER TABLE ONLY dbo.resourceclaims
    ADD CONSTRAINT fk_resourceclaims_resourceclaims FOREIGN KEY (parentresourceclaimid) REFERENCES dbo.resourceclaims(resourceclaimid);


--
-- PostgreSQL database dump complete
--

