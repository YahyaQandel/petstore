--
-- PostgreSQL database dump
--

-- Dumped from database version 11.2 (Debian 11.2-1.pgdg90+1)
-- Dumped by pg_dump version 11.2 (Debian 11.2-1.pgdg90+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: petstore_user
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO petstore_user;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: petstore_user
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO petstore_user;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: petstore_user
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: petstore_user
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO petstore_user;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: petstore_user
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO petstore_user;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: petstore_user
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: petstore_user
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO petstore_user;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: petstore_user
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO petstore_user;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: petstore_user
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: petstore_user
--

CREATE TABLE public.authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.authtoken_token OWNER TO petstore_user;

--
-- Name: bid_bid; Type: TABLE; Schema: public; Owner: petstore_user
--

CREATE TABLE public.bid_bid (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    is_removed boolean NOT NULL,
    amount_currency character varying(3) NOT NULL,
    amount numeric(12,2) NOT NULL,
    owner_id integer NOT NULL,
    pet_id integer NOT NULL
);


ALTER TABLE public.bid_bid OWNER TO petstore_user;

--
-- Name: bid_bid_id_seq; Type: SEQUENCE; Schema: public; Owner: petstore_user
--

CREATE SEQUENCE public.bid_bid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bid_bid_id_seq OWNER TO petstore_user;

--
-- Name: bid_bid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: petstore_user
--

ALTER SEQUENCE public.bid_bid_id_seq OWNED BY public.bid_bid.id;


--
-- Name: category_category; Type: TABLE; Schema: public; Owner: petstore_user
--

CREATE TABLE public.category_category (
    id integer NOT NULL,
    is_removed boolean NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.category_category OWNER TO petstore_user;

--
-- Name: category_category_id_seq; Type: SEQUENCE; Schema: public; Owner: petstore_user
--

CREATE SEQUENCE public.category_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_category_id_seq OWNER TO petstore_user;

--
-- Name: category_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: petstore_user
--

ALTER SEQUENCE public.category_category_id_seq OWNED BY public.category_category.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: petstore_user
--

CREATE TABLE public.django_admin_log (
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


ALTER TABLE public.django_admin_log OWNER TO petstore_user;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: petstore_user
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO petstore_user;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: petstore_user
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: petstore_user
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO petstore_user;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: petstore_user
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO petstore_user;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: petstore_user
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: petstore_user
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO petstore_user;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: petstore_user
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO petstore_user;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: petstore_user
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: petstore_user
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO petstore_user;

--
-- Name: pet_bid; Type: TABLE; Schema: public; Owner: petstore_user
--

CREATE TABLE public.pet_bid (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    is_removed boolean NOT NULL,
    amount_currency character varying(3) NOT NULL,
    amount numeric(12,2) NOT NULL,
    owner_id integer NOT NULL,
    pet_id integer NOT NULL
);


ALTER TABLE public.pet_bid OWNER TO petstore_user;

--
-- Name: pet_bid_id_seq; Type: SEQUENCE; Schema: public; Owner: petstore_user
--

CREATE SEQUENCE public.pet_bid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pet_bid_id_seq OWNER TO petstore_user;

--
-- Name: pet_bid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: petstore_user
--

ALTER SEQUENCE public.pet_bid_id_seq OWNED BY public.pet_bid.id;


--
-- Name: pet_pet; Type: TABLE; Schema: public; Owner: petstore_user
--

CREATE TABLE public.pet_pet (
    id integer NOT NULL,
    is_removed boolean NOT NULL,
    name character varying(255) NOT NULL,
    status integer NOT NULL,
    category_id integer NOT NULL,
    owner_id integer NOT NULL,
    "photoUrl" character varying(1000) NOT NULL
);


ALTER TABLE public.pet_pet OWNER TO petstore_user;

--
-- Name: pet_pet_id_seq; Type: SEQUENCE; Schema: public; Owner: petstore_user
--

CREATE SEQUENCE public.pet_pet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pet_pet_id_seq OWNER TO petstore_user;

--
-- Name: pet_pet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: petstore_user
--

ALTER SEQUENCE public.pet_pet_id_seq OWNED BY public.pet_pet.id;


--
-- Name: pet_pet_tag; Type: TABLE; Schema: public; Owner: petstore_user
--

CREATE TABLE public.pet_pet_tag (
    id integer NOT NULL,
    pet_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE public.pet_pet_tag OWNER TO petstore_user;

--
-- Name: pet_pet_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: petstore_user
--

CREATE SEQUENCE public.pet_pet_tag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pet_pet_tag_id_seq OWNER TO petstore_user;

--
-- Name: pet_pet_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: petstore_user
--

ALTER SEQUENCE public.pet_pet_tag_id_seq OWNED BY public.pet_pet_tag.id;


--
-- Name: tag_tag; Type: TABLE; Schema: public; Owner: petstore_user
--

CREATE TABLE public.tag_tag (
    id integer NOT NULL,
    is_removed boolean NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.tag_tag OWNER TO petstore_user;

--
-- Name: tag_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: petstore_user
--

CREATE SEQUENCE public.tag_tag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tag_tag_id_seq OWNER TO petstore_user;

--
-- Name: tag_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: petstore_user
--

ALTER SEQUENCE public.tag_tag_id_seq OWNED BY public.tag_tag.id;


--
-- Name: user_user; Type: TABLE; Schema: public; Owner: petstore_user
--

CREATE TABLE public.user_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    phone character varying(100) NOT NULL
);


ALTER TABLE public.user_user OWNER TO petstore_user;

--
-- Name: user_user_groups; Type: TABLE; Schema: public; Owner: petstore_user
--

CREATE TABLE public.user_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.user_user_groups OWNER TO petstore_user;

--
-- Name: user_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: petstore_user
--

CREATE SEQUENCE public.user_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_user_groups_id_seq OWNER TO petstore_user;

--
-- Name: user_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: petstore_user
--

ALTER SEQUENCE public.user_user_groups_id_seq OWNED BY public.user_user_groups.id;


--
-- Name: user_user_id_seq; Type: SEQUENCE; Schema: public; Owner: petstore_user
--

CREATE SEQUENCE public.user_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_user_id_seq OWNER TO petstore_user;

--
-- Name: user_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: petstore_user
--

ALTER SEQUENCE public.user_user_id_seq OWNED BY public.user_user.id;


--
-- Name: user_user_user_permissions; Type: TABLE; Schema: public; Owner: petstore_user
--

CREATE TABLE public.user_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.user_user_user_permissions OWNER TO petstore_user;

--
-- Name: user_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: petstore_user
--

CREATE SEQUENCE public.user_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_user_user_permissions_id_seq OWNER TO petstore_user;

--
-- Name: user_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: petstore_user
--

ALTER SEQUENCE public.user_user_user_permissions_id_seq OWNED BY public.user_user_user_permissions.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: petstore_user
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: petstore_user
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: petstore_user
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: bid_bid id; Type: DEFAULT; Schema: public; Owner: petstore_user
--

ALTER TABLE ONLY public.bid_bid ALTER COLUMN id SET DEFAULT nextval('public.bid_bid_id_seq'::regclass);


--
-- Name: category_category id; Type: DEFAULT; Schema: public; Owner: petstore_user
--

ALTER TABLE ONLY public.category_category ALTER COLUMN id SET DEFAULT nextval('public.category_category_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: petstore_user
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: petstore_user
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: petstore_user
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: pet_bid id; Type: DEFAULT; Schema: public; Owner: petstore_user
--

ALTER TABLE ONLY public.pet_bid ALTER COLUMN id SET DEFAULT nextval('public.pet_bid_id_seq'::regclass);


--
-- Name: pet_pet id; Type: DEFAULT; Schema: public; Owner: petstore_user
--

ALTER TABLE ONLY public.pet_pet ALTER COLUMN id SET DEFAULT nextval('public.pet_pet_id_seq'::regclass);


--
-- Name: pet_pet_tag id; Type: DEFAULT; Schema: public; Owner: petstore_user
--

ALTER TABLE ONLY public.pet_pet_tag ALTER COLUMN id SET DEFAULT nextval('public.pet_pet_tag_id_seq'::regclass);


--
-- Name: tag_tag id; Type: DEFAULT; Schema: public; Owner: petstore_user
--

ALTER TABLE ONLY public.tag_tag ALTER COLUMN id SET DEFAULT nextval('public.tag_tag_id_seq'::regclass);


--
-- Name: user_user id; Type: DEFAULT; Schema: public; Owner: petstore_user
--

ALTER TABLE ONLY public.user_user ALTER COLUMN id SET DEFAULT nextval('public.user_user_id_seq'::regclass);


--
-- Name: user_user_groups id; Type: DEFAULT; Schema: public; Owner: petstore_user
--

ALTER TABLE ONLY public.user_user_groups ALTER COLUMN id SET DEFAULT nextval('public.user_user_groups_id_seq'::regclass);


--
-- Name: user_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: petstore_user
--

ALTER TABLE ONLY public.user_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.user_user_user_permissions_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: petstore_user
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: petstore_user
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: petstore_user
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add Token	6	add_token
22	Can change Token	6	change_token
23	Can delete Token	6	delete_token
24	Can view Token	6	view_token
25	Can add category	7	add_category
26	Can change category	7	change_category
27	Can delete category	7	delete_category
28	Can view category	7	view_category
29	Can add pet	8	add_pet
30	Can change pet	8	change_pet
31	Can delete pet	8	delete_pet
32	Can view pet	8	view_pet
33	Can add tag	9	add_tag
34	Can change tag	9	change_tag
35	Can delete tag	9	delete_tag
36	Can view tag	9	view_tag
37	Can add user	10	add_user
38	Can change user	10	change_user
39	Can delete user	10	delete_user
40	Can view user	10	view_user
41	Can add bid	11	add_bid
42	Can change bid	11	change_bid
43	Can delete bid	11	delete_bid
44	Can view bid	11	view_bid
45	Can add bid	12	add_bid
46	Can change bid	12	change_bid
47	Can delete bid	12	delete_bid
48	Can view bid	12	view_bid
\.


--
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: petstore_user
--

COPY public.authtoken_token (key, created, user_id) FROM stdin;
a210444f685125e48e525703a28c6d37a6bc6e01	2020-02-08 18:33:27.537109+00	1
ed68b4bd5d9d546a7a469146994d6a3661b81576	2020-02-09 15:08:15.53599+00	16
71deb6b384b20d76ad39c0e9bfce98244ffc93ec	2020-02-09 22:03:51.897893+00	17
141c25ca2c6585e8dc2bffda94ff51fd534c62e2	2020-02-09 22:04:19.002135+00	18
303beff77be6faa89716010661d52cbea900aee3	2020-02-09 22:04:32.756835+00	19
\.


--
-- Data for Name: bid_bid; Type: TABLE DATA; Schema: public; Owner: petstore_user
--

COPY public.bid_bid (id, created, modified, is_removed, amount_currency, amount, owner_id, pet_id) FROM stdin;
2	2020-02-09 22:05:56.473986+00	2020-02-09 22:05:56.473986+00	f	USD	500.00	17	1
3	2020-02-09 22:06:25.620298+00	2020-02-09 22:06:25.620298+00	f	USD	280.00	18	1
4	2020-02-09 22:06:46.168277+00	2020-02-09 22:06:46.168277+00	f	USD	320.00	19	1
1	2020-02-09 15:08:38.70521+00	2020-02-09 15:08:38.70521+00	f	USD	100.00	16	1
\.


--
-- Data for Name: category_category; Type: TABLE DATA; Schema: public; Owner: petstore_user
--

COPY public.category_category (id, is_removed, name) FROM stdin;
1	f	Dogs
2	f	TestCategory
3	f	TestCategory
4	f	TestCategory
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: petstore_user
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2020-02-09 00:24:20.116924+00	1	Category object (1)	1	[{"added": {}}]	7	1
2	2020-02-09 00:25:32.046969+00	1	Tag object (1)	1	[{"added": {}}]	9	1
3	2020-02-09 00:25:53.448323+00	2	Tag object (2)	1	[{"added": {}}]	9	1
4	2020-02-09 00:27:56.242337+00	3	Tag object (3)	1	[{"added": {}}]	9	1
5	2020-02-09 00:28:10.569784+00	1	Pet object (1)	1	[{"added": {}}]	8	1
6	2020-02-09 15:05:28.101302+00	16	John Doe	1	[{"added": {}}]	10	1
7	2020-02-09 15:05:42.55095+00	2	Tanya Garcia Jonathan Lewis	3		10	1
8	2020-02-09 16:29:18.792156+00	17	John Smith	1	[{"added": {}}]	10	1
9	2020-02-09 16:30:06.46095+00	18	Sara Conor	1	[{"added": {}}]	10	1
10	2020-02-09 16:31:04.252091+00	19	Martin Fowler	1	[{"added": {}}]	10	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: petstore_user
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	authtoken	token
7	category	category
8	pet	pet
9	tag	tag
10	user	user
11	pet	bid
12	bid	bid
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: petstore_user
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2020-02-08 17:00:21.4412+00
2	contenttypes	0002_remove_content_type_name	2020-02-08 17:00:21.45108+00
3	auth	0001_initial	2020-02-08 17:00:21.473324+00
4	auth	0002_alter_permission_name_max_length	2020-02-08 17:00:21.498006+00
5	auth	0003_alter_user_email_max_length	2020-02-08 17:00:21.504806+00
6	auth	0004_alter_user_username_opts	2020-02-08 17:00:21.511701+00
7	auth	0005_alter_user_last_login_null	2020-02-08 17:00:21.519428+00
8	auth	0006_require_contenttypes_0002	2020-02-08 17:00:21.52295+00
9	auth	0007_alter_validators_add_error_messages	2020-02-08 17:00:21.529671+00
10	auth	0008_alter_user_username_max_length	2020-02-08 17:00:21.536914+00
11	auth	0009_alter_user_last_name_max_length	2020-02-08 17:00:21.544374+00
12	auth	0010_alter_group_name_max_length	2020-02-08 17:00:21.551669+00
13	auth	0011_update_proxy_permissions	2020-02-08 17:00:21.559073+00
14	user	0001_initial	2020-02-08 17:00:21.583913+00
15	admin	0001_initial	2020-02-08 17:00:21.619373+00
16	admin	0002_logentry_remove_auto_add	2020-02-08 17:00:21.638425+00
17	admin	0003_logentry_add_action_flag_choices	2020-02-08 17:00:21.647621+00
18	authtoken	0001_initial	2020-02-08 17:00:21.663223+00
19	authtoken	0002_auto_20160226_1747	2020-02-08 17:00:21.701364+00
20	category	0001_initial	2020-02-08 17:00:21.710006+00
21	tag	0001_initial	2020-02-08 17:00:21.718254+00
22	pet	0001_initial	2020-02-08 17:00:21.726142+00
23	pet	0002_pet_tag	2020-02-08 17:00:21.742292+00
24	sessions	0001_initial	2020-02-08 17:00:21.760226+00
25	user	0002_auto_20200208_1719	2020-02-08 17:19:52.230086+00
26	pet	0003_pet_owner	2020-02-08 20:34:50.23843+00
28	bid	0001_initial	2020-02-08 20:42:59.602642+00
29	pet	0004_pet_photourl	2020-02-09 00:27:32.85173+00
30	pet	0005_auto_20200209_1117	2020-02-09 11:17:42.396476+00
63	pet	0006_auto_20200209_1127	2020-02-09 11:27:25.468531+00
64	pet	0007_auto_20200209_1231	2020-02-09 12:31:20.654089+00
65	bid	0002_auto_20200209_1501	2020-02-09 15:01:28.042395+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: petstore_user
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
7eq00zko6jopr77g67m61finwxj2vh6e	ZDkyYzM2MzkxNDlhODVlZDVkYjhjZjFkNGVkMTE5NDNkNmYyODUwZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxOWY1MThlYzVhYzllOWY0YTQ5YjQ4MjdhZDBiMDkyMTFhMGIxMzRlIn0=	2020-02-23 00:17:16.210469+00
\.


--
-- Data for Name: pet_bid; Type: TABLE DATA; Schema: public; Owner: petstore_user
--

COPY public.pet_bid (id, created, modified, is_removed, amount_currency, amount, owner_id, pet_id) FROM stdin;
\.


--
-- Data for Name: pet_pet; Type: TABLE DATA; Schema: public; Owner: petstore_user
--

COPY public.pet_pet (id, is_removed, name, status, category_id, owner_id, "photoUrl") FROM stdin;
1	f	Davy	0	1	1	https://www.thesprucepets.com/thmb/Y3YzeVk_BajRyfj6wJgbxmaY8bQ=/960x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/GettyImages-763274597-ed21e57e6acb462a8d93dda0da39a7ca.jpg
\.


--
-- Data for Name: pet_pet_tag; Type: TABLE DATA; Schema: public; Owner: petstore_user
--

COPY public.pet_pet_tag (id, pet_id, tag_id) FROM stdin;
1	1	3
\.


--
-- Data for Name: tag_tag; Type: TABLE DATA; Schema: public; Owner: petstore_user
--

COPY public.tag_tag (id, is_removed, name) FROM stdin;
1	f	White
2	f	Colored Eyes
3	f	Husky
4	f	TestTag
\.


--
-- Data for Name: user_user; Type: TABLE DATA; Schema: public; Owner: petstore_user
--

COPY public.user_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, phone) FROM stdin;
1	pbkdf2_sha256$150000$ow6vgzLk5LP5$bXdBSd1G2eifCyK+tg/WSZCF9sSSmvZB6/rNC7R4v/I=	2020-02-09 00:17:16.207095+00	t	yahyaqandel	Yahya\n	Qandel	yahya.qandel@gmail.com	t	t	2020-02-08 18:28:46.594738+00	
16	pbkdf2_sha256$150000$ow6vgzLk5LP5$bXdBSd1G2eifCyK+tg/WSZCF9sSSmvZB6/rNC7R4v/I=	2020-02-01 15:05:13+00	f	john.doe	John	Doe	john.doe@example.com	f	t	2020-02-09 15:03:49+00	01110555540
17	pbkdf2_sha256$150000$ow6vgzLk5LP5$bXdBSd1G2eifCyK+tg/WSZCF9sSSmvZB6/rNC7R4v/I=	2020-02-08 16:27:09+00	f	john.smith	John	Smith	john.smith@example.com	f	t	2020-02-09 16:25:59+00	307-672-0994x9295
18	pbkdf2_sha256$150000$ow6vgzLk5LP5$bXdBSd1G2eifCyK+tg/WSZCF9sSSmvZB6/rNC7R4v/I=	2020-02-08 16:29:37+00	f	sara.conor	Sara	Conor	sara.conor@example.com	f	t	2020-02-09 16:29:23+00	539-153-9462x6513
19	pbkdf2_sha256$150000$ow6vgzLk5LP5$bXdBSd1G2eifCyK+tg/WSZCF9sSSmvZB6/rNC7R4v/I=	\N	f	martin.fowler	Martin	Fowler	martin.fowler@example.com	f	t	2020-02-09 16:30:10+00	947-643-0685
\.


--
-- Data for Name: user_user_groups; Type: TABLE DATA; Schema: public; Owner: petstore_user
--

COPY public.user_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: user_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: petstore_user
--

COPY public.user_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: petstore_user
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: petstore_user
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: petstore_user
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 48, true);


--
-- Name: bid_bid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: petstore_user
--

SELECT pg_catalog.setval('public.bid_bid_id_seq', 4, true);


--
-- Name: category_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: petstore_user
--

SELECT pg_catalog.setval('public.category_category_id_seq', 4, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: petstore_user
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 10, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: petstore_user
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 12, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: petstore_user
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 65, true);


--
-- Name: pet_bid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: petstore_user
--

SELECT pg_catalog.setval('public.pet_bid_id_seq', 1, false);


--
-- Name: pet_pet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: petstore_user
--

SELECT pg_catalog.setval('public.pet_pet_id_seq', 1, true);


--
-- Name: pet_pet_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: petstore_user
--

SELECT pg_catalog.setval('public.pet_pet_tag_id_seq', 1, true);


--
-- Name: tag_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: petstore_user
--

SELECT pg_catalog.setval('public.tag_tag_id_seq', 4, true);


--
-- Name: user_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: petstore_user
--

SELECT pg_catalog.setval('public.user_user_groups_id_seq', 1, false);


--
-- Name: user_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: petstore_user
--

SELECT pg_catalog.setval('public.user_user_id_seq', 19, true);


--
-- Name: user_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: petstore_user
--

SELECT pg_catalog.setval('public.user_user_user_permissions_id_seq', 1, false);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: petstore_user
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: petstore_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: petstore_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: petstore_user
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: petstore_user
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: petstore_user
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: authtoken_token authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: petstore_user
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- Name: authtoken_token authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: petstore_user
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- Name: bid_bid bid_bid_pkey; Type: CONSTRAINT; Schema: public; Owner: petstore_user
--

ALTER TABLE ONLY public.bid_bid
    ADD CONSTRAINT bid_bid_pkey PRIMARY KEY (id);


--
-- Name: category_category category_category_pkey; Type: CONSTRAINT; Schema: public; Owner: petstore_user
--

ALTER TABLE ONLY public.category_category
    ADD CONSTRAINT category_category_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: petstore_user
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: petstore_user
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: petstore_user
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: petstore_user
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: petstore_user
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: pet_bid pet_bid_pkey; Type: CONSTRAINT; Schema: public; Owner: petstore_user
--

ALTER TABLE ONLY public.pet_bid
    ADD CONSTRAINT pet_bid_pkey PRIMARY KEY (id);


--
-- Name: pet_pet pet_pet_pkey; Type: CONSTRAINT; Schema: public; Owner: petstore_user
--

ALTER TABLE ONLY public.pet_pet
    ADD CONSTRAINT pet_pet_pkey PRIMARY KEY (id);


--
-- Name: pet_pet_tag pet_pet_tag_pet_id_tag_id_e78faf6d_uniq; Type: CONSTRAINT; Schema: public; Owner: petstore_user
--

ALTER TABLE ONLY public.pet_pet_tag
    ADD CONSTRAINT pet_pet_tag_pet_id_tag_id_e78faf6d_uniq UNIQUE (pet_id, tag_id);


--
-- Name: pet_pet_tag pet_pet_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: petstore_user
--

ALTER TABLE ONLY public.pet_pet_tag
    ADD CONSTRAINT pet_pet_tag_pkey PRIMARY KEY (id);


--
-- Name: tag_tag tag_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: petstore_user
--

ALTER TABLE ONLY public.tag_tag
    ADD CONSTRAINT tag_tag_pkey PRIMARY KEY (id);


--
-- Name: user_user_groups user_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: petstore_user
--

ALTER TABLE ONLY public.user_user_groups
    ADD CONSTRAINT user_user_groups_pkey PRIMARY KEY (id);


--
-- Name: user_user_groups user_user_groups_user_id_group_id_bb60391f_uniq; Type: CONSTRAINT; Schema: public; Owner: petstore_user
--

ALTER TABLE ONLY public.user_user_groups
    ADD CONSTRAINT user_user_groups_user_id_group_id_bb60391f_uniq UNIQUE (user_id, group_id);


--
-- Name: user_user user_user_phone_key; Type: CONSTRAINT; Schema: public; Owner: petstore_user
--

ALTER TABLE ONLY public.user_user
    ADD CONSTRAINT user_user_phone_key UNIQUE (phone);


--
-- Name: user_user user_user_pkey; Type: CONSTRAINT; Schema: public; Owner: petstore_user
--

ALTER TABLE ONLY public.user_user
    ADD CONSTRAINT user_user_pkey PRIMARY KEY (id);


--
-- Name: user_user_user_permissions user_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: petstore_user
--

ALTER TABLE ONLY public.user_user_user_permissions
    ADD CONSTRAINT user_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: user_user_user_permissions user_user_user_permissions_user_id_permission_id_64f4d5b8_uniq; Type: CONSTRAINT; Schema: public; Owner: petstore_user
--

ALTER TABLE ONLY public.user_user_user_permissions
    ADD CONSTRAINT user_user_user_permissions_user_id_permission_id_64f4d5b8_uniq UNIQUE (user_id, permission_id);


--
-- Name: user_user user_user_username_key; Type: CONSTRAINT; Schema: public; Owner: petstore_user
--

ALTER TABLE ONLY public.user_user
    ADD CONSTRAINT user_user_username_key UNIQUE (username);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: petstore_user
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: petstore_user
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: petstore_user
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: petstore_user
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: petstore_user
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON public.authtoken_token USING btree (key varchar_pattern_ops);


--
-- Name: bid_bid_owner_id_ec86186d; Type: INDEX; Schema: public; Owner: petstore_user
--

CREATE INDEX bid_bid_owner_id_ec86186d ON public.bid_bid USING btree (owner_id);


--
-- Name: bid_bid_pet_id_c0517486; Type: INDEX; Schema: public; Owner: petstore_user
--

CREATE INDEX bid_bid_pet_id_c0517486 ON public.bid_bid USING btree (pet_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: petstore_user
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: petstore_user
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: petstore_user
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: petstore_user
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: pet_bid_owner_id_d18e191a; Type: INDEX; Schema: public; Owner: petstore_user
--

CREATE INDEX pet_bid_owner_id_d18e191a ON public.pet_bid USING btree (owner_id);


--
-- Name: pet_bid_pet_id_b9763d39; Type: INDEX; Schema: public; Owner: petstore_user
--

CREATE INDEX pet_bid_pet_id_b9763d39 ON public.pet_bid USING btree (pet_id);


--
-- Name: pet_pet_category_id_90c8e794; Type: INDEX; Schema: public; Owner: petstore_user
--

CREATE INDEX pet_pet_category_id_90c8e794 ON public.pet_pet USING btree (category_id);


--
-- Name: pet_pet_owner_id_7aa352c1; Type: INDEX; Schema: public; Owner: petstore_user
--

CREATE INDEX pet_pet_owner_id_7aa352c1 ON public.pet_pet USING btree (owner_id);


--
-- Name: pet_pet_tag_pet_id_6bf950be; Type: INDEX; Schema: public; Owner: petstore_user
--

CREATE INDEX pet_pet_tag_pet_id_6bf950be ON public.pet_pet_tag USING btree (pet_id);


--
-- Name: pet_pet_tag_tag_id_40026939; Type: INDEX; Schema: public; Owner: petstore_user
--

CREATE INDEX pet_pet_tag_tag_id_40026939 ON public.pet_pet_tag USING btree (tag_id);


--
-- Name: user_user_groups_group_id_c57f13c0; Type: INDEX; Schema: public; Owner: petstore_user
--

CREATE INDEX user_user_groups_group_id_c57f13c0 ON public.user_user_groups USING btree (group_id);


--
-- Name: user_user_groups_user_id_13f9a20d; Type: INDEX; Schema: public; Owner: petstore_user
--

CREATE INDEX user_user_groups_user_id_13f9a20d ON public.user_user_groups USING btree (user_id);


--
-- Name: user_user_phone_9279a142_like; Type: INDEX; Schema: public; Owner: petstore_user
--

CREATE INDEX user_user_phone_9279a142_like ON public.user_user USING btree (phone varchar_pattern_ops);


--
-- Name: user_user_user_permissions_permission_id_ce49d4de; Type: INDEX; Schema: public; Owner: petstore_user
--

CREATE INDEX user_user_user_permissions_permission_id_ce49d4de ON public.user_user_user_permissions USING btree (permission_id);


--
-- Name: user_user_user_permissions_user_id_31782f58; Type: INDEX; Schema: public; Owner: petstore_user
--

CREATE INDEX user_user_user_permissions_user_id_31782f58 ON public.user_user_user_permissions USING btree (user_id);


--
-- Name: user_user_username_e2bdfe0c_like; Type: INDEX; Schema: public; Owner: petstore_user
--

CREATE INDEX user_user_username_e2bdfe0c_like ON public.user_user USING btree (username varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: petstore_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: petstore_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: petstore_user
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtoken_token authtoken_token_user_id_35299eff_fk_user_user_id; Type: FK CONSTRAINT; Schema: public; Owner: petstore_user
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_user_user_id FOREIGN KEY (user_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bid_bid bid_bid_owner_id_ec86186d_fk_user_user_id; Type: FK CONSTRAINT; Schema: public; Owner: petstore_user
--

ALTER TABLE ONLY public.bid_bid
    ADD CONSTRAINT bid_bid_owner_id_ec86186d_fk_user_user_id FOREIGN KEY (owner_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: bid_bid bid_bid_pet_id_c0517486_fk_pet_pet_id; Type: FK CONSTRAINT; Schema: public; Owner: petstore_user
--

ALTER TABLE ONLY public.bid_bid
    ADD CONSTRAINT bid_bid_pet_id_c0517486_fk_pet_pet_id FOREIGN KEY (pet_id) REFERENCES public.pet_pet(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: petstore_user
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_user_user_id; Type: FK CONSTRAINT; Schema: public; Owner: petstore_user
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_user_user_id FOREIGN KEY (user_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pet_bid pet_bid_owner_id_d18e191a_fk_user_user_id; Type: FK CONSTRAINT; Schema: public; Owner: petstore_user
--

ALTER TABLE ONLY public.pet_bid
    ADD CONSTRAINT pet_bid_owner_id_d18e191a_fk_user_user_id FOREIGN KEY (owner_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pet_bid pet_bid_pet_id_b9763d39_fk_pet_pet_id; Type: FK CONSTRAINT; Schema: public; Owner: petstore_user
--

ALTER TABLE ONLY public.pet_bid
    ADD CONSTRAINT pet_bid_pet_id_b9763d39_fk_pet_pet_id FOREIGN KEY (pet_id) REFERENCES public.pet_pet(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pet_pet pet_pet_category_id_90c8e794_fk_category_category_id; Type: FK CONSTRAINT; Schema: public; Owner: petstore_user
--

ALTER TABLE ONLY public.pet_pet
    ADD CONSTRAINT pet_pet_category_id_90c8e794_fk_category_category_id FOREIGN KEY (category_id) REFERENCES public.category_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pet_pet pet_pet_owner_id_7aa352c1_fk_user_user_id; Type: FK CONSTRAINT; Schema: public; Owner: petstore_user
--

ALTER TABLE ONLY public.pet_pet
    ADD CONSTRAINT pet_pet_owner_id_7aa352c1_fk_user_user_id FOREIGN KEY (owner_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pet_pet_tag pet_pet_tag_pet_id_6bf950be_fk_pet_pet_id; Type: FK CONSTRAINT; Schema: public; Owner: petstore_user
--

ALTER TABLE ONLY public.pet_pet_tag
    ADD CONSTRAINT pet_pet_tag_pet_id_6bf950be_fk_pet_pet_id FOREIGN KEY (pet_id) REFERENCES public.pet_pet(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pet_pet_tag pet_pet_tag_tag_id_40026939_fk_tag_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: petstore_user
--

ALTER TABLE ONLY public.pet_pet_tag
    ADD CONSTRAINT pet_pet_tag_tag_id_40026939_fk_tag_tag_id FOREIGN KEY (tag_id) REFERENCES public.tag_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_user_groups user_user_groups_group_id_c57f13c0_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: petstore_user
--

ALTER TABLE ONLY public.user_user_groups
    ADD CONSTRAINT user_user_groups_group_id_c57f13c0_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_user_groups user_user_groups_user_id_13f9a20d_fk_user_user_id; Type: FK CONSTRAINT; Schema: public; Owner: petstore_user
--

ALTER TABLE ONLY public.user_user_groups
    ADD CONSTRAINT user_user_groups_user_id_13f9a20d_fk_user_user_id FOREIGN KEY (user_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_user_user_permissions user_user_user_permi_permission_id_ce49d4de_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: petstore_user
--

ALTER TABLE ONLY public.user_user_user_permissions
    ADD CONSTRAINT user_user_user_permi_permission_id_ce49d4de_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_user_user_permissions user_user_user_permissions_user_id_31782f58_fk_user_user_id; Type: FK CONSTRAINT; Schema: public; Owner: petstore_user
--

ALTER TABLE ONLY public.user_user_user_permissions
    ADD CONSTRAINT user_user_user_permissions_user_id_31782f58_fk_user_user_id FOREIGN KEY (user_id) REFERENCES public.user_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

