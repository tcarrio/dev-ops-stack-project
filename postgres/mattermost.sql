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

DROP DATABASE "mattermost";
--
-- Name: mattermost; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "mattermost" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';


ALTER DATABASE "mattermost" OWNER TO "postgres";

\connect "mattermost"

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
-- Name: audits; Type: TABLE; Schema: public; Owner: mmuser
--

CREATE TABLE "audits" (
    "id" character varying(26) NOT NULL,
    "createat" bigint,
    "userid" character varying(26),
    "action" character varying(512),
    "extrainfo" character varying(1024),
    "ipaddress" character varying(64),
    "sessionid" character varying(26)
);


ALTER TABLE "audits" OWNER TO "mmuser";

--
-- Name: channelmembers; Type: TABLE; Schema: public; Owner: mmuser
--

CREATE TABLE "channelmembers" (
    "channelid" character varying(26) NOT NULL,
    "userid" character varying(26) NOT NULL,
    "roles" character varying(64),
    "lastviewedat" bigint,
    "msgcount" bigint,
    "mentioncount" bigint,
    "notifyprops" character varying(2000),
    "lastupdateat" bigint
);


ALTER TABLE "channelmembers" OWNER TO "mmuser";

--
-- Name: channels; Type: TABLE; Schema: public; Owner: mmuser
--

CREATE TABLE "channels" (
    "id" character varying(26) NOT NULL,
    "createat" bigint,
    "updateat" bigint,
    "deleteat" bigint,
    "teamid" character varying(26),
    "type" character varying(1),
    "displayname" character varying(64),
    "name" character varying(64),
    "header" character varying(1024),
    "purpose" character varying(250),
    "lastpostat" bigint,
    "totalmsgcount" bigint,
    "extraupdateat" bigint,
    "creatorid" character varying(26)
);


ALTER TABLE "channels" OWNER TO "mmuser";

--
-- Name: commands; Type: TABLE; Schema: public; Owner: mmuser
--

CREATE TABLE "commands" (
    "id" character varying(26) NOT NULL,
    "token" character varying(26),
    "createat" bigint,
    "updateat" bigint,
    "deleteat" bigint,
    "creatorid" character varying(26),
    "teamid" character varying(26),
    "trigger" character varying(128),
    "method" character varying(1),
    "username" character varying(64),
    "iconurl" character varying(1024),
    "autocomplete" boolean,
    "autocompletedesc" character varying(1024),
    "autocompletehint" character varying(1024),
    "displayname" character varying(64),
    "description" character varying(128),
    "url" character varying(1024)
);


ALTER TABLE "commands" OWNER TO "mmuser";

--
-- Name: compliances; Type: TABLE; Schema: public; Owner: mmuser
--

CREATE TABLE "compliances" (
    "id" character varying(26) NOT NULL,
    "createat" bigint,
    "userid" character varying(26),
    "status" character varying(64),
    "count" integer,
    "desc" character varying(512),
    "type" character varying(64),
    "startat" bigint,
    "endat" bigint,
    "keywords" character varying(512),
    "emails" character varying(1024)
);


ALTER TABLE "compliances" OWNER TO "mmuser";

--
-- Name: emoji; Type: TABLE; Schema: public; Owner: mmuser
--

CREATE TABLE "emoji" (
    "id" character varying(26) NOT NULL,
    "createat" bigint,
    "updateat" bigint,
    "deleteat" bigint,
    "creatorid" character varying(26),
    "name" character varying(64)
);


ALTER TABLE "emoji" OWNER TO "mmuser";

--
-- Name: fileinfo; Type: TABLE; Schema: public; Owner: mmuser
--

CREATE TABLE "fileinfo" (
    "id" character varying(26) NOT NULL,
    "creatorid" character varying(26),
    "postid" character varying(26),
    "createat" bigint,
    "updateat" bigint,
    "deleteat" bigint,
    "path" character varying(512),
    "thumbnailpath" character varying(512),
    "previewpath" character varying(512),
    "name" character varying(256),
    "extension" character varying(64),
    "size" bigint,
    "mimetype" character varying(256),
    "width" integer,
    "height" integer,
    "haspreviewimage" boolean
);


ALTER TABLE "fileinfo" OWNER TO "mmuser";

--
-- Name: incomingwebhooks; Type: TABLE; Schema: public; Owner: mmuser
--

CREATE TABLE "incomingwebhooks" (
    "id" character varying(26) NOT NULL,
    "createat" bigint,
    "updateat" bigint,
    "deleteat" bigint,
    "userid" character varying(26),
    "channelid" character varying(26),
    "teamid" character varying(26),
    "displayname" character varying(64),
    "description" character varying(128)
);


ALTER TABLE "incomingwebhooks" OWNER TO "mmuser";

--
-- Name: licenses; Type: TABLE; Schema: public; Owner: mmuser
--

CREATE TABLE "licenses" (
    "id" character varying(26) NOT NULL,
    "createat" bigint,
    "bytes" character varying(10000)
);


ALTER TABLE "licenses" OWNER TO "mmuser";

--
-- Name: oauthaccessdata; Type: TABLE; Schema: public; Owner: mmuser
--

CREATE TABLE "oauthaccessdata" (
    "clientid" character varying(26),
    "userid" character varying(26),
    "token" character varying(26) NOT NULL,
    "refreshtoken" character varying(26),
    "redirecturi" character varying(256),
    "expiresat" bigint
);


ALTER TABLE "oauthaccessdata" OWNER TO "mmuser";

--
-- Name: oauthapps; Type: TABLE; Schema: public; Owner: mmuser
--

CREATE TABLE "oauthapps" (
    "id" character varying(26) NOT NULL,
    "creatorid" character varying(26),
    "createat" bigint,
    "updateat" bigint,
    "clientsecret" character varying(128),
    "name" character varying(64),
    "description" character varying(512),
    "iconurl" character varying(512),
    "callbackurls" character varying(1024),
    "homepage" character varying(256),
    "istrusted" boolean
);


ALTER TABLE "oauthapps" OWNER TO "mmuser";

--
-- Name: oauthauthdata; Type: TABLE; Schema: public; Owner: mmuser
--

CREATE TABLE "oauthauthdata" (
    "clientid" character varying(26),
    "userid" character varying(26),
    "code" character varying(128) NOT NULL,
    "expiresin" integer,
    "createat" bigint,
    "redirecturi" character varying(256),
    "state" character varying(128),
    "scope" character varying(128)
);


ALTER TABLE "oauthauthdata" OWNER TO "mmuser";

--
-- Name: outgoingwebhooks; Type: TABLE; Schema: public; Owner: mmuser
--

CREATE TABLE "outgoingwebhooks" (
    "id" character varying(26) NOT NULL,
    "token" character varying(26),
    "createat" bigint,
    "updateat" bigint,
    "deleteat" bigint,
    "creatorid" character varying(26),
    "channelid" character varying(26),
    "teamid" character varying(26),
    "triggerwords" character varying(1024),
    "triggerwhen" integer,
    "callbackurls" character varying(1024),
    "displayname" character varying(64),
    "description" character varying(128),
    "contenttype" character varying(128)
);


ALTER TABLE "outgoingwebhooks" OWNER TO "mmuser";

--
-- Name: passwordrecovery; Type: TABLE; Schema: public; Owner: mmuser
--

CREATE TABLE "passwordrecovery" (
    "userid" character varying(26) NOT NULL,
    "code" character varying(128),
    "createat" bigint
);


ALTER TABLE "passwordrecovery" OWNER TO "mmuser";

--
-- Name: posts; Type: TABLE; Schema: public; Owner: mmuser
--

CREATE TABLE "posts" (
    "id" character varying(26) NOT NULL,
    "createat" bigint,
    "updateat" bigint,
    "editat" bigint,
    "deleteat" bigint,
    "userid" character varying(26),
    "channelid" character varying(26),
    "rootid" character varying(26),
    "parentid" character varying(26),
    "originalid" "text",
    "message" character varying(4000),
    "type" character varying(26),
    "props" character varying(8000),
    "hashtags" character varying(1000),
    "filenames" character varying(4000),
    "fileids" character varying(150),
    "hasreactions" boolean
);


ALTER TABLE "posts" OWNER TO "mmuser";

--
-- Name: preferences; Type: TABLE; Schema: public; Owner: mmuser
--

CREATE TABLE "preferences" (
    "userid" character varying(26) NOT NULL,
    "category" character varying(32) NOT NULL,
    "name" character varying(32) NOT NULL,
    "value" character varying(2000)
);


ALTER TABLE "preferences" OWNER TO "mmuser";

--
-- Name: reactions; Type: TABLE; Schema: public; Owner: mmuser
--

CREATE TABLE "reactions" (
    "userid" character varying(26) NOT NULL,
    "postid" character varying(26) NOT NULL,
    "emojiname" character varying(64) NOT NULL,
    "createat" bigint
);


ALTER TABLE "reactions" OWNER TO "mmuser";

--
-- Name: sessions; Type: TABLE; Schema: public; Owner: mmuser
--

CREATE TABLE "sessions" (
    "id" character varying(26) NOT NULL,
    "token" character varying(26),
    "createat" bigint,
    "expiresat" bigint,
    "lastactivityat" bigint,
    "userid" character varying(26),
    "deviceid" character varying(512),
    "roles" character varying(64),
    "isoauth" boolean,
    "props" character varying(1000)
);


ALTER TABLE "sessions" OWNER TO "mmuser";

--
-- Name: status; Type: TABLE; Schema: public; Owner: mmuser
--

CREATE TABLE "status" (
    "userid" character varying(26) NOT NULL,
    "status" character varying(32),
    "manual" boolean,
    "lastactivityat" bigint
);


ALTER TABLE "status" OWNER TO "mmuser";

--
-- Name: systems; Type: TABLE; Schema: public; Owner: mmuser
--

CREATE TABLE "systems" (
    "name" character varying(64) NOT NULL,
    "value" character varying(1024)
);


ALTER TABLE "systems" OWNER TO "mmuser";

--
-- Name: teammembers; Type: TABLE; Schema: public; Owner: mmuser
--

CREATE TABLE "teammembers" (
    "teamid" character varying(26) NOT NULL,
    "userid" character varying(26) NOT NULL,
    "roles" character varying(64),
    "deleteat" bigint
);


ALTER TABLE "teammembers" OWNER TO "mmuser";

--
-- Name: teams; Type: TABLE; Schema: public; Owner: mmuser
--

CREATE TABLE "teams" (
    "id" character varying(26) NOT NULL,
    "createat" bigint,
    "updateat" bigint,
    "deleteat" bigint,
    "displayname" character varying(64),
    "name" character varying(64),
    "description" character varying(255),
    "email" character varying(128),
    "type" "text",
    "companyname" character varying(64),
    "alloweddomains" character varying(500),
    "inviteid" character varying(32),
    "allowopeninvite" boolean
);


ALTER TABLE "teams" OWNER TO "mmuser";

--
-- Name: users; Type: TABLE; Schema: public; Owner: mmuser
--

CREATE TABLE "users" (
    "id" character varying(26) NOT NULL,
    "createat" bigint,
    "updateat" bigint,
    "deleteat" bigint,
    "username" character varying(64),
    "password" character varying(128),
    "authdata" character varying(128),
    "authservice" character varying(32),
    "email" character varying(128),
    "emailverified" boolean,
    "nickname" character varying(64),
    "firstname" character varying(64),
    "lastname" character varying(64),
    "position" character varying(64),
    "roles" character varying(64),
    "allowmarketing" boolean,
    "props" character varying(4000),
    "notifyprops" character varying(2000),
    "lastpasswordupdate" bigint,
    "lastpictureupdate" bigint,
    "failedattempts" integer,
    "locale" character varying(5),
    "mfaactive" boolean,
    "mfasecret" character varying(128)
);


ALTER TABLE "users" OWNER TO "mmuser";

--
-- Data for Name: audits; Type: TABLE DATA; Schema: public; Owner: mmuser
--

COPY "audits" ("id", "createat", "userid", "action", "extrainfo", "ipaddress", "sessionid") FROM stdin;
sgcta4ipkjreijkbr6iiccdkua	1491358364453		/api/v3/users/login	attempt - user_id=jsu11197jini3x14aqcz7fqxha login_id=	141.210.27.114	
nnuu44oret8mm8dmj7cxehstuy	1491358364658	jsu11197jini3x14aqcz7fqxha	/api/v3/users/login	success	141.210.27.114	
agj93wunj3fyjqxs4aucda1qpr	1491359050253	jsu11197jini3x14aqcz7fqxha	/api/v3/users/logout		141.210.27.114	uojuj1om5jbtzxbpgbsp79race
zz6p9ki4978yjdhrw1bs5gh8tc	1491361996181	tyouyom5cina8b43s1s3yohz3w	/api/v3/users/logout		141.210.27.114	7xb33g78h3dfide5xyebe4z57e
6orzbgcdwf8xtxnnoyrehik85w	1491361996292		/api/v3/users/logout		141.210.27.114	
rhbypix557gw7rdqudexpzsx1e	1491362059179	t41d7xuuxfd498ckasc4b7fnwe	/api/v3/users/logout		141.210.27.114	egiopdk6jbd5bf9ftnxpjjymmy
typxjb1s9p8yuymbmhnu9cxtxe	1491362124359	h4abgq5mytf4dja9g9bnkthh6h	/api/v3/users/logout		141.210.27.114	cw57qysuepygmefyn4ocqrusey
d1gifg3eytdazgc7x5n71d7t4y	1491362181188	h4abgq5mytf4dja9g9bnkthh6h	/api/v3/users/logout		141.210.27.114	fnuirdgjijrmmjskjdmn9sjwdy
1knupkywxfy57qz64k4zxexsme	1491362229904	t41d7xuuxfd498ckasc4b7fnwe	/api/v3/users/logout		141.210.27.114	4bfkgi9awbgydbnqwmigd1i74r
muyjchrsy3bwzcza5uus7ms57o	1491362941549	h4abgq5mytf4dja9g9bnkthh6h	/api/v3/users/logout		141.210.27.114	6z3ugcgqgpy4igdexxccgdmqqw
5be8pnnyui8kjk4hfxmt3jed6a	1491363309865	t41d7xuuxfd498ckasc4b7fnwe	/api/v3/users/logout		141.210.27.114	nmdbswrzt7yyfepnhskio3zj5a
19dkq3ngi3ggpxpogk7qaeon4w	1491363319182		/api/v3/users/login	attempt - user_id= login_id=root	141.210.27.114	
6b5mob87m3fep8adt1ry3sucxw	1491363319390	jsu11197jini3x14aqcz7fqxha	/api/v3/users/login	success	141.210.27.114	
gyn88f99p7ns3cygh4haykap4y	1491363431972	jsu11197jini3x14aqcz7fqxha	/api/v3/admin/save_config		141.210.27.114	tdtwf8nrtpdq5y6ccqoaw8e1iw
sp8nratcbtf88r9e56zwkitrcy	1491363479564	jsu11197jini3x14aqcz7fqxha	/api/v3/admin/save_config		141.210.27.114	tdtwf8nrtpdq5y6ccqoaw8e1iw
5c4nxa1unigbtxafmf45kpeyra	1491363622717	jsu11197jini3x14aqcz7fqxha	/api/v3/admin/save_config		141.210.27.114	tdtwf8nrtpdq5y6ccqoaw8e1iw
mpizegn36iyot8jobkuxfx1eja	1491363825313	jsu11197jini3x14aqcz7fqxha	/api/v3/users/logout		141.210.27.114	tdtwf8nrtpdq5y6ccqoaw8e1iw
zbjhpqp7zpn9dp5ty663whn5fa	1491363825655		/api/v3/users/logout		141.210.27.114	
mtx7r6j54pgfjentnhsihne6ie	1491413840471	tyouyom5cina8b43s1s3yohz3w	/api/v3/users/logout		141.210.27.83	47brb8rrdpd1b81yb7phpthxey
j9akpyz66t8sjrspowg5onumfc	1492315802155	tyouyom5cina8b43s1s3yohz3w	/api/v3/users/logout		141.210.27.114	y66jp1hc938dxb3da5sdn1siyc
o7o6endzzifhmqw3mi69fzcsnh	1492316602250	h4abgq5mytf4dja9g9bnkthh6h	/api/v3/users/logout		141.210.27.114	ydnn345kbi8n8efxij4bk79j9h
qnpae6gdmfr73x5wncpcri97dy	1492316693128		/api/v3/users/login	attempt - user_id= login_id=root	141.210.27.114	
as1gcfcjt7go5dgqindc7jzc3a	1492316693356	jsu11197jini3x14aqcz7fqxha	/api/v3/users/login	success	141.210.27.114	
xjizrapdmjbof8s4jdzjoy6mbw	1492316723950	jsu11197jini3x14aqcz7fqxha	/api/v3/admin/save_config		141.210.27.114	fq1tog1wu3b1zmqfpo34cm4eke
qmtck6hbjjyh3npdsh3khkifch	1492316732234	jsu11197jini3x14aqcz7fqxha	/api/v3/users/logout		141.210.27.114	fq1tog1wu3b1zmqfpo34cm4eke
w4hwj1zh7inh7r81rzxanof4cy	1492316786421	h4abgq5mytf4dja9g9bnkthh6h	/api/v3/users/logout		141.210.27.114	tsf7hugypj8a9gzrkdur5gxmrr
s57fjkj4abrazy5csygnuemz3o	1492316797658	h4abgq5mytf4dja9g9bnkthh6h	/api/v3/users/logout		141.210.27.114	qw37mkcc5tb9bdwzokgsq417pe
n8tq879f4p87bykcjg14efm17y	1492316806439		/api/v3/users/login	attempt - user_id= login_id=root	141.210.27.114	
3d81k3no7jg59m1t3azqwxgwja	1492316806659	jsu11197jini3x14aqcz7fqxha	/api/v3/users/login	success	141.210.27.114	
68h7k7sbjb8ope3wdibkktmzgo	1492316863109	jsu11197jini3x14aqcz7fqxha	/api/v3/admin/save_config		141.210.27.114	9gishfimyjdm3eb41jeg8yx5pa
47wsch9zsprxxnxuuktcn43mry	1492318610554	jsu11197jini3x14aqcz7fqxha	/api/v3/users/logout		141.210.27.114	9gishfimyjdm3eb41jeg8yx5pa
w3z7rejy67g5xbias8pb91k3hr	1492318610621		/api/v3/users/logout		141.210.27.114	
3ub9epgg4bbc8matmwzx9zqcea	1492318911790	h4abgq5mytf4dja9g9bnkthh6h	/api/v3/users/logout		141.210.27.114	acuaf48f7iyhuyo1itu8rrra9c
sek6dq85dbr1mbff8m3xiefrdr	1492318911910		/api/v3/users/logout		141.210.27.114	
ceq41i11rigcifwrt6oyyinqsh	1492318979995	h4abgq5mytf4dja9g9bnkthh6h	/api/v3/users/logout		141.210.27.114	qpyd4arbfpbi9x4hyb1dhsbarr
9oycnog3iiyj5pq9naknko1q4r	1492318987359		/api/v3/users/login	attempt - user_id= login_id=root	141.210.27.114	
1bxicdbi5tyaxq8rc1yq75qc3h	1492318987838	jsu11197jini3x14aqcz7fqxha	/api/v3/users/login	success	141.210.27.114	
ps9rq8bnyfdhdy6e9yzem68yfr	1492318991853	jsu11197jini3x14aqcz7fqxha	/api/v3/users/logout		141.210.27.114	q1aez74hw3nh9rbnrt1ahisf1e
c1jrw3uyntnxfbzbi5ck1r9z8a	1492350458912	h4abgq5mytf4dja9g9bnkthh6h	/api/v3/users/logout		141.210.27.114	be4szjfod7yjfesa59pqx14tcc
g114mnt4a3r6uks5qeycdx4iqr	1492350459035		/api/v3/users/logout		141.210.27.114	
tisgwty7tfdwdx35pkj3t4bxbw	1492350465678		/api/v3/users/login	attempt - user_id= login_id=root	141.210.27.114	
eu4nm7ki47dgxbg67uhdmr79ay	1492350465904	jsu11197jini3x14aqcz7fqxha	/api/v3/users/login	success	141.210.27.114	
3df1khigcbratb6z7pehf498oh	1492350535531	jsu11197jini3x14aqcz7fqxha	/api/v3/admin/save_config		141.210.27.114	daicgcf8ebd63qseaa7amputcw
zt74iegszf8p9pkmz3nae347sc	1492350547407	jsu11197jini3x14aqcz7fqxha	/api/v3/admin/save_config		141.210.27.114	daicgcf8ebd63qseaa7amputcw
eoptp8sm3pgn8gdrxztjbdsd8w	1492350599322	jsu11197jini3x14aqcz7fqxha	/api/v3/admin/save_config		141.210.27.114	daicgcf8ebd63qseaa7amputcw
18bj1ds3hfgp7drycx783kd6jo	1492350651255	jsu11197jini3x14aqcz7fqxha	/api/v3/admin/save_config		141.210.27.114	daicgcf8ebd63qseaa7amputcw
ds7b5bwkcpfftpxzq1ged9gych	1492350658948	jsu11197jini3x14aqcz7fqxha	/api/v3/admin/save_config		141.210.27.114	daicgcf8ebd63qseaa7amputcw
kgkc41e93pbabchyh9a6sz93br	1492350704834	jsu11197jini3x14aqcz7fqxha	/api/v3/users/logout		141.210.27.114	daicgcf8ebd63qseaa7amputcw
k4kiqqm5rib3ug7ndntoaz9edh	1492350704983		/api/v3/users/logout		141.210.27.114	
r87o6yehh7b4ip7ey4gbk8fckw	1492350824944	tyouyom5cina8b43s1s3yohz3w	/api/v3/users/logout		141.210.27.114	tn13j5w5d3fc9r35cos3wbh45r
j8kbssh1jid4xxbq8tptukqw7y	1492350825011		/api/v3/users/logout		141.210.27.114	
sq1mgchnw7nmucqeibpncayqew	1492350872244	h4abgq5mytf4dja9g9bnkthh6h	/api/v3/teams/595zacsnhtfmtg1xixfuq1nesh/channels/create	name=productivity	141.210.27.114	7j5tez9cnjrsun1bxeg6fokxtc
rr5q89kw7i84mxsm6nh4p6efoc	1492351646896	h4abgq5mytf4dja9g9bnkthh6h	/api/v3/teams/595zacsnhtfmtg1xixfuq1nesh/commands/create	attempt	141.210.27.114	7j5tez9cnjrsun1bxeg6fokxtc
xjwyoktnxbdmmq18aypsdd3n6r	1492351646902	h4abgq5mytf4dja9g9bnkthh6h	/api/v3/teams/595zacsnhtfmtg1xixfuq1nesh/commands/create	success	141.210.27.114	7j5tez9cnjrsun1bxeg6fokxtc
hewku8kihpfwtnxpy73md8djkc	1492351681613	h4abgq5mytf4dja9g9bnkthh6h	/api/v3/teams/595zacsnhtfmtg1xixfuq1nesh/commands/update	attempt	141.210.27.114	7j5tez9cnjrsun1bxeg6fokxtc
k9imeuqzk3fruf1wof4a1b3ide	1492352130609	h4abgq5mytf4dja9g9bnkthh6h	/api/v3/teams/595zacsnhtfmtg1xixfuq1nesh/commands/create	attempt	141.210.27.114	7j5tez9cnjrsun1bxeg6fokxtc
rgfr17azdfdk5jcc9nacc7efxr	1492352130613	h4abgq5mytf4dja9g9bnkthh6h	/api/v3/teams/595zacsnhtfmtg1xixfuq1nesh/commands/create	success	141.210.27.114	7j5tez9cnjrsun1bxeg6fokxtc
shx55uydajy6bcwijq145pnyjc	1492352519857	h4abgq5mytf4dja9g9bnkthh6h	/api/v3/teams/595zacsnhtfmtg1xixfuq1nesh/commands/create	success	141.210.27.114	7j5tez9cnjrsun1bxeg6fokxtc
ditk6nhhx3bo5gkgh1rkchxe7o	1492352519838	h4abgq5mytf4dja9g9bnkthh6h	/api/v3/teams/595zacsnhtfmtg1xixfuq1nesh/commands/create	attempt	141.210.27.114	7j5tez9cnjrsun1bxeg6fokxtc
58kpp3n8bir1ipisesx8g5t41y	1492355125835		/api/v3/users/login	attempt - user_id= login_id=cwehlert	141.210.27.99	
okhzbbykrir1ijfpn793kzhejh	1492355125838		/api/v3/users/login	failure - user_id= login_id=cwehlert	141.210.27.99	
nqnziw5513bmurg1r9rzt3jqcc	1492358529892	h4abgq5mytf4dja9g9bnkthh6h	/api/v3/teams/595zacsnhtfmtg1xixfuq1nesh/channels/create	name=postgres	141.210.27.114	7j5tez9cnjrsun1bxeg6fokxtc
x18p7xg4u7n59fejhtwqa1dbea	1492369648414	h4abgq5mytf4dja9g9bnkthh6h	/api/v3/teams/595zacsnhtfmtg1xixfuq1nesh/channels/create	name=web	141.210.27.114	7j5tez9cnjrsun1bxeg6fokxtc
sijq1zt7ztyfjxjj9jycdr9jnr	1492369775893	h4abgq5mytf4dja9g9bnkthh6h	/api/v3/teams/595zacsnhtfmtg1xixfuq1nesh/hooks/incoming/create	attempt	141.210.27.114	7j5tez9cnjrsun1bxeg6fokxtc
rjz1efy4uj8itbjcifgm46zdmr	1492369775897	h4abgq5mytf4dja9g9bnkthh6h	/api/v3/teams/595zacsnhtfmtg1xixfuq1nesh/hooks/incoming/create	success	141.210.27.114	7j5tez9cnjrsun1bxeg6fokxtc
oxb9aagcj7fhdbrq5g3apsuxyy	1492369941236	h4abgq5mytf4dja9g9bnkthh6h	/api/v3/teams/595zacsnhtfmtg1xixfuq1nesh/hooks/incoming/create	attempt	141.210.27.114	7j5tez9cnjrsun1bxeg6fokxtc
y5r6cbcn6pndbbmtiqxy7scs9y	1492369941238	h4abgq5mytf4dja9g9bnkthh6h	/api/v3/teams/595zacsnhtfmtg1xixfuq1nesh/hooks/incoming/create	success	141.210.27.114	7j5tez9cnjrsun1bxeg6fokxtc
\.


--
-- Data for Name: channelmembers; Type: TABLE DATA; Schema: public; Owner: mmuser
--

COPY "channelmembers" ("channelid", "userid", "roles", "lastviewedat", "msgcount", "mentioncount", "notifyprops", "lastupdateat") FROM stdin;
y7k36ynfhprhjyx84ir3obr9jw	tyouyom5cina8b43s1s3yohz3w	channel_user channel_admin	0	0	0	{"desktop":"default","email":"default","mark_unread":"all","push":"default"}	1491359585633
9sto1ohnw3rmjcfwofqoguxrjw	h4abgq5mytf4dja9g9bnkthh6h	channel_user channel_admin	1492377781890	31	0	{"desktop":"default","email":"default","mark_unread":"all","push":"default"}	1492377781890
anteeygs17beicuayh34cpdjiw	tyouyom5cina8b43s1s3yohz3w	channel_user channel_admin	1491361023579	4	0	{"desktop":"default","email":"default","mark_unread":"all","push":"default"}	1491361023579
777zx1gim3fr8qp77yn1spgwdc	h4abgq5mytf4dja9g9bnkthh6h	channel_user channel_admin	1492358023716	7	0	{"desktop":"default","email":"default","mark_unread":"all","push":"default"}	1492358023716
d5iyg5g9rp8d3fhnpyahtcnpth	h4abgq5mytf4dja9g9bnkthh6h	channel_user channel_admin	0	0	0	{"desktop":"default","email":"default","mark_unread":"all","push":"default"}	1492319134104
d5iyg5g9rp8d3fhnpyahtcnpth	t41d7xuuxfd498ckasc4b7fnwe	channel_user	1492355391069	0	0	{"desktop":"default","email":"default","mark_unread":"all","push":"default"}	1492355391069
nddfhtkiuigp5jbtb7n45fitqo	h4abgq5mytf4dja9g9bnkthh6h	channel_user channel_admin	1492370277321	12	0	{"desktop":"default","email":"default","mark_unread":"all","push":"default"}	1492370277321
777zx1gim3fr8qp77yn1spgwdc	t41d7xuuxfd498ckasc4b7fnwe	channel_user	1492358023716	7	0	{"desktop":"default","email":"default","mark_unread":"all","push":"default"}	1492358023716
nddfhtkiuigp5jbtb7n45fitqo	t41d7xuuxfd498ckasc4b7fnwe	channel_user	1492370277321	12	0	{"desktop":"default","email":"default","mark_unread":"all","push":"default"}	1492370277321
b38u38ks67f47rmey1ncudzj5c	h4abgq5mytf4dja9g9bnkthh6h	channel_user channel_admin	1492383986050	9	0	{"desktop":"default","email":"default","mark_unread":"all","push":"default"}	1492383986050
9sto1ohnw3rmjcfwofqoguxrjw	t41d7xuuxfd498ckasc4b7fnwe	channel_user	1492377781890	31	0	{"desktop":"default","email":"default","mark_unread":"all","push":"default"}	1492377781890
\.


--
-- Data for Name: channels; Type: TABLE DATA; Schema: public; Owner: mmuser
--

COPY "channels" ("id", "createat", "updateat", "deleteat", "teamid", "type", "displayname", "name", "header", "purpose", "lastpostat", "totalmsgcount", "extraupdateat", "creatorid") FROM stdin;
nddfhtkiuigp5jbtb7n45fitqo	1492350872238	1492350872238	0	595zacsnhtfmtg1xixfuq1nesh	O	Productivity	productivity		Start runners on group projects and such	1492370277321	12	1492355794125	h4abgq5mytf4dja9g9bnkthh6h
y7k36ynfhprhjyx84ir3obr9jw	1491359585615	1491359585615	0	8mprsfmosjgappisgoc8rixtma	O	Off-Topic	off-topic			1491359585634	0	1491359585634	
anteeygs17beicuayh34cpdjiw	1491359585611	1491359585611	0	8mprsfmosjgappisgoc8rixtma	O	Town Square	town-square			1491361023579	4	1491359585624	
777zx1gim3fr8qp77yn1spgwdc	1492319134039	1492319134039	0	595zacsnhtfmtg1xixfuq1nesh	O	Town Square	town-square			1492358023716	7	1492355391060	
d5iyg5g9rp8d3fhnpyahtcnpth	1492319134082	1492319134082	0	595zacsnhtfmtg1xixfuq1nesh	O	Off-Topic	off-topic			1492355391069	0	1492355391068	
9sto1ohnw3rmjcfwofqoguxrjw	1492358529862	1492358529862	0	595zacsnhtfmtg1xixfuq1nesh	O	Postgres	postgres			1492377781890	31	1492358535299	h4abgq5mytf4dja9g9bnkthh6h
b38u38ks67f47rmey1ncudzj5c	1492369648408	1492369648408	0	595zacsnhtfmtg1xixfuq1nesh	O	Web	web			1492383986050	9	1492369648413	h4abgq5mytf4dja9g9bnkthh6h
\.


--
-- Data for Name: commands; Type: TABLE DATA; Schema: public; Owner: mmuser
--

COPY "commands" ("id", "token", "createat", "updateat", "deleteat", "creatorid", "teamid", "trigger", "method", "username", "iconurl", "autocomplete", "autocompletedesc", "autocompletehint", "displayname", "description", "url") FROM stdin;
9oh7xsnde7g1bes8czqmag8nza	wc4gq7e7y3bi3dsbdcb98bmoyr	1492351646900	1492351681616	0	h4abgq5mytf4dja9g9bnkthh6h	595zacsnhtfmtg1xixfuq1nesh	minetest-runner	P	GitLab	http://dosr.carrio.me:8000/assets/gitlab_logo-7ae504fe4f68fdebb3c2034e36621930cd36ea87924c11ff65dbcb8ed50dca58.png	f			Minetest Runner	Run CI pipeline on minetest	http://dosr.carrio.me:8000/api/v3/projects/54/services/mattermost_slash_commands/trigger
da56tkwys3r73y5i858iw43oiy	w1r38dnegfg13nh5ftxz8jrbiy	1492352130612	1492352130612	0	h4abgq5mytf4dja9g9bnkthh6h	595zacsnhtfmtg1xixfuq1nesh	radial	P	GitLab	http://dosr.carrio.me:8000/assets/gitlab_logo-7ae504fe4f68fdebb3c2034e36621930cd36ea87924c11ff65dbcb8ed50dca58.png	f			radial		http://dosr.carrio.me:8000/api/v3/projects/51/services/mattermost_slash_commands/trigger
oxszpnbu3j8fjn44qmk38qq43h	qwcpfm6j77re9yrqzuresg6sxa	1492352519856	1492352519856	0	h4abgq5mytf4dja9g9bnkthh6h	595zacsnhtfmtg1xixfuq1nesh	dosr	P	GitLab	http://dosr.carrio.me:8000/assets/gitlab_logo-7ae504fe4f68fdebb3c2034e36621930cd36ea87924c11ff65dbcb8ed50dca58.png	f			dosr-web	Slash for dosr-web project	http://dosr.carrio.me:8000/api/v3/projects/16/services/mattermost_slash_commands/trigger
\.


--
-- Data for Name: compliances; Type: TABLE DATA; Schema: public; Owner: mmuser
--

COPY "compliances" ("id", "createat", "userid", "status", "count", "desc", "type", "startat", "endat", "keywords", "emails") FROM stdin;
\.


--
-- Data for Name: emoji; Type: TABLE DATA; Schema: public; Owner: mmuser
--

COPY "emoji" ("id", "createat", "updateat", "deleteat", "creatorid", "name") FROM stdin;
\.


--
-- Data for Name: fileinfo; Type: TABLE DATA; Schema: public; Owner: mmuser
--

COPY "fileinfo" ("id", "creatorid", "postid", "createat", "updateat", "deleteat", "path", "thumbnailpath", "previewpath", "name", "extension", "size", "mimetype", "width", "height", "haspreviewimage") FROM stdin;
f4rd9k7sq3g4mq14krbe7msdqc	t41d7xuuxfd498ckasc4b7fnwe	xbsdob9zobywug7py7mos4aq7y	1492358539018	1492358539018	0	teams/595zacsnhtfmtg1xixfuq1nesh/channels/9sto1ohnw3rmjcfwofqoguxrjw/users/t41d7xuuxfd498ckasc4b7fnwe/f4rd9k7sq3g4mq14krbe7msdqc/Image Pasted at 2017-4-16 12-02.png	teams/595zacsnhtfmtg1xixfuq1nesh/channels/9sto1ohnw3rmjcfwofqoguxrjw/users/t41d7xuuxfd498ckasc4b7fnwe/f4rd9k7sq3g4mq14krbe7msdqc/Image Pasted at 2017-4-16 12-02_thumb.jpg	teams/595zacsnhtfmtg1xixfuq1nesh/channels/9sto1ohnw3rmjcfwofqoguxrjw/users/t41d7xuuxfd498ckasc4b7fnwe/f4rd9k7sq3g4mq14krbe7msdqc/Image Pasted at 2017-4-16 12-02_preview.jpg	Image Pasted at 2017-4-16 12-02.png	png	29203	image/png	778	569	t
smxb1y9zgj893yifz4g4j4abmo	t41d7xuuxfd498ckasc4b7fnwe	utqa1x9kcb8itkeczh61iut91y	1492360825391	1492360825391	0	teams/595zacsnhtfmtg1xixfuq1nesh/channels/9sto1ohnw3rmjcfwofqoguxrjw/users/t41d7xuuxfd498ckasc4b7fnwe/smxb1y9zgj893yifz4g4j4abmo/Image Pasted at 2017-4-16 12-40.png	teams/595zacsnhtfmtg1xixfuq1nesh/channels/9sto1ohnw3rmjcfwofqoguxrjw/users/t41d7xuuxfd498ckasc4b7fnwe/smxb1y9zgj893yifz4g4j4abmo/Image Pasted at 2017-4-16 12-40_thumb.jpg	teams/595zacsnhtfmtg1xixfuq1nesh/channels/9sto1ohnw3rmjcfwofqoguxrjw/users/t41d7xuuxfd498ckasc4b7fnwe/smxb1y9zgj893yifz4g4j4abmo/Image Pasted at 2017-4-16 12-40_preview.jpg	Image Pasted at 2017-4-16 12-40.png	png	17331	image/png	311	395	t
yhazqmzypfdxdn3xhkdunr35ro	t41d7xuuxfd498ckasc4b7fnwe	uzyzoazcdpfs9eu9158mom57ka	1492369650389	1492369650389	0	teams/595zacsnhtfmtg1xixfuq1nesh/channels/9sto1ohnw3rmjcfwofqoguxrjw/users/t41d7xuuxfd498ckasc4b7fnwe/yhazqmzypfdxdn3xhkdunr35ro/Image Pasted at 2017-4-16 15-07.png	teams/595zacsnhtfmtg1xixfuq1nesh/channels/9sto1ohnw3rmjcfwofqoguxrjw/users/t41d7xuuxfd498ckasc4b7fnwe/yhazqmzypfdxdn3xhkdunr35ro/Image Pasted at 2017-4-16 15-07_thumb.jpg	teams/595zacsnhtfmtg1xixfuq1nesh/channels/9sto1ohnw3rmjcfwofqoguxrjw/users/t41d7xuuxfd498ckasc4b7fnwe/yhazqmzypfdxdn3xhkdunr35ro/Image Pasted at 2017-4-16 15-07_preview.jpg	Image Pasted at 2017-4-16 15-07.png	png	27370	image/png	650	64	t
kxergh3xebgw9xffzh9j8pt9gw	h4abgq5mytf4dja9g9bnkthh6h	6bfi7oz35in5zx93f54agkqqpy	1492370276518	1492370276518	0	teams/595zacsnhtfmtg1xixfuq1nesh/channels/nddfhtkiuigp5jbtb7n45fitqo/users/h4abgq5mytf4dja9g9bnkthh6h/kxergh3xebgw9xffzh9j8pt9gw/Image Pasted at 2017-4-16 15-17.png	teams/595zacsnhtfmtg1xixfuq1nesh/channels/nddfhtkiuigp5jbtb7n45fitqo/users/h4abgq5mytf4dja9g9bnkthh6h/kxergh3xebgw9xffzh9j8pt9gw/Image Pasted at 2017-4-16 15-17_thumb.jpg	teams/595zacsnhtfmtg1xixfuq1nesh/channels/nddfhtkiuigp5jbtb7n45fitqo/users/h4abgq5mytf4dja9g9bnkthh6h/kxergh3xebgw9xffzh9j8pt9gw/Image Pasted at 2017-4-16 15-17_preview.jpg	Image Pasted at 2017-4-16 15-17.png	png	60646	image/png	1920	1080	t
tuurgw6umt8rjxss7xecxt7yqr	t41d7xuuxfd498ckasc4b7fnwe	5fyagwukobry9getxy7gt58gyr	1492374376508	1492374376508	0	teams/595zacsnhtfmtg1xixfuq1nesh/channels/9sto1ohnw3rmjcfwofqoguxrjw/users/t41d7xuuxfd498ckasc4b7fnwe/tuurgw6umt8rjxss7xecxt7yqr/Image Pasted at 2017-4-16 16-26.png	teams/595zacsnhtfmtg1xixfuq1nesh/channels/9sto1ohnw3rmjcfwofqoguxrjw/users/t41d7xuuxfd498ckasc4b7fnwe/tuurgw6umt8rjxss7xecxt7yqr/Image Pasted at 2017-4-16 16-26_thumb.jpg	teams/595zacsnhtfmtg1xixfuq1nesh/channels/9sto1ohnw3rmjcfwofqoguxrjw/users/t41d7xuuxfd498ckasc4b7fnwe/tuurgw6umt8rjxss7xecxt7yqr/Image Pasted at 2017-4-16 16-26_preview.jpg	Image Pasted at 2017-4-16 16-26.png	png	13951	image/png	554	38	t
\.


--
-- Data for Name: incomingwebhooks; Type: TABLE DATA; Schema: public; Owner: mmuser
--

COPY "incomingwebhooks" ("id", "createat", "updateat", "deleteat", "userid", "channelid", "teamid", "displayname", "description") FROM stdin;
7ruwfpznmfn1tk9yjggkpgiyze	1492369775895	1492369775895	0	h4abgq5mytf4dja9g9bnkthh6h	b38u38ks67f47rmey1ncudzj5c	595zacsnhtfmtg1xixfuq1nesh	dosr-web	Notifications from the dosr-web repo
tqyuieoxitf9ixp6es7yhkqkjy	1492369941237	1492369941237	0	h4abgq5mytf4dja9g9bnkthh6h	9sto1ohnw3rmjcfwofqoguxrjw	595zacsnhtfmtg1xixfuq1nesh	dosr-sql	Notifications for the SQL code repo
\.


--
-- Data for Name: licenses; Type: TABLE DATA; Schema: public; Owner: mmuser
--

COPY "licenses" ("id", "createat", "bytes") FROM stdin;
\.


--
-- Data for Name: oauthaccessdata; Type: TABLE DATA; Schema: public; Owner: mmuser
--

COPY "oauthaccessdata" ("clientid", "userid", "token", "refreshtoken", "redirecturi", "expiresat") FROM stdin;
\.


--
-- Data for Name: oauthapps; Type: TABLE DATA; Schema: public; Owner: mmuser
--

COPY "oauthapps" ("id", "creatorid", "createat", "updateat", "clientsecret", "name", "description", "iconurl", "callbackurls", "homepage", "istrusted") FROM stdin;
\.


--
-- Data for Name: oauthauthdata; Type: TABLE DATA; Schema: public; Owner: mmuser
--

COPY "oauthauthdata" ("clientid", "userid", "code", "expiresin", "createat", "redirecturi", "state", "scope") FROM stdin;
\.


--
-- Data for Name: outgoingwebhooks; Type: TABLE DATA; Schema: public; Owner: mmuser
--

COPY "outgoingwebhooks" ("id", "token", "createat", "updateat", "deleteat", "creatorid", "channelid", "teamid", "triggerwords", "triggerwhen", "callbackurls", "displayname", "description", "contenttype") FROM stdin;
\.


--
-- Data for Name: passwordrecovery; Type: TABLE DATA; Schema: public; Owner: mmuser
--

COPY "passwordrecovery" ("userid", "code", "createat") FROM stdin;
\.


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: mmuser
--

COPY "posts" ("id", "createat", "updateat", "editat", "deleteat", "userid", "channelid", "rootid", "parentid", "originalid", "message", "type", "props", "hashtags", "filenames", "fileids", "hasreactions") FROM stdin;
4sfhrun75i8c7m5edaqp96sbgh	1491359585625	1491359585625	0	0	tyouyom5cina8b43s1s3yohz3w	anteeygs17beicuayh34cpdjiw				root0 has joined the channel.	system_join_channel	{"username":"root0"}		[]	[]	f
hqqkmn1zsfnbmg3rp5t19pmdna	1491359585634	1491359585634	0	0	tyouyom5cina8b43s1s3yohz3w	y7k36ynfhprhjyx84ir3obr9jw				root0 has joined the channel.	system_join_channel	{"username":"root0"}		[]	[]	f
te7xg18c17gtjb91tybp8a784r	1491360103297	1491360114547	0	1491360114547	tyouyom5cina8b43s1s3yohz3w	anteeygs17beicuayh34cpdjiw			6pdpbuutibya7btn7riz7ccphr	CN=OU,DC=cit349,DC=ou		{}		[]	[]	f
6pdpbuutibya7btn7riz7ccphr	1491360103297	1491360121220	1491360121220	0	tyouyom5cina8b43s1s3yohz3w	anteeygs17beicuayh34cpdjiw				OU=OU,DC=cit349,DC=ou		{}		[]	[]	f
ifwn4uwy8igtzyffxybyjwkbph	1491360103297	1491360121220	1491360114547	1491360121220	tyouyom5cina8b43s1s3yohz3w	anteeygs17beicuayh34cpdjiw			6pdpbuutibya7btn7riz7ccphr	ON=OU,DC=cit349,DC=ou		{}		[]	[]	f
t93b5edyobdo7qkw6w9d1tjidc	1491360983800	1491360983800	0	0	tyouyom5cina8b43s1s3yohz3w	anteeygs17beicuayh34cpdjiw				protobuntu.clust.secs.oakland.edu (141.210.25.110)		{}		[]	[]	f
3yw7j7hu6jbqucbkfibqenacbh	1491361013213	1491361013213	0	0	tyouyom5cina8b43s1s3yohz3w	anteeygs17beicuayh34cpdjiw				fredericks.cit349.ou (141.210.25.110 huh)		{}		[]	[]	f
tydi44xi7prpmr8disx1thpc9a	1491361023579	1491361023579	0	0	tyouyom5cina8b43s1s3yohz3w	anteeygs17beicuayh34cpdjiw				fbackupdc.cit349.ou (141.210.25.76)		{}		[]	[]	f
xat66wca87dijkk1kk6noubkxy	1492319134092	1492319134092	0	0	h4abgq5mytf4dja9g9bnkthh6h	777zx1gim3fr8qp77yn1spgwdc				tlcarrio has joined the channel.	system_join_channel	{"username":"tlcarrio"}		[]	[]	f
s78nfzjpbtybfmhi533r8sqmqo	1492319134105	1492319134105	0	0	h4abgq5mytf4dja9g9bnkthh6h	d5iyg5g9rp8d3fhnpyahtcnpth				tlcarrio has joined the channel.	system_join_channel	{"username":"tlcarrio"}		[]	[]	f
ejobm4mct3ncpxd1oxm4npx1bw	1492352034733	1492352034733	0	0	h4abgq5mytf4dja9g9bnkthh6h	nddfhtkiuigp5jbtb7n45fitqo					slack_attachment	{"attachments":[{"id":0,"fallback":"New issue #1: Implement working environment deployment","color":"#38ae67","pretext":"I created an issue on [@tlcarrio](http://dosr.carrio.me:8000/tlcarrio)'s behalf: **#1** in [Thomas Carrio / minetest](http://dosr.carrio.me:8000/tlcarrio/minetest)","author_name":"Thomas Carrio","author_link":"","author_icon":"http://www.gravatar.com/avatar/7497872abe78b518ec8f70cd75329c39?s=80\\u0026d=identicon","title":"Implement working environment deployment · #1","title_link":"http://dosr.carrio.me:8000/tlcarrio/minetest/issues/1","text":"","fields":[{"title":"Assignee","value":"_None_","short":true},{"title":"Milestone","value":"_None_","short":true},{"title":"Labels","value":"_None_","short":true}],"image_url":"","thumb_url":"","footer":"","footer_icon":"","ts":null}],"from_webhook":"true"}		[]	[]	f
1y1z4y3w4bdcmr17g1ndu5umqo	1492354603061	1492354603061	0	0	h4abgq5mytf4dja9g9bnkthh6h	777zx1gim3fr8qp77yn1spgwdc				Heyyy buddy hurry up and join we got some demonstrating to do		{}		[]	[]	f
q98ufqr9fj8e8rhtdex5cc9uqw	1492355391061	1492355391061	0	0	t41d7xuuxfd498ckasc4b7fnwe	777zx1gim3fr8qp77yn1spgwdc				cwehlert has joined the channel.	system_join_channel	{"username":"cwehlert"}		[]	[]	f
em9mej13i3bsfjyfbggwrofudc	1492355391069	1492355391069	0	0	t41d7xuuxfd498ckasc4b7fnwe	d5iyg5g9rp8d3fhnpyahtcnpth				cwehlert has joined the channel.	system_join_channel	{"username":"cwehlert"}		[]	[]	f
teggb6977pnnuqfj1oo8kkhode	1492355394477	1492355394477	0	0	h4abgq5mytf4dja9g9bnkthh6h	777zx1gim3fr8qp77yn1spgwdc				ayo		{}		[]	[]	f
ghmwgb6ko78g8ffyqg6k9ij5qe	1492355400887	1492355400887	0	0	t41d7xuuxfd498ckasc4b7fnwe	777zx1gim3fr8qp77yn1spgwdc				ayo indeed		{}		[]	[]	f
anaa57qewb8w3rzgyoc7ykzkty	1492355405066	1492355405066	0	0	h4abgq5mytf4dja9g9bnkthh6h	777zx1gim3fr8qp77yn1spgwdc				A A AYOOOO		{}		[]	[]	f
y6197yhzujbau8m44bkiffkz4y	1492355415895	1492355415895	0	0	h4abgq5mytf4dja9g9bnkthh6h	777zx1gim3fr8qp77yn1spgwdc				come over to productivity		{}		[]	[]	f
k6yac3surfg6dj9u4cmue18gtw	1492355422817	1492355422817	0	0	h4abgq5mytf4dja9g9bnkthh6h	nddfhtkiuigp5jbtb7n45fitqo				we have some features here now		{}		[]	[]	f
tgt9up3ortn17gmdi6ob1oodpa	1492355453804	1492355492686	1492355492686	0	h4abgq5mytf4dja9g9bnkthh6h	nddfhtkiuigp5jbtb7n45fitqo				you can use /minetest-runner, /dosr, and /radial as slash commands now		{}		[]	[]	f
k1r3pec86jg4ddh56nhb8edcqc	1492355453804	1492355492686	0	1492355492686	h4abgq5mytf4dja9g9bnkthh6h	nddfhtkiuigp5jbtb7n45fitqo			tgt9up3ortn17gmdi6ob1oodpa	you can use /minetest-runner, /dosr-web, and /radial as slash commands now		{}		[]	[]	f
rfjpxxuakfn3ujjx3mzpqq91we	1492355545383	1492355545383	0	0	h4abgq5mytf4dja9g9bnkthh6h	nddfhtkiuigp5jbtb7n45fitqo					slack_attachment	{"attachments":[{"id":0,"fallback":"New issue #1: Implement Flask backend","color":"#38ae67","pretext":"I created an issue on [@tlcarrio](http://dosr.carrio.me:8000/tlcarrio)'s behalf: **#1** in [dosr / dosr-web](http://dosr.carrio.me:8000/dosr/dosr-web)","author_name":"Thomas Carrio","author_link":"","author_icon":"http://www.gravatar.com/avatar/7497872abe78b518ec8f70cd75329c39?s=80\\u0026d=identicon","title":"Implement Flask backend · #1","title_link":"http://dosr.carrio.me:8000/dosr/dosr-web/issues/1","text":"","fields":[{"title":"Assignee","value":"_None_","short":true},{"title":"Milestone","value":"_None_","short":true},{"title":"Labels","value":"_None_","short":true}],"image_url":"","thumb_url":"","footer":"","footer_icon":"","ts":null}],"from_webhook":"true"}		[]	[]	f
e956oze6qbyttx7qcg71y3hjpc	1492355587753	1492355587753	0	0	h4abgq5mytf4dja9g9bnkthh6h	nddfhtkiuigp5jbtb7n45fitqo					slack_attachment	{"attachments":[{"id":0,"fallback":"New issue #2: PostgreSQL backend","color":"#38ae67","pretext":"I created an issue on [@tlcarrio](http://dosr.carrio.me:8000/tlcarrio)'s behalf: **#2** in [dosr / dosr-web](http://dosr.carrio.me:8000/dosr/dosr-web)","author_name":"Thomas Carrio","author_link":"","author_icon":"http://www.gravatar.com/avatar/7497872abe78b518ec8f70cd75329c39?s=80\\u0026d=identicon","title":"PostgreSQL backend · #2","title_link":"http://dosr.carrio.me:8000/dosr/dosr-web/issues/2","text":"","fields":[{"title":"Assignee","value":"_None_","short":true},{"title":"Milestone","value":"_None_","short":true},{"title":"Labels","value":"_None_","short":true}],"image_url":"","thumb_url":"","footer":"","footer_icon":"","ts":null}],"from_webhook":"true"}		[]	[]	f
ha97ozjm93ddzkafgz6eh54y1h	1492355765024	1492355765024	0	0	h4abgq5mytf4dja9g9bnkthh6h	nddfhtkiuigp5jbtb7n45fitqo				You need to link it to your GitLab account explicitly (permissions aren't granted just by using GitLab to login to the Mattermost service) the first time you run a command		{}		[]	[]	f
jx1mbcf9ijd83jcnqidw1u1gcy	1492355778306	1492355778306	0	0	h4abgq5mytf4dja9g9bnkthh6h	nddfhtkiuigp5jbtb7n45fitqo				So for example, try /dosr issue show 2		{}		[]	[]	f
hhq1qtfneirwjqrjbmyod5bf5e	1492355794126	1492355794126	0	0	t41d7xuuxfd498ckasc4b7fnwe	nddfhtkiuigp5jbtb7n45fitqo				cwehlert has joined the channel.	system_join_channel	{"username":"cwehlert"}		[]	[]	f
45btjixfebddjdr7r9mcrw5yfy	1492355828091	1492355828091	0	0	t41d7xuuxfd498ckasc4b7fnwe	nddfhtkiuigp5jbtb7n45fitqo					slack_attachment	{"attachments":[{"id":0,"fallback":"Issue #2: PostgreSQL backend","color":"#38ae67","pretext":"Issue *#2* from dosr / dosr-web","author_name":"Thomas Carrio","author_link":"","author_icon":"http://www.gravatar.com/avatar/7497872abe78b518ec8f70cd75329c39?s=80\\u0026d=identicon","title":"PostgreSQL backend · #2","title_link":"http://dosr.carrio.me:8000/dosr/dosr-web/issues/2","text":"**Open**","fields":[{"title":"Assignee","value":"Chase Ehlert","short":true},{"title":"Milestone","value":"_None_","short":true},{"title":"Labels","value":"_None_","short":true}],"image_url":"","thumb_url":"","footer":"","footer_icon":"","ts":null}],"from_webhook":"true"}		[]	[]	f
qa5uifbapj8f5m1b4cmg4hmqto	1492357995018	1492357995018	0	0	h4abgq5mytf4dja9g9bnkthh6h	777zx1gim3fr8qp77yn1spgwdc				The spec for the images/css/etc folders will be under "/static"		{}		[]	[]	f
9tiuuob9w388bjnphwb7fmytch	1492358023716	1492358023716	0	0	h4abgq5mytf4dja9g9bnkthh6h	777zx1gim3fr8qp77yn1spgwdc				Such that image -> `/static/images/carrio.png`\nand css -> `/static/css/main.css`\n\nFor example.		{}		[]	[]	f
rtyujmw8r3bt7cfynfpaudd3he	1492358535299	1492358535299	0	0	t41d7xuuxfd498ckasc4b7fnwe	9sto1ohnw3rmjcfwofqoguxrjw				cwehlert has joined the channel.	system_join_channel	{"username":"cwehlert"}		[]	[]	f
isasoy5yi3nfupbqgaxprmogbr	1492359000555	1492359029203	0	1492359029203	h4abgq5mytf4dja9g9bnkthh6h	9sto1ohnw3rmjcfwofqoguxrjw			1tc8f4y9yp8558sytyt9qbzwaw	Such that:\n\nWelcome -> "index.html#intro"\nThe Project -> "index.html#project"\nThe SysAdmins -> "index.html#sysadmins"\nGitLab -> "http://dosr.carrio.me:8000"\nMattermost -> "http://dosr.carrio.me:8065"		{}		[]	[]	f
a15kik7sutg95qkobw5syuh4mw	1492355861340	1492355861340	0	0	h4abgq5mytf4dja9g9bnkthh6h	nddfhtkiuigp5jbtb7n45fitqo				We should generate a new user for that, `dosr` would be fine 		{}		[]	[]	f
xbsdob9zobywug7py7mos4aq7y	1492358543177	1492358543177	0	0	t41d7xuuxfd498ckasc4b7fnwe	9sto1ohnw3rmjcfwofqoguxrjw						{}		[]	["f4rd9k7sq3g4mq14krbe7msdqc"]	f
5kps7bd5qtdu7b4zhdnkma6jxw	1492358938466	1492358938466	0	0	h4abgq5mytf4dja9g9bnkthh6h	9sto1ohnw3rmjcfwofqoguxrjw				We could use the links themselves for the PKs		{}		[]	[]	f
1tc8f4y9yp8558sytyt9qbzwaw	1492359000555	1492359029203	1492359029203	0	h4abgq5mytf4dja9g9bnkthh6h	9sto1ohnw3rmjcfwofqoguxrjw				Such that:\n\nWelcome -> "/home#intro"\nThe Project -> "/home#project"\nThe SysAdmins -> "/home#sysadmins"\nGitLab -> "http://dosr.carrio.me:8000"\nMattermost -> "http://dosr.carrio.me:8065"		{}		[]	[]	f
utqa1x9kcb8itkeczh61iut91y	1492360825850	1492360825850	0	0	t41d7xuuxfd498ckasc4b7fnwe	9sto1ohnw3rmjcfwofqoguxrjw						{}		[]	["smxb1y9zgj893yifz4g4j4abmo"]	f
gu8mfwtqb3d37pmugqom6bytuo	1492360860871	1492360860871	0	0	h4abgq5mytf4dja9g9bnkthh6h	9sto1ohnw3rmjcfwofqoguxrjw				Awesome! Make sure to have the links in order of appearance on the webpage, like 1: Welcome, 2: The project, ...		{}		[]	[]	f
dt7e4mk34jfwudaoduikg9zfzw	1492360876492	1492360876492	0	0	h4abgq5mytf4dja9g9bnkthh6h	9sto1ohnw3rmjcfwofqoguxrjw				That way I can sort ascending on the query and fill the <ul> correctly		{}		[]	[]	f
df3nbtou37845pf7ik4n8tfpje	1492360991785	1492360991785	0	0	t41d7xuuxfd498ckasc4b7fnwe	nddfhtkiuigp5jbtb7n45fitqo				I shared a folder in Google Drive for docs pertaining to the project.		{}		[]	[]	f
h9ms9xxjm7nm7e8xxzmiiw4nwr	1492360991727	1492361121679	1492361121679	0	h4abgq5mytf4dja9g9bnkthh6h	9sto1ohnw3rmjcfwofqoguxrjw				Ideas for queries:\n\n```sql\n-- Get links for the bar\nSELECT * FROM Links ORDER BY ID;\n-- Get welcome information\nSELECT * FROM Welcome LIMIT 1;\n-- Get Project Specs stuff\nSELECT * FROM Specifications LIMIT 1;\n-- Get the features included in our service\nSELECT * FROM Features ORDER BY ID;\n-- Get our info for all the peeps\nSELECT * FROM SysAdmins ORDER BY ID;\n```		{}		[]	[]	f
517j1yac6trsjnkhssx1rcsh7o	1492360991727	1492361121679	0	1492361121679	h4abgq5mytf4dja9g9bnkthh6h	9sto1ohnw3rmjcfwofqoguxrjw			h9ms9xxjm7nm7e8xxzmiiw4nwr	Ideas for queries:\n\n```sql\n\nSELECT * FROM Links ORDER BY ID;\n		{}		[]	[]	f
d1m3pswu5brw3rfsis7tkkqtqe	1492367130994	1492367130994	0	0	h4abgq5mytf4dja9g9bnkthh6h	nddfhtkiuigp5jbtb7n45fitqo				Ayo		{}		[]	[]	f
fjrd9813ui8tmpssffg1oxkcno	1492368365861	1492368365861	0	0	h4abgq5mytf4dja9g9bnkthh6h	9sto1ohnw3rmjcfwofqoguxrjw				psql -U $username -h $hostname $database		{}		[]	[]	f
rkggqip34t8y9cthwrz8kxnx6h	1492368722611	1492368722611	0	0	h4abgq5mytf4dja9g9bnkthh6h	9sto1ohnw3rmjcfwofqoguxrjw				`\\i somedir/script2.sql `		{}		[]	[]	f
5duzje5oip8p9do8iu7ka1c9we	1492369105385	1492369105385	0	0	h4abgq5mytf4dja9g9bnkthh6h	9sto1ohnw3rmjcfwofqoguxrjw				```sql\nINSERT INTO Links (title, url) VALUES (...,...);\n```		{}		[]	[]	f
uzyzoazcdpfs9eu9158mom57ka	1492369651187	1492369651187	0	0	t41d7xuuxfd498ckasc4b7fnwe	9sto1ohnw3rmjcfwofqoguxrjw				I'm getting an error on this command: 		{}		[]	["yhazqmzypfdxdn3xhkdunr35ro"]	f
jk5jkb3dcfg8ffj7kkj578kxwh	1492369830660	1492369830660	0	0	t41d7xuuxfd498ckasc4b7fnwe	9sto1ohnw3rmjcfwofqoguxrjw				I figured it out. lol		{}		[]	[]	f
rpkf6d7b9tfd5g9ia8n5ynr1wo	1492369880120	1492369880120	0	0	h4abgq5mytf4dja9g9bnkthh6h	b38u38ks67f47rmey1ncudzj5c				Thomas Carrio pushed to branch [master](http://dosr.carrio.me:8000/dosr/dosr-web/commits/master) of [dosr/dosr-web](http://dosr.carrio.me:8000/dosr/dosr-web) ([Compare changes](http://dosr.carrio.me:8000/dosr/dosr-web/compare/1a1dce15b8902da1ac3868e5ca1314e7729c2be9...7d4e37b5dce18daebdae6a5d01678b7b8b75b0c0))	slack_attachment	{"attachments":[{"id":0,"fallback":"","color":"#345","pretext":"","author_name":"","author_link":"","author_icon":"","title":"","title_link":"","text":"[7d4e37b5](http://dosr.carrio.me:8000/dosr/dosr-web/commit/7d4e37b5dce18daebdae6a5d01678b7b8b75b0c0): Added basic README\\n - tcarrio","fields":null,"image_url":"","thumb_url":"","footer":"","footer_icon":"","ts":null}],"from_webhook":"true"}		[]	[]	f
6bfi7oz35in5zx93f54agkqqpy	1492370277321	1492370277321	0	0	h4abgq5mytf4dja9g9bnkthh6h	nddfhtkiuigp5jbtb7n45fitqo				When you finish the database-integration with no database data:\n		{}		[]	["kxergh3xebgw9xffzh9j8pt9gw"]	f
ub8kb53qrjdhzctzsweconfwjo	1492372397421	1492372397421	0	0	h4abgq5mytf4dja9g9bnkthh6h	9sto1ohnw3rmjcfwofqoguxrjw				Chase Ehlert pushed to branch [master](http://dosr.carrio.me:8000/dosr/dosr-sql/commits/master) of [dosr/dosr-sql](http://dosr.carrio.me:8000/dosr/dosr-sql) ([Compare changes](http://dosr.carrio.me:8000/dosr/dosr-sql/compare/a6089fddc2fc794d18a7bc8a6d8f6c2ae19727f0...76c6e4418506281ff741c776716c55fc78de6c4f))	slack_attachment	{"attachments":[{"id":0,"fallback":"","color":"#345","pretext":"","author_name":"","author_link":"","author_icon":"","title":"","title_link":"","text":"[76c6e441](http://dosr.carrio.me:8000/dosr/dosr-sql/commit/76c6e4418506281ff741c776716c55fc78de6c4f): Add new file - Chase Ehlert","fields":null,"image_url":"","thumb_url":"","footer":"","footer_icon":"","ts":null}],"from_webhook":"true"}		[]	[]	f
oacejw99o3bu3qkyctwjbrnn8o	1492372410727	1492372410727	0	0	h4abgq5mytf4dja9g9bnkthh6h	9sto1ohnw3rmjcfwofqoguxrjw				You can fix the table schema with ALTER\n\n```sql\nALTER TABLE Features DROP url;\nALTER TABLE Features RENAME image TO icon;\n```		{}		[]	[]	f
pdwcm5i1opdktcr8jwjfwairxh	1492372505490	1492372505490	0	0	t41d7xuuxfd498ckasc4b7fnwe	9sto1ohnw3rmjcfwofqoguxrjw				The table issue is fixed.		{}		[]	[]	f
hiqnhy55b3rk3bxxeq6owcj3pe	1492372512565	1492372512565	0	0	h4abgq5mytf4dja9g9bnkthh6h	9sto1ohnw3rmjcfwofqoguxrjw				Thomas Carrio pushed to branch [master](http://dosr.carrio.me:8000/dosr/dosr-sql/commits/master) of [dosr/dosr-sql](http://dosr.carrio.me:8000/dosr/dosr-sql) ([Compare changes](http://dosr.carrio.me:8000/dosr/dosr-sql/compare/76c6e4418506281ff741c776716c55fc78de6c4f...663d9b3f2feb480602910a013f0b685e99781e6f))	slack_attachment	{"attachments":[{"id":0,"fallback":"","color":"#345","pretext":"","author_name":"","author_link":"","author_icon":"","title":"","title_link":"","text":"[5665aa2d](http://dosr.carrio.me:8000/dosr/dosr-sql/commit/5665aa2d9d9d58a36ece828e184d7fa5a6455b92): Removed url, renamed image-\\u003eicon\\n - tcarrio\\n[663d9b3f](http://dosr.carrio.me:8000/dosr/dosr-sql/commit/663d9b3f2feb480602910a013f0b685e99781e6f): Merge branch 'master' of dosr.carrio.me:dosr/dosr-sql\\n - tcarrio","fields":null,"image_url":"","thumb_url":"","footer":"","footer_icon":"","ts":null}],"from_webhook":"true"}		[]	[]	f
nhbcf45413rh8q9x9src51kn9o	1492372578858	1492372578858	0	0	h4abgq5mytf4dja9g9bnkthh6h	9sto1ohnw3rmjcfwofqoguxrjw				Chase Ehlert pushed to branch [master](http://dosr.carrio.me:8000/dosr/dosr-sql/commits/master) of [dosr/dosr-sql](http://dosr.carrio.me:8000/dosr/dosr-sql) ([Compare changes](http://dosr.carrio.me:8000/dosr/dosr-sql/compare/663d9b3f2feb480602910a013f0b685e99781e6f...aafc807f3bd63dbbc265f555d0b7e8601bdc5d09))	slack_attachment	{"attachments":[{"id":0,"fallback":"","color":"#345","pretext":"","author_name":"","author_link":"","author_icon":"","title":"","title_link":"","text":"[aafc807f](http://dosr.carrio.me:8000/dosr/dosr-sql/commit/aafc807f3bd63dbbc265f555d0b7e8601bdc5d09): Update fillTables.sql - Chase Ehlert","fields":null,"image_url":"","thumb_url":"","footer":"","footer_icon":"","ts":null}],"from_webhook":"true"}		[]	[]	f
m6bg8945wffo7yemwsjdekk4ra	1492372616437	1492372616437	0	0	h4abgq5mytf4dja9g9bnkthh6h	9sto1ohnw3rmjcfwofqoguxrjw				Chase Ehlert pushed to branch [master](http://dosr.carrio.me:8000/dosr/dosr-sql/commits/master) of [dosr/dosr-sql](http://dosr.carrio.me:8000/dosr/dosr-sql) ([Compare changes](http://dosr.carrio.me:8000/dosr/dosr-sql/compare/aafc807f3bd63dbbc265f555d0b7e8601bdc5d09...1f3cd53e24e399391bd49f1a39e7dbe453ce30c1))	slack_attachment	{"attachments":[{"id":0,"fallback":"","color":"#345","pretext":"","author_name":"","author_link":"","author_icon":"","title":"","title_link":"","text":"[1f3cd53e](http://dosr.carrio.me:8000/dosr/dosr-sql/commit/1f3cd53e24e399391bd49f1a39e7dbe453ce30c1): Update fillTables.sql - Chase Ehlert","fields":null,"image_url":"","thumb_url":"","footer":"","footer_icon":"","ts":null}],"from_webhook":"true"}		[]	[]	f
sxro1e3tg7rm8835si1jznjzro	1492372909563	1492372909563	0	0	h4abgq5mytf4dja9g9bnkthh6h	9sto1ohnw3rmjcfwofqoguxrjw				Chase Ehlert pushed to branch [master](http://dosr.carrio.me:8000/dosr/dosr-sql/commits/master) of [dosr/dosr-sql](http://dosr.carrio.me:8000/dosr/dosr-sql) ([Compare changes](http://dosr.carrio.me:8000/dosr/dosr-sql/compare/1f3cd53e24e399391bd49f1a39e7dbe453ce30c1...0fd1186d2c7ca01cfbdb5532c6e2babc19bd1122))	slack_attachment	{"attachments":[{"id":0,"fallback":"","color":"#345","pretext":"","author_name":"","author_link":"","author_icon":"","title":"","title_link":"","text":"[0fd1186d](http://dosr.carrio.me:8000/dosr/dosr-sql/commit/0fd1186d2c7ca01cfbdb5532c6e2babc19bd1122): Update fillTables.sql - Chase Ehlert","fields":null,"image_url":"","thumb_url":"","footer":"","footer_icon":"","ts":null}],"from_webhook":"true"}		[]	[]	f
86fnutiugbn7uj7q5baqgazjge	1492373078319	1492373078319	0	0	h4abgq5mytf4dja9g9bnkthh6h	9sto1ohnw3rmjcfwofqoguxrjw				Chase Ehlert pushed to branch [master](http://dosr.carrio.me:8000/dosr/dosr-sql/commits/master) of [dosr/dosr-sql](http://dosr.carrio.me:8000/dosr/dosr-sql) ([Compare changes](http://dosr.carrio.me:8000/dosr/dosr-sql/compare/0fd1186d2c7ca01cfbdb5532c6e2babc19bd1122...b6285d1887d1b0da8afc576b76816ea1fb2e0e43))	slack_attachment	{"attachments":[{"id":0,"fallback":"","color":"#345","pretext":"","author_name":"","author_link":"","author_icon":"","title":"","title_link":"","text":"[b6285d18](http://dosr.carrio.me:8000/dosr/dosr-sql/commit/b6285d1887d1b0da8afc576b76816ea1fb2e0e43): Update fillTables.sql - Chase Ehlert","fields":null,"image_url":"","thumb_url":"","footer":"","footer_icon":"","ts":null}],"from_webhook":"true"}		[]	[]	f
ftf5wem9cpdd8xtzo8dx81pm9a	1492373150751	1492373150751	0	0	h4abgq5mytf4dja9g9bnkthh6h	9sto1ohnw3rmjcfwofqoguxrjw				Thomas Carrio pushed to branch [master](http://dosr.carrio.me:8000/dosr/dosr-sql/commits/master) of [dosr/dosr-sql](http://dosr.carrio.me:8000/dosr/dosr-sql) ([Compare changes](http://dosr.carrio.me:8000/dosr/dosr-sql/compare/b6285d1887d1b0da8afc576b76816ea1fb2e0e43...09cc7d3c57e5690308aaa53098ca662dda5f124b))	slack_attachment	{"attachments":[{"id":0,"fallback":"","color":"#345","pretext":"","author_name":"","author_link":"","author_icon":"","title":"","title_link":"","text":"[09cc7d3c](http://dosr.carrio.me:8000/dosr/dosr-sql/commit/09cc7d3c57e5690308aaa53098ca662dda5f124b): Updated to drop tables prior to generation\\n - tcarrio","fields":null,"image_url":"","thumb_url":"","footer":"","footer_icon":"","ts":null}],"from_webhook":"true"}		[]	[]	f
jay5yi5rj383txmnz89xjx78fe	1492373864746	1492373864746	0	0	h4abgq5mytf4dja9g9bnkthh6h	9sto1ohnw3rmjcfwofqoguxrjw				Thomas Carrio pushed to branch [master](http://dosr.carrio.me:8000/dosr/dosr-sql/commits/master) of [dosr/dosr-sql](http://dosr.carrio.me:8000/dosr/dosr-sql) ([Compare changes](http://dosr.carrio.me:8000/dosr/dosr-sql/compare/09cc7d3c57e5690308aaa53098ca662dda5f124b...4dd3679f0719dce5a51fcbec289e87ab2c4792aa))	slack_attachment	{"attachments":[{"id":0,"fallback":"","color":"#345","pretext":"","author_name":"","author_link":"","author_icon":"","title":"","title_link":"","text":"[4dd3679f](http://dosr.carrio.me:8000/dosr/dosr-sql/commit/4dd3679f0719dce5a51fcbec289e87ab2c4792aa): Fixed icons\\n - tcarrio","fields":null,"image_url":"","thumb_url":"","footer":"","footer_icon":"","ts":null}],"from_webhook":"true"}		[]	[]	f
t9qakip1dbrm3pbo3osg4p8hbw	1492373886729	1492373886729	0	0	h4abgq5mytf4dja9g9bnkthh6h	9sto1ohnw3rmjcfwofqoguxrjw				Chase Ehlert pushed to branch [master](http://dosr.carrio.me:8000/dosr/dosr-sql/commits/master) of [dosr/dosr-sql](http://dosr.carrio.me:8000/dosr/dosr-sql) ([Compare changes](http://dosr.carrio.me:8000/dosr/dosr-sql/compare/4dd3679f0719dce5a51fcbec289e87ab2c4792aa...69c9b403fe9438c17d0420974801b89468f7a525))	slack_attachment	{"attachments":[{"id":0,"fallback":"","color":"#345","pretext":"","author_name":"","author_link":"","author_icon":"","title":"","title_link":"","text":"[69c9b403](http://dosr.carrio.me:8000/dosr/dosr-sql/commit/69c9b403fe9438c17d0420974801b89468f7a525): Update fillTables.sql - Chase Ehlert","fields":null,"image_url":"","thumb_url":"","footer":"","footer_icon":"","ts":null}],"from_webhook":"true"}		[]	[]	f
owme8a1113g1pdsswaxiwetjia	1492374056466	1492374056466	0	0	h4abgq5mytf4dja9g9bnkthh6h	9sto1ohnw3rmjcfwofqoguxrjw				Chase Ehlert pushed to branch [master](http://dosr.carrio.me:8000/dosr/dosr-sql/commits/master) of [dosr/dosr-sql](http://dosr.carrio.me:8000/dosr/dosr-sql) ([Compare changes](http://dosr.carrio.me:8000/dosr/dosr-sql/compare/69c9b403fe9438c17d0420974801b89468f7a525...0f161481f20bdd863692ee0486f5d600d9836b3e))	slack_attachment	{"attachments":[{"id":0,"fallback":"","color":"#345","pretext":"","author_name":"","author_link":"","author_icon":"","title":"","title_link":"","text":"[0f161481](http://dosr.carrio.me:8000/dosr/dosr-sql/commit/0f161481f20bdd863692ee0486f5d600d9836b3e): Update fillTables.sql - Chase Ehlert","fields":null,"image_url":"","thumb_url":"","footer":"","footer_icon":"","ts":null}],"from_webhook":"true"}		[]	[]	f
5fyagwukobry9getxy7gt58gyr	1492374377743	1492374377743	0	0	t41d7xuuxfd498ckasc4b7fnwe	9sto1ohnw3rmjcfwofqoguxrjw				I'm getting an error when I attempt to insert a file into the db:\n		{}		[]	["tuurgw6umt8rjxss7xecxt7yqr"]	f
4jpzg4qwebdamczqxjbxat1eeo	1492374433899	1492374433899	0	0	h4abgq5mytf4dja9g9bnkthh6h	9sto1ohnw3rmjcfwofqoguxrjw				`\\i C:\\path\\to\\script.sql`		{}		[]	[]	f
hccnsfkg338a9gtotjgmqp9i7a	1492374914195	1492374914195	0	0	h4abgq5mytf4dja9g9bnkthh6h	9sto1ohnw3rmjcfwofqoguxrjw				Thomas Carrio pushed to branch [master](http://dosr.carrio.me:8000/dosr/dosr-sql/commits/master) of [dosr/dosr-sql](http://dosr.carrio.me:8000/dosr/dosr-sql) ([Compare changes](http://dosr.carrio.me:8000/dosr/dosr-sql/compare/0f161481f20bdd863692ee0486f5d600d9836b3e...3bffdebb9c06a017a4d987047b61836a08cc821e))	slack_attachment	{"attachments":[{"id":0,"fallback":"","color":"#345","pretext":"","author_name":"","author_link":"","author_icon":"","title":"","title_link":"","text":"[3bffdebb](http://dosr.carrio.me:8000/dosr/dosr-sql/commit/3bffdebb9c06a017a4d987047b61836a08cc821e): Fixed database schema and stuff\\n - tcarrio","fields":null,"image_url":"","thumb_url":"","footer":"","footer_icon":"","ts":null}],"from_webhook":"true"}		[]	[]	f
gezjgot3u3gfpxnxdrwbgqsi3a	1492374935317	1492374935317	0	0	h4abgq5mytf4dja9g9bnkthh6h	9sto1ohnw3rmjcfwofqoguxrjw				Chase Ehlert pushed to branch [master](http://dosr.carrio.me:8000/dosr/dosr-sql/commits/master) of [dosr/dosr-sql](http://dosr.carrio.me:8000/dosr/dosr-sql) ([Compare changes](http://dosr.carrio.me:8000/dosr/dosr-sql/compare/3bffdebb9c06a017a4d987047b61836a08cc821e...9d7a6b7edd6d1769e5c91000d747da90da49dda3))	slack_attachment	{"attachments":[{"id":0,"fallback":"","color":"#345","pretext":"","author_name":"","author_link":"","author_icon":"","title":"","title_link":"","text":"[9d7a6b7e](http://dosr.carrio.me:8000/dosr/dosr-sql/commit/9d7a6b7edd6d1769e5c91000d747da90da49dda3): Update fillTables.sql - Chase Ehlert","fields":null,"image_url":"","thumb_url":"","footer":"","footer_icon":"","ts":null}],"from_webhook":"true"}		[]	[]	f
6by57figg3bf3nenibxfnwfmzr	1492377441100	1492377441100	0	0	h4abgq5mytf4dja9g9bnkthh6h	9sto1ohnw3rmjcfwofqoguxrjw				Chase Ehlert pushed to branch [master](http://dosr.carrio.me:8000/dosr/dosr-sql/commits/master) of [dosr/dosr-sql](http://dosr.carrio.me:8000/dosr/dosr-sql) ([Compare changes](http://dosr.carrio.me:8000/dosr/dosr-sql/compare/485c0257a032d43b487c462933d0a14e5c6361ba...b2b42537d46a51144b60934822777b7516bb1765))	slack_attachment	{"attachments":[{"id":0,"fallback":"","color":"#345","pretext":"","author_name":"","author_link":"","author_icon":"","title":"","title_link":"","text":"[b2b42537](http://dosr.carrio.me:8000/dosr/dosr-sql/commit/b2b42537d46a51144b60934822777b7516bb1765): Update fillTables.sql - Chase Ehlert","fields":null,"image_url":"","thumb_url":"","footer":"","footer_icon":"","ts":null}],"from_webhook":"true"}		[]	[]	f
tmn6tybon7bo3ppk6ozk5wiqec	1492376133957	1492376133957	0	0	h4abgq5mytf4dja9g9bnkthh6h	b38u38ks67f47rmey1ncudzj5c				Thomas Carrio pushed to branch [master](http://dosr.carrio.me:8000/dosr/dosr-web/commits/master) of [dosr/dosr-web](http://dosr.carrio.me:8000/dosr/dosr-web) ([Compare changes](http://dosr.carrio.me:8000/dosr/dosr-web/compare/7d4e37b5dce18daebdae6a5d01678b7b8b75b0c0...b78ac26877f210b665a80b70663847f7370ea80a))	slack_attachment	{"attachments":[{"id":0,"fallback":"","color":"#345","pretext":"","author_name":"","author_link":"","author_icon":"","title":"","title_link":"","text":"[b78ac268](http://dosr.carrio.me:8000/dosr/dosr-web/commit/b78ac26877f210b665a80b70663847f7370ea80a): Updated template for db integration\\n - tcarrio","fields":null,"image_url":"","thumb_url":"","footer":"","footer_icon":"","ts":null}],"from_webhook":"true"}		[]	[]	f
8eubgoawqpr9dxq8ugyqczrxtc	1492376264674	1492376264674	0	0	h4abgq5mytf4dja9g9bnkthh6h	9sto1ohnw3rmjcfwofqoguxrjw				Thomas Carrio pushed to branch [master](http://dosr.carrio.me:8000/dosr/dosr-sql/commits/master) of [dosr/dosr-sql](http://dosr.carrio.me:8000/dosr/dosr-sql) ([Compare changes](http://dosr.carrio.me:8000/dosr/dosr-sql/compare/9d7a6b7edd6d1769e5c91000d747da90da49dda3...485c0257a032d43b487c462933d0a14e5c6361ba))	slack_attachment	{"attachments":[{"id":0,"fallback":"","color":"#345","pretext":"","author_name":"","author_link":"","author_icon":"","title":"","title_link":"","text":"[1a609441](http://dosr.carrio.me:8000/dosr/dosr-sql/commit/1a609441346d00dbd95b149a4dbeab7e5b9a34e9): Updated image locations (who needs to host their own images anyways)\\n - tcarrio\\n[485c0257](http://dosr.carrio.me:8000/dosr/dosr-sql/commit/485c0257a032d43b487c462933d0a14e5c6361ba): Updated image locations (who needs to host their own images anyways)\\n - tcarrio","fields":null,"image_url":"","thumb_url":"","footer":"","footer_icon":"","ts":null}],"from_webhook":"true"}		[]	[]	f
zn9kym9n5jrktqb9s4pwg3wjda	1492377671818	1492377671818	0	0	h4abgq5mytf4dja9g9bnkthh6h	b38u38ks67f47rmey1ncudzj5c				Thomas Carrio pushed to branch [master](http://dosr.carrio.me:8000/dosr/dosr-web/commits/master) of [dosr/dosr-web](http://dosr.carrio.me:8000/dosr/dosr-web) ([Compare changes](http://dosr.carrio.me:8000/dosr/dosr-web/compare/b78ac26877f210b665a80b70663847f7370ea80a...af94bb217a82a8f3e963e22e65df6cd53a8ba2bb))	slack_attachment	{"attachments":[{"id":0,"fallback":"","color":"#345","pretext":"","author_name":"","author_link":"","author_icon":"","title":"","title_link":"","text":"[af94bb21](http://dosr.carrio.me:8000/dosr/dosr-web/commit/af94bb217a82a8f3e963e22e65df6cd53a8ba2bb): Added requirements.txt for Python modules, updating app to run on port 80\\n - Tom Carrio","fields":null,"image_url":"","thumb_url":"","footer":"","footer_icon":"","ts":null}],"from_webhook":"true"}		[]	[]	f
kengacsxgpnixeofisi46wkxoe	1492377781890	1492377781890	0	0	h4abgq5mytf4dja9g9bnkthh6h	9sto1ohnw3rmjcfwofqoguxrjw				Chase Ehlert pushed to branch [master](http://dosr.carrio.me:8000/dosr/dosr-sql/commits/master) of [dosr/dosr-sql](http://dosr.carrio.me:8000/dosr/dosr-sql) ([Compare changes](http://dosr.carrio.me:8000/dosr/dosr-sql/compare/b2b42537d46a51144b60934822777b7516bb1765...c7e3e847b79dd97e43ae60998e4b21fb3e4a5110))	slack_attachment	{"attachments":[{"id":0,"fallback":"","color":"#345","pretext":"","author_name":"","author_link":"","author_icon":"","title":"","title_link":"","text":"[c7e3e847](http://dosr.carrio.me:8000/dosr/dosr-sql/commit/c7e3e847b79dd97e43ae60998e4b21fb3e4a5110): Add new file - Chase Ehlert","fields":null,"image_url":"","thumb_url":"","footer":"","footer_icon":"","ts":null}],"from_webhook":"true"}		[]	[]	f
9agmgn7ry3gymp4gy65r7ru53c	1492378918550	1492378918550	0	0	h4abgq5mytf4dja9g9bnkthh6h	b38u38ks67f47rmey1ncudzj5c				Thomas Carrio pushed to branch [master](http://dosr.carrio.me:8000/dosr/dosr-web/commits/master) of [dosr/dosr-web](http://dosr.carrio.me:8000/dosr/dosr-web) ([Compare changes](http://dosr.carrio.me:8000/dosr/dosr-web/compare/af94bb217a82a8f3e963e22e65df6cd53a8ba2bb...308eaaa44756b5d8b0a33bd3af88a677d1595cb7))	slack_attachment	{"attachments":[{"id":0,"fallback":"","color":"#345","pretext":"","author_name":"","author_link":"","author_icon":"","title":"","title_link":"","text":"[308eaaa4](http://dosr.carrio.me:8000/dosr/dosr-web/commit/308eaaa44756b5d8b0a33bd3af88a677d1595cb7): Web server functionality now provided through nginx + WSGI + gunicorn\\n - Tom Carrio","fields":null,"image_url":"","thumb_url":"","footer":"","footer_icon":"","ts":null}],"from_webhook":"true"}		[]	[]	f
tbg9mr4t17rc9kpue749oo9w1e	1492379005575	1492379005575	0	0	h4abgq5mytf4dja9g9bnkthh6h	b38u38ks67f47rmey1ncudzj5c				Thomas Carrio pushed to branch [master](http://dosr.carrio.me:8000/dosr/dosr-web/commits/master) of [dosr/dosr-web](http://dosr.carrio.me:8000/dosr/dosr-web) ([Compare changes](http://dosr.carrio.me:8000/dosr/dosr-web/compare/308eaaa44756b5d8b0a33bd3af88a677d1595cb7...1fe3a0762f92fd7c899b42aa541d3e194bc897cf))	slack_attachment	{"attachments":[{"id":0,"fallback":"","color":"#345","pretext":"","author_name":"","author_link":"","author_icon":"","title":"","title_link":"","text":"[1fe3a076](http://dosr.carrio.me:8000/dosr/dosr-web/commit/1fe3a0762f92fd7c899b42aa541d3e194bc897cf): Including systemd unit file for server\\n - Tom Carrio","fields":null,"image_url":"","thumb_url":"","footer":"","footer_icon":"","ts":null}],"from_webhook":"true"}		[]	[]	f
iez543ert7dstq7bqrbkcyjqua	1492379054679	1492379054679	0	0	h4abgq5mytf4dja9g9bnkthh6h	b38u38ks67f47rmey1ncudzj5c				Thomas Carrio pushed to branch [master](http://dosr.carrio.me:8000/dosr/dosr-web/commits/master) of [dosr/dosr-web](http://dosr.carrio.me:8000/dosr/dosr-web) ([Compare changes](http://dosr.carrio.me:8000/dosr/dosr-web/compare/1fe3a0762f92fd7c899b42aa541d3e194bc897cf...f7039a251cd82ff8d1e8dc6e078f2e96f1414bd7))	slack_attachment	{"attachments":[{"id":0,"fallback":"","color":"#345","pretext":"","author_name":"","author_link":"","author_icon":"","title":"","title_link":"","text":"[f7039a25](http://dosr.carrio.me:8000/dosr/dosr-web/commit/f7039a251cd82ff8d1e8dc6e078f2e96f1414bd7): Including nginx reverse proxy config\\n - Tom Carrio","fields":null,"image_url":"","thumb_url":"","footer":"","footer_icon":"","ts":null}],"from_webhook":"true"}		[]	[]	f
p8fnw7yf9trcmpki4dhf86n5jy	1492383363661	1492383363661	0	0	h4abgq5mytf4dja9g9bnkthh6h	b38u38ks67f47rmey1ncudzj5c				[[dosr/dosr-web](http://dosr.carrio.me:8000/dosr/dosr-web)] Issue [#1 Implement Flask backend](http://dosr.carrio.me:8000/dosr/dosr-web/issues/1) closed by tlcarrio		{"from_webhook":"true"}		[]	[]	f
g56dmoyfn7gcuy5smqtfzgf7xo	1492383394106	1492383394106	0	0	h4abgq5mytf4dja9g9bnkthh6h	b38u38ks67f47rmey1ncudzj5c				Commit with confirmed working db interaction: b78ac26877f210b665a80b70663847f7370ea80a		{}		[]	[]	f
fzfsrw3wzf8fpjjb94ypdtd3ar	1492383986050	1492383986050	0	0	h4abgq5mytf4dja9g9bnkthh6h	b38u38ks67f47rmey1ncudzj5c				[[dosr/dosr-web](http://dosr.carrio.me:8000/dosr/dosr-web)] Issue [#2 PostgreSQL backend](http://dosr.carrio.me:8000/dosr/dosr-web/issues/2) closed by cwehlert		{"from_webhook":"true"}		[]	[]	f
\.


--
-- Data for Name: preferences; Type: TABLE DATA; Schema: public; Owner: mmuser
--

COPY "preferences" ("userid", "category", "name", "value") FROM stdin;
jsu11197jini3x14aqcz7fqxha	tutorial_step	jsu11197jini3x14aqcz7fqxha	0
tyouyom5cina8b43s1s3yohz3w	tutorial_step	tyouyom5cina8b43s1s3yohz3w	1
t41d7xuuxfd498ckasc4b7fnwe	tutorial_step	t41d7xuuxfd498ckasc4b7fnwe	999
h4abgq5mytf4dja9g9bnkthh6h	tutorial_step	h4abgq5mytf4dja9g9bnkthh6h	999
\.


--
-- Data for Name: reactions; Type: TABLE DATA; Schema: public; Owner: mmuser
--

COPY "reactions" ("userid", "postid", "emojiname", "createat") FROM stdin;
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: mmuser
--

COPY "sessions" ("id", "token", "createat", "expiresat", "lastactivityat", "userid", "deviceid", "roles", "isoauth", "props") FROM stdin;
8h6sqjbmiiyjpberdi6yhyzcqe	af73fbdzmt8ftfkun739pzfr1c	1491359560102	1493951560102	1491359560102	tyouyom5cina8b43s1s3yohz3w		system_user	f	{"browser":"Chrome/57.0.2987.133","os":"Linux x86_64","platform":"X11"}
snn13ueu77ddfrdk7xo6e43r1o	axw7x8uct3gxbyk8fpbi7ooybr	1491413893880	1494005893880	1491413895191	h4abgq5mytf4dja9g9bnkthh6h		system_user	f	{"browser":"Firefox/52.0","os":"Linux x86_64","platform":"X11"}
ktdgfssfjfr15kuh7nzod5hbgr	xomkd5uur3g8tje3tc14sm6p8y	1491414292148	1494006292148	1491414292148	h4abgq5mytf4dja9g9bnkthh6h		system_user	f	{"browser":"Safari/4.0.4","os":"Linux x86_64","platform":"X11"}
3wdixugknidt3k5ufa67w3y9ja	rd4sap8g7tb8581y7ugnejazbw	1491415915832	1494007915832	1491415917139	t41d7xuuxfd498ckasc4b7fnwe		system_user	f	{"browser":"Chrome/57.0.2987.133","os":"Linux x86_64","platform":"X11"}
5oq99kebt3dipyt1co1ah39e8a	fegorr9imfrcfy3u54spq1yz7e	1492355374759	1494947374759	1492355375179	t41d7xuuxfd498ckasc4b7fnwe		system_user	f	{"browser":"Chrome/57.0.2987.133","os":"Windows NT 10.0","platform":"Windows"}
7j5tez9cnjrsun1bxeg6fokxtc	ykp5yadfcjgp9dkp7rxry1km3y	1492350849582	1494942849582	1492361121672	h4abgq5mytf4dja9g9bnkthh6h		system_user	f	{"browser":"Firefox/52.0","os":"Linux x86_64","platform":"X11"}
\.


--
-- Data for Name: status; Type: TABLE DATA; Schema: public; Owner: mmuser
--

COPY "status" ("userid", "status", "manual", "lastactivityat") FROM stdin;
h4abgq5mytf4dja9g9bnkthh6h	away	f	1492388075107
t41d7xuuxfd498ckasc4b7fnwe	away	f	1492389455167
jsu11197jini3x14aqcz7fqxha	offline	f	1492350705082
tyouyom5cina8b43s1s3yohz3w	offline	f	1492350824996
\.


--
-- Data for Name: systems; Type: TABLE DATA; Schema: public; Owner: mmuser
--

COPY "systems" ("name", "value") FROM stdin;
Version	3.7.0
DiagnosticId	j89ixdw9st8m7ksiw6c1b3y57e
LastSecurityTime	1492315225172
\.


--
-- Data for Name: teammembers; Type: TABLE DATA; Schema: public; Owner: mmuser
--

COPY "teammembers" ("teamid", "userid", "roles", "deleteat") FROM stdin;
8mprsfmosjgappisgoc8rixtma	tyouyom5cina8b43s1s3yohz3w	team_user team_admin	0
595zacsnhtfmtg1xixfuq1nesh	h4abgq5mytf4dja9g9bnkthh6h	team_user team_admin	0
595zacsnhtfmtg1xixfuq1nesh	t41d7xuuxfd498ckasc4b7fnwe	team_user	0
\.


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: mmuser
--

COPY "teams" ("id", "createat", "updateat", "deleteat", "displayname", "name", "description", "email", "type", "companyname", "alloweddomains", "inviteid", "allowopeninvite") FROM stdin;
8mprsfmosjgappisgoc8rixtma	1491359585608	1491359585608	0	Test Plz Ignore	test-plz-ignore		admin@example.com	O			o7eauk9i53gmxx5ngqdrcxzcfc	f
595zacsnhtfmtg1xixfuq1nesh	1492319134037	1492355053553	0	dosr	dosr	dev ops stack reborn	tlcarrio@cit349.ou	O			dosr-chat	f
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: mmuser
--

COPY "users" ("id", "createat", "updateat", "deleteat", "username", "password", "authdata", "authservice", "email", "emailverified", "nickname", "firstname", "lastname", "position", "roles", "allowmarketing", "props", "notifyprops", "lastpasswordupdate", "lastpictureupdate", "failedattempts", "locale", "mfaactive", "mfasecret") FROM stdin;
jsu11197jini3x14aqcz7fqxha	1491358363970	1491358363970	0	root	$2a$10$Z5bs3El4PleD/R8M9JZ/UOK6D1YLskr1TJq2lHf45Ns1itxBouh..	\N		tom@carrio.me	f					system_admin system_user	t	{}	{"channel":"true","desktop":"all","desktop_sound":"true","email":"true","first_name":"false","mention_keys":"root,@root","push":"mention"}	1491358363970	0	0	en	f	
t41d7xuuxfd498ckasc4b7fnwe	1491362014939	1492355391055	0	cwehlert		3	gitlab	cwehlert@cit349.ou	t		Chase	Ehlert		system_user	f	{}	{"channel":"true","desktop":"all","desktop_sound":"true","email":"true","first_name":"true","mention_keys":"cwehlert,@cwehlert","push":"mention"}	1491362014939	0	0	en	f	
tyouyom5cina8b43s1s3yohz3w	1491359549716	1491359585619	0	root0		1	gitlab	admin@example.com	t		Administrator			system_user	f	{}	{"channel":"true","desktop":"all","desktop_sound":"true","email":"true","first_name":"true","mention_keys":"root0,@root0","push":"mention"}	1491359549716	0	0	en	f	
h4abgq5mytf4dja9g9bnkthh6h	1491362104067	1492319134087	0	tlcarrio		2	gitlab	tlcarrio@cit349.ou	t		Thomas	Carrio		system_user	f	{}	{"channel":"true","desktop":"all","desktop_sound":"true","email":"true","first_name":"true","mention_keys":"tlcarrio,@tlcarrio","push":"mention"}	1491362104067	0	0	en	f	
\.


--
-- Name: audits audits_pkey; Type: CONSTRAINT; Schema: public; Owner: mmuser
--

ALTER TABLE ONLY "audits"
    ADD CONSTRAINT "audits_pkey" PRIMARY KEY ("id");


--
-- Name: channelmembers channelmembers_pkey; Type: CONSTRAINT; Schema: public; Owner: mmuser
--

ALTER TABLE ONLY "channelmembers"
    ADD CONSTRAINT "channelmembers_pkey" PRIMARY KEY ("channelid", "userid");


--
-- Name: channels channels_name_teamid_key; Type: CONSTRAINT; Schema: public; Owner: mmuser
--

ALTER TABLE ONLY "channels"
    ADD CONSTRAINT "channels_name_teamid_key" UNIQUE ("name", "teamid");


--
-- Name: channels channels_pkey; Type: CONSTRAINT; Schema: public; Owner: mmuser
--

ALTER TABLE ONLY "channels"
    ADD CONSTRAINT "channels_pkey" PRIMARY KEY ("id");


--
-- Name: commands commands_pkey; Type: CONSTRAINT; Schema: public; Owner: mmuser
--

ALTER TABLE ONLY "commands"
    ADD CONSTRAINT "commands_pkey" PRIMARY KEY ("id");


--
-- Name: compliances compliances_pkey; Type: CONSTRAINT; Schema: public; Owner: mmuser
--

ALTER TABLE ONLY "compliances"
    ADD CONSTRAINT "compliances_pkey" PRIMARY KEY ("id");


--
-- Name: emoji emoji_name_deleteat_key; Type: CONSTRAINT; Schema: public; Owner: mmuser
--

ALTER TABLE ONLY "emoji"
    ADD CONSTRAINT "emoji_name_deleteat_key" UNIQUE ("name", "deleteat");


--
-- Name: emoji emoji_pkey; Type: CONSTRAINT; Schema: public; Owner: mmuser
--

ALTER TABLE ONLY "emoji"
    ADD CONSTRAINT "emoji_pkey" PRIMARY KEY ("id");


--
-- Name: fileinfo fileinfo_pkey; Type: CONSTRAINT; Schema: public; Owner: mmuser
--

ALTER TABLE ONLY "fileinfo"
    ADD CONSTRAINT "fileinfo_pkey" PRIMARY KEY ("id");


--
-- Name: incomingwebhooks incomingwebhooks_pkey; Type: CONSTRAINT; Schema: public; Owner: mmuser
--

ALTER TABLE ONLY "incomingwebhooks"
    ADD CONSTRAINT "incomingwebhooks_pkey" PRIMARY KEY ("id");


--
-- Name: licenses licenses_pkey; Type: CONSTRAINT; Schema: public; Owner: mmuser
--

ALTER TABLE ONLY "licenses"
    ADD CONSTRAINT "licenses_pkey" PRIMARY KEY ("id");


--
-- Name: oauthaccessdata oauthaccessdata_clientid_userid_key; Type: CONSTRAINT; Schema: public; Owner: mmuser
--

ALTER TABLE ONLY "oauthaccessdata"
    ADD CONSTRAINT "oauthaccessdata_clientid_userid_key" UNIQUE ("clientid", "userid");


--
-- Name: oauthaccessdata oauthaccessdata_pkey; Type: CONSTRAINT; Schema: public; Owner: mmuser
--

ALTER TABLE ONLY "oauthaccessdata"
    ADD CONSTRAINT "oauthaccessdata_pkey" PRIMARY KEY ("token");


--
-- Name: oauthapps oauthapps_pkey; Type: CONSTRAINT; Schema: public; Owner: mmuser
--

ALTER TABLE ONLY "oauthapps"
    ADD CONSTRAINT "oauthapps_pkey" PRIMARY KEY ("id");


--
-- Name: oauthauthdata oauthauthdata_pkey; Type: CONSTRAINT; Schema: public; Owner: mmuser
--

ALTER TABLE ONLY "oauthauthdata"
    ADD CONSTRAINT "oauthauthdata_pkey" PRIMARY KEY ("code");


--
-- Name: outgoingwebhooks outgoingwebhooks_pkey; Type: CONSTRAINT; Schema: public; Owner: mmuser
--

ALTER TABLE ONLY "outgoingwebhooks"
    ADD CONSTRAINT "outgoingwebhooks_pkey" PRIMARY KEY ("id");


--
-- Name: passwordrecovery passwordrecovery_pkey; Type: CONSTRAINT; Schema: public; Owner: mmuser
--

ALTER TABLE ONLY "passwordrecovery"
    ADD CONSTRAINT "passwordrecovery_pkey" PRIMARY KEY ("userid");


--
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: mmuser
--

ALTER TABLE ONLY "posts"
    ADD CONSTRAINT "posts_pkey" PRIMARY KEY ("id");


--
-- Name: preferences preferences_pkey; Type: CONSTRAINT; Schema: public; Owner: mmuser
--

ALTER TABLE ONLY "preferences"
    ADD CONSTRAINT "preferences_pkey" PRIMARY KEY ("userid", "category", "name");


--
-- Name: reactions reactions_pkey; Type: CONSTRAINT; Schema: public; Owner: mmuser
--

ALTER TABLE ONLY "reactions"
    ADD CONSTRAINT "reactions_pkey" PRIMARY KEY ("userid", "postid", "emojiname");


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: mmuser
--

ALTER TABLE ONLY "sessions"
    ADD CONSTRAINT "sessions_pkey" PRIMARY KEY ("id");


--
-- Name: status status_pkey; Type: CONSTRAINT; Schema: public; Owner: mmuser
--

ALTER TABLE ONLY "status"
    ADD CONSTRAINT "status_pkey" PRIMARY KEY ("userid");


--
-- Name: systems systems_pkey; Type: CONSTRAINT; Schema: public; Owner: mmuser
--

ALTER TABLE ONLY "systems"
    ADD CONSTRAINT "systems_pkey" PRIMARY KEY ("name");


--
-- Name: teammembers teammembers_pkey; Type: CONSTRAINT; Schema: public; Owner: mmuser
--

ALTER TABLE ONLY "teammembers"
    ADD CONSTRAINT "teammembers_pkey" PRIMARY KEY ("teamid", "userid");


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: mmuser
--

ALTER TABLE ONLY "teams"
    ADD CONSTRAINT "teams_name_key" UNIQUE ("name");


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: mmuser
--

ALTER TABLE ONLY "teams"
    ADD CONSTRAINT "teams_pkey" PRIMARY KEY ("id");


--
-- Name: users users_authdata_key; Type: CONSTRAINT; Schema: public; Owner: mmuser
--

ALTER TABLE ONLY "users"
    ADD CONSTRAINT "users_authdata_key" UNIQUE ("authdata");


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: mmuser
--

ALTER TABLE ONLY "users"
    ADD CONSTRAINT "users_email_key" UNIQUE ("email");


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: mmuser
--

ALTER TABLE ONLY "users"
    ADD CONSTRAINT "users_pkey" PRIMARY KEY ("id");


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: mmuser
--

ALTER TABLE ONLY "users"
    ADD CONSTRAINT "users_username_key" UNIQUE ("username");


--
-- Name: idx_audits_user_id; Type: INDEX; Schema: public; Owner: mmuser
--

CREATE INDEX "idx_audits_user_id" ON "audits" USING "btree" ("userid");


--
-- Name: idx_channelmembers_channel_id; Type: INDEX; Schema: public; Owner: mmuser
--

CREATE INDEX "idx_channelmembers_channel_id" ON "channelmembers" USING "btree" ("channelid");


--
-- Name: idx_channelmembers_user_id; Type: INDEX; Schema: public; Owner: mmuser
--

CREATE INDEX "idx_channelmembers_user_id" ON "channelmembers" USING "btree" ("userid");


--
-- Name: idx_channels_create_at; Type: INDEX; Schema: public; Owner: mmuser
--

CREATE INDEX "idx_channels_create_at" ON "channels" USING "btree" ("createat");


--
-- Name: idx_channels_delete_at; Type: INDEX; Schema: public; Owner: mmuser
--

CREATE INDEX "idx_channels_delete_at" ON "channels" USING "btree" ("deleteat");


--
-- Name: idx_channels_name; Type: INDEX; Schema: public; Owner: mmuser
--

CREATE INDEX "idx_channels_name" ON "channels" USING "btree" ("name");


--
-- Name: idx_channels_team_id; Type: INDEX; Schema: public; Owner: mmuser
--

CREATE INDEX "idx_channels_team_id" ON "channels" USING "btree" ("teamid");


--
-- Name: idx_channels_txt; Type: INDEX; Schema: public; Owner: mmuser
--

CREATE INDEX "idx_channels_txt" ON "channels" USING "gin" ("to_tsvector"('"english"'::"regconfig", ((("name")::"text" || ' '::"text") || ("displayname")::"text")));


--
-- Name: idx_channels_update_at; Type: INDEX; Schema: public; Owner: mmuser
--

CREATE INDEX "idx_channels_update_at" ON "channels" USING "btree" ("updateat");


--
-- Name: idx_command_create_at; Type: INDEX; Schema: public; Owner: mmuser
--

CREATE INDEX "idx_command_create_at" ON "commands" USING "btree" ("createat");


--
-- Name: idx_command_delete_at; Type: INDEX; Schema: public; Owner: mmuser
--

CREATE INDEX "idx_command_delete_at" ON "commands" USING "btree" ("deleteat");


--
-- Name: idx_command_team_id; Type: INDEX; Schema: public; Owner: mmuser
--

CREATE INDEX "idx_command_team_id" ON "commands" USING "btree" ("teamid");


--
-- Name: idx_command_update_at; Type: INDEX; Schema: public; Owner: mmuser
--

CREATE INDEX "idx_command_update_at" ON "commands" USING "btree" ("updateat");


--
-- Name: idx_emoji_create_at; Type: INDEX; Schema: public; Owner: mmuser
--

CREATE INDEX "idx_emoji_create_at" ON "emoji" USING "btree" ("createat");


--
-- Name: idx_emoji_delete_at; Type: INDEX; Schema: public; Owner: mmuser
--

CREATE INDEX "idx_emoji_delete_at" ON "emoji" USING "btree" ("deleteat");


--
-- Name: idx_emoji_update_at; Type: INDEX; Schema: public; Owner: mmuser
--

CREATE INDEX "idx_emoji_update_at" ON "emoji" USING "btree" ("updateat");


--
-- Name: idx_fileinfo_create_at; Type: INDEX; Schema: public; Owner: mmuser
--

CREATE INDEX "idx_fileinfo_create_at" ON "fileinfo" USING "btree" ("createat");


--
-- Name: idx_fileinfo_delete_at; Type: INDEX; Schema: public; Owner: mmuser
--

CREATE INDEX "idx_fileinfo_delete_at" ON "fileinfo" USING "btree" ("deleteat");


--
-- Name: idx_fileinfo_postid_at; Type: INDEX; Schema: public; Owner: mmuser
--

CREATE INDEX "idx_fileinfo_postid_at" ON "fileinfo" USING "btree" ("postid");


--
-- Name: idx_fileinfo_update_at; Type: INDEX; Schema: public; Owner: mmuser
--

CREATE INDEX "idx_fileinfo_update_at" ON "fileinfo" USING "btree" ("updateat");


--
-- Name: idx_incoming_webhook_create_at; Type: INDEX; Schema: public; Owner: mmuser
--

CREATE INDEX "idx_incoming_webhook_create_at" ON "incomingwebhooks" USING "btree" ("createat");


--
-- Name: idx_incoming_webhook_delete_at; Type: INDEX; Schema: public; Owner: mmuser
--

CREATE INDEX "idx_incoming_webhook_delete_at" ON "incomingwebhooks" USING "btree" ("deleteat");


--
-- Name: idx_incoming_webhook_team_id; Type: INDEX; Schema: public; Owner: mmuser
--

CREATE INDEX "idx_incoming_webhook_team_id" ON "incomingwebhooks" USING "btree" ("teamid");


--
-- Name: idx_incoming_webhook_update_at; Type: INDEX; Schema: public; Owner: mmuser
--

CREATE INDEX "idx_incoming_webhook_update_at" ON "incomingwebhooks" USING "btree" ("updateat");


--
-- Name: idx_incoming_webhook_user_id; Type: INDEX; Schema: public; Owner: mmuser
--

CREATE INDEX "idx_incoming_webhook_user_id" ON "incomingwebhooks" USING "btree" ("userid");


--
-- Name: idx_oauthaccessdata_client_id; Type: INDEX; Schema: public; Owner: mmuser
--

CREATE INDEX "idx_oauthaccessdata_client_id" ON "oauthaccessdata" USING "btree" ("clientid");


--
-- Name: idx_oauthaccessdata_refresh_token; Type: INDEX; Schema: public; Owner: mmuser
--

CREATE INDEX "idx_oauthaccessdata_refresh_token" ON "oauthaccessdata" USING "btree" ("refreshtoken");


--
-- Name: idx_oauthaccessdata_user_id; Type: INDEX; Schema: public; Owner: mmuser
--

CREATE INDEX "idx_oauthaccessdata_user_id" ON "oauthaccessdata" USING "btree" ("userid");


--
-- Name: idx_oauthapps_creator_id; Type: INDEX; Schema: public; Owner: mmuser
--

CREATE INDEX "idx_oauthapps_creator_id" ON "oauthapps" USING "btree" ("creatorid");


--
-- Name: idx_oauthauthdata_client_id; Type: INDEX; Schema: public; Owner: mmuser
--

CREATE INDEX "idx_oauthauthdata_client_id" ON "oauthauthdata" USING "btree" ("code");


--
-- Name: idx_outgoing_webhook_create_at; Type: INDEX; Schema: public; Owner: mmuser
--

CREATE INDEX "idx_outgoing_webhook_create_at" ON "outgoingwebhooks" USING "btree" ("createat");


--
-- Name: idx_outgoing_webhook_delete_at; Type: INDEX; Schema: public; Owner: mmuser
--

CREATE INDEX "idx_outgoing_webhook_delete_at" ON "outgoingwebhooks" USING "btree" ("deleteat");


--
-- Name: idx_outgoing_webhook_team_id; Type: INDEX; Schema: public; Owner: mmuser
--

CREATE INDEX "idx_outgoing_webhook_team_id" ON "outgoingwebhooks" USING "btree" ("teamid");


--
-- Name: idx_outgoing_webhook_update_at; Type: INDEX; Schema: public; Owner: mmuser
--

CREATE INDEX "idx_outgoing_webhook_update_at" ON "outgoingwebhooks" USING "btree" ("updateat");


--
-- Name: idx_password_recovery_code; Type: INDEX; Schema: public; Owner: mmuser
--

CREATE INDEX "idx_password_recovery_code" ON "passwordrecovery" USING "btree" ("code");


--
-- Name: idx_posts_channel_id; Type: INDEX; Schema: public; Owner: mmuser
--

CREATE INDEX "idx_posts_channel_id" ON "posts" USING "btree" ("channelid");


--
-- Name: idx_posts_create_at; Type: INDEX; Schema: public; Owner: mmuser
--

CREATE INDEX "idx_posts_create_at" ON "posts" USING "btree" ("createat");


--
-- Name: idx_posts_delete_at; Type: INDEX; Schema: public; Owner: mmuser
--

CREATE INDEX "idx_posts_delete_at" ON "posts" USING "btree" ("deleteat");


--
-- Name: idx_posts_hashtags_txt; Type: INDEX; Schema: public; Owner: mmuser
--

CREATE INDEX "idx_posts_hashtags_txt" ON "posts" USING "gin" ("to_tsvector"('"english"'::"regconfig", ("hashtags")::"text"));


--
-- Name: idx_posts_message_txt; Type: INDEX; Schema: public; Owner: mmuser
--

CREATE INDEX "idx_posts_message_txt" ON "posts" USING "gin" ("to_tsvector"('"english"'::"regconfig", ("message")::"text"));


--
-- Name: idx_posts_root_id; Type: INDEX; Schema: public; Owner: mmuser
--

CREATE INDEX "idx_posts_root_id" ON "posts" USING "btree" ("rootid");


--
-- Name: idx_posts_update_at; Type: INDEX; Schema: public; Owner: mmuser
--

CREATE INDEX "idx_posts_update_at" ON "posts" USING "btree" ("updateat");


--
-- Name: idx_posts_user_id; Type: INDEX; Schema: public; Owner: mmuser
--

CREATE INDEX "idx_posts_user_id" ON "posts" USING "btree" ("userid");


--
-- Name: idx_preferences_category; Type: INDEX; Schema: public; Owner: mmuser
--

CREATE INDEX "idx_preferences_category" ON "preferences" USING "btree" ("category");


--
-- Name: idx_preferences_name; Type: INDEX; Schema: public; Owner: mmuser
--

CREATE INDEX "idx_preferences_name" ON "preferences" USING "btree" ("name");


--
-- Name: idx_preferences_user_id; Type: INDEX; Schema: public; Owner: mmuser
--

CREATE INDEX "idx_preferences_user_id" ON "preferences" USING "btree" ("userid");


--
-- Name: idx_reactions_emoji_name; Type: INDEX; Schema: public; Owner: mmuser
--

CREATE INDEX "idx_reactions_emoji_name" ON "reactions" USING "btree" ("emojiname");


--
-- Name: idx_reactions_post_id; Type: INDEX; Schema: public; Owner: mmuser
--

CREATE INDEX "idx_reactions_post_id" ON "reactions" USING "btree" ("postid");


--
-- Name: idx_reactions_user_id; Type: INDEX; Schema: public; Owner: mmuser
--

CREATE INDEX "idx_reactions_user_id" ON "reactions" USING "btree" ("userid");


--
-- Name: idx_sessions_create_at; Type: INDEX; Schema: public; Owner: mmuser
--

CREATE INDEX "idx_sessions_create_at" ON "sessions" USING "btree" ("createat");


--
-- Name: idx_sessions_expires_at; Type: INDEX; Schema: public; Owner: mmuser
--

CREATE INDEX "idx_sessions_expires_at" ON "sessions" USING "btree" ("expiresat");


--
-- Name: idx_sessions_last_activity_at; Type: INDEX; Schema: public; Owner: mmuser
--

CREATE INDEX "idx_sessions_last_activity_at" ON "sessions" USING "btree" ("lastactivityat");


--
-- Name: idx_sessions_token; Type: INDEX; Schema: public; Owner: mmuser
--

CREATE INDEX "idx_sessions_token" ON "sessions" USING "btree" ("token");


--
-- Name: idx_sessions_user_id; Type: INDEX; Schema: public; Owner: mmuser
--

CREATE INDEX "idx_sessions_user_id" ON "sessions" USING "btree" ("userid");


--
-- Name: idx_status_status; Type: INDEX; Schema: public; Owner: mmuser
--

CREATE INDEX "idx_status_status" ON "status" USING "btree" ("status");


--
-- Name: idx_status_user_id; Type: INDEX; Schema: public; Owner: mmuser
--

CREATE INDEX "idx_status_user_id" ON "status" USING "btree" ("userid");


--
-- Name: idx_teammembers_delete_at; Type: INDEX; Schema: public; Owner: mmuser
--

CREATE INDEX "idx_teammembers_delete_at" ON "teammembers" USING "btree" ("deleteat");


--
-- Name: idx_teammembers_team_id; Type: INDEX; Schema: public; Owner: mmuser
--

CREATE INDEX "idx_teammembers_team_id" ON "teammembers" USING "btree" ("teamid");


--
-- Name: idx_teammembers_user_id; Type: INDEX; Schema: public; Owner: mmuser
--

CREATE INDEX "idx_teammembers_user_id" ON "teammembers" USING "btree" ("userid");


--
-- Name: idx_teams_create_at; Type: INDEX; Schema: public; Owner: mmuser
--

CREATE INDEX "idx_teams_create_at" ON "teams" USING "btree" ("createat");


--
-- Name: idx_teams_delete_at; Type: INDEX; Schema: public; Owner: mmuser
--

CREATE INDEX "idx_teams_delete_at" ON "teams" USING "btree" ("deleteat");


--
-- Name: idx_teams_invite_id; Type: INDEX; Schema: public; Owner: mmuser
--

CREATE INDEX "idx_teams_invite_id" ON "teams" USING "btree" ("inviteid");


--
-- Name: idx_teams_name; Type: INDEX; Schema: public; Owner: mmuser
--

CREATE INDEX "idx_teams_name" ON "teams" USING "btree" ("name");


--
-- Name: idx_teams_update_at; Type: INDEX; Schema: public; Owner: mmuser
--

CREATE INDEX "idx_teams_update_at" ON "teams" USING "btree" ("updateat");


--
-- Name: idx_users_all_no_full_name_txt; Type: INDEX; Schema: public; Owner: mmuser
--

CREATE INDEX "idx_users_all_no_full_name_txt" ON "users" USING "gin" ("to_tsvector"('"english"'::"regconfig", ((((("username")::"text" || ' '::"text") || ("nickname")::"text") || ' '::"text") || ("email")::"text")));


--
-- Name: idx_users_all_txt; Type: INDEX; Schema: public; Owner: mmuser
--

CREATE INDEX "idx_users_all_txt" ON "users" USING "gin" ("to_tsvector"('"english"'::"regconfig", ((((((((("username")::"text" || ' '::"text") || ("firstname")::"text") || ' '::"text") || ("lastname")::"text") || ' '::"text") || ("nickname")::"text") || ' '::"text") || ("email")::"text")));


--
-- Name: idx_users_create_at; Type: INDEX; Schema: public; Owner: mmuser
--

CREATE INDEX "idx_users_create_at" ON "users" USING "btree" ("createat");


--
-- Name: idx_users_delete_at; Type: INDEX; Schema: public; Owner: mmuser
--

CREATE INDEX "idx_users_delete_at" ON "users" USING "btree" ("deleteat");


--
-- Name: idx_users_email; Type: INDEX; Schema: public; Owner: mmuser
--

CREATE INDEX "idx_users_email" ON "users" USING "btree" ("email");


--
-- Name: idx_users_names_no_full_name_txt; Type: INDEX; Schema: public; Owner: mmuser
--

CREATE INDEX "idx_users_names_no_full_name_txt" ON "users" USING "gin" ("to_tsvector"('"english"'::"regconfig", ((("username")::"text" || ' '::"text") || ("nickname")::"text")));


--
-- Name: idx_users_names_txt; Type: INDEX; Schema: public; Owner: mmuser
--

CREATE INDEX "idx_users_names_txt" ON "users" USING "gin" ("to_tsvector"('"english"'::"regconfig", ((((((("username")::"text" || ' '::"text") || ("firstname")::"text") || ' '::"text") || ("lastname")::"text") || ' '::"text") || ("nickname")::"text")));


--
-- Name: idx_users_update_at; Type: INDEX; Schema: public; Owner: mmuser
--

CREATE INDEX "idx_users_update_at" ON "users" USING "btree" ("updateat");


--
-- PostgreSQL database dump complete
--

