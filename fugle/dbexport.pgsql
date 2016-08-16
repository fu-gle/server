--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: blog_movie; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE blog_movie (
    id integer NOT NULL,
    key character varying(40) NOT NULL,
    value character varying(40) NOT NULL
);


ALTER TABLE public.blog_movie OWNER TO postgres;

--
-- Name: blog_movie_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE blog_movie_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blog_movie_id_seq OWNER TO postgres;

--
-- Name: blog_movie_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE blog_movie_id_seq OWNED BY blog_movie.id;


--
-- Name: blog_post; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE blog_post (
    id integer NOT NULL,
    title character varying(200) NOT NULL,
    text text NOT NULL,
    created_date timestamp with time zone NOT NULL,
    published_date timestamp with time zone,
    author_id integer NOT NULL
);


ALTER TABLE public.blog_post OWNER TO postgres;

--
-- Name: blog_post_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE blog_post_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blog_post_id_seq OWNER TO postgres;

--
-- Name: blog_post_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE blog_post_id_seq OWNED BY blog_post.id;


--
-- Name: blog_star; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE blog_star (
    id integer NOT NULL,
    star integer NOT NULL,
    user_id integer NOT NULL,
    webtoon_id integer NOT NULL
);


ALTER TABLE public.blog_star OWNER TO postgres;

--
-- Name: blog_star_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE blog_star_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blog_star_id_seq OWNER TO postgres;

--
-- Name: blog_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE blog_star_id_seq OWNED BY blog_star.id;


--
-- Name: blog_user; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE blog_user (
    id integer NOT NULL,
    name character varying(40) NOT NULL,
    gender character varying(5),
    email character varying(50),
    password character varying(50),
    "primary" character varying(30) NOT NULL,
    profile text NOT NULL,
    message text
);


ALTER TABLE public.blog_user OWNER TO postgres;

--
-- Name: blog_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE blog_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blog_user_id_seq OWNER TO postgres;

--
-- Name: blog_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE blog_user_id_seq OWNED BY blog_user.id;


--
-- Name: blog_webtoon; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE blog_webtoon (
    id integer NOT NULL,
    title character varying(50) NOT NULL,
    author1 character varying(30) NOT NULL,
    author2 character varying(30),
    genre1 character varying(20) NOT NULL,
    genre2 character varying(20),
    genre3 character varying(20),
    summary text,
    media character varying(30),
    publish boolean NOT NULL,
    age character varying(30),
    thumbnail text,
    href text
);


ALTER TABLE public.blog_webtoon OWNER TO postgres;

--
-- Name: blog_webtoon_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE blog_webtoon_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blog_webtoon_id_seq OWNER TO postgres;

--
-- Name: blog_webtoon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE blog_webtoon_id_seq OWNED BY blog_webtoon.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blog_movie ALTER COLUMN id SET DEFAULT nextval('blog_movie_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blog_post ALTER COLUMN id SET DEFAULT nextval('blog_post_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blog_star ALTER COLUMN id SET DEFAULT nextval('blog_star_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blog_user ALTER COLUMN id SET DEFAULT nextval('blog_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blog_webtoon ALTER COLUMN id SET DEFAULT nextval('blog_webtoon_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
7	Can add group	3	add_group
8	Can change group	3	change_group
9	Can delete group	3	delete_group
10	Can add user	4	add_user
11	Can change user	4	change_user
12	Can delete user	4	delete_user
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add post	7	add_post
20	Can change post	7	change_post
21	Can delete post	7	delete_post
22	Can add movie	8	add_movie
23	Can change movie	8	change_movie
24	Can delete movie	8	delete_movie
25	Can add webtoon	9	add_webtoon
26	Can change webtoon	9	change_webtoon
27	Can delete webtoon	9	delete_webtoon
28	Can add user	10	add_user
29	Can change user	10	change_user
30	Can delete user	10	delete_user
31	Can add star	11	add_star
32	Can change star	11	change_star
33	Can delete star	11	delete_star
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_permission_id_seq', 33, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_id_seq', 1, false);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: blog_movie; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY blog_movie (id, key, value) FROM stdin;
\.


--
-- Name: blog_movie_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('blog_movie_id_seq', 1, false);


--
-- Data for Name: blog_post; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY blog_post (id, title, text, created_date, published_date, author_id) FROM stdin;
\.


--
-- Name: blog_post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('blog_post_id_seq', 1, false);


--
-- Data for Name: blog_star; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY blog_star (id, star, user_id, webtoon_id) FROM stdin;
114	50	26	455
115	50	26	456
116	50	26	457
117	50	26	458
118	50	26	451
119	50	26	450
120	50	26	449
121	50	26	444
122	50	26	432
123	50	26	427
124	50	26	421
125	50	26	419
126	50	26	418
127	50	26	416
128	50	26	417
129	50	26	403
130	50	26	393
131	50	26	381
132	50	26	363
133	50	26	345
134	50	26	337
135	50	26	327
136	25	27	3
137	25	27	4
151	10	30	62
152	15	30	63
153	30	30	64
140	30	27	12
139	30	27	8
155	35	29	1
158	25	28	6
159	25	28	7
160	25	28	8
161	25	28	9
163	30	28	70
164	30	28	14
165	35	28	13
157	30	28	5
143	30	26	1
166	35	28	10
142	30	27	70
167	30	28	11
146	0	30	3
145	0	30	2
144	0	30	1
162	25	28	2
141	40	27	2
154	40	28	1
169	25	32	5
156	30	28	4
168	35	30	7
170	35	30	31
171	40	30	39
149	35	30	61
150	40	30	60
172	35	30	98
173	35	30	106
174	40	30	120
175	20	30	127
176	30	30	131
177	0	30	133
178	30	30	139
179	35	30	155
180	40	30	197
181	45	30	198
182	40	30	210
183	45	30	212
184	30	30	215
185	40	30	216
186	35	30	222
187	35	30	240
188	35	30	243
189	35	30	265
190	35	30	271
192	20	30	277
191	20	30	276
193	20	30	301
194	40	30	363
195	25	30	384
196	30	30	389
197	30	30	388
198	20	30	401
199	20	30	421
148	10	30	423
147	10	30	422
138	45	27	1
200	45	32	2
201	25	32	1
\.


--
-- Name: blog_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('blog_star_id_seq', 201, true);


--
-- Data for Name: blog_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY blog_user (id, name, gender, email, password, "primary", profile, message) FROM stdin;
26	성예닮			null	219326250	http://mud-kage.kakao.co.kr/14/dn/btqdTRJdZJE/fvFP7lbZnLosRYcnU7Fkak/o.jpg	null
27	joey 이영우			null	212960446	http://mud-kage.kakao.co.kr/14/dn/btqdFHt8UXp/H0SGr7XP4BKqFRXCv80h7K/o.jpg	null
28	Kim  HoKyung			null	924508780993809	https://scontent.xx.fbcdn.net/v/t1.0-1/p120x120/12932738_865516853559669_5266060378863831826_n.jpg?oh=3bac5b907592e80fc35a28480d23d171	null
29	김은진			null	301411030249017	https://scontent.xx.fbcdn.net/v/t1.0-1/p120x120/13599882_298960210494099_1005423584377294334_n.jpg?oh=55021fd9d39370563eb73c68a16eb6f6	null
30	서나윤			null	219327742	http://mud-kage.kakao.co.kr/14/dn/btqdOYidE2g/E6LG4BLgjwvcSkcKQMfOsk/o.jpg	null
31	Youngwoo  Lee			null	1047631772000036	https://scontent.xx.fbcdn.net/v/t1.0-1/c42.42.530.530/s120x120/533764_421915381238348_94358086_n.jpg?oh=ca85832a6f245cc99ea79acf4c45b1ab	null
32	김은진			null	209119237	http://mud-kage.kakao.co.kr/14/dn/btqdCKcZzjz/Yo9lK1nYfo7Bk7k6nNBRl1/o.jpg	null
33	최영진			null	211695978	http://mud-kage.kakao.co.kr/14/dn/btqdJbVDyIe/ta5s7BF2x33UVxXoatLlak/o.jpg	null
34	김호경			null	211617457	http://mud-kage.kakao.co.kr/14/dn/btqdEyjKMLu/vmBMKZfu2CVWPmkRMQkW31/o.jpg	null
35	박정이			null	223819973	http://mud-kage.kakao.co.kr/14/dn/btqdZN7KBe9/AlPqKHX8N4S6kIgxoXMnb1/o.jpg	null
\.


--
-- Name: blog_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('blog_user_id_seq', 35, true);


--
-- Data for Name: blog_webtoon; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY blog_webtoon (id, title, author1, author2, genre1, genre2, genre3, summary, media, publish, age, thumbnail, href) FROM stdin;
1	여름밤소년	온잠	\N	판타지	드라마	\N	깊은 산 중턱에 인적 드문 한 산장. 그 곳에서 농사나 짓고 책이나 읽으며 살던 신범의의 조용할 것 같은 일상은 어느날 갑자기 깨지고 만다. 비가 내리는 밤, 불현듯 나타난 한 소년으로 인해... 여름 밤을 일상으로부터 끄집어낸 한 소년과, 그 소년을 거둔 남자의 동거 이야기.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/5123036164653056/images/wide?width=1200	http://www.lezhin.com/ko/comic/summerboy
2	케세라세라	고나리자	수정	로맨스	드라마	\N	빚 없는 게 유일한 자랑인 건어물녀 하니가베프의 남동생 선준과 사고치다!삼포세대 청춘 성장 로맨스.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/6439791396126720/images/wide?width=1200	http://www.lezhin.com/ko/comic/queceracera
3	너의 HEART를 나에게 줄래?	비아이	\N	로맨스	학원	\N	고등학교 입학식, 초등학교때 첫사랑이 었던 류원하가 싸가지 얼짱이 되어 눈앞에 나타났다! 하지만 원하는 나를 기억하지 못하고 무시하기만 하는데..? 진성유와 류원하의 엇갈리는 풋풋한 학원 로맨스!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/18/images/wide?width=1200	http://www.lezhin.com/ko/comic/giveme_ur_heart
4	김철수씨 이야기	수사반장	\N	미스터리	시대극	\N	인생이 이보다 더 불행할 수 있을까! 태어나자마자 쓰레기장에 버려진 김철수씨. 그의 험난한 인생은 한국 현대사의 아픔과 절망을 고스란히 담고 있다. 꿈도 희망도 없는 삶이 계속되며 인간 혐오의 영역으로 들어가버린 김철수씨는 결국 모든 불행의 원인제공자인 ‘인간’을 말살하고자 마음 먹는데…!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/35/images/wide?width=1200	http://www.lezhin.com/ko/comic/ssdj2002
5	백합은 일상	곰말리	\N	백합	일상	\N	뼛속까지 레즈비언 X 꿈꾸는 백합소녀. 전혀 다른 두 사람의 엉뚱하고도 필연적인 만남. 이 평범한 여대생들의 매일매일에 주목해주세요!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/5792652545228800/images/wide?width=1200	http://www.lezhin.com/ko/comic/everyday_lily
6	양극의 소년	은송	\N	학원	SF	\N	2016년 여름, 감염자를 식인특성을 지닌 생물체 '웜'으로 변이시키는 전대미문의 치명적인 바이러스가 출현한다. 이에 대응하여 혼란에 빠진 세계를 구하기 위해 변이인간 '헤테로'로 구성된 국제 안전기구 ISO 역시 등장한다. 세계를 구원 힘을 가진 그들에 매료된 주인공 강하루 역시 ISO에 입단하기 위한 도전을 시작하는데.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/6037464393449472/images/wide?width=1200	http://www.lezhin.com/ko/comic/polarboys
7	장인의 나라	무화	\N	판타지	액션	\N	늙지도 않고 죽지도 않는 존재 '장인'. 눈으로 조각을 만들고 빗소리로 음악을 만드는등 인간을 초월한 예술적 능력을 가지고 있다. 인간이 되고 싶어하는 장인 지노는 우연히 인간 백범을 만나며 사건에 휘말리게 되는데.. 	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/189/images/wide?width=1200	http://www.lezhin.com/ko/comic/a_country_of_maestri
8	생쥐와 소녀	김지효	\N	로맨스	판타지	\N	요정에게 한 막말 때문에 생쥐로 변한 왕자. 하찮은 존재로 생을 마감하려던 찰나에 그를 구해준 생명의 은인은... 재투성이 신데렐라?! 하지만 그녀, 지금까지의 가련한 여주인공과는 뭔가 다르다! 레진코믹스 대표 로맨스  김지효 작가의 신작!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/5320790438576128/images/wide?width=1200	http://www.lezhin.com/ko/comic/mouse_and_the_girl
9	미슐랭스타 시즌 3	김송	\N	음식	\N	\N	한국 최초의 미슐랭스타 레스토랑을 꿈꾸는 한 젊은 쉐프의 이야기! 2013 오늘의 우리만화, 대한민국 컨텐츠 어워드 만화대상 수상작.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/309/images/wide?width=1200	http://www.lezhin.com/ko/comic/michelinstar
10	마도사의 탑	성상영	박승범	판타지	액션	\N	막강한 힘을 지닌 대마도사  '라임드'는 마법실험 실패로 무려 천년 후의 땅에 떨어지고 만다. 무일푼의 몸으로 잃어버린 탑을 재건할 방법을 찾던 그는 노예로 팔려온 '아르'와 '에르'를 만나게 되는데... 마법을 이용해 항상 돈벌 궁리를 하는 엉뚱 대마도사와, 볼수록 귀엽고 사랑스러운 묘인족 남매의 기대되는 조합! 그들의 무궁무진한 마법 여행이 지금부터 시작됩니다.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/6549740228968448/images/wide?width=1200	http://www.lezhin.com/ko/comic/wizardly_tower
11	무궁무진	김연	\N	학원	로맨스	\N	전교 2등 이무진, 그리고 전교 뒤에서 2등 이무진? 이름은 같지만 성격도 특기도 다른 두 남녀! 등수의 간격은 극과 극이어도 관계의 간격은?! 무진이들의 투닥투닥 로맨스.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/458/images/wide?width=1200	http://www.lezhin.com/ko/comic/mugung
12	망고의 뼈	골드키위새	넋부자들	로맨스	학원	\N	고교 수석입학 모범생 백주인은 입학 선서 때 차석 함소복에게 첫눈에 반한다. 그러나 고백 플랜은 정반대 성향의 쌍둥이 동생 백주율의 방해로 꼬여가고, 설상가상으로 평판 나쁜 같은 반 여학생 유리사까지 엮이면서 통제 불능으로 빠져드는데… 골드키위새 작가의 글에 넋부자들의 아름다운 그림, 그러나 아름답지만은 않을지도 모를 뼈 있는 이야기!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/5613460917846016/images/wide?width=1200	http://www.lezhin.com/ko/comic/mangoseed
13	새빨간 결혼	유승종	\N	로맨스	\N	\N	꿈같은 내집마련을 위해서라면..사랑없이도 부부 행세가 가능하다? N포세대였던 연주와 지훈은 우연히 결혼정보업체 이벤트에 당첨되어 아파트를 얻게된다. 놓치기엔 너무 아까운 기회..결국 그들은 위장결혼을 감행하게 되는데! 그렇게 시작된 쿨하고도 아슬아슬한 가짜 부부 생활. 과연 성공할 수 있을까?	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/4996086850125824/images/wide?width=1200	http://www.lezhin.com/ko/comic/red_marriage
14	데명의 그림일기	데명	\N	일상	드라마	\N	Eat, Sleep, Shit! 이제까지 만나보지 못한 새로운 코드의 개그와 독설로 무장한 일상툰! SNS 세상에서 수많은 이들에게 일침과 치유를 안겨준 화제의 그 작품 [데명의 그림일기], 드디어 레진코믹스에서 정식연재!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/5626195062816768/images/wide?width=1200	http://www.lezhin.com/ko/comic/diary_diaemyung
70	신기록	리율	\N	시대극	판타지	\N	만신 어머니 아래서 신을 기록하는 아이 세진. 그녀의 눈으로 바라본 산과 강의 이야기. 인간과 함께 있으면서도 인간이 알지 못하는 숨겨진 존재들의 이야기. 2013 대한민국 콘텐츠 대상 수상작.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/43/images/wide?width=1200	http://www.lezhin.com/ko/comic/shingi
15	커튼콜 아래그랑	바싹탄숯	\N	판타지	\N	\N	신의 능력 '커튼콜'을 가진 사설 심부름꾼 비기난, 책을 먹으며 식신을 다루는 '지식인' 스콘, 말괄량이 의사 콜롬보, 상냥하고 잔혹한 악마 이오나들의 모험과 배후에 숨겨진 천사와 악마의 음모가 장대하게 펼쳐지는 판타지 대 서사시!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/5/images/wide?width=1200	http://www.lezhin.com/ko/comic/curtain_call
16	관계의 우로보로스	이정윤	\N	학원	일상	\N	친구 없이 외로운 고교생활 중인 현. 그런 현에게 빛나던 중학 시절을 함께 해준 마니또 선우 정에게 편지가 온다. 설레는 마음으로 읽기 시작한 편지. 그러나 정은 현과 함께하던 그 시절이 악몽이었다고 고백을 하는데... 꼬리에 꼬리를 무는 어긋나버린 [관계의 우로보르스], 시작합니다.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/5196408411389952/images/wide?width=1200	http://www.lezhin.com/ko/comic/ouroboros
17	김무녀는 무녓무녓해!!	리치후	\N	액션	판타지	\N	16살 김무녀, 그녀의 인생에서 가장 대단한 이벤트는 치킨집 오픈, 장래희망은 치킨집 손님! 김무녀에게 세상에서 치킨보다 중요한 것은 없었다... 등교길에 마물을 만나기 전까지는! 압도적인 힘으로 사람들을 해치며 김무녀에게 다가오는 마물. 짧은 무녀의 생은 이대로 끝난 것인가 싶었던 그 순간! 그녀의 주먹 한 방에 마물이 쓰러졌다? 갑작스럽게 각성된 힘, 그리고 그녀에게 다가오는 의문의 사람들...! 자칭 미녀 김무녀의 영웅 데뷔기, 이제부터 시작합니다!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/6506490831831040/images/wide?width=1200	http://www.lezhin.com/ko/comic/munyeo
18	월하노인	꿀자몽	\N	로맨스	판타지	\N	매일밤 꿈속에 나타나는 그녀가 현실에 나타나다! 중국에서 온 수수께끼의 미녀 라메이는 호준에게 자신이 운명의 상대라고 주장하는데.. 과연 그녀의 정체는?	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/4910621803413504/images/wide?width=1200	http://www.lezhin.com/ko/comic/undermoon
19	트러블X트러블 돌	로에트하이	\N	판타지	개그	\N	인형과 마법이 발전된 시대, 힐러 아데르트는 일상의 적적함을 달래기 위해 메이드 마법인형 밀드를 구입한다. 그렇게 시작된 밀드와의 생활은 행복 끝, 고생시작? 히키코모리 주인님 아데르트와 주인님을 너무 좋아하는 깨발랄 마법인형 밀드의 시끌벅적 일상 이야기!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/4648163528409088/images/wide?width=1200	http://www.lezhin.com/ko/comic/troublextroubledoll
20	나오미	서지	\N	액션	\N	\N	프로복서를 지망하는 토니의 잣 같은 인생에 한줄기 청량음료같은 여자, 나오미가 나타났다. 	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/230/images/wide?width=1200	http://www.lezhin.com/ko/comic/naomi
21	형집에서	혜룡	\N	개그	일상	\N	10년 동안 갖은 방법으로 현재를 괴롭힌 옆집 꼬맹이 지수. 대학 입학 이후 지긋지긋한 괴롭힘에서 벗어나 평화로운 자취 생활을 즐기고 있던 현재에게 갑자기 찾아온 손님은 다름 아닌 지수?! 현재는 과연 십년지기 악연 지수와의 3년 동거를 버텨낼 수 있을까!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/4881050177634304/images/wide?width=1200	http://www.lezhin.com/ko/comic/In_his_house
22	극야	깡이	\N	BL	SF	\N	혼자가 익숙했던 일상에 마음을 흔드는 존재가 나타났다. 구형 안드로이드를 주운 남자의 일상이 변하기 시작하고... 근미래를 배경으로 하는 판타지 BL	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/238/images/wide?width=1200	http://www.lezhin.com/ko/comic/polar_night
23	나의 침묵에	마대	검둥	드라마	학원	\N	레포트 쓰다가 들어간 SNS에서 우연히 접한 그녀의 소식. 오해에서 시작된 나의 한 마디에 완전히 무너져버린 그녀의 인간관계... 하지만 나는 그런 말을 한 적이 없다. 그리고 다가오는 과거의 무거운 진실... [따라바람] [가생가] 검둥 작가의 그림으로 풀어내는 마대 작가의 치밀한 스토리!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/6010920042496000/images/wide?width=1200	http://www.lezhin.com/ko/comic/no_words
24	출근하기 싫어!	예타쿠	\N	드라마	일상	\N	감격스런 첫 취업! 수상한 면접을 거쳐 미심쩍은 출근길을 지나 기다리고 있는 것은... 지하실 한 켠의 초라한 사무실, 그리고 범상찮은 팀원들! 내가 꿈꾸던 사회인의 로망은 이게 아닌데에-!! 위기의 신입사원 정우의 외마디 비명 [출근하기 싫어!]	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/5280278628532224/images/wide?width=1200	http://www.lezhin.com/ko/comic/go_to_work
25	수줍어서 그래	심모람	\N	일상	\N	\N	소심하다고 하지 마세요, 수줍어서 그런 거예요 양자리의 트리플 A형, 자타공인 소심人 심모람의 내 맘 닮은 이야기! 	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/489/images/wide?width=1200	http://www.lezhin.com/ko/comic/yesiamshy
26	골동	권동현	\N	드라마	미스터리	\N	어느 깊은 산 속 암자 아미사의 주지인 무형의 골동품을 노리는 도자기 연구가 영민. 그가 무형에게서 빼돌린 찻잔은 전설의 도선 대사 찻잔으로 신비로운 비밀을 담고 있다. 골동품 시장을 뜨겁게 달군 그 전설의 찻잔을 노리는 전국 각지의 수집가들, 그리고 보물을 되찾기 위한 무형과 영민의 얽히고설키는 두뇌 싸움이 펼쳐진다.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/5156658229805056/images/wide?width=1200	http://www.lezhin.com/ko/comic/antique
27	달댕이는 12년차	다드래기	\N	일상	\N	\N	만난지 12년차, 서로를 너무 속속들이 알아서 설레임보다는 익숙함을 느끼는 30대 장수커플 달수와 댕시의 살아가는 이야기. 결혼, 육아, 지난한 삶의 모순과 부조리에 대해서 날카롭게 쓴소리를 하는 달수와 댕시지만 그들이 세상을 보는 시선만큼은 한없이 따스하다.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/21/images/wide?width=1200	http://www.lezhin.com/ko/comic/daldang_10
28	그림 그리는 생각	안순현	\N	일상	\N	\N	기쁨, 슬픔, 사랑, 그리움... 우리의 마음을, 우리의 생각을 그린다	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/6016680231174144/images/wide?width=1200	http://www.lezhin.com/ko/comic/drawingmind
29	네버마인드	이규환	\N	학원	드라마	\N	공황장애에 걸린 음악 천재 여고생 지우. 뮤지션 형을 잃은 상실감을 지우를 통해 위로받던 담임 민식. 둘은 돌파구를 찾기 위해 오디션 프로그램 참가를 결심한다. 그러나 오디션 예선 첫날, 지우에게 의외의 사건이 닥치는데...! 유세윤과 함께 웹툰 [유턴]을 그려낸 이규환 작가의 스피릿 충만한 신작!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/5628161674444800/images/wide?width=1200	http://www.lezhin.com/ko/comic/nevermind
30	citrus 시트러스	사부로우타	\N	백합	\N	\N	외모는 영락없이 노는 여고생이지만 한 번도 사랑을 해본 적 없는 유즈는, 부모님의 재혼으로 전학가게 된다.남자친구가 안 생겨! 하고 불만이 폭발한 전학 첫날, 검은 머리 미인인 학생회장 메이와 최악의 방식으로 만나게 된다. 그후 우연히 메이와 훈남 담임선생님의 키스 장면을 목격하고 마음과는 반대로 그 장면을 머리에서 지울 수 없는 유즈. 게다가 학생회장과 의자매가 되어 같은 방에서 생활하게 되는데…?!  정반대인 두 여고생이 서로에게 반발하면서도 이끌린다. 자매의 love affair, 시작!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/4520115655147520/images/wide?width=1200	http://www.lezhin.com/ko/comic/citrus
31	4컷용사	고지라군	\N	판타지	개그	\N	마왕을 해치운 용사는 드디어 공주를 구하고 새 삶을 찾는다. 하지만 공주와의 달콤한 미래는 상상으로 끝나버리고... 마왕 격퇴 이후 평범백수로 전락한 용사의 구차한 일상. 고지라군 작가님의 화제작 4컷용사가 리메이크로 찾아왔다!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/248/images/wide?width=1200	http://www.lezhin.com/ko/comic/cartoon_hero
32	애늙은이	환댕	\N	판타지	액션	\N	견습기사 트루디아는 넘치는 혈기에 그만 기사단에서 쫓겨나고 만다. 갈 곳을 찾아 방황하는 그때, 강도의 위협을 받는 노인을 보고만 트루디아. 무작정 구하기 위해 달려간 그곳에서 그녀의 운명을 바꿀 남자를 만나는데..! 죽어 가는 소녀와 죽지 않는 남자의 치열한 생명의 줄다리기.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/6217220923850752/images/wide?width=1200	http://www.lezhin.com/ko/comic/gilgamesh
33	소비러와 존잘님!	도트리	\N	로맨스	드라마	\N	꿈에서나 그리던 우상이 이상형이라면? 용모 준수, 성격 온화로 1일 1대쉬가 기본인 훈남 대학생 정우. 인기가 마를 날이 없지만 정작 본인은 연애는 뒷전이고 덕질만이 삶의 기쁨이다. 그러던 어느날, 우연히 동경하던 존잘님을 만나게 된 정우. 그리고 그자리엔 너무나도 취향저격인 존잘 그녀, 주인이 있었는데..!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/5639281712562176/images/wide?width=1200	http://www.lezhin.com/ko/comic/zonzaler
34	박씨유대기	슬라정	\N	개그	학원	\N	평범한 남학생 박남주는 같은 반의 큐트한 여학생 박여주에게 끌린다. 하지만 그녀의 정체는 상상도 할 수 없는...! '극강의 연재처 선정능력' 보유자, [초딩이지만 우리 사귀어요] 슬라정 작가의 레진 데뷔작! 레진은 여기까진가, 아니면 이제부터인가...!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/6727405857669120/images/wide?width=1200	http://www.lezhin.com/ko/comic/waitmrpark
35	야수의 노래	YOON	리쿤	판타지	액션	\N	이승과 저승을 넘나드는 오리엔탈 판타지! 한국 신화·설화를 재해석해 태어난 캐릭터, 박력 있는 전개와 빈틈없는 설정, 깊은 상상력으로 꿰맨 광활한 세계가 당신을 매료시킨다.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/293/images/wide?width=1200	http://www.lezhin.com/ko/comic/yasusing
36	극소수	김비버	\N	미스터리	\N	\N	어머니의 죽음, 남편의 피살, 그리고 누명까지. 불행을 옆에 두고 살아온 에리카는 남편을 죽인 자를 뒤쫓는 여정을 시작한다. 갈망은 그녀와 닮은 불만종자들을 만나게 했고, 그들과 함께 뜻을 나누기로 한다. 독보적인 연출력과 매력적인 인물들로 가득한 본격 서스펜스 극화 [극소수]. 	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/445/images/wide?width=1200	http://www.lezhin.com/ko/comic/minority
37	로맨틱 마블링	한결	\N	로맨스	\N	\N	어느 날 갑자기 당신의 이상형인 남자를 인터넷에서 맞춤형으로 주문할 수 있다면? 그리고 그것이 실제로 일어났다면 어떻게 해야 할까요? 참고로 환불이나 취소는 할 수 없는 것 같습니다.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/16/images/wide?width=1200	http://www.lezhin.com/ko/comic/roma
38	갬블러 VS. 초능력자	마사토끼	도현	미스터리	스포츠	\N	초능력자 VS. 세계제일의 갬블러. 전부 얻거나 전부 잃기 전에는 일어날 수 없는 판돈 총 3천억의 데스매치. 도박의 본질과 역사가 인간의 한계를 넘어 도전받는 희대의 승부가 지금 펼쳐진다!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/6450438253051904/images/wide?width=1200	http://www.lezhin.com/ko/comic/gambler_vs_psychic
39	소라의 눈	썸머	\N	BL	판타지	\N	의문의 병으로 목숨이 위태로운 아들을 구하고자 안개산의 사찰을 찾아온 한 남자는 산 아래에서 마주친 할아버지에게 희한한 소문을 듣는다. 곧 사찰로부터 사람이 내려올 텐데, 아들에게 닥친 일이 별일이 아니라면 청년이, 보통의 일이라면 중년이, 제법 심각한 일이라면 노인이 내려온다고. 하지만 그 남자를 찾아 내려온 사람은 다름 아닌-  탄탄한 스토리와 감수성 넘치는 작화로 창작 동인계에서 이미 두터운 팬층을 가지고 있는 썸머 작가의 데뷔작.  	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/352/images/wide?width=1200	http://www.lezhin.com/ko/comic/eyes_of_sora
40	꽃같은 인생	김인정	\N	드라마	로맨스	\N	네 명의 여자, 네 개의 연애. 그리고 네 개의 인생. 끊임없이 연애하는 드라마퀸 여주, 현실만을 바라보는 리얼리스트 미소, 지고지순 4년차 커플 호연, 완벽한 인연을 기다리는 23년차 솔로 선... [괜찮은 관계] 김인정 작가가 그려내는 꽃같은 여대생들의 사랑.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/6315071800606720/images/wide?width=1200	http://www.lezhin.com/ko/comic/like_flower
41	순정 바로미터	산사	\N	로맨스	학원	\N	2년의 이유있는 휴학을 마치고 돌아온 채운. 조용한 학교생활을 하고 싶지만 자꾸만 얽히게 되는 같은 학과 인기남 사도, 그들 사이에 난입한 열혈 새내기 민규까지. 이들이 풀어가는 세련되고 깔끔한 캠퍼스 로맨스 [순정 바로미터]!!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/348/images/wide?width=1200	http://www.lezhin.com/ko/comic/lovebarometer
42	자해클럽	소망	\N	학원	드라마	\N	회색으로 짙게 빛나는 날이 살갗을 미끄러지듯이 지나가고 틈에 스민 따뜻한 피가 팔을 타고 흐릅니다. 오늘도 통증을 넘어선 해방감이 나를 안도하게 합니다. 나의 고통은 누구도 이해할 수 없기에 완벽하게 나 혼자만의 것입니다. 설마 당신은 저를 이해할 수 있다고 생각하나요? 레진코믹스 세계만화공모전의 문제작! 시작합니다.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/484/images/wide?width=1200	http://www.lezhin.com/ko/comic/selfharmclub
255	생존주의	꿀딩이	\N	SF	미스터리	\N	화성정착프로젝트의 실험체로 화성에 가게 된 소년범들이 괴물들과 싸우며 성장하는 생존물.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/77/images/wide?width=1200	http://www.lezhin.com/ko/comic/survivalism
43	길 잃은 마왕의 딸이 숲속 나무꾼 부려먹는 만화	눅쓰	\N	판타지	일상	\N	인간계와의 대전쟁에서 승리한 마왕(4000살 추정)의 무용담을 믿지 못한 딸은 우연히 인간계 입구로 들어갔다가 길을 잃는다. 인간계에 편도로 떨어진 마계의 공주와, 그녀를 줍게 된 나무꾼의 이야기! 귀여움인가, 두려움인가!!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/476/images/wide?width=1200	http://www.lezhin.com/ko/comic/lostgirl
44	도령의 가족	미울	BV	드라마	로맨스	\N	밥 먹듯이 싸우면서도 안 보이면 궁금하고, 서로가 어딜 가서 연애하고 일한다는 게 신기할 따름인, 특별한 일 없이도 하루하루 소란한 도령의 가족! [청춘 로맨스] 미울, BV 작가의 신작.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/5207770453770240/images/wide?width=1200	http://www.lezhin.com/ko/comic/do_family
45	왕자님을 인터뷰하는 법	원재	\N	로맨스	드라마	\N	사랑해 마지않는 나의 왕자님 키알. 그는 갇혀있다, 모니터 속에···. 매일 연예인과 만나 얘기를 나누는 연예부 기자 이지. 아무리 아름답다는 사람도 그녀의 마음속의 왕자님을 이기지 못했다. 그러던 어느 날, 그녀의 앞에 키알과 똑 닮은 비언이 나타나는데···!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/5229945758941184/images/wide?width=1200	http://www.lezhin.com/ko/comic/prince_of_planet
46	마리	콘조	\N	개그	로맨스	\N	낮에는 모범생, 밤에는 육식녀. 흔히 말하는 반전매력을 위해 영혼을 걸었다! 어떤 소원이라도 이루어주는 신비한 앱을 얻는 주공남. 악마와의 계약으로 얻은 신비한 능력을 그는 어떻게 사용할 것인지.. 모에의 제 1 테제. 갭모에에 대한 매우 진지한 고찰.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/5483960585420800/images/wide?width=1200	http://www.lezhin.com/ko/comic/mari
47	가비왕	류두열	\N	판타지	액션	\N	왜군의 요괴를 몰아내고 승리를 쟁취한 조선. 그로부터 수년 후 평화로울 것만 같던 조선 곳곳에서 요괴로 인한 피해사례가 속출한다. 청도단 단대장으로 제수된 안민평과 도의를 지켜 요괴를 퇴마하는 우단장 박석정, 그리고 긴 봉인을 깨고 나온 가비왕까지. 지금 조선은 제2의 요괴와의 전쟁이 선포된다!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/3000/images/wide?width=1200	http://www.lezhin.com/ko/comic/kingofdokkaebi
48	닥터 레진의 무책임 하스스톤 연구소	김도	\N	일상	개그	\N	국민 모바일 게임 [하스스톤]의 본격 만화화, 미국 블리자드의 본사 승인을 거친 정식 하스스톤 웹툰이 막을 엽니다! '노루야캐요'를 만든 김도 작가의 개그 센스와 하스스톤 빠돌이 다운 카드 설명법으로 새 확장팩 대 마상시합부터 낱낱이 파헤쳐드립니다!!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/5978137257574400/images/wide?width=1200	http://www.lezhin.com/ko/comic/dr_hearthstone
49	뱀의 임	선스언	\N	시대극	판타지	\N	복수를 위해 뱀의 사념을 모으고 있는 이레. 그녀를 위해 석월은 뱀에게 저주 받은 인간을 찾아나선다. 여느때와 같이 뱀을 찾아 마을로 나온 석월은 뱀의 저주를 받은 이진사 소문을 듣게 되어 그 집에 의원으로 가장해 들어간다. 그리고 그곳에서 이진사와는 다른 기운의 뱀의 흔적도 발견하게 되는데...	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/6484078370488320/images/wide?width=1200	http://www.lezhin.com/ko/comic/bride_of_the_snake
50	브로큰 릴리	sage	\N	백합	\N	\N	감추고 싶은 과거를 지닌 채 런던으로 도피한 주인공 릴리. 그곳에서 여의사 테일러를 만나 자신의 주치의로 고용한다. 릴리는 병약한 자신과는 다르게 당차고 카리스마 넘치는 테일러를 동경하고, 그 마음은 주체할 수 없이 커져만 가는데... 원치않는 현실과 진정한 사랑 사이에서 점점 파멸의 길을 걷는 릴리의 운명은? [쓰리먼스] sage 작가의 가슴 저미는 백합 신작.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/5920843941543936/images/wide?width=1200	http://www.lezhin.com/ko/comic/broken_lily
51	호레	지호	\N	판타지	액션	\N	영혼의 돌을 이용하여 인간의 능력을 초월한 존재 '그릇'. 그들은 자신도 이유를 모른채 본능적으로 성지로 향한다. 각자의 마음속의 응어리를 담고 성지로 향하는 호레와 동료들. 그리고 성지에 숨겨진 음모와 진실이 밝혀진다.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/76/images/wide?width=1200	http://www.lezhin.com/ko/comic/hore
52	히마와리 씨	스가노 마나미	\N	드라마	백합	\N	‘히마와리 서점에 어서 오세요!’학교 바로 앞에 있는 낡고 작은 서점 “히마와리 서점”. 점장 히마와리 씨가 언제든지 맞이해주는 이곳엔 사람들의 발길이 끊이지 않는다.‘히마와리 씨가 좋아요’라는 돌발 고백과 함께, 매일매일 서점을 찾아오는 여고생 마츠리. 쿨하고 드라이한 점장 히마와리 씨와 서점을 찾아오는 이들의 하트 풀 스토리.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/4859615653396480/images/wide?width=1200	http://www.lezhin.com/ko/comic/himawari
53	카페 로파무드라	언발란스	\N	개그	드라마	\N	남자치곤 너무 호리호리한 몸매와 웬만한 여자들보다 더 예쁜 얼굴... 스물세 살 지호에겐 남모를 비밀이 하나 있다. 여장 남자, 즉 크로스 드레서(CD)라는 점. 여장을 들키고는 홀연히 입대했다가 전역한 지호가 친구를 찾아간 곳은 카페 로파무드라. 그리고 이 카페의 구성원은 전부...?!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/4866977410056192/images/wide?width=1200	http://www.lezhin.com/ko/comic/lopamudra
54	꼴데툰 2016	샤다라빠	\N	스포츠	개그	\N	전격 무료 연재! 새로운 감독, 새로운 마무리, 그리고 새로운 돔구장의 첫 상대팀! 명분은 충분하다. 이제 가을에 야구만 하면 된다! 감동, 일침, 딥빡이 절묘하게 뒤섞인 샤다라빠의 롯데 만화, 올해도 플레이볼!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/5686323091865600/images/wide?width=1200	http://www.lezhin.com/ko/comic/ggtoon2016
55	더 라스트 미션	요냥	하링	학원	미스터리	\N	미션 1. 반에서 꼴찌를 하면 배팅 금액의 10배를 지급한다!? 생긴건 아이돌이지만 공부는 지지리 못하는 영수에게 어느날 의문의 미션이 떨어지는데..상금으로 폼 나게! 간지 나게! 살아보고 싶은 영수의 전국 꼴찌를 향한 파이널 로드가 시작 된다!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/5496788936556544/images/wide?width=1200	http://www.lezhin.com/ko/comic/lastmission
56	고홈런	감대	\N	스포츠	드라마	\N	억울하게 살인죄를 뒤집어 쓰고 13년형을 받게 된 22세 강일루. 험악한 교도소를 탈출하는 유일한 방법은 야구대회 우승뿐..?!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/6361678876246016/images/wide?width=1200	http://www.lezhin.com/ko/comic/gohomerun
57	볼콤성의 유령	마레	\N	드라마	미스터리	\N	별 볼 일 없이 살아가는 무명작가 해리는 어느 날 친구로부터 자신의 시신을 수습해 주면 재산을 상속하겠다는 편지를 받게 된다. 갑자기 찾아온 행운에 들떠 찾아간 볼콤성에서 장례를 치른 밤, 해리는 친구 타일러의 유령과 마주치게 되는데…	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/5196968141258752/images/wide?width=1200	http://www.lezhin.com/ko/comic/bolcom
58	이다의 작게 걷기	이다	\N	일상	\N	\N	그들은 떠나는데 왜 나는 떠날 수 없느뇨. 지독한 여행병에 걸려버렸으나 현실은 “돈이 없어”. 그래서 이다는 필사적으로 지금 살고 있는 곳에서 여행을 찾기 시작한다. 예산은 소액, 체력은 저질. 이다의 저예산 고농도 일상여행화전략. [이다의 허접질] [무삭제판 이다 플레이] [내손으로 발리] 이다의 레진 첫 연재작!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/5727208545452032/images/wide?width=1200	http://www.lezhin.com/ko/comic/2dawalk
59	탄생소녀	애플링	뿔사슴	로맨스	학원	\N	평범한 남학생 은성은 어느 날 갑자기 여자가 된다. 다행히 이 사실을 알고 있는 것은 병원 관계자와 친형뿐. 결국 은성은 성별을 숨기고 남장을 한 채 살아가기로 한다. 그러나 상황은 결코 은성의 뜻대로 돌아가지 않았는데… 은성이 짝사랑하는 동급생 미래가 단번에 비밀을 알아챈 것. 설상가상으로 미래는 은성에게 자신의 누드모델이 되어줄 것을 제안하는데…?!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/6131691861311488/images/wide?width=1200	http://www.lezhin.com/ko/comic/girl_birth
60	단지	단지	\N	일상	\N	\N	서른 하나, 독립한 지 10개월째. 생각해보니 나는... 남들이 생각하는 가족을 겪어본 적이 단 한 순간도 없었습니다. 가장 가까운 그들에게서 가장 깊은 상처를 받으며 바보같이 버티기만 해왔습니다. 누구에게도 말할 수 없었던, 일기장에만 꾹꾹 눌러담아왔던 마음 속 이야기. 이제 시작합니다.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/3001/images/wide?width=1200	http://www.lezhin.com/ko/comic/dangi
61	그 남자의 하이힐	김지미	\N	드라마	개그	\N	평범을 판에 박은 듯한 남자 김만석. 어느 날 헤어진 여자친구가 두고 간 하이힐을 신어보면서 새로운 세계에 눈을 뜨고 마는데...?!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/389/images/wide?width=1200	http://www.lezhin.com/ko/comic/high_heels
62	식욕	레로	\N	로맨스	액션	\N	절름발이라는 이유로 왕따를 도맡던 도훈은 전학 온 학교에서도 크게 다르지 않은 생활을 이어나간다. 그러던 어느 날, 여느 때처럼 힘없이 집으로 향하던 도훈은 사람을 뜯어 먹고 있는 같은 반 여학생 아지를 마주치게 되는데...! 맛있는 인간 도훈과 도훈을 식용으로 키우는(?) 아지의 식욕 넘치는 학교생활, 시작합니다!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/6328997930074112/images/wide?width=1200	http://www.lezhin.com/ko/comic/appetit
63	데일리 위치	성원	\N	백합	판타지	\N	판타지가 남아 있는 현실 세계에서 생계를 위해 BL 작가로 살고 있는 마녀 미스티와 초보 마녀 이브, 그리고 정체를 알 수 없는 인형 바바야가. 수수께끼의 집단에게 미스티가 잡혀간 순간, 마녀들의 정신사나운 '비일상'이 시작된다!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/5479198263607296/images/wide?width=1200	http://www.lezhin.com/ko/comic/dailywitch
64	애제자	김영조	\N	로맨스	\N	\N	도심의 건물, 자취방의 월세, 하이힐의 굽, 깔창의 높이, 그리고 취업의 벽까지 모든 것이 높기만 한 이곳은 거인들의 도시 서울. 그 속에서 주은유는 그저 허우적대기만 한다. 사랑하는 그녀에게도 말도 제대로 붙이지 못하고 지켜보기만 여러 날, 오매불망 바라보다 놓쳐버린 그녀를 다시 만난 곳은 다름 아닌..?! [그리고...여름] 김영조 작가의 유려한 작화로 그려지는 조금 위험한 로맨스!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/6558302232641536/images/wide?width=1200	http://www.lezhin.com/ko/comic/mad_teacher
65	마왕성 공주님	레켄터	\N	판타지	액션	\N	평화로운 일상을 한껏 즐기고 있던 마왕, 옛 동료인 국왕에게 편지가 날아온다. 그리고 그 내용은 마왕성에 파란을 몰고 오는데... 무단입주한 왈가닥 공주와 공주의 따까리로 전락한 마왕! 결국 마왕은 정체성을 되찾기 위해 결단을 내린다..! 마왕성에 눌러앉은 공주님을 내보내기 위한 마왕의 공주 시집보내기 프로젝트, 시작!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/6054556162588672/images/wide?width=1200	http://www.lezhin.com/ko/comic/demoncastle
66	앙영의 일기장	앙영	\N	일상	개그	\N	먹을 때랑 잠잘 때가 제일 행복한 평범한 여대생 앙영이 그리는 어딘가에 있을 또 다른 우리의 하루... 엄청난 공감력으로 페이스북 만화계를 휩쓸던 화제의 그 작품이 드디어 레진코믹스에!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/500/images/wide?width=1200	http://www.lezhin.com/ko/comic/diary_angyeong
67	알파종	행자	\N	SF	액션	\N	인간은 현재 딱 두 종류. 전쟁에서 승리한 1종족과 전쟁에서 패배한 2종족. 2종족의 평범한 아이 초슬리는 완벽한 인간을 연구하던 1종 연구원의 운반품 사고로 강제 실험체가 되고 만다. 최강의 종족이 되기 위한 1종족의 실험은 초슬리에게서 인간병기 알파종을 만들어낸다. 단순유쾌한 캐릭터 그리고 디테일한 세계관으로 무장한 SF액션판타지! 	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/344/images/wide?width=1200	http://www.lezhin.com/ko/comic/alpha
68	나의 뮤즈	팀 해장	\N	로맨스	드라마	\N	영화과 3학년 세은은 유망 영화감독 영신의 시나리오 교정 알바 일을 하다가 영신이 자신의 남자친구인 지호의 형임을, 지호가 영신을 경멸하고 있음을 알게 된다. 감독의 집에서 작업 중에 깜빡 잠들었다가 깬 세은의 앞에, '경멸'의 이유가 된 금발의 소년이 서 있었다.  이후 오랜만에 컴백하는 팀 해장의 신작! 과연 '뮤즈'는 누구인가...!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/5733067410374656/images/wide?width=1200	http://www.lezhin.com/ko/comic/muse
69	나에게 온 달	돌콩	\N	액션	로맨스	\N	1400년의 세월동안 평강공주의 환생을 찾아 다닌 남자 온달. 드디어 평강의 환생과 함께 하게 되었는데 이것은 대체!? 바보온달과 평강공주의 설화를 바탕으로한 최강의 액션판타지!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/192/images/wide?width=1200	http://www.lezhin.com/ko/comic/ondal
84	우리사이느은	이연지	\N	로맨스	\N	\N	멀어질 수도, 그렇다고 연인이 될 수도 없는 사이. 파스텔 톤처럼 따스하지만, 원색처럼 뜨겁지 못해 애매한 우리. 올 가을을 두근거리게 할 캠퍼스 로맨스가 시작됩니다.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/272/images/wide?width=1200	http://www.lezhin.com/ko/comic/woori
71	고진감래	핑푸	\N	BL	시대극	\N	말 못할 사연으로 사당패에 몸을 담게 된 고진은 우연히 들른 마을에서 신비한 도사 감래와 마주치게 된다. 그리고 때맞춰 벌어지는 마을의 이상한 사건들... 엮이면 엮일 수록, 고진은 그에게 미묘한 감정에 휩싸인다. 레진코믹스 대표 동양 판타지 [천지해] 핑푸 작가의 BL 신작.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/6233056121192448/images/wide?width=1200	http://www.lezhin.com/ko/comic/gojin_gamrae
72	섹스리스	어썸	\N	드라마	BL	\N	클럽에서 만나 연인이 된 칩과 로렌. 서로를 무척이나 사랑하지만, 극명하게 다른 둘의 온도차는 크고 작은 갈등의 주범이 된다. 급기야는 심리상담사를 찾아 상담 치료를 시작하게 되는데... 오늘도 손만 잡고 잔 두 사람, 내일은 플라토닉을 벗어날 수 있을까요?!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/5073524741373952/images/wide?width=1200	http://www.lezhin.com/ko/comic/sexless
73	그레이 - 영웅 죽이기	울리	\N	액션	SF	\N	그레이 탄생 후 1년. 계속되는 그의 비리 고발로 정부의 신뢰는 바닥으로 추락한다. 당황한 정부는 사태의 심각성을 인지하고 특단의 조치를 취하는데... 그리고 혜성처럼 등장한 뉴 히어로 “레드 머플러”. 같은 하늘 아래 두 영웅, 과연 그들은 공생할 수 있을 것인지...?	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/5644954244481024/images/wide?width=1200	http://www.lezhin.com/ko/comic/gray_red
74	나의 기사님이랑	변태중년	\N	드라마	로맨스	\N	콧대 높은 공작가의 후계자 아벨 라이언은 매너없이 중매를 거절하는 것으로 유명하다. 여느 때와 같이 중매를 파토내고 나오던 길, 상대의 기사 로렌은 아벨에게 결투를 신청한다. 괘씸함에 로렌에게 한마디를 하려던 아벨! 그런데 얘, 좀 귀엽다..? 공작가의 철벽남 아벨이 남자에게 반하는 전대미문의 사건! 과연 아벨은 그렇게 게이가 되고 마는가..!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/5096934880051200/images/wide?width=1200	http://www.lezhin.com/ko/comic/with_my_knight
75	춤추는 도련님	하양지	\N	일상	\N	\N	교수님의 부탁으로 시골에서 홀로 생활하게 된 용주. 잔잔한 전원생활은 만족하지만 어딘가 외롭다고 느낀다. 외로운 용주, 수상한 이웃 도련님과 친해지기 위해 고군분투를 하는데..! 어색하기만한 용주와 도련님이 서서히 마음을 열어가는 잔잔하지만 가볍지 않은 이야기. 특유의 감성으로 돌아온 [달콤한애드립], [우리는 시간문제] 하양지 작가의 최신작, [춤추는 도련님].	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/6598828365447168/images/wide?width=1200	http://www.lezhin.com/ko/comic/dancewithme
76	오늘도 항해	윙브릿지	\N	드라마	일상	\N	남들과 다를것 없다고 생각해 왔던 나의 평범하고도 치열한 20대. 그런 내게 어느날 예고없이 찾아온 암. 처음으로 나의 죽음과 마주친 순간, 항해는 다시 시작된다. 윙브릿지 작가만의 소녀스런 감성으로 담담하게 풀어낸 자전적 일상툰 [오늘도 항해]	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/6003405965492224/images/wide?width=1200	http://www.lezhin.com/ko/comic/voyage
77	이제 사라질 시간	므앵갱	\N	드라마	판타지	\N	왜소하게 태어나 죽을 뻔한 참새 ‘짹’은 아름다운 정령의 도움으로 둥지에서 겨우 살아남는다. 그러나 짹이 두 번째로 만난 정령 ‘포시’는 복수심에 사로잡혀 있었고, 짹은 결국 포시의 협박으로 날개 노릇을 하게 된다. 복수의 여정 속에서 포시는 뭔가 이상하다는 것을 깨닫게 되는데…	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/6203902689280000/images/wide?width=1200	http://www.lezhin.com/ko/comic/time2go
78	삶은 토마토	캐롯	\N	음식	드라마	\N	한 수저에 추억과, 한 수저에 사랑, 한 수저에 쓸쓸함. 삶의 감정들이 차분하게 녹아 있는 건강한 한 끼. 매주 수요일 시를 닮은 이야기들이 차려집니다.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/5873309761929216/images/wide?width=1200	http://www.lezhin.com/ko/comic/tomato
79	이로하 언덕을 오르면 바로	YUTO	\N	학원	일상	\N	이로하 언덕 위에 자리 잡은 전당포. 주인은 조금 특별한 힘을 가진 (귀여운) 여고생! 물건과 사람의 마음을 잇는 따뜻한 일상 이야기	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/4765727534088192/images/wide?width=1200	http://www.lezhin.com/ko/comic/irohazaka
80	파라노이드 안드로이드	엄지용	\N	드라마	SF	\N	인간의 운명을 읽는 점쟁이 맥(Mc). 사실은 인간의 손가락에 내장된 칩을 통해 인간의 과거를 읽어내고 미래를 예지한다. 여러 인간들을 만나 데이터를 수집해나가며 점점 인간에 가까와지는 그는 사실 모종의 목적으로 만들어진 로봇이었으니...! 인간만이 지닌 '비합리적 측면'을 심리학적으로 짚어낸 속 깊은 만화 [파라노이드 안드로이드]. 지금 당신의 운명도 스캔되고 있다!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/5756808370585600/images/wide?width=1200	http://www.lezhin.com/ko/comic/pa
81	BLACK OUT	김봉현	수이코	일상	\N	\N	힙합. 모르거나 관심 없는 사람에게 오해와 편견을 심어주기 쉬운 음악이자 문화… 그러나 흑인음악이 권력을 휘두르는 시대가 찾아왔어yo! 힙합이 대중화된 시대에 힙합만이 가진 것들을 낱낱이 알려줄게yo! 음악평론가 김봉현이 글을 쓰고 만화가 수이코가 비트를 넣어 그린다. 스웩~!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/294/images/wide?width=1200	http://www.lezhin.com/ko/comic/black_out
82	일루전	정종원	IAN	드라마	판타지	\N	잠들 수 없는 사후세계에서 꿈을 꾸게 된 필리. 꿈 속에서 등장한 소년을 쫓다가 이미 죽은 자가 다시 소멸해버리는 '두 번째 죽음'을 목격한다. 이 사건의 진실을 알아내기 위해 현실과 무의식 사이를 넘나들며 벌어지는 사투, 그 열쇠는 바로 '카메라'...?! 그래픽노블을 방불케하는 서사와 연출이 돋보이는, 도피elusion과 환상illusion이 어우러진 단단한 작품 !	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/6426250666573824/images/wide?width=1200	http://www.lezhin.com/ko/comic/ellusion
83	이름 없는 가게	하몽	\N	미스터리	판타지	\N	원하는 물건은 뭐든 구해주는 가게? 그러나 그 물건을 사용하는 데는 엄청난 대가가 따른다. 때로는 행복을, 때로는 파멸을 부르는 영력이 담긴 물건들을 다루는 수수께끼의 가게, 그리고 더욱 미스터리한 주인의 정체는 무엇인가!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/5967542155214848/images/wide?width=1200	http://www.lezhin.com/ko/comic/noname_shop
256	마녀도시 리린이야기	레드렌	\N	백합	미스터리	\N	자살한 사람들의 유서를 먹고 사는 이 세상에 마지막 남은 꼬마 마녀들의 귀여운 잔혹동화. 	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/174/images/wide?width=1200	http://www.lezhin.com/ko/comic/lilinstory
85	최강왕따	노도환	\N	학원	액션	\N	사람 하나쯤 죽어도 이상하지 않은 어두운 골목. 그 곳에 사건이 터질 때마다 나타나는 소년이 있다. 폭력을 폭력으로 되갚는 소년 강하늘. 압도적인 스피드와 파워, 완벽한 기술로 상대를 제압하는 강하늘이, 사실 불과 1년 전까지만 해도 최약의 왕따였다면...?!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/5493882686537728/images/wide?width=1200	http://www.lezhin.com/ko/comic/super_outcast
86	비밀스러운 짝사랑	정	\N	로맨스	학원	\N	짝사랑하고 있는 상대가 나를 짝사랑할 확률을 얼마나 될까? 1년을 바라만 보며 세연을 짝사랑한 진선, 그리고 그런 진선을 남몰래 짝사랑하던 세연. 서로의 환상 때문일까, 접점이 생길수록 애정과 함께 오해도 쌓여가는데...! 이 둘, 무사히 맞사랑할 수 있을까요? 로맨틱 코미디 [비밀스러운 짝사랑]! 시작합니다.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/6222637011828736/images/wide?width=1200	http://www.lezhin.com/ko/comic/secretmylove
87	소년이여	병장	\N	학원	액션	\N	 왕따를 당하는 친구 동호가 이해가 안가는 용주. 하지만 동호가 없어지자 왕따의 대상은 용주에게로 이어지는데... '커서'의 병장 작가 신작 학원 스릴러.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/319/images/wide?width=1200	http://www.lezhin.com/ko/comic/dearboy
88	언노운 코드	김칸비	후파	SF	미스터리	\N	문명의 이기는 언제까지 우리의 친구인가. 친숙한 그것들에게 우리는 지금, 공격 받고 있다!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/4898461438181376/images/wide?width=1200	http://www.lezhin.com/ko/comic/unknown_code
89	그다이	최용성	\N	미스터리	드라마	\N	소식이 끊어진 누나를 찾아 머나먼 호주까지 찾아온 시온. 누나가 머물렀던 셰어 하우스에 찾아간 시온은 수상해 보이는 한국인 거주자들을 만나게 되고, 수수께끼의 사내 한스에게서 누나의 흔적을 찾게 되는데...!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/398/images/wide?width=1200	http://www.lezhin.com/ko/comic/g_day
90	개화여자정보고등학교	그 이	\N	학원	\N	\N	갑자기 결정된 전학. 짝사랑을 뒤로한채 개화여자정보고등학교로 전학을 온 김호수. 인문계에서 상경계로 전학가며 만나는 새로운 과목들. 그리고 새로운 친구들. 개화여정에서 사귄 친구들과의 즐거운 고교생활	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/242/images/wide?width=1200	http://www.lezhin.com/ko/comic/girls_highschool
91	마법사의 아이	산작약	\N	판타지	\N	\N	잠들어 있는 마왕을 부활시키기 위해 그를 봉인한 대마법사의 아들을 납치하라! 자신도 모르는 사이 그 감시 역을 맡게 된 마족 트리샤는 울며 겨자 먹기로 마법사의 나라에 밀입국한다. 과연 그녀는 정체를 들키지 않고 대마법사의 아들로부터 무사히 정보를 캐낼 수 있을 것인가…!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/4790228505591808/images/wide?width=1200	http://www.lezhin.com/ko/comic/sorcerer
92	내 고양이! 님	홍끼	\N	일상	개그	\N	흔한 취준생이자 이름에서부터 느껴지는 보통의 존재 김철수. 일상의 지루함은 애니메이션으로 달래는 평범한 오타쿠 웨이를 걷고 있던 철수는 우연하게 고양이 한 마리를 줍게 된다. 그런데... 이 고양이 말을 한다..?! 거기다 성격도 나빠?! 근데 귀여워?!!! 철수, 이대로 집사확정? 본격 고양이로 힐링 웹툰 [내 고양이! 님]!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/4868376970657792/images/wide?width=1200	http://www.lezhin.com/ko/comic/mycatsir
93	히어로즈 플랜비	인디고	\N	SF	액션	\N	인디고 작가의 틴에이저 히어로물 [내츄럴스]가 본격적인 스케일로 다시 돌아왔다. 	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/312/images/wide?width=1200	http://www.lezhin.com/ko/comic/planb
94	방과후에	권골수	\N	미스터리	학원	\N	혼자 살고 머리가 긴 것 외에는 보통의 남중생인 수현. 잠이 많은 준휘, 숫기 없는 정훈이와 함께 방과후에 놀러가는 것을 낙으로 평범한 일상을 보내고 있다. 여느때와 같은 방과후 수업을 빠지고 놀러가기 위해 나간 그날. 평범한 일상이 될 거라 생각했던 것과 달리 갑작스럽게 사건에 휘말리고 마는데...	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/5912899326836736/images/wide?width=1200	http://www.lezhin.com/ko/comic/afterschool
95	데명의 그림일기	데명	\N	일상	드라마	\N	Eat, Sleep, Shit! 이제까지 만나보지 못한 새로운 코드의 개그와 독설로 무장한 일상툰! SNS 세상에서 수많은 이들에게 일침과 치유를 안겨준 화제의 그 작품 [데명의 그림일기], 드디어 레진코믹스에서 정식연재!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/5626195062816768/images/wide?width=1200	http://www.lezhin.com/ko/comic/diary_diaemyung
96	신의 속도	IRE	\N	액션	스포츠	\N	천재에게 느끼는 열등감, 그리고 그것을 극복하려고 하는 범인, 상상을 초월하는 판타지  스포츠 액션물	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/227/images/wide?width=1200	http://www.lezhin.com/ko/comic/speed_of_god
97	우물에 잠긴 달	차지안	\N	로맨스	판타지	\N	두 개의 해와 두 개의 달이 뜨던 시절. 진실한 사랑을 찾았던 인간, 그리고 신의 이야기.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/169/images/wide?width=1200	http://www.lezhin.com/ko/comic/well_moon
98	써커트릭	LIM	\N	판타지	\N	\N	 죽음을 허용받지 못한 특별한 자들은 인간을 위해 존재하기로 한다. 우리는 그들을 '마술사' 라고 부르기로 했다. 막은 열렸고, 끝나기 까지 앞으로 몇 걸음. 	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/408/images/wide?width=1200	http://www.lezhin.com/ko/comic/surkertrick
99	파라독스(PARADOX)	김현수	\N	판타지	액션	\N	꿈 속 그곳에서도 가장 깊은, 몽마가 인간의 공포심을 얻기 위해 악몽을 꾸게하는 몽마들의 세계 '파라독스'. 그곳에 나타난 몽마살해범 미스트로 더이상 악몽은 인간만의 것이 아니게 된다! 기억을 잃은 채 모든 몽마를 죽이기 위해 싸우는 몽마 미스트와 그를 주변으로 모이는 친구, 동료, 그리고 적까지. 몽마들의 악몽이 시작됩니다!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/6588281834176512/images/wide?width=1200	http://www.lezhin.com/ko/comic/paradox
100	사막화	늑대	\N	판타지	액션	\N	억울하게 여동생을 잃은 시모닉은 복수를 위해 스스로 위험에 뛰어든다. 그러던 중 아이를 유괴당할 위기에 놓인 한 여인을 도와주고, 숨겨야만 했던 그녀의 정체를 알게 되는데... 악인이 지배하고 무법이 판치는 사막 여름대륙, 그곳에서 펼쳐지는 하드보일드 판타지! 	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/386/images/wide?width=1200	http://www.lezhin.com/ko/comic/d_flower
101	무대에 촌극을 올리겠습니다.	장아찌	\N	드라마	\N	\N	수능없이 가고싶은 대학을 고르기 위해 학급의 '감정 쓰레기통' 이 된 주인공 '지원.'  대한민국에서 고3이 된다는것은 감정 쓰레기통이 되는 것보다 잔혹한것 일까?  삭막하고 안타까운 수험생들의 현실을  날카로운 직관으로 담아낸 장아찌 작가의 강렬한 데뷔작.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/6304038115344384/images/wide?width=1200	http://www.lezhin.com/ko/comic/stage
102	505 생활만화	오배고	\N	일상	\N	\N	아빠는 유쾌한 방귀쟁이, 엄마는 호전적 웃음쟁이! 오빠는... 그냥 못생겼습니다. 무서우리만치 자비심 없는 표현력, 누구나 따라할 수 있을 것 같은 만만한 그림체! 생활만화계의 이단아 오배고 작가의 회심의 데뷔작! 매주 목요일, 평일 아침 출근길의 씁쓸함을 달래보아요!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/495/images/wide?width=1200	http://www.lezhin.com/ko/comic/505_livingtoon
103	요즘 요괴	이즐라	\N	개그	일상	\N	염라대왕의 실수로 죽어버린 여주인공. 그런데 저승사자의 조수를 하라고? 요괴가 되라... 그말인가?! 죽기 전날의 사람들을 만나 소원을 들어주고 성불(?)시키는 일을 맡게 되면서 벌어지는 이판사판 이승저승 이야기! [129페이지로 보내는 편지] 이즐라 작가, 여전한 큐트와 감성으로 오랜만에 컴백!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/5716222617845760/images/wide?width=1200	http://www.lezhin.com/ko/comic/yoyo
104	그림 그리는 생각	안순현	\N	일상	\N	\N	기쁨, 슬픔, 사랑, 그리움... 우리의 마음을, 우리의 생각을 그린다	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/6016680231174144/images/wide?width=1200	http://www.lezhin.com/ko/comic/drawingmind
105	도그마	개미	\N	SF	액션	\N	이제 인간들의 육체는 더 이상 피와 살로 이루어져 있지 않다. 로봇과 인공신체가 피와 살을 대신하게 된 시대, 그 속에서 연약하지만 순수한 육체를 가진 유라는 로봇들의 타겟이 된다. 그리고 위협받는 유라를 보호하려는 아론과 스스로 강해지고 싶어하는 유라, 그리고 '마키아'.  뇌리에 꽂히는 강렬한 SF액션 [도그마].	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/6751617097662464/images/wide?width=1200	http://www.lezhin.com/ko/comic/dogma
106	레바툰	레바	\N	개그	일상	\N	본격 나사 빠진 유해불건전장르불문개그만화.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/260/images/wide?width=1200	http://www.lezhin.com/ko/comic/revatoon
107	꽃도사	고용호	김문경	판타지	액션	\N	현세의 질서를 바로잡기 위해 요괴 퇴치를 하고 있는 까칠한 도사 천지율. 그는 여느때와 다름 없는 퇴마활동 중 무언가 특별한 것을 품고 있는 한 소녀를 만나게 된다. 요괴들은 그 소녀가 품고 있는 것을 탐내며 공격해 오고, 내키지는 않지만 어쩔 수 없이 천지율은 그 소녀의 보디가드 노릇을 하게 되는데… 과연 그들의 운명은?	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/5323593360080896/images/wide?width=1200	http://www.lezhin.com/ko/comic/flowerwizard
108	하루종일 조아영	김맹	\N	개그	일상	\N	201동 202호에는 무뚝뚝하지만 다정한 오빠와 언제나 해맑은 아영이가 삽니다. 귀여운 남매와 엉뚱한 이웃들의 유쾌한 하루하루! 오늘도 아영이와 [하루종일 조아영]♡	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/4537933260652544/images/wide?width=1200	http://www.lezhin.com/ko/comic/joayoung
109	소라소라	모미	\N	로맨스	학원	\N	뚱보 콤플렉스의 강소라는 전학 첫날부터 차갑고 잘생긴 동급생 백소라를 짝사랑하게 된다. 하지만 백소라는 어째서인지 강소라의 감정을 거부하는데… 낙담한 강소라의 발길이 닿은 곳은 소원을 들어준다는 전설의 벚나무 앞이었다.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/6197498578468864/images/wide?width=1200	http://www.lezhin.com/ko/comic/sorasora
110	애플 다이너마이트	콕	\N	로맨스	개그	\N	사과폭탄 같은 본격 러브 코미디. 이웃사촌 두 집 사이의 매력 만점 로맨스 시작!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/155/images/wide?width=1200	http://www.lezhin.com/ko/comic/apple_dynamite
111	그녀의 암캐	피토	\N	백합	학원	\N	학창시절 동경하던 소하 선배를 위해 가윤은 그녀만이 할 수 있는 일을 선택했다. 그녀의 빈 곳을 채워주기 위한 가윤의 선택은 과연?  피토 작가의 2015년 새 야심작!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/376/images/wide?width=1200	http://www.lezhin.com/ko/comic/her_dog
112	길 잃은 마왕의 딸이 숲속 나무꾼 부려먹는 만화	눅쓰	\N	판타지	일상	\N	인간계와의 대전쟁에서 승리한 마왕(4000살 추정)의 무용담을 믿지 못한 딸은 우연히 인간계 입구로 들어갔다가 길을 잃는다. 인간계에 편도로 떨어진 마계의 공주와, 그녀를 줍게 된 나무꾼의 이야기! 귀여움인가, 두려움인가!!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/476/images/wide?width=1200	http://www.lezhin.com/ko/comic/lostgirl
113	마왕을 죽이는 방법	한민기	\N	판타지	개그	\N	사제 지망생 아르하가 첫 신탁에서 마왕을 불러내버렸다! 마을은 쑥대밭이 돼버리고, 아르하의 할아버지이자 과거 대 사제였던 로이난은 싸움 끝에 마왕에게 저주를 걸어버리는데…! 절대 어울리지 않는 사제 지망생 소년과 마왕의 이상한 여행이 시작되었다.  한민기 작가의 신작!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/5307743769985024/images/wide?width=1200	http://www.lezhin.com/ko/comic/kill_dark
114	나와 호랑이님	윤재호	카넬	판타지	\N	\N	평범한 학생이었던 성훈은 어느날 자신이 환웅에게 선택받지 못한 호랑이 요괴와 결혼을 하지 않으면 온세상이 요괴로 덮히게 된다는 것을 듣게 되고.. 미소녀로 변한 호랑이와의 기묘한 동거가 시작된다.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/277/images/wide?width=1200	http://www.lezhin.com/ko/comic/mylovetiger
115	너의 돈이 보여	민국23	S리아	미스터리	로맨스	\N	사람들이 가진, 그리고 가질 '돈'을 볼 수 있는 성춘, 다사다난했던 지난 날을 딛고 이제는 편히 살고 싶다. 일확천금의 꿈을 안고 그의 앞에 나타난 대기업 막내딸 지향을 붙잡지만···. 성춘을 바라보는 지향의 눈에 보이는 것은 다름 아닌 성춘의 돈?! 돈을 보는 두 남녀의 동상이몽 로맨스 [너의 돈이 보여] 시작합니다.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/6732978288328704/images/wide?width=1200	http://www.lezhin.com/ko/comic/moneylover
146	오딘	감람	\N	액션	판타지	\N	평범한 인간으로 살고 있던 프라야. 자신도 모르던 '신을 보는 능력'으로 인해 죽음을 맞이한다. 이에 오딘은 그녀를 살리기 위해 귀하디 귀한 지혜의 샘물로 그녀에게 사용하는데...	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/258/images/wide?width=1200	http://www.lezhin.com/ko/comic/odin
116	데들리 키스	박만두	\N	개그	호러	\N	남자인데 너무 '예뻐서' 여자친구도 한번 사귀지 못한 은빈이는 우연히 마주친 학교 퀸카 여리 선배를 따라 사이비 종교 순결교에 들어가게 되는데..한편 여의도에 현실의 인간이라고는 믿기 힘든 미모의 꽃미남,꽃미녀들이 나타나 거리의 시민들에게 무작정 키스를 퍼붓기 시작하고 키스를 받은 사람들은 사지가 비틀리며 그들과 똑같은 꽃미남,꽃미녀로 변하기 시작한다. 신개념 꽃좀비 액션!  	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/29/images/wide?width=1200	http://www.lezhin.com/ko/comic/deadly_kiss
117	남자와 남자의 비밀	키몽	\N	BL	일상	\N	동인 작가 피피님을 흠모하던 주인공 이서는 존잘님과 같은 학교를 다니고 싶단 일념하에 충동적으로 대학에 진학해버린다. 그렇게 만나기만을 고대하다 우연히 강의실에서 마주한 그분! 꿈에서 그리던 그분은 바로...!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/5195917103202304/images/wide?width=1200	http://www.lezhin.com/ko/comic/secret_boys
118	초년의 맛	앵무	\N	음식	드라마	\N	살기 위한 에너지원 그 이상... 우리는 음식을 통해 위로받고 소통하고 또 마음을 나눈다. 음식을 통해 만나고 나아가는 이 시대 초년생들의 달콤 쌉쌀한 인생의 맛, 먹방 청춘만화 !	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/5771872688144384/images/wide?width=1200	http://www.lezhin.com/ko/comic/rookie
119	비밀 줄리엣	오리발	\N	판타지	로맨스	\N	신입 메이드 로잘린은 아무도 실제로 만난적이 없다는 나쁜 소문만 무성한 캐플릿 가문의 외동딸 줄리엣 아가씨를 보살피는 담당을 맡게 되는데...줄리엣의 비밀은 과연?	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/325/images/wide?width=1200	http://www.lezhin.com/ko/comic/secret_juliet
120	아스타드 왕립유랑극단	폴빠	입개	판타지	\N	\N	신이 만든 땅 아스타드에는 전설과 이야기들이 넘쳐나죠! 저희 아스타드 왕립 유랑극단은 관객에게 후회되지 않는 선택이 될 것입니다. 말로만 전해내려져 오는 이야기들을 직접 눈으로 보여드립니다! 요정 문학의 권위자 라프너가 직접 선별한 다양한 출신의 배우들의 놀라운 연기들과 묘기를 보러 오세요!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/315/images/wide?width=1200	http://www.lezhin.com/ko/comic/astadtroupe
121	내 집사는 비정규직	마사토끼	ASURA	드라마	개그	\N	집사로서의 완벽한 길을 추구하는 엘리트 집사 유진 에반스. 하지만 영광스러워야 할 집사로의 첫걸음은 고용주의 야반도주로 엉망이 되고... 신세 사나운 집사와 눈매 사나운 아가씨, 팔자 사나운 메이드의 기묘한 동거가 시작된다.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/5433266843156480/images/wide?width=1200	http://www.lezhin.com/ko/comic/my_butler
122	조국과 민족	강태진	\N	드라마	시대극	\N	조국과 민족을 위한 길이라면 폭력과 고문도 서슴지 않는 정보기관 공작원 박도훈은 우연한 기회에 대남 공작원에 포섭되어 해서는 안 될 은밀한 거래를 하게 되는데... 올림픽과 대통령 선거를 앞둔 1987년의 공안정국 속 대한민국을 배경으로 쫓고 쫓기는 공작원들의 이전투구가 실제 역사 속 사건들을 모티브로 현실감 있게 그려지는 본격 시국 느와르.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/4767600603561984/images/wide?width=1200	http://www.lezhin.com/ko/comic/spys
123	환생고딩	감마	\N	학원	개그	\N	2명의 남녀가 다시 태어났다. 같은 모습, 그리고 다른 성별로. 그 결과 여전히 험악한 인상의 여고생 '주인공', 그리고 그녀의 단짝 친구였던 청초한 남고생 '차우주'! 비록 몸은 엉망진창이 되었지만 학습의 의무를 다하기 위해 오늘도 등교합니다!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/4615810042036224/images/wide?width=1200	http://www.lezhin.com/ko/comic/rebirthchoo
124	도사 창이	용용	\N	판타지	액션	\N	신선이 되기 위해 수행여행을 떠나는 도사들. 힘든 수련을 마치고 하산한 도사 창이의 여행길은 처음부터 난관에 부딪친다. 보기드문 정통 소년액션 만화.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/209/images/wide?width=1200	http://www.lezhin.com/ko/comic/changi
125	우두머리	고영훈	\N	드라마	\N	\N	대통령과 조폭 보스의 운명이 뒤바뀐다! 우두머리 대 우두머리!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/498/images/wide?width=1200	http://www.lezhin.com/ko/comic/bossxboss
126	어바웃 제인	엠제이	\N	SF	액션	\N	과학이 비약적으로 발전한 2099년 신행성 '에텔', 고도화된 발전 뒤에는 가장 영향력 있는 인물인 세계 최고의 로봇설계 권위자 렌 크라프트가 있다. 그리고 그녀의 하나뿐인 딸 제인은 학교의 킹카 네이선을 짝사랑하는 평범한 학교생활을 보내고 있다. 이전처럼 네이선을 몰래 지켜보던 어느날, 제인은 네이선에게 데이트 신청을 받는다. 얼떨결에 네이선과 새해를 맞이하게 된 그 순간! 광장에 대규모 테러가 일어나는데..?!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/4832793653936128/images/wide?width=1200	http://www.lezhin.com/ko/comic/aboutjane
127	졸리 로즈	이아영	\N	로맨스	판타지	\N	라이벌 여성 해적단 ‘매드 메리’에 사로잡힌 ‘가네슈’ 해적단 선장 네쉬. 해질녘, 매드 메리의 그녀들이 네쉬를 가두는 이유는 과연...?! ’홀로 남자’인 네쉬를 둘러싸고 벌어지는 매드 메리 해적단의 기묘한 기류! 과연 그녀들은 장미인가, 가시인가! [외모윤리] 이아영 작가의 본격 해적 로맨스 [졸리 로즈], 처녀 출항!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/6129586490834944/images/wide?width=1200	http://www.lezhin.com/ko/comic/jolly_rose
128	눈의 마녀	나락갈대	\N	판타지	개그	\N	혼자 집을 보던 설희에게 갑작스런 손님이 왔다. 바로 서커스를 탈출한 동물과 구미호가 그녀의 집으로 도망온 것! 설희는 얼결에 받아주지만 곧 그들을 쫓던 단장에게 함께 납치 당하고 마는데... 평범한 일상에 난입한 곰, 호랑이, 구미호와 마녀들까지! 설희의 삶은 과연 어디로 가는 것인가!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/5736243817611264/images/wide?width=1200	http://www.lezhin.com/ko/comic/witchofsnow
129	광연전설	느릅	\N	개그	판타지	\N	자경단 단장 유드의 수호로 평화롭던 도시 청림. 그 뒤편에 단장을 죽이려는 자들이 나타나게 되면서 평화가 조금씩 깨져 간다. 실패할리 없어 보였던 단장 축출 작전, 그러나 유드의 객으로 머무는 타지인 광연에 의해 틀어지고 마는데.. 과연 유드는 죽이려는 자와 지키려는 자의 대립에서 무사할 수 있을까? 전설이 전설이 아니던 그때의 이야기, [광연전설]!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/5105084793356288/images/wide?width=1200	http://www.lezhin.com/ko/comic/klegend
130	오늘도 항해	윙브릿지	\N	드라마	일상	\N	남들과 다를것 없다고 생각해 왔던 나의 평범하고도 치열한 20대. 그런 내게 어느날 예고없이 찾아온 암. 처음으로 나의 죽음과 마주친 순간, 항해는 다시 시작된다. 윙브릿지 작가만의 소녀스런 감성으로 담담하게 풀어낸 자전적 일상툰 [오늘도 항해]	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/6003405965492224/images/wide?width=1200	http://www.lezhin.com/ko/comic/voyage
131	마들레느가 9번지	진혜리	\N	음식	로맨스	\N	어느 날 갑자기 유럽의 동네 제과점에서 일하게 된다면? 행동파 모건 부인, 쿨한 파티쉐 비숍, 아르바이트 겸 작가 지망생 줄리가 꾸려나가는 작은 제과점 이야기.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/6/images/wide?width=1200	http://www.lezhin.com/ko/comic/m_street_no9
132	불꽃의 메디아	신일숙	\N	판타지	로맨스	\N	신비한 동양의 나라 콜키스의 두번째 공주 메디아와 황금양털을 찾아 그리스에서 온 이아손을 둘러싼 운명과 사랑.. ,  신일숙의 그리스 신화의 재해석.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/263/images/wide?width=1200	http://www.lezhin.com/ko/comic/media
133	방황하는 신	1230	\N	미스터리	\N	\N	잔인한 범죄, 떠도는 악령, 믿음을 강령하는 종교가 뒤섞인 황폐한 세상. 그 속에 인간이 흘린 내면의 흔적을 볼 수 있는 형사 김동. 세상을 구원하라고 떠밀린 그에게 닥친 수많은 위기들! 혼탁을 뛰어넘은 혼돈의 세상을 그가 구원할 수 있을까?	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/413/images/wide?width=1200	http://www.lezhin.com/ko/comic/lostgod
134	꼴데툰 2016	샤다라빠	\N	스포츠	개그	\N	전격 무료 연재! 새로운 감독, 새로운 마무리, 그리고 새로운 돔구장의 첫 상대팀! 명분은 충분하다. 이제 가을에 야구만 하면 된다! 감동, 일침, 딥빡이 절묘하게 뒤섞인 샤다라빠의 롯데 만화, 올해도 플레이볼!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/5686323091865600/images/wide?width=1200	http://www.lezhin.com/ko/comic/ggtoon2016
135	내 처음을 너에게 줄게	타카시마 에리	anzu	로맨스	학원	\N	남자친구의 바람을 목격한 미즈키는 욱하는 마음에 그 자리에 있었던 남학생과 키스를 해버리고 만다. 그런데, 하필 그 상대가 학교 제일의 인기인 이즈미 유우! 믿을 수 없게도 그게 인기남 이즈미 유우의 퍼스트 키스였고, 미즈키는 어떤 조건을 걸고 연애를 해본적 없는 인기남의 러브 특훈을 담당하게 되는데? 두근두근 퓨어한 학원 로맨스	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/5233723077820416/images/wide?width=1200	http://www.lezhin.com/ko/comic/bokunohajimete
136	저스트 로디드	2tle	\N	로맨스	\N	\N	성공한 우찬은, 드디어 오랜 짝사랑이자 첫사랑인 여주에게 고백한다. 그러나 우찬의 고백은 변해버린 여주에 의해 제대로 전해지지도 못한 채 차이게 된다. 후회와 미련에 빠져 잠이 든 우찬은, 다음 날 아침 자기가 여주를 만나기 전의 그 때로 돌아갔다는 것을 깨닫는데...! 다시 찾아온 기회, 우찬은 여주를 쟁취할 수 있을 것인가!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/6190582933749760/images/wide?width=1200	http://www.lezhin.com/ko/comic/just_loaded
137	더 폴 오브 맨	안시	\N	드라마	\N	\N	누군가로부터 벗어나려는 남자와, 누군가를 찾아내려는 남자! 성격도, 사연도, 목적도 다른 두 남자의 끝을 알 수 없는 로드무비!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/5321439212732416/images/wide?width=1200	http://www.lezhin.com/ko/comic/fall_of_man
138	여고생 부적합	섹시빔	\N	학원	개그	\N	핏이 딱 맞는 타이트한 블라우스, 바람에 약한 아슬아슬 플레어 치마, 그리고 그 뒤에는..? 다친 여동생 자영의 개근상을 지켜주기 위해 팔불출 오빠 자남이 떴다! 하얀 피부의 강렬한 포인트 수염, 선글라스 뒤의 살기 어린 눈매, 그리고 보디빌더도 울고 갈 완벽한 근육 라인의 이 오빠, 무사히 버틸 수 있을까요? 지상 최강의 남고생 유자남의 여고 생존기, [여고생 부적합]!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/6071349124005888/images/wide?width=1200	http://www.lezhin.com/ko/comic/bujukhap
139	이로하 언덕을 오르면 바로	YUTO	\N	학원	일상	\N	이로하 언덕 위에 자리 잡은 전당포. 주인은 조금 특별한 힘을 가진 (귀여운) 여고생! 물건과 사람의 마음을 잇는 따뜻한 일상 이야기	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/4765727534088192/images/wide?width=1200	http://www.lezhin.com/ko/comic/irohazaka
140	말할 수 없는 남매	윌로우	\N	로맨스	개그	\N	전학 첫 날부터 큰 사고를 쳤다. 첫눈에 반한 남학생의 관심을 끌기위해 오빠와 사귄다는 거짓말로 학교를 발칵 뒤집어 놓은 다이너마이트 남매의 학교생활. 탄탄한 실력을 갖춘 윌로우님의 장편 데뷔작.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/99/images/wide?width=1200	http://www.lezhin.com/ko/comic/my_secret_brother
141	환관제조일기	김달	\N	개그	시대극	\N	19세기 청나라 궁궐의 서쪽, 환관을 만드는 여자 도자장의 이야기. 본격 고추 자르는 만화 [환관제조일기] 개시!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/6528753551540224/images/wide?width=1200	http://www.lezhin.com/ko/comic/castration
142	내 학생이 싸이코패스일 리가 없어	명왕성	\N	개그	학원	\N	총기난사, 연쇄살인, 시체유기 등등 수많은 범죄의 중심에 있는 '싸이코패스'. 조용하게 우리들 사이에서 범죄를 저지르는 그들이 ... 내 제자라면..?! '아무래도 싸이코패스인 것 같아요.' 신임 보건교사 김영희에게 던져진 폭탄 같은 고백! 그런데 이 학생, 뭔가 어설프다..?! [내 학생이 싸이코패스일 리가 없어], 시작합니다!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/6058601980887040/images/wide?width=1200	http://www.lezhin.com/ko/comic/nehakssa
143	표준규격전사	오솟	\N	개그	판타지	\N	지극히 정상적인(?) 그들의 표준적인 모험 이야기가 시작된다!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/4733152235356160/images/wide?width=1200	http://www.lezhin.com/ko/comic/standardheroes
144	히 러브즈 미	제인	\N	로맨스	학원	\N	어린시절부터 완벽한 왕자님과의 만남을 꿈꿔온 공주님, 공지우. 그녀는 학교 최고의 아이돌, 연예계 데뷔를 앞두고 있는 한태준에게 고백할 찬스만 노리고 있었다. 하지만, 예상 못한 뒷걸음질 도중 생각하지도 못했던 인물에게 질투를 불태우게 되는데....!!?! 상큼 발랄 틴에이지 학원 순정물!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/57/images/wide?width=1200	http://www.lezhin.com/ko/comic/he_loves_me
145	저승GO	최가은	\N	액션	판타지	\N	인간의 냄새를 풍기지 말라. 저승고등학교 8반 담임으로 부임한 김인간 선생님의 치열한 저승고 적응기.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/160/images/wide?width=1200	http://www.lezhin.com/ko/comic/phantom_school
147	앙영의 일기장	앙영	\N	일상	개그	\N	먹을 때랑 잠잘 때가 제일 행복한 평범한 여대생 앙영이 그리는 어딘가에 있을 또 다른 우리의 하루... 엄청난 공감력으로 페이스북 만화계를 휩쓸던 화제의 그 작품이 드디어 레진코믹스에!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/500/images/wide?width=1200	http://www.lezhin.com/ko/comic/diary_angyeong
148	따뜻한 달	영춘	\N	백합	드라마	\N	새롭게 다가오는 다정한 사람, 그렇게 찾아 헤매던 그리운 사람. 다섯 명의 여자들이 서로의 인생에 스며들어가는 소중한 시간들. 섬세하고 따뜻한 시선으로 세상을 바라보는   영춘 작가의 첫 장편 만화.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/5838505124560896/images/wide?width=1200	http://www.lezhin.com/ko/comic/moon
149	뿔뿔뿔뿔	나지	\N	로맨스	드라마	\N	미노타우로스 증후군, 뿔이 달린 동물의 얼굴을 지닌 사람들을 일컫는 말. 인간과 뿔 사이의 세상 틈새에서 멀쩡히(?) 직장생활하며 살아가는 남자들의 이야기. 세상에서 가장 사랑스러운 뿔 만화 , 오랜 기다림 끝에 시작!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/5256670468374528/images/wide?width=1200	http://www.lezhin.com/ko/comic/horns
150	블루치즈테이블	편백나무숲	\N	BL	드라마	\N	평범과 모범의 아이콘 수운에게는 남다른 첫사랑의 아픔이 있다. 소꿉친구였던 석조를 짝사랑했지만 서로에게 상처만 남긴 채 악연으로 끝났던 쓰라린 과거. 하지만 그렇게 끝난 줄 알았던 석조와, 생각지도 못한 곳에서 다시 마주치게 되는데...	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/5534676734705664/images/wide?width=1200	http://www.lezhin.com/ko/comic/bluecheesetable
151	엿고딩즈	H0N	\N	학원	개그	\N	순백의 바보 강태준을 필두로 모인 총천연 무지개색 고등학생들! 비록 이런 친구들은 만난 적 없지만 이런 친구들과 함께 했다면 분명 다른 학교생활을 했으리라. 비록 미래는 무엇을 꿈꾸고 사는지 모르겠지만 누구보다 현재를 즐길 줄 아는 고딩들로 똘똘 뭉친 ! 웃을 일 없는 일상에 변화가 필요하다면 바로 구독입니다!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/5604275636142080/images/wide?width=1200	http://www.lezhin.com/ko/comic/yut_godingz
152	꽃들 속에 숨다	김계후	\N	백합	판타지	\N	모든 식물에 마법이 깃든 아주 작은 나라, 그 변방에 있는 대마법사의 마법 학교 향수과에 입학한 주인공 바넬라는 랜턴과 키아라라는 소녀를 짝사랑하게 된다. 꽃에게 속삭이듯 펼쳐지는 소녀들의 작지만 큰 이야기.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/5573193237004288/images/wide?width=1200	http://www.lezhin.com/ko/comic/hide_in_the_flowers
153	레드 후드 Red Hood	관절	\N	판타지	액션	\N	흰 피부와 붉은 눈 때문에 귀족으로서의 예절이나 춤이 아니라 목숨을 지키기 위한 검술을 배워 기사가 되어버린 칸나. 그러나 정체가 탄로난 그녀에게 세상은 '마녀'라는 별명을 붙여버리고 마는데...  관절 작가의 초대형 판타지 신작!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/320/images/wide?width=1200	http://www.lezhin.com/ko/comic/redhood
154	바로 그 회사	딱정벌레	치라	개그	일상	\N	훈남훈녀 직원 다수, 우수한 업계성장률, 고양이 상주, 모두가 들어가고 싶어하는 그 회사 '태평미디어'. 그곳에 눈치 無, 쓸모 無, 생각 無- 3無의 김다빈이 떴다! 하찮은 '김다찮'과 조금씩 핀트가 나간 태평미디어 사람들의 코믹오피스일상물, 현실에는 없는 [바로 그 회사]!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/5017916214345728/images/wide?width=1200	http://www.lezhin.com/ko/comic/the_company
155	브레멘 : 도착하지 못한 음악대	덴	\N	판타지	개그	\N	어느날 갑자기 자기 원고 속 세계로 빨려들어간 소녀. 그녀에게 주어진 것은 타블렛 펜?? 성지 브레멘의 열쇠가 될 작곡가라는 예언에 따라 움직이게 되는데.. 	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/210/images/wide?width=1200	http://www.lezhin.com/ko/comic/bremen
156	나쁜 아이들	전수영	\N	학원	미스터리	\N	소년원에 있던 '수'는 담임으로부터 여자친구 '미래'의 자살소식을 전해듣는다. 소년원을 나온 '수'는 '미래'의 방에서 수수께끼의 물품보관영수증을 발견하는데... '미래'의 죽음 뒤에 숨겨져 있던 무거운 진실이 '수'의 앞을 가로막는다!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/434/images/wide?width=1200	http://www.lezhin.com/ko/comic/bads
157	CANADADA!	진돌	\N	일상	드라마	\N	살기 좋은 나라 베스트5 단골 국가 캐나다. ‘가고 싶은 이에게는 꿈, 현지인에게는 일상, 다녀온 이에게는 추억이 되는’ 캐나다 만화가 왔다! 절묘한 타이밍에 여러분의 곁에서 사라졌다가 레진에서 이어지는 화제의 캐나다 일상툰… 그 이름은 바로 CANADADA!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/5911992981782528/images/wide?width=1200	http://www.lezhin.com/ko/comic/canadada
158	나와 상사의 비밀사정	타무라 준코	\N	로맨스	\N	\N	멋있지만 까칠한 상사, 훈남이지만 바람둥이. 당신의 선택은?	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/4843601782112256/images/wide?width=1200	http://www.lezhin.com/ko/comic/watashitojyosi
159	누설	손일지	\N	판타지	액션	\N	어느 날 부터 혼령과 접신하는 자들이 나타난다. 기이한 모양으로 태어난 이들은 영매사라 불리우며 이내 사람들에게 배척당하고, 그들은 자신만의 삶을 찾아 각지를 떠도는데.. 타고난 접신술로 혼령과 소통하는 영매사와 이들을 잡는 혼령사냥꾼의 한 판 활극	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/217/images/wide?width=1200	http://www.lezhin.com/ko/comic/nooseol
160	공백기	전민지	\N	일상	드라마	\N	여성 삼인조 아이돌 '팅커벨'의 광팬인 공백희. 평범한 그녀가 사는법.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/5624953393643520/images/wide?width=1200	http://www.lezhin.com/ko/comic/kuhakuki
161	FOR WHOM	에디	\N	SF	액션	\N	17살의 벤자민은 어느날 극심한 몸의 이상을 느끼고 폭주하다가 정신을 차려보니 초능력자가 되어 있었다!? 그리고 아버지에게 듣게 되는 진실..그렇게 그는 '영웅'이 되었다. 17년만에 세상에 나타난 히어로들. 그들이 세상에 나타난 이유는 무엇인가?	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/70/images/wide?width=1200	http://www.lezhin.com/ko/comic/for_whom
176	독일 만화	맨오브피스	\N	일상	\N	\N	독일하면 떠오르는 것은?맥주,소시지,베를린...그것만이 다가 아니다! 직접 다녀오거나 살아보지 않으면 모를 생활밀착형 독일이야기.맨오브피스 작가가 직접 겪은 에피소드와 함께 지금 가장 핫한 그들만의 문화와 이슈, 생활정보 등을 절제된 독일식 매력으로 매주 전해드립니다.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/5692661497856000/images/wide?width=1200	http://www.lezhin.com/ko/comic/germantoon
162	퍼펫플레이	키키	\N	액션	판타지	\N	에임, 하이그, 래디. 3명의 소년은 기사단이 지키고 있는 경계의 울타리를 넘어 바깥 세상으로의 여행을 시작한다. 악마를 섬기는 종교집단 다르달다르의 주술사가 인간의 영혼을 집어넣어 만든 기계인형 마리의 아이들. 경계를 넘자마자 그들의 표적이 된 소년들은 각자의 목적을 위해 목숨을 건 싸움을 계속하는데…!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/5255174490947584/images/wide?width=1200	http://www.lezhin.com/ko/comic/puppet_play
163	징벌 소녀	가재	stego	학원	미스터리	\N	남몰래 지구를 지키는 시대는 끝나고, 변신 전 정체마저 드러내며 마음껏 사는 아이돌 같은 마법소녀의 시대가 찾아왔다. 그러나 그녀들의 정체는 학교에서 폭력을 일삼는 일진의 리더. 그러던 어느 날, 한번도 본 적 없는 마법소녀가 모습을 드러낸다. 다른 마법소녀들에게 선전포고를 하기 위해…! <11번가의 기묘한 이야기> 가재 작가와 stego 작가의 파워 신작!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/318/images/wide?width=1200	http://www.lezhin.com/ko/comic/miss_guillotine
164	더블캐스팅	신영우	\N	액션	미스터리	\N	막강하게 떠오르는 신흥 조직의 보스가 20년 만에 찾은 쌍둥이 동생이 그가 보는 앞에서 살해를 당한다. 그는 범인을 잡기 위해 동생의 인생을 살기로 하는데. 동생의 직업은 경찰학교를 졸업한 신참 경찰! 낮에는 무능한 형사로, 밤에는 유능한 조폭 보스로 이중생활을 시작한다. 더 강하고 수위높은 액션으로 돌아 온 신영우 작가의 더블캐스팅 리메이크 버전.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/252/images/wide?width=1200	http://www.lezhin.com/ko/comic/double_casting
165	월한강천록	회색	\N	무협	\N	\N	자신의 절대무공을 숨기고 허당 노릇을 하며 살아가는 무당파 소월과 미소년 사제 소하 그리고 자애로운 대사형 지서는 당주의 명을 받고 무림맹으로 향하는데.. 그런 소월을 마교의 첩자로 의심하여 쫓는 노악과의 악연은 점점 서로를 강하게 연대시키고, 평화롭던 무림에 서서히 드리워지는 검은 그림자의 정체는...	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/107/images/wide?width=1200	http://www.lezhin.com/ko/comic/coldmoon
166	백서사시	늴릴	GMAN	액션	판타지	\N	인간과 수인이 공존하는 시대. 식인수인에 고통받던 시대는 영웅 솔반리에 의해 막을 내리고 그 이후 500년, 세상은 또다시 요괴의 출현으로 혼란에 빠진다. 세상을 구하기 위해 홍길동은 모험을 떠나는데... [백도사]의 프리퀄, 영웅 홍길동의 서사시! [백도사]의 늴릴작가의 치밀한 세계관을 GMAN 작가의 그림으로 강렬하게 풀어낸 액션 판타지.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/6291928042176512/images/wide?width=1200	http://www.lezhin.com/ko/comic/white_epic
167	천지해	핑푸	\N	판타지	\N	\N	천계에 올바른 질서를 가져오기 위해 초대 옥황상제가 12지, 십장생, 오방신의 대표를 한 명씩 모아만든 기구 천지해. 이 조직에 황룡의 대표로 참가하게 된 수습 천지해 륜. 그녀가 첫 출근에서 보게된 천지해의 모습이란...? 다양한 종족이 부대끼며 살아가는 천계를 배경으로 벌어지는 특무기관 판타지 드라마.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/59/images/wide?width=1200	http://www.lezhin.com/ko/comic/cheonjihae
168	부랄친구	한라감귤	\N	개그	학원	\N	낭랑 18세의 지은은 길건너 옆집에 사는 민철과 10년도 더 된 부랄친구다. 남녀사이에 친구는 없다지만 꾸준히 둘은 친구임을 주장하고 있기를 10여년.. 하지만 아침에 함께 등교, 하교도 같이, 아프면 병문안, 놀러갈 때도 단둘이.. 이런 둘이 정말 단순한 친구 사이로 남을 수 있을까..? 사랑보다 먼~ 우정보다는 가까운~ 지은과 민철의 미묘한 학원일기 [부랄친구]!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/5474379383439360/images/wide?width=1200	http://www.lezhin.com/ko/comic/bff
169	이성연애박사	참새	반숙	백합	로맨스	\N	이성관계에 고민이 많던 대학생 이레는 홀리듯 발견한 자칭 연애박사의 광고지에 마음을 뺏긴다. 연애의 모든 것을 가르쳐준다는 이 사람, 믿어도 되는 걸까?	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/4535001206489088/images/wide?width=1200	http://www.lezhin.com/ko/comic/master_of_love
170	밍기뉴	권계림	\N	드라마	로맨스	\N	어디서든지 사람들 무리 속에 끼어들지 못했던 왕따 연우에겐 항상 위로를 해주는 키다리 아저씨 같은 얼굴 모를 첫사랑이 있다. 그러나 연우는 대학생이 되면서 그 첫사랑과 함께 자신의 흑역사 같은 모든 과거를 떨쳐내고 싶어한다. 하지만 얼굴 모를 첫사랑은 그런 연우를 놓아주려 하지 않는데...	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/5597285332811776/images/wide?width=1200	http://www.lezhin.com/ko/comic/minguinho
171	시크릿 스타	밍과	\N	개그	\N	\N	뼛속까지 오타쿠이자 잘나가는 신인 아이돌 [Control]의 멤버 문바름. 그는 존잘이라 부르는 세심님의 마지막 동인지를 얻기 위해 만화축제에 직접가는 모험을 강행! 그리고 극적으로 연을 맺는 두사람! 아이돌과 존잘이라는 상관관계 제로의 두명에게는 과연 어떤 일이?! 	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/483/images/wide?width=1200	http://www.lezhin.com/ko/comic/secretstar
172	진돌 만화	진돌	\N	개그	일상	\N	흰 개가 오너캐라니, 레진과는 이미 운명?! 수많은 일상툰 사이에서 반짝이는 또 하나의 발칙(발랄)계 일상툰 , 드디어 입성!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/5621214508220416/images/wide?width=1200	http://www.lezhin.com/ko/comic/jindoltoon
173	튄 공	이삼	\N	스포츠	\N	\N	결승전의 결정적인 실수로 다시는 농구를 하지 못하게 된 동경은 농구밖에 모르는 바보 오철 그리고 달명과 우연히 마주치며 인생을 건 길거리 농구 한판이 시작된다! 꺾어진 청춘에 봄은 다시 오는가?	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/200/images/wide?width=1200	http://www.lezhin.com/ko/comic/rebound_ball
174	예전고	김선우	\N	학원	개그	\N	예체능계열 전문 고등학교에 전학 온 최고의 아이돌 성민지. 그녀의 이상형은 강한 남자. 세상 어디에도 없었던 이상한 전쟁이 시작된다. [노멀모드] 김선우 작가의 데뷔작, 고화질 재편집. 프리미엄 병맛 학원물.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/6381972271661056/images/wide?width=1200	http://www.lezhin.com/ko/comic/artshighschool
175	룩앳미	KONY	\N	드라마	\N	\N	사람들의 시선을 피하고 싶은 릴리와 그 시선을 즐기는 니노. 성격도 성향도 정반대인 두 사람은 어느새 10년을 함께 하고 있다. 그리고 이제 그 10년의 우정이 어긋나려 하는데...	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/5596823196008448/images/wide?width=1200	http://www.lezhin.com/ko/comic/look_at_me
177	어쩌면 용사	마셀린	마사토끼	개그	일상	\N	모험도 소동도 없이 조용히 살고 싶은 나의 일상에 외계인(자칭)과 로봇(자칭)과 지구방위대(자칭)와 대마왕(자칭)이 찾아왔다. 나 빼고 전부 정신병자인 중2병 월드에서 소중한 나의 일상을 지켜나가는 장대한 모험기.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/6267928034410496/images/wide?width=1200	http://www.lezhin.com/ko/comic/brave
178	마나마나	름새	\N	일상	판타지	\N	부모님이 갑자기 여행을 가셨다. 그것도 세계여행! 게다가 6개월! 그렇게, 부모님이 돌아오실 때까지 알아서 지내게 된 8남매의 앞에 처음 보는 어린 소녀가 찾아왔다. 어? 뭐라고? 우주에서 왔다고? 그럼… 외계인?!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/5293032012775424/images/wide?width=1200	http://www.lezhin.com/ko/comic/manamana
179	요람을 흔드는 섬	이동욱	\N	개그	\N	\N	생존을 위해서는 사랑해야 한다?! 대해일이 닥친 지구, 운좋게 살아남은 이들은 이름 모를 무인도에 모인다. 하지만, 섬이 가라앉는 것을 막기 위해서는 생존자들 가운데 커플이 나와야 하는데... 지구 최후의 섬에서 펼쳐지는 연애서사시!! 사랑해야 생존할 수 있다! 본격 살아남기 개그청춘물!!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/280/images/wide?width=1200	http://www.lezhin.com/ko/comic/secret_island
180	아나밸과 대한민국	아나밸	\N	일상	개그	\N	때로는 한국인보다 한국을 더 잘 바라볼 수 있는 사람이 있다. K-POP, 아이돌과 같은 ‘문화’ 이전에 좀더 민낯스러운 한국은 어떤 모습일지…? 한국을 사랑하는 프랑스인 아나밸, 그녀의 눈으로 들여다본 한국 이야기!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/5777262465253376/images/wide?width=1200	http://www.lezhin.com/ko/comic/annabelle
181	OK툰	김옥현	\N	일상	개그	\N	아메리카노는 나왔습니다, 프라푸치노는 나오셨습니다!!? SNS와 각종 커뮤니티를 웃기고 울린 자칭 '개드립 만화' OK툰, 드디어 레진코믹스에 안착! 활력충전 병맛 만화의 완전체를 만나자!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/4791026780209152/images/wide?width=1200	http://www.lezhin.com/ko/comic/oktoon
182	피치러브	푸죠킹	\N	BL	학원	\N	매梅 고등학교의 일인자 피치, 목각인형 만들기가 취미인 순수소년 러브에게 한눈에 반해버리다! 그러나... 피치 자신은 피와 살이 튀기는 약육강식 세계의 정점에 있는 몸. 이대로는 러브를 지켜낼 수 없단 판단 아래, 그를 일인자로 추대하는 무모한 계획을 세우는데...! 소년만화를 방불케하는 액션과 열혈, 엉뚱함이 난무하는 각양각색 소년들의 사랑 이야기, 시작합니다!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/6377018608844800/images/wide?width=1200	http://www.lezhin.com/ko/comic/peach_love
183	내가 사랑하는 초등학생	화로	\N	개그	로맨스	\N	꿈에서 그리던 선생님이 된 심청아. 하지만 기쁜 것도 잠시! 남친에게 차이질 않나, 버스에서 변태를 만나질 않나... 이런저런 심란한 일들로 괴롭기만 한데. 현실도피용으로 찾은 게임에서 만난 고수님이 우리반 학생?! 시도 때도 없이 두근대는 이 마음, 사랑일까요?	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/4847496217493504/images/wide?width=1200	http://www.lezhin.com/ko/comic/iloveschoolboy
184	건널목에서 만나요	씽씽	\N	BL	\N	\N	건널목에서 체포하려던 바바리맨이 초등학교 양호 선생님?! 부끄러운 우연을 계기로 가까워진 두 사람의 달콤한 밀당이 시작된다!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/488/images/wide?width=1200	http://www.lezhin.com/ko/comic/crosswalk
185	찬란한 우리들	SHIM	\N	BL	로맨스	\N	2년 차 모델 찬율은 아름다운 얼굴로 주위에 사람이 끊이지 않는다. 사람이 아쉬울 것 없는 찬율의 앞에 나타난 신입 모델 우재. 왠지 모르게 찬율은 자꾸 그에게 눈길이 가는데... 무채색이던 일상은 너로 인해 찬란하게 물들어 갔다. 돌고 돌아 그의 앞에 나타난 우재와 하염없이 그를 기다린 찬율의 러브 스토리.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/5385365103312896/images/wide?width=1200	http://www.lezhin.com/ko/comic/chanu
186	드래곤시터	지카	\N	드라마	판타지	\N	인간 세상에 마지막 남은 드래곤을 돌보기 위해 시터로 파견된 소녀와 알콜중독 히키코모리 츤데레 드래곤의 티격태격 동거 이야기.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/5847765999943680/images/wide?width=1200	http://www.lezhin.com/ko/comic/dragonsitter
187	모리타트	이선의	서경	BL	미스터리	\N	나는 모든 기억을 상실한 채 병원에서 눈을 떴다. 내 앞엔 어떤 남자가 서 있고, 이 남자는 자신을 나의 연인이라 소개한다. 하지만 내게 남아있는 기억은 텅 빈 설원에서 그에게 죽임을 당하는 것뿐이다. 모든 것을 알고 있는 듯한 표정의 이 남자는 대체 누구이며, 나는 누구일까? 흩어진 기억들을 통해 맞춰나가는 충격적인 진실. 럭셔리 BL 스릴러, 모리타트.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/4827806414929920/images/wide?width=1200	http://www.lezhin.com/ko/comic/moritat
188	메꽃 ~오후 3시의 연인들~	김정현	\N	로맨스	드라마	\N	레진코믹스와 김정현 작가가 2014년 일본 여름을 강타한 후지TV의 드라마 [메꽃]을 만화화했다! 남편만을 바라보는 평범한 가정주부 사와와 불륜이 가정을 지킬 수 있다는 리카코. 절대 공통점이 없을 것만 같은 두사람도 오후 3시의 적적함만은 다르지 않았다. 죄의식을 꿰뚫고 은밀하게 피어난 그녀들의 불륜. 용서할 수 있는 죄와 용서할 수 없는 죄, 당신은 어떻습니까.Based on Hirugao ～Love Affairs in the Afternoon～ produced by Fuji Television Network., Inc. (Scripted by Yumiko Inoue)	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/6395077662867456/images/wide?width=1200	http://www.lezhin.com/ko/comic/hirugao
189	나와 그녀와 그녀와 그녀의 건전하지 못한 관계	최지인	서영일	학원	\N	\N	공부밖에 모르는 쑥맥 안경현. 그의 앞에 자신의 여자 친구라고 주장하는 세명의 여자가 나타났다! 안경현을 차지하기 위해 한치도 물러설 생각이 없는 세 여자친구의 전쟁이 지금 시작된다!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/392/images/wide?width=1200	http://www.lezhin.com/ko/comic/threegirlfriends
190	이상한 날	노키드	\N	로맨스	판타지	\N	헤어진 그녀의 페북 사진 속에서 빌려준 그 책을 발견하고는 그녀를 찾아 아일랜드행 비행기에 올랐다. 그리고, 놀라운 하루가 시작되었다. [8군 플레이 그라운드 쑈] [감기]의 노키드 작가가 오랜만에 선보이는 환상적이고도 로맨틱한 단편 모음집!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/6097005586153472/images/wide?width=1200	http://www.lezhin.com/ko/comic/whataday
191	기프티드	카노우 아키라(叶輝)	\N	판타지	액션	\N	유전자가 변이한 인류 뮤턴트와 노멀이 존재하는 사회속에서 평온하고 안전한 생활을 원했던 쿄코. 하지만, 어느 날 가장친한 친구를 눈앞에서 잃고 복수의 길에 몸을 던진다... 운명의 장난속에 결코 평온할 수 없는 인생이 교차해가는 군상 판타지.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/5565383731314688/images/wide?width=1200	http://www.lezhin.com/ko/comic/gifted_k
192	이해불능	뿡	\N	BL	학원	\N	인기많고 훤칠하고 잘생긴 부학생회장 유리가 외모 콤플렉스 소유자 재림이를 ? 정말 이해불능!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/78/images/wide?width=1200	http://www.lezhin.com/ko/comic/never_understand
193	여자 제갈량	김달	\N	시대극	\N	\N	조조의 위, 손권의 오, 그리고 유비의 촉. 과거 삼등분 되어 있던 중국 대륙의 한복판에서 여러 책사들이 자신의 책략을 뽐내며 화려하게 꽃을 피웠다. 그리고 그 중에서 가장 밝게 빛나던 제갈량을 여성으로 재해석한다! 본격 성별반전 대하드라마 !	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/313/images/wide?width=1200	http://www.lezhin.com/ko/comic/girlgongmyung
194	씹어 삼키다	가위	\N	BL	학원	\N	18살의 봄날. 누구에게도 관심갖지 말고, 조용히. 입 닥치고 공부나 하면서 지내자고 마음먹은 태화 앞에 민재가 나타난다. 눈에 띄는 민재의 행동과 질 나쁜 소문에 신경쓰이면서도 태화는 민재에게서 관심을 거둘 수가 없다.  둘만의 시간, 그리고 서로만 아는 이야기가 쌓이며, 민재와 태화사이에는 점점 애틋한 감정이 싹트기 시작한다.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/28/images/wide?width=1200	http://www.lezhin.com/ko/comic/swallow
195	소시아스	강민석	\N	미스터리	\N	\N	세간을 떠들석하게 하고 있는 연쇄살인범의 얼굴이 나랑 똑같다! 졸지에 언론과 경찰에 쫓기는 신세가 된 주인공은 자신의 무죄를 입증하기 위해 고군분투 하는데...!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/256/images/wide?width=1200	http://www.lezhin.com/ko/comic/soscias
196	어느 날 잠에서 깨어보니 베이글녀가 되어 있었다	탱크가이	\N	개그	판타지	\N	자고 일어나 보니 하루아침에 베이글녀가 되어 있는 26세 독신남 정봉기. 평범한 알바 인생 A를 살아왔던 그(그녀?)의 인생은 밑바닥 부터 송두리채 뒤엎힌다. 우선, 입을 수 있는 옷(속옷 포함)이 없단 말입니다! 알바는, 예비군은? 랭킹전은 여자라도 뭐 별 문제 없긴 하지만!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/151/images/wide?width=1200	http://www.lezhin.com/ko/comic/bagel
197	유럽에서 100일	김지효	\N	로맨스	\N	\N	꿈에 그리던 유럽 배낭여행을 떠나는 선우지오. 모든것이 만족스러운 여행길에 불쾌한 동행이 붙어버렸다. 사사건건 부딪치는 앙숙 박하로의 행동 하나하나가 마음에 들지 않지만 어쩔 수 없이 함께 다니며 그의 속내를 엿보게 된다. 세계적인 재벌 2세 박하로는 실연의 충격으로 충동적인 여행을 떠난다. 프라하로 가는 밤 기차에서 우연히 합석하게된 작은 여자아이가 유난히 신경쓰인다. 자신의 가치관에 꼬박꼬박 반박하는 선우지오에게 자신도 모르게 끌리게 되면서 100일간의 여행을 함께 하게 되는데.. 아름다운 수채화풍의 그림으로 감상하는 유럽의 멋진 풍경과 두근거리는 로맨스가 만난 김지효님의 데뷔작.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/1/images/wide?width=1200	http://www.lezhin.com/ko/comic/100days_in_europe
198	쉼 없이 시간을 거슬러, 너에게	류가명	\N	로맨스	판타지	\N	큰 도시의 학교로 진학한 라떼. 그 도시에서 유일한 가족인 아빠의 비밀을 하나씩 알게된다.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/166/images/wide?width=1200	http://www.lezhin.com/ko/comic/for_you
199	340일간의 유예	미치	\N	로맨스	판타지	\N	다종 국제사회에서 태어날때 부터 운명의 상대를 타고나는 인류 셧은 뛰어난 외모와 성격으로 만인에게 사랑 받는다. 린은 운명의 상대인 도성을 만나 사랑에 빠지게 되지만 도성은 쉽게 마음을 열지 않는데.…아주 조금 특별한 로맨스.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/282/images/wide?width=1200	http://www.lezhin.com/ko/comic/340delay
200	히어로 왈츠	펭귄쥬스	\N	액션	판타지	\N	비밀리에 추진한 히어로 육성계획. 국가를 위한 무기로 사용되는 히어로가 되고 싶지 않은 소년과 소녀의 이야기.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/158/images/wide?width=1200	http://www.lezhin.com/ko/comic/hero_waltz
201	백도사	늴릴	이끼	판타지	액션	\N	인간과 수인이 공존하는 시대. 인간의 왕은 잔인한 성정으로 수인들을 핍박한다. 폭군에게 시달리는 수인들을 구하기 위한 모험.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/208/images/wide?width=1200	http://www.lezhin.com/ko/comic/thewizard
202	권태	인혜린	\N	BL	\N	\N	지독한 심장 통증은 멀어진 연인과의 관계 때문일까? 아니면... 이루어지지 않을 사랑처럼 따라붙는 집착과 인연.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/120/images/wide?width=1200	http://www.lezhin.com/ko/comic/kwontae
203	먹는 존재	들개이빨	\N	음식	개그	\N	본격 까칠한 식도락 만화. 나는 먹는다. 고로 존재한다!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/119/images/wide?width=1200	http://www.lezhin.com/ko/comic/ee
204	D.P 개의 날	김보통	\N	드라마	\N	\N	데뷔 첫해 2014 오늘의 우리만화상을 수상한 의 김보통 작가의 신작! 대한민국 국군 900명당 1명 꼴로 매달 60명이 탈영병이 발생한다. 많다면 많고 적다면 적은 그들을 잡으러 간다. 나는 D.P다.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/381/images/wide?width=1200	http://www.lezhin.com/ko/comic/dp
205	절망 VS 소녀	마사토끼	도현	미스터리	액션	\N	네 명의 악한에게 외딴 별장으로 납치 감금된 한 명의 소녀. 은행 강도들은 강도질 도중에 우연히 끌고 오게 된 인질을 소중히 다룰 생각은 없었다. 세계 최고의 절망 앞에서 그녀가 할 수 있는 일이란.... 마사토끼/도현 콤비가 보내드리는 매치스틱 트웬티에 이은 두 번째 세계제일 시리즈.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/34/images/wide?width=1200	http://www.lezhin.com/ko/comic/girl_vs_dispair
206	30일의 당신에게	영모	김원이	BL	\N	\N	에스로이드 스토어 [스위트 파라다이스]의 CEO이자 프로그래머인 이로, 그리고 단순고객에 불과했던 완벽남 르네와의 우연을 가장한 계획적 만남. 이로의 거짓말과 르네의 오해로 만들어낸 30일 동안의 아슬아슬 동거 생활.  [이런, 용기]의 영모 작가, 그리고 신인 스토리 작가 김원이가 만든 회심의 BL 러브코미디가 문을 엽니다.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/482/images/wide?width=1200	http://www.lezhin.com/ko/comic/30days
207	매치스틱 트웬티	마사토끼	도현	미스터리	\N	\N	세계 제일의 테러리스트에 점거당한 빌딩. 죽음을 앞 둔 인질들 앞에 세계 제일의 이야기꾼이 나타난다. 삶과 죽음의 경계 위에서 들려주는 세계 최고로 재미있는 이야기란 무엇인가? 마사토끼, 도현 콤비의 이름을 세상에 알린 세계제일 시리즈 제 1탄.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/64/images/wide?width=1200	http://www.lezhin.com/ko/comic/matchstick20
208	그레이	울리	\N	SF	액션	\N	회색 연막과 함께 나타난 영웅. 내 이름은 그레이. 하지만 난 오늘 악당을 죽였다. 내가 어떻게 영웅이 되었는지 가르쳐 줄까? 연막 속 진실이 궁금하지 않아? 2013 대학 만화 최강자전 본선 진출작.  	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/159/images/wide?width=1200	http://www.lezhin.com/ko/comic/gray
209	포갓 레인저	한돌	\N	액션	판타지	\N	현실을 훌쩍 뛰어넘는 이야기가 펼쳐진다. 새로운 액션 히어로의 탄생!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/225/images/wide?width=1200	http://www.lezhin.com/ko/comic/4god_ranger
210	롤플레잉겜만화	개차반	\N	판타지	개그	\N	현 동시접속률 1위의 버추얼 MMORPG 에스페라. 전설과도 같았던 한 유저의 잠수로 인해 게임의 업데이트는 멈춰 버리고... 그로부터 2년 후 느닷없이 복귀한 전설! 과연 에스페라의 운명은...?!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/390/images/wide?width=1200	http://www.lezhin.com/ko/comic/rpg_comics
211	너로 인해	류가명	\N	BL	드라마	\N	첫사랑에게 제대로 된 고백 하나 못한 채 중년이 되어버린 세웅. 메마른 삶을 살던 그에게 눈부신 젊음 그 자체인 유일이 다가온다. 하지만 그는 친구의 아들이고, 그 친구는 세웅의 첫사랑이었는데... [쉼 없이 시간을 거슬러, 너에게] 의 류가명 작가의 감성 멜로 BL! 	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/6183831096262656/images/wide?width=1200	http://www.lezhin.com/ko/comic/because_of_you
212	해피 버스데이	썸머	\N	BL	드라마	\N	맞는 것도, 알아서 기는 것도, 쓰레기 같은 별명으로 불리는 것도 익숙했던 나. 그런 나와는 완벽하게 달랐던 한없이 반짝거리던 너. 산호야 나는... 왜 그때 네가 눈을 감았는지 묻고 싶어. 너를 다시 한 번 만날 수 있다면- 섬세한 감정선과 힘 있는 문장이 압권인 [소라의 눈]의 썸머 작가의 대표작.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/5108939648139264/images/wide?width=1200	http://www.lezhin.com/ko/comic/happy_birthday
213	2인실	마사토끼	신군	미스터리	\N	\N	어느날 나는 갑자기 지하에 갇혀 버렸다.' 밀실에서 벌어지는 팽팽한 두뇌싸움! 마사토끼X신군의 역대급 스릴러.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/207/images/wide?width=1200	http://www.lezhin.com/ko/comic/double_room
214	유쾌한 왕따	김숭늉	\N	학원	미스터리	\N	오늘은 동현이의 열다섯번째 생일이고, 동현이는 왕따다. 전학생 수현이를 만나면서 그의 무엇인가가 흔들리기 시작한다. 온퍼레이드 김숭늉 작가의 또 하나의 문제작.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/245/images/wide?width=1200	http://www.lezhin.com/ko/comic/happy_boy
215	보글보글챱챱	첨지	\N	음식	개그	\N	예쁜 옷 보다, 비싼 구두보다 먹는 게 좋은 5명의 여대생들이 함께 사는 작은 자취집. 그녀들이 씹고 뜯고 맛보는 음식이야기.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/273/images/wide?width=1200	http://www.lezhin.com/ko/comic/bogle
216	흔해빠진 세계관 만화	폴빠	\N	판타지	\N	\N	빛, 어둠, 생명, 죽음의 4대신이 존재하는 세상, 인류의 힘으로는 닿을 수 없는 신화의 벽이 존재하고 있다. 인생 마지막 저서로 미약하나마 세계의 형태를 최대한 자세하게 기록하려던 인간 노학자 그레고리 엘름, 그리고 그를 통해 최초로 인간 세계를 접하게 된 엘프 지니에. 유한한 인간의 삶으로 인한 이별이 찾아왔을 때, 세계를 뒤덮는 급격한 운명의 파도가 두 사람을 휩쓴다. 마법과 신과 여러 종족이 존재하는, 어디에서나 볼 수 있는 흔한 세계관의 이야기.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/27/images/wide?width=1200	http://www.lezhin.com/ko/comic/commonworld
217	살신성인	허세녀	\N	호러	미스터리	\N	의문의 죽음 그리고 부활 하지만 몸은 죽은 채 그대로인 좀비가 되어버린 남주, 그리고 24시간 감시받는 남주의 가족. 수상한 좀비들과 엮이며 혼란스러워하는 그들의 일상.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/285/images/wide?width=1200	http://www.lezhin.com/ko/comic/sacrifice
218	외모윤리	이아영	\N	로맨스	학원	\N	세상은 결국 외모가 전부일까? 외모 때문에 오해받는 소년소녀들의 이야기.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/90/images/wide?width=1200	http://www.lezhin.com/ko/comic/vis_ethics
219	커서	김작가	병장	미스터리	액션	\N	즐거운일 하나 없는 일상. 태식은 피씨방에서 온라인 게임에 빠져 며칠을 보낸다. 앞길이 막막해진 그의 눈앞에 나타난 '커서'. 커서가 시키는대로 움직이면 세상이 나를 중심으로 돌아간다? 태식은 커서가 자신을 완벽한 이상으로 이끌어 줄것이라 믿고 커서의 명령에 따라 세상을 뒤집어 놓기 시작하는데...	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/42/images/wide?width=1200	http://www.lezhin.com/ko/comic/cursor
220	너의 그 말	비아이	\N	로맨스	학원	\N	누군가의 스치듯 지나가는 말이 가슴 한켠에 오래 남은 적이 있나요? 친구들과의 내기에서 진 임해경. 그는 벌칙으로 반에서 가장 못생긴 여학생에게 하루에 한번씩 칭찬을 해야하게 되는데...? 작지만 귀여운 러브스토리!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/19/images/wide?width=1200	http://www.lezhin.com/ko/comic/u_say
221	이야기군과 편집양	마사토끼	도현	미스터리	\N	\N	한 천재가 스스로의 손으로 죽음을 선택했다. 그의 죽음에 얽힌 비밀을 떠안게 된 이야기꾼은 학창 시절부터의 악우 편집양과 함께 위험하고도 비극적인 진실 찾기에 나서게 되는데...!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/257/images/wide?width=1200	http://www.lezhin.com/ko/comic/editory
222	3737	Bambi	\N	일상	고어	\N	잘린 녀석과 자른 녀석, 둘의 색다른 동거가 시작 됐다. 로 인상적인 데뷔를 선보인 밤비작가의 새로운 고어물? 징그럽다고 생각하면 오산. 그들을 보고 있자면 귀엽기 그지 없으니까. 레진코믹스에서만 볼 수 있는 독특한 큐티 개그물!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/180/images/wide?width=1200	http://www.lezhin.com/ko/comic/three_seven
412	레진코믹스 1주년 축전	레진코믹스	\N	일상	개그	\N	레진코믹스 1주년 축전 공개	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/999/images/wide?width=1200	http://www.lezhin.com/ko/comic/lezhincomics
223	메지나	골드키위새	\N	판타지	\N	\N	포악한 왕자 퀼라의 손에 멸망한 문명국가 그롬.병에 걸린 소녀 체자만이 유일한 생존자가 되어 살아남기 위한 두뇌 싸움을 펼치고 한편 어두운 왕가의 음모가 퀼라를 서서히 조여오게 되는데..	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/190/images/wide?width=1200	http://www.lezhin.com/ko/comic/medina_complete
224	오후 5시의 메이드	토우	Atad	학원	개그	\N	방과 후 집에 갔더니 미소녀 메이드가?! 평범한 고등학생 우현의 일상을 당황스럽고도 두근거리는 날들로 바꾸어 버린 그녀의 정체는...?	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/367/images/wide?width=1200	http://www.lezhin.com/ko/comic/5pm_maid
225	눈 먼 정원	나윤희	\N	로맨스	\N	\N	1차 세계 대전을 배경으로 한 명문 가문의 한 남자와 운명적으로 그를 사랑하게 되는 한 여자. 참혹한 전쟁의 기록과 애틋한 사랑의 기억이 얽히며 만들어 낸 한편의 드라마.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/216/images/wide?width=1200	http://www.lezhin.com/ko/comic/garden_of_the_blind
226	백은아란전	송정욱	송의섭	무협	\N	\N	속세에 나쁜 영향을 주지 않기 위해 스스로의 힘을 봉인하고 살아가는 숨은 무림 정파 고수들이 어느날 정체불명의 기계인간들에게 습격 당하는 사건이 발생하는데.. 평범한 소년 아란은 우연히 휘말려 500년 무공을 몸속에 전수받게 된다. 아란의 몸속의 내공을 노리는 정파, 사파, 그리고 기계인간들의 전쟁이 시작된다! 	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/110/images/wide?width=1200	http://www.lezhin.com/ko/comic/aran
227	청춘로맨스	BV	미울	로맨스	\N	\N	애틋함에 가슴이 울렁이는 사랑, 눈물을 억누를 수 없는 고민. 인생의 신록기에 바치는 청춘 이야기.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/47/images/wide?width=1200	http://www.lezhin.com/ko/comic/ccromance
228	나의 보람	피토	레진	백합	학원	\N	육상부 에이스 남수, 해외 귀국 자녀 혜연. 평범한 여고생 보람이를 둘러싸고 벌어지는 두 여학생의 깊은.... 청춘 러브 스토리.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/8/images/wide?width=1200	http://www.lezhin.com/ko/comic/mypleasure
229	잠자는 공주와 꿈꾸는 악마	마사토끼	Kirty	판타지	개그	\N	어느 날 나타나 승부를 제안하는 여학생 악마. 그 대가로 어떤 소원이든 한 가지 들어 주겠다는 달콤한 유혹... 하지만 패배했을 땐 영혼을 빼앗긴다. 잠든 여동생을 구하기 위해 발을 들이게 되는 꿈꾸는 악마와의 위험한 승부!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/486/images/wide?width=1200	http://www.lezhin.com/ko/comic/play_with_devil
230	노멀 모드	김선우	\N	개그	\N	\N	얼핏보면 평범해 보이는 일상세계. 하지만 남자가 25살이 될 때까지 동정이면 마법사가 된다는 전설이 있다. 그러던 어느날, 전 세계의 남자들 중 “마법사”의 비중이 절반을 넘어가고... 그들은 자신들의 모든 마력을 모아 염원을 담아 세상을 뒤집어버린다. 그것은 바로 남녀의 역할과 개념이 완전히 바뀌어 버린 세상. 여자가 군대에 가고, 남자가 임신을 하는 세상. 이곳에서의 남자는 보호받는 존재이자, 여성들의 쟁탈을 벌이는 존재. 그 이상한 세상에 떨어진 모든 것을 기억하는 한 남자의 이야기다.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/97/images/wide?width=1200	http://www.lezhin.com/ko/comic/normal_mode
231	어게인2002 - 모두의 추억	문요셉	\N	스포츠	\N	\N	명장 거스 히딩크와 태극전사들. 2002년 월드컵의 4강전설을 되새기며 그날의 눈물의 드라마를 다시 한번! 	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/270/images/wide?width=1200	http://www.lezhin.com/ko/comic/again2002
232	빌더	문하늘	이동준	SF	판타지	\N	가까운 미래, 원하는 꿈을 꿀 수 있게 된 세상. 그리고 그 속에서 신이 되고자 하는 이들을 우리는 '빌더'라 부른다. 과연 그녀는 왜 빌더가 되고 싶어 하는가?!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/365/images/wide?width=1200	http://www.lezhin.com/ko/comic/builder
233	이만오천원 이야기	삼중수소	\N	로맨스	개그	\N	가정사로 오천원네 집에 머물게된 이만원. 어린시절부터 앙숙이었던 두 사람이 한 집에 살면서 겪는 좌충우돌 로맨틱 코미디.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/223/images/wide?width=1200	http://www.lezhin.com/ko/comic/252
234	거짓말 같은 이야기	옛사람	\N	BL	\N	\N	평범하지만 평범하지 않은 사람과 사람의 사랑이야기. 단편 모음.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/109/images/wide?width=1200	http://www.lezhin.com/ko/comic/omoh
235	인스턴트 글라스	가재	\N	백합	호러	\N	11번가의 기묘한 이야기 가재 작가의 사춘기 소녀의 감성으로 버무린 백합 호러 단편집.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/290/images/wide?width=1200	http://www.lezhin.com/ko/comic/instant_glass
236	짝과 홀	마사토끼	녹차	스포츠	학원	\N	모두가 아무런 생각 없이 하고 있는 홀짝 게임. 하지만 그 게임에 필승법이 있다면? 홀짝의 맹자들이 격돌하는 수라장에서 잡아먹을 것인가 잡아먹힐 것인가 서로의 지략이 교차하는 홀짝 배틀이 펼쳐진다!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/6525218825175040/images/wide?width=1200	http://www.lezhin.com/ko/comic/even_n_odd
237	초인	류기운	문정후	판타지	액션	\N	[용비불패] 문정후 작가가 판타지 대작으로 돌아왔다! 인간을 초월한 자들의 이야기.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/442/images/wide?width=1200	http://www.lezhin.com/ko/comic/choin
238	나는 귀신과 결혼했다	홍부용	사기곰	로맨스	판타지	\N	내 아내는 귀신?! 힘든 시절 돈 때문에 영혼결혼식을 올린 황이수. 그의 앞에 귀신 아내가 나타났다.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/164/images/wide?width=1200	http://www.lezhin.com/ko/comic/myghostwife
239	따라바람	검둥	\N	BL	드라마	\N	인터넷 방송 기타연주 BJ 한바람에겐 학원 시절, 강사였던 진상인에게 자작곡으로 고백하다가 차인 흑역사가 있다. 고등학교 친구인 임한태에게 새롭게 마음을 품게 된 바람의 귀에, 잊을 수 없는 자작곡의 멜로디가 들려오는데...!  검둥 작가의 신작!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/449/images/wide?width=1200	http://www.lezhin.com/ko/comic/ddara
240	디어 다이어리	고경빈	\N	액션	미스터리	\N	2035년, 최초의 감염자가 발견된 후 인류는 빠른 속도로 사라져가고 2041년에 감염자들과의 전쟁을 위해 15세 이상 청소년들의 의무적 군복무법을 제정한다. 소꿉친구인 소녀인 니카를 따라 입대한 평범한 16살 소년 에반, 그가 다시 만난 니카의 모습은 이미...!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/329/images/wide?width=1200	http://www.lezhin.com/ko/comic/dear_diary
241	가후전	마사토끼	배민수	시대극	\N	\N	가후! 단 한번도 실패한 계책을 내지 않았다. 제갈량보다 뛰어난 책사. 또는 한 주군을 섬기지 않는 변절자. 극과 극의 평가를 오가는 그는 인간의 마음 속 어둠을 들여다보며 욕망을 주무른다. 그의 시점에서 바라보는 또 다른 삼국지. 희대의 이야기꾼 마사토끼와 강력한 작화력을 가진 배민수 작가 작품.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/33/images/wide?width=1200	http://www.lezhin.com/ko/comic/gahu
242	이런, 용기	하양지	영모	로맨스	개그	\N	엄마의 외도와 이혼으로 여성을 믿지 못하는 이용기. 하지만 용기는 타고난 예쁜 외모로 여성들의 적극적인 구애를 받는다. 점점 더 여성에게 애정을 주지 못한 채 연애를 하지 못하는 상황이 계속되는데... 직장에서 이수연이라는 신입직원이 들어오며 용기는 전에는 느끼지 못한 감정을 수연과 공유하게 된다. 용기에게 필요한 건 바로 용기!? 달콤한 愛드립의 하양지 작가와 영모님의 합작 로맨틱 코미디!!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/240/images/wide?width=1200	http://www.lezhin.com/ko/comic/mynameisbrave
243	새벽을 얽매는 뱀	폴빠	lot	판타지	\N	\N	신이 몰락하고 새로운 시대가 시작된 지 50년, 요정들은 신앙이 몰락해 혼돈에 빠진 인간들과 함께 살게 되었다. 그리고 옛부터 서로 대립해오던 인간 왕국들의 갈등과 사건들이 맞물려 만드는 거대한 소용돌이! ‘흔해빠진 세계관 만화’ 결말로부터 50년 후, 두 모험가의 발자취를 따라가며 바뀌어버린 세상을 내딛는다!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/316/images/wide?width=1200	http://www.lezhin.com/ko/comic/dawn_snake
244	뮤지션	단추	\N	로맨스	\N	\N	무대 앞에서는 수많은 별들이 뜨고 지지만, 빛을 발할 기회조차 가지지 못하는 별들도 있다. 화려한 무대 뒤, 뮤지션을 꿈꾸는 연습생들의 엇갈린 사랑, 거부할 수 없는 유혹과 배신을 그린 청춘 로맨스.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/55/images/wide?width=1200	http://www.lezhin.com/ko/comic/musician
245	은퇴한 히어로	시루미	\N	드라마	BL	\N	시민들의 안전을 위해 활약하던 히어로 알렉산더는 불의의 사고로 병원에 입원해 있던 중 권고사직을 받게 된다. 누구보다 특별했지만 이젠 평범한 시민으로 돌아가려는 알렉산더. 하지만 가만히 있어도 흘러 넘치는 그의 매력 때문인지, 자꾸만 주위에 이상한 남녀들이 꼬이기 시작한다...!  	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/438/images/wide?width=1200	http://www.lezhin.com/ko/comic/retired_hero
246	어둠이 스러지는 꽃	므앵갱	\N	시대극	판타지	\N	죽은 자의 영혼을 거두는 저승사자, 어둠을 보는 어느 노인과 어둠을 벗삼아 자란 난길. 그리고 노인의 곁을 떠나지 않는 또 다른 어둠이 있다. 어느 날 할머니와 난길의 앞에 어둠을 베는 칼과 남자가 나타난다. 한국적인 삶과 죽음의 세계를 어둠이라는 존재로 풀어내는 퓨전 판타지 사극.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/9/images/wide?width=1200	http://www.lezhin.com/ko/comic/audum_kkot
247	딸기와 밀크티	팀 해장	\N	로맨스	\N	\N	상큼한 딸기처럼 달달한 밀크티처럼, 소꿉친구로 지낸 두 청춘의 캠퍼스 러브 라이프. 친구보다는 가깝고 연인이라기에는 아쉬운 알쏭달쏭한 거리 그 미묘한 사이의 풋풋한 로맨스.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/278/images/wide?width=1200	http://www.lezhin.com/ko/comic/strawberry_and_milktea
248	마물	전유호	\N	BL	판타지	\N	칸라일 대제국의 자랑, 대(對) 마물 전투부대. 그 중에서도 타의 추종을 불허하는 전투력을 가진 최강의 전사를 파라칸이라 칭한다. 단 세 명뿐인 그들 중 마지막 파라칸인 뷰크 아라스는 온순하고 조용한 성격의 청년으로, 화려하고 강력한 파라칸들 사이에서 그의 꺼질 듯한 수수함이 오히려 수상하게 느껴지기 시작하는데...	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/5322139791523840/images/wide?width=1200	http://www.lezhin.com/ko/comic/impure_creature
249	총사(總士)	김준형	박성우	무협	\N	\N	“전국의 뛰어난 재능을 지닌 무인들을 선발한 왕의 친위대. 사람들은 그들을 총사대(總士隊)라고 불렀다.” 총사(總士)는 한(韓)의 왕을 섬기며 한(韓)에 충성하는 자들을 의미한다. 사람들은 그런 총사들 중 최정상에 선 3인을 삼총사라 칭송하였다.  액션만화의 거장 박성우가 그리는 삼총사의 한국형 무협버전.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/267/images/wide?width=1200	http://www.lezhin.com/ko/comic/musketeer
250	구룡특급	이해민	\N	BL	\N	\N	대역배우로 일하고 있는 첸추옌은 홍콩에서 열리는 종합격투기 경기 퍼시픽의 장민 메인 이벤트를 보기 위해 여행 계획을 짜던 중 숙식을 해결해주는 대가로 애인대행을 요구하는 궉런을 알게 된다. 그의 요구를 수락하고 첸추옌은 홍콩의 거리로 떠나게 되는데. [복서들]의 이해민 작가 신작, 보는 것만으로도 눈이 즐거운 신작 BL [구룡특급] 시작합니다.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/266/images/wide?width=1200	http://www.lezhin.com/ko/comic/kowloonextraclass
251	푸른 꽃	시무라 타카코	\N	백합	학원	\N	덩치는 크지만 소극적이고 눈물이 많은 후미는 고등학교 입학식 첫등교날 소꿉친구인 아키라와 우연히 재회하게 된다. 푸른 꽃잎처럼 투명한 여고생들의 우정, 그리고...	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/1001/images/wide?width=1200	http://www.lezhin.com/ko/comic/aoihana
252	와디언 리그	SERIOUS	\N	판타지	액션	\N	25살까지 여자친구가 없으면 마법사가 된다고? 원빈의 앞에 알몸의 미소녀가 나타나 5명의 미소녀 '와디언'을 모아 마법사리그에 참전해야만 한다고 하는데.. 순수백치미 용용이, 터프한 바니걸 영숙누님, 물의 도깨비 추보미! 그리고 나머지 와디언을 모아서 와디언 리그의 우승을 노려라!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/44/images/wide?width=1200	http://www.lezhin.com/ko/comic/wiardian_league
253	진실게임	성우현	\N	미스터리	\N	\N	네이버 도전만화 속 숨은 명작 자체판단 1위! 거짓을 말할 수 없는 세상 속에서 양치기 소년과의 지니어스 게임이 시작된다!!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/446/images/wide?width=1200	http://www.lezhin.com/ko/comic/truegame
254	루시드 드림	마사토끼	Kirty	미스터리	판타지	\N	꿈속에서 항상 자각몽 상태를 유지할 수 있는 체질의 소년 이래음. 꿈속의 광경... 꿈속의 거리... 꿈속의 존재들에 대한 비밀들과 어린 시절부터 이어진 인연이 엮어내는 삶과 죽음의 드라마.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/368/images/wide?width=1200	http://www.lezhin.com/ko/comic/lucid_dream
257	오타쿠를 짝사랑하는 법	차우민	\N	학원	\N	\N	친구, 애인은커녕 친구 하나 없는 대학생 지현, 따분한 일상을 버리려고 들어간 만화 동아리에 아리따운(?) 오덕 아가씨들이 넘실넘실! 오덕의 동아리 [CLOVER]에 들어오신 걸 환영합니다!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/469/images/wide?width=1200	http://www.lezhin.com/ko/comic/otakulove
258	죽어도 숨은 쉰다	이준표	\N	판타지	\N	\N	사망한 자들이 생전의 시간으로 잠시 돌아갈 수 있는 기적을 부여 받는 ‘시판’! 이 운명의 시간을 관장하는 세 명의 재판관이 시판으로  허락한 ‘생전으로의 아름다운 여행’.  네이버 베스트 도전 연재만으로 큰 화제를 모았던 신인 이준표 작가의 감동 대작!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/373/images/wide?width=1200	http://www.lezhin.com/ko/comic/afterdeath
259	미스테리 게임	고경빈	\N	미스터리	호러	\N	불가사의한 존재들이 벌이는 인간의 감정 실험. 세상에서 가장 무서운 것은 귀신인가, 낯선 타인인가, 아니면 당신 자신인가?	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/11/images/wide?width=1200	http://www.lezhin.com/ko/comic/mystery_game
260	메지나 시즌 5	골드키위새	\N	판타지	미스터리	\N	포악한 왕자 퀼라의 손에 멸망한 문명국가 그롬.병에 걸린 소녀 체자만이 유일한 생존자가 되어 살아남기 위한 두뇌 싸움을 펼치고 한편 어두운 왕가의 음모가 퀼라를 서서히 조여오게 되는데..	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/32/images/wide?width=1200	http://www.lezhin.com/ko/comic/medina
261	내 여동생은 지상최강의 육병기!!	정열폭발	\N	개그	일상	\N	20✕✕년 서울 상공은 외계인의 전함으로 뒤덮였다! 도시는 피폐해지고 시민들에게는 희망이 없어 보였으나 그 와중에도 살아남은 자가 있었으니... 세기말 조교 전설! 꿈과 희망, 그리고 사랑을 되찾기 위한 남매의 사투가 시작된다! (믿거나 말거나)	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/5150336761724928/images/wide?width=1200	http://www.lezhin.com/ko/comic/6weapons
262	숨비소리	휘이	\N	일상	\N	\N	우울증에 걸린 엄마와 웃픈 여자 경복이의 울고 웃는 하루 하루.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/168/images/wide?width=1200	http://www.lezhin.com/ko/comic/sumbi
263	우리는 시간문제	하양지	\N	드라마	\N	\N	엄마의 연애로 자취를 결심한 배수현. 그녀에게 룸메이트를 제안한 동기 우유진. 배수현이 인터넷 소설가로 유명한 작가란 사실을 아는 우유진은 그녀의 오랜 팬이었다. 작가와 팬으로 만나 점차 서로에게 마음을 열어가는 두 사람의 무덤덤하면서도 찡한 이야기.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/274/images/wide?width=1200	http://www.lezhin.com/ko/comic/matter_of_time
264	헤이마	작업실 시보	\N	드라마	\N	\N	나름 잘나가는 동화작가 루이스 아르코, 세계적인 탑 모델 준, 그리고 그와 그녀를 닮은 아이 순이의 이야기. 루이스는 죽은 옛 애인 준의 유언으로 자신을 닮은 아이 순이와 30년만의 모국. 한국으로 돌아오게 된다. '가족'이라는 인간관계에 서툰 그는 순이에 의해 점차 변하게 되고 죽은 준과 똑같이 생긴 '의문의 그녀'를 만나게 되는데.. 	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/10/images/wide?width=1200	http://www.lezhin.com/ko/comic/heima
265	그렇게까지 말한다면 할 수 없잖아!	마사토끼	느루	미스터리	학원	\N	그 녀석을 어떻게 해버렸으면 좋겠어! 헤어진 남친을 향한 은근한 복수. 마사토끼와 느루 콤비의 코믹 단편.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/220/images/wide?width=1200	http://www.lezhin.com/ko/comic/better_than_revenge
266	깊은 곡선	김상이	비아이	로맨스	\N	\N	애증이 교차하는 두 남녀의 눈빛. 냉정함 속에 감춰진 욕망이 가슴을 뒤흔든다. 비아이 작가의 신작 로맨스.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/140/images/wide?width=1200	http://www.lezhin.com/ko/comic/curve
267	5月 하늘의 돋보기	김탁	\N	판타지	로맨스	\N	원래 죽으면 천국이든 지옥이든 가버려야 맞지만, 네가 29개의 꽝과 1개의 당첨중 당첨쪽에 걸린다면..다른 세계에서 한번의 삶을 더 살수 있을지도 모르거든.' 그렇게 나는 두번째 삶을 살게 되었다.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/212/images/wide?width=1200	http://www.lezhin.com/ko/comic/maysky
268	11번가의 기묘한 이야기	가재	\N	미스터리	개그	\N	기묘한 사건들을 쫒는 탐정 알렉산더 포우와 쿼터 왓슨. 그들의 수사가 시작됩니다.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/157/images/wide?width=1200	http://www.lezhin.com/ko/comic/eleven
269	심해의 조각들	지애	\N	로맨스	드라마	\N	환청을 앓고 있는 아역 출신 배우 반기해, 그 앞에 나타난 소녀 권무진. 변하고 싶은 소년과 변하는 것이 두려운 소녀의 만남. 깊고 푸른 바다의 조각들.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/184/images/wide?width=1200	http://www.lezhin.com/ko/comic/dbd
270	봄빙수	파노	\N	백합	학원	\N	평범한 여고에서 정체를 숨기고 지내는 마법소녀의 비밀가득한 학교생활. 물론, 완벽하게 출 수 있는 비밀이란 존재하지 않았습니다.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/25/images/wide?width=1200	http://www.lezhin.com/ko/comic/bombingsu
271	수염 & 멜빵	피포	\N	판타지	\N	\N	에릭과 윌, 두 중년 아저씨의 직업은 기록사. 다만 역사나 사건을 기록하는 것이 아니라 기이한 생물들을 찾아 기록하는 것이 다른 점이라면 다른 점이랄까? 특이한 발명품으로 신기한 생물들을 찾아다니면서 벌어지는 소소한 영국풍 어드벤처들, 함께 따라가 보시지요!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/56/images/wide?width=1200	http://www.lezhin.com/ko/comic/mustache_suspender
272	구리의 구리구리	구리	\N	개그	일상	\N	디스 이즈 리얼 라이프 넌픽션 옴니버스 개그물. 여성 형제 자매님이 없으신 분들은 마치 여성 형제 자매님이 새로 생긴듯한 가상 체험이 가능하십니다. 그리고 여성 형제 자매가 없다는 것에 구원받은 느낌을 얻게되겠지요! 만화보고 회개하십시오 형제 자매 여러분.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/14/images/wide?width=1200	http://www.lezhin.com/ko/comic/guriguri_of_guri
273	Go Bananas	센개	\N	BL	\N	\N	가벼운 퀴어 단편들. 	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/153/images/wide?width=1200	http://www.lezhin.com/ko/comic/go_bananas
291	거울아 거울아	다드래기	\N	드라마	\N	\N	게이, 트랜스젠더 등 성정체성을 숨기고 살아가는 성적소수자의 고민과 흔들리는 삶에 대한 이야기.  로 날카로운 인식을 보여준 다드래기 작가의 신작.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/211/images/wide?width=1200	http://www.lezhin.com/ko/comic/mirror_mirror
274	가깝다고 생각하면 가까운	검둥	\N	로맨스	\N	\N	마주하기 어려운 기억을 피해 PC방 아르바이트를 자신의 있을 곳으로 삼은 고등학생 소녀 시영. 하지만 비교적 깊숙한 곳으로 잘 피했다고 생각한 그곳도 사실 한 층만 올라가면 바로 세상과 연결되어 있는 곳. 사람들과 시간은 계속 시영의 옆을 따라 흘러간다. 잔잔하지만 굴곡이 있는 만남에 대한 이야기.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/52/images/wide?width=1200	http://www.lezhin.com/ko/comic/close2
275	마이영호팬	아름	\N	로맨스	\N	\N	유명 남성 그룹의 아이돌과 그의 첫사랑이자 소꿉친구였던 평범한 소녀가 재회했을 때. 만약 다시 한 번 진심을 확인할 수 있다면...	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/15/images/wide?width=1200	http://www.lezhin.com/ko/comic/my0fan
276	나 안 취했어	영춘	\N	일상	개그	\N	울적해서 한 잔 걸치고, 기분 좋아 두 잔 들이킨 그날. 다음 날 아침에서야 기억나는 우리의 아찔한 흑역사가 여기에 있습니다!  영춘 작가가 그리는 짤막 주사 공감 만화!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/472/images/wide?width=1200	http://www.lezhin.com/ko/comic/im_not_drunk
277	나 안 취했어	영춘	\N	일상	개그	\N	울적해서 한 잔 걸치고, 기분 좋아 두 잔 들이킨 그날. 다음 날 아침에서야 기억나는 우리의 아찔한 흑역사가 여기에 있습니다!  영춘 작가가 그리는 짤막 주사 공감 만화!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/472/images/wide?width=1200	http://www.lezhin.com/ko/comic/im_not_drunk
278	멈춰진 시간 속에서	인디고	\N	BL	SF	\N	옛 시골집으로 이사온 연호는 숨겨진 다락방을 발견하고 그곳에 있던 낡은 전화기는 죽은 친구 재하와 같은 이름의 고등학생의 목소리를 들려 주었다...초능력 소년 소녀들의 하이틴 코믹 의 인디고 작가가 판타지 소프트BL로 돌아왔다!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/231/images/wide?width=1200	http://www.lezhin.com/ko/comic/backintime_to_you
279	두근워치	개호주	홍차	개그	학원	\N	사랑의 두근거림 수치를 측정하는 시계인 '두근워치'. 두근워치 수치 1만을 달성하면 상금 100억을 받을 수 있다! 누군가는 돈 때문에, 누군가는 사랑을 위해, 또 누군가는 재미를 위해 두근워치 1만에 도전하는데… 의 개호주 작가와 포텐신인 홍차 작가의 신작 !!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/394/images/wide?width=1200	http://www.lezhin.com/ko/comic/pitapatwatch
280	우리는 우연히 그리고	한민기	\N	로맨스	\N	\N	나에게도 당신에게도 있었을지 모르는 20대 초의 사랑이야기. 다른 사람의 손을 잡아주는 것이 그 때는 내가 노력하기만 하면 가능한 일이라고 생각했었지요.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/3/images/wide?width=1200	http://www.lezhin.com/ko/comic/bychance_we_and
281	파동	최해웅	박성우	판타지	액션	\N	영혼을 두드리는 미세한 울림이 상상 그 이상의 파동을 몰고온다. 나우, 천랑열전 박성우작가 8년만의 국내  컴백작 레진코믹스 선독점 연재!!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/221/images/wide?width=1200	http://www.lezhin.com/ko/comic/the_wave
282	사랑하는 나날	고아라	\N	로맨스	\N	\N	학창시절 잠시 사귀었다 헤어진 후 우연히 마주치게 된 승현과 김미... 평범한 두 사람의 일상 속에 어색하고 미묘한 감정이 흐르기 시작한다. 촉촉한 수채화의 느낌과 고운 문장들이 마음에 남는 고아라 작가의 감성웹툰.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/403/images/wide?width=1200	http://www.lezhin.com/ko/comic/lovedays
283	고기인간	모래인간	하얀돌	SF	\N	\N	화산폭발로 모든 문명이 쇠퇴하는 미래 인류의 황혼기. 가장 뛰어난 유전자를 가진 한 쌍의 남녀를 선발하여 인류의 DNA를 미래에 남기기로 하는데.. 사라지는 문명에 대한 쓸쓸한 풍경. ,  모래인간 작가의 최신작.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/187/images/wide?width=1200	http://www.lezhin.com/ko/comic/gogi
284	메린; 인어이야기	에니카	\N	판타지	로맨스	\N	왕자를 사랑하게 된 인어, 메린. 이룰 수 없는 사랑을 꿈꾸는 인어의 슬픈 사랑 이야기.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/311/images/wide?width=1200	http://www.lezhin.com/ko/comic/mermaid
285	신 구리의 구리구리	구리	\N	개그	일상	\N	상상 이상의 재미와 웃음. 도무지 알 수 없는 웃음 포인트에서 빵빵터지는 개그로 만인을 웃긴 구리가 돌아왔다. 형제자매친구동료 모두 함께 즐길 수 있는 21세기 개그만화.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/286/images/wide?width=1200	http://www.lezhin.com/ko/comic/new_guriguri_of_guri
286	나를 사랑해 줘	한결	\N	판타지	로맨스	\N	사랑하는 사람을 잃고 자살을 결심한 지우의 앞에 신이 나타났다. 비록 신이지만 인간 처럼 사랑을 해보고 싶다는 이상한 말을 하는 이 남자...! 급기야는 지우에게 이틀 동안만 자신을 사랑해달라는 명령 아닌 명령을 내리는데...  한결 작가의 순정 가득 러브스토리. 	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/387/images/wide?width=1200	http://www.lezhin.com/ko/comic/loveme
287	이너프 (enough)	언발란스	\N	로맨스	\N	\N	오빠의 약혼녀와의 동거. 다희는 오빠의 강제적인 부탁으로 오빠의 약혼녀인 선미와 함께 살게 된다. 생판 남과 함께 산다는게 여간 불편한것이 아닌 다희지만 점점 선미와 마음을 열기 시작하고..	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/134/images/wide?width=1200	http://www.lezhin.com/ko/comic/enough
288	블로섬 데이즈	태양	\N	로맨스	학원	\N	기간제 신임 문학 교사 지원, 옆집에 오래 산 이웃사촌 고등학생 산하. 학생에게는 생활이지만 교사에게는 직장인 학교. 이전과 달라질 것이 없을 것이라 생각했지만 이전과 같지 않은.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/12/images/wide?width=1200	http://www.lezhin.com/ko/comic/blossom_days
289	흡혈마법소녀 G쨩	로맨스 스토리	\N	판타지	개그	\N	나와 계약해서 마법소녀가 되어줘! 인류를 멸망시킬뻔한 흡혈귀가 마법소녀가 되었다. 인류의 대위기가 찾아올 것인가?! 섹시한 마법소녀 G쨩의 모험이 시작된다.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/291/images/wide?width=1200	http://www.lezhin.com/ko/comic/magical_g
290	줄리엣과 줄리엣	이삭	\N	백합	\N	\N	여고생의 여린 감성과 느낌을 그려낸 가슴시린 감성 백합 단편 모음집.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/279/images/wide?width=1200	http://www.lezhin.com/ko/comic/juliet
292	유아so러블리	에니카	\N	로맨스	학원	\N	주변에 관심없는 무뚝뚝한 여고생 소유아. 우등생이지만 숨어서 담배피는 한서온. 날나리 같지만 유아를 끔찍히도 좋아하는 유아의 친구 신나림. 이들의 사랑과 성장의 이야기.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/71/images/wide?width=1200	http://www.lezhin.com/ko/comic/ua_so_lovely
293	트리거	캡쿠	\N	SF	액션	\N	초능력 바이러스가 창궐한 시대. 그러나 정작 그 초능력을 가진 감염자들이 대우받지 못하는 사회에서 흔치 않은 비감염자로 승승장구하던 주인공이 감염자들에게 붙잡혀 파란만장한 삶을 보내게 되는 이야기.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/244/images/wide?width=1200	http://www.lezhin.com/ko/comic/trigger
294	썸머 레터	미울	아름	학원	로맨스	\N	 야, 김태범. 너 내 남자친구 해! 무더운 어느 여름 날 이름도 모르는 여자아이에게서 당돌한 고백을 받아버렸습니다. 왜 하필, 나일까요?	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/364/images/wide?width=1200	http://www.lezhin.com/ko/comic/summer_letter
295	이매망량	조규원	오기원	액션	판타지	\N	세상 모든 요괴를 뜻하는 단어, 이매망량. 정조를 수호했던 이매망량 '서방'이 300년 만에 깨어난 재앙을 막으려 한다.  그러기 위해서는 신묘한 힘을 가진 여인 '한유정'을 지켜야만 하는데...  도깨비, 매구, 장산범, 두억시니 등 현세에 적응한 이매망량들의 피비린내 나는 싸움이 시작된다.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/5089947046903808/images/wide?width=1200	http://www.lezhin.com/ko/comic/monsternight
296	마찌롱 MAZZIRONG	미미	\N	판타지	\N	\N	볼품없는 능력 때문에 곧잘 놀림 당하는 열등생 마찌롱! 졸업과제를 받는 날 사고로 마음에 구멍이 뚫린 것도 억울한데, 우등생 개골개골과 함께 달아난 마음 조각을 찾아오라는 미션을 졸업과제로 받게 된다! '헬로좀비' 미미 작가의 독특한 상상력이 돋보이는 판타지 동화!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/479/images/wide?width=1200	http://www.lezhin.com/ko/comic/mazzirong
297	그놈학 개론	이지피	\N	학원	\N	\N	허세며 반항이며 그야말로 고2병의 표본 이비루와 돈 있고 집 있지만 철이 없는 꿈만소설가 이혁의 동거생활. 우정과 증오로 비벼진 그들의 시끌벅적한 일상이 시작됩니다!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/467/images/wide?width=1200	http://www.lezhin.com/ko/comic/introduction_him
298	애완소녀들의 동향분석과 대응방안	고용찬	류수진	판타지	개그	\N	덕후임을 숨기고 모범생처럼 살아온 유현오. 친구로부터 게임 애완소녀를 입수해 실행한 순간 게임 속들로 들어와버렸다. 여동생처럼 귀여운 토끼귀 소녀 라애, 강아지귀를 가진 여자친구 도희, 비밀을 감춘 고양이귀 소녀 체린. 게임 속 인물들과의 미션을 수행하면 게임을 빠져나갈 수 있다는 정보를 접하고 게임 캐릭터들을 하나 씩 클리어하기 시작한다.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/304/images/wide?width=1200	http://www.lezhin.com/ko/comic/pet_girl
299	놈들이 온다	고영훈	김동호	SF	액션	\N	지구에 외계 생물이 침략했다! 놈들은 원하는 혈액형을 찾기 위해 서서히 인간들을 잠식해가기 시작한다. 이에 맞서는 무술감독 역기철과 격투기 챔피언 강찬!!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/4874933300101120/images/wide?width=1200	http://www.lezhin.com/ko/comic/madongsuk
300	안녕 도쿄	완두	\N	일상	\N	\N	안녕! 그리고 안녕? 한국인 만화가 완두의 일본 생활기. 어쩌면 당신이 모를 도쿄를 들려드릴게요. 일본에 살러가실, 살다 오신 분들은 꼭 봐야 할 만화!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/116/images/wide?width=1200	http://www.lezhin.com/ko/comic/hello_tokyo
301	NATURALS	인디고	\N	SF	액션	\N	초능력 소년 소녀들의 모임 '내츄럴스' 그 시작과 풋풋한 청춘에 대한 이야기. 	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/67/images/wide?width=1200	http://www.lezhin.com/ko/comic/naturals
302	메피스토	박산하	\N	액션	학원	\N	사고와 함께 소식이 끊어진 여동생 희성의 행방을 찾아 전학온 희곤은 학교의 무시무시한 비밀에 맞서게 되는데..의 뒤를 잇는 박산하의 본격 학원 액션 스릴러!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/253/images/wide?width=1200	http://www.lezhin.com/ko/comic/mephisto
303	그때 일	빗금	\N	학원	로맨스	\N	구부정한 등, 두꺼운 가디건, 지저분한 머리. 보기만 해도 답답한 그 여자애가 왠지 계속 눈에 밟힌다. 루*웹과 카연갤이 주목한 바로 그 작품. 한 편의 애니메이션을 보는 듯한 놀라운 퀄업! 한 남중생의 서투른 자기 고백 [그때 일], 시작합니다.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/5726760070545408/images/wide?width=1200	http://www.lezhin.com/ko/comic/at_the_time
304	PPT(파워풀 팬티 트라우마)	터럭	\N	개그	학원	\N	입학 D-1. 꿈에 그리던 인서울에 가벼운 발걸음으로 자취방을 향하는 새내기 이대팔. 설레는 마음으로 도착한 빌라 앞에서 하의 실종 변태를 마주치는데..! 팬티 패셔니스트 춘식과 별이 다섯 개 소심왕 대팔의 좌충우돌 동거가 시작됩니다!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/6358167993188352/images/wide?width=1200	http://www.lezhin.com/ko/comic/ppt
305	귀야곡	옛사람	\N	미스터리	호러	\N	세상에 존재하지 않지만 어딘가에 존재할 법한, 현재가 아닌 과거에 일어났을지도 모를 기묘한 이야기.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/89/images/wide?width=1200	http://www.lezhin.com/ko/comic/onbus
306	내손으로, 교토	이다	\N	일상	\N	\N	직접 쓰고, 자르고, 붙여 만든 이다의 아날로그 여행노트. 일러스트레이터 이다의 손때까지 고스란히 담아내 마치 친구의노트를 보는 친근함을 준다. [내 손으로 교토]를 넘길 때마다 여행을 떠나고 싶은 기분은 덤!!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/5365995145527296/images/wide?width=1200	http://www.lezhin.com/ko/comic/ida_kyoto
307	키스중독증	김윤이	\N	로맨스	학원	\N	여고생 수영에게는 고민이 있는데, 사귀는 남학생들에게 계속 차인다는 것. 그러던 어느날 아침 잠에서 깬 수영은 집에 들어온 낯선 남자를 보고 놀라는데 그는 다름 아닌 정혼자(?) 안소민! 졸지에 기묘한 동거를 하게 된 두사람은?!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/6435060158300160/images/wide?width=1200	http://www.lezhin.com/ko/comic/kissholic
308	블랙보이	노커	\N	판타지	\N	\N	블랙보이와 한스 그리고 카이드락. 용사와 마왕의 불안한 우정 .'어나더월드' 노커 작가의 또 다른 다크 판타지!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/235/images/wide?width=1200	http://www.lezhin.com/ko/comic/blackboy
309	별을 건너는 방법	느루	\N	로맨스	판타지	\N	별을 가진 자는 하늘을 가르고 바다를 만들 것이며 그 손길 따라 바람이 춤추고 숲이 노래할 것이다. 별을 얻기 위해 유적을 탐사하는 리오에게 어느날 다른 세계의 소녀가 나타났다. 신비로운 능력을 가진 아라에게서 별을 쫒는 실마리를 발견하는 리오는 아라를 이용해 꿈을 이루려 한다. 시즌 2 준비중!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/2/images/wide?width=1200	http://www.lezhin.com/ko/comic/cross_star
310	소악마군의 달콤한 속삭임	유키 아오하루	\N	로맨스	\N	\N	내일 모레 서른의 건어물녀 나츠키와 7살 연하의 꽃미남 아소의 비밀 동거가 시작되었다! 도무지 마음속을 알수 없는 고양이 같은 그놈의 정체는 대체?	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/5000/images/wide?width=1200	http://www.lezhin.com/ko/comic/koakuma
311	나무 한 그루	이슬기	\N	로맨스	\N	\N	늦더위가 한창인 어느 여름날. 재수생 여운은 도피하듯 내려온 시골에서 미스터리에 쌓인 남자 차현을 만나게 된다. 바깥세상과의 접촉을 극도로 피하는 그. 하지만 어딘지 말 못할 상처가 있어 보여 자꾸만 궁금하고, 누군가를 닮은 것 같아 신경이 쓰인다. 관심과 위로를 내밀며 천천히 다가가는 여운에게 차현은 과연 마음의 문을 열게 될 것인가...?!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/5238784944242688/images/wide?width=1200	http://www.lezhin.com/ko/comic/a_tree
312	44	길량	\N	드라마	\N	\N	주인공 소정은 고도비만의 여대생. 하지만 다이어트를 통해 보통 체중이되고, 다시 한번 44사이즈를 목표로 다이어트를 시작한다. 하지만 어째서인지 소꿉친구 유라에게 다이어트를 방해받는 듯한 기분이 드는데…	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/5997872116400128/images/wide?width=1200	http://www.lezhin.com/ko/comic/44
313	마루의 사실	의외의 사실	\N	일상	\N	\N	어느 날 우리 집에 개가 왔다. 무덤덤한 개 마루와 나의 작은 이야기들.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/154/images/wide?width=1200	http://www.lezhin.com/ko/comic/marusasil
314	강의실 201호	단추	\N	로맨스	학원	\N	첫눈에 반해버린 내 이상형. 평탄할 것만 같던 내 로맨스에 자꾸 걸리적거리고 신경쓰이는 녀석이 나타났다. 강의실 201호의 전설은 정말 통하는걸까?	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/219/images/wide?width=1200	http://www.lezhin.com/ko/comic/lectureroom201
315	남자가 좋아 여자가 좋아	화음조	\N	로맨스	\N	\N	알고보니 내 남친은 게이?! 아니 이게 무슨소리요~ 평범한 여대생 세아의 게이 트라우마 극복기!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/92/images/wide?width=1200	http://www.lezhin.com/ko/comic/manorwoman
316	전학생 장득칠	이동길	\N	학원	개그	\N	착하게 생겼고, 착하고 싶은 깡패 장득칠! 거칠게 생겼지만 모범생에 마음까지 착한 그의 추종자들! 안 맞는 것 같지만 알고보면 찰떡궁합, 엉뚱하고 언밸런스한 그들의 학교생활이 시작됐다!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/450/images/wide?width=1200	http://www.lezhin.com/ko/comic/jandeuk7
317	단과 하나	오리발	\N	SF	미스터리	\N	타인의 얼굴을 완벽히 복사 가능한 기술, 외모에 저작권이 붙은 세상. 희귀한 얼굴은 비싼 값에 거래된다. '단'은 잃어버린 동생을 되찾기 위해 '하나'의 계획에 동참한다.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/51/images/wide?width=1200	http://www.lezhin.com/ko/comic/dan_and_hana
318	제이에게	광진	\N	로맨스	\N	\N	 '그녀의 수족관' 광진작가 신작. 안나의 친구 제이의 또다른 사랑에 대하여, 마지막 순간 조차 빛날 수 있었던...그와 그녀의 이야기.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/276/images/wide?width=1200	http://www.lezhin.com/ko/comic/for_jay
319	사랑의 슬픔	말룽	\N	로맨스	판타지	\N	타인의 모든 것을 꿰뚫어 볼수 있는 저주 받은 눈을 가진 독심술사 레프, 그의 눈을 두려워 하는자, 이용하려 하는 자. 그리고 유일하게 그의 눈을 두려워 하지 않는 여인 알비나의 슬픈 사랑이야기.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/54/images/wide?width=1200	http://www.lezhin.com/ko/comic/liebesleid
320	최고의 악당	김수진	\N	BL	\N	\N	바보처럼 착하기만한 천사우는 늘 얍삽할 정도로 본인의  이익을 챙길 줄 아는 기도를 동경하고 그처럼 되기를 바란다.  기도는 그런 사우에게 [악당이 되는 법 3원칙] 중 두가지만  알려준 채 해외로 유학을 떠난다.   4년만에 귀국한 기도를 기다리는 것은 남은 하나의 법칙을  알려주기만을 기다리는 사우였다! 3원칙을 미끼로 사우를  손에 넣으려는 기도 vs 오로지 악당이 되는 방법에만  관심이 있는 사우, 동상이몽의 두사람은 과연?!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/658/images/wide?width=1200	http://www.lezhin.com/ko/comic/verybadguy
321	못난 오리	이슬기	\N	로맨스	판타지	\N	미운오리 새끼처럼 군식구 취급을 받는 오리와 그녀를 지켜보는 베릴. 두 사람의 성장기.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/152/images/wide?width=1200	http://www.lezhin.com/ko/comic/ugly_duckling
322	사랑의 기술	손휘현	이윤지	로맨스	\N	\N	각종 커뮤니티에 화제가 된 그 만화 애플을 쓰는 이유의 풀 버전. 작가의 차분한 연출이 돋보이는 손휘현/이윤지 작가의 데뷔작.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/237/images/wide?width=1200	http://www.lezhin.com/ko/comic/art_of_loving
323	치국이야기	괴도앙팡	판뽐	판타지	액션	\N	이곳은 사람과 도깨비가 공존하는 나라, 치국. 도깨비는 둔갑해 장난을 치길 좋아하고, 자연을 지키고 가꾸며 공존한다. 그러나, 사람이 그렇듯 도깨비 또한 상궤를 벗어난 존재로 화하는 경우가 있다. 이것은 주술의 힘을 빌어 도깨비를 관리하는 기관, 치국단의 기록이다.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/22/images/wide?width=1200	http://www.lezhin.com/ko/comic/chikuk
324	디어 (dire)	에니카	싱난다	미스터리	호러	\N	어느 날 한통의 문자가 도착했다. 30일간 계속되는 괴담들...과연 그 끝은?	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/141/images/wide?width=1200	http://www.lezhin.com/ko/comic/dire
325	안쌤의 베트남 일기	싸싼	\N	일상	\N	\N	내가 결혼할 줄은 몰랐지만, 신혼집이 베트남일 줄은 더더욱 몰랐다! 왕까불 오버쟁이 안쌤의 알면 알수록 매력적인 베트남 이야기!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/407/images/wide?width=1200	http://www.lezhin.com/ko/comic/vietnam
326	내 멋대로 고민상담	김보통	\N	일상	개그	\N	무엇이든 물어보세요. 김보통이 답합니다. 김보통의 고민상담소 오픈! 상담문의는 http://ask.fm/kimbotong	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/451/images/wide?width=1200	http://www.lezhin.com/ko/comic/botong_clinic
327	메종 드 메이드 [제2회 세계만화공모전 수상작]	몬타나	\N	백합	로맨스	\N	덤벙대는 성격의 실수 연발 신참 메이드 준. 그러나 젊은 마님은 실수를 눈감아주고, 오히려 준에게 관심을 보인다. 마님에 대한 준의 감정은 동경 이상으로 변해가는데... 빅토리아 시대가 오롯이 담긴 예쁘고 소중한 이야기!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/5405429848342528/images/wide?width=1200	http://www.lezhin.com/ko/comic/2nd_manhwaking_madema
328	망자카페	베르디	\N	미스터리	판타지	\N	영혼을 보는 소녀. 우연히 발견한 카페 레퀴엠에서 아르바이트를 시작한다. 죽은 자들만이 찾아오는 카페 레퀴엠에서 보는 죽은 자들의 사연.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/194/images/wide?width=1200	http://www.lezhin.com/ko/comic/cafe_requiem
329	달콤한 애드립	하양지	\N	일상	개그	\N	본격파 문학과 대학교 4컷만화. 젊은 베르테르의 애드립. 대학생활의 연애! 낭만! 학업! 이 모든 것이 우리에게는 있을 수 없다는 건 여러분도 잘 알고 계시리라 믿습니다....	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/13/images/wide?width=1200	http://www.lezhin.com/ko/comic/adlib_adlib
330	전이현상	이지원	이윤균	미스터리	액션	\N	계속 다른 사람의 삶을 살아가는 남자. 그가 다른 사람으로 깨어나면 깨어날수록 그 사람들의 삶은 혼란스러워지기 시작한다. 이제 그는 다른 사람들의 삶이 더 혼란스러워지기 전에 빨리 원래의 자신으로 돌아가야 한다.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/6371695017852928/images/wide?width=1200	http://www.lezhin.com/ko/comic/transference
331	레진 라이브 후기 만화	레진코믹스	\N	일상	\N	\N	2015년 3월 3일. 레진엔터테인먼트의 또 한번의 도약을 위한 행사 LEZHIN LIVE! 그 현장을 함께한 작가님들의 후기 입니다. 	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/1021/images/wide?width=1200	http://www.lezhin.com/ko/comic/lezhinlive
332	코시엔甲子園으로 GO!	샤다라빠	\N	개그	스포츠	\N	 샤다라빠의 일본고교야구 정복기! 야구를 몰라도 즐길수 있는 신감각 여행만화.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/103/images/wide?width=1200	http://www.lezhin.com/ko/comic/koushien
333	여동생은 로봇	안전모	\N	개그	학원	\N	어느날 정체불명의 택배가 도착, 그것은 여동생이었다?? 어딘가 맹하고 식탐이 어마무시한 수상한 미소녀와의 동거가 시작된다! 과연 그녀의 정체는 무엇이며 목적은 무엇이냐?!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/197/images/wide?width=1200	http://www.lezhin.com/ko/comic/sister_robot
334	꼴데툰 2015	샤다라빠	\N	스포츠	개그	\N	전격 무료 연재! 10개 구단 체제의 첫 해인 2015년, 롯데는 가을에 야구할 수 있을까?! 딥빡과 감동이 묻어 있는 샤다라빠의 롯데 만화, 개막!!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/444/images/wide?width=1200	http://www.lezhin.com/ko/comic/ggtoon2015
335	소음	시육	\N	미스터리	호러	\N	한 가족이 아파트 천장에서 정체불명의 소음을 듣게 되면서 벌어지는 공포 스릴러.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/60/images/wide?width=1200	http://www.lezhin.com/ko/comic/soeum
336	제 3 경호팀	카리보	\N	액션	\N	\N	최고의 경호팀에 예사롭지 않은 신참이 들어왔다. 생사를 넘나드는 치열한 현장에서 겪는 경호팀의 활약상.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/185/images/wide?width=1200	http://www.lezhin.com/ko/comic/3rd_security
337	볕내 [제2회 세계만화공모전 수상작]	박혜민	\N	드라마	\N	\N	겉으로 보기엔 너무나 평범한 여고, 누가 봐도 똑같아 보였을 우리의 모습. 하지만 2학년 13반 34명 우리들은 저마다의 독특한 취향을 숨 기 고 있 다 ! 일상의 틈을 파고드는 예리한 감성이 매력적인 개성 넘치는 작품.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/6343470570012672/images/wide?width=1200	http://www.lezhin.com/ko/comic/2nd_manhwaking_private
338	보랏빛 콘파냐	비아이	\N	로맨스	드라마	\N	우연히 보게 된 남친의 핸드폰 속 낯선 여자. 따져야 할까, 넘어가야 할까? 단순한 과 동기라고 주장하는 남친의 행동이 어딘지 수상하다. 게다가 며칠전부터 신발가게의 훈남 알바생이 자꾸만 신경쓰이고 마는 나. 화려한 거품 뒤에 나타나는 씁쓸함을 닮아 있는 우리의 관계, 그 향방은 과연...?!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/4609297228496896/images/wide?width=1200	http://www.lezhin.com/ko/comic/conpanna
339	시나브로 이야기	브로	\N	SF	판타지	\N	영생을 가진 화가 브로. 그의 그림과 인생은 우리가 보는 시간과 무엇이 다를까. 긴 인생을 사는 그림쟁이의 이야기.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/143/images/wide?width=1200	http://www.lezhin.com/ko/comic/sinabeuro_tales
340	환타스틱 코스메틱 포맨	김환타	\N	일상	\N	\N	잘보이고 싶은 건 남자도 마찬가지! 기초 화장법부터 헤어, 메이크업, 그리고 코디까지... '마이 페어 젠틀맨'으로 거듭날 수 있는 멋진 남자 만들기의 교전! [환타스틱 코스메틱]의 남성 버전, 전격 무료 연재!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/5913397869150208/images/wide?width=1200	http://www.lezhin.com/ko/comic/fantastic_cosmetic_men
341	쇼트 서킷	이운	\N	일상	미스터리	\N	남친과 다툰 날의 지친 퇴근길. 어릴적 날 많이 좋아했던 동창 동수를 우연히 마주쳤다. 새록새록 떠오르는 추억, 오랜만이어도 살가운 대화. 여전히 날 기억해주는 것은 고마웠지만... 이상하다. 이 남자, 나에 대해 너무 많은 것을 알고 있어.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/5137269393981440/images/wide?width=1200	http://www.lezhin.com/ko/comic/short_circuit
342	블레이드 & 소울 : 주술사의 탄생	김정현	\N	판타지	액션	\N	레진코믹스의 당찬 기획으로 탄생한 엔씨소프트의 초대형 MMORPG 블레이드 & 소울 웹툰 [주술사의 탄생]! 신예 김정현 작가가 펼친 신 직업 [주술사]에 대한 오리지널 에피소드를 감상하라!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/361/images/wide?width=1200	http://www.lezhin.com/ko/comic/bns_warlock
394	PLUS	검둥	\N	로맨스	\N	\N	열혈 복싱소녀 주영은 길을 가다 우연히 기면증에 걸린 미남 소설가 정원을 만나게 되고 그를 돕게 되고 그렇게 그들의 기묘한 관계가 시작된다.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/45/images/wide?width=1200	http://www.lezhin.com/ko/comic/close
343	판도라의 선택 [제2회 세계만화공모전 수상작]	유도리	\N	로맨스	시대극	\N	19세기 미국 북동부의 작은 마을. 타고난 미모의 소유자인 크리스와 그런 아빠를 울리는 게 유일한 취미인 판도라. 둘은 고립된 사회 속에서 영원한 대립 상태로 살아간다. 만성 우울증 아버지와 어른스럽고 씩씩한 딸의 성장 이야기.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/5154759719256064/images/wide?width=1200	http://www.lezhin.com/ko/comic/2nd_manhwaking_pandoras_choice
344	투자의 여왕	이종범	\N	드라마	\N	\N	투자와 투기는 뭐가 다를까? 돈에 대해 완전 무지한 여자, '고금리'. 가치투자의 젊은 천재 '제택구'가 펼치는 돈과 투자의 세계. 그 첫걸음을 함께해 보시죠.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/79/images/wide?width=1200	http://www.lezhin.com/ko/comic/queen_of_invest
345	꼴데툰 2013	샤다라빠	\N	스포츠	개그	\N	꼴데 까지 마라. 니들은 한 번이라도 신문지 흔들어 봤느냐. 외쳐 8888577! 하드코어 야구팬들을 위한 병신 같지만 멋있는 롯데만화.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/48/images/wide?width=1200	http://www.lezhin.com/ko/comic/ggtoon
346	본격 탱크로 만화	굽시니스트	\N	개그	판타지	\N	이 세상 모든 장르의 만화는 '탱크'로 가능하다! 로 서브컬처와 일반계 극한의 조합을 이끌어낸 굽시니스트, 이번에는 유명 게임 '월드 오브 탱크'의 세계관에 만화를 접목시킨다! 15화 동안 펼쳐질 '만화 장르 탱킹'... 과연, 괴작일까 걸작일까?!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/464/images/wide?width=1200	http://www.lezhin.com/ko/comic/tank
347	프리데이	FREEMAN	\N	학원	\N	\N	음악에 관한 상처와 진로에 대해 방황하는 아이들이 밴드라는 주제를 통해 성장해가는 드라마.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/88/images/wide?width=1200	http://www.lezhin.com/ko/comic/freethey
348	젠틀한 야수	구리	\N	개그	학원	\N	높은 대학 진학률의 명문 순정고등학교... 양순호는 꿈과 진로를 위해 친구들도 뒤로 한채 홀로 전학왔다. 그리고 전학 첫날... 이 학교엔 정상인이 없잖아! 무엇을 상상하든 들어맞지 않을 '의외꿀잼'을 보장하는, [구리의 구리구리] 구리 작가의 폭렬학원개그 신작!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/5938676851277824/images/wide?width=1200	http://www.lezhin.com/ko/comic/gentle_beast
349	머지않아 밤이 온다	온잠	\N	판타지	\N	\N	상위 3프로의 부를 가진 사람들이 만든 프로젝트 ‘귀가’. 그들은 지금의 사회를 지키기 위해 능력자들을 키운다. 비정상적인 프로젝트가 만든 소년소녀들의 SF판타지. 대학만화 최강자전의 숨은 보석 가 시작됩니다.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/265/images/wide?width=1200	http://www.lezhin.com/ko/comic/becomenight
350	솔로가 하는 연애	신매	\N	로맨스	\N	\N	지금 솔로인,혹은 솔로였던, 다른 사람이 아닌 바로 당신의 이야기. 달콤쌉싸름한 연애공감툰.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/111/images/wide?width=1200	http://www.lezhin.com/ko/comic/solo
351	식샤를 합시다 2	첨지	\N	일상	로맨스	\N	국내 1인 가구 비율이 가장 많다는 세종시. 그곳에서 삼포세대 미혼남, 결혼하고 싶은 미혼녀, 살림바보 엄친아 등 다양한 사연을 가진 1인 가구들의 시끌벅적한 삼시세끼가 차려진다! 레진코믹스 대표 음식만화 의 첨지 작가와 tvN 인기 드라마 의 찰떡 같은 콜라보레이션!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/1022/images/wide?width=1200	http://www.lezhin.com/ko/comic/eat2
352	낭만희극	스미스	\N	로맨스	미스터리	\N	인생이란 낭만이 한 조각 한 조각 모여 만들어진 한 편의 희극. 오늘은 잠시 긴장을 풀고 어두운 극장에 편히 앉아 이야기가 시작되는 것을 기다려보시는 건 어떤지요? 각기 다른 사람들의 각기 다른, 마치 한 편 한 편의 희극과도 같은 이야기들.... 오늘의 낭만희극, 막을 올리겠습니다.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/46/images/wide?width=1200	http://www.lezhin.com/ko/comic/romantic_comedy
353	밍글라바 버마기행	유진정	\N	일상	\N	\N	들썩거리는 마음이 그대로 전해지는 그림과 작가가 직접 찍은 풋내 가득한 버마의 사진이 듬뿍! 작가의 흥겨운 어깨를 빌려 우리도 미지의 여행지 ‘버마’로 GOGO!!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/307/images/wide?width=1200	http://www.lezhin.com/ko/comic/mingalaba
354	행운의 신	징니	\N	드라마	\N	\N	평생 남에게 싫은 소리 한번 못 해보고 살아온 착한 사람 경득씨. 그에게 찾아온 일생 단 한 번의 행운이란... 세상 사람들에게 행운을 나눠주는 '행운의 신'이 될 수 있는 기회였습니다.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/326/images/wide?width=1200	http://www.lezhin.com/ko/comic/god_luck
355	마법전사 VS. 마법전사 [제2회 세계만화공모전 수상작]	경오	\N	판타지	\N	\N	세상을 지키기 위해 탄생한 마법전사들. 하지만 살면서 부딪히는 세상의 추한 면에 실망한 1대 마법전사 루시아의 변심으로 세상을 파괴하려는 마법전사 VS. 그들을 막으려는 마법전사의 팽팽한 접전이 시작된다.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/5234935819927552/images/wide?width=1200	http://www.lezhin.com/ko/comic/2nd_manhwaking_magical_warrior
356	소년, 소녀에게 묻는다	이슬기	\N	로맨스	미스터리	\N	저택을 떠날 수 없는 외로운 소녀와 그녀를 새장 밖의 세계로 이끌고자 하는 소년. 그리고 그들의 이야기.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/93/images/wide?width=1200	http://www.lezhin.com/ko/comic/soso_mut
357	개호주 유람단-일본여행기	개호주	\N	일상	개그	\N	레진코믹스의 신성 개호주를 있게 한 전설의 여행툰! 오로지 쾌락만을 위한 여행이 시작됐다! 욕망이 닿는 곳으로 떠나는 [개호주 유람단-일본여행기]	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/473/images/wide?width=1200	http://www.lezhin.com/ko/comic/gaehojuuramdan
358	Blue White Blue	sage	\N	로맨스	학원	\N	첫사랑을 하게 되었지만 그녀에게는 다른 첫사랑이 있어 마음을 드러낼 수 없다... 서로가 마음을 말할 수 없는, 하지만 상대의 몸짓 하나하나를 계속 바라보게 되는 그런 이야기.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/20/images/wide?width=1200	http://www.lezhin.com/ko/comic/blue_white_blue
359	자꾸만꿈만꾸자	꼬마비	\N	미스터리	\N	\N	나는 괜찮다고 말한다. 이 정도면 만족한다고 말한다. 잘 알고 있다고 말한다. 사람의 본성을 시리게 다루는 꼬마비 작가의 'S라인' 극중극 단편.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/40/images/wide?width=1200	http://www.lezhin.com/ko/comic/dreamaerd
360	레벨 업	JUN	서영웅	드라마	\N	\N	국내 최고의 게임 개발사 리버풀, 첫 면접자리에서 만난 현우와 세린. 어리바리 열정만 가득한 현우와 능력빵빵한 알파걸 세린이 정직원의 자리를 두고 펼쳐지는 두 청춘의 평행선. 이 둘 이대로 괜찮을까? 굿모닝티처의 서영웅 작가 최신작.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/297/images/wide?width=1200	http://www.lezhin.com/ko/comic/level_up
361	사사롭지만 좋은 날	영춘	\N	일상	학원	\N	정말 별 것 아닌 이야기들, 사사로운 이야기이지만 그 잠깐의 순간 만큼은 작아도 찬란하게 빛난다. 20대 초반의 필름 사진 앨범과 같은 이야기들.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/24/images/wide?width=1200	http://www.lezhin.com/ko/comic/a_small_goodday
362	사용중인 남자	AJS	\N	판타지	\N	\N	벌룬족인 사무는 아버지처럼 여기던 신부를 마왕에게 살해당하고, 복수의 기회를 노리며 그의 노예가 된다. 그리고 사무는 마왕의 요구대로 용을 기르게 되는데...	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/5059437834797056/images/wide?width=1200	http://www.lezhin.com/ko/comic/dragon_breeder
363	네오 마그넷	HOOPA	\N	판타지	액션	\N	3차 대전 이후의 세계. 대립하는 세력 사이에 존재하며 평화를 약속한 도시 티에구 타운에는 다양한 사람들이 모여든다. 그 중에 죽음의 위기에서 탈출하며 복수를 다짐하는 한 남자가 스며드는데.. 경쾌한 SF 활극.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/287/images/wide?width=1200	http://www.lezhin.com/ko/comic/neo_magnet
364	존재의 불행	서기진	\N	로맨스	미스터리	\N	타인을 밀어내는 재희. 재희에게 유난히 관심이 가는 지원. 재희의 죽음을 계기로 떠올리는 가슴시린 이야기.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/176/images/wide?width=1200	http://www.lezhin.com/ko/comic/unfortunate
365	복서들	이해민	\N	BL	스포츠	\N	담대한 선 안에 섬세한 표현. 우아함과 격렬함이 공존하는 연출. 복서들의 공간인 링 안에서 폭력이 아닌 아름다움을 경험한다. 레진코믹스의 주목할 만한 신작 No.1!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/299/images/wide?width=1200	http://www.lezhin.com/ko/comic/boxers
366	피아노 마주보기	한지원	\N	로맨스	\N	\N	남자친구 석이와 동거를 하고 있던 지일은 최근에 군대에서 영장이 나오자 석이가 가출을 하고 모든 게 엉망이다. 하지만 지일에게 닥친 진정한 위기는 따로 있는데.. 화제의 애니메이션  한지원 감독 작품	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/83/images/wide?width=1200	http://www.lezhin.com/ko/comic/facing_piano
367	환타스틱 코스메틱	김환타	\N	일상	\N	\N	무료 연재! 화장의 시작부터 마무리까지! 여자에게 빼놓을 수 없는 핀포인트 어드바이스가 가득!  김환타 작가가 선보이는, 화장 초보를 위한 메이크업 입문 만화!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/322/images/wide?width=1200	http://www.lezhin.com/ko/comic/fantastic_cosmetic
368	온퍼레이드	김숭늉	\N	SF	드라마	\N	이유모를 여친의 갑작스런 이별통보와 함께 찾아온 지구종말을 향한 계엄령. 그속에서 현실을 살아가는 우리. 세상의 끝에서 다시 한번 사랑을 외치다. 	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/233/images/wide?width=1200	http://www.lezhin.com/ko/comic/onparade
369	미스터 김치	채정택	김의정	드라마	음식	\N	파란만장 야생 서바이벌 김치 원정기. 다세포 소녀의 작가이자 B급달궁으로 유명한 채정택 작가와 떳다! 무지개 상가의 김의정 작가의 합작 프로젝트. 까칠한 미남 하워드와 매력만점 꽃미남 가르시아. 엉뚱한 매력의 철부지 아가씨 미유키의 김치 사업은 성공할 수 있을까? 한국과 일본을 넘나드는 치열한 김치전쟁이 시작된다.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/298/images/wide?width=1200	http://www.lezhin.com/ko/comic/mr_kimchi
370	이별의 품격	해마	억수씨	로맨스	\N	\N	소중한 만남은 아름다운 이별로 마무리하세요. 자, 이제 괜찮아요.  한 숨 고르고 '이별의 품격'과 함께하세요.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/98/images/wide?width=1200	http://www.lezhin.com/ko/comic/twostar
371	MXM 마스터 R&B 지그문트의 편지	홍승희	양영순	판타지	액션	\N	엔씨소프트X레진코믹스 콜라보. 엔씨소프트의 어벤져스! 인기 캐릭터가 한데 뭉쳤다. 양영순 작가가 소개하는 신작 게임  마스터X마스터 웹툰. 지구탈환군 마스터 키이라는 생존의 끝자락에서 모체의 연인 지그문트가 전하려던 메세지의 흔적을 찾아나선다.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/1027/images/wide?width=1200	http://www.lezhin.com/ko/comic/mxm_rb
372	샤먼	담풍	\N	미스터리	\N	\N	신이 되고 싶은 자와 신을 버리고 싶은 자의 대결을 그린 미스터리 판타지. 신의 영역에 도전한 과학자와 신의 뜻을 쫓는 샤먼의 운명적인 싸움이 펼쳐진다.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/195/images/wide?width=1200	http://www.lezhin.com/ko/comic/shaman
373	컬러	김인호	\N	액션	미스터리	\N	2년 전 그랜드 파크 테러사건에서 소중한 사람을 잃은 케이. 그 후로 그에게는 특수한 능력이 생겼다. 위험을 감지하는 눈을 갖게 된 것. 그만이 볼 수 있는 색으로 위험한 상황에 노출된 사람을 구하게 되는데... 	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/86/images/wide?width=1200	http://www.lezhin.com/ko/comic/color
374	소년, 남자의 이름으로	다다	\N	로맨스	학원	\N	여자친구를 한 달에 한 번씩 바꾸는 재동이. 여자친구랑 눈도 못 마주치는 민한이. 서로 달라보이지만 그 둘은 서툼에 익숙한가, 처음으로 서툰 것을 익혀가는 것인가의 차이밖에 없는 나이이다. 그런 소년들이 조금씩 사랑을 알게되어 가는 이야기.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/26/images/wide?width=1200	http://www.lezhin.com/ko/comic/boy_to_man
375	너에게 나의 삶을	S리아	주홍비	로맨스	판타지	\N	오후 2시 한 카페 창가에는 다리를 꼬고 커피를 마시는 사람이 있다. 누구도 주목하지 않는 지극히 평범한 일상적인 풍경, 하지만 이것이 2년간 반복되고 있다면?! 오컬트마니아 진수와 살아있는 오컬트 삶이 만나 그리는 조금 특별한 로맨스.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/4940206967357440/images/wide?width=1200	http://www.lezhin.com/ko/comic/mylifetoyou
376	GOOD AFTER 눈	오정호	\N	로맨스	학원	\N	여름이 되어도 겨울이 계속되는 마을로 전학온 소년이 한 소녀를 만나면서 벌어지는 이야기.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/81/images/wide?width=1200	http://www.lezhin.com/ko/comic/good_day_after_the_snow
377	기도(祈り)  [제1회 세계만화공모전 수상작]	은송	\N	드라마	\N	\N	눈을 의심케하는 그림과 가슴을 누르는 이야기. 심사위원 전부가 이 작품에서 눈을 떼지 못했다. 제1회 세계만화공모전 대상 수상작품. 레진코믹스의 첫 번째 선택. . 이번 공모전에는 일본어 원고로 지원하였으나 한국의 독자들을 위해 한국어로 번역한 버전을 함께 공개합니다.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/1005/images/wide?width=1200	http://www.lezhin.com/ko/comic/1st_manhwaking_wish
378	큐피트의 화살	비아이	\N	로맨스	\N	\N	소녀를 수호하는 큐피트는 그녀를 위해 사랑의 화살을 쏘아야 합니다. 하지만 그 큐피트는 화살을 쏠 수가 없었죠. 그 이유는... 이루어질 수 없는 애틋한 사랑을 그린 동화 같은 이야기. ,  비아이 작가의 신작 단편!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/375/images/wide?width=1200	http://www.lezhin.com/ko/comic/qpt_arrow
379	길지도 짧지도 않은 산책	고아라	\N	드라마	미스터리	\N	어느 조용한 시골 마을, 긴 잠에서 깨어난 부잣집 아가씨 영설과 그녀를 유괴하려는 청년 이순조의 이야기.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/30/images/wide?width=1200	http://www.lezhin.com/ko/comic/walk
380	웰컴 투 미미살롱	유승종	\N	개그	로맨스	\N	주인공 지우는 이발사인 아버지와 단 둘이 도란도란 잘 살고 있었다. 이발소 건너편에 미미살롱이 오픈하기 전까지는...! 가족의 삶에 위기를 가져다준 얄미운 미용실 미미살롱. 지우는 군대 가기 전 아버지를 위한 마지막 효도라고 생각하고 미미살롱에 잠입하는데...!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/437/images/wide?width=1200	http://www.lezhin.com/ko/comic/mimisalon
381	마당 씨의 식탁	홍연식	\N	일상	\N	\N	2015 오늘의 우리만화상 수상작. 지금의 식탁에서 어머니의 식탁을 떠올렸다. 분명 이상적인 가족이라고 할 수 없었지만, 밥상 언저리 묻은 밥풀에 담긴 사랑은 여느 가족과 다를바 없었으리라. 2012 오늘의 우리만화상 불편하고 행복하게의 뒤를 잇는 홍연식 작가의 자전적 이야기.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/427/images/wide?width=1200	http://www.lezhin.com/ko/comic/madangtable
382	아주르 스프링	장덕현	\N	드라마	\N	\N	어촌마을의 별볼일 없는 시골처녀 안나는 해녀아저씨[?]를 만나 묘한 두근거림을 느끼게 된다. 푸른바다빛 봄내음의 때늦은 사춘기.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/292/images/wide?width=1200	http://www.lezhin.com/ko/comic/azure_spring
383	밤의 동행	한흔	\N	드라마	\N	\N	여행지에서 우연히 들어간 극장, 그 속에서 발견하는 애틋한 사연과 감동. 작업실 시보 작가의 개인 단편.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/284/images/wide?width=1200	http://www.lezhin.com/ko/comic/dream
384	버츄얼 패밀리	안나래	\N	개그	\N	\N	바람 잘 날이 없는 사랑과 정의의 도시 고남시. 이 고남시에서 살아가는 불안불안한 가족을 소개해 드립니다. 유치원 교사 섹시 중년 아빠. 불운의 십자성 아래에서 태어난 엄마, 우울함의 끝을 달리는 삼촌, 태권도복의 등짝이 넓어 보이는 초딩 훈희. 평범하지만 평범하지 않은 가족 시트콤!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/17/images/wide?width=1200	http://www.lezhin.com/ko/comic/virtualfamily
385	홍콩안마시술소	성준	\N	로맨스	\N	\N	장님안마사 정민은 성노동자 사랑과의 만남을 기다린다. 그 기다림을 망치는 타인의 밤.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/7/images/wide?width=1200	http://www.lezhin.com/ko/comic/hongkong
386	8군 플레이 그라운드 쑈	노키드	\N	로맨스	학원	\N	시골 마을 소년, 소녀들의 밴드 만들기 프로젝트.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/137/images/wide?width=1200	http://www.lezhin.com/ko/comic/8show
387	잡채킬러	수성소년	가오	로맨스	개그	\N	킬러집단에서 후계자로 길러진 고아소녀. 하지만 양아버지의 유언은 그녀가 평범한 여자아이로 자라나는것. 그러나 조직은 그녀를 순순히 놓아주지 않는다. 감정을 잃어버린 킬러소녀의 '자신'을 찾아가는 이야기. 	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/87/images/wide?width=1200	http://www.lezhin.com/ko/comic/japchae
388	우주교도소 바다붐	김용키	\N	개그	SF	\N	평범한 외계인 레이첼 맥아담스. 어느 날 살인 혐의로 우주교도소 바다붐에 수감된다. 그는 과연 거친 악당들과 간수들 사이에서 무사히 누명을 벗고 교도소를 벗어날 수 있을것인가?	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/261/images/wide?width=1200	http://www.lezhin.com/ko/comic/badaboom
389	우주교도소 바다붐	김용키	\N	개그	SF	\N	평범한 외계인 레이첼 맥아담스. 어느 날 살인 혐의로 우주교도소 바다붐에 수감된다. 그는 과연 거친 악당들과 간수들 사이에서 무사히 누명을 벗고 교도소를 벗어날 수 있을것인가?	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/261/images/wide?width=1200	http://www.lezhin.com/ko/comic/badaboom
390	일리 있는 사랑	한민기	\N	로맨스	\N	\N	거침없는 소녀 일리와 명태를 닮은 선생님 희태의 사랑... tvN 드라마 의 스페셜 웹툰을 '우리는 우연히 그리고'의 한민기 작가가 특유의 감성으로 그린다.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/357/images/wide?width=1200	http://www.lezhin.com/ko/comic/tvnilly
391	어른을 위한 BIG 4 만화 공모전	편집부	\N	일상	\N	\N	[어른을 위한 BIG 4 만화 공모전] 스페셜 프로젝트. 릴레이 응원 웹툰 특별 공개! [어느 날 잠에서 깨어보니 베이글녀가 되어 있었다],[캠퍼스 밀크푸딩], [현자타임] 의 작가 탱크가이님의 BL 도전? [오타쿠를 짝사랑하는 법] 차우민 작가의 수상한 남성만화, [모멘텀] 박지연 작가의 BL 아닌 백합 외전!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/6444280871124992/images/wide?width=1200	http://www.lezhin.com/ko/comic/big4award
392	노수	누로	\N	드라마	\N	\N	어린 아들을 사고로 잃고 무기력하게 살아온 남자. 늘그막에 가서 아들을 죽음을 떠올릴 아이를 만난다. 하지만 그 아이는 바로 자기 아들을 죽음으로 몰아넣은 장본인과 연결되어 있는데.. 왕따라는 사건으로 회복하기 힘든 상처를 받은 남자의 아픔. 그리고 복수와 인정사이에 갈등하는 남자의 고뇌를 섬세하게 파헤치는 작품	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/346/images/wide?width=1200	http://www.lezhin.com/ko/comic/oldman
393	불편하고 행복하게	홍연식	\N	일상	\N	\N	낭만적인 꿈을 꾸지만 만만치 않은 전원생활. 만화가부부가 몸소 체험한 귀농, 그리고 전원일기의 모든 것. 2012년 오늘의 우리만화상 수상작품.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/288/images/wide?width=1200	http://www.lezhin.com/ko/comic/back_to_the_countryside
395	무색소녀	레임	\N	학원	\N	\N	항상 우울한 표정으로 혼자있는 지아, 은우는 자살을 예감하는 듯한 지아의 행동에 불안한 느낌을 받고 지아의 주위를 맴돈다. 아슬아슬한 청소년들의 감정을 흥미롭게 그려낸 레임님의 데뷔작!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/241/images/wide?width=1200	http://www.lezhin.com/ko/comic/colorlessgirl
396	APPLE	케이지콘	\N	SF	\N	\N	제임스 호크는 아내 아델 프로이트의 권유로 냉동 수면에 들어간다. 전장에서 잃은 몸을 복구한 과학기술은 불안정 했기에 그것만이 그가 살 길이라고 믿었다. 그리고 수면에 깨어 났을 때 그가 목격한 것은.. 다음 웹툰 의 케이지콘 작가가 보여주는 SF 극화.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/38/images/wide?width=1200	http://www.lezhin.com/ko/comic/apple
397	신세계의 주민	김정훈	\N	판타지	개그	\N	인류멸망이 현실이 된 세상 '신세계'. 우연히 살아남게된 정일호는 자칭 신세계의 주인이라고 하는 서주민을 만나 노예 1호로 불리게 되는데..	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/306/images/wide?width=1200	http://www.lezhin.com/ko/comic/newworld
398	팬텀 – 어둠을 가르는 환영 헤기	넥슨	\N	판타지	액션	\N	이번에는 마비노기 영웅전 이다! Team WEAVER 의 마영전 스페셜 스토리!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/5493005872529408/images/wide?width=1200	http://www.lezhin.com/ko/comic/mabi_heroes
399	도도대학교의 비밀	둘기마요	\N	판타지	드라마	\N	온 대륙 학자들이 모여 연구하는 학문의 성지 도도대학교. 자신의 연구를 위해 숨어든 혼혈뿔쾡이 하멜라는 세상 물정 어두워 보이는 멍청한 소년 귤팽이를 만나게 되는데... 과연 이 둘은 폐쇄된 산업단지에서 무엇을 찾을 것인가! 둘기마요 세계관의 거대한 서막, 드디어 시작된다!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/355/images/wide?width=1200	http://www.lezhin.com/ko/comic/dodo
400	꽃가마 신드롬	박한울	\N	학원	스포츠	\N	육덕관 씨름부 녀석들의 성장스포츠 드라마	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/461/images/wide?width=1200	http://www.lezhin.com/ko/comic/flowersyndrome
401	내가 사랑하는 초등학생 [제1회 세계만화공모전 수상작]	화로	\N	로맨스	개그	\N	남자친구에게 차인 후 현실도피용으로 찾은 게임에서 새로운 사랑을 만났다! 게임 속 초딩에게 한눈에 반해버린 비운의 주인공 심청아의 좌충우돌 과잉보호 프로젝트!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/1017/images/wide?width=1200	http://www.lezhin.com/ko/comic/1st_manhwaking_iloveschoolboy
402	애니	폴드랑	\N	드라마	시대극	\N	빈센트 반 고흐를 연상케 하는 아름다운 채색과 숨길 수 없는 필력. 위대한 헬렌 켈러를 만든 강한 여인, 애니 설리번에 관한 드라마 보다 더 드라마 같은 실화.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/301/images/wide?width=1200	http://www.lezhin.com/ko/comic/anne
403	파이프시티	재수	\N	SF	\N	\N	‘스팀’, 뜨겁고 빛나며 수분과 전기를 머금은 미래의 에너지원… 스팀을 도시의 곳곳으로 순환시키기 위해 배관을 수리하는 사람들, 그리고 그들의 목숨을 좌지우지하는 중력 이동. [재수의 연습장]으로 드로잉의 새로운 세계를 열어가는 재수 작가의 본격 SF 만화!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/302/images/wide?width=1200	http://www.lezhin.com/ko/comic/pipe_city
404	꼴데툰 2014	샤다라빠	\N	스포츠	개그	\N	롯데팬의 필독만화. 야구 만화의 대명사 꼴데툰이 2014년을 맞이하여 한층 업그레이드 되어 돌아왔다. 첫 화부터 롯데팬들의 뒷목을 잡게 만드는 엘꼴라시코의 대 폭발!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/234/images/wide?width=1200	http://www.lezhin.com/ko/comic/ggtoon2014
405	PLAY-A 보고서	안성호	\N	SF	\N	\N	운영비의 90% 이상이 '자발적 후원금'으로 이루어진 포르노 회사 PLAY.A 의 취재 보고서.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/36/images/wide?width=1200	http://www.lezhin.com/ko/comic/playa
406	토익학원에서	루드비코	\N	개그	드라마	\N	폭풍찌질남 종석이 강남의 한 토익학원에서 겪는 기묘한 모험담. 21세기 취준생 오딧세이.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/37/images/wide?width=1200	http://www.lezhin.com/ko/comic/toeic
407	메탈 코이	미키	\N	미스터리	로맨스	\N	신분을 감춘 재벌 2세 크리스 오웬과 순진하지만 강단있는 검찰총장의 딸 앨리슨 카비젤. 첫 만남부터 삐걱대는 두 사람의 스릴넘치는 티격티격하는 서스펜스.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/296/images/wide?width=1200	http://www.lezhin.com/ko/comic/metal_coy
408	129페이지로 보내는 편지	이즐라	\N	로맨스	일상	\N	만화가가 되기 위해 연애도 포기한 주인공의 앞에 이상형의 그녀가 나타난다. 하지만 남자친구가 있는 그녀에게 고백하지 못한 나는 앞으로 절대 만나지 않는다는 규칙을 정하고 편지를 주고받는 친구가 되기로 제안한다. 사랑과 우정 사이에서 겪게 되는 주인공의 내적 갈등에 관한 이야기를, 여동생에게 보내는 편지형식으로 풀어가는 독특한 형식의 풋풋한 이야기.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/115/images/wide?width=1200	http://www.lezhin.com/ko/comic/a_letter_to_129page
409	사자와의 저녁식사	오유리	\N	판타지	미스터리	\N	사신을 보는 눈을 가진 문교에게 사건이 발생한다. 남은 인생은 겨우 일주일! 그리고 그의 앞에 나타난 사자는... 사연을 가진 저승사자 가비와 문교가 파헤치는 비밀종교조직의 내막. 그리고 밝혀진 가비의 죽음. 신인 오유리 작가의 판타스틱한 미스터리.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/295/images/wide?width=1200	http://www.lezhin.com/ko/comic/date_with_the_dead
410	대구의 밤	송아람	\N	드라마	\N	\N	평생 자기 마음대로 살것만 같던 홍연은 속도위반으로 갑작스레 결혼을 전하게 되고 공주는 고향인 대구로 돌아가게 된다. 2년뒤에야 어렵게 대구에서 다시 만난 두사람의 인생은.… '자꾸 생각나' 송아람 작가의 명작 단편	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/262/images/wide?width=1200	http://www.lezhin.com/ko/comic/night_of_daegu
411	여행의 발견	임현정	\N	로맨스	\N	\N	신혼여행지인 룩셈부르크에서 진석에게 희영은 이혼을 통보한다.그리고 1년후, 친구인 규현의 여자친구 리나를 데려다주러 다시 룩셈부르크를 찾아온 진석과 잘생기고 매너 좋은 베스트셀러 작가와의 우연한 로맨스를 꿈꾸며 여행을 떠나는 희영, 5명의 남녀와 함께 떠나는 유럽, 그곳에서 발견한 사랑과 결혼에 대한 잔혹한 현실.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/150/images/wide?width=1200	http://www.lezhin.com/ko/comic/discovery
413	군도: 민란의 시대 외전	이영곤	고진호	시대극	액션	\N	뭉치면 백성, 흩어지면 도적! 지리산 추설의 신 거성 도치와 백성의 적 조윤의 잊을 수 없는 한판 승부. 한국영화의 흥행기록을 다시 쓴 영화  의 스페셜 웹툰.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/281/images/wide?width=1200	http://www.lezhin.com/ko/comic/gundo
414	마비노기 닌자	넥슨	\N	판타지	\N	\N	판타지라이프 “마비노기”에서 공개한 닌자 재능 업데이트 기념 하기와 안즈의 달콤한 스토리! 그들의 알콩 달콩 심쿵 스토리를 레진에서 감상해보세요!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/1025/images/wide?width=1200	http://www.lezhin.com/ko/comic/mabinogi
415	비비 (BIBI)	aria	\N	판타지	로맨스	\N	사랑을 위해 심장을 얼린 영웅이 음모와 권력, 욕망과 운명으로부터 그녀를 지킨 판타지로맨스.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/69/images/wide?width=1200	http://www.lezhin.com/ko/comic/bibi
416	막돼먹은 영애씨 비하인드 스토리	영춘	\N	일상	\N	\N	시즌 14를 거듭해오며 많은 사랑을 받아온 우리시대 대표 언니 영애씨. 이번엔 창업이다! '사장'이란 이름표를 달고 새로운 회사로 옮기면 '갑'이 될 줄 알았건만, 그것은 또다른 '을'의 세계였으니... 창업의 세계에 뛰어든 영애씨와 막영애 식구들의 비하인드 스토리를 웹툰으로 만나보세요!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/6193338967916544/images/wide?width=1200	http://www.lezhin.com/ko/comic/i_love_youngae
417	얼레디 씬	빵야	먹먹	미스터리	판타지	\N	퇴마사인 쌍둥이 자매 소망과 소원, 그리고 영의 과거를 볼수 있지만 귀신이 무서운 민준, 천재 퇴마사 진, 그들이 맞이 하게 되는 숨겨진 과거와 현재의 데자뷰, 이들의 뒤엉킨 인연을 풀 실마리는 죽은 진의 형. 현의 검은그림자속에 있는데...	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/118/images/wide?width=1200	http://www.lezhin.com/ko/comic/alseen
418	제1막	인형	\N	학원	드라마	\N	전학생 재혁이 학교에 서서히 적응해가던 어느 날, 담임 선생님에게 등떠밀려 가게 된 곳은 다름 아닌 연극 동아리! 서툴고 여렸지만 가장 뜨겁게 빛났던 그 시절의 첫번째 막이 오릅니다.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/439/images/wide?width=1200	http://www.lezhin.com/ko/comic/act1
419	러브 트랜지스터	박상선	\N	드라마	개그	\N	특기는 공포요가, 취미는 병X춤, 불통과 무능의 아이콘인 그녀는 남들과 다른 특별한 능력이 있는데.. 그것은 동물들과의 대화 능력! 애니멀 커뮤니케이터 박애자의 좌충우돌 일상!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/6005598810800128/images/wide?width=1200	http://www.lezhin.com/ko/comic/love_trans
420	이환천의 문학살롱	이환천	\N	일상	\N	\N	SNS에서 널리 알려진 대표시인 이환천의 시와 그림이 만났다. 짧지만 위트있는 글귀로 누구라도 공감할 수 있는 내용을 익살스럽게 표현한 새 시대의 문학살롱. 드디어 레진코믹스 입성	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/496/images/wide?width=1200	http://www.lezhin.com/ko/comic/salon
421	혈압상승주의보	DJ구름	\N	개그	학원	\N	손자의 얼굴이 잘생겨지는 동안 할아버지의 혈압은 점점 올라간다?! 손자를 향한 초능력자 할아버지의 사랑! 과연 할아버지는 자신의 고혈압과 맞바꿔 손자의 인생을 장미빛으로 만들어 줄 수 있을 것인가?!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/391/images/wide?width=1200	http://www.lezhin.com/ko/comic/blood_pressure
422	권기린툰	권기린	\N	일상	개그	\N	대학생이 제일 만만하다고 여기는 답답한 세상, 여기 사이다 한 잔 크하! 고민상담 강아지에 이은 생활밀착형 기린이 온다! 페이스북 화제의 만화 '권기린툰', 드디어 레진코믹스에 등장!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/460/images/wide?width=1200	http://www.lezhin.com/ko/comic/giraffe
423	권기린툰	권기린	\N	일상	개그	\N	대학생이 제일 만만하다고 여기는 답답한 세상, 여기 사이다 한 잔 크하! 고민상담 강아지에 이은 생활밀착형 기린이 온다! 페이스북 화제의 만화 '권기린툰', 드디어 레진코믹스에 등장!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/460/images/wide?width=1200	http://www.lezhin.com/ko/comic/giraffe
424	아울스 OWLS	현경	\N	드라마	\N	\N	대중 앞에 나가 지휘하는 것을 꿈꾸고 있지만 그러한 욕망을 꾹꾹 누르고 살아가는, 그리고 그런 친구를 위해 자신의 자리를 양보하는, 시간이 지날수록 변하고 성장하는 두 소년과 악단원들의 이야기.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/459/images/wide?width=1200	http://www.lezhin.com/ko/comic/owls
425	나무의 하루	이힝	\N	학원	\N	\N	여린 새싹 같은 색감, 부드러운 그림체로 채워진 한편의 동화. 상상 속에서 유영하던 어린 시절의 나무가 홀로 서게 되는 과정을 그린 성장담으로 모두의 유년기를 울림 있게 두드리며 다가갑니다. .	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/412/images/wide?width=1200	http://www.lezhin.com/ko/comic/namu_of_haru
426	THE CITY	김불쏠	\N	드라마	\N	\N	쿠데타로 격변기에 빠진 북한, 경기 침체에 빠진 남한. 비선라인을 통한 남북 양측의 조속한 통일이 진행된다. 그리고 후유증이 나타나기 시작하였으니… 통일의 도시 개성공단에서 소용돌이가 시작된다!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/117/images/wide?width=1200	http://www.lezhin.com/ko/comic/the_city
427	미지와의 조우 [제1회 세계만화공모전 수상작]	인플	태엽	BL	\N	\N	동아리 MT에 갔다가 미지의 존재에 의해 기묘한 공간에 '알몸'으로 갇혀버린 종찬. 이 상황 자체도 황당하고 공포스러운데, 별로 친하지도 않은 동기 김장우는 왜 여기 있는 거야?! 	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/1007/images/wide?width=1200	http://www.lezhin.com/ko/comic/1st_manhwaking_close_encounter
428	건널목에서 만나요 [제1회 세계만화공모전 수상작]	씽씽	\N	BL	\N	\N	건널목에서 체포하려던 바바리맨이 초등학교 양호 선생님?! 부끄러운 우연을 계기로 가까워진 두 사람의 달콤한 밀당이 시작된다!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/1008/images/wide?width=1200	http://www.lezhin.com/ko/comic/1st_manhwaking_crosswalk
429	가비왕 [제1회 세계만화공모전 수상작]	류두열	\N	판타지	액션	\N	제1회 세계만화공모전 우수상 수상 작품	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/1009/images/wide?width=1200	http://www.lezhin.com/ko/comic/1st_manhwaking_gabi
430	이별・리프 [제1회 세계만화공모전 수상작]	장대현	\N	드라마	로맨스	\N	6년째 연애 중인 지우와 현지. 어느새 변해버린 이 커플은 현지가 절친 하니의 결혼식에서 부케를 놓친 것을 계기로 끝내 이별을 맞는다. 서로 첫 이별인지라 방법을 모르는 두 사람은 하니의 도움으로 추억 속 프랑스에 이별여행을 떠나는데...	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/1010/images/wide?width=1200	http://www.lezhin.com/ko/comic/1st_manhwaking_bye_leap
431	기찻길 여행자(支線上的觀光客) [제1회 세계만화공모전 수상작]	지엔스지에(簡士頡)	\N	드라마	판타지	\N	시골 기찻길에서 만난 미녀 두명. 여행길을 설레임으로 그 들을 따라가보지만 무언가 수상쩍은 기운이 감도는데.. 기찻길에서 만난 여행자들의 독특한 이야기	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/1012/images/wide?width=1200	http://www.lezhin.com/ko/comic/1st_manhwaking_rail_tour
432	아웃사이더 (アウトサイダー) [제1회 세계만화공모전 수상작]	카노우 아키라(叶輝)	\N	판타지	액션	\N	뱀파이어와 워울프의 수세기를 건너온 슬픈 역사… 현재로 부터 19년 전 어떤 사건을 계기로 운명은 소용돌이 치려한다. 	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/1013/images/wide?width=1200	http://www.lezhin.com/ko/comic/1st_manhwaking_outsider
433	나쁜 아이들 [제1회 세계만화공모전 수상작]	전수영	\N	드라마	미스터리	\N	소년원에서 복역중이던 '수'는 헤어진 여자친구 '미래'의 자살소식을 듣게 된다. 이해할 수 없는 사고에 강한 의구심을 느낀 '수'는 '미래'의 주변사람을 탐문해가며 조금씩 사건의 진실에 다가가는데…!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/1014/images/wide?width=1200	http://www.lezhin.com/ko/comic/1st_manhwaking_bads
434	꽃도사 [제1회 세계만화공모전 수상작]	고용호	김문경	학원	판타지	\N	현세의 질서를 바로잡기 위해 요괴 퇴치를 하는 꽃도사 천지율. 요괴에게 쫓기는 한 소녀를 구하기 위해 점점 더 거대한 적들과 마주하게 되는데...!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/1018/images/wide?width=1200	http://www.lezhin.com/ko/comic/1st_manhwaking_flowerwizard
435	자해클럽 [제1회 세계만화공모전 수상작]	소망	\N	학원	드라마	\N	보이지 않는다고 없는 것은 아니다. 아무에게도 피해주지 않고 자신을 망가뜨리는 슬픈 집단! !!    	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/1019/images/wide?width=1200	http://www.lezhin.com/ko/comic/1st_manhwaking_somang
436	아날로그맨	김수박	\N	드라마	\N	\N	만화가 김수박이 스스로의 삶을 기초로 해 구성, 자신의 서울 생활 보고서이자 삶에 대한 진솔한 고백. 픽션과 논픽션, 현실과 몽상을 넘나들며 한국 만화의 독창적 영역에 들어간 바로 그 만화! 절판되어 만날 수 없는 걸작, 레진코믹스 전격 연재!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/359/images/wide?width=1200	http://www.lezhin.com/ko/comic/analogman
437	나와 떠나는 여행	광산	\N	일상	\N	\N	마음이 두근두근 엉덩이가 들썩들썩, 오토바이 한 대로 훌쩍 떠나는 전국일주가 시작된다! 작가의 기묘한 체험과 만화적 상상, 유용한 정보까지 알차게 담은 유쾌한 여행 만화!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/371/images/wide?width=1200	http://www.lezhin.com/ko/comic/alone
438	세계 만화 공모전 축전	레진코믹스	\N	일상	\N	\N	제 1회 레진코믹스 세계만화공모전  작가님들의 응원축전을 공개합니다. 포기하면 그 순간이 바로 시합 종료에요 마지막 1초까지 포기하지 말고 모두 화이팅!	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/1004/images/wide?width=1200	http://www.lezhin.com/ko/comic/1st_manhwaking
439	웹투니스타	편집부	\N	일상	\N	\N	[고전명작의 오마쥬] 를 주제로 미래창조과학부와 문화체육관광부가 주최하고, 한국과학창의재단과 레진코믹스가 함께하는 국내 최초 디지털 만화 오디션 ｢웹투니스타｣! 수장작 및 본선 진출작을 공개합니다.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/1003/images/wide?width=1200	http://www.lezhin.com/ko/comic/webtoonistar
440	목숨	검둥	\N	드라마	\N	\N	죽음까지 남은 시간 평균 21일... '가깝다고 생각하면 가까운'의 검둥 작가가 드리는, 사는 게 좋은 걸 잊어버린 당신에게 권하는 웹툰.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/356/images/wide?width=1200	http://www.lezhin.com/ko/comic/life
441	고은정 단편만화 모음집	고은정	\N	드라마	\N	\N	독특한 컨셉으로 개성적인 이야기를 뽑아내는 프로젝트 PUTPUT 의 개성적인 이야기들. 시적인 대사와 이야기가 전달하는 문학적인 느낌. 기대되는 신인 작가 고은정의 단편 모음집.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/308/images/wide?width=1200	http://www.lezhin.com/ko/comic/putput
442	굿바이 썬더	이상훈	이현세	드라마	\N	\N	늙은 경주마 썬더 그리고 썬더와 함께 성장하는 아이들.  등 한국 대표 만화가 이현세의 역작.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/305/images/wide?width=1200	http://www.lezhin.com/ko/comic/goodbye_thunder
443	알바걸과 워킹맨	다다	\N	드라마	\N	\N	가난하여 하루종일 알바만 하는 휴학생 소녀 탈리와 하루종일 백수처럼 걸어다니며 아무것도 하지 않는 정체불명의 동네 백수아저씨. 그들의 각자의 사정, 그리고 만남. 소년, 남자의 이름으로의 박다다작가 신작.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/188/images/wide?width=1200	http://www.lezhin.com/ko/comic/albagirl
444	족구왕	백봉	\N	스포츠	개그	\N	토익 점수: 받아본 적 없음. 여자 친구: 있어본 적 없음. 답없는 복학생 만섭은 우연한 사건으로 족구실력이 소문나 순식간에 캠퍼스의 ‘슈퍼 복학생 히어로’가 되고, 취업 준비장 같이 지루하던 캠퍼스는 족구 열풍에 휩싸이게 되는데.. 의 스페셜 웹툰.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/1000/images/wide?width=1200	http://www.lezhin.com/ko/comic/jokgu
445	낭만두더지 나두	크레이지버드 스튜디오	\N	로맨스	\N	\N	싱어송라이터가 꿈인 나두는 사랑을 떠드는 세상을 이해할 수 없다. 본인이 사랑에 무덤덤한 편이라 고민. 긍정의 에너지를 가진 지지는 사랑에 목매다는 스타일. 감정의 기복이 심하여 쉽게 사랑에 빠지고 식는다. 상극인 두 주인공이 만나면서 서로 성장하는 맑고 투명한 로맨스 스토리.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/275/images/wide?width=1200	http://www.lezhin.com/ko/comic/nadu
446	1598	담풍	\N	시대극	액션	\N	1598년 임진왜란의 주적 풍신수길을 암살하기 위해 적진에 몸을 던진 6인의 조선 민중. 그들의 외로운 투쟁에 관한 이야기. 	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/236/images/wide?width=1200	http://www.lezhin.com/ko/comic/assassin_of_chosun
447	연애 시뮬레이션	신상	\N	SF	개그	\N	때는 2052년 서울. 이상형과의 연애를 꿈꾸는 사람들을 위해 외모와 성격이 완벽한 인간의 모습을 한 로봇들이 개발되고, 이 로봇을 휴머노이드라고 한다. 로봇을 싫어하던 이강우는 어느 날 인간처럼 스스로 사고하는 최신형 휴머노이드인 박미소와 우연하게 만나게 되고... 박미소는 인간인 이강우에게 뜻 밖의 제안을 하는데... 과연 이 둘에게 앞으로 어떤 일들이 닥칠 것인가?	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/228/images/wide?width=1200	http://www.lezhin.com/ko/comic/love_simulation
448	스토리텔러	김태경	\N	미스터리	판타지	\N	사람을 이야기 속에 가 둘 수 있다면?! 인기 작가 김세영은 알 수 없는 힘에 이끌려 갖은 고생을 한다. 그 모든 것인 한 소녀가 펜을 이용한 힘때문이라고 밝혀지는데. 특수한 능력을 가진 펜을 차지하기 위한 쟁탈전이 시작된다.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/229/images/wide?width=1200	http://www.lezhin.com/ko/comic/storyteller
449	미드나잇 블루	지애	\N	드라마	\N	\N	심해의 조각들을 그리는 지애의 단편 모음집. 대체로 어둡고 무겁습니다.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/214/images/wide?width=1200	http://www.lezhin.com/ko/comic/midnight_blue
450	협객	현강석	원유수	액션	시대극	\N	김두한과 시라소니가 빼앗긴 나라를 되찾기 위해 두주먹을 불끈쥐던 피끓는 사내들의 계절 낭인시대는 2014년 현재에도 아직 끝나지 않았다! 어느날 의문의 사내에게 총격을 당한 할아버지와 함께 보내진 아네모네 꽃의 정체는? 숨겨진 협객들의 역사속 비화가 밝혀진다.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/204/images/wide?width=1200	http://www.lezhin.com/ko/comic/justicewarrior
451	그런 만화가가 있었다	 떱	\N	미스터리	판타지	\N	살인과 마약 그리고 대공황이 도시를 안개처럼 감싸던 시기, 그 모든일을 계획하고 실행했다는 인물이 재판에 부쳐졌다. 그는 만화가 였다. 의문의 살인사건을 쫓는 형사 서머셋과 범죄자 리헤이. 그들의 앞에 '집행자'가 나타나는데..	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/203/images/wide?width=1200	http://www.lezhin.com/ko/comic/cartoonisdead
452	감기 4부작	노키드	\N	일상	\N	\N	일상과 비일상을 뒤섞어 독특한 세계를 창조하는 노키드 작가의 4부작 단편집.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/193/images/wide?width=1200	http://www.lezhin.com/ko/comic/common_cold
453	재수 단편집	재수	\N	개그	판타지	\N	재수작가의 부정기 단편 모음집.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/167/images/wide?width=1200	http://www.lezhin.com/ko/comic/jaesoo
454	앵두야, 연애하자	영춘	\N	로맨스	\N	\N	바람핀 애인에게 차인 그 날, 앵두의 부모님은 로또에 당첨되었다. 그 길로 앵두네 가족은 세계여행을 떠나고 작가지망생 앵두는 친구들을 불러 함께 살게되었다. 이제는 하고싶은 일 다 하면서 살 줄 알았는데... 일도 연애도 서툰 친구들은 여전히 일상이 힘들고 짜증난다. 번번이 신춘문예에 낙방하는 작가지망생 정앵두, 예쁜 외모로 남자는 많지만 알바를 전전하는 문소영, 일이 바빠 남자는 언감생심인 이윤진, 소심한 모태솔로 엄나은. 네 명의 여자들이 겪는 우리 시대 20대의 이야기.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/121/images/wide?width=1200	http://www.lezhin.com/ko/comic/cherrylove
455	갈라테아 딜레마	관절	\N	판타지	\N	\N	매사에 불만이 많고 건성인 태성. 그에게 게임캐릭터 다이애나의 모습을 한 정체불명의 여자아이가 배송되게 되고 그녀와의 교감으로 태성은 조금씩 자신의 잘못된 점을 고쳐나가게 된다. 태성과 악연으로 엮이게 되는 마리와 태성을 몰래 짝사랑하는 샛별. 청춘들은 성장하며 자신의 자리를 찾아간다. 	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/53/images/wide?width=1200	http://www.lezhin.com/ko/comic/galatea
456	와치	한원	\N	시대극	판타지	\N	잿물을 덮지 않은 질그릇 잔 '와치'. 그림을 그리는 사람에게 있어 그림은 때로 삶이기도 하고 죽음이기도 하다. 그림에 혼을 실어 신비로운 일들을 일으키는 화가들의 이야기.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/80/images/wide?width=1200	http://www.lezhin.com/ko/comic/wachi
457	구름을 누비는 소녀	오은지	정기림	로맨스	\N	\N	동화같은 마을, 열여섯 소년 소녀의 만남. 하나 하나의 천조각을 이어붙여 만든 퀼트와 같이, 완전하지 않은 동시에 완전한 사랑 이야기.	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/58/images/wide?width=1200	http://www.lezhin.com/ko/comic/cloudgirl
458	DEAD TO THE WORLD	카리보	\N	드라마	판타지	\N	멀지 않은 근미래, 발병자는 머지 않아 영원히 잠들게 되는 정체불명의 기면증이 유행한다... 당신의 친구가 젊은 나이로 불치병에 걸렸을 때. 죽어가는 것을 그저 바라보는 것 외에 당신이 할 수 있는 일이 있다면...	레진코믹스	t	ALL	http://acdn.lezhin.com/v2/comics/4/images/wide?width=1200	http://www.lezhin.com/ko/comic/dead_to_the_world
\.


--
-- Name: blog_webtoon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('blog_webtoon_id_seq', 458, true);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 1, false);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	blog	post
8	blog	movie
9	blog	webtoon
10	blog	user
11	blog	star
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_content_type_id_seq', 11, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2016-07-13 08:43:25.00726+00
2	auth	0001_initial	2016-07-13 08:43:25.092443+00
3	admin	0001_initial	2016-07-13 08:43:25.115299+00
4	admin	0002_logentry_remove_auto_add	2016-07-13 08:43:25.125407+00
5	contenttypes	0002_remove_content_type_name	2016-07-13 08:43:25.15089+00
6	auth	0002_alter_permission_name_max_length	2016-07-13 08:43:25.169497+00
7	auth	0003_alter_user_email_max_length	2016-07-13 08:43:25.185979+00
8	auth	0004_alter_user_username_opts	2016-07-13 08:43:25.195017+00
9	auth	0005_alter_user_last_login_null	2016-07-13 08:43:25.204892+00
10	auth	0006_require_contenttypes_0002	2016-07-13 08:43:25.206526+00
11	auth	0007_alter_validators_add_error_messages	2016-07-13 08:43:25.215313+00
12	blog	0001_initial	2016-07-13 08:43:25.296619+00
13	sessions	0001_initial	2016-07-13 08:43:25.310495+00
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_migrations_id_seq', 13, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: blog_movie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY blog_movie
    ADD CONSTRAINT blog_movie_pkey PRIMARY KEY (id);


--
-- Name: blog_post_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY blog_post
    ADD CONSTRAINT blog_post_pkey PRIMARY KEY (id);


--
-- Name: blog_star_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY blog_star
    ADD CONSTRAINT blog_star_pkey PRIMARY KEY (id);


--
-- Name: blog_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY blog_user
    ADD CONSTRAINT blog_user_pkey PRIMARY KEY (id);


--
-- Name: blog_webtoon_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY blog_webtoon
    ADD CONSTRAINT blog_webtoon_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_user_groups_0e939a4f ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_user_groups_e8701ad4 ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_8373b171 ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_e8701ad4 ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_user_username_6821ab7c_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: blog_post_4f331e2f; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX blog_post_4f331e2f ON blog_post USING btree (author_id);


--
-- Name: blog_star_3f64032f; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX blog_star_3f64032f ON blog_star USING btree (webtoon_id);


--
-- Name: blog_star_e8701ad4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX blog_star_e8701ad4 ON blog_star USING btree (user_id);


--
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX django_admin_log_417f1b1c ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX django_admin_log_e8701ad4 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX django_session_de54fa62 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_post_author_id_dd7a8485_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blog_post
    ADD CONSTRAINT blog_post_author_id_dd7a8485_fk_auth_user_id FOREIGN KEY (author_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_star_user_id_dc84953c_fk_blog_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blog_star
    ADD CONSTRAINT blog_star_user_id_dc84953c_fk_blog_user_id FOREIGN KEY (user_id) REFERENCES blog_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_star_webtoon_id_285faeb6_fk_blog_webtoon_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blog_star
    ADD CONSTRAINT blog_star_webtoon_id_285faeb6_fk_blog_webtoon_id FOREIGN KEY (webtoon_id) REFERENCES blog_webtoon(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_content_type_id_c4bce8eb_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_content_type_id_c4bce8eb_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

