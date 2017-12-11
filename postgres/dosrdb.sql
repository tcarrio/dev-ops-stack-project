--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.2
-- Dumped by pg_dump version 9.6.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE "dosrdb";
--
-- Name: dosrdb; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "dosrdb" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';


ALTER DATABASE "dosrdb" OWNER TO "postgres";

\connect "dosrdb"

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: SCHEMA "public"; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA "public" IS 'standard public schema';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS "plpgsql" WITH SCHEMA "pg_catalog";


--
-- Name: EXTENSION "plpgsql"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "plpgsql" IS 'PL/pgSQL procedural language';


SET search_path = "public", pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: features; Type: TABLE; Schema: public; Owner: dosr
--

CREATE TABLE "features" (
    "id" integer NOT NULL,
    "title" character varying(50) NOT NULL,
    "description" character varying(1000) NOT NULL,
    "icon" character varying(100) NOT NULL
);


ALTER TABLE "features" OWNER TO "dosr";

--
-- Name: features_id_seq; Type: SEQUENCE; Schema: public; Owner: dosr
--

CREATE SEQUENCE "features_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "features_id_seq" OWNER TO "dosr";

--
-- Name: features_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dosr
--

ALTER SEQUENCE "features_id_seq" OWNED BY "features"."id";


--
-- Name: links; Type: TABLE; Schema: public; Owner: dosr
--

CREATE TABLE "links" (
    "id" integer NOT NULL,
    "title" character varying(50) NOT NULL,
    "url" character varying(200) NOT NULL
);


ALTER TABLE "links" OWNER TO "dosr";

--
-- Name: links_id_seq; Type: SEQUENCE; Schema: public; Owner: dosr
--

CREATE SEQUENCE "links_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "links_id_seq" OWNER TO "dosr";

--
-- Name: links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dosr
--

ALTER SEQUENCE "links_id_seq" OWNED BY "links"."id";


--
-- Name: specifications; Type: TABLE; Schema: public; Owner: dosr
--

CREATE TABLE "specifications" (
    "title" character varying(50) NOT NULL,
    "description" character varying(1000) NOT NULL,
    "link" character varying(200) NOT NULL,
    "link_title" character varying(50) NOT NULL
);


ALTER TABLE "specifications" OWNER TO "dosr";

--
-- Name: sysadmins; Type: TABLE; Schema: public; Owner: dosr
--

CREATE TABLE "sysadmins" (
    "id" integer NOT NULL,
    "name" character varying(50) NOT NULL,
    "description" character varying(1000) NOT NULL,
    "image" character varying(100) NOT NULL,
    "url" character varying(200) NOT NULL
);


ALTER TABLE "sysadmins" OWNER TO "dosr";

--
-- Name: sysadmins_id_seq; Type: SEQUENCE; Schema: public; Owner: dosr
--

CREATE SEQUENCE "sysadmins_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "sysadmins_id_seq" OWNER TO "dosr";

--
-- Name: sysadmins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dosr
--

ALTER SEQUENCE "sysadmins_id_seq" OWNED BY "sysadmins"."id";


--
-- Name: welcome; Type: TABLE; Schema: public; Owner: dosr
--

CREATE TABLE "welcome" (
    "title" character varying(50) NOT NULL,
    "subtitle" character varying(200) NOT NULL,
    "link" character varying(200) NOT NULL
);


ALTER TABLE "welcome" OWNER TO "dosr";

--
-- Name: features id; Type: DEFAULT; Schema: public; Owner: dosr
--

ALTER TABLE ONLY "features" ALTER COLUMN "id" SET DEFAULT "nextval"('"features_id_seq"'::"regclass");


--
-- Name: links id; Type: DEFAULT; Schema: public; Owner: dosr
--

ALTER TABLE ONLY "links" ALTER COLUMN "id" SET DEFAULT "nextval"('"links_id_seq"'::"regclass");


--
-- Name: sysadmins id; Type: DEFAULT; Schema: public; Owner: dosr
--

ALTER TABLE ONLY "sysadmins" ALTER COLUMN "id" SET DEFAULT "nextval"('"sysadmins_id_seq"'::"regclass");


--
-- Data for Name: features; Type: TABLE DATA; Schema: public; Owner: dosr
--

COPY "features" ("id", "title", "description", "icon") FROM stdin;
1	Version Control Software	GitLab is used for a user-friendly VCS client using git for the backend, offering a plethora of tools such as issues, pull requests, and more.	fa-code
2	LDAP Integration	These services hook into Active Directory for user login and authentication, so anyone can get started quickly with their Windows account.	fa-lock
3	Configurable	With configurations available for projects and teams to enable your progress, your group can hit the ground running.	fa-cog
4	Continuous Integration	With the GitLab Runner configured for our service, you can use build configurations to test your code on every commit.	fa-desktop
5	Mattermost Integration	Issues generated on GitLab will be reflected on Mattermost, so group discussion and collaboration is more effective than ever.	fa-chain
6	Single Sign On	All you'll need is your login to GitLab and you're ready to go on all our offered services!	fa-user
\.


--
-- Name: features_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dosr
--

SELECT pg_catalog.setval('"features_id_seq"', 6, true);


--
-- Data for Name: links; Type: TABLE DATA; Schema: public; Owner: dosr
--

COPY "links" ("id", "title", "url") FROM stdin;
1	Welcome	#intro
2	The Project	#project
3	The Sysadmins	#sysadmins
4	Gitlab	http://dosr.carrio.me:8000/
5	Mattermost	http://dosr.carrio.me:8065/
\.


--
-- Name: links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dosr
--

SELECT pg_catalog.setval('"links_id_seq"', 5, true);


--
-- Data for Name: specifications; Type: TABLE DATA; Schema: public; Owner: dosr
--

COPY "specifications" ("title", "description", "link", "link_title") FROM stdin;
The Project Spec	DOSR is a Dev Ops Stack, consisting of the GitLab service, integrated with Mattermost and the GitLab Runner Continuous Integration service, providing developer a way to perform automatic testing on pull requests, commits, and more.	http://dosr.carrio.me:8000/	Try it out now
\.


--
-- Data for Name: sysadmins; Type: TABLE DATA; Schema: public; Owner: dosr
--

COPY "sysadmins" ("id", "name", "description", "image", "url") FROM stdin;
1	Tom Carrio	I'm a derp. I'm a derp derp derp. This is some super professional description of my amateurish ways. Yay.	http://i.imgur.com/fh40qZy.jpg	https://tom.carrio.me/
2	Chase Ehlert	And if you thought that was derpy. Ohhhhh mannnnnn.	http://i.imgur.com/Ln2xJIQ.jpg	https://4chan.org/g/
\.


--
-- Name: sysadmins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dosr
--

SELECT pg_catalog.setval('"sysadmins_id_seq"', 2, true);


--
-- Data for Name: welcome; Type: TABLE DATA; Schema: public; Owner: dosr
--

COPY "welcome" ("title", "subtitle", "link") FROM stdin;
DOSR	The Dev Ops Stack Reborn.	#project
\.


--
-- Name: features features_pkey; Type: CONSTRAINT; Schema: public; Owner: dosr
--

ALTER TABLE ONLY "features"
    ADD CONSTRAINT "features_pkey" PRIMARY KEY ("id");


--
-- Name: links links_pkey; Type: CONSTRAINT; Schema: public; Owner: dosr
--

ALTER TABLE ONLY "links"
    ADD CONSTRAINT "links_pkey" PRIMARY KEY ("id");


--
-- Name: sysadmins sysadmins_pkey; Type: CONSTRAINT; Schema: public; Owner: dosr
--

ALTER TABLE ONLY "sysadmins"
    ADD CONSTRAINT "sysadmins_pkey" PRIMARY KEY ("id");


--
-- PostgreSQL database dump complete
--

