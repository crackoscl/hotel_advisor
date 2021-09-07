--
-- PostgreSQL database dump
--

-- Dumped from database version 12.6 (Ubuntu 12.6-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.6 (Ubuntu 12.6-0ubuntu0.20.04.1)

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
-- Name: app_atributos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_atributos (
    id bigint NOT NULL,
    nombre character varying(50) NOT NULL
);


ALTER TABLE public.app_atributos OWNER TO postgres;

--
-- Name: app_atributos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.app_atributos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_atributos_id_seq OWNER TO postgres;

--
-- Name: app_atributos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.app_atributos_id_seq OWNED BY public.app_atributos.id;


--
-- Name: app_comentarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_comentarios (
    id bigint NOT NULL,
    nombre_usuario character varying(50) NOT NULL,
    "Comentario" text NOT NULL,
    fecha timestamp with time zone NOT NULL,
    id_hotel_id bigint
);


ALTER TABLE public.app_comentarios OWNER TO postgres;

--
-- Name: app_comentarios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.app_comentarios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_comentarios_id_seq OWNER TO postgres;

--
-- Name: app_comentarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.app_comentarios_id_seq OWNED BY public.app_comentarios.id;


--
-- Name: app_hoteles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_hoteles (
    id bigint NOT NULL,
    nombre character varying(50) NOT NULL,
    descripcion character varying(200) NOT NULL,
    calificacion numeric(11,2) NOT NULL,
    cant_votos integer NOT NULL
);


ALTER TABLE public.app_hoteles OWNER TO postgres;

--
-- Name: app_hoteles_atributos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_hoteles_atributos (
    id bigint NOT NULL,
    hoteles_id bigint NOT NULL,
    atributos_id bigint NOT NULL
);


ALTER TABLE public.app_hoteles_atributos OWNER TO postgres;

--
-- Name: app_hoteles_atributos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.app_hoteles_atributos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_hoteles_atributos_id_seq OWNER TO postgres;

--
-- Name: app_hoteles_atributos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.app_hoteles_atributos_id_seq OWNED BY public.app_hoteles_atributos.id;


--
-- Name: app_hoteles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.app_hoteles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_hoteles_id_seq OWNER TO postgres;

--
-- Name: app_hoteles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.app_hoteles_id_seq OWNED BY public.app_hoteles.id;


--
-- Name: app_usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_usuario (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    apellido_paterno character varying(50),
    apellido_materno character varying(50),
    rol character varying(50) NOT NULL
);


ALTER TABLE public.app_usuario OWNER TO postgres;

--
-- Name: app_usuario_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_usuario_groups (
    id bigint NOT NULL,
    usuario_id bigint NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.app_usuario_groups OWNER TO postgres;

--
-- Name: app_usuario_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.app_usuario_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_usuario_groups_id_seq OWNER TO postgres;

--
-- Name: app_usuario_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.app_usuario_groups_id_seq OWNED BY public.app_usuario_groups.id;


--
-- Name: app_usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.app_usuario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_usuario_id_seq OWNER TO postgres;

--
-- Name: app_usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.app_usuario_id_seq OWNED BY public.app_usuario.id;


--
-- Name: app_usuario_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_usuario_user_permissions (
    id bigint NOT NULL,
    usuario_id bigint NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.app_usuario_user_permissions OWNER TO postgres;

--
-- Name: app_usuario_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.app_usuario_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_usuario_user_permissions_id_seq OWNER TO postgres;

--
-- Name: app_usuario_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.app_usuario_user_permissions_id_seq OWNED BY public.app_usuario_user_permissions.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id bigint NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: app_atributos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_atributos ALTER COLUMN id SET DEFAULT nextval('public.app_atributos_id_seq'::regclass);


--
-- Name: app_comentarios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_comentarios ALTER COLUMN id SET DEFAULT nextval('public.app_comentarios_id_seq'::regclass);


--
-- Name: app_hoteles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_hoteles ALTER COLUMN id SET DEFAULT nextval('public.app_hoteles_id_seq'::regclass);


--
-- Name: app_hoteles_atributos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_hoteles_atributos ALTER COLUMN id SET DEFAULT nextval('public.app_hoteles_atributos_id_seq'::regclass);


--
-- Name: app_usuario id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_usuario ALTER COLUMN id SET DEFAULT nextval('public.app_usuario_id_seq'::regclass);


--
-- Name: app_usuario_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_usuario_groups ALTER COLUMN id SET DEFAULT nextval('public.app_usuario_groups_id_seq'::regclass);


--
-- Name: app_usuario_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_usuario_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.app_usuario_user_permissions_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Data for Name: app_atributos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_atributos (id, nombre) FROM stdin;
6	Mucama: SI
8	Acepta Recervas : Con 24 horas
10	Traslado aeropuerto: Si
9	Habitaciones : Para 2,4,6 y 8 personas
7	Acepta Tarjetas de Credito : SI
5	Wifi-Gratis
4	Estacionamientos: SI
\.


--
-- Data for Name: app_comentarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_comentarios (id, nombre_usuario, "Comentario", fecha, id_hotel_id) FROM stdin;
\.


--
-- Data for Name: app_hoteles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_hoteles (id, nombre, descripcion, calificacion, cant_votos) FROM stdin;
3	Hotel Doña Juana	Hotel con excelente comida	5.00	2
2	Hotel Pedrito	Amplio hotel con wenas piezas	5.00	2
1	Hotel Miramar	Amplio hotel con wenas camas	2.00	2
\.


--
-- Data for Name: app_hoteles_atributos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_hoteles_atributos (id, hoteles_id, atributos_id) FROM stdin;
4	3	9
5	3	4
6	3	6
7	3	7
8	2	5
9	2	6
10	2	7
11	2	8
12	2	9
13	2	10
14	1	8
15	1	10
16	1	5
17	1	6
\.


--
-- Data for Name: app_usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_usuario (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, apellido_paterno, apellido_materno, rol) FROM stdin;
3	1234	2021-04-17 12:02:59-04	f	Mariela23	Mariela	Lara	mariela@gmail.com	f	t	2021-04-17 12:02:48-04	Lara	Lopez	pasajero)
4	1234	2021-04-17 12:03:53-04	f	Pedro2121	Pedro	Millao	millao?@gmail.com	f	t	2021-04-17 12:03:45-04	Millao	lara	pasajero)
1	pbkdf2_sha256$260000$by7dnJV04ZHnyc2zMQsdZ9$JnadskrYtuQZZhc6NnrBbcPi0EVA9OXDuIS6eTur1Ho=	2021-04-17 15:40:57.874281-04	t	admin				t	t	2021-04-17 10:35:37.302427-04	\N	\N	
2	1234	2021-04-17 12:02:05-04	f	Juanito2	Juan	Lopez	junito@gmail.com	f	t	2021-04-17 12:01:42-04	lopez	lara	pasajero)
\.


--
-- Data for Name: app_usuario_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_usuario_groups (id, usuario_id, group_id) FROM stdin;
\.


--
-- Data for Name: app_usuario_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_usuario_user_permissions (id, usuario_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add permission	1	add_permission
2	Can change permission	1	change_permission
3	Can delete permission	1	delete_permission
4	Can view permission	1	view_permission
5	Can add group	2	add_group
6	Can change group	2	change_group
7	Can delete group	2	delete_group
8	Can view group	2	view_group
9	Can add content type	3	add_contenttype
10	Can change content type	3	change_contenttype
11	Can delete content type	3	delete_contenttype
12	Can view content type	3	view_contenttype
13	Can add atributos	4	add_atributos
14	Can change atributos	4	change_atributos
15	Can delete atributos	4	delete_atributos
16	Can view atributos	4	view_atributos
17	Can add hoteles	5	add_hoteles
18	Can change hoteles	5	change_hoteles
19	Can delete hoteles	5	delete_hoteles
20	Can view hoteles	5	view_hoteles
21	Can add comentarios	6	add_comentarios
22	Can change comentarios	6	change_comentarios
23	Can delete comentarios	6	delete_comentarios
24	Can view comentarios	6	view_comentarios
25	Can add user	7	add_usuario
26	Can change user	7	change_usuario
27	Can delete user	7	delete_usuario
28	Can view user	7	view_usuario
29	Can add log entry	8	add_logentry
30	Can change log entry	8	change_logentry
31	Can delete log entry	8	delete_logentry
32	Can view log entry	8	view_logentry
33	Can add session	9	add_session
34	Can change session	9	change_session
35	Can delete session	9	delete_session
36	Can view session	9	view_session
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2021-04-17 12:02:48.04254-04	2	Junito2	1	[{"added": {}}]	7	1
2	2021-04-17 12:03:45.704097-04	3	Mariela23	1	[{"added": {}}]	7	1
3	2021-04-17 12:04:37.153467-04	4	Pedro2121	1	[{"added": {}}]	7	1
4	2021-04-17 12:06:04.160704-04	1	Atributos object (1)	1	[{"added": {}}]	4	1
5	2021-04-17 12:06:16.125928-04	2	Atributos object (2)	1	[{"added": {}}]	4	1
6	2021-04-17 12:07:16.233364-04	1	Hotel Miramar	1	[{"added": {}}]	5	1
7	2021-04-17 12:07:37.192377-04	2	Hotel Pedrito	1	[{"added": {}}]	5	1
8	2021-04-17 12:08:42.150329-04	3	sala star 2	1	[{"added": {}}]	4	1
9	2021-04-17 12:08:45.158545-04	3	Hotel Doña Juana	1	[{"added": {}}]	5	1
10	2021-04-17 14:03:10.284982-04	3	sala star 2	3		4	1
11	2021-04-17 14:03:10.286657-04	2	3 Baños	3		4	1
12	2021-04-17 14:03:10.287645-04	1	Cama  2 Plazas	3		4	1
13	2021-04-17 14:03:42.238691-04	4	Estacionamientos: SI	1	[{"added": {}}]	4	1
14	2021-04-17 14:03:53.894993-04	5	Wifi-Gratis	1	[{"added": {}}]	4	1
15	2021-04-17 14:04:03.096337-04	6	Mucama: SI	1	[{"added": {}}]	4	1
16	2021-04-17 14:04:18.724824-04	7	Acepta Tarjetas de Credito : SI	1	[{"added": {}}]	4	1
17	2021-04-17 14:04:37.282118-04	8	Acepta Recervas : Con 24 horas	1	[{"added": {}}]	4	1
18	2021-04-17 14:05:05.054534-04	9	Habitaciones : Para 2,4,6 y 8 personas	1	[{"added": {}}]	4	1
19	2021-04-17 14:05:27.458775-04	10	Traslado aeropuerto: Si	1	[{"added": {}}]	4	1
20	2021-04-17 14:05:51.60429-04	3	Hotel Doña Juana	2	[{"changed": {"fields": ["Atributos"]}}]	5	1
21	2021-04-17 14:05:58.212114-04	2	Hotel Pedrito	2	[{"changed": {"fields": ["Atributos"]}}]	5	1
22	2021-04-17 14:06:09.218079-04	1	Hotel Miramar	2	[{"changed": {"fields": ["Atributos"]}}]	5	1
23	2021-04-17 14:42:33.135238-04	3	Hotel Doña Juana	2	[]	5	1
24	2021-04-17 14:42:38.946348-04	2	Hotel Pedrito	2	[]	5	1
25	2021-04-17 14:42:43.441107-04	1	Hotel Miramar	2	[]	5	1
26	2021-04-17 14:43:03.388223-04	10	Traslado aeropuerto: Si	2	[]	4	1
27	2021-04-17 14:43:10.558049-04	9	Habitaciones : Para 2,4,6 y 8 personas	2	[]	4	1
28	2021-04-17 14:43:16.443308-04	7	Acepta Tarjetas de Credito : SI	2	[]	4	1
29	2021-04-17 14:43:21.900264-04	5	Wifi-Gratis	2	[]	4	1
30	2021-04-17 14:43:24.806744-04	4	Estacionamientos: SI	2	[]	4	1
31	2021-04-17 14:43:26.527247-04	4	Estacionamientos: SI	2	[]	4	1
32	2021-04-17 14:43:27.22087-04	4	Estacionamientos: SI	2	[]	4	1
33	2021-04-17 14:43:27.693766-04	4	Estacionamientos: SI	2	[]	4	1
34	2021-04-17 14:43:28.855165-04	4	Estacionamientos: SI	2	[]	4	1
35	2021-04-17 15:41:21.008358-04	2	Juanito2	2	[{"changed": {"fields": ["Username"]}}]	7	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	auth	permission
2	auth	group
3	contenttypes	contenttype
4	app	atributos
5	app	hoteles
6	app	comentarios
7	app	usuario
8	admin	logentry
9	sessions	session
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2021-04-17 10:32:37.29844-04
2	contenttypes	0002_remove_content_type_name	2021-04-17 10:34:17.898535-04
3	auth	0001_initial	2021-04-17 10:34:17.939863-04
4	auth	0002_alter_permission_name_max_length	2021-04-17 10:34:17.945908-04
5	auth	0003_alter_user_email_max_length	2021-04-17 10:34:17.95293-04
6	auth	0004_alter_user_username_opts	2021-04-17 10:34:17.960018-04
7	auth	0005_alter_user_last_login_null	2021-04-17 10:34:17.965856-04
8	auth	0006_require_contenttypes_0002	2021-04-17 10:34:17.968558-04
9	auth	0007_alter_validators_add_error_messages	2021-04-17 10:34:17.975182-04
10	auth	0008_alter_user_username_max_length	2021-04-17 10:34:17.98192-04
11	auth	0009_alter_user_last_name_max_length	2021-04-17 10:34:17.990537-04
12	auth	0010_alter_group_name_max_length	2021-04-17 10:34:18.000369-04
13	auth	0011_update_proxy_permissions	2021-04-17 10:34:18.007196-04
14	auth	0012_alter_user_first_name_max_length	2021-04-17 10:34:18.014021-04
15	app	0001_initial	2021-04-17 10:34:18.081563-04
16	admin	0001_initial	2021-04-17 10:34:21.69511-04
17	admin	0002_logentry_remove_auto_add	2021-04-17 10:34:21.704419-04
18	admin	0003_logentry_add_action_flag_choices	2021-04-17 10:34:21.713328-04
19	sessions	0001_initial	2021-04-17 10:34:21.725692-04
20	app	0002_alter_hoteles_atributos	2021-04-17 14:21:25.760458-04
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
4fceffddcxptjq63o4xlbc176ttbih02	.eJxVjEEOwiAQRe_C2hCmpSN16b5nIMPASNVAUtqV8e7apAvd_vfefylP25r91tLi56guCtTpdwvEj1R2EO9UblVzLesyB70r-qBNTzWm5_Vw_w4ytfytOwFjDbtAPbETJjck5wCR2cIoXRKBM9mAGJHBoEEr5ETYDNQLjOr9AfT3OF0:1lXqoL:w1USx4KFcEL-_8j6MMVRmFMmiw5YQ2bblFb1tLCxmoY	2021-05-01 15:40:57.876115-04
\.


--
-- Name: app_atributos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_atributos_id_seq', 10, true);


--
-- Name: app_comentarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_comentarios_id_seq', 1, false);


--
-- Name: app_hoteles_atributos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_hoteles_atributos_id_seq', 17, true);


--
-- Name: app_hoteles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_hoteles_id_seq', 3, true);


--
-- Name: app_usuario_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_usuario_groups_id_seq', 1, false);


--
-- Name: app_usuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_usuario_id_seq', 4, true);


--
-- Name: app_usuario_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_usuario_user_permissions_id_seq', 1, false);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 36, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 35, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 9, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 20, true);


--
-- Name: app_atributos app_atributos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_atributos
    ADD CONSTRAINT app_atributos_pkey PRIMARY KEY (id);


--
-- Name: app_comentarios app_comentarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_comentarios
    ADD CONSTRAINT app_comentarios_pkey PRIMARY KEY (id);


--
-- Name: app_hoteles_atributos app_hoteles_atributos_hoteles_id_atributos_id_a6099c00_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_hoteles_atributos
    ADD CONSTRAINT app_hoteles_atributos_hoteles_id_atributos_id_a6099c00_uniq UNIQUE (hoteles_id, atributos_id);


--
-- Name: app_hoteles_atributos app_hoteles_atributos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_hoteles_atributos
    ADD CONSTRAINT app_hoteles_atributos_pkey PRIMARY KEY (id);


--
-- Name: app_hoteles app_hoteles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_hoteles
    ADD CONSTRAINT app_hoteles_pkey PRIMARY KEY (id);


--
-- Name: app_usuario_groups app_usuario_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_usuario_groups
    ADD CONSTRAINT app_usuario_groups_pkey PRIMARY KEY (id);


--
-- Name: app_usuario_groups app_usuario_groups_usuario_id_group_id_0f4abc88_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_usuario_groups
    ADD CONSTRAINT app_usuario_groups_usuario_id_group_id_0f4abc88_uniq UNIQUE (usuario_id, group_id);


--
-- Name: app_usuario app_usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_usuario
    ADD CONSTRAINT app_usuario_pkey PRIMARY KEY (id);


--
-- Name: app_usuario_user_permissions app_usuario_user_permiss_usuario_id_permission_id_6fd11793_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_usuario_user_permissions
    ADD CONSTRAINT app_usuario_user_permiss_usuario_id_permission_id_6fd11793_uniq UNIQUE (usuario_id, permission_id);


--
-- Name: app_usuario_user_permissions app_usuario_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_usuario_user_permissions
    ADD CONSTRAINT app_usuario_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: app_usuario app_usuario_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_usuario
    ADD CONSTRAINT app_usuario_username_key UNIQUE (username);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: app_comentarios_id_hotel_id_006d5006; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX app_comentarios_id_hotel_id_006d5006 ON public.app_comentarios USING btree (id_hotel_id);


--
-- Name: app_hoteles_atributos_atributos_id_cf1ffa3d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX app_hoteles_atributos_atributos_id_cf1ffa3d ON public.app_hoteles_atributos USING btree (atributos_id);


--
-- Name: app_hoteles_atributos_hoteles_id_2b4c6bc6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX app_hoteles_atributos_hoteles_id_2b4c6bc6 ON public.app_hoteles_atributos USING btree (hoteles_id);


--
-- Name: app_usuario_groups_group_id_b38b0d6e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX app_usuario_groups_group_id_b38b0d6e ON public.app_usuario_groups USING btree (group_id);


--
-- Name: app_usuario_groups_usuario_id_691971dd; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX app_usuario_groups_usuario_id_691971dd ON public.app_usuario_groups USING btree (usuario_id);


--
-- Name: app_usuario_user_permissions_permission_id_fbaf8fa8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX app_usuario_user_permissions_permission_id_fbaf8fa8 ON public.app_usuario_user_permissions USING btree (permission_id);


--
-- Name: app_usuario_user_permissions_usuario_id_d2c76ed5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX app_usuario_user_permissions_usuario_id_d2c76ed5 ON public.app_usuario_user_permissions USING btree (usuario_id);


--
-- Name: app_usuario_username_d38d29c4_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX app_usuario_username_d38d29c4_like ON public.app_usuario USING btree (username varchar_pattern_ops);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: app_comentarios app_comentarios_id_hotel_id_006d5006_fk_app_hoteles_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_comentarios
    ADD CONSTRAINT app_comentarios_id_hotel_id_006d5006_fk_app_hoteles_id FOREIGN KEY (id_hotel_id) REFERENCES public.app_hoteles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_hoteles_atributos app_hoteles_atributos_atributos_id_cf1ffa3d_fk_app_atributos_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_hoteles_atributos
    ADD CONSTRAINT app_hoteles_atributos_atributos_id_cf1ffa3d_fk_app_atributos_id FOREIGN KEY (atributos_id) REFERENCES public.app_atributos(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_hoteles_atributos app_hoteles_atributos_hoteles_id_2b4c6bc6_fk_app_hoteles_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_hoteles_atributos
    ADD CONSTRAINT app_hoteles_atributos_hoteles_id_2b4c6bc6_fk_app_hoteles_id FOREIGN KEY (hoteles_id) REFERENCES public.app_hoteles(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_usuario_groups app_usuario_groups_group_id_b38b0d6e_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_usuario_groups
    ADD CONSTRAINT app_usuario_groups_group_id_b38b0d6e_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_usuario_groups app_usuario_groups_usuario_id_691971dd_fk_app_usuario_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_usuario_groups
    ADD CONSTRAINT app_usuario_groups_usuario_id_691971dd_fk_app_usuario_id FOREIGN KEY (usuario_id) REFERENCES public.app_usuario(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_usuario_user_permissions app_usuario_user_per_permission_id_fbaf8fa8_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_usuario_user_permissions
    ADD CONSTRAINT app_usuario_user_per_permission_id_fbaf8fa8_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: app_usuario_user_permissions app_usuario_user_per_usuario_id_d2c76ed5_fk_app_usuar; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_usuario_user_permissions
    ADD CONSTRAINT app_usuario_user_per_usuario_id_d2c76ed5_fk_app_usuar FOREIGN KEY (usuario_id) REFERENCES public.app_usuario(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_app_usuario_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_app_usuario_id FOREIGN KEY (user_id) REFERENCES public.app_usuario(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

