--
-- PostgreSQL database dump
--

-- Dumped from database version 16.8
-- Dumped by pg_dump version 16.8

-- Started on 2025-07-14 13:57:04

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
-- TOC entry 244 (class 1259 OID 948226)
-- Name: audit_log; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.audit_log (
    id integer NOT NULL,
    table_name character varying(50) NOT NULL,
    record_id integer NOT NULL,
    action character varying(10) NOT NULL,
    old_data jsonb,
    new_data jsonb,
    changed_by integer,
    changed_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    ip_address character varying(45)
);


--
-- TOC entry 243 (class 1259 OID 948225)
-- Name: audit_log_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.audit_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5349 (class 0 OID 0)
-- Dependencies: 243
-- Name: audit_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.audit_log_id_seq OWNED BY public.audit_log.id;


--
-- TOC entry 283 (class 1259 OID 949752)
-- Name: charges; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.charges (
    id integer NOT NULL,
    charge_id integer NOT NULL,
    charge_description character varying(60) NOT NULL
);


--
-- TOC entry 282 (class 1259 OID 949751)
-- Name: charges_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.charges_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5350 (class 0 OID 0)
-- Dependencies: 282
-- Name: charges_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.charges_id_seq OWNED BY public.charges.id;


--
-- TOC entry 235 (class 1259 OID 41483)
-- Name: countries; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.countries (
    id integer NOT NULL,
    iso character varying(2) NOT NULL,
    nombre character varying(100) NOT NULL,
    create_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- TOC entry 234 (class 1259 OID 41482)
-- Name: countries_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.countries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5351 (class 0 OID 0)
-- Dependencies: 234
-- Name: countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.countries_id_seq OWNED BY public.countries.id;


--
-- TOC entry 287 (class 1259 OID 949769)
-- Name: dependence; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dependence (
    id integer NOT NULL,
    dependence_id integer NOT NULL,
    name character varying(90) NOT NULL,
    region_id integer NOT NULL
);


--
-- TOC entry 286 (class 1259 OID 949768)
-- Name: dependence_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dependence_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5352 (class 0 OID 0)
-- Dependencies: 286
-- Name: dependence_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dependence_id_seq OWNED BY public.dependence.id;


--
-- TOC entry 227 (class 1259 OID 41435)
-- Name: genders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.genders (
    id integer NOT NULL,
    gender_name text NOT NULL,
    create_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 41434)
-- Name: genders_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.genders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5353 (class 0 OID 0)
-- Dependencies: 226
-- Name: genders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.genders_id_seq OWNED BY public.genders.id;


--
-- TOC entry 221 (class 1259 OID 41385)
-- Name: groups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.groups (
    id integer NOT NULL,
    name character varying(20) NOT NULL,
    description character varying(100) NOT NULL,
    CONSTRAINT check_id CHECK ((id >= 0))
);


--
-- TOC entry 220 (class 1259 OID 41384)
-- Name: groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5354 (class 0 OID 0)
-- Dependencies: 220
-- Name: groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.groups_id_seq OWNED BY public.groups.id;


--
-- TOC entry 231 (class 1259 OID 41467)
-- Name: login_attempts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.login_attempts (
    id integer NOT NULL,
    ip_address character varying(45),
    login character varying(100) NOT NULL,
    "time" integer,
    CONSTRAINT check_id CHECK ((id >= 0))
);


--
-- TOC entry 230 (class 1259 OID 41466)
-- Name: login_attempts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.login_attempts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5355 (class 0 OID 0)
-- Dependencies: 230
-- Name: login_attempts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.login_attempts_id_seq OWNED BY public.login_attempts.id;


--
-- TOC entry 240 (class 1259 OID 948191)
-- Name: logs_activity; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.logs_activity (
    id integer NOT NULL,
    ip_address character varying(45),
    title character varying(50) NOT NULL,
    description text NOT NULL,
    create_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
)
PARTITION BY RANGE (create_at);


--
-- TOC entry 239 (class 1259 OID 948190)
-- Name: logs_activity_partitioned_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.logs_activity_partitioned_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5356 (class 0 OID 0)
-- Dependencies: 239
-- Name: logs_activity_partitioned_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.logs_activity_partitioned_id_seq OWNED BY public.logs_activity.id;


--
-- TOC entry 241 (class 1259 OID 948196)
-- Name: logs_activity_y2025q1; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.logs_activity_y2025q1 (
    id integer DEFAULT nextval('public.logs_activity_partitioned_id_seq'::regclass) NOT NULL,
    ip_address character varying(45),
    title character varying(50) NOT NULL,
    description text NOT NULL,
    create_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- TOC entry 242 (class 1259 OID 948203)
-- Name: logs_activity_y2025q2; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.logs_activity_y2025q2 (
    id integer DEFAULT nextval('public.logs_activity_partitioned_id_seq'::regclass) NOT NULL,
    ip_address character varying(45),
    title character varying(50) NOT NULL,
    description text NOT NULL,
    create_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- TOC entry 265 (class 1259 OID 948625)
-- Name: logs_activity_y2025q3; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.logs_activity_y2025q3 (
    id integer DEFAULT nextval('public.logs_activity_partitioned_id_seq'::regclass) NOT NULL,
    ip_address character varying(45),
    title character varying(50) NOT NULL,
    description text NOT NULL,
    create_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- TOC entry 266 (class 1259 OID 948633)
-- Name: logs_activity_y2025q4; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.logs_activity_y2025q4 (
    id integer DEFAULT nextval('public.logs_activity_partitioned_id_seq'::regclass) NOT NULL,
    ip_address character varying(45),
    title character varying(50) NOT NULL,
    description text NOT NULL,
    create_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- TOC entry 258 (class 1259 OID 948424)
-- Name: migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.migrations (
    id bigint NOT NULL,
    version character varying(255) NOT NULL,
    class character varying(255) NOT NULL,
    "group" character varying(255) NOT NULL,
    namespace character varying(255) NOT NULL,
    "time" integer NOT NULL,
    batch integer NOT NULL
);


--
-- TOC entry 257 (class 1259 OID 948423)
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5357 (class 0 OID 0)
-- Dependencies: 257
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- TOC entry 225 (class 1259 OID 41408)
-- Name: siteconfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.siteconfig (
    id integer NOT NULL,
    name character varying(50) DEFAULT ''::character varying NOT NULL,
    description text,
    address text,
    state bigint DEFAULT 1 NOT NULL,
    country bigint DEFAULT 1 NOT NULL,
    postcode bigint NOT NULL,
    telephone character varying(11) NOT NULL,
    rif character varying(11) NOT NULL,
    logo character varying(255) NOT NULL,
    author character varying(100) NOT NULL,
    list_limit integer NOT NULL,
    mailfrom character varying(255) DEFAULT ''::character varying NOT NULL,
    fromname character varying(255) DEFAULT ''::character varying NOT NULL,
    metadesc character varying(1024) DEFAULT ''::character varying NOT NULL,
    metakey character varying(1024) DEFAULT ''::character varying NOT NULL,
    offline smallint DEFAULT 0 NOT NULL,
    offline_message text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    created_user_id integer DEFAULT 0 NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_user_id integer DEFAULT 0,
    deleted_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    version character varying(10) DEFAULT ''::character varying NOT NULL
);


--
-- TOC entry 233 (class 1259 OID 41475)
-- Name: states; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.states (
    id integer NOT NULL,
    state character varying(50) NOT NULL,
    create_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- TOC entry 238 (class 1259 OID 948160)
-- Name: mv_site_config; Type: MATERIALIZED VIEW; Schema: public; Owner: -
--

CREATE MATERIALIZED VIEW public.mv_site_config AS
 SELECT s.id,
    s.name,
    s.description,
    s.address,
    st.state AS state_name,
    c.nombre AS country_name,
    s.telephone,
    s.rif,
    s.version
   FROM ((public.siteconfig s
     LEFT JOIN public.states st ON ((s.state = st.id)))
     LEFT JOIN public.countries c ON ((s.country = c.id)))
  WITH NO DATA;


--
-- TOC entry 229 (class 1259 OID 41456)
-- Name: nationality; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nationality (
    id integer NOT NULL,
    code character varying(1) DEFAULT 'V'::character varying NOT NULL,
    name character varying(50) NOT NULL,
    create_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- TOC entry 228 (class 1259 OID 41455)
-- Name: nationality_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.nationality_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5358 (class 0 OID 0)
-- Dependencies: 228
-- Name: nationality_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.nationality_id_seq OWNED BY public.nationality.id;


--
-- TOC entry 260 (class 1259 OID 948433)
-- Name: notifications; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.notifications (
    id integer NOT NULL,
    user_id integer NOT NULL,
    type character varying(50) NOT NULL,
    related_id integer,
    title character varying(255) NOT NULL,
    message text NOT NULL,
    is_read smallint DEFAULT 0 NOT NULL,
    read_at timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- TOC entry 259 (class 1259 OID 948432)
-- Name: notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.notifications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5359 (class 0 OID 0)
-- Dependencies: 259
-- Name: notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.notifications_id_seq OWNED BY public.notifications.id;


--
-- TOC entry 289 (class 1259 OID 949776)
-- Name: region; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.region (
    id integer NOT NULL,
    region_id integer NOT NULL,
    name character varying(60) NOT NULL
);


--
-- TOC entry 288 (class 1259 OID 949775)
-- Name: region_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.region_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5360 (class 0 OID 0)
-- Dependencies: 288
-- Name: region_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.region_id_seq OWNED BY public.region.id;


--
-- TOC entry 256 (class 1259 OID 948375)
-- Name: session_logs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.session_logs (
    id integer NOT NULL,
    user_id integer NOT NULL,
    action character varying(10) NOT NULL,
    ip_address character varying(45),
    user_agent text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- TOC entry 255 (class 1259 OID 948374)
-- Name: session_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.session_logs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5361 (class 0 OID 0)
-- Dependencies: 255
-- Name: session_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.session_logs_id_seq OWNED BY public.session_logs.id;


--
-- TOC entry 236 (class 1259 OID 41491)
-- Name: sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sessions (
    id character varying(128) NOT NULL,
    ip_address inet NOT NULL,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    data bytea DEFAULT '\x'::bytea NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 41407)
-- Name: siteconfig_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.siteconfig_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5362 (class 0 OID 0)
-- Dependencies: 224
-- Name: siteconfig_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.siteconfig_id_seq OWNED BY public.siteconfig.id;


--
-- TOC entry 232 (class 1259 OID 41474)
-- Name: states_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.states_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5363 (class 0 OID 0)
-- Dependencies: 232
-- Name: states_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.states_id_seq OWNED BY public.states.id;


--
-- TOC entry 262 (class 1259 OID 948513)
-- Name: technician_assignments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.technician_assignments (
    id integer NOT NULL,
    technician_id integer NOT NULL,
    ticket_id integer NOT NULL,
    assigned_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    completed_at timestamp without time zone,
    status character varying(20) DEFAULT 'asignado'::character varying NOT NULL,
    CONSTRAINT technician_assignments_status_check CHECK (((status)::text = ANY ((ARRAY['asignado'::character varying, 'en_progreso'::character varying, 'completado'::character varying])::text[])))
);


--
-- TOC entry 261 (class 1259 OID 948512)
-- Name: technician_assignments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.technician_assignments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5364 (class 0 OID 0)
-- Dependencies: 261
-- Name: technician_assignments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.technician_assignments_id_seq OWNED BY public.technician_assignments.id;


--
-- TOC entry 252 (class 1259 OID 948323)
-- Name: ticket_attachments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ticket_attachments (
    id integer NOT NULL,
    ticket_id integer NOT NULL,
    user_id integer NOT NULL,
    file_name character varying(255) NOT NULL,
    file_path character varying(255) NOT NULL,
    file_size integer NOT NULL,
    file_type character varying(100) NOT NULL,
    uploaded_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- TOC entry 251 (class 1259 OID 948322)
-- Name: ticket_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ticket_attachments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5365 (class 0 OID 0)
-- Dependencies: 251
-- Name: ticket_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ticket_attachments_id_seq OWNED BY public.ticket_attachments.id;


--
-- TOC entry 254 (class 1259 OID 948350)
-- Name: ticket_categories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ticket_categories (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    description character varying(255),
    created_by integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    parent_id integer,
    default_priority character varying(20) DEFAULT 'media'::character varying,
    is_active integer DEFAULT 1 NOT NULL,
    CONSTRAINT chk_is_active CHECK ((is_active = ANY (ARRAY[0, 1])))
);


--
-- TOC entry 253 (class 1259 OID 948349)
-- Name: ticket_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ticket_categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5366 (class 0 OID 0)
-- Dependencies: 253
-- Name: ticket_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ticket_categories_id_seq OWNED BY public.ticket_categories.id;


--
-- TOC entry 248 (class 1259 OID 948282)
-- Name: ticket_comments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ticket_comments (
    id integer NOT NULL,
    ticket_id integer NOT NULL,
    user_id integer NOT NULL,
    comment text NOT NULL,
    is_internal boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- TOC entry 247 (class 1259 OID 948281)
-- Name: ticket_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ticket_comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5367 (class 0 OID 0)
-- Dependencies: 247
-- Name: ticket_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ticket_comments_id_seq OWNED BY public.ticket_comments.id;


--
-- TOC entry 250 (class 1259 OID 948303)
-- Name: ticket_history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ticket_history (
    id integer NOT NULL,
    ticket_id integer NOT NULL,
    changed_by integer NOT NULL,
    field_changed character varying(50) NOT NULL,
    old_value text,
    new_value text,
    changed_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- TOC entry 249 (class 1259 OID 948302)
-- Name: ticket_history_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ticket_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5368 (class 0 OID 0)
-- Dependencies: 249
-- Name: ticket_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ticket_history_id_seq OWNED BY public.ticket_history.id;


--
-- TOC entry 246 (class 1259 OID 948241)
-- Name: tickets; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tickets (
    id integer NOT NULL,
    title character varying(100) NOT NULL,
    description text NOT NULL,
    status character varying(20) DEFAULT 'abierto'::character varying NOT NULL,
    priority character varying(20) DEFAULT 'media'::character varying NOT NULL,
    user_id integer NOT NULL,
    assigned_to integer,
    category_id integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    closed_at timestamp without time zone,
    closed_by integer,
    user_rating smallint,
    user_feedback text
);


--
-- TOC entry 245 (class 1259 OID 948240)
-- Name: tickets_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tickets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5369 (class 0 OID 0)
-- Dependencies: 245
-- Name: tickets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tickets_id_seq OWNED BY public.tickets.id;


--
-- TOC entry 264 (class 1259 OID 948535)
-- Name: user_categories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_categories (
    id integer NOT NULL,
    user_id integer NOT NULL,
    category_id integer NOT NULL,
    is_primary boolean DEFAULT false,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- TOC entry 263 (class 1259 OID 948534)
-- Name: user_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.user_categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5370 (class 0 OID 0)
-- Dependencies: 263
-- Name: user_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.user_categories_id_seq OWNED BY public.user_categories.id;


--
-- TOC entry 219 (class 1259 OID 41358)
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    ip_address character varying(45),
    username character varying(100),
    password character varying(255) NOT NULL,
    email character varying(254) NOT NULL,
    activation_selector character varying(255),
    activation_code character varying(255),
    forgotten_password_selector character varying(255),
    forgotten_password_code character varying(255),
    forgotten_password_time integer,
    remember_selector character varying(255),
    remember_code character varying(255),
    created_on integer NOT NULL,
    last_login integer,
    active smallint DEFAULT 1 NOT NULL,
    first_name character varying(50) NOT NULL,
    middle_name character varying(50),
    first_last_name character varying(50) NOT NULL,
    second_last_name character varying(50),
    gender smallint DEFAULT 1 NOT NULL,
    nationality smallint DEFAULT 1 NOT NULL,
    photo text DEFAULT 'assets/profiles/default.jpg'::text NOT NULL,
    company character varying(100),
    phone character varying(20),
    CONSTRAINT check_active CHECK ((active >= 0)),
    CONSTRAINT check_id CHECK ((id >= 0))
);


--
-- TOC entry 223 (class 1259 OID 41394)
-- Name: users_groups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL,
    CONSTRAINT users_groups_check_group_id CHECK ((group_id >= 0)),
    CONSTRAINT users_groups_check_id CHECK ((id >= 0)),
    CONSTRAINT users_groups_check_user_id CHECK ((user_id >= 0))
);


--
-- TOC entry 222 (class 1259 OID 41393)
-- Name: users_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5371 (class 0 OID 0)
-- Dependencies: 222
-- Name: users_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_groups_id_seq OWNED BY public.users_groups.id;


--
-- TOC entry 218 (class 1259 OID 41357)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5372 (class 0 OID 0)
-- Dependencies: 218
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 291 (class 1259 OID 949783)
-- Name: worker; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.worker (
    id integer NOT NULL,
    worker_id integer NOT NULL,
    civ integer DEFAULT 0,
    status character varying(1) DEFAULT 'A'::character varying NOT NULL,
    charge_id integer NOT NULL,
    dependence_id integer NOT NULL
);


--
-- TOC entry 290 (class 1259 OID 949782)
-- Name: worker_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.worker_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5373 (class 0 OID 0)
-- Dependencies: 290
-- Name: worker_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.worker_id_seq OWNED BY public.worker.id;


--
-- TOC entry 285 (class 1259 OID 949759)
-- Name: workers_data; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.workers_data (
    id integer NOT NULL,
    worker_id integer NOT NULL,
    civ character varying NOT NULL,
    names text NOT NULL,
    charge_id integer NOT NULL,
    dependence_id integer NOT NULL,
    status character varying(1) DEFAULT 'A'::character varying NOT NULL
);


--
-- TOC entry 284 (class 1259 OID 949758)
-- Name: workers_data_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.workers_data_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5374 (class 0 OID 0)
-- Dependencies: 284
-- Name: workers_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.workers_data_id_seq OWNED BY public.workers_data.id;


--
-- TOC entry 4909 (class 0 OID 0)
-- Name: logs_activity_y2025q1; Type: TABLE ATTACH; Schema: public; Owner: -
--

ALTER TABLE ONLY public.logs_activity ATTACH PARTITION public.logs_activity_y2025q1 FOR VALUES FROM ('2025-01-01 00:00:00') TO ('2025-04-01 00:00:00');


--
-- TOC entry 4910 (class 0 OID 0)
-- Name: logs_activity_y2025q2; Type: TABLE ATTACH; Schema: public; Owner: -
--

ALTER TABLE ONLY public.logs_activity ATTACH PARTITION public.logs_activity_y2025q2 FOR VALUES FROM ('2025-04-01 00:00:00') TO ('2025-07-01 00:00:00');


--
-- TOC entry 4911 (class 0 OID 0)
-- Name: logs_activity_y2025q3; Type: TABLE ATTACH; Schema: public; Owner: -
--

ALTER TABLE ONLY public.logs_activity ATTACH PARTITION public.logs_activity_y2025q3 FOR VALUES FROM ('2025-07-01 00:00:00') TO ('2025-10-01 00:00:00');


--
-- TOC entry 4912 (class 0 OID 0)
-- Name: logs_activity_y2025q4; Type: TABLE ATTACH; Schema: public; Owner: -
--

ALTER TABLE ONLY public.logs_activity ATTACH PARTITION public.logs_activity_y2025q4 FOR VALUES FROM ('2025-10-01 00:00:00') TO ('2026-01-01 00:00:00');


--
-- TOC entry 4953 (class 2604 OID 948229)
-- Name: audit_log id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.audit_log ALTER COLUMN id SET DEFAULT nextval('public.audit_log_id_seq'::regclass);


--
-- TOC entry 4987 (class 2604 OID 949755)
-- Name: charges id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.charges ALTER COLUMN id SET DEFAULT nextval('public.charges_id_seq'::regclass);


--
-- TOC entry 4943 (class 2604 OID 41486)
-- Name: countries id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.countries ALTER COLUMN id SET DEFAULT nextval('public.countries_id_seq'::regclass);


--
-- TOC entry 4990 (class 2604 OID 949772)
-- Name: dependence id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dependence ALTER COLUMN id SET DEFAULT nextval('public.dependence_id_seq'::regclass);


--
-- TOC entry 4935 (class 2604 OID 41438)
-- Name: genders id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.genders ALTER COLUMN id SET DEFAULT nextval('public.genders_id_seq'::regclass);


--
-- TOC entry 4918 (class 2604 OID 41388)
-- Name: groups id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.groups ALTER COLUMN id SET DEFAULT nextval('public.groups_id_seq'::regclass);


--
-- TOC entry 4940 (class 2604 OID 41470)
-- Name: login_attempts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.login_attempts ALTER COLUMN id SET DEFAULT nextval('public.login_attempts_id_seq'::regclass);


--
-- TOC entry 4947 (class 2604 OID 948194)
-- Name: logs_activity id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.logs_activity ALTER COLUMN id SET DEFAULT nextval('public.logs_activity_partitioned_id_seq'::regclass);


--
-- TOC entry 4974 (class 2604 OID 948427)
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- TOC entry 4937 (class 2604 OID 41459)
-- Name: nationality id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nationality ALTER COLUMN id SET DEFAULT nextval('public.nationality_id_seq'::regclass);


--
-- TOC entry 4975 (class 2604 OID 948436)
-- Name: notifications id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notifications ALTER COLUMN id SET DEFAULT nextval('public.notifications_id_seq'::regclass);


--
-- TOC entry 4991 (class 2604 OID 949779)
-- Name: region id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.region ALTER COLUMN id SET DEFAULT nextval('public.region_id_seq'::regclass);


--
-- TOC entry 4972 (class 2604 OID 948378)
-- Name: session_logs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.session_logs ALTER COLUMN id SET DEFAULT nextval('public.session_logs_id_seq'::regclass);


--
-- TOC entry 4920 (class 2604 OID 41411)
-- Name: siteconfig id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.siteconfig ALTER COLUMN id SET DEFAULT nextval('public.siteconfig_id_seq'::regclass);


--
-- TOC entry 4941 (class 2604 OID 41478)
-- Name: states id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.states ALTER COLUMN id SET DEFAULT nextval('public.states_id_seq'::regclass);


--
-- TOC entry 4977 (class 2604 OID 948516)
-- Name: technician_assignments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.technician_assignments ALTER COLUMN id SET DEFAULT nextval('public.technician_assignments_id_seq'::regclass);


--
-- TOC entry 4965 (class 2604 OID 948326)
-- Name: ticket_attachments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ticket_attachments ALTER COLUMN id SET DEFAULT nextval('public.ticket_attachments_id_seq'::regclass);


--
-- TOC entry 4967 (class 2604 OID 948353)
-- Name: ticket_categories id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ticket_categories ALTER COLUMN id SET DEFAULT nextval('public.ticket_categories_id_seq'::regclass);


--
-- TOC entry 4960 (class 2604 OID 948285)
-- Name: ticket_comments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ticket_comments ALTER COLUMN id SET DEFAULT nextval('public.ticket_comments_id_seq'::regclass);


--
-- TOC entry 4963 (class 2604 OID 948306)
-- Name: ticket_history id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ticket_history ALTER COLUMN id SET DEFAULT nextval('public.ticket_history_id_seq'::regclass);


--
-- TOC entry 4955 (class 2604 OID 948244)
-- Name: tickets id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tickets ALTER COLUMN id SET DEFAULT nextval('public.tickets_id_seq'::regclass);


--
-- TOC entry 4980 (class 2604 OID 948538)
-- Name: user_categories id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_categories ALTER COLUMN id SET DEFAULT nextval('public.user_categories_id_seq'::regclass);


--
-- TOC entry 4913 (class 2604 OID 41361)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 4919 (class 2604 OID 41397)
-- Name: users_groups id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users_groups ALTER COLUMN id SET DEFAULT nextval('public.users_groups_id_seq'::regclass);


--
-- TOC entry 4992 (class 2604 OID 949786)
-- Name: worker id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.worker ALTER COLUMN id SET DEFAULT nextval('public.worker_id_seq'::regclass);


--
-- TOC entry 4988 (class 2604 OID 949762)
-- Name: workers_data id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.workers_data ALTER COLUMN id SET DEFAULT nextval('public.workers_data_id_seq'::regclass);


--
-- TOC entry 5311 (class 0 OID 948226)
-- Dependencies: 244
-- Data for Name: audit_log; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (1, 'users', 1, 'UPDATE', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1750541713, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1750541713, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 1, '2025-06-21 17:35:13.243019', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (2, 'users', 1, 'UPDATE', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1750541713, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1750541713, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 1, '2025-06-21 17:35:13.250531', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (3, 'users', 1, 'LOGOUT', NULL, '{"action": "logout"}', 1, '2025-06-22 00:00:50.703385', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (4, 'users', 1, 'UPDATE', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1750564860, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1750564860, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 1, '2025-06-22 00:01:00.289062', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (5, 'users', 1, 'UPDATE', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1750564860, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1750564860, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 1, '2025-06-22 00:01:00.293198', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (6, 'users', 1, 'UPDATE', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1750596917, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1750596917, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 1, '2025-06-22 08:55:17.808034', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (36, 'users', 1, 'LOGOUT', NULL, '{"action": "logout"}', 1, '2025-06-25 14:40:01.134266', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (7, 'users', 1, 'UPDATE', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1750596917, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1750596917, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 1, '2025-06-22 08:55:17.817235', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (8, 'users', 1, 'UPDATE', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1750610029, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1750610029, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 1, '2025-06-22 12:33:49.86087', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (9, 'users', 1, 'UPDATE', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1750610029, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1750610029, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 1, '2025-06-22 12:33:49.864642', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (10, 'users', 1, 'LOGOUT', NULL, '{"action": "logout"}', 1, '2025-06-22 17:00:17.742522', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (11, 'users', 1, 'UPDATE', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1750626023, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1750626023, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 1, '2025-06-22 17:00:23.492127', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (12, 'users', 1, 'UPDATE', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1750626023, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1750626023, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 1, '2025-06-22 17:00:23.494489', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (57, 'users', 1, 'LOGOUT', NULL, '{"action": "logout"}', 1, '2025-07-01 10:55:15.289183', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (13, 'users', 1, 'UPDATE', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1750627431, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1750627431, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 1, '2025-06-22 17:23:51.383432', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (14, 'users', 1, 'UPDATE', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1750627431, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1750627431, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 1, '2025-06-22 17:23:51.387099', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (15, 'users', 1, 'UPDATE', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1750700219, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1750700219, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 1, '2025-06-23 13:36:59.749335', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (16, 'users', 1, 'UPDATE', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1750700219, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1750700219, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 1, '2025-06-23 13:36:59.758157', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (17, 'users', 1, 'UPDATE', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1750743781, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1750743781, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 1, '2025-06-24 01:43:01.985227', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (85, 'users', 1, 'LOGOUT', NULL, '{"action": "logout"}', 1, '2025-07-03 09:58:56.018796', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (98, 'users', 1, 'LOGOUT', NULL, '{"action": "logout"}', 1, '2025-07-04 10:21:33.302476', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (18, 'users', 1, 'UPDATE', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1750743781, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1750743781, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 1, '2025-06-24 01:43:01.988424', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (19, 'users', 1, 'UPDATE', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1750762334, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1750762334, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 1, '2025-06-24 06:52:14.53442', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (20, 'users', 1, 'UPDATE', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1750762334, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1750762334, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 1, '2025-06-24 06:52:14.539283', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (21, 'users', 1, 'UPDATE', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1750799822, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1750799822, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 1, '2025-06-24 17:17:02.351765', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (22, 'users', 1, 'UPDATE', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1750799822, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1750799822, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 1, '2025-06-24 17:17:02.356326', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (23, 'users', 1, 'UPDATE', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1750847592, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1750847592, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 1, '2025-06-25 06:33:12.470652', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (24, 'users', 1, 'UPDATE', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1750847592, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1750847592, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 1, '2025-06-25 06:33:12.481783', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (25, 'users', 1, 'UPDATE', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1750871224, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1750871224, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 1, '2025-06-25 13:07:04.99788', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (26, 'users', 1, 'UPDATE', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1750871224, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1750871224, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 1, '2025-06-25 13:07:05.002328', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (27, 'users', 1, 'LOGOUT', NULL, '{"action": "logout"}', 1, '2025-06-25 13:54:36.726468', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (28, 'users', 1, 'UPDATE', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1750874082, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1750874082, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 1, '2025-06-25 13:54:42.381963', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (29, 'users', 1, 'UPDATE', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1750874082, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1750874082, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 1, '2025-06-25 13:54:42.386297', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (30, 'users', 1, 'LOGOUT', NULL, '{"action": "logout"}', 1, '2025-06-25 14:29:55.483576', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (31, 'users', 1, 'UPDATE', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1750876200, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1750876200, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 1, '2025-06-25 14:30:00.702097', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (32, 'users', 1, 'UPDATE', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1750876200, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1750876200, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 1, '2025-06-25 14:30:00.709008', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (33, 'users', 1, 'LOGOUT', NULL, '{"action": "logout"}', 1, '2025-06-25 14:34:38.876692', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (34, 'users', 1, 'UPDATE', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1750876498, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1750876498, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 1, '2025-06-25 14:34:58.141749', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (35, 'users', 1, 'UPDATE', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1750876498, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1750876498, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 1, '2025-06-25 14:34:58.146911', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (37, 'users', 1, 'UPDATE', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1750876813, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1750876813, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 1, '2025-06-25 14:40:13.117399', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (38, 'users', 1, 'UPDATE', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1750876813, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1750876813, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 1, '2025-06-25 14:40:13.124873', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (39, 'users', 1, 'LOGOUT', NULL, '{"action": "logout"}', 1, '2025-06-25 15:37:42.71409', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (40, 'users', 1, 'UPDATE', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1750882379, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1750882379, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 1, '2025-06-25 16:12:59.559332', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (41, 'users', 1, 'UPDATE', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1750882379, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1750882379, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 1, '2025-06-25 16:12:59.565369', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (42, 'users', 1, 'UPDATE', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1750901869, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1750901869, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 1, '2025-06-25 21:37:49.582609', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (43, 'users', 1, 'UPDATE', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1750901869, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1750901869, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 1, '2025-06-25 21:37:49.586372', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (45, 'tickets', 14, 'CREATE', NULL, '{"title": "Nuevo ticket de ejemplo 2 con adjunto", "status": "abierto", "user_id": "1", "priority": "media", "assigned_to": "3", "category_id": "2", "description": "Esto es un ticket con adjunto"}', 1, '2025-06-25 23:00:23.854552', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (46, 'users', 1, 'UPDATE', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1750938636, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1750938636, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 1, '2025-06-26 07:50:36.044635', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (47, 'users', 1, 'UPDATE', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1750938636, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1750938636, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 1, '2025-06-26 07:50:36.058656', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (48, 'users', 1, 'UPDATE', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1750958597, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1750958597, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 1, '2025-06-26 13:23:17.897266', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (93, 'tickets', 27, 'CREATE', NULL, '{"title": "Prueba de ticket 03072025", "status": "abierto", "user_id": "1", "priority": "baja", "category_id": "5", "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."}', 1, '2025-07-03 23:40:51.067153', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (97, 'tickets', 28, 'CREATE', NULL, '{"title": "Nuevo ticket 04072025", "status": "abierto", "user_id": "1", "priority": "media", "category_id": "4", "description": "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."}', 1, '2025-07-04 08:01:22.507093', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (101, 'tickets', 29, 'CREATE', NULL, '{"title": "Ticket de soporte 04072025", "status": "abierto", "user_id": "1", "priority": "alta", "category_id": "3", "description": "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."}', 1, '2025-07-04 11:06:50.20648', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (119, 'tickets', 30, 'CREATE', NULL, '{"title": "Ticket de hy 04072025", "status": "abierto", "user_id": "4", "priority": "baja", "category_id": "3", "description": "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium"}', 4, '2025-07-04 21:32:42.951175', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (49, 'users', 1, 'UPDATE', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1750958597, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1750958597, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 1, '2025-06-26 13:23:17.934572', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (50, 'users', 1, 'LOGOUT', NULL, '{"action": "logout"}', 1, '2025-06-26 13:29:48.573246', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (51, 'users', 1, 'UPDATE', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1751332973, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1751332973, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 1, '2025-06-30 21:22:53.585113', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (52, 'users', 1, 'UPDATE', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1751332973, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1751332973, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 1, '2025-06-30 21:22:53.598145', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (53, 'users', 1, 'LOGOUT', NULL, '{"action": "logout"}', 1, '2025-07-01 00:40:34.148827', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (54, 'users', 1, 'UPDATE', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1751380751, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1751380751, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 1, '2025-07-01 10:39:11.914423', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (55, 'users', 1, 'UPDATE', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1751380751, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1751380751, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 1, '2025-07-01 10:39:11.941818', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (58, 'users', 1, 'UPDATE', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1751426165, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1751426165, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 1, '2025-07-01 23:16:05.972994', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (59, 'users', 1, 'UPDATE', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1751426165, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1751426165, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 1, '2025-07-01 23:16:05.986136', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (68, 'users', 1, 'LOGOUT', NULL, '{"action": "logout"}', 1, '2025-07-02 00:31:09.550088', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (69, 'users', 1, 'UPDATE', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1751430683, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1751430683, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 1, '2025-07-02 00:31:23.230854', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (70, 'users', 1, 'UPDATE', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1751430683, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1751430683, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 1, '2025-07-02 00:31:23.232714', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (72, 'users', 1, 'LOGOUT', NULL, '{"action": "logout"}', 1, '2025-07-02 01:18:23.782101', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (73, 'users', 1, 'UPDATE', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1751433513, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1751433513, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 1, '2025-07-02 01:18:33.411438', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (74, 'users', 1, 'UPDATE', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1751433513, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1751433513, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 1, '2025-07-02 01:18:33.413775', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (75, 'tickets', 25, 'CREATE', NULL, '{"title": "Impresora atascada", "status": "abierto", "user_id": "1", "priority": "alta", "category_id": "1", "description": "La impresora se atasco con un papel"}', 1, '2025-07-02 01:19:27.041786', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (76, 'users', 1, 'LOGOUT', NULL, '{"action": "logout"}', 1, '2025-07-02 02:25:08.396362', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (77, 'users', 1, 'UPDATE', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1751437519, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1751437519, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 1, '2025-07-02 02:25:19.330802', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (78, 'users', 1, 'UPDATE', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1751437519, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1751437519, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 1, '2025-07-02 02:25:19.334517', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (79, 'users', 1, 'LOGOUT', NULL, '{"action": "logout"}', 1, '2025-07-02 02:45:05.711889', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (80, 'users', 1, 'UPDATE', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1751438729, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1751438729, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 1, '2025-07-02 02:45:29.232425', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (94, 'users', 1, 'LOGOUT', NULL, '{"action": "logout"}', 1, '2025-07-03 23:47:18.726162', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (102, 'users', 1, 'LOGOUT', NULL, '{"action": "logout"}', 1, '2025-07-04 11:07:35.619412', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (120, 'users', 4, 'LOGOUT', NULL, '{"action": "logout"}', 4, '2025-07-04 21:33:18.019488', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (81, 'users', 1, 'UPDATE', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1751438729, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1751438729, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 1, '2025-07-02 02:45:29.234542', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (82, 'users', 1, 'LOGOUT', NULL, '{"action": "logout"}', 1, '2025-07-02 03:07:45.751797', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (83, 'users', 1, 'UPDATE', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1751541727, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1751541727, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 1, '2025-07-03 07:22:07.974151', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (84, 'users', 1, 'UPDATE', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1751541727, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1751541727, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 1, '2025-07-03 07:22:07.987945', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (86, 'users', 1, 'UPDATE', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1751551146, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1751551146, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 1, '2025-07-03 09:59:06.694805', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (87, 'users', 1, 'UPDATE', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1751551146, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1751551146, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 1, '2025-07-03 09:59:06.696957', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (108, 'users', 1, 'LOGOUT', NULL, '{"action": "logout"}', 1, '2025-07-04 20:09:06.474223', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (88, 'users', 1, 'UPDATE', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1751566639, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1751566639, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 1, '2025-07-03 14:17:19.811232', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (89, 'users', 1, 'UPDATE', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1751566639, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1751566639, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 1, '2025-07-03 14:17:19.825291', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (90, 'users', 1, 'UPDATE', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1751596385, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1751596385, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 1, '2025-07-03 22:33:05.650434', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (91, 'users', 1, 'UPDATE', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1751596385, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1751596385, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 1, '2025-07-03 22:33:05.666873', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (95, 'users', 1, 'UPDATE', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1751629743, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1751629743, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 1, '2025-07-04 07:49:03.902061', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (112, 'users', 2, 'LOGOUT', NULL, '{"action": "logout"}', 2, '2025-07-04 20:50:49.741185', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (123, 'users', 2, 'LOGOUT', NULL, '{"action": "logout"}', 2, '2025-07-04 21:35:09.708652', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (96, 'users', 1, 'UPDATE', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1751629743, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1751629743, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 1, '2025-07-04 07:49:03.908096', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (99, 'users', 1, 'UPDATE', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1751641378, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1751641378, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 1, '2025-07-04 11:02:58.89445', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (100, 'users', 1, 'UPDATE', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1751641378, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1751641378, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 1, '2025-07-04 11:02:58.903182', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (103, 'users', 3, 'UPDATE', '{"id": 3, "email": "jtarache@sigesot.com", "phone": "04125388074", "photo": "assets/profiles/31416446.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$MnFzUGxTVlV3djhRTDNhaw$Chbu/k9fMeVe7xQjpceGEilRpD4jqK4rkXlhcOpcayc", "username": "jtarache", "created_on": 1749408123, "first_name": "José", "ip_address": "127.0.0.1", "last_login": 1751641765, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Tarache", "second_last_name": "González", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 3, "email": "jtarache@sigesot.com", "phone": "04125388074", "photo": "assets/profiles/31416446.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$MnFzUGxTVlV3djhRTDNhaw$Chbu/k9fMeVe7xQjpceGEilRpD4jqK4rkXlhcOpcayc", "username": "jtarache", "created_on": 1749408123, "first_name": "José", "ip_address": "127.0.0.1", "last_login": 1751641765, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Tarache", "second_last_name": "González", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 3, '2025-07-04 11:09:25.973717', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (104, 'users', 3, 'UPDATE', '{"id": 3, "email": "jtarache@sigesot.com", "phone": "04125388074", "photo": "assets/profiles/31416446.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$MnFzUGxTVlV3djhRTDNhaw$Chbu/k9fMeVe7xQjpceGEilRpD4jqK4rkXlhcOpcayc", "username": "jtarache", "created_on": 1749408123, "first_name": "José", "ip_address": "127.0.0.1", "last_login": 1751641765, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Tarache", "second_last_name": "González", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 3, "email": "jtarache@sigesot.com", "phone": "04125388074", "photo": "assets/profiles/31416446.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$MnFzUGxTVlV3djhRTDNhaw$Chbu/k9fMeVe7xQjpceGEilRpD4jqK4rkXlhcOpcayc", "username": "jtarache", "created_on": 1749408123, "first_name": "José", "ip_address": "127.0.0.1", "last_login": 1751641765, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Tarache", "second_last_name": "González", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 3, '2025-07-04 11:09:25.977029', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (115, 'users', 2, 'LOGOUT', NULL, '{"action": "logout"}', 2, '2025-07-04 21:30:55.854425', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (126, 'users', 3, 'LOGOUT', NULL, '{"action": "logout"}', 3, '2025-07-04 21:35:51.216739', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (105, 'users', 3, 'UPDATE', '{"id": 3, "email": "jtarache@sigesot.com", "phone": "04125388074", "photo": "assets/profiles/31416446.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$MnFzUGxTVlV3djhRTDNhaw$Chbu/k9fMeVe7xQjpceGEilRpD4jqK4rkXlhcOpcayc", "username": "jtarache", "created_on": 1749408123, "first_name": "José", "ip_address": "127.0.0.1", "last_login": 1751641765, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Tarache", "second_last_name": "González", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 3, "email": "jtarache@sigesot.com", "phone": "04125388074", "photo": "assets/profiles/31416446.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=4096,t=2,p=2$VVUwY0tMSjlVbTJCVjVGbQ$VMntg/dxbYQjZanmUumPaThwfxFHf46V5JOOF1IVuF8", "username": "jtarache", "created_on": 1749408123, "first_name": "José", "ip_address": "127.0.0.1", "last_login": 1751641765, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Tarache", "second_last_name": "González", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 3, '2025-07-04 11:09:25.989551', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (106, 'users', 1, 'UPDATE', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1751674116, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1751674116, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 1, '2025-07-04 20:08:36.420381', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (107, 'users', 1, 'UPDATE', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1751674116, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1751674116, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 1, '2025-07-04 20:08:36.427723', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (109, 'users', 2, 'UPDATE', '{"id": 2, "email": "yacosta@sigesot.com", "phone": "04127116048", "photo": "assets/profiles/31795979.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$MnFzUGxTVlV3djhRTDNhaw$PQPwmgEJLZ5AfWmKI9tZ6+pWpPiyCBm4l8sciFG9hV8", "username": "yacosta", "created_on": 1749408123, "first_name": "Yelian", "ip_address": "127.0.0.1", "last_login": 1751674183, "middle_name": "Elías", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Acosta", "second_last_name": "Bravo", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 2, "email": "yacosta@sigesot.com", "phone": "04127116048", "photo": "assets/profiles/31795979.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$MnFzUGxTVlV3djhRTDNhaw$PQPwmgEJLZ5AfWmKI9tZ6+pWpPiyCBm4l8sciFG9hV8", "username": "yacosta", "created_on": 1749408123, "first_name": "Yelian", "ip_address": "127.0.0.1", "last_login": 1751674183, "middle_name": "Elías", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Acosta", "second_last_name": "Bravo", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 2, '2025-07-04 20:09:43.485686', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (110, 'users', 2, 'UPDATE', '{"id": 2, "email": "yacosta@sigesot.com", "phone": "04127116048", "photo": "assets/profiles/31795979.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$MnFzUGxTVlV3djhRTDNhaw$PQPwmgEJLZ5AfWmKI9tZ6+pWpPiyCBm4l8sciFG9hV8", "username": "yacosta", "created_on": 1749408123, "first_name": "Yelian", "ip_address": "127.0.0.1", "last_login": 1751674183, "middle_name": "Elías", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Acosta", "second_last_name": "Bravo", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 2, "email": "yacosta@sigesot.com", "phone": "04127116048", "photo": "assets/profiles/31795979.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$MnFzUGxTVlV3djhRTDNhaw$PQPwmgEJLZ5AfWmKI9tZ6+pWpPiyCBm4l8sciFG9hV8", "username": "yacosta", "created_on": 1749408123, "first_name": "Yelian", "ip_address": "127.0.0.1", "last_login": 1751674183, "middle_name": "Elías", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Acosta", "second_last_name": "Bravo", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 2, '2025-07-04 20:09:43.489976', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (129, 'users', 1, 'LOGOUT', NULL, '{"action": "logout"}', 1, '2025-07-04 21:36:12.62165', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (111, 'users', 2, 'UPDATE', '{"id": 2, "email": "yacosta@sigesot.com", "phone": "04127116048", "photo": "assets/profiles/31795979.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$MnFzUGxTVlV3djhRTDNhaw$PQPwmgEJLZ5AfWmKI9tZ6+pWpPiyCBm4l8sciFG9hV8", "username": "yacosta", "created_on": 1749408123, "first_name": "Yelian", "ip_address": "127.0.0.1", "last_login": 1751674183, "middle_name": "Elías", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Acosta", "second_last_name": "Bravo", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 2, "email": "yacosta@sigesot.com", "phone": "04127116048", "photo": "assets/profiles/31795979.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=4096,t=2,p=2$RlczOWo2aUQ4TmVseDV4Ng$7aZYBMYRpsPbrB8JIhXhL8wFJSSnW1fYsRIBRCh8qxs", "username": "yacosta", "created_on": 1749408123, "first_name": "Yelian", "ip_address": "127.0.0.1", "last_login": 1751674183, "middle_name": "Elías", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Acosta", "second_last_name": "Bravo", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 2, '2025-07-04 20:09:43.510971', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (113, 'users', 2, 'UPDATE', '{"id": 2, "email": "yacosta@sigesot.com", "phone": "04127116048", "photo": "assets/profiles/31795979.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=4096,t=2,p=2$RlczOWo2aUQ4TmVseDV4Ng$7aZYBMYRpsPbrB8JIhXhL8wFJSSnW1fYsRIBRCh8qxs", "username": "yacosta", "created_on": 1749408123, "first_name": "Yelian", "ip_address": "127.0.0.1", "last_login": 1751676664, "middle_name": "Elías", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Acosta", "second_last_name": "Bravo", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 2, "email": "yacosta@sigesot.com", "phone": "04127116048", "photo": "assets/profiles/31795979.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=4096,t=2,p=2$RlczOWo2aUQ4TmVseDV4Ng$7aZYBMYRpsPbrB8JIhXhL8wFJSSnW1fYsRIBRCh8qxs", "username": "yacosta", "created_on": 1749408123, "first_name": "Yelian", "ip_address": "127.0.0.1", "last_login": 1751676664, "middle_name": "Elías", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Acosta", "second_last_name": "Bravo", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 2, '2025-07-04 20:51:04.638273', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (114, 'users', 2, 'UPDATE', '{"id": 2, "email": "yacosta@sigesot.com", "phone": "04127116048", "photo": "assets/profiles/31795979.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=4096,t=2,p=2$RlczOWo2aUQ4TmVseDV4Ng$7aZYBMYRpsPbrB8JIhXhL8wFJSSnW1fYsRIBRCh8qxs", "username": "yacosta", "created_on": 1749408123, "first_name": "Yelian", "ip_address": "127.0.0.1", "last_login": 1751676664, "middle_name": "Elías", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Acosta", "second_last_name": "Bravo", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 2, "email": "yacosta@sigesot.com", "phone": "04127116048", "photo": "assets/profiles/31795979.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=4096,t=2,p=2$RlczOWo2aUQ4TmVseDV4Ng$7aZYBMYRpsPbrB8JIhXhL8wFJSSnW1fYsRIBRCh8qxs", "username": "yacosta", "created_on": 1749408123, "first_name": "Yelian", "ip_address": "127.0.0.1", "last_login": 1751676664, "middle_name": "Elías", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Acosta", "second_last_name": "Bravo", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 2, '2025-07-04 20:51:04.643011', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (116, 'users', 4, 'UPDATE', '{"id": 4, "email": "zmora@sigesot.com", "phone": "04120323976", "photo": "assets/profiles/30942464.jpg", "active": 1, "gender": 2, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$MnFzUGxTVlV3djhRTDNhaw$RlbQMm1k0s3l7bTjXqRD1/godA1DpZArXgIeYf0Ym/Q", "username": "zmora", "created_on": 1749408123, "first_name": "Zarahy", "ip_address": "127.0.0.1", "last_login": 1751679116, "middle_name": "Alhay", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Mora", "second_last_name": "De La Rosa", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 4, "email": "zmora@sigesot.com", "phone": "04120323976", "photo": "assets/profiles/30942464.jpg", "active": 1, "gender": 2, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$MnFzUGxTVlV3djhRTDNhaw$RlbQMm1k0s3l7bTjXqRD1/godA1DpZArXgIeYf0Ym/Q", "username": "zmora", "created_on": 1749408123, "first_name": "Zarahy", "ip_address": "127.0.0.1", "last_login": 1751679116, "middle_name": "Alhay", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Mora", "second_last_name": "De La Rosa", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 4, '2025-07-04 21:31:56.362774', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (117, 'users', 4, 'UPDATE', '{"id": 4, "email": "zmora@sigesot.com", "phone": "04120323976", "photo": "assets/profiles/30942464.jpg", "active": 1, "gender": 2, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$MnFzUGxTVlV3djhRTDNhaw$RlbQMm1k0s3l7bTjXqRD1/godA1DpZArXgIeYf0Ym/Q", "username": "zmora", "created_on": 1749408123, "first_name": "Zarahy", "ip_address": "127.0.0.1", "last_login": 1751679116, "middle_name": "Alhay", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Mora", "second_last_name": "De La Rosa", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 4, "email": "zmora@sigesot.com", "phone": "04120323976", "photo": "assets/profiles/30942464.jpg", "active": 1, "gender": 2, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$MnFzUGxTVlV3djhRTDNhaw$RlbQMm1k0s3l7bTjXqRD1/godA1DpZArXgIeYf0Ym/Q", "username": "zmora", "created_on": 1749408123, "first_name": "Zarahy", "ip_address": "127.0.0.1", "last_login": 1751679116, "middle_name": "Alhay", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Mora", "second_last_name": "De La Rosa", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 4, '2025-07-04 21:31:56.364858', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (132, 'users', 2, 'LOGOUT', NULL, '{"action": "logout"}', 2, '2025-07-04 21:49:04.394371', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (118, 'users', 4, 'UPDATE', '{"id": 4, "email": "zmora@sigesot.com", "phone": "04120323976", "photo": "assets/profiles/30942464.jpg", "active": 1, "gender": 2, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$MnFzUGxTVlV3djhRTDNhaw$RlbQMm1k0s3l7bTjXqRD1/godA1DpZArXgIeYf0Ym/Q", "username": "zmora", "created_on": 1749408123, "first_name": "Zarahy", "ip_address": "127.0.0.1", "last_login": 1751679116, "middle_name": "Alhay", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Mora", "second_last_name": "De La Rosa", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 4, "email": "zmora@sigesot.com", "phone": "04120323976", "photo": "assets/profiles/30942464.jpg", "active": 1, "gender": 2, "company": "Sigesot", "password": "$argon2i$v=19$m=4096,t=2,p=2$dDRxQ2REckpoUzhVM242Ng$ig+s5qrIzkO0XFnSb6yHJ5Po9X4LVVz/tS4RT56EVdU", "username": "zmora", "created_on": 1749408123, "first_name": "Zarahy", "ip_address": "127.0.0.1", "last_login": 1751679116, "middle_name": "Alhay", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Mora", "second_last_name": "De La Rosa", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 4, '2025-07-04 21:31:56.377861', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (121, 'users', 2, 'UPDATE', '{"id": 2, "email": "yacosta@sigesot.com", "phone": "04127116048", "photo": "assets/profiles/31795979.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=4096,t=2,p=2$RlczOWo2aUQ4TmVseDV4Ng$7aZYBMYRpsPbrB8JIhXhL8wFJSSnW1fYsRIBRCh8qxs", "username": "yacosta", "created_on": 1749408123, "first_name": "Yelian", "ip_address": "127.0.0.1", "last_login": 1751679226, "middle_name": "Elías", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Acosta", "second_last_name": "Bravo", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 2, "email": "yacosta@sigesot.com", "phone": "04127116048", "photo": "assets/profiles/31795979.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=4096,t=2,p=2$RlczOWo2aUQ4TmVseDV4Ng$7aZYBMYRpsPbrB8JIhXhL8wFJSSnW1fYsRIBRCh8qxs", "username": "yacosta", "created_on": 1749408123, "first_name": "Yelian", "ip_address": "127.0.0.1", "last_login": 1751679226, "middle_name": "Elías", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Acosta", "second_last_name": "Bravo", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 2, '2025-07-04 21:33:46.11814', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (122, 'users', 2, 'UPDATE', '{"id": 2, "email": "yacosta@sigesot.com", "phone": "04127116048", "photo": "assets/profiles/31795979.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=4096,t=2,p=2$RlczOWo2aUQ4TmVseDV4Ng$7aZYBMYRpsPbrB8JIhXhL8wFJSSnW1fYsRIBRCh8qxs", "username": "yacosta", "created_on": 1749408123, "first_name": "Yelian", "ip_address": "127.0.0.1", "last_login": 1751679226, "middle_name": "Elías", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Acosta", "second_last_name": "Bravo", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 2, "email": "yacosta@sigesot.com", "phone": "04127116048", "photo": "assets/profiles/31795979.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=4096,t=2,p=2$RlczOWo2aUQ4TmVseDV4Ng$7aZYBMYRpsPbrB8JIhXhL8wFJSSnW1fYsRIBRCh8qxs", "username": "yacosta", "created_on": 1749408123, "first_name": "Yelian", "ip_address": "127.0.0.1", "last_login": 1751679226, "middle_name": "Elías", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Acosta", "second_last_name": "Bravo", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 2, '2025-07-04 21:33:46.120023', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (124, 'users', 3, 'UPDATE', '{"id": 3, "email": "jtarache@sigesot.com", "phone": "04125388074", "photo": "assets/profiles/31416446.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=4096,t=2,p=2$VVUwY0tMSjlVbTJCVjVGbQ$VMntg/dxbYQjZanmUumPaThwfxFHf46V5JOOF1IVuF8", "username": "jtarache", "created_on": 1749408123, "first_name": "José", "ip_address": "127.0.0.1", "last_login": 1751679328, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Tarache", "second_last_name": "González", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 3, "email": "jtarache@sigesot.com", "phone": "04125388074", "photo": "assets/profiles/31416446.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=4096,t=2,p=2$VVUwY0tMSjlVbTJCVjVGbQ$VMntg/dxbYQjZanmUumPaThwfxFHf46V5JOOF1IVuF8", "username": "jtarache", "created_on": 1749408123, "first_name": "José", "ip_address": "127.0.0.1", "last_login": 1751679328, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Tarache", "second_last_name": "González", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 3, '2025-07-04 21:35:28.588172', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (125, 'users', 3, 'UPDATE', '{"id": 3, "email": "jtarache@sigesot.com", "phone": "04125388074", "photo": "assets/profiles/31416446.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=4096,t=2,p=2$VVUwY0tMSjlVbTJCVjVGbQ$VMntg/dxbYQjZanmUumPaThwfxFHf46V5JOOF1IVuF8", "username": "jtarache", "created_on": 1749408123, "first_name": "José", "ip_address": "127.0.0.1", "last_login": 1751679328, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Tarache", "second_last_name": "González", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 3, "email": "jtarache@sigesot.com", "phone": "04125388074", "photo": "assets/profiles/31416446.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=4096,t=2,p=2$VVUwY0tMSjlVbTJCVjVGbQ$VMntg/dxbYQjZanmUumPaThwfxFHf46V5JOOF1IVuF8", "username": "jtarache", "created_on": 1749408123, "first_name": "José", "ip_address": "127.0.0.1", "last_login": 1751679328, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Tarache", "second_last_name": "González", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 3, '2025-07-04 21:35:28.591426', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (127, 'users', 1, 'UPDATE', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1751679356, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1751679356, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 1, '2025-07-04 21:35:56.610668', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (128, 'users', 1, 'UPDATE', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1751679356, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1751679356, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 1, '2025-07-04 21:35:56.615893', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (130, 'users', 2, 'UPDATE', '{"id": 2, "email": "yacosta@sigesot.com", "phone": "04127116048", "photo": "assets/profiles/31795979.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=4096,t=2,p=2$RlczOWo2aUQ4TmVseDV4Ng$7aZYBMYRpsPbrB8JIhXhL8wFJSSnW1fYsRIBRCh8qxs", "username": "yacosta", "created_on": 1749408123, "first_name": "Yelian", "ip_address": "127.0.0.1", "last_login": 1751679390, "middle_name": "Elías", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Acosta", "second_last_name": "Bravo", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 2, "email": "yacosta@sigesot.com", "phone": "04127116048", "photo": "assets/profiles/31795979.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=4096,t=2,p=2$RlczOWo2aUQ4TmVseDV4Ng$7aZYBMYRpsPbrB8JIhXhL8wFJSSnW1fYsRIBRCh8qxs", "username": "yacosta", "created_on": 1749408123, "first_name": "Yelian", "ip_address": "127.0.0.1", "last_login": 1751679390, "middle_name": "Elías", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Acosta", "second_last_name": "Bravo", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 2, '2025-07-04 21:36:30.937558', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (131, 'users', 2, 'UPDATE', '{"id": 2, "email": "yacosta@sigesot.com", "phone": "04127116048", "photo": "assets/profiles/31795979.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=4096,t=2,p=2$RlczOWo2aUQ4TmVseDV4Ng$7aZYBMYRpsPbrB8JIhXhL8wFJSSnW1fYsRIBRCh8qxs", "username": "yacosta", "created_on": 1749408123, "first_name": "Yelian", "ip_address": "127.0.0.1", "last_login": 1751679390, "middle_name": "Elías", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Acosta", "second_last_name": "Bravo", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 2, "email": "yacosta@sigesot.com", "phone": "04127116048", "photo": "assets/profiles/31795979.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=4096,t=2,p=2$RlczOWo2aUQ4TmVseDV4Ng$7aZYBMYRpsPbrB8JIhXhL8wFJSSnW1fYsRIBRCh8qxs", "username": "yacosta", "created_on": 1749408123, "first_name": "Yelian", "ip_address": "127.0.0.1", "last_login": 1751679390, "middle_name": "Elías", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Acosta", "second_last_name": "Bravo", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 2, '2025-07-04 21:36:30.939813', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (133, 'users', 1, 'UPDATE', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1752085248, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1752085248, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 1, '2025-07-09 14:20:48.194723', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (141, 'users', 1, 'LOGOUT', NULL, '{"action": "logout"}', 1, '2025-07-10 13:20:12.051203', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (134, 'users', 1, 'UPDATE', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1752085248, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1752085248, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 1, '2025-07-09 14:20:48.199949', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (135, 'users', 1, 'LOGOUT', NULL, '{"action": "logout"}', 1, '2025-07-09 14:32:51.695327', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (136, 'users', 1, 'UPDATE', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1752147982, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1752147982, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 1, '2025-07-10 07:46:22.723949', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (137, 'users', 1, 'UPDATE', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1752147982, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1752147982, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 1, '2025-07-10 07:46:22.73642', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (138, 'users', 1, 'LOGOUT', NULL, '{"action": "logout"}', 1, '2025-07-10 13:11:59.408605', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (139, 'users', 1, 'UPDATE', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1752167599, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1752167599, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 1, '2025-07-10 13:13:19.572936', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (140, 'users', 1, 'UPDATE', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1752167599, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1752167599, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 1, '2025-07-10 13:13:19.576787', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (142, 'users', 1, 'UPDATE', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1752168100, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1752168100, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 1, '2025-07-10 13:21:40.057761', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (143, 'users', 1, 'UPDATE', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1752168100, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1752168100, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 1, '2025-07-10 13:21:40.065182', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (144, 'users', 1, 'LOGOUT', NULL, '{"action": "logout"}', 1, '2025-07-10 13:24:04.540255', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (145, 'users', 1, 'UPDATE', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1752168418, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1752168418, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 1, '2025-07-10 13:26:58.92667', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (146, 'users', 1, 'UPDATE', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1752168418, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1752168418, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 1, '2025-07-10 13:26:58.936414', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (147, 'users', 1, 'LOGOUT', NULL, '{"action": "logout"}', 1, '2025-07-10 13:27:43.099006', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (148, 'users', 1, 'UPDATE', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1752246285, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1752246285, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 1, '2025-07-11 11:04:45.294281', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (149, 'users', 1, 'UPDATE', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1752246285, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1752246285, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 1, '2025-07-11 11:04:45.307589', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (150, 'tickets', 31, 'CREATE', NULL, '{"title": "TIcket de hoy 11072025", "status": "abierto", "user_id": "1", "priority": "baja", "category_id": "4", "description": "Esto es un ticket"}', 1, '2025-07-11 11:06:05.272185', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (151, 'users', 1, 'LOGOUT', NULL, '{"action": "logout"}', 1, '2025-07-11 11:10:23.972255', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (152, 'users', 3, 'UPDATE', '{"id": 3, "email": "jtarache@sigesot.com", "phone": "04125388074", "photo": "assets/profiles/31416446.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=4096,t=2,p=2$VVUwY0tMSjlVbTJCVjVGbQ$VMntg/dxbYQjZanmUumPaThwfxFHf46V5JOOF1IVuF8", "username": "jtarache", "created_on": 1749408123, "first_name": "José", "ip_address": "127.0.0.1", "last_login": 1752246654, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Tarache", "second_last_name": "González", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 3, "email": "jtarache@sigesot.com", "phone": "04125388074", "photo": "assets/profiles/31416446.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=4096,t=2,p=2$VVUwY0tMSjlVbTJCVjVGbQ$VMntg/dxbYQjZanmUumPaThwfxFHf46V5JOOF1IVuF8", "username": "jtarache", "created_on": 1749408123, "first_name": "José", "ip_address": "127.0.0.1", "last_login": 1752246654, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Tarache", "second_last_name": "González", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 3, '2025-07-11 11:10:54.268166', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (153, 'users', 3, 'UPDATE', '{"id": 3, "email": "jtarache@sigesot.com", "phone": "04125388074", "photo": "assets/profiles/31416446.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=4096,t=2,p=2$VVUwY0tMSjlVbTJCVjVGbQ$VMntg/dxbYQjZanmUumPaThwfxFHf46V5JOOF1IVuF8", "username": "jtarache", "created_on": 1749408123, "first_name": "José", "ip_address": "127.0.0.1", "last_login": 1752246654, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Tarache", "second_last_name": "González", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 3, "email": "jtarache@sigesot.com", "phone": "04125388074", "photo": "assets/profiles/31416446.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=4096,t=2,p=2$VVUwY0tMSjlVbTJCVjVGbQ$VMntg/dxbYQjZanmUumPaThwfxFHf46V5JOOF1IVuF8", "username": "jtarache", "created_on": 1749408123, "first_name": "José", "ip_address": "127.0.0.1", "last_login": 1752246654, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Tarache", "second_last_name": "González", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 3, '2025-07-11 11:10:54.270166', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (154, 'users', 3, 'LOGOUT', NULL, '{"action": "logout"}', 3, '2025-07-11 11:12:31.608249', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (155, 'users', 1, 'UPDATE', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1752246755, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1752246755, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 1, '2025-07-11 11:12:35.587366', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (156, 'users', 1, 'UPDATE', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1752246755, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', '{"id": 1, "email": "gmeneses@youdomain.com", "phone": "04241733239", "photo": "assets/profiles/8262447.jpg", "active": 1, "gender": 1, "company": "Sigesot", "password": "$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA", "username": "gmeneses", "created_on": 1744672199, "first_name": "Gonzalo", "ip_address": "127.0.0.1", "last_login": 1752246755, "middle_name": "Rafael", "nationality": 1, "remember_code": null, "activation_code": "", "first_last_name": "Meneses", "second_last_name": "Arias", "remember_selector": null, "activation_selector": null, "forgotten_password_code": null, "forgotten_password_time": null, "forgotten_password_selector": null}', 1, '2025-07-11 11:12:35.59322', '127.0.0.1');
INSERT INTO public.audit_log (id, table_name, record_id, action, old_data, new_data, changed_by, changed_at, ip_address) VALUES (157, 'users', 1, 'LOGOUT', NULL, '{"action": "logout"}', 1, '2025-07-11 11:24:11.75519', '127.0.0.1');


--
-- TOC entry 5335 (class 0 OID 949752)
-- Dependencies: 283
-- Data for Name: charges; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.charges (id, charge_id, charge_description) VALUES (1, 11, 'BACHILLER I');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (2, 12, 'FISCAL I');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (3, 13, 'FACILITADOR (BI)');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (4, 14, 'BACHILLER II');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (5, 15, 'FISCAL II');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (6, 16, 'FACILITADOR (BII)');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (7, 17, 'BACHILLER III');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (8, 18, 'FACILITADOR (BIII)');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (9, 19, 'FISCAL III');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (10, 21, 'TECNICO I');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (11, 22, 'FACILITADORES (TI)');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (12, 23, 'TECNICO II');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (13, 24, 'FACILITADOR (TII)');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (14, 25, 'PROFESIONAL I');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (15, 26, 'FACILITADORES (PI)');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (16, 27, 'PROFESIONAL II');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (17, 28, 'FACILITADORES (PII)');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (18, 29, 'PROFESIONAL III');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (19, 30, 'FACILITADORES (PIII)');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (20, 40, 'COORDINADOR (A)');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (21, 41, 'ENLACE EPIICENTRO');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (22, 42, 'DIRECTOR (A) DE LINEA');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (23, 43, 'DIRECTOR (A) DE LINEA (E)');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (24, 44, 'DIRECTOR (A) GENERAL');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (25, 45, 'DIRECTOR (A) GENERAL (E) PIII');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (26, 46, 'DIRECTOR (A) NACIONAL');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (27, 47, 'INTENDENTE (A)');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (28, 48, 'ADJUNTO');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (29, 49, 'SUPERINTENDENTE');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (30, 50, 'ADJUNTO');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (31, 52, 'COORDINADOR');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (32, 53, 'ENLACE DE EPII');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (33, 54, 'DIRECTOR (A) GENERAL');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (34, 55, 'DIRECTOR (A) NACIONAL');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (35, 56, 'INTENDENTE (A)');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (36, 57, 'BACHILLER I');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (37, 58, 'BACHILLER I / ESCOLTA');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (38, 59, 'BACHILLER II / ESCOLTA');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (39, 60, 'BACHILLER III');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (40, 61, 'BACHILLER III / ESCOLTA');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (41, 62, 'PROFESIONAL I');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (42, 63, 'PROFESIONAL I / ESCOLTA');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (43, 64, 'PROFESIONAL II');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (44, 65, 'PROFESIONAL II / ESCOLTA');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (45, 71, 'COORDINADOR(E) F/TII');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (46, 72, 'DIRECTOR DE LINEA (E) PI');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (47, 91, 'DIRECTOR DE LINEA');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (48, 101, 'DIRECTOR NACIONAL (E) PI');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (49, 111, 'DIRECTOR DE LINEA BI (E)');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (50, 120, 'DIRECTOR  DE LINEA PIII(E)');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (51, 121, 'DIRECTOR DE LINEA BI(E)');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (52, 122, 'DIRECTOR DE LINEA PII(E)');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (53, 123, 'DIRECTOR DE LINEA BIII(E)');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (54, 131, 'DIRECTORA GENERAL (E)TII');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (55, 141, 'COORDINADOR (E)');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (56, 145, 'COORDINADOR (E)');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (57, 152, 'CONSULTOR (A)');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (58, 153, 'CONSULTOR  (E) PII');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (59, 160, 'COORDINADOR (E)');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (60, 173, 'DIRECTOR GENERAL (E)');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (61, 182, 'DIRECTOR NACIONAL (E)');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (62, 184, 'COORDINADOR (E) PII');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (63, 186, 'COORDINADOR (E) T1');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (64, 188, 'BACHILLER II');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (65, 189, 'COORDINADOR (E) BIII');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (66, 192, 'PROFESIONAL III / ESCOLTA ');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (67, 202, 'COORDINADOR (E) PI');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (68, 211, 'DIRECTOR (A) GENERAL (E) PIII');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (69, 225, 'DIRECTOR NACIONAL (E) PI');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (70, 231, 'EMPLEADO CONTRATADO');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (71, 241, 'DIRECTOR NACIONAL (E) BIII');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (72, 251, 'TECNICO II');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (73, 261, 'DIRECTOR (A) DE LINEA (E) TII');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (74, 271, 'DIRECTOR (A) NACIONAL (E)');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (75, 281, 'DIRECTOR DE LINEA (E) ');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (76, 290, 'DIRECTOR (A) GENERAL (E) ');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (77, 302, 'DIRECTOR (A) DE LINEA (E) TI');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (78, 311, 'TECNICO I');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (79, 321, 'COORDINADOR (E) FIII');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (80, 332, 'JEFE DE UNIDAD ');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (81, 341, 'ESCOLTA');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (82, 351, 'DIRECTOR NACIONAL (E) PII');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (83, 354, 'DIRECTOR NACIONAL (E) PI');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (84, 362, 'PROFESIONAL III');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (85, 363, 'SUPERINTENDENTE ADJUNTO');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (86, 371, 'SUPERINTENDENTE (E)');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (87, 382, 'CONSULTOR (A) JURÍDICO  ');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (88, 391, 'DIRECTOR GENERAL (E)');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (89, 392, 'INTENDENTE (E)');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (90, 395, 'COORDINADOR (A) ');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (91, 396, 'DIRECTOR (A) LINEA (E)');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (92, 403, 'INTENDENTE (E) ');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (93, 411, 'COORNINADOR (E) TII');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (94, 422, 'COORNINADOR (E) ');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (95, 431, 'DIRECTOR NACIONAL (E)');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (96, 441, 'FISCAL III');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (97, 452, 'COORDINADOR (E) PIII');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (98, 461, 'SUPERINTENDENTE (E)');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (99, 472, 'DIRECTOR NACIONAL (E) TII');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (100, 481, 'DIRECTOR NACIONAL (E) ');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (101, 491, 'JEFE DE UNIDAD (E) BI');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (102, 500, 'COORDINADOR ');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (103, 511, 'TECNICO II');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (104, 522, 'JEFE DE UNIDAD (E)');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (105, 532, 'DIRECTOR (E) DE LINEA');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (106, 535, 'DIRECTOR (E) DE LINEA BII/A');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (107, 536, 'DIRECTOR (E) DE LINEA ');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (108, 541, 'JUBILADOS');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (109, 542, 'PENSIOANADO');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (110, 552, 'DIRECTOR GENERAL (E) TI');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (111, 561, 'DIRECTORA GENERAL (E)');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (112, 563, 'DIRECTOR (A) GENERAL (E) TI');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (113, 571, 'DIRECTOR (A) GENERAL (E) PI');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (114, 582, 'FISCAL II');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (115, 591, 'DIRECTOR DE LINEA (E) PI');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (116, 593, 'DIRECTOR DE LINEA (E) PI');
INSERT INTO public.charges (id, charge_id, charge_description) VALUES (117, 594, 'DIRECTOR GENERAL (E) PI');


--
-- TOC entry 5303 (class 0 OID 41483)
-- Dependencies: 235
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (1, 'AF', 'Afganistán', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (2, 'AX', 'Islas Gland', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (3, 'AL', 'Albania', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (4, 'DE', 'Alemania', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (5, 'AD', 'Andorra', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (6, 'AO', 'Angola', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (7, 'AI', 'Anguilla', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (8, 'AQ', 'Antártida', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (9, 'AG', 'Antigua y Barbuda', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (10, 'AN', 'Antillas Holandesas', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (11, 'SA', 'Arabia Saudí', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (12, 'DZ', 'Argelia', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (13, 'AR', 'Argentina', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (14, 'AM', 'Armenia', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (15, 'AW', 'Aruba', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (16, 'AU', 'Australia', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (17, 'AT', 'Austria', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (18, 'AZ', 'Azerbaiyán', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (19, 'BS', 'Bahamas', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (20, 'BH', 'Bahréin', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (21, 'BD', 'Bangladesh', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (22, 'BB', 'Barbados', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (23, 'BY', 'Bielorrusia', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (24, 'BE', 'Bélgica', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (25, 'BZ', 'Belice', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (26, 'BJ', 'Benin', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (27, 'BM', 'Bermudas', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (28, 'BT', 'Bhután', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (29, 'BO', 'Bolivia', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (30, 'BA', 'Bosnia y Herzegovina', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (31, 'BW', 'Botsuana', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (32, 'BV', 'Isla Bouvet', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (33, 'BR', 'Brasil', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (34, 'BN', 'Brunéi', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (35, 'BG', 'Bulgaria', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (36, 'BF', 'Burkina Faso', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (37, 'BI', 'Burundi', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (38, 'CV', 'Cabo Verde', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (39, 'KY', 'Islas Caimán', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (40, 'KH', 'Camboya', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (41, 'CM', 'Camerún', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (42, 'CA', 'Canadá', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (43, 'CF', 'República Centroafricana', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (44, 'TD', 'Chad', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (45, 'CZ', 'República Checa', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (46, 'CL', 'Chile', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (47, 'CN', 'China', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (48, 'CY', 'Chipre', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (49, 'CX', 'Isla de Navidad', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (50, 'VA', 'Ciudad del Vaticano', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (51, 'CC', 'Islas Cocos', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (52, 'CO', 'Colombia', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (53, 'KM', 'Comoras', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (54, 'CD', 'República Democrática del Congo', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (55, 'CG', 'Congo', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (56, 'CK', 'Islas Cook', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (57, 'KP', 'Corea del Norte', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (58, 'KR', 'Corea del Sur', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (59, 'CI', 'Costa de Marfil', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (60, 'CR', 'Costa Rica', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (61, 'HR', 'Croacia', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (62, 'CU', 'Cuba', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (63, 'DK', 'Dinamarca', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (64, 'DM', 'Dominica', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (65, 'DO', 'República Dominicana', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (66, 'EC', 'Ecuador', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (67, 'EG', 'Egipto', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (68, 'SV', 'El Salvador', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (69, 'AE', 'Emiratos Árabes Unidos', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (70, 'ER', 'Eritrea', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (71, 'SK', 'Eslovaquia', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (72, 'SI', 'Eslovenia', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (73, 'ES', 'España', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (74, 'UM', 'Islas ultramarinas de Estados Unidos', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (75, 'US', 'Estados Unidos', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (76, 'EE', 'Estonia', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (77, 'ET', 'Etiopía', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (78, 'FO', 'Islas Feroe', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (79, 'PH', 'Filipinas', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (80, 'FI', 'Finlandia', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (81, 'FJ', 'Fiyi', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (82, 'FR', 'Francia', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (83, 'GA', 'Gabón', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (84, 'GM', 'Gambia', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (85, 'GE', 'Georgia', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (86, 'GS', 'Islas Georgias del Sur y Sandwich del Sur', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (87, 'GH', 'Ghana', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (88, 'GI', 'Gibraltar', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (89, 'GD', 'Granada', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (90, 'GR', 'Grecia', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (91, 'GL', 'Groenlandia', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (92, 'GP', 'Guadalupe', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (93, 'GU', 'Guam', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (94, 'GT', 'Guatemala', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (95, 'GF', 'Guayana Francesa', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (96, 'GN', 'Guinea', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (97, 'GQ', 'Guinea Ecuatorial', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (98, 'GW', 'Guinea-Bissau', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (99, 'GY', 'Guyana', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (100, 'HT', 'Haití', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (101, 'HM', 'Islas Heard y McDonald', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (102, 'HN', 'Honduras', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (103, 'HK', 'Hong Kong', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (104, 'HU', 'Hungría', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (105, 'IN', 'India', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (106, 'ID', 'Indonesia', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (107, 'IR', 'Irán', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (108, 'IQ', 'Iraq', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (109, 'IE', 'Irlanda', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (110, 'IS', 'Islandia', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (111, 'IL', 'Israel', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (112, 'IT', 'Italia', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (113, 'JM', 'Jamaica', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (114, 'JP', 'Japón', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (115, 'JO', 'Jordania', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (116, 'KZ', 'Kazajstán', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (117, 'KE', 'Kenia', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (118, 'KG', 'Kirguistán', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (119, 'KI', 'Kiribati', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (120, 'KW', 'Kuwait', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (121, 'LA', 'Laos', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (122, 'LS', 'Lesotho', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (123, 'LV', 'Letonia', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (124, 'LB', 'Líbano', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (125, 'LR', 'Liberia', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (126, 'LY', 'Libia', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (127, 'LI', 'Liechtenstein', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (128, 'LT', 'Lituania', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (129, 'LU', 'Luxemburgo', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (130, 'MO', 'Macao', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (131, 'MK', 'ARY Macedonia', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (132, 'MG', 'Madagascar', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (133, 'MY', 'Malasia', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (134, 'MW', 'Malawi', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (135, 'MV', 'Maldivas', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (136, 'ML', 'Malí', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (137, 'MT', 'Malta', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (138, 'FK', 'Islas Malvinas', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (139, 'MP', 'Islas Marianas del Norte', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (140, 'MA', 'Marruecos', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (141, 'MH', 'Islas Marshall', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (142, 'MQ', 'Martinica', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (143, 'MU', 'Mauricio', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (144, 'MR', 'Mauritania', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (145, 'YT', 'Mayotte', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (146, 'MX', 'México', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (147, 'FM', 'Micronesia', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (148, 'MD', 'Moldavia', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (149, 'MC', 'Mónaco', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (150, 'MN', 'Mongolia', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (151, 'MS', 'Montserrat', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (152, 'MZ', 'Mozambique', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (153, 'MM', 'Myanmar', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (154, 'NA', 'Namibia', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (155, 'NR', 'Nauru', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (156, 'NP', 'Nepal', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (157, 'NI', 'Nicaragua', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (158, 'NE', 'Níger', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (159, 'NG', 'Nigeria', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (160, 'NU', 'Niue', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (161, 'NF', 'Isla Norfolk', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (162, 'NO', 'Noruega', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (163, 'NC', 'Nueva Caledonia', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (164, 'NZ', 'Nueva Zelanda', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (165, 'OM', 'Omán', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (166, 'NL', 'Países Bajos', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (167, 'PK', 'Pakistán', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (168, 'PW', 'Palau', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (169, 'PS', 'Palestina', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (170, 'PA', 'Panamá', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (171, 'PG', 'Papúa Nueva Guinea', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (172, 'PY', 'Paraguay', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (173, 'PE', 'Perú', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (174, 'PN', 'Islas Pitcairn', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (175, 'PF', 'Polinesia Francesa', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (176, 'PL', 'Polonia', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (177, 'PT', 'Portugal', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (178, 'PR', 'Puerto Rico', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (179, 'QA', 'Qatar', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (180, 'GB', 'Reino Unido', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (181, 'RE', 'Reunión', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (182, 'RW', 'Ruanda', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (183, 'RO', 'Rumania', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (184, 'RU', 'Rusia', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (185, 'EH', 'Sahara Occidental', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (186, 'SB', 'Islas Salomón', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (187, 'WS', 'Samoa', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (188, 'AS', 'Samoa Americana', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (189, 'KN', 'San Cristóbal y Nevis', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (190, 'SM', 'San Marino', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (191, 'PM', 'San Pedro y Miquelón', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (192, 'VC', 'San Vicente y las Granadinas', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (193, 'SH', 'Santa Helena', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (194, 'LC', 'Santa Lucía', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (195, 'ST', 'Santo Tomé y Príncipe', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (196, 'SN', 'Senegal', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (197, 'CS', 'Serbia y Montenegro', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (198, 'SC', 'Seychelles', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (199, 'SL', 'Sierra Leona', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (200, 'SG', 'Singapur', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (201, 'SY', 'Siria', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (202, 'SO', 'Somalia', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (203, 'LK', 'Sri Lanka', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (204, 'SZ', 'Suazilandia', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (205, 'ZA', 'Sudáfrica', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (206, 'SD', 'Sudán', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (207, 'SE', 'Suecia', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (208, 'CH', 'Suiza', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (209, 'SR', 'Surinam', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (210, 'SJ', 'Svalbard y Jan Mayen', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (211, 'TH', 'Tailandia', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (212, 'TW', 'Taiwán', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (213, 'TZ', 'Tanzania', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (214, 'TJ', 'Tayikistán', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (215, 'IO', 'Territorio Británico del Océano Índico', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (216, 'TF', 'Territorios Australes Franceses', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (217, 'TL', 'Timor Oriental', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (218, 'TG', 'Togo', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (219, 'TK', 'Tokelau', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (220, 'TO', 'Tonga', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (221, 'TT', 'Trinidad y Tobago', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (222, 'TN', 'Túnez', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (223, 'TC', 'Islas Turcas y Caicos', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (224, 'TM', 'Turkmenistán', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (225, 'TR', 'Turquía', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (226, 'TV', 'Tuvalu', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (227, 'UA', 'Ucrania', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (228, 'UG', 'Uganda', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (229, 'UY', 'Uruguay', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (230, 'UZ', 'Uzbekistán', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (231, 'VU', 'Vanuatu', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (232, 'VE', 'Venezuela', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (233, 'VN', 'Vietnam', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (234, 'VG', 'Islas Vírgenes Británicas', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (235, 'VI', 'Islas Vírgenes de los Estados Unidos', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (236, 'WF', 'Wallis y Futuna', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (237, 'YE', 'Yemen', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (238, 'DJ', 'Yibuti', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (239, 'ZM', 'Zambia', '2025-03-23 16:37:41.316767');
INSERT INTO public.countries (id, iso, nombre, create_at) VALUES (240, 'ZW', 'Zimbabue', '2025-03-23 16:37:41.316767');


--
-- TOC entry 5339 (class 0 OID 949769)
-- Dependencies: 287
-- Data for Name: dependence; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (1, 11, 'DESPACHO DE LA INTENDENCIA DE PROTECCIÓN DE LOS DERECHOS SOCIOECONÓMICOS', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (2, 12, 'DIRECCIÓN GENERAL DEL DESPACHO', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (3, 13, 'ATENCIÓN AL CIUDADANO', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (4, 14, 'DIRECCIÓN DE LINEA DE SEGURIDAD Y VIGILANCIA', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (5, 17, 'CONSULTORÍA JURÍDICA', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (6, 18, 'DIRECCIÓN DE LINEA DE ACTOS ADMINISTRATIVOS ', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (7, 19, 'DIRECCIÓN DE LINEA DE  DICTAMENES Y OPINIONES', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (8, 20, 'DIRECCIÓN DE LINEA DE ASISTENCIA LEGAL', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (9, 21, 'OFICINA DE TECNOLOGÍAS DE LA INFORMACIÓN Y COMUNICACIÓN ', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (10, 22, 'DIRECCIÓN DE LINEA DE SOPORTE TECNICO', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (11, 23, 'DIRECCIÓN DE LINEA DE SISTEMAS', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (12, 24, 'DIRECCIÓN DE LINEA DE INFRAESTRUCTURA TECNOLOGICA', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (13, 25, 'DIRECCION DE INVESTIGACION E INNOVACION TECNOLOGICA', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (14, 26, 'OFICINA GENERAL DE PLANIFICACIÓN,  PRESUPUESTO Y ORGANIZACIÓN', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (15, 27, 'DIRECCIÓN DE LINEA DE DESARROLLO ORGANIZACIONAL', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (16, 28, 'DIRECCIÓN DE LINEA DE PLANIFICACIÓN', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (17, 29, 'DIRECCIÓN DE LINEA DE PRESUPUESTO', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (18, 30, 'OFICINA DE FORMACIÓN,  PARTICIPACIÓN Y ARTICULACIÓN CON EL  PODER POPULAR', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (19, 31, 'DIRECCIÓN DE LINEA DE FORMACIÓN INTEGRAL ', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (20, 32, 'DIRECCIÓN DE LINEA DE FORMACIÓN DEL PODER POPULAR ', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (21, 36, 'EPICENTRO ESTADO ARAGUA ', 10);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (22, 39, 'EPICENTRO ESTADO CARABOBO', 10);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (23, 42, 'EPICENTRO DISTRITO CAPITAL ', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (24, 47, 'EPICENTRO ESTADO MIRANDA', 10);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (25, 53, 'EPICENTRO ESTADO LA GUAIRA', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (26, 54, 'EPICENTRO ESTADO YARACUY', 10);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (27, 56, 'OFICINA DE GESTIÓN HUMANA ', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (28, 57, 'DIRECCIÓN DE LINEA DE  ADMINISTRACIÓN DE PERSONAL ', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (29, 58, 'DIRECCIÓN DE LINEA DE BIENESTAR SOCIAL', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (30, 59, 'DIRECCIÓN DE LINEA DE RECLUTAMIENTO,  SELECCIÓN E INGRESO', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (31, 60, 'DIRECCIÓN DE PROTOCOLO ', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (32, 61, 'DIRECCIÓN DE LINEA DE ENLACE INTERINSTITUCIONAL ', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (33, 62, 'DIRECCIÓN DE LINEA DE DIFUSIÓN Y SEGUIMIENTO', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (34, 63, 'OFICINA DE GESTIÓN ADMINISTRATIVA', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (35, 64, 'DIRECCIÓN DE LINEA DE ADMINISTRACIÓN', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (36, 65, 'DIRECCIÓN DE LINEA DE COMPRAS', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (37, 66, 'DIRECCIÓN DE LINEA  DE BIENES PÚBLICOS', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (38, 67, 'DIRECCIÓN DE LINEA DE FINANZAS', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (39, 68, 'COORDINACIÓN DE TESORERÍA', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (40, 69, 'COORDINACIÓN DE CONTABILIDAD', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (41, 70, 'DIRECCIÓN DE LINEA DE SERVICIOS GENERALES', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (42, 71, 'COORDINACION DE TRANSPORTE', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (43, 72, 'COORDINACIÓN DE ALMACÉN', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (44, 74, 'OFICINA DE GESTIÓN COMUNICACIONAL', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (45, 75, 'DIRECCIÓN DE LINEA DE ESTRATEGIA COMUNICACIONAL', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (46, 76, 'DIRECCIÓN DE LINEA DE MEDIOS AUDIOVISUALES ', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (47, 77, 'OFICINA ESTRATÉGICA DE SEGUIMIENTO', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (48, 78, 'DIRECCIÓN DE LINEA DE EVALUACIÓN Y ANÁLISIS ESTRATÉGICO', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (49, 79, 'DIRECCIÓN DE LINEA DE SEGUIMIENTO DE GESTIÓN ', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (50, 80, 'INTENDENCIA DE COSTOS,  GANANCIAS Y PRECIOS JUSTOS', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (51, 81, 'DIRECCION DE REGISTROS Y CERTIFICACIONES', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (52, 84, 'DIRECCIÓN NACIONAL DE COSTO Y GANANCIAS', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (53, 85, 'DIRECCIÓN DE LINEA DE GANANCIAS RAZONABLES', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (54, 86, 'DIRECCIÓN DE LINEA DE PRECIOS NACIONALES E INTERNACIONALES ', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (55, 87, 'DIRECCIÓN NACIONAL DE  COSTOS Y GANANCIAS ', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (56, 88, 'DIRECCIÓN DE LINEA DE ANÁLISIS Y AUDITORÍA DE COSTOS DEL SECTOR PRIMARIO', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (57, 89, 'DIRECCIÓN DE LINEA DE ANÁLISIS Y AUDITORÍA DE LOS PROCESOS INDUSTRIALES', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (58, 90, 'DIRECCIÓN DE LINEA DE ANÁLISIS Y AUDITORIA DEL SECTOR COMERCIAL Y  SERVICIOS', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (59, 91, 'DIRECCIÓN DE REGLAMENTACIÓN ESTRATEGIAS Y PROCESOS NORMATIVOS', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (60, 92, 'DIRECCIÓN DE LINEA DE SEGUIMIENTO DE PROCESOS NORMATIVOS', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (61, 93, 'DIRECCIÓN DE LINEA DE PUBLICIDAD PROMOCIONES Y PROCESOS NORMATIVOS', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (62, 94, 'DIRECCIÓN DE LINEA DE REGLAMENTACIÓN Y NORMAS ', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (63, 95, 'DIRECCIÓN NACIONAL DE ESTUDIOS ECONÓMICOS ', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (64, 96, 'DIRECCIÓN DE LINEA DE INVESTIGACIÓN', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (65, 97, 'DIRECCIÓN DE LINEA DE INVESTIGACIÓN Y PROYECTOS ESPECIALES', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (66, 98, 'DIRECCIÓN DE LINEA DE DESARROLLO ESTADÍSTICO', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (67, 99, 'INTENDENCIA DE PROTECCION DE LOS DERECHOS SOCIOECONÓMICOS', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (68, 100, 'DIRECCIÓN NACIONAL DE PROTECCIÓN DE DERECHOS INDIVIDUALES', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (69, 104, 'DIRECCIÓN DE LINEA DE ATENCIÓN Y PROTECCIÓN', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (70, 106, 'DIRECCIÓN DE LINEA DE PROMOCIONES', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (71, 107, 'DIRECCIÓN DE LÍNEA DE PROTECCIÓN 0800 Y REDES SOCIALES', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (72, 110, 'DIRECCIÓN NACIONAL DE ACTIVIDADES PRODUCTIVAS', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (73, 111, 'DIRECCION NACIONAL DE ACTIVIDADES DE DISTRIBUCION Y COMERCIALIZACION', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (74, 112, 'DIRECCION NACIONAL DE EJECUCION DE MEDIDAS', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (75, 113, 'DIRECCIÓN NACIONAL DE SERVICIOS', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (76, 114, 'DIRECCIÓN DE LÍNEA DE ANÁLISIS ESTRATÉGICO', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (77, 118, 'COORDINACION DEL ESTADO ARAGUA', 10);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (78, 121, 'COORDINACION DEL ESTADO CARABOBO', 10);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (79, 124, 'COORDINACION DE DISTRITO CAPITAL', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (80, 129, 'COORDINACION DEL ESTADO MIRANDA', 10);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (81, 136, 'COORDINACION DEL ESTADO LA GUAIRA', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (82, 137, 'COORDINACION DEL ESTADO YARACUY', 10);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (83, 139, 'UNIDAD DE RELACIONES LABORALES', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (84, 140, 'INTENDENCIA NACIONAL DE PROTECCIÓN AL SALARIO DEL OBRERO Y LA OBRERA', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (85, 152, 'DIRECCIÓN DE AUDITORIA DE DATOS', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (86, 154, 'DIRECCIÓN DE LINEA DE PROGRAMACIÓN Y EVALUACIÓN', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (87, 155, 'DIRECCIÓN DE LINEA DE INSPECCIÓN E INVESTIGACIÓN', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (88, 156, 'DIRECCIÓN NACIONAL DE FORMACIÓN INTEGRAL Y DE LAS ORGANIZACIONES DEL PODER POPULAR', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (89, 157, 'DIRECCIÓN NACIONAL DE ARTICULACIÓN CON LAS ORGANIZACIONES DE TRABAJADORES Y TRABAJADORAS', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (90, 158, 'DIRECCIÓN NACIONAL DEL SECTOR HIGIENE PERSONAL ', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (91, 159, 'DIRECCIÓN NACIONAL DEL SECTOR TRANSPORTE ', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (92, 210, 'DIRECCIÓN NACIONAL DE REGISTRO ÚNICO DE PERSONAS QUE DESARROLLAN ACTIVIDADES ECO RUPDAE', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (93, 211, 'DIRECCIÓN DE LINEA DE AUDITORIA DE DATOS ', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (94, 212, 'DIRECCIÓN DE CENTRO DE INFORMACIÓN DE DATOS ', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (95, 223, 'DIRECCIÓN DE ARCHIVO CENTRAL', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (96, 241, 'DIRECCION DE LINEA DE IMPORTACIONES', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (97, 242, 'DIRECCIÓN DE LINEA DE DISTRIBUCIÓN', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (98, 243, 'DIRECCIÓN DE LINEA DE VENTAS AL DETAL', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (99, 251, 'DIRECCIÓN DE  LINEA DE TRASPORTE Y ENERGIA', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (100, 252, 'DIRECCION DE LINEA DE TELECOMUNICACIONES', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (101, 253, 'DIRECCIÓN DE LÍNEA DE SALUD', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (102, 254, 'DIRECCIÓN DE LÍNEA DE EDUCACIÓN', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (103, 256, 'DIRECCIÓN DE LÍNEA  PRODUCCIÓN PRIMARIA', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (104, 257, 'DIRECCIÓN DE LÍNEA DE INSUMO', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (105, 258, 'DIRECCIÓN DE LÍNEA DE TRANSFORMACIÓN', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (106, 261, 'DIRECCIÓN DE LINEA DE COMISOS', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (107, 262, 'DIRECCION DE LÍNEA DE OCUPACIÓN TEMPORAL', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (108, 263, 'DIRECCIÓN DE LINEA DE MULTAS', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (109, 272, 'DIRECCION NACIONAL DE PROGRAMACIÓN Y OPERACIONES DE FISCALIZACIONES', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (110, 341, 'UNIDAD DE INVESTIGACIÓN DE CAMPO', 10);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (111, 342, 'UNIDAD DE APOYO ADMINISTRATIVO', 10);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (112, 343, 'UNIDAD DE FISCALIZACIÓN', 10);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (113, 401, 'UNIDAD DE INVESTIGACIÓN DE CAMPO', 10);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (114, 402, 'UNIDAD DE APOYO ADMINISTRATIVO', 10);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (115, 403, 'UNIDAD DE FISCALIZACIÓN', 10);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (116, 404, 'UNIDAD DE INVESTIGACIÓN DE CAMPO', 10);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (117, 405, 'UNIDAD DE APOYO ADMINISTRATIVO', 10);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (118, 406, 'UNIDAD DE FISCALIZACIÓN', 10);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (119, 460, 'UNIDAD DE INVESTIGACIÓN DE CAMPO', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (120, 462, 'UNIDAD DE APOYO ADMINISTRATIVO', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (121, 463, 'UNIDAD DE FISCALIZACIÓN', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (122, 526, 'UNIDAD DE INVESTIGACIÓN DE CAMPO', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (123, 527, 'UNIDAD DE APOYO ADMINISTRATIVO', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (124, 528, 'UNIDAD DE FISCALIZACIÓN', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (125, 648, 'UNIDAD DE INVESTIGACIÓN DE CAMPO', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (126, 649, 'UNIDAD DE APOYO ADMINISTRATIVO', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (127, 700, 'UNIDAD DE FISCALIZACIÓN', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (128, 712, 'OFICINA DE AUDITORIA INTERNA', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (129, 713, 'DIRECCIÓN DE CONTROL POSTERIOR', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (130, 714, 'DIRECCION DE DETERMINACIÓN DE RESPONSABILIDADES', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (131, 721, 'DIRECCION NACIONAL DE MULTAS,  COMISOS Y VENTAS SUPERVISADAS', 10);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (132, 722, 'DIRECCIÓN DE LINEA MULTAS ', 10);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (133, 723, 'DIRECCIÓN DE LINEA COMISOS Y VENTAS SUPERVISADAS', 10);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (134, 740, 'OFICINA DE ATENCION CIUDADANA Y AL PODER POPULAR', 21);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (135, 751, 'DIRECCIÓN NACIONAL DE PROCEDIMENTOS ADMINISTRATIVOS', 10);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (136, 754, 'DIRECCIÓN DE LINEA DE PARTICIPACIÓN Y ARTICULACIÓN CON EL PODER POPULAR ', 10);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (137, 755, 'DIRECCIÓN DE LINEA DE INFORMACIÓN Y APOYO AL CIUDADANO', 10);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (138, 756, 'DIRECCIÓN DE LINEA DE MEDIDAS PREVENTIVAS ', 10);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (139, 757, 'DIRECCIÓN DE LINEA DE SUSTANCIACIONES ', 10);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (140, 761, 'DIRECCIÓN DE PROGRAMACIÓN Y MONITOREO', 10);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (141, 762, 'DIRECCIÓN NACIONAL DE FISCALIZACIÓN ', 10);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (142, 763, 'DIRECCIÓN DE LINEA DE ASIGNACIÓN DE PROVIDENCIAS ', 10);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (143, 764, 'DIRECCIÓN DE LINEA DE ACTUACIONES FISCALES ', 10);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (144, 771, 'DIRECCIÓN DE LINEA DE ARRENDAMIENTO COMERCIAL ', 10);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (145, 781, 'DIRECCIÓN DE ARTICULACIÓN CON ORGANIZACIONES DE TRABAJADORES Y TRABAJADORAS', 10);
INSERT INTO public.dependence (id, dependence_id, name, region_id) VALUES (146, 782, 'DIRECCIÓN DE ARTICULACIÓN CON EL PODER POPULAR ', 10);


--
-- TOC entry 5295 (class 0 OID 41435)
-- Dependencies: 227
-- Data for Name: genders; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.genders (id, gender_name, create_at) VALUES (1, 'Masculino', '2025-03-23 16:37:41.316767');
INSERT INTO public.genders (id, gender_name, create_at) VALUES (2, 'Femenino', '2025-03-23 16:37:41.316767');
INSERT INTO public.genders (id, gender_name, create_at) VALUES (3, 'Otro', '2025-03-23 16:37:41.316767');


--
-- TOC entry 5289 (class 0 OID 41385)
-- Dependencies: 221
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.groups (id, name, description) VALUES (1, 'admin', 'Administrador');
INSERT INTO public.groups (id, name, description) VALUES (2, 'manager', 'Gestor');
INSERT INTO public.groups (id, name, description) VALUES (3, 'technical', 'Técnico');
INSERT INTO public.groups (id, name, description) VALUES (4, 'members', 'Usuario');


--
-- TOC entry 5299 (class 0 OID 41467)
-- Dependencies: 231
-- Data for Name: login_attempts; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.login_attempts (id, ip_address, login, "time") VALUES (4, '127.0.0.1', 'alakentu', 1752168412);


--
-- TOC entry 5308 (class 0 OID 948196)
-- Dependencies: 241
-- Data for Name: logs_activity_y2025q1; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 5309 (class 0 OID 948203)
-- Dependencies: 242
-- Data for Name: logs_activity_y2025q2; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.logs_activity_y2025q2 (id, ip_address, title, description, create_at) VALUES (2, '127.0.0.1', 'Creación de Ticket', 'Usuario creó ticket #14', '2025-06-25 23:00:23.854552');


--
-- TOC entry 5332 (class 0 OID 948625)
-- Dependencies: 265
-- Data for Name: logs_activity_y2025q3; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.logs_activity_y2025q3 (id, ip_address, title, description, create_at) VALUES (13, '127.0.0.1', 'Creación de Ticket', 'Usuario creó ticket #25', '2025-07-02 01:19:27.041786');
INSERT INTO public.logs_activity_y2025q3 (id, ip_address, title, description, create_at) VALUES (15, '127.0.0.1', 'Creación de Ticket #27', 'Usuario creó ticket #27', '2025-07-03 23:40:51.067153');
INSERT INTO public.logs_activity_y2025q3 (id, ip_address, title, description, create_at) VALUES (16, '127.0.0.1', 'Creación de Ticket #28', 'Usuario creó ticket #28', '2025-07-04 08:01:22.507093');
INSERT INTO public.logs_activity_y2025q3 (id, ip_address, title, description, create_at) VALUES (17, '127.0.0.1', 'Creación de Ticket #29', 'Usuario creó ticket #29', '2025-07-04 11:06:50.20648');
INSERT INTO public.logs_activity_y2025q3 (id, ip_address, title, description, create_at) VALUES (18, '127.0.0.1', 'Creación de Ticket #30', 'Usuario creó ticket #30', '2025-07-04 21:32:42.951175');
INSERT INTO public.logs_activity_y2025q3 (id, ip_address, title, description, create_at) VALUES (19, '127.0.0.1', 'Creación de Ticket #31', 'Usuario creó ticket #31', '2025-07-11 11:06:05.272185');


--
-- TOC entry 5333 (class 0 OID 948633)
-- Dependencies: 266
-- Data for Name: logs_activity_y2025q4; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 5325 (class 0 OID 948424)
-- Dependencies: 258
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.migrations (id, version, class, "group", namespace, "time", batch) VALUES (1, '2025-06-21-210328', 'App\Database\Migrations\Notifications', 'default', 'App', 1750541575, 1);


--
-- TOC entry 5297 (class 0 OID 41456)
-- Dependencies: 229
-- Data for Name: nationality; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.nationality (id, code, name, create_at) VALUES (1, 'V', 'Venezolano', '2025-03-23 16:37:41.316767');
INSERT INTO public.nationality (id, code, name, create_at) VALUES (2, 'E', 'Extranjero', '2025-03-23 16:37:41.316767');


--
-- TOC entry 5327 (class 0 OID 948433)
-- Dependencies: 260
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.notifications (id, user_id, type, related_id, title, message, is_read, read_at, created_at, updated_at) VALUES (1, 1, 'new_ticket', 9, 'Nuevo Ticket Disponible', 'Hay un nuevo ticket que requiere atención', 1, '2025-07-02 02:42:24', '2025-06-24 17:38:57', '2025-07-02 02:42:24');
INSERT INTO public.notifications (id, user_id, type, related_id, title, message, is_read, read_at, created_at, updated_at) VALUES (10, 1, 'new_ticket', 25, 'Nuevo Ticket Disponible', 'Hay un nuevo ticket que requiere atención', 1, '2025-07-03 09:58:13', '2025-07-02 02:41:32.620288', '2025-07-03 09:58:13');
INSERT INTO public.notifications (id, user_id, type, related_id, title, message, is_read, read_at, created_at, updated_at) VALUES (17, 2, 'new_ticket', 30, 'Nuevo Ticket con proridad: BAJA', 'Ticket #30: Ticket de hy 04072025', 1, '2025-07-04 21:44:55', '2025-07-04 21:32:42', '2025-07-04 21:44:55');
INSERT INTO public.notifications (id, user_id, type, related_id, title, message, is_read, read_at, created_at, updated_at) VALUES (3, 3, 'new_ticket', 9, 'Nuevo Ticket Disponible', 'Hay un nuevo ticket que requiere atención', 1, '2025-07-04 11:38:27', '2025-06-24 17:38:57', '2025-07-04 11:38:27');
INSERT INTO public.notifications (id, user_id, type, related_id, title, message, is_read, read_at, created_at, updated_at) VALUES (6, 3, 'new_ticket', 10, 'Nuevo Ticket Disponible', 'Hay un nuevo ticket que requiere atención', 1, '2025-07-04 11:38:44', '2025-06-25 06:38:43', '2025-07-04 11:38:44');
INSERT INTO public.notifications (id, user_id, type, related_id, title, message, is_read, read_at, created_at, updated_at) VALUES (12, 3, 'new_ticket', 25, 'Nuevo Ticket Disponible', 'Hay un nuevo ticket que requiere atención', 1, '2025-07-04 11:38:57', '2025-07-02 02:41:32.620288', '2025-07-04 11:38:57');
INSERT INTO public.notifications (id, user_id, type, related_id, title, message, is_read, read_at, created_at, updated_at) VALUES (15, 3, 'new_ticket', 28, 'Nuevo Ticket (MEDIA)', 'Ticket #28: Nuevo ticket 04072025', 1, '2025-07-04 11:44:33', '2025-07-04 08:01:22', '2025-07-04 11:44:33');
INSERT INTO public.notifications (id, user_id, type, related_id, title, message, is_read, read_at, created_at, updated_at) VALUES (8, 2, 'new_ticket', 11, 'Nuevo Ticket Disponible', 'Hay un nuevo ticket que requiere atención', 1, '2025-07-04 16:20:49', '2025-06-25 07:29:20', '2025-07-04 16:20:49');
INSERT INTO public.notifications (id, user_id, type, related_id, title, message, is_read, read_at, created_at, updated_at) VALUES (5, 2, 'new_ticket', 10, 'Nuevo Ticket Disponible', 'Hay un nuevo ticket que requiere atención', 1, '2025-07-04 16:21:02', '2025-06-25 06:38:43', '2025-07-04 16:21:02');
INSERT INTO public.notifications (id, user_id, type, related_id, title, message, is_read, read_at, created_at, updated_at) VALUES (4, 1, 'new_ticket', 10, 'Nuevo Ticket Disponible', 'Hay un nuevo ticket que requiere atención', 1, '2025-07-04 16:21:10', '2025-06-25 06:38:43', '2025-07-04 16:21:10');
INSERT INTO public.notifications (id, user_id, type, related_id, title, message, is_read, read_at, created_at, updated_at) VALUES (7, 1, 'new_ticket', 11, 'Nuevo Ticket Disponible', 'Hay un nuevo ticket que requiere atención', 1, '2025-07-04 16:30:20', '2025-06-25 07:29:20', '2025-07-04 16:30:20');
INSERT INTO public.notifications (id, user_id, type, related_id, title, message, is_read, read_at, created_at, updated_at) VALUES (14, 3, 'new_ticket', 27, 'Nuevo Ticket (BAJA)', 'Ticket #27: Prueba de ticket 03072025', 1, '2025-07-04 16:35:48', '2025-07-03 23:40:51', '2025-07-04 16:35:48');
INSERT INTO public.notifications (id, user_id, type, related_id, title, message, is_read, read_at, created_at, updated_at) VALUES (2, 2, 'new_ticket', 9, 'Nuevo Ticket Disponible', 'Hay un nuevo ticket que requiere atención', 1, '2025-07-04 20:10:39', '2025-06-24 17:38:57', '2025-07-04 20:10:39');
INSERT INTO public.notifications (id, user_id, type, related_id, title, message, is_read, read_at, created_at, updated_at) VALUES (9, 3, 'new_ticket', 11, 'Nuevo Ticket Disponible', 'Hay un nuevo ticket que requiere atención', 1, '2025-07-04 20:11:10', '2025-06-25 07:29:20', '2025-07-04 20:11:10');
INSERT INTO public.notifications (id, user_id, type, related_id, title, message, is_read, read_at, created_at, updated_at) VALUES (16, 2, 'new_ticket', 29, 'Nuevo Ticket con proridad: ALTA', 'Ticket #29: Ticket de soporte 04072025', 1, '2025-07-04 20:52:41', '2025-07-04 11:06:50', '2025-07-04 20:52:41');
INSERT INTO public.notifications (id, user_id, type, related_id, title, message, is_read, read_at, created_at, updated_at) VALUES (11, 2, 'new_ticket', 25, 'Nuevo Ticket Disponible', 'Hay un nuevo ticket que requiere atención', 1, '2025-07-04 21:15:20', '2025-07-02 02:41:32.620288', '2025-07-04 21:15:20');
INSERT INTO public.notifications (id, user_id, type, related_id, title, message, is_read, read_at, created_at, updated_at) VALUES (18, 3, 'new_ticket', 31, 'Nuevo Ticket con proridad: BAJA', 'Ticket #31: TIcket de hoy 11072025', 1, '2025-07-11 11:11:22', '2025-07-11 11:06:05', '2025-07-11 11:11:22');


--
-- TOC entry 5341 (class 0 OID 949776)
-- Dependencies: 289
-- Data for Name: region; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.region (id, region_id, name) VALUES (1, 10, 'REGIÓN CENTRAL');
INSERT INTO public.region (id, region_id, name) VALUES (2, 21, 'REGIÓN CAPITAL');


--
-- TOC entry 5323 (class 0 OID 948375)
-- Dependencies: 256
-- Data for Name: session_logs; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.session_logs (id, user_id, action, ip_address, user_agent, created_at) VALUES (1, 1, 'login', '127.0.0.1', NULL, '2025-06-21 17:35:13');
INSERT INTO public.session_logs (id, user_id, action, ip_address, user_agent, created_at) VALUES (2, 1, 'logout', '127.0.0.1', NULL, '2025-06-22 00:00:50');
INSERT INTO public.session_logs (id, user_id, action, ip_address, user_agent, created_at) VALUES (3, 1, 'login', '127.0.0.1', NULL, '2025-06-22 00:01:00');
INSERT INTO public.session_logs (id, user_id, action, ip_address, user_agent, created_at) VALUES (4, 1, 'login', '127.0.0.1', NULL, '2025-06-22 08:55:17');
INSERT INTO public.session_logs (id, user_id, action, ip_address, user_agent, created_at) VALUES (5, 1, 'login', '127.0.0.1', NULL, '2025-06-22 12:33:49');
INSERT INTO public.session_logs (id, user_id, action, ip_address, user_agent, created_at) VALUES (6, 1, 'logout', '127.0.0.1', NULL, '2025-06-22 17:00:17');
INSERT INTO public.session_logs (id, user_id, action, ip_address, user_agent, created_at) VALUES (7, 1, 'login', '127.0.0.1', NULL, '2025-06-22 17:00:23');
INSERT INTO public.session_logs (id, user_id, action, ip_address, user_agent, created_at) VALUES (8, 1, 'login', '127.0.0.1', NULL, '2025-06-22 17:23:51');
INSERT INTO public.session_logs (id, user_id, action, ip_address, user_agent, created_at) VALUES (9, 1, 'login', '127.0.0.1', NULL, '2025-06-23 13:36:59');
INSERT INTO public.session_logs (id, user_id, action, ip_address, user_agent, created_at) VALUES (10, 1, 'login', '127.0.0.1', NULL, '2025-06-24 01:43:01');
INSERT INTO public.session_logs (id, user_id, action, ip_address, user_agent, created_at) VALUES (11, 1, 'login', '127.0.0.1', NULL, '2025-06-24 06:52:14');
INSERT INTO public.session_logs (id, user_id, action, ip_address, user_agent, created_at) VALUES (12, 1, 'login', '127.0.0.1', NULL, '2025-06-24 17:17:02');
INSERT INTO public.session_logs (id, user_id, action, ip_address, user_agent, created_at) VALUES (14, 1, 'login', '127.0.0.1', NULL, '2025-06-25 06:33:12');
INSERT INTO public.session_logs (id, user_id, action, ip_address, user_agent, created_at) VALUES (15, 1, 'login', '127.0.0.1', NULL, '2025-06-25 13:07:04');
INSERT INTO public.session_logs (id, user_id, action, ip_address, user_agent, created_at) VALUES (16, 1, 'logout', '127.0.0.1', NULL, '2025-06-25 13:54:36');
INSERT INTO public.session_logs (id, user_id, action, ip_address, user_agent, created_at) VALUES (17, 1, 'login', '127.0.0.1', NULL, '2025-06-25 13:54:42');
INSERT INTO public.session_logs (id, user_id, action, ip_address, user_agent, created_at) VALUES (18, 1, 'logout', '127.0.0.1', NULL, '2025-06-25 14:29:55');
INSERT INTO public.session_logs (id, user_id, action, ip_address, user_agent, created_at) VALUES (19, 1, 'login', '127.0.0.1', NULL, '2025-06-25 14:30:00');
INSERT INTO public.session_logs (id, user_id, action, ip_address, user_agent, created_at) VALUES (20, 1, 'logout', '127.0.0.1', NULL, '2025-06-25 14:34:38');
INSERT INTO public.session_logs (id, user_id, action, ip_address, user_agent, created_at) VALUES (21, 1, 'login', '127.0.0.1', NULL, '2025-06-25 14:34:58');
INSERT INTO public.session_logs (id, user_id, action, ip_address, user_agent, created_at) VALUES (22, 1, 'logout', '127.0.0.1', NULL, '2025-06-25 14:40:01');
INSERT INTO public.session_logs (id, user_id, action, ip_address, user_agent, created_at) VALUES (23, 1, 'login', '127.0.0.1', NULL, '2025-06-25 14:40:13');
INSERT INTO public.session_logs (id, user_id, action, ip_address, user_agent, created_at) VALUES (24, 1, 'logout', '127.0.0.1', NULL, '2025-06-25 15:37:42');
INSERT INTO public.session_logs (id, user_id, action, ip_address, user_agent, created_at) VALUES (25, 1, 'login', '127.0.0.1', NULL, '2025-06-25 16:12:59');
INSERT INTO public.session_logs (id, user_id, action, ip_address, user_agent, created_at) VALUES (26, 1, 'login', '127.0.0.1', NULL, '2025-06-25 21:37:49');
INSERT INTO public.session_logs (id, user_id, action, ip_address, user_agent, created_at) VALUES (27, 1, 'login', '127.0.0.1', NULL, '2025-06-26 07:50:35');
INSERT INTO public.session_logs (id, user_id, action, ip_address, user_agent, created_at) VALUES (28, 1, 'login', '127.0.0.1', NULL, '2025-06-26 13:23:17');
INSERT INTO public.session_logs (id, user_id, action, ip_address, user_agent, created_at) VALUES (29, 1, 'logout', '127.0.0.1', NULL, '2025-06-26 13:29:48');
INSERT INTO public.session_logs (id, user_id, action, ip_address, user_agent, created_at) VALUES (30, 1, 'login', '127.0.0.1', NULL, '2025-06-30 21:22:53');
INSERT INTO public.session_logs (id, user_id, action, ip_address, user_agent, created_at) VALUES (31, 1, 'logout', '127.0.0.1', NULL, '2025-07-01 00:40:34');
INSERT INTO public.session_logs (id, user_id, action, ip_address, user_agent, created_at) VALUES (32, 1, 'login', '127.0.0.1', NULL, '2025-07-01 10:39:11');
INSERT INTO public.session_logs (id, user_id, action, ip_address, user_agent, created_at) VALUES (33, 1, 'logout', '127.0.0.1', NULL, '2025-07-01 10:55:15');
INSERT INTO public.session_logs (id, user_id, action, ip_address, user_agent, created_at) VALUES (34, 1, 'login', '127.0.0.1', NULL, '2025-07-01 23:16:05');
INSERT INTO public.session_logs (id, user_id, action, ip_address, user_agent, created_at) VALUES (35, 1, 'logout', '127.0.0.1', NULL, '2025-07-02 00:31:09');
INSERT INTO public.session_logs (id, user_id, action, ip_address, user_agent, created_at) VALUES (36, 1, 'login', '127.0.0.1', NULL, '2025-07-02 00:31:23');
INSERT INTO public.session_logs (id, user_id, action, ip_address, user_agent, created_at) VALUES (37, 1, 'logout', '127.0.0.1', NULL, '2025-07-02 01:18:23');
INSERT INTO public.session_logs (id, user_id, action, ip_address, user_agent, created_at) VALUES (38, 1, 'login', '127.0.0.1', NULL, '2025-07-02 01:18:33');
INSERT INTO public.session_logs (id, user_id, action, ip_address, user_agent, created_at) VALUES (39, 1, 'logout', '127.0.0.1', NULL, '2025-07-02 02:25:08');
INSERT INTO public.session_logs (id, user_id, action, ip_address, user_agent, created_at) VALUES (40, 1, 'login', '127.0.0.1', NULL, '2025-07-02 02:25:19');
INSERT INTO public.session_logs (id, user_id, action, ip_address, user_agent, created_at) VALUES (41, 1, 'logout', '127.0.0.1', NULL, '2025-07-02 02:45:05');
INSERT INTO public.session_logs (id, user_id, action, ip_address, user_agent, created_at) VALUES (42, 1, 'login', '127.0.0.1', NULL, '2025-07-02 02:45:29');
INSERT INTO public.session_logs (id, user_id, action, ip_address, user_agent, created_at) VALUES (43, 1, 'logout', '127.0.0.1', NULL, '2025-07-02 03:07:45');
INSERT INTO public.session_logs (id, user_id, action, ip_address, user_agent, created_at) VALUES (44, 1, 'login', '127.0.0.1', NULL, '2025-07-03 07:22:07');
INSERT INTO public.session_logs (id, user_id, action, ip_address, user_agent, created_at) VALUES (45, 1, 'logout', '127.0.0.1', NULL, '2025-07-03 09:58:56');
INSERT INTO public.session_logs (id, user_id, action, ip_address, user_agent, created_at) VALUES (46, 1, 'login', '127.0.0.1', NULL, '2025-07-03 09:59:06');
INSERT INTO public.session_logs (id, user_id, action, ip_address, user_agent, created_at) VALUES (47, 1, 'login', '127.0.0.1', NULL, '2025-07-03 14:17:19');
INSERT INTO public.session_logs (id, user_id, action, ip_address, user_agent, created_at) VALUES (48, 1, 'login', '127.0.0.1', NULL, '2025-07-03 22:33:05');
INSERT INTO public.session_logs (id, user_id, action, ip_address, user_agent, created_at) VALUES (49, 1, 'logout', '127.0.0.1', NULL, '2025-07-03 23:47:18');
INSERT INTO public.session_logs (id, user_id, action, ip_address, user_agent, created_at) VALUES (50, 1, 'login', '127.0.0.1', NULL, '2025-07-04 07:49:03');
INSERT INTO public.session_logs (id, user_id, action, ip_address, user_agent, created_at) VALUES (51, 1, 'logout', '127.0.0.1', NULL, '2025-07-04 10:21:33');
INSERT INTO public.session_logs (id, user_id, action, ip_address, user_agent, created_at) VALUES (52, 1, 'login', '127.0.0.1', NULL, '2025-07-04 11:02:58');
INSERT INTO public.session_logs (id, user_id, action, ip_address, user_agent, created_at) VALUES (53, 1, 'logout', '127.0.0.1', NULL, '2025-07-04 11:07:35');
INSERT INTO public.session_logs (id, user_id, action, ip_address, user_agent, created_at) VALUES (54, 3, 'login', '127.0.0.1', NULL, '2025-07-04 11:09:25');
INSERT INTO public.session_logs (id, user_id, action, ip_address, user_agent, created_at) VALUES (55, 1, 'login', '127.0.0.1', NULL, '2025-07-04 20:08:36');
INSERT INTO public.session_logs (id, user_id, action, ip_address, user_agent, created_at) VALUES (56, 1, 'logout', '127.0.0.1', NULL, '2025-07-04 20:09:06');
INSERT INTO public.session_logs (id, user_id, action, ip_address, user_agent, created_at) VALUES (57, 2, 'login', '127.0.0.1', NULL, '2025-07-04 20:09:43');
INSERT INTO public.session_logs (id, user_id, action, ip_address, user_agent, created_at) VALUES (58, 2, 'logout', '127.0.0.1', NULL, '2025-07-04 20:50:49');
INSERT INTO public.session_logs (id, user_id, action, ip_address, user_agent, created_at) VALUES (59, 2, 'login', '127.0.0.1', NULL, '2025-07-04 20:51:04');
INSERT INTO public.session_logs (id, user_id, action, ip_address, user_agent, created_at) VALUES (60, 2, 'logout', '127.0.0.1', NULL, '2025-07-04 21:30:55');
INSERT INTO public.session_logs (id, user_id, action, ip_address, user_agent, created_at) VALUES (61, 4, 'login', '127.0.0.1', NULL, '2025-07-04 21:31:56');
INSERT INTO public.session_logs (id, user_id, action, ip_address, user_agent, created_at) VALUES (62, 4, 'logout', '127.0.0.1', NULL, '2025-07-04 21:33:18');
INSERT INTO public.session_logs (id, user_id, action, ip_address, user_agent, created_at) VALUES (63, 2, 'login', '127.0.0.1', NULL, '2025-07-04 21:33:46');
INSERT INTO public.session_logs (id, user_id, action, ip_address, user_agent, created_at) VALUES (64, 2, 'logout', '127.0.0.1', NULL, '2025-07-04 21:35:09');
INSERT INTO public.session_logs (id, user_id, action, ip_address, user_agent, created_at) VALUES (65, 3, 'login', '127.0.0.1', NULL, '2025-07-04 21:35:28');
INSERT INTO public.session_logs (id, user_id, action, ip_address, user_agent, created_at) VALUES (66, 3, 'logout', '127.0.0.1', NULL, '2025-07-04 21:35:51');
INSERT INTO public.session_logs (id, user_id, action, ip_address, user_agent, created_at) VALUES (67, 1, 'login', '127.0.0.1', NULL, '2025-07-04 21:35:56');
INSERT INTO public.session_logs (id, user_id, action, ip_address, user_agent, created_at) VALUES (68, 1, 'logout', '127.0.0.1', NULL, '2025-07-04 21:36:12');
INSERT INTO public.session_logs (id, user_id, action, ip_address, user_agent, created_at) VALUES (69, 2, 'login', '127.0.0.1', NULL, '2025-07-04 21:36:30');
INSERT INTO public.session_logs (id, user_id, action, ip_address, user_agent, created_at) VALUES (70, 2, 'logout', '127.0.0.1', NULL, '2025-07-04 21:49:04');
INSERT INTO public.session_logs (id, user_id, action, ip_address, user_agent, created_at) VALUES (71, 1, 'login', '127.0.0.1', NULL, '2025-07-09 14:20:48');
INSERT INTO public.session_logs (id, user_id, action, ip_address, user_agent, created_at) VALUES (72, 1, 'logout', '127.0.0.1', NULL, '2025-07-09 14:32:51');
INSERT INTO public.session_logs (id, user_id, action, ip_address, user_agent, created_at) VALUES (73, 1, 'login', '127.0.0.1', NULL, '2025-07-10 07:46:22');
INSERT INTO public.session_logs (id, user_id, action, ip_address, user_agent, created_at) VALUES (74, 1, 'logout', '127.0.0.1', NULL, '2025-07-10 13:11:59');
INSERT INTO public.session_logs (id, user_id, action, ip_address, user_agent, created_at) VALUES (75, 1, 'login', '127.0.0.1', NULL, '2025-07-10 13:13:19');
INSERT INTO public.session_logs (id, user_id, action, ip_address, user_agent, created_at) VALUES (76, 1, 'logout', '127.0.0.1', NULL, '2025-07-10 13:20:12');
INSERT INTO public.session_logs (id, user_id, action, ip_address, user_agent, created_at) VALUES (77, 1, 'login', '127.0.0.1', NULL, '2025-07-10 13:21:40');
INSERT INTO public.session_logs (id, user_id, action, ip_address, user_agent, created_at) VALUES (78, 1, 'logout', '127.0.0.1', NULL, '2025-07-10 13:24:04');
INSERT INTO public.session_logs (id, user_id, action, ip_address, user_agent, created_at) VALUES (79, 1, 'login', '127.0.0.1', NULL, '2025-07-10 13:26:58');
INSERT INTO public.session_logs (id, user_id, action, ip_address, user_agent, created_at) VALUES (80, 1, 'logout', '127.0.0.1', NULL, '2025-07-10 13:27:43');
INSERT INTO public.session_logs (id, user_id, action, ip_address, user_agent, created_at) VALUES (81, 1, 'login', '127.0.0.1', NULL, '2025-07-11 11:04:45');
INSERT INTO public.session_logs (id, user_id, action, ip_address, user_agent, created_at) VALUES (82, 1, 'logout', '127.0.0.1', NULL, '2025-07-11 11:10:23');
INSERT INTO public.session_logs (id, user_id, action, ip_address, user_agent, created_at) VALUES (83, 3, 'login', '127.0.0.1', NULL, '2025-07-11 11:10:54');
INSERT INTO public.session_logs (id, user_id, action, ip_address, user_agent, created_at) VALUES (84, 3, 'logout', '127.0.0.1', NULL, '2025-07-11 11:12:31');
INSERT INTO public.session_logs (id, user_id, action, ip_address, user_agent, created_at) VALUES (85, 1, 'login', '127.0.0.1', NULL, '2025-07-11 11:12:35');
INSERT INTO public.session_logs (id, user_id, action, ip_address, user_agent, created_at) VALUES (86, 1, 'logout', '127.0.0.1', NULL, '2025-07-11 11:24:11');


--
-- TOC entry 5304 (class 0 OID 41491)
-- Dependencies: 236
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sessions (id, ip_address, "timestamp", data) VALUES ('app_sessions:0e5af608e818996e93a5f203a96d90bc', '127.0.0.1', '2025-07-11 11:10:54.271473-04', '\x5f5f63695f6c6173745f726567656e65726174657c693a313735323234363635343b5f63695f70726576696f75735f75726c7c733a33333a2268747470733a2f2f7365727669646f722e7365722f73696765736f742f73697465223b6964656e746974797c733a383a226a74617261636865223b757365726e616d657c733a383a226a74617261636865223b66697273745f6e616d657c733a353a224a6f73c3a9223b6d6964646c655f6e616d657c733a363a2252616661656c223b66697273745f6c6173745f6e616d657c733a373a2254617261636865223b7365636f6e645f6c6173745f6e616d657c733a393a22476f6e7ac3a16c657a223b67656e6465727c733a393a224d617363756c696e6f223b6e6174696f6e616c6974797c733a31303a2256656e657a6f6c616e6f223b70686f746f7c733a32383a226173736574732f70726f66696c65732f33313431363434362e6a7067223b70686f6e657c733a31313a223034313235333838303734223b636f6d70616e797c733a373a2253696765736f74223b656d61696c7c733a32303a226a746172616368654073696765736f742e636f6d223b757365725f69647c733a313a2233223b69705f616464726573737c733a393a223132372e302e302e31223b6f6c645f6c6173745f6c6f67696e7c733a33353a22537520c3ba6c74696d612076697369746120667565206861636520362064c3ad61732e223b6c6173745f636865636b7c693a313735323234363635343b6163636573737c733a393a22746563686e6963616c223b726f6c657c733a383a2254c3a9636e69636f223b');
INSERT INTO public.sessions (id, ip_address, "timestamp", data) VALUES ('app_sessions:90f0e3f0b655136e3c2bf73407a3e292', '127.0.0.1', '2025-07-11 11:12:35.596018-04', '\x5f5f63695f6c6173745f726567656e65726174657c693a313735323234363735353b5f63695f70726576696f75735f75726c7c733a33333a2268747470733a2f2f7365727669646f722e7365722f73696765736f742f73697465223b6964656e746974797c733a383a22676d656e65736573223b757365726e616d657c733a383a22676d656e65736573223b66697273745f6e616d657c733a373a22476f6e7a616c6f223b6d6964646c655f6e616d657c733a363a2252616661656c223b66697273745f6c6173745f6e616d657c733a373a224d656e65736573223b7365636f6e645f6c6173745f6e616d657c733a353a224172696173223b67656e6465727c733a393a224d617363756c696e6f223b6e6174696f6e616c6974797c733a31303a2256656e657a6f6c616e6f223b70686f746f7c733a32373a226173736574732f70726f66696c65732f383236323434372e6a7067223b70686f6e657c733a31313a223034323431373333323339223b636f6d70616e797c733a373a2253696765736f74223b656d61696c7c733a32323a22676d656e6573657340796f75646f6d61696e2e636f6d223b757365725f69647c733a313a2231223b69705f616464726573737c733a393a223132372e302e302e31223b6f6c645f6c6173745f6c6f67696e7c733a33373a22537520c3ba6c74696d61207669736974612066756520686163652037206d696e75746f732e223b6c6173745f636865636b7c693a313735323234363735353b6163636573737c733a353a2261646d696e223b726f6c657c733a31333a2241646d696e6973747261646f72223b');
INSERT INTO public.sessions (id, ip_address, "timestamp", data) VALUES ('app_sessions:712a93025ab706fa242a1d0ac9b9a847', '127.0.0.1', '2025-07-11 11:21:43.68912-04', '\x5f5f63695f6c6173745f726567656e65726174657c693a313735323234373330333b5f63695f70726576696f75735f75726c7c733a35313a2268747470733a2f2f7365727669646f722e7365722f73696765736f742f61646d696e2f75736572732f65646974757365722f32223b6964656e746974797c733a383a22676d656e65736573223b757365726e616d657c733a383a22676d656e65736573223b66697273745f6e616d657c733a373a22476f6e7a616c6f223b6d6964646c655f6e616d657c733a363a2252616661656c223b66697273745f6c6173745f6e616d657c733a373a224d656e65736573223b7365636f6e645f6c6173745f6e616d657c733a353a224172696173223b67656e6465727c733a393a224d617363756c696e6f223b6e6174696f6e616c6974797c733a31303a2256656e657a6f6c616e6f223b70686f746f7c733a32373a226173736574732f70726f66696c65732f383236323434372e6a7067223b70686f6e657c733a31313a223034323431373333323339223b636f6d70616e797c733a373a2253696765736f74223b656d61696c7c733a32323a22676d656e6573657340796f75646f6d61696e2e636f6d223b757365725f69647c733a313a2231223b69705f616464726573737c733a393a223132372e302e302e31223b6f6c645f6c6173745f6c6f67696e7c733a33373a22537520c3ba6c74696d61207669736974612066756520686163652037206d696e75746f732e223b6c6173745f636865636b7c693a313735323234363735353b6163636573737c733a353a2261646d696e223b726f6c657c733a31333a2241646d696e6973747261646f72223b637372665f6d6d7c733a33323a226532636139313061333038633561666164366533633430613161353964613030223b');
INSERT INTO public.sessions (id, ip_address, "timestamp", data) VALUES ('app_sessions:cf3851f37f47ce4ca08f8490d75fb62d', '127.0.0.1', '2025-07-11 11:24:13.045353-04', '\x5f5f63695f6c6173745f726567656e65726174657c693a313735323234373435313b5f63695f70726576696f75735f75726c7c733a33333a2268747470733a2f2f7365727669646f722e7365722f73696765736f742f73697465223b637372665f6d6d7c733a33323a223335613561306233623566313964653432313962633830333035306130353534223b');
INSERT INTO public.sessions (id, ip_address, "timestamp", data) VALUES ('app_sessions:5f3fbba32671b58f1c01a7360bbda76b', '127.0.0.1', '2025-07-11 11:04:45.309691-04', '\x5f5f63695f6c6173745f726567656e65726174657c693a313735323234363238353b5f63695f70726576696f75735f75726c7c733a33333a2268747470733a2f2f7365727669646f722e7365722f73696765736f742f73697465223b6964656e746974797c733a383a22676d656e65736573223b757365726e616d657c733a383a22676d656e65736573223b66697273745f6e616d657c733a373a22476f6e7a616c6f223b6d6964646c655f6e616d657c733a363a2252616661656c223b66697273745f6c6173745f6e616d657c733a373a224d656e65736573223b7365636f6e645f6c6173745f6e616d657c733a353a224172696173223b67656e6465727c733a393a224d617363756c696e6f223b6e6174696f6e616c6974797c733a31303a2256656e657a6f6c616e6f223b70686f746f7c733a32373a226173736574732f70726f66696c65732f383236323434372e6a7067223b70686f6e657c733a31313a223034323431373333323339223b636f6d70616e797c733a373a2253696765736f74223b656d61696c7c733a32323a22676d656e6573657340796f75646f6d61696e2e636f6d223b757365725f69647c733a313a2231223b69705f616464726573737c733a393a223132372e302e302e31223b6f6c645f6c6173745f6c6f67696e7c733a33353a22537520c3ba6c74696d612076697369746120667565206861636520323120686f72612e223b6c6173745f636865636b7c693a313735323234363238353b6163636573737c733a353a2261646d696e223b726f6c657c733a31333a2241646d696e6973747261646f72223b');
INSERT INTO public.sessions (id, ip_address, "timestamp", data) VALUES ('app_sessions:103a0e880986873a4a8a8222df554a01', '127.0.0.1', '2025-07-11 11:09:59.897651-04', '\x5f5f63695f6c6173745f726567656e65726174657c693a313735323234363539393b5f63695f70726576696f75735f75726c7c733a35333a2268747470733a2f2f7365727669646f722e7365722f73696765736f742f61646d696e2f7469636b6574732f64657461696c732f3331223b6964656e746974797c733a383a22676d656e65736573223b757365726e616d657c733a383a22676d656e65736573223b66697273745f6e616d657c733a373a22476f6e7a616c6f223b6d6964646c655f6e616d657c733a363a2252616661656c223b66697273745f6c6173745f6e616d657c733a373a224d656e65736573223b7365636f6e645f6c6173745f6e616d657c733a353a224172696173223b67656e6465727c733a393a224d617363756c696e6f223b6e6174696f6e616c6974797c733a31303a2256656e657a6f6c616e6f223b70686f746f7c733a32373a226173736574732f70726f66696c65732f383236323434372e6a7067223b70686f6e657c733a31313a223034323431373333323339223b636f6d70616e797c733a373a2253696765736f74223b656d61696c7c733a32323a22676d656e6573657340796f75646f6d61696e2e636f6d223b757365725f69647c733a313a2231223b69705f616464726573737c733a393a223132372e302e302e31223b6f6c645f6c6173745f6c6f67696e7c733a33353a22537520c3ba6c74696d612076697369746120667565206861636520323120686f72612e223b6c6173745f636865636b7c693a313735323234363238353b6163636573737c733a353a2261646d696e223b726f6c657c733a31333a2241646d696e6973747261646f72223b637372665f6d6d7c733a33323a223935383966303530653134663963363630626330396165303765393835643766223b');


--
-- TOC entry 5293 (class 0 OID 41408)
-- Dependencies: 225
-- Data for Name: siteconfig; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.siteconfig (id, name, description, address, state, country, postcode, telephone, rif, logo, author, list_limit, mailfrom, fromname, metadesc, metakey, offline, offline_message, created_at, created_user_id, updated_at, updated_user_id, deleted_at, version) VALUES (1, 'Sigesot', 'Sistema de gestión para solicitud de soporte técnico a las áreas.', 'AQUI LA DIRECCIÓN', 1, 232, 1012, '02125556677', 'G0000000000', 'assets/images/brand/logo.svg', 'OTIC', 20, 'otic@susitio.com', 'EMPRESA', 'EMPRESA :: SIGESOT', 'VENEZUELA,SOCIALISMO,TECNOLOGÍA,SOPORTE', 0, 'El sistema se encuentra en este momento cerrado por tareas de mantenimiento.<br/>Por favor, inténtelo nuevamente más tarde.', '2025-03-23 16:37:41.316767', 1, NULL, NULL, NULL, '1.0');


--
-- TOC entry 5301 (class 0 OID 41475)
-- Dependencies: 233
-- Data for Name: states; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.states (id, state, create_at) VALUES (1, 'Dtto. Capital', '2025-03-23 16:37:41.316767');
INSERT INTO public.states (id, state, create_at) VALUES (2, 'Edo. Anzoátegui', '2025-03-23 16:37:41.316767');
INSERT INTO public.states (id, state, create_at) VALUES (3, 'Edo. Apure', '2025-03-23 16:37:41.316767');
INSERT INTO public.states (id, state, create_at) VALUES (4, 'Edo. Aragua', '2025-03-23 16:37:41.316767');
INSERT INTO public.states (id, state, create_at) VALUES (5, 'Edo. Barinas', '2025-03-23 16:37:41.316767');
INSERT INTO public.states (id, state, create_at) VALUES (6, 'Edo. Bolívar', '2025-03-23 16:37:41.316767');
INSERT INTO public.states (id, state, create_at) VALUES (7, 'Edo. Carabobo', '2025-03-23 16:37:41.316767');
INSERT INTO public.states (id, state, create_at) VALUES (8, 'Edo. Cojedes', '2025-03-23 16:37:41.316767');
INSERT INTO public.states (id, state, create_at) VALUES (9, 'Edo. Falcón', '2025-03-23 16:37:41.316767');
INSERT INTO public.states (id, state, create_at) VALUES (10, 'Edo. Guárico', '2025-03-23 16:37:41.316767');
INSERT INTO public.states (id, state, create_at) VALUES (11, 'Edo. Lara', '2025-03-23 16:37:41.316767');
INSERT INTO public.states (id, state, create_at) VALUES (12, 'Edo. Mérida', '2025-03-23 16:37:41.316767');
INSERT INTO public.states (id, state, create_at) VALUES (13, 'Edo. Miranda', '2025-03-23 16:37:41.316767');
INSERT INTO public.states (id, state, create_at) VALUES (14, 'Edo. Monagas', '2025-03-23 16:37:41.316767');
INSERT INTO public.states (id, state, create_at) VALUES (16, 'Edo. Portuguesa', '2025-03-23 16:37:41.316767');
INSERT INTO public.states (id, state, create_at) VALUES (15, 'Edo. Nueva Esparta', '2025-03-23 16:37:41.316767');
INSERT INTO public.states (id, state, create_at) VALUES (17, 'Edo. Sucre', '2025-03-23 16:37:41.316767');
INSERT INTO public.states (id, state, create_at) VALUES (18, 'Edo. Táchira', '2025-03-23 16:37:41.316767');
INSERT INTO public.states (id, state, create_at) VALUES (19, 'Edo. Trujillo', '2025-03-23 16:37:41.316767');
INSERT INTO public.states (id, state, create_at) VALUES (20, 'Edo. Yaracuy', '2025-03-23 16:37:41.316767');
INSERT INTO public.states (id, state, create_at) VALUES (21, 'Edo. Zulia', '2025-03-23 16:37:41.316767');
INSERT INTO public.states (id, state, create_at) VALUES (22, 'Edo. Amazonas', '2025-03-23 16:37:41.316767');
INSERT INTO public.states (id, state, create_at) VALUES (23, 'Edo. Delta Amacuro', '2025-03-23 16:37:41.316767');
INSERT INTO public.states (id, state, create_at) VALUES (24, 'Edo. La Guaira', '2025-03-23 16:37:41.316767');


--
-- TOC entry 5329 (class 0 OID 948513)
-- Dependencies: 262
-- Data for Name: technician_assignments; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.technician_assignments (id, technician_id, ticket_id, assigned_at, completed_at, status) VALUES (2, 3, 14, '2025-06-25 23:00:23', NULL, 'asignado');
INSERT INTO public.technician_assignments (id, technician_id, ticket_id, assigned_at, completed_at, status) VALUES (3, 3, 11, '2025-07-01 00:35:06', NULL, 'asignado');
INSERT INTO public.technician_assignments (id, technician_id, ticket_id, assigned_at, completed_at, status) VALUES (4, 2, 10, '2025-07-01 00:40:20', NULL, 'asignado');
INSERT INTO public.technician_assignments (id, technician_id, ticket_id, assigned_at, completed_at, status) VALUES (15, 2, 25, '2025-07-02 01:19:27', NULL, 'asignado');
INSERT INTO public.technician_assignments (id, technician_id, ticket_id, assigned_at, completed_at, status) VALUES (17, 3, 27, '2025-07-03 23:40:51', NULL, 'asignado');
INSERT INTO public.technician_assignments (id, technician_id, ticket_id, assigned_at, completed_at, status) VALUES (18, 3, 28, '2025-07-04 08:01:22', NULL, 'asignado');
INSERT INTO public.technician_assignments (id, technician_id, ticket_id, assigned_at, completed_at, status) VALUES (19, 2, 29, '2025-07-04 11:06:50', NULL, 'asignado');
INSERT INTO public.technician_assignments (id, technician_id, ticket_id, assigned_at, completed_at, status) VALUES (20, 2, 30, '2025-07-04 21:32:42', NULL, 'asignado');
INSERT INTO public.technician_assignments (id, technician_id, ticket_id, assigned_at, completed_at, status) VALUES (21, 3, 31, '2025-07-11 11:06:05', NULL, 'asignado');


--
-- TOC entry 5319 (class 0 OID 948323)
-- Dependencies: 252
-- Data for Name: ticket_attachments; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.ticket_attachments (id, ticket_id, user_id, file_name, file_path, file_size, file_type, uploaded_at) VALUES (1, 1, 1, 'error-sistema.png', 'https://picsum.photos/800/600?random=1', 245760, 'image/png', '2025-06-21 18:40:00');
INSERT INTO public.ticket_attachments (id, ticket_id, user_id, file_name, file_path, file_size, file_type, uploaded_at) VALUES (2, 1, 2, 'permisos-usuario.pdf', 'https://example.com/docs/permisos.pdf', 512000, 'application/pdf', '2025-06-21 19:20:00');
INSERT INTO public.ticket_attachments (id, ticket_id, user_id, file_name, file_path, file_size, file_type, uploaded_at) VALUES (3, 2, 3, 'impresora-error.jpg', 'https://picsum.photos/800/600?random=2', 367001, 'image/jpeg', '2025-06-18 08:25:00');
INSERT INTO public.ticket_attachments (id, ticket_id, user_id, file_name, file_path, file_size, file_type, uploaded_at) VALUES (4, 2, 5, 'modelo-cartucho.pdf', 'https://example.com/docs/cartucho-hp.pdf', 420000, 'application/pdf', '2025-06-18 15:00:00');
INSERT INTO public.ticket_attachments (id, ticket_id, user_id, file_name, file_path, file_size, file_type, uploaded_at) VALUES (5, 3, 2, 'captura-error-login.png', 'https://unsplash.com/photos/random1', 310245, 'image/png', '2025-06-19 14:30:00');
INSERT INTO public.ticket_attachments (id, ticket_id, user_id, file_name, file_path, file_size, file_type, uploaded_at) VALUES (6, 4, 4, 'speedtest-resultado.jpg', 'https://picsum.photos/800/600?random=3', 289123, 'image/jpeg', '2025-06-17 09:40:00');
INSERT INTO public.ticket_attachments (id, ticket_id, user_id, file_name, file_path, file_size, file_type, uploaded_at) VALUES (7, 4, 3, 'reporte-red.pdf', 'https://example.com/docs/reporte-red.pdf', 620000, 'application/pdf', '2025-06-18 16:30:00');
INSERT INTO public.ticket_attachments (id, ticket_id, user_id, file_name, file_path, file_size, file_type, uploaded_at) VALUES (8, 5, 5, 'requisitos-proyecto.docx', 'https://example.com/docs/requisitos.docx', 185000, 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', '2025-06-20 11:20:00');
INSERT INTO public.ticket_attachments (id, ticket_id, user_id, file_name, file_path, file_size, file_type, uploaded_at) VALUES (9, 6, 1, 'error-adjunto.png', 'https://unsplash.com/photos/random2', 275432, 'image/png', '2025-06-19 16:40:00');
INSERT INTO public.ticket_attachments (id, ticket_id, user_id, file_name, file_path, file_size, file_type, uploaded_at) VALUES (10, 6, 2, 'configuracion-correo.pdf', 'https://example.com/docs/config-correo.pdf', 410000, 'application/pdf', '2025-06-20 10:00:00');
INSERT INTO public.ticket_attachments (id, ticket_id, user_id, file_name, file_path, file_size, file_type, uploaded_at) VALUES (11, 7, 3, 'teclado-danado.jpg', 'https://picsum.photos/800/600?random=4', 398765, 'image/jpeg', '2025-06-21 08:55:00');
INSERT INTO public.ticket_attachments (id, ticket_id, user_id, file_name, file_path, file_size, file_type, uploaded_at) VALUES (12, 8, 2, 'estructura-bd.png', 'https://unsplash.com/photos/random3', 321098, 'image/png', '2025-06-15 13:30:00');
INSERT INTO public.ticket_attachments (id, ticket_id, user_id, file_name, file_path, file_size, file_type, uploaded_at) VALUES (13, 8, 4, 'acceso-bd.pdf', 'https://example.com/docs/acceso-bd.pdf', 380000, 'application/pdf', '2025-06-16 10:10:00');
INSERT INTO public.ticket_attachments (id, ticket_id, user_id, file_name, file_path, file_size, file_type, uploaded_at) VALUES (14, 14, 1, 'pizarra.jpg', 'assets/attachments/tickets/1750906823_26e3c2504e032eb5ff50.jpg', 52148, 'image/jpeg', '2025-06-25 23:00:23.854552');
INSERT INTO public.ticket_attachments (id, ticket_id, user_id, file_name, file_path, file_size, file_type, uploaded_at) VALUES (15, 25, 1, 'impresora.jpg', 'assets/attachments/tickets/1751433567_2c6c2b3cabee5cf0c117.jpg', 40284, 'image/jpeg', '2025-07-02 01:19:27.041786');


--
-- TOC entry 5321 (class 0 OID 948350)
-- Dependencies: 254
-- Data for Name: ticket_categories; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.ticket_categories (id, name, description, created_by, created_at, updated_at, parent_id, default_priority, is_active) VALUES (1, 'Hardware', 'Problemas con equipos físicos y periféricos', 1, '2025-06-08 19:34:20.399963', '2025-06-08 19:34:20.399963', NULL, 'media', 1);
INSERT INTO public.ticket_categories (id, name, description, created_by, created_at, updated_at, parent_id, default_priority, is_active) VALUES (2, 'Software', 'Fallos en aplicaciones o sistemas operativos', 1, '2025-06-08 19:34:20.399963', '2025-06-08 19:34:20.399963', NULL, 'media', 1);
INSERT INTO public.ticket_categories (id, name, description, created_by, created_at, updated_at, parent_id, default_priority, is_active) VALUES (3, 'Redes', 'Conexiones LAN/WAN, WiFi, VPN', 1, '2025-06-08 19:34:20.399963', '2025-06-08 19:34:20.399963', NULL, 'media', 1);
INSERT INTO public.ticket_categories (id, name, description, created_by, created_at, updated_at, parent_id, default_priority, is_active) VALUES (4, 'Gestión de Personal', 'Sigefirrhh, sistemas de gestión de personal', 1, '2025-06-08 19:34:20.399963', '2025-06-08 19:34:20.399963', NULL, 'media', 1);
INSERT INTO public.ticket_categories (id, name, description, created_by, created_at, updated_at, parent_id, default_priority, is_active) VALUES (5, 'Seguridad', 'Antivirus, accesos no autorizados', 1, '2025-06-08 19:34:20.399963', '2025-06-08 19:34:20.399963', NULL, 'media', 1);


--
-- TOC entry 5315 (class 0 OID 948282)
-- Dependencies: 248
-- Data for Name: ticket_comments; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.ticket_comments (id, ticket_id, user_id, comment, is_internal, created_at) VALUES (1, 1, 1, 'Hola, acabo de crear este ticket porque no puedo acceder al sistema de reportes. ¿Me pueden ayudar?', false, '2025-06-21 18:39:07');
INSERT INTO public.ticket_comments (id, ticket_id, user_id, comment, is_internal, created_at) VALUES (2, 1, 2, 'He revisado el problema y parece ser un tema de permisos. Voy a escalarlo al equipo de seguridad.', true, '2025-06-21 19:15:22');
INSERT INTO public.ticket_comments (id, ticket_id, user_id, comment, is_internal, created_at) VALUES (3, 1, 4, 'Usuario: he actualizado tus permisos. Por favor intenta nuevamente y confírmame si funciona.', false, '2025-06-21 20:30:45');
INSERT INTO public.ticket_comments (id, ticket_id, user_id, comment, is_internal, created_at) VALUES (4, 2, 3, 'La impresora en contabilidad lleva dos días sin funcionar. Urgente porque necesitamos imprimir los reportes mensuales.', false, '2025-06-18 08:20:00');
INSERT INTO public.ticket_comments (id, ticket_id, user_id, comment, is_internal, created_at) VALUES (5, 2, 5, 'He revisado la impresora y necesita un cartucho nuevo. Lo solicité y debería llegar mañana.', true, '2025-06-18 14:45:30');
INSERT INTO public.ticket_comments (id, ticket_id, user_id, comment, is_internal, created_at) VALUES (6, 2, 3, 'Gracias por la actualización. ¿Hay alguna impresora alternativa que podamos usar mientras?', false, '2025-06-18 16:20:15');
INSERT INTO public.ticket_comments (id, ticket_id, user_id, comment, is_internal, created_at) VALUES (7, 2, 5, 'Sí, pueden usar la impresora en el área de RRHH. Ya configuré la redirección.', false, '2025-06-19 09:10:00');
INSERT INTO public.ticket_comments (id, ticket_id, user_id, comment, is_internal, created_at) VALUES (8, 3, 2, 'No puedo ingresar al sistema desde esta mañana. Mis credenciales son correctas pero el sistema las rechaza.', false, '2025-06-19 14:25:00');
INSERT INTO public.ticket_comments (id, ticket_id, user_id, comment, is_internal, created_at) VALUES (9, 3, 1, 'Por favor verifica que el bloqueo de mayúsculas no esté activado. Si persiste, necesitaré resetear tu contraseña.', true, '2025-06-19 15:40:00');
INSERT INTO public.ticket_comments (id, ticket_id, user_id, comment, is_internal, created_at) VALUES (10, 4, 4, 'La conexión a internet en mi área es extremadamente lenta desde ayer. ¿Hay algún problema reportado?', false, '2025-06-17 09:35:00');
INSERT INTO public.ticket_comments (id, ticket_id, user_id, comment, is_internal, created_at) VALUES (11, 4, 3, 'Estamos investigando. Parece haber un problema con el switch del piso 3. En mantenimiento lo están revisando.', true, '2025-06-17 11:20:00');
INSERT INTO public.ticket_comments (id, ticket_id, user_id, comment, is_internal, created_at) VALUES (12, 4, 3, 'Problema resuelto. Era un cable de red dañado. Ya deberías tener velocidad normal.', false, '2025-06-18 16:40:00');
INSERT INTO public.ticket_comments (id, ticket_id, user_id, comment, is_internal, created_at) VALUES (13, 5, 5, 'Buen día, necesito el Adobe Creative Cloud instalado para el proyecto de marketing que comienza la próxima semana.', false, '2025-06-20 11:15:00');
INSERT INTO public.ticket_comments (id, ticket_id, user_id, comment, is_internal, created_at) VALUES (14, 5, 2, 'Solicitud recibida. Necesito aprobación del jefe de departamento para proceder con la instalación.', true, '2025-06-20 13:30:00');
INSERT INTO public.ticket_comments (id, ticket_id, user_id, comment, is_internal, created_at) VALUES (15, 6, 1, 'No puedo enviar archivos adjuntos mayores a 5MB. Antes el límite era de 25MB. ¿Cambiaron la política?', false, '2025-06-19 16:35:00');
INSERT INTO public.ticket_comments (id, ticket_id, user_id, comment, is_internal, created_at) VALUES (16, 6, 2, 'Revisando configuración de tu cuenta. Parece que tu buzón está casi lleno (98% de capacidad).', true, '2025-06-20 09:20:00');
INSERT INTO public.ticket_comments (id, ticket_id, user_id, comment, is_internal, created_at) VALUES (17, 6, 2, 'He limpiado espacio temporal. Ahora deberías poder enviar adjuntos hasta 25MB nuevamente.', false, '2025-06-20 11:45:00');
INSERT INTO public.ticket_comments (id, ticket_id, user_id, comment, is_internal, created_at) VALUES (18, 7, 3, 'Mi teclado tiene varias teclas que no funcionan. Principalmente las de la fila numérica.', false, '2025-06-21 08:50:00');
INSERT INTO public.ticket_comments (id, ticket_id, user_id, comment, is_internal, created_at) VALUES (19, 7, 4, '¿Has probado el teclado en otra computadora? Necesito descartar si es problema de hardware o software.', true, '2025-06-21 10:15:00');
INSERT INTO public.ticket_comments (id, ticket_id, user_id, comment, is_internal, created_at) VALUES (20, 8, 2, 'Solicito acceso de solo lectura a la BD de ventas para generar los reportes trimestrales.', false, '2025-06-15 13:25:00');
INSERT INTO public.ticket_comments (id, ticket_id, user_id, comment, is_internal, created_at) VALUES (21, 8, 4, 'Acceso concedido. Puedes conectarte usando las credenciales que te envié por correo seguro.', false, '2025-06-16 10:05:00');
INSERT INTO public.ticket_comments (id, ticket_id, user_id, comment, is_internal, created_at) VALUES (22, 8, 2, 'Confirmo que el acceso funciona correctamente. Muchas gracias.', false, '2025-06-16 12:30:00');
INSERT INTO public.ticket_comments (id, ticket_id, user_id, comment, is_internal, created_at) VALUES (23, 1, 1, 'Gracias espero que puedan ayudarme.', true, '2025-06-24 13:11:04');
INSERT INTO public.ticket_comments (id, ticket_id, user_id, comment, is_internal, created_at) VALUES (24, 9, 1, 'Vamos para allá', false, '2025-07-02 02:42:49');
INSERT INTO public.ticket_comments (id, ticket_id, user_id, comment, is_internal, created_at) VALUES (25, 10, 1, 'Ejecutaremos las pruebas y solucionaremos de inmediato', false, '2025-07-02 02:43:29');
INSERT INTO public.ticket_comments (id, ticket_id, user_id, comment, is_internal, created_at) VALUES (26, 11, 1, 'En efecto, es una prueba más', true, '2025-07-02 02:44:38');
INSERT INTO public.ticket_comments (id, ticket_id, user_id, comment, is_internal, created_at) VALUES (27, 25, 1, 'Ok', false, '2025-07-03 09:59:34');
INSERT INTO public.ticket_comments (id, ticket_id, user_id, comment, is_internal, created_at) VALUES (29, 10, 3, 'Ok', true, '2025-07-04 11:37:58');
INSERT INTO public.ticket_comments (id, ticket_id, user_id, comment, is_internal, created_at) VALUES (30, 28, 3, 'Que oferton', false, '2025-07-04 11:44:53');
INSERT INTO public.ticket_comments (id, ticket_id, user_id, comment, is_internal, created_at) VALUES (31, 27, 3, 'OK', true, '2025-07-04 16:36:36');
INSERT INTO public.ticket_comments (id, ticket_id, user_id, comment, is_internal, created_at) VALUES (32, 9, 2, 'Corregido', false, '2025-07-04 20:11:02');
INSERT INTO public.ticket_comments (id, ticket_id, user_id, comment, is_internal, created_at) VALUES (33, 25, 2, 'Ok ok', false, '2025-07-04 20:11:34');
INSERT INTO public.ticket_comments (id, ticket_id, user_id, comment, is_internal, created_at) VALUES (34, 29, 2, 'Ok', false, '2025-07-04 20:50:26');
INSERT INTO public.ticket_comments (id, ticket_id, user_id, comment, is_internal, created_at) VALUES (35, 31, 1, 'Hola a todos', false, '2025-07-11 11:10:04');
INSERT INTO public.ticket_comments (id, ticket_id, user_id, comment, is_internal, created_at) VALUES (36, 31, 3, 'Listo ya', false, '2025-07-11 11:11:35');


--
-- TOC entry 5317 (class 0 OID 948303)
-- Dependencies: 250
-- Data for Name: ticket_history; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.ticket_history (id, ticket_id, changed_by, field_changed, old_value, new_value, changed_at) VALUES (13, 1, 2, 'status', 'abierto', 'en_progreso', '2025-06-20 09:15:22');
INSERT INTO public.ticket_history (id, ticket_id, changed_by, field_changed, old_value, new_value, changed_at) VALUES (14, 1, 3, 'assigned_to', '2', '3', '2025-06-20 11:30:45');
INSERT INTO public.ticket_history (id, ticket_id, changed_by, field_changed, old_value, new_value, changed_at) VALUES (15, 1, 3, 'status', 'en_progreso', 'cerrado', '2025-06-21 14:20:10');
INSERT INTO public.ticket_history (id, ticket_id, changed_by, field_changed, old_value, new_value, changed_at) VALUES (16, 2, 1, 'priority', 'baja', 'alta', '2025-06-19 10:05:33');
INSERT INTO public.ticket_history (id, ticket_id, changed_by, field_changed, old_value, new_value, changed_at) VALUES (17, 2, 4, 'status', 'abierto', 'en_progreso', '2025-06-20 16:45:18');
INSERT INTO public.ticket_history (id, ticket_id, changed_by, field_changed, old_value, new_value, changed_at) VALUES (18, 3, 5, 'description', 'Problema inicial', 'Problema actualizado', '2025-06-18 08:30:00');
INSERT INTO public.ticket_history (id, ticket_id, changed_by, field_changed, old_value, new_value, changed_at) VALUES (19, 3, 2, 'category_id', '1', '2', '2025-06-18 13:22:47');
INSERT INTO public.ticket_history (id, ticket_id, changed_by, field_changed, old_value, new_value, changed_at) VALUES (20, 3, 2, 'priority', 'media', 'alta', '2025-06-19 09:10:15');
INSERT INTO public.ticket_history (id, ticket_id, changed_by, field_changed, old_value, new_value, changed_at) VALUES (21, 3, 1, 'assigned_to', '5', '2', '2025-06-19 17:35:29');
INSERT INTO public.ticket_history (id, ticket_id, changed_by, field_changed, old_value, new_value, changed_at) VALUES (22, 4, 3, 'status', 'abierto', 'cerrado', '2025-06-21 18:05:42');
INSERT INTO public.ticket_history (id, ticket_id, changed_by, field_changed, old_value, new_value, changed_at) VALUES (23, 5, 4, 'assigned_to', '1', '4', '2025-06-20 14:15:30');
INSERT INTO public.ticket_history (id, ticket_id, changed_by, field_changed, old_value, new_value, changed_at) VALUES (24, 5, 4, 'status', 'abierto', 'en_progreso', '2025-06-21 10:25:55');
INSERT INTO public.ticket_history (id, ticket_id, changed_by, field_changed, old_value, new_value, changed_at) VALUES (26, 10, 3, 'status', 'abierto', 'en_progreso', '2025-07-04 11:38:10.41936');
INSERT INTO public.ticket_history (id, ticket_id, changed_by, field_changed, old_value, new_value, changed_at) VALUES (27, 28, 3, 'status', 'abierto', 'en_revision', '2025-07-04 11:44:44.055881');
INSERT INTO public.ticket_history (id, ticket_id, changed_by, field_changed, old_value, new_value, changed_at) VALUES (28, 27, 3, 'status', 'abierto', 'en_progreso', '2025-07-04 16:36:42.107424');
INSERT INTO public.ticket_history (id, ticket_id, changed_by, field_changed, old_value, new_value, changed_at) VALUES (29, 9, 2, 'status', 'abierto', 'cerrado', '2025-07-04 20:11:08.763676');
INSERT INTO public.ticket_history (id, ticket_id, changed_by, field_changed, old_value, new_value, changed_at) VALUES (30, 25, 2, 'status', 'abierto', 'cerrado', '2025-07-04 20:11:40.510194');
INSERT INTO public.ticket_history (id, ticket_id, changed_by, field_changed, old_value, new_value, changed_at) VALUES (31, 29, 2, 'status', 'abierto', 'en_progreso', '2025-07-04 20:50:35.921757');
INSERT INTO public.ticket_history (id, ticket_id, changed_by, field_changed, old_value, new_value, changed_at) VALUES (32, 30, 2, 'status', 'abierto', 'cerrado', '2025-07-04 21:44:02.481801');
INSERT INTO public.ticket_history (id, ticket_id, changed_by, field_changed, old_value, new_value, changed_at) VALUES (33, 30, 2, 'status', 'cerrado', 'en_progreso', '2025-07-04 21:44:40.516879');
INSERT INTO public.ticket_history (id, ticket_id, changed_by, field_changed, old_value, new_value, changed_at) VALUES (34, 31, 3, 'status', 'abierto', 'cerrado', '2025-07-11 11:11:42.91396');


--
-- TOC entry 5313 (class 0 OID 948241)
-- Dependencies: 246
-- Data for Name: tickets; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.tickets (id, title, description, status, priority, user_id, assigned_to, category_id, created_at, updated_at, closed_at, closed_by, user_rating, user_feedback) VALUES (2, 'Impresora no funciona', 'La impresora en el área de contabilidad no responde y muestra luz roja', 'en_progreso', 'alta', 3, 5, 2, '2025-06-18 08:15:00', '2025-06-19 10:30:00', NULL, NULL, NULL, NULL);
INSERT INTO public.tickets (id, title, description, status, priority, user_id, assigned_to, category_id, created_at, updated_at, closed_at, closed_by, user_rating, user_feedback) VALUES (4, 'Conexión a internet muy lenta', 'Desde ayer la velocidad de internet en mi departamento es extremadamente lenta', 'cerrado', 'baja', 4, 3, 3, '2025-06-17 09:30:00', '2025-06-18 16:45:00', '2025-06-18 16:45:00', 3, NULL, NULL);
INSERT INTO public.tickets (id, title, description, status, priority, user_id, assigned_to, category_id, created_at, updated_at, closed_at, closed_by, user_rating, user_feedback) VALUES (8, 'Permisos para base de datos', 'Necesito acceso de lectura a la base de datos de ventas para generar reportes', 'cerrado', 'media', 2, 4, 5, '2025-06-15 13:20:00', '2025-06-16 10:10:00', '2025-06-16 10:10:00', 4, NULL, NULL);
INSERT INTO public.tickets (id, title, description, status, priority, user_id, assigned_to, category_id, created_at, updated_at, closed_at, closed_by, user_rating, user_feedback) VALUES (7, 'Teclado no funciona correctamente', 'Algunas teclas de mi teclado no responden o escriben caracteres incorrectos', 'abierto', 'baja', 3, 4, 2, '2025-06-21 08:45:00', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.tickets (id, title, description, status, priority, user_id, assigned_to, category_id, created_at, updated_at, closed_at, closed_by, user_rating, user_feedback) VALUES (6, 'Problema con correo electrónico', 'No puedo enviar archivos adjuntos mayores a 5MB, aunque antes sí podía', 'en_progreso', 'alta', 2, 2, 1, '2025-06-19 16:30:00', '2025-06-20 09:15:00', NULL, NULL, NULL, NULL);
INSERT INTO public.tickets (id, title, description, status, priority, user_id, assigned_to, category_id, created_at, updated_at, closed_at, closed_by, user_rating, user_feedback) VALUES (1, 'Ticket de Ejemplo', 'Esto es un ticket', 'abierto', 'media', 1, 1, 3, '2025-06-21 18:39:07.784795', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.tickets (id, title, description, status, priority, user_id, assigned_to, category_id, created_at, updated_at, closed_at, closed_by, user_rating, user_feedback) VALUES (5, 'Necesito instalación de software', 'Requiero que se instale el paquete Adobe Creative Cloud en mi equipo para el nuevo proyecto', 'abierto', 'media', 1, 3, 4, '2025-06-20 11:10:00', '2025-06-20 11:10:00', NULL, NULL, NULL, NULL);
INSERT INTO public.tickets (id, title, description, status, priority, user_id, assigned_to, category_id, created_at, updated_at, closed_at, closed_by, user_rating, user_feedback) VALUES (3, 'No puedo acceder al sistema', 'Al ingresar mis credenciales me dice que son inválidas, pero estoy seguro que son correctas', 'abierto', 'media', 1, 1, 1, '2025-06-19 14:20:00', '2025-06-19 14:20:00', NULL, NULL, NULL, NULL);
INSERT INTO public.tickets (id, title, description, status, priority, user_id, assigned_to, category_id, created_at, updated_at, closed_at, closed_by, user_rating, user_feedback) VALUES (11, 'Nuevo tickets de prueba', 'Es solo una prueba más', 'abierto', 'baja', 1, 2, 2, '2025-06-25 07:29:20', '2025-07-01 00:38:35', NULL, NULL, NULL, NULL);
INSERT INTO public.tickets (id, title, description, status, priority, user_id, assigned_to, category_id, created_at, updated_at, closed_at, closed_by, user_rating, user_feedback) VALUES (14, 'Nuevo ticket de ejemplo 2 con adjunto', 'Esto es un ticket con adjunto', 'cerrado', 'media', 1, 2, 2, '2025-06-25 23:00:23', '2025-07-01 10:51:58', '2025-06-30 23:52:33', 1, NULL, NULL);
INSERT INTO public.tickets (id, title, description, status, priority, user_id, assigned_to, category_id, created_at, updated_at, closed_at, closed_by, user_rating, user_feedback) VALUES (10, 'Falla el el internet', 'La conexión se vuelve inestable a cada momento', 'en_progreso', 'media', 1, 3, 3, '2025-06-25 06:38:43', '2025-07-04 11:38:10', NULL, NULL, NULL, NULL);
INSERT INTO public.tickets (id, title, description, status, priority, user_id, assigned_to, category_id, created_at, updated_at, closed_at, closed_by, user_rating, user_feedback) VALUES (28, 'Nuevo ticket 04072025', 'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'en_revision', 'media', 1, 3, 4, '2025-07-04 08:01:22', '2025-07-04 11:44:44', NULL, NULL, NULL, NULL);
INSERT INTO public.tickets (id, title, description, status, priority, user_id, assigned_to, category_id, created_at, updated_at, closed_at, closed_by, user_rating, user_feedback) VALUES (27, 'Prueba de ticket 03072025', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 'en_progreso', 'baja', 1, 3, 5, '2025-07-03 23:40:51', '2025-07-04 16:36:42', NULL, NULL, NULL, NULL);
INSERT INTO public.tickets (id, title, description, status, priority, user_id, assigned_to, category_id, created_at, updated_at, closed_at, closed_by, user_rating, user_feedback) VALUES (9, 'Problemas con monitor', 'El monitor se apaga y se enciende cada 15 minutos, por favor ayúdenme.', 'cerrado', 'alta', 1, NULL, 1, '2025-06-24 17:38:57', '2025-07-04 20:11:08', '2025-07-04 20:11:08', 2, NULL, NULL);
INSERT INTO public.tickets (id, title, description, status, priority, user_id, assigned_to, category_id, created_at, updated_at, closed_at, closed_by, user_rating, user_feedback) VALUES (25, 'Impresora atascada', 'La impresora se atasco con un papel', 'cerrado', 'alta', 1, 2, 1, '2025-07-02 01:19:27', '2025-07-04 20:11:40', '2025-07-04 20:11:40', 2, NULL, NULL);
INSERT INTO public.tickets (id, title, description, status, priority, user_id, assigned_to, category_id, created_at, updated_at, closed_at, closed_by, user_rating, user_feedback) VALUES (29, 'Ticket de soporte 04072025', 'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'en_progreso', 'alta', 1, 2, 3, '2025-07-04 11:06:50', '2025-07-04 20:50:35', NULL, NULL, NULL, NULL);
INSERT INTO public.tickets (id, title, description, status, priority, user_id, assigned_to, category_id, created_at, updated_at, closed_at, closed_by, user_rating, user_feedback) VALUES (30, 'Ticket de hy 04072025', 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium', 'en_progreso', 'baja', 4, 2, 3, '2025-07-04 21:32:42', '2025-07-04 21:44:40', '2025-07-04 21:44:02', 2, NULL, NULL);
INSERT INTO public.tickets (id, title, description, status, priority, user_id, assigned_to, category_id, created_at, updated_at, closed_at, closed_by, user_rating, user_feedback) VALUES (31, 'TIcket de hoy 11072025', 'Esto es un ticket', 'cerrado', 'baja', 1, 3, 4, '2025-07-11 11:06:05', '2025-07-11 11:11:42', '2025-07-11 11:11:42', 3, NULL, NULL);


--
-- TOC entry 5331 (class 0 OID 948535)
-- Dependencies: 264
-- Data for Name: user_categories; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.user_categories (id, user_id, category_id, is_primary, created_at) VALUES (1, 2, 1, true, '2025-06-22 18:32:57.232338');
INSERT INTO public.user_categories (id, user_id, category_id, is_primary, created_at) VALUES (2, 2, 3, false, '2025-06-22 18:32:57.232338');
INSERT INTO public.user_categories (id, user_id, category_id, is_primary, created_at) VALUES (3, 3, 2, true, '2025-06-22 18:32:57.232338');
INSERT INTO public.user_categories (id, user_id, category_id, is_primary, created_at) VALUES (4, 5, 1, true, '2025-06-22 18:32:57.232338');
INSERT INTO public.user_categories (id, user_id, category_id, is_primary, created_at) VALUES (5, 3, 4, true, '2025-07-03 23:22:28.954819');
INSERT INTO public.user_categories (id, user_id, category_id, is_primary, created_at) VALUES (6, 5, 4, false, '2025-07-03 23:22:28.954819');
INSERT INTO public.user_categories (id, user_id, category_id, is_primary, created_at) VALUES (7, 3, 5, true, '2025-07-03 23:22:28.954819');
INSERT INTO public.user_categories (id, user_id, category_id, is_primary, created_at) VALUES (8, 5, 5, true, '2025-07-03 23:22:28.954819');


--
-- TOC entry 5287 (class 0 OID 41358)
-- Dependencies: 219
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users (id, ip_address, username, password, email, activation_selector, activation_code, forgotten_password_selector, forgotten_password_code, forgotten_password_time, remember_selector, remember_code, created_on, last_login, active, first_name, middle_name, first_last_name, second_last_name, gender, nationality, photo, company, phone) VALUES (5, '127.0.0.1', 'hperera', '$argon2i$v=19$m=16384,t=4,p=2$MnFzUGxTVlV3djhRTDNhaw$5NMQDnDkTe8mKuZxqcSkxQUg3ZNHMV4Aafiv0/r8mO4', 'hperera@sigesot.com', NULL, '', NULL, NULL, NULL, NULL, NULL, 1749408123, NULL, 1, 'Héctor', 'Eduardo', 'Perera', 'Chivico', 1, 1, 'assets/profiles/29661230.jpg', 'Sigesot', '04129543393');
INSERT INTO public.users (id, ip_address, username, password, email, activation_selector, activation_code, forgotten_password_selector, forgotten_password_code, forgotten_password_time, remember_selector, remember_code, created_on, last_login, active, first_name, middle_name, first_last_name, second_last_name, gender, nationality, photo, company, phone) VALUES (4, '127.0.0.1', 'zmora', '$argon2i$v=19$m=4096,t=2,p=2$dDRxQ2REckpoUzhVM242Ng$ig+s5qrIzkO0XFnSb6yHJ5Po9X4LVVz/tS4RT56EVdU', 'zmora@sigesot.com', NULL, '', NULL, NULL, NULL, NULL, NULL, 1749408123, 1751679116, 1, 'Zarahy', 'Alhay', 'Mora', 'De La Rosa', 2, 1, 'assets/profiles/30942464.jpg', 'Sigesot', '04120323976');
INSERT INTO public.users (id, ip_address, username, password, email, activation_selector, activation_code, forgotten_password_selector, forgotten_password_code, forgotten_password_time, remember_selector, remember_code, created_on, last_login, active, first_name, middle_name, first_last_name, second_last_name, gender, nationality, photo, company, phone) VALUES (2, '127.0.0.1', 'yacosta', '$argon2i$v=19$m=4096,t=2,p=2$RlczOWo2aUQ4TmVseDV4Ng$7aZYBMYRpsPbrB8JIhXhL8wFJSSnW1fYsRIBRCh8qxs', 'yacosta@sigesot.com', NULL, '', NULL, NULL, NULL, NULL, NULL, 1749408123, 1751679390, 1, 'Yelian', 'Elías', 'Acosta', 'Bravo', 1, 1, 'assets/profiles/31795979.jpg', 'Sigesot', '04127116048');
INSERT INTO public.users (id, ip_address, username, password, email, activation_selector, activation_code, forgotten_password_selector, forgotten_password_code, forgotten_password_time, remember_selector, remember_code, created_on, last_login, active, first_name, middle_name, first_last_name, second_last_name, gender, nationality, photo, company, phone) VALUES (1, '127.0.0.1', 'gmeneses', '$argon2i$v=19$m=16384,t=4,p=2$R2xLenE3NjlqOHJiMnlZeA$x5aGE90yA3cR5Cc0o3WfUMmq31KErm++YFvYK+d9aPA', 'gmeneses@youdomain.com', NULL, '', NULL, NULL, NULL, NULL, NULL, 1744672199, 1752246755, 1, 'Gonzalo', 'Rafael', 'Meneses', 'Arias', 1, 1, 'assets/profiles/8262447.jpg', 'Sigesot', '04241733239');
INSERT INTO public.users (id, ip_address, username, password, email, activation_selector, activation_code, forgotten_password_selector, forgotten_password_code, forgotten_password_time, remember_selector, remember_code, created_on, last_login, active, first_name, middle_name, first_last_name, second_last_name, gender, nationality, photo, company, phone) VALUES (3, '127.0.0.1', 'jtarache', '$argon2i$v=19$m=4096,t=2,p=2$VVUwY0tMSjlVbTJCVjVGbQ$VMntg/dxbYQjZanmUumPaThwfxFHf46V5JOOF1IVuF8', 'jtarache@sigesot.com', NULL, '', NULL, NULL, NULL, NULL, NULL, 1749408123, 1752246654, 1, 'José', 'Rafael', 'Tarache', 'González', 1, 1, 'assets/profiles/31416446.jpg', 'Sigesot', '04125388074');


--
-- TOC entry 5291 (class 0 OID 41394)
-- Dependencies: 223
-- Data for Name: users_groups; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users_groups (id, user_id, group_id) VALUES (1, 1, 1);
INSERT INTO public.users_groups (id, user_id, group_id) VALUES (2, 1, 2);
INSERT INTO public.users_groups (id, user_id, group_id) VALUES (3, 1, 3);
INSERT INTO public.users_groups (id, user_id, group_id) VALUES (4, 1, 4);
INSERT INTO public.users_groups (id, user_id, group_id) VALUES (5, 2, 3);
INSERT INTO public.users_groups (id, user_id, group_id) VALUES (6, 2, 4);
INSERT INTO public.users_groups (id, user_id, group_id) VALUES (7, 3, 3);
INSERT INTO public.users_groups (id, user_id, group_id) VALUES (8, 3, 4);
INSERT INTO public.users_groups (id, user_id, group_id) VALUES (9, 4, 2);
INSERT INTO public.users_groups (id, user_id, group_id) VALUES (10, 4, 4);
INSERT INTO public.users_groups (id, user_id, group_id) VALUES (11, 5, 2);
INSERT INTO public.users_groups (id, user_id, group_id) VALUES (12, 5, 4);


--
-- TOC entry 5343 (class 0 OID 949783)
-- Dependencies: 291
-- Data for Name: worker; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1, 1414, 636204, 'A', 19, 124);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (2, 1415, 1192875, 'A', 19, 129);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (3, 3064, 2108215, 'A', 29, 751);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (4, 1416, 2995600, 'A', 12, 133);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (5, 1418, 3062111, 'A', 15, 124);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (6, 3771, 3592707, 'A', 29, 119);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (7, 1423, 3660639, 'A', 19, 124);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (8, 1424, 3670654, 'A', 19, 116);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (9, 1425, 3779974, 'A', 12, 121);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (10, 6729, 3815786, 'A', 541, 56);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (11, 1427, 3839102, 'A', 12, 124);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (12, 1428, 3916013, 'A', 19, 124);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (13, 1429, 3956314, 'A', 19, 116);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (14, 1431, 4046000, 'A', 12, 116);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (15, 1432, 4067415, 'A', 19, 127);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (16, 1433, 4117122, 'A', 19, 130);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (17, 1434, 4229777, 'A', 19, 121);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (18, 1435, 4282579, 'A', 19, 124);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (19, 1436, 4299408, 'A', 19, 130);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (20, 1437, 4339813, 'A', 19, 129);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (21, 1440, 4405366, 'A', 19, 128);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (22, 6825, 4576289, 'A', 542, 56);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (23, 6774, 4580553, 'A', 47, 140);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (24, 1442, 4586301, 'A', 12, 125);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (25, 1445, 4680842, 'A', 19, 124);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (26, 1447, 4746156, 'A', 19, 116);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (27, 1450, 4872516, 'A', 19, 124);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (28, 1451, 4905459, 'A', 19, 116);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (29, 6730, 4958874, 'A', 541, 56);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (30, 1452, 4965016, 'A', 19, 137);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (31, 1454, 4995527, 'A', 19, 134);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (32, 1455, 5004884, 'A', 12, 124);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (33, 6621, 5067550, 'A', 542, 56);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (34, 1458, 5121911, 'A', 19, 124);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (35, 1460, 5132444, 'A', 19, 124);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (36, 6622, 5135676, 'A', 541, 56);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (37, 3069, 5147134, 'A', 17, 70);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (38, 1463, 5194568, 'A', 12, 116);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (39, 1464, 5203307, 'A', 19, 128);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (40, 1466, 5249567, 'A', 19, 127);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (41, 1467, 5252387, 'A', 19, 127);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (42, 3070, 5289694, 'A', 17, 125);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (43, 3071, 5301899, 'A', 29, 97);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (44, 1468, 5303975, 'A', 19, 128);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (45, 1470, 5384747, 'A', 15, 121);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (46, 1471, 5393475, 'A', 19, 130);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (47, 1472, 5407643, 'A', 19, 124);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (48, 1473, 5481293, 'A', 19, 131);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (49, 1474, 5491549, 'A', 19, 116);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (50, 1475, 5516722, 'A', 29, 751);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (51, 1476, 5563201, 'A', 19, 128);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (52, 1478, 5571823, 'A', 15, 124);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (53, 1194, 5585361, 'A', 18, 43);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (54, 6601, 5616086, 'A', 29, 17);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (55, 1479, 5654075, 'A', 19, 121);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (56, 6514, 5678047, 'A', 11, 14);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (57, 1481, 5697089, 'A', 19, 133);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (58, 1485, 5745229, 'A', 19, 122);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (59, 1486, 5758801, 'A', 19, 135);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (60, 3076, 5783774, 'A', 23, 135);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (61, 6892, 5892907, 'A', 23, 79);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (62, 1492, 6041103, 'A', 19, 133);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (63, 1493, 6047538, 'A', 19, 128);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (64, 1494, 6066611, 'A', 12, 124);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (65, 6708, 6085188, 'A', 29, 17);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (66, 3078, 6100860, 'A', 17, 71);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (67, 1495, 6125342, 'A', 19, 118);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (68, 1496, 6130329, 'A', 19, 125);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (69, 1497, 6134033, 'A', 19, 129);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (70, 3080, 6141706, 'A', 17, 14);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (71, 1501, 6181177, 'A', 19, 127);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (72, 75, 6182582, 'A', 17, 14);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (73, 6727, 6250659, 'A', 541, 56);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (74, 1504, 6252306, 'A', 19, 128);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (75, 1505, 6256785, 'A', 12, 128);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (76, 6874, 6259255, 'A', 23, 771);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (77, 4834, 6263682, 'A', 261, 152);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (78, 4954, 6269749, 'A', 11, 71);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (79, 5335, 6291135, 'A', 42, 22);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (80, 1510, 6321405, 'A', 19, 129);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (81, 6683, 6361712, 'A', 541, 56);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (82, 6801, 6366133, 'A', 29, 58);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (83, 6932, 6472216, 'A', 46, 157);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (84, 6680, 6476400, 'A', 542, 56);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (85, 1520, 6511331, 'A', 19, 124);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (86, 1523, 6767845, 'A', 12, 133);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (87, 6682, 6800731, 'A', 542, 56);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (88, 101, 6857315, 'A', 11, 70);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (89, 1195, 6864252, 'A', 19, 124);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (90, 5463, 6894338, 'A', 19, 131);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (91, 1528, 6921725, 'A', 19, 130);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (92, 6623, 6958416, 'A', 542, 56);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (93, 5673, 6961404, 'A', 120, 19);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (94, 1532, 6969121, 'A', 19, 130);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (95, 4840, 6969987, 'A', 29, 139);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (96, 1534, 7004793, 'A', 12, 121);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (97, 1535, 7006993, 'A', 19, 121);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (98, 1536, 7058691, 'A', 19, 121);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (99, 6773, 7121016, 'A', 44, 21);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (100, 1538, 7130918, 'A', 19, 121);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (101, 1541, 7139031, 'A', 19, 127);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (102, 6594, 7238511, 'A', 29, 118);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (103, 1543, 7253869, 'A', 19, 118);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (104, 1544, 7267866, 'A', 12, 121);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (105, 1545, 7270765, 'A', 19, 118);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (106, 1546, 7302417, 'A', 19, 127);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (107, 1548, 7328681, 'A', 19, 127);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (108, 1549, 7347741, 'A', 19, 127);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (109, 1550, 7364617, 'A', 19, 127);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (110, 1551, 7374611, 'A', 19, 127);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (111, 1552, 7376250, 'A', 19, 127);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (112, 1554, 7421816, 'A', 19, 138);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (113, 1555, 7427990, 'A', 19, 118);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (114, 1556, 7434988, 'A', 19, 127);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (115, 1559, 7442359, 'A', 19, 127);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (116, 1560, 7449373, 'A', 19, 127);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (117, 1564, 7492505, 'A', 19, 121);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (118, 1566, 7516486, 'A', 12, 137);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (119, 6896, 7609633, 'A', 541, 56);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (120, 6684, 7663935, 'A', 541, 56);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (121, 1568, 7721391, 'A', 19, 138);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (122, 1569, 7721980, 'A', 12, 124);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (123, 1573, 7788484, 'A', 19, 138);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (124, 1574, 7803793, 'A', 19, 138);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (125, 1577, 7886397, 'A', 19, 138);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (126, 1578, 7889653, 'A', 19, 138);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (127, 1580, 7906081, 'A', 19, 121);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (128, 1581, 7916722, 'A', 12, 137);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (129, 1582, 7926716, 'A', 15, 121);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (130, 6959, 7927220, 'A', 17, 124);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (131, 1586, 7994204, 'A', 19, 118);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (132, 6194, 7997111, 'A', 42, 722);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (133, 1587, 8007410, 'A', 19, 128);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (134, 1588, 8009073, 'A', 19, 128);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (135, 1197, 8044683, 'A', 30, 37);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (136, 116, 8069046, 'A', 25, 121);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (137, 1592, 8084184, 'A', 19, 128);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (138, 6685, 8086398, 'A', 541, 56);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (139, 6894, 8176461, 'A', 542, 56);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (140, 1595, 8180064, 'A', 19, 120);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (141, 1596, 8202866, 'A', 19, 116);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (142, 1597, 8203131, 'A', 19, 116);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (143, 1598, 8227909, 'A', 19, 116);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (144, 6955, 8262447, 'A', 42, 23);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (145, 1602, 8276563, 'A', 19, 116);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (146, 1603, 8276669, 'A', 19, 116);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (147, 1604, 8285985, 'A', 12, 116);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (148, 1605, 8295181, 'A', 19, 116);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (149, 1608, 8324207, 'A', 19, 116);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (150, 1609, 8326255, 'A', 19, 116);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (151, 6811, 8331266, 'A', 40, 116);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (152, 1610, 8378526, 'A', 19, 118);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (153, 1611, 8379778, 'A', 19, 130);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (154, 1612, 8382619, 'A', 12, 131);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (155, 1614, 8438769, 'A', 19, 133);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (156, 1617, 8444562, 'A', 15, 133);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (157, 1622, 8500957, 'A', 19, 138);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (158, 1626, 8514538, 'A', 19, 137);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (159, 6624, 8529311, 'A', 542, 56);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (160, 1630, 8632241, 'A', 19, 118);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (161, 1631, 8662765, 'A', 19, 132);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (162, 6554, 8718017, 'A', 19, 135);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (163, 6772, 8731566, 'A', 46, 156);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (164, 5746, 8737565, 'A', 40, 118);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (165, 5339, 8805153, 'A', 12, 126);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (166, 4969, 8841068, 'A', 19, 121);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (167, 122, 8881733, 'A', 25, 99);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (168, 123, 8894598, 'A', 29, 120);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (169, 1640, 8959517, 'A', 19, 138);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (170, 7032, 9002609, 'A', 19, 121);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (171, 125, 9011797, 'A', 29, 135);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (172, 126, 9056473, 'A', 25, 133);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (173, 1645, 9113100, 'A', 12, 138);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (174, 1649, 9233584, 'A', 19, 134);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (175, 128, 9265719, 'A', 17, 14);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (176, 1650, 9300597, 'A', 12, 116);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (177, 1651, 9301596, 'A', 12, 131);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (178, 1652, 9301613, 'A', 19, 131);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (179, 4120, 9315723, 'A', 17, 70);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (180, 6616, 9322329, 'A', 12, 135);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (181, 1199, 9326770, 'A', 24, 52);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (182, 1657, 9341246, 'A', 19, 134);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (183, 7008, 9414764, 'A', 19, 124);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (184, 6628, 9512385, 'A', 541, 56);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (185, 1667, 9531880, 'A', 19, 122);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (186, 1668, 9544211, 'A', 12, 127);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (187, 1670, 9580105, 'A', 71, 125);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (188, 1671, 9584498, 'A', 19, 125);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (189, 138, 9642518, 'A', 29, 121);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (190, 6728, 9643590, 'A', 541, 56);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (191, 1675, 9654827, 'A', 19, 118);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (192, 6897, 9715878, 'A', 541, 56);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (193, 1686, 9768045, 'A', 12, 116);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (194, 1690, 9809334, 'A', 19, 125);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (195, 1693, 9826678, 'A', 19, 116);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (196, 1694, 9829427, 'A', 19, 125);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (197, 1703, 9976932, 'A', 15, 133);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (198, 1704, 9979262, 'A', 19, 133);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (199, 7034, 10048597, 'A', 29, 131);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (200, 6981, 10061690, 'A', 19, 116);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (201, 1708, 10106813, 'A', 19, 128);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (202, 4519, 10108917, 'A', 29, 128);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (203, 6689, 10112174, 'A', 29, 107);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (204, 1709, 10149148, 'A', 19, 119);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (205, 4972, 10157272, 'A', 27, 134);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (206, 1710, 10157387, 'A', 19, 138);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (207, 7036, 10184958, 'A', 19, 124);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (208, 6885, 10186377, 'A', 11, 12);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (209, 1714, 10196624, 'A', 12, 131);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (210, 1715, 10198424, 'A', 19, 131);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (211, 1716, 10201801, 'A', 19, 131);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (212, 1718, 10222091, 'A', 19, 133);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (213, 6036, 10223056, 'A', 42, 761);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (214, 4472, 10240796, 'A', 11, 70);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (215, 1721, 10251788, 'A', 19, 125);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (216, 1722, 10264766, 'A', 19, 135);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (217, 146, 10287904, 'A', 25, 116);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (218, 1724, 10293988, 'A', 19, 116);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (219, 1727, 10372494, 'A', 19, 137);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (220, 6627, 10380947, 'A', 541, 56);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (221, 1733, 10428341, 'A', 19, 138);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (222, 1734, 10432127, 'A', 19, 138);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (223, 151, 10433901, 'A', 17, 70);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (224, 1736, 10444934, 'A', 19, 138);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (225, 153, 10487534, 'A', 11, 70);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (226, 6982, 10500168, 'A', 15, 116);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (227, 1739, 10512101, 'A', 12, 131);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (228, 156, 10517146, 'A', 29, 124);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (229, 157, 10519509, 'A', 11, 70);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (230, 6348, 10519731, 'A', 11, 14);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (231, 1741, 10520598, 'A', 19, 124);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (232, 1742, 10524975, 'A', 19, 121);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (233, 159, 10527291, 'A', 29, 757);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (234, 6780, 10542899, 'A', 23, 12);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (235, 7007, 10546390, 'A', 19, 124);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (236, 1745, 10576828, 'A', 19, 124);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (237, 160, 10578522, 'A', 23, 136);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (238, 1749, 10603854, 'A', 19, 138);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (239, 161, 10626199, 'A', 29, 130);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (240, 5365, 10674592, 'A', 19, 126);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (241, 1751, 10678047, 'A', 15, 121);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (242, 1204, 10716921, 'A', 26, 46);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (243, 6035, 10780501, 'A', 281, 107);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (244, 165, 10786396, 'A', 11, 56);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (245, 6785, 10808558, 'A', 120, 757);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (246, 167, 10828378, 'A', 23, 56);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (247, 1757, 10834055, 'A', 19, 130);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (248, 1758, 10837813, 'A', 19, 130);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (249, 169, 10865782, 'A', 17, 70);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (250, 6625, 10866479, 'A', 541, 56);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (251, 6989, 10944676, 'A', 19, 116);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (252, 6893, 10979830, 'A', 541, 56);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (253, 1767, 10988607, 'A', 19, 122);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (254, 1768, 11004535, 'A', 12, 116);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (255, 180, 11007574, 'A', 21, 130);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (256, 1770, 11033053, 'A', 12, 129);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (257, 1773, 11067997, 'A', 19, 138);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (258, 1774, 11085900, 'A', 19, 118);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (259, 5386, 11115422, 'A', 11, 126);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (260, 6732, 11127209, 'A', 541, 56);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (261, 1777, 11130638, 'A', 19, 135);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (262, 184, 11131476, 'A', 29, 118);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (263, 1779, 11153320, 'A', 19, 121);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (264, 185, 11156756, 'A', 17, 121);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (265, 6085, 11157639, 'A', 42, 89);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (266, 6301, 11164881, 'A', 11, 12);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (267, 1782, 11192656, 'A', 19, 119);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (268, 188, 11211914, 'A', 27, 123);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (269, 4561, 11243876, 'A', 19, 126);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (270, 7011, 11244736, 'A', 29, 140);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (271, 1784, 11251638, 'A', 19, 119);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (272, 189, 11268777, 'A', 27, 127);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (273, 190, 11300795, 'A', 11, 134);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (274, 1791, 11336363, 'A', 19, 130);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (275, 1208, 11342614, 'A', 18, 48);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (276, 194, 11366743, 'A', 11, 70);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (277, 1793, 11377443, 'A', 19, 133);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (278, 1794, 11383350, 'A', 15, 133);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (279, 1795, 11384156, 'A', 12, 133);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (280, 5657, 11410970, 'A', 12, 124);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (281, 6814, 11424523, 'A', 40, 138);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (282, 197, 11426612, 'A', 29, 127);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (283, 1801, 11441560, 'A', 19, 131);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (284, 1802, 11441947, 'A', 19, 133);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (285, 1803, 11458550, 'A', 19, 135);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (286, 1807, 11490452, 'A', 19, 134);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (287, 199, 11490870, 'A', 29, 134);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (288, 1808, 11507243, 'A', 15, 134);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (289, 1811, 11521289, 'A', 12, 121);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (290, 1812, 11550601, 'A', 15, 124);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (291, 1813, 11561439, 'A', 12, 124);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (292, 1211, 11602675, 'A', 26, 48);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (293, 1815, 11606990, 'A', 19, 138);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (294, 6591, 11619349, 'A', 23, 135);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (295, 6504, 11640700, 'A', 15, 131);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (296, 1817, 11649186, 'A', 19, 137);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (297, 206, 11669307, 'A', 29, 59);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (298, 1819, 11689315, 'A', 19, 124);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (299, 3436, 11710287, 'A', 19, 119);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (300, 209, 11712595, 'A', 11, 119);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (301, 6615, 11721636, 'A', 19, 135);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (302, 210, 11742070, 'A', 25, 99);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (303, 1822, 11744645, 'A', 15, 125);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (304, 1824, 11766116, 'A', 19, 125);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (305, 1826, 11772678, 'A', 19, 125);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (306, 1827, 11780437, 'A', 19, 130);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (307, 1828, 11781809, 'A', 19, 130);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (308, 1829, 11784269, 'A', 19, 127);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (309, 4535, 11793272, 'A', 29, 58);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (310, 1830, 11803620, 'A', 19, 125);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (311, 1831, 11804769, 'A', 19, 125);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (312, 1833, 11825594, 'A', 12, 133);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (313, 1834, 11830692, 'A', 12, 133);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (314, 5644, 11849791, 'A', 19, 132);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (315, 1839, 11893763, 'A', 19, 138);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (316, 6626, 11897180, 'A', 542, 56);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (317, 7009, 11899858, 'A', 19, 124);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (318, 1842, 11901234, 'A', 19, 130);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (319, 1843, 11903544, 'A', 12, 116);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (320, 6122, 11923074, 'A', 23, 761);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (321, 1844, 11925318, 'A', 19, 131);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (322, 5131, 11938837, 'A', 17, 223);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (323, 6804, 11944972, 'A', 17, 140);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (324, 1213, 11975222, 'A', 28, 55);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (325, 6629, 12042853, 'A', 542, 56);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (326, 219, 12085180, 'A', 23, 59);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (327, 6061, 12115540, 'A', 23, 27);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (328, 1860, 12119041, 'A', 12, 118);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (329, 1861, 12129929, 'A', 19, 120);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (330, 1862, 12132710, 'A', 19, 123);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (331, 1864, 12144224, 'A', 12, 118);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (332, 1865, 12144513, 'A', 19, 121);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (333, 1866, 12147651, 'A', 19, 128);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (334, 224, 12150528, 'A', 29, 130);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (335, 6721, 12164686, 'A', 11, 12);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (336, 6731, 12180164, 'A', 542, 56);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (337, 1871, 12189099, 'A', 19, 120);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (338, 1872, 12191462, 'A', 15, 120);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (339, 1873, 12212668, 'A', 19, 138);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (340, 1878, 12226394, 'A', 19, 134);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (341, 1880, 12269672, 'A', 15, 133);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (342, 230, 12282235, 'A', 17, 137);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (343, 231, 12285860, 'A', 23, 137);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (344, 1887, 12328631, 'A', 19, 138);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (345, 1889, 12330553, 'A', 19, 131);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (346, 1890, 12352449, 'A', 19, 128);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (347, 6346, 12376915, 'A', 17, 14);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (348, 6329, 12399154, 'A', 17, 107);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (349, 1898, 12481641, 'A', 19, 118);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (350, 236, 12498302, 'A', 11, 138);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (351, 1900, 12517197, 'A', 12, 134);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (352, 238, 12533710, 'A', 19, 129);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (353, 239, 12537070, 'A', 29, 130);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (354, 1903, 12537863, 'A', 12, 130);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (355, 29, 12546961, 'A', 40, 130);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (356, 6971, 12562760, 'A', 29, 223);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (357, 7051, 12563145, 'A', 11, 12);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (358, 244, 12575437, 'A', 21, 116);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (359, 6347, 12626343, 'A', 17, 12);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (360, 30, 12627128, 'A', 41, 42);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (361, 1216, 12646208, 'A', 19, 119);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (362, 1912, 12659244, 'A', 19, 133);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (363, 1914, 12698354, 'A', 19, 127);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (364, 1915, 12705881, 'A', 19, 127);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (365, 1917, 12714883, 'A', 19, 138);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (366, 6703, 12717002, 'A', 11, 12);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (367, 1919, 12745485, 'A', 12, 125);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (368, 5102, 12747896, 'A', 11, 71);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (369, 5514, 12761907, 'A', 17, 14);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (370, 1921, 12774754, 'A', 15, 121);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (371, 1922, 12778249, 'A', 19, 128);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (372, 1924, 12789534, 'A', 19, 125);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (373, 1217, 12791151, 'A', 30, 48);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (374, 1926, 12794471, 'A', 19, 130);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (375, 4980, 12815159, 'A', 29, 134);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (376, 1931, 12845069, 'A', 12, 138);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (377, 1933, 12864404, 'A', 15, 125);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (378, 1939, 12921824, 'A', 19, 131);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (379, 6725, 12951210, 'A', 541, 56);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (380, 6137, 12952500, 'A', 29, 751);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (381, 6960, 12976588, 'A', 19, 124);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (382, 1944, 12994261, 'A', 19, 121);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (383, 1946, 13015592, 'A', 19, 120);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (384, 1219, 13031820, 'A', 26, 34);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (385, 6724, 13039976, 'A', 17, 132);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (386, 1948, 13048865, 'A', 12, 135);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (387, 1952, 13074464, 'A', 15, 133);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (388, 1954, 13083959, 'A', 19, 127);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (389, 1955, 13084617, 'A', 19, 127);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (390, 1956, 13095822, 'A', 19, 137);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (391, 1957, 13097197, 'A', 15, 128);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (392, 1958, 13097954, 'A', 19, 128);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (393, 1222, 13117573, 'A', 26, 52);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (394, 1959, 13122998, 'A', 19, 120);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (395, 6953, 13128686, 'A', 19, 126);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (396, 1963, 13129621, 'A', 19, 138);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (397, 4792, 13139582, 'A', 25, 66);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (398, 1967, 13163769, 'A', 12, 116);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (399, 1968, 13182442, 'A', 19, 122);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (400, 1969, 13191123, 'A', 19, 131);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (401, 1971, 13204045, 'A', 19, 125);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (402, 1974, 13235766, 'A', 19, 121);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (403, 1979, 13266067, 'A', 12, 127);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (404, 1985, 13320255, 'A', 27, 157);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (405, 6861, 13325504, 'A', 42, 18);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (406, 6323, 13333266, 'A', 15, 121);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (407, 6391, 13339166, 'A', 17, 77);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (408, 1987, 13340535, 'A', 19, 126);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (409, 1989, 13358904, 'A', 15, 133);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (410, 1990, 13369478, 'A', 19, 116);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (411, 1992, 13377279, 'A', 12, 135);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (412, 1997, 13457841, 'A', 19, 124);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (413, 1998, 13461405, 'A', 15, 138);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (414, 4751, 13463048, 'A', 27, 70);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (415, 6984, 13466507, 'A', 19, 116);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (416, 276, 13479588, 'A', 23, 156);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (417, 1226, 13493799, 'A', 15, 124);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (418, 2003, 13498800, 'A', 19, 133);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (419, 278, 13506477, 'A', 29, 81);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (420, 281, 13541708, 'A', 29, 131);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (421, 284, 13600593, 'A', 23, 129);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (422, 285, 13608141, 'A', 11, 133);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (423, 286, 13616859, 'A', 11, 125);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (424, 287, 13617600, 'A', 25, 93);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (425, 288, 13623046, 'A', 29, 133);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (426, 6451, 13630953, 'A', 271, 95);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (427, 2015, 13633251, 'A', 19, 135);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (428, 6440, 13638094, 'A', 43, 763);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (429, 2016, 13644259, 'A', 19, 127);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (430, 2018, 13656057, 'A', 12, 130);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (431, 2019, 13660418, 'A', 19, 138);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (432, 2021, 13665454, 'A', 19, 121);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (433, 6193, 13673745, 'A', 11, 70);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (434, 6709, 13678167, 'A', 17, 81);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (435, 2024, 13689955, 'A', 19, 116);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (436, 2025, 13710114, 'A', 12, 116);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (437, 2026, 13714441, 'A', 15, 115);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (438, 2029, 13729229, 'A', 12, 133);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (439, 2032, 13762799, 'A', 15, 134);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (440, 2033, 13773082, 'A', 19, 133);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (441, 2034, 13773296, 'A', 19, 133);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (442, 6924, 13798014, 'A', 15, 120);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (443, 5777, 13807688, 'A', 25, 129);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (444, 5572, 13825118, 'A', 19, 138);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (445, 296, 13827272, 'A', 29, 127);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (446, 2040, 13835137, 'A', 12, 133);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (447, 297, 13847307, 'A', 11, 65);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (448, 6762, 13851088, 'A', 25, 12);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (449, 6331, 13864218, 'A', 29, 762);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (450, 6511, 13888040, 'A', 21, 12);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (451, 6832, 13888116, 'A', 14, 70);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (452, 7010, 13896656, 'A', 11, 135);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (453, 7031, 13900456, 'A', 12, 121);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (454, 2048, 13925801, 'A', 19, 135);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (455, 6954, 13948908, 'A', 19, 126);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (456, 6941, 13951387, 'A', 17, 70);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (457, 5631, 13960501, 'A', 19, 132);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (458, 6813, 13993461, 'A', 40, 124);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (459, 5684, 14017338, 'A', 23, 65);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (460, 1233, 14027774, 'A', 28, 43);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (461, 306, 14028210, 'A', 11, 125);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (462, 1234, 14028319, 'A', 28, 43);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (463, 2053, 14034157, 'A', 12, 124);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (464, 5494, 14039508, 'A', 27, 126);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (465, 307, 14047066, 'A', 29, 131);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (466, 2058, 14078885, 'A', 19, 121);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (467, 2062, 14117660, 'A', 19, 138);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (468, 2064, 14143041, 'A', 15, 137);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (469, 6281, 14195856, 'A', 17, 12);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (470, 6398, 14201465, 'A', 11, 12);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (471, 318, 14269764, 'A', 29, 127);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (472, 2079, 14270352, 'A', 19, 127);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (473, 4543, 14286626, 'A', 11, 129);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (474, 5521, 14295262, 'A', 19, 126);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (475, 6860, 14299442, 'A', 14, 14);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (476, 2086, 14341407, 'A', 12, 119);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (477, 2087, 14349676, 'A', 19, 134);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (478, 2093, 14372581, 'A', 19, 127);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (479, 5332, 14394330, 'A', 40, 126);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (480, 2096, 14396694, 'A', 15, 125);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (481, 2098, 14401274, 'A', 15, 128);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (482, 6936, 14407820, 'A', 23, 140);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (483, 2099, 14421146, 'A', 19, 131);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (484, 2101, 14423542, 'A', 19, 116);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (485, 2102, 14442092, 'A', 19, 137);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (486, 6596, 14455926, 'A', 27, 762);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (487, 2106, 14460124, 'A', 19, 129);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (488, 6581, 14463448, 'A', 11, 121);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (489, 1243, 14479940, 'A', 13, 43);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (490, 4427, 14482392, 'A', 12, 127);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (491, 2109, 14493484, 'A', 19, 138);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (492, 4790, 14495483, 'A', 29, 129);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (493, 2112, 14516560, 'A', 19, 120);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (494, 1244, 14519386, 'A', 28, 47);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (495, 6741, 14520144, 'A', 42, 723);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (496, 6835, 14527054, 'A', 17, 14);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (497, 2115, 14540403, 'A', 19, 127);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (498, 337, 14542208, 'A', 17, 131);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (499, 2118, 14553194, 'A', 19, 116);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (500, 1246, 14560921, 'A', 24, 34);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (501, 6316, 14565456, 'A', 27, 115);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (502, 5408, 14565562, 'A', 15, 115);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (503, 7004, 14569853, 'A', 19, 132);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (504, 2122, 14600521, 'A', 19, 135);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (505, 2123, 14603184, 'A', 15, 129);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (506, 2128, 14630294, 'A', 12, 138);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (507, 2133, 14671194, 'A', 12, 115);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (508, 2139, 14696441, 'A', 19, 127);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (509, 43, 14710971, 'A', 40, 137);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (510, 2141, 14717852, 'A', 15, 133);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (511, 6910, 14725929, 'A', 15, 120);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (512, 2143, 14733627, 'A', 19, 125);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (513, 2144, 14734528, 'A', 19, 125);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (514, 6723, 14753249, 'A', 25, 121);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (515, 7023, 14755841, 'A', 19, 124);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (516, 1247, 14796601, 'A', 28, 43);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (517, 2154, 14797276, 'A', 19, 137);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (518, 2155, 14810109, 'A', 15, 127);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (519, 2157, 14825487, 'A', 19, 127);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (520, 6812, 14837943, 'A', 145, 120);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (521, 2159, 14849076, 'A', 19, 121);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (522, 5424, 14888266, 'A', 19, 132);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (523, 6559, 14905555, 'A', 29, 123);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (524, 5545, 14942692, 'A', 19, 134);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (525, 348, 14954407, 'A', 29, 75);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (526, 2170, 14971821, 'A', 19, 121);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (527, 2171, 14979705, 'A', 19, 127);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (528, 2172, 14988927, 'A', 15, 116);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (529, 351, 14997416, 'A', 19, 137);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (530, 3662, 14998565, 'A', 27, 137);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (531, 6873, 15022272, 'A', 17, 66);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (532, 2175, 15023106, 'A', 12, 124);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (533, 2176, 15032515, 'A', 19, 128);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (534, 45, 15054647, 'A', 41, 47);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (535, 2184, 15064751, 'A', 12, 116);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (536, 46, 15069942, 'A', 41, 55);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (537, 2186, 15072366, 'A', 19, 119);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (538, 6863, 15106517, 'A', 23, 24);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (539, 2192, 15122134, 'A', 19, 118);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (540, 2193, 15122162, 'A', 19, 118);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (541, 2196, 15136138, 'A', 12, 116);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (542, 7003, 15139818, 'A', 19, 132);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (543, 5733, 15203695, 'A', 46, 84);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (544, 6681, 15206168, 'A', 542, 56);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (545, 367, 15216966, 'A', 26, 52);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (546, 6574, 15229499, 'A', 27, 12);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (547, 6313, 15263825, 'A', 40, 135);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (548, 369, 15264066, 'A', 23, 127);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (549, 373, 15311024, 'A', 29, 125);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (550, 3221, 15319292, 'A', 19, 138);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (551, 3222, 15319979, 'A', 12, 138);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (552, 2212, 15345212, 'A', 12, 133);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (553, 375, 15348081, 'A', 17, 120);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (554, 2216, 15364799, 'A', 19, 118);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (555, 2222, 15388448, 'A', 15, 137);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (556, 2226, 15408751, 'A', 15, 135);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (557, 2228, 15430063, 'A', 19, 138);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (558, 48, 15457592, 'A', 41, 47);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (559, 2230, 15457900, 'A', 19, 129);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (560, 2231, 15459341, 'A', 19, 125);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (561, 2234, 15472891, 'A', 15, 121);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (562, 2235, 15476640, 'A', 12, 124);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (563, 2238, 15487846, 'A', 19, 129);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (564, 2240, 15511522, 'A', 19, 130);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (565, 2241, 15514087, 'A', 19, 116);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (566, 2244, 15521729, 'A', 15, 130);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (567, 2247, 15575429, 'A', 12, 129);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (568, 1254, 15634285, 'A', 18, 48);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (569, 391, 15647965, 'A', 15, 129);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (570, 2257, 15666615, 'A', 19, 127);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (571, 6170, 15667023, 'A', 382, 17);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (572, 6964, 15671927, 'A', 17, 119);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (573, 1256, 15672680, 'A', 15, 119);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (574, 2262, 15693329, 'A', 452, 132);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (575, 394, 15713902, 'A', 19, 129);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (576, 1257, 15714120, 'A', 26, 47);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (577, 2265, 15727191, 'A', 19, 138);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (578, 2266, 15740220, 'A', 15, 133);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (579, 2271, 15788869, 'A', 19, 130);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (580, 5533, 15790965, 'A', 145, 123);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (581, 6783, 15828400, 'A', 121, 223);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (582, 6462, 15843138, 'A', 42, 57);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (583, 7033, 15897819, 'A', 23, 121);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (584, 7024, 15901137, 'A', 29, 12);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (585, 2282, 15907137, 'A', 15, 130);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (586, 1265, 15923284, 'A', 30, 46);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (587, 2284, 15933368, 'A', 19, 133);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (588, 2289, 15958913, 'A', 15, 134);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (589, 2290, 15960182, 'A', 19, 127);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (590, 5661, 16011985, 'A', 19, 118);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (591, 7037, 16027711, 'A', 11, 67);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (592, 6321, 16032162, 'A', 11, 70);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (593, 5554, 16032940, 'A', 17, 762);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (594, 2296, 16035292, 'A', 19, 131);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (595, 2297, 16036140, 'A', 12, 131);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (596, 5464, 16036797, 'A', 19, 131);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (597, 2298, 16037331, 'A', 19, 131);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (598, 416, 16061513, 'A', 19, 124);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (599, 2301, 16069891, 'A', 19, 116);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (600, 6833, 16085553, 'A', 11, 70);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (601, 2304, 16098061, 'A', 12, 121);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (602, 419, 16111395, 'A', 29, 137);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (603, 6282, 16133074, 'A', 25, 99);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (604, 2315, 16147665, 'A', 12, 129);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (605, 426, 16204868, 'A', 27, 756);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (606, 429, 16224400, 'A', 15, 136);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (607, 1269, 16234593, 'A', 13, 45);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (608, 2329, 16259860, 'A', 12, 134);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (609, 5258, 16271091, 'A', 19, 117);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (610, 2331, 16271747, 'A', 19, 117);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (611, 1271, 16291234, 'A', 30, 45);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (612, 4933, 16309927, 'A', 42, 70);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (613, 2335, 16315197, 'A', 12, 133);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (614, 2342, 16345453, 'A', 19, 118);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (615, 2343, 16349011, 'A', 19, 125);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (616, 3752, 16356594, 'A', 42, 756);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (617, 441, 16365596, 'A', 27, 138);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (618, 444, 16403596, 'A', 26, 45);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (619, 2350, 16423452, 'A', 19, 122);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (620, 2351, 16426074, 'A', 19, 138);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (621, 6704, 16431382, 'A', 11, 12);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (622, 6164, 16461410, 'A', 44, 56);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (623, 6987, 16478816, 'A', 29, 116);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (624, 2358, 16481729, 'A', 15, 137);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (625, 2360, 16500440, 'A', 12, 120);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (626, 2363, 16520231, 'A', 19, 125);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (627, 6355, 16557388, 'A', 44, 63);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (628, 452, 16557478, 'A', 17, 104);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (629, 2368, 16558719, 'A', 15, 129);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (630, 453, 16562439, 'A', 15, 124);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (631, 6445, 16562948, 'A', 281, 93);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (632, 455, 16565876, 'A', 25, 135);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (633, 456, 16567752, 'A', 29, 57);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (634, 6557, 16567898, 'A', 19, 132);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (635, 458, 16584024, 'A', 26, 45);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (636, 460, 16593123, 'A', 24, 54);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (637, 6968, 16593623, 'A', 15, 137);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (638, 2375, 16599094, 'A', 19, 131);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (639, 2376, 16605016, 'A', 19, 121);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (640, 5546, 16610363, 'A', 19, 134);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (641, 7035, 16616045, 'A', 19, 124);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (642, 4429, 16626683, 'A', 19, 133);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (643, 2380, 16627911, 'A', 19, 133);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (644, 2381, 16631721, 'A', 19, 138);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (645, 2383, 16636110, 'A', 19, 119);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (646, 2387, 16651666, 'A', 19, 135);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (647, 6531, 16657530, 'A', 40, 128);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (648, 6702, 16663040, 'A', 42, 104);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (649, 5738, 16675537, 'A', 17, 95);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (650, 6195, 16676119, 'A', 281, 67);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (651, 5841, 16676659, 'A', 25, 712);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (652, 468, 16707113, 'A', 29, 125);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (653, 2391, 16723845, 'A', 15, 130);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (654, 1277, 16737808, 'A', 30, 45);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (655, 6500, 16745544, 'A', 40, 131);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (656, 6555, 16753969, 'A', 19, 132);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (657, 2398, 16797751, 'A', 15, 116);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (658, 2399, 16802974, 'A', 12, 121);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (659, 2403, 16830087, 'A', 19, 125);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (660, 3225, 16846169, 'A', 19, 138);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (661, 2408, 16859427, 'A', 19, 119);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (662, 2410, 16894289, 'A', 19, 125);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (663, 2411, 16899423, 'A', 19, 127);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (664, 6065, 16901926, 'A', 23, 740);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (665, 6686, 16913916, 'A', 25, 129);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (666, 484, 16950065, 'A', 29, 137);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (667, 1278, 16961453, 'A', 22, 34);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (668, 6958, 16972060, 'A', 19, 124);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (669, 1279, 16984422, 'A', 28, 42);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (670, 2424, 17009131, 'A', 19, 116);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (671, 2425, 17010994, 'A', 19, 116);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (672, 4831, 17020089, 'A', 42, 25);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (673, 2429, 17027025, 'A', 15, 124);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (674, 1280, 17036896, 'A', 30, 52);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (675, 6354, 17058844, 'A', 44, 712);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (676, 502, 17064920, 'A', 23, 121);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (677, 6162, 17065276, 'A', 461, 12);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (678, 2435, 17087183, 'A', 19, 135);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (679, 2441, 17126520, 'A', 15, 134);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (680, 6060, 17134398, 'A', 72, 28);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (681, 512, 17142696, 'A', 19, 129);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (682, 4530, 17144051, 'A', 23, 129);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (683, 6957, 17147096, 'A', 19, 124);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (684, 6436, 17147326, 'A', 17, 762);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (685, 5011, 17155968, 'A', 40, 136);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (686, 1283, 17159985, 'A', 18, 42);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (687, 2444, 17162094, 'A', 15, 115);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (688, 1284, 17167607, 'A', 15, 124);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (689, 6034, 17205873, 'A', 271, 100);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (690, 6986, 17223906, 'A', 23, 116);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (691, 6871, 17224346, 'A', 29, 712);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (692, 2453, 17225563, 'A', 15, 124);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (693, 2454, 17231148, 'A', 15, 138);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (694, 2455, 17234041, 'A', 19, 125);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (695, 2456, 17234044, 'A', 15, 117);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (696, 2457, 17244558, 'A', 19, 130);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (697, 2462, 17265079, 'A', 12, 135);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (698, 5656, 17287213, 'A', 12, 129);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (699, 6962, 17290149, 'A', 17, 119);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (700, 6273, 17303214, 'A', 46, 721);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (701, 1288, 17363638, 'A', 26, 49);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (702, 2486, 17383295, 'A', 19, 120);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (703, 2488, 17393935, 'A', 15, 135);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (704, 6074, 17424355, 'A', 261, 755);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (705, 5762, 17425796, 'A', 27, 31);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (706, 2495, 17437748, 'A', 15, 138);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (707, 5382, 17439195, 'A', 563, 26);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (708, 2496, 17446231, 'A', 19, 133);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (709, 537, 17447900, 'A', 28, 50);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (710, 6895, 17455810, 'A', 29, 128);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (711, 2498, 17461401, 'A', 19, 138);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (712, 539, 17463108, 'A', 29, 120);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (713, 2499, 17463944, 'A', 19, 130);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (714, 2500, 17464891, 'A', 19, 130);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (715, 541, 17474206, 'A', 19, 129);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (716, 6751, 17488509, 'A', 11, 129);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (717, 2505, 17491671, 'A', 19, 134);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (718, 2506, 17498190, 'A', 120, 20);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (719, 6551, 17510260, 'A', 19, 135);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (720, 2511, 17518181, 'A', 19, 125);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (721, 2514, 17529730, 'A', 19, 135);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (722, 58, 17539130, 'A', 41, 50);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (723, 2516, 17547818, 'A', 19, 130);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (724, 5643, 17549084, 'A', 19, 119);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (725, 2517, 17552560, 'A', 15, 132);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (726, 545, 17556065, 'A', 25, 59);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (727, 2521, 17571985, 'A', 19, 117);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (728, 3253, 17586468, 'A', 26, 55);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (729, 2524, 17597130, 'A', 15, 135);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (730, 2525, 17601069, 'A', 19, 127);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (731, 5979, 17610071, 'A', 29, 58);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (732, 6573, 17613571, 'A', 25, 12);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (733, 2526, 17623808, 'A', 12, 133);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (734, 2527, 17624235, 'A', 19, 133);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (735, 2529, 17672205, 'A', 12, 133);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (736, 2531, 17676492, 'A', 321, 115);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (737, 6311, 17686229, 'A', 23, 129);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (738, 2533, 17686904, 'A', 19, 129);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (739, 2535, 17701517, 'A', 19, 138);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (740, 6691, 17711506, 'A', 11, 12);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (741, 2537, 17730098, 'A', 19, 116);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (742, 561, 17730303, 'A', 21, 116);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (743, 2538, 17739058, 'A', 19, 126);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (744, 2539, 17748906, 'A', 19, 120);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (745, 2541, 17760056, 'A', 12, 137);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (746, 562, 17773134, 'A', 19, 129);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (747, 1295, 17813371, 'A', 26, 34);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (748, 1296, 17814248, 'A', 19, 137);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (749, 2552, 17841740, 'A', 15, 125);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (750, 6431, 17856758, 'A', 120, 81);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (751, 2557, 17864279, 'A', 19, 135);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (752, 6926, 17884578, 'A', 12, 120);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (753, 6433, 17906952, 'A', 17, 70);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (754, 6262, 17922923, 'A', 23, 12);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (755, 2562, 17923880, 'A', 15, 125);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (756, 2564, 17925907, 'A', 19, 125);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (757, 2565, 17930142, 'A', 19, 127);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (758, 2566, 17933413, 'A', 19, 130);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (759, 7005, 17946086, 'A', 15, 132);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (760, 2574, 17978457, 'A', 19, 125);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (761, 2577, 17992544, 'A', 19, 137);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (762, 3256, 17994454, 'A', 19, 138);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (763, 6163, 18025464, 'A', 17, 17);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (764, 590, 18031724, 'A', 29, 79);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (765, 592, 18033740, 'A', 27, 65);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (766, 2584, 18051768, 'A', 19, 115);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (767, 2585, 18064005, 'A', 12, 125);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (768, 2586, 18065123, 'A', 19, 138);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (769, 598, 18093832, 'A', 19, 129);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (770, 599, 18096247, 'A', 11, 135);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (771, 6123, 18109006, 'A', 17, 100);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (772, 6687, 18111845, 'A', 11, 129);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (773, 2598, 18127934, 'A', 15, 116);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (774, 605, 18132134, 'A', 15, 129);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (775, 1301, 18135701, 'A', 30, 45);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (776, 6212, 18167370, 'A', 17, 66);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (777, 5638, 18175796, 'A', 23, 126);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (778, 6938, 18182916, 'A', 29, 23);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (779, 609, 18183863, 'A', 17, 70);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (780, 1304, 18189807, 'A', 12, 124);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (781, 1306, 18199970, 'A', 26, 43);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (782, 2611, 18215353, 'A', 19, 133);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (783, 615, 18222823, 'A', 12, 124);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (784, 6595, 18266396, 'A', 19, 118);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (785, 6335, 18276607, 'A', 47, 80);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (786, 5580, 18290273, 'A', 29, 119);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (787, 6443, 18296295, 'A', 29, 762);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (788, 6983, 18298069, 'A', 12, 116);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (789, 2618, 18298493, 'A', 15, 116);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (790, 1308, 18301803, 'A', 15, 137);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (791, 2620, 18303702, 'A', 19, 137);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (792, 2621, 18309866, 'A', 19, 128);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (793, 2626, 18321805, 'A', 15, 122);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (794, 2629, 18324432, 'A', 19, 136);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (795, 6706, 18329043, 'A', 17, 95);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (796, 626, 18343465, 'A', 26, 39);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (797, 6830, 18363572, 'A', 42, 58);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (798, 2643, 18391302, 'A', 19, 134);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (799, 6350, 18399254, 'A', 17, 71);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (800, 2645, 18399553, 'A', 19, 131);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (801, 636, 18418364, 'A', 26, 50);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (802, 6933, 18421386, 'A', 15, 127);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (803, 6991, 18440619, 'A', 44, 12);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (804, 1312, 18447383, 'A', 13, 43);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (805, 2653, 18453248, 'A', 19, 116);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (806, 2654, 18456075, 'A', 19, 135);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (807, 2656, 18457771, 'A', 15, 135);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (808, 7041, 18465143, 'A', 17, 12);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (809, 5861, 18467837, 'A', 23, 107);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (810, 6692, 18472411, 'A', 11, 12);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (811, 642, 18487095, 'A', 21, 129);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (812, 4976, 18493276, 'A', 19, 126);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (813, 643, 18504762, 'A', 12, 122);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (814, 3229, 18508368, 'A', 19, 138);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (815, 6822, 18514572, 'A', 11, 120);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (816, 2661, 18519561, 'A', 12, 116);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (817, 2662, 18526509, 'A', 19, 127);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (818, 647, 18541661, 'A', 19, 129);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (819, 2668, 18565724, 'A', 19, 134);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (820, 654, 18578041, 'A', 26, 46);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (821, 655, 18586844, 'A', 26, 50);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (822, 2675, 18605249, 'A', 19, 125);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (823, 659, 18636536, 'A', 28, 46);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (824, 6561, 18659160, 'A', 19, 123);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (825, 2684, 18699336, 'A', 19, 125);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (826, 662, 18708934, 'A', 11, 71);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (827, 664, 18729364, 'A', 19, 129);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (828, 2687, 18730530, 'A', 15, 129);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (829, 6877, 18754140, 'A', 11, 12);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (830, 6341, 18761079, 'A', 11, 14);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (831, 2693, 18776207, 'A', 19, 133);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (832, 674, 18776346, 'A', 27, 133);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (833, 6463, 18809650, 'A', 29, 761);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (834, 682, 18838683, 'A', 17, 119);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (835, 6614, 18850170, 'A', 15, 122);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (836, 2697, 18890905, 'A', 12, 125);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (837, 2700, 18910037, 'A', 15, 129);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (838, 688, 18911506, 'A', 22, 42);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (839, 4911, 18912889, 'A', 29, 74);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (840, 2704, 18929280, 'A', 19, 132);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (841, 694, 18934037, 'A', 19, 129);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (842, 4964, 18939306, 'A', 23, 131);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (843, 2709, 18967767, 'A', 12, 124);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (844, 698, 18992534, 'A', 29, 117);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (845, 2721, 19005349, 'A', 19, 125);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (846, 3240, 19042158, 'A', 19, 138);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (847, 2726, 19062127, 'A', 15, 137);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (848, 6937, 19086086, 'A', 25, 751);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (849, 710, 19101437, 'A', 11, 135);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (850, 716, 19150210, 'A', 24, 45);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (851, 2736, 19152139, 'A', 19, 117);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (852, 2737, 19153405, 'A', 15, 124);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (853, 2738, 19157785, 'A', 12, 120);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (854, 6931, 19159761, 'A', 12, 120);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (855, 2749, 19236944, 'A', 19, 134);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (856, 2750, 19237201, 'A', 19, 133);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (857, 6613, 19260414, 'A', 15, 122);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (858, 729, 19260706, 'A', 19, 122);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (859, 6880, 19273357, 'A', 11, 12);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (860, 6214, 19291616, 'A', 42, 79);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (861, 2759, 19308518, 'A', 19, 138);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (862, 2763, 19344993, 'A', 19, 127);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (863, 2765, 19355739, 'A', 19, 137);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (864, 746, 19368656, 'A', 19, 129);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (865, 2774, 19435288, 'A', 19, 131);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (866, 2775, 19441256, 'A', 19, 125);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (867, 1327, 19447930, 'A', 24, 48);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (868, 762, 19493175, 'A', 19, 129);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (869, 764, 19497737, 'A', 15, 129);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (870, 765, 19500261, 'A', 15, 124);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (871, 772, 19537821, 'A', 25, 133);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (872, 773, 19538215, 'A', 25, 133);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (873, 3250, 19576445, 'A', 12, 138);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (874, 781, 19581943, 'A', 19, 124);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (875, 6442, 19581973, 'A', 21, 57);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (876, 2792, 19603584, 'A', 12, 130);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (877, 2793, 19609468, 'A', 19, 135);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (878, 2794, 19610196, 'A', 19, 135);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (879, 2795, 19613715, 'A', 19, 119);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (880, 785, 19619900, 'A', 14, 761);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (881, 5502, 19620716, 'A', 145, 119);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (882, 2799, 19628249, 'A', 15, 136);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (883, 2801, 19634306, 'A', 19, 129);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (884, 5633, 19636485, 'A', 27, 132);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (885, 789, 19658574, 'A', 19, 124);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (886, 792, 19671186, 'A', 29, 59);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (887, 2805, 19704266, 'A', 19, 138);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (888, 2807, 19709425, 'A', 19, 116);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (889, 5911, 19710509, 'A', 29, 58);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (890, 4520, 19714368, 'A', 19, 132);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (891, 2809, 19715272, 'A', 15, 122);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (892, 2810, 19719270, 'A', 19, 130);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (893, 798, 19720008, 'A', 23, 129);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (894, 2812, 19734180, 'A', 19, 130);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (895, 801, 19753993, 'A', 29, 762);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (896, 2818, 19774744, 'A', 12, 116);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (897, 6993, 19797479, 'A', 11, 12);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (898, 4993, 19805334, 'A', 12, 115);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (899, 2825, 19812557, 'A', 15, 135);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (900, 4199, 19820193, 'A', 29, 107);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (901, 810, 19822168, 'A', 19, 129);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (902, 816, 19830495, 'A', 29, 77);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (903, 3252, 19832226, 'A', 19, 138);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (904, 818, 19835672, 'A', 26, 54);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (905, 2828, 19839487, 'A', 19, 116);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (906, 2829, 19841634, 'A', 12, 116);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (907, 1335, 19850379, 'A', 26, 45);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (908, 2834, 19879034, 'A', 19, 116);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (909, 6151, 19889348, 'A', 40, 122);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (910, 823, 19890210, 'A', 22, 39);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (911, 2846, 19914999, 'A', 19, 136);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (912, 2847, 19915717, 'A', 19, 136);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (913, 2848, 19917110, 'A', 321, 117);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (914, 1338, 19931845, 'A', 26, 47);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (915, 1340, 19946611, 'A', 18, 43);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (916, 2853, 19954145, 'A', 15, 137);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (917, 828, 19954827, 'A', 11, 137);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (918, 2857, 19975190, 'A', 12, 134);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (919, 2858, 19975475, 'A', 19, 134);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (920, 835, 19979916, 'A', 24, 50);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (921, 6784, 19998580, 'A', 42, 782);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (922, 2864, 20020835, 'A', 15, 115);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (923, 6352, 20026446, 'A', 17, 70);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (924, 6351, 20034894, 'A', 17, 14);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (925, 2867, 20042831, 'A', 15, 122);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (926, 840, 20043793, 'A', 15, 122);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (927, 6324, 20051482, 'A', 17, 70);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (928, 6707, 20083936, 'A', 25, 121);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (929, 2876, 20133661, 'A', 19, 135);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (930, 4035, 20150479, 'A', 29, 126);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (931, 6332, 20185900, 'A', 47, 99);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (932, 2881, 20192670, 'A', 15, 136);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (933, 2887, 20213730, 'A', 15, 125);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (934, 2889, 20226789, 'A', 12, 119);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (935, 5692, 20248444, 'A', 40, 129);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (936, 4349, 20271882, 'A', 19, 132);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (937, 864, 20278417, 'A', 19, 129);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (938, 1349, 20291468, 'A', 12, 124);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (939, 871, 20291945, 'A', 11, 14);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (940, 6934, 20304115, 'A', 29, 75);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (941, 874, 20307420, 'A', 19, 124);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (942, 6884, 20330608, 'A', 11, 12);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (943, 2907, 20346744, 'A', 19, 133);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (944, 6380, 20346817, 'A', 52, 133);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (945, 4551, 20355414, 'A', 19, 121);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (946, 4512, 20388167, 'A', 19, 132);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (947, 5425, 20389699, 'A', 12, 132);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (948, 6775, 20406530, 'A', 17, 12);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (949, 2915, 20417602, 'A', 15, 129);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (950, 898, 20417851, 'A', 15, 129);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (951, 6911, 20429501, 'A', 19, 135);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (952, 2923, 20443517, 'A', 15, 121);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (953, 2925, 20485225, 'A', 12, 122);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (954, 908, 20559187, 'A', 19, 136);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (955, 910, 20561278, 'A', 19, 129);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (956, 911, 20563860, 'A', 19, 124);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (957, 914, 20570738, 'A', 25, 125);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (958, 3430, 20602625, 'A', 19, 119);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (959, 4724, 20606365, 'A', 25, 59);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (960, 5101, 20629854, 'A', 29, 58);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (961, 2945, 20656161, 'A', 19, 135);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (962, 2946, 20664333, 'A', 12, 121);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (963, 929, 20682569, 'A', 27, 125);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (964, 1355, 20719320, 'A', 15, 137);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (965, 2952, 20720141, 'A', 15, 115);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (966, 6990, 20781217, 'A', 332, 71);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (967, 936, 20781586, 'A', 15, 136);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (968, 937, 20782480, 'A', 12, 136);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (969, 6781, 20783232, 'A', 11, 12);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (970, 6373, 20791003, 'A', 17, 70);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (971, 6062, 20793914, 'A', 23, 27);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (972, 945, 20803329, 'A', 12, 129);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (973, 2962, 20809567, 'A', 19, 132);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (974, 5751, 20826203, 'A', 225, 751);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (975, 950, 20827453, 'A', 15, 129);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (976, 953, 20838417, 'A', 15, 129);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (977, 955, 20839500, 'A', 19, 129);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (978, 6558, 20848239, 'A', 11, 128);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (979, 2966, 20865085, 'A', 19, 119);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (980, 1357, 20870677, 'A', 27, 71);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (981, 6075, 20871239, 'A', 17, 107);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (982, 2972, 20915892, 'A', 19, 130);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (983, 1358, 20916705, 'A', 13, 48);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (984, 5000, 20918467, 'A', 41, 48);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (985, 5771, 20935617, 'A', 27, 129);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (986, 1360, 20936171, 'A', 13, 48);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (987, 2976, 20950103, 'A', 19, 122);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (988, 965, 20978798, 'A', 29, 59);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (989, 6862, 20996689, 'A', 23, 114);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (990, 4601, 21004713, 'A', 17, 117);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (991, 2987, 21041407, 'A', 15, 116);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (992, 5504, 21047956, 'A', 12, 129);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (993, 1361, 21051072, 'A', 13, 48);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (994, 972, 21079365, 'A', 26, 50);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (995, 975, 21092485, 'A', 535, 88);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (996, 2993, 21094552, 'A', 19, 133);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (997, 976, 21102865, 'A', 15, 129);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (998, 2997, 21116573, 'A', 12, 124);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (999, 978, 21116971, 'A', 19, 124);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1000, 3002, 21147338, 'A', 19, 117);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1001, 6965, 21170344, 'A', 19, 119);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1002, 3004, 21174053, 'A', 12, 116);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1003, 3007, 21205002, 'A', 19, 135);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1004, 3011, 21238596, 'A', 19, 121);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1005, 6925, 21247165, 'A', 12, 120);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1006, 1367, 21274505, 'A', 26, 45);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1007, 6342, 21282007, 'A', 123, 14);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1008, 993, 21302896, 'A', 15, 137);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1009, 997, 21366782, 'A', 27, 134);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1010, 6196, 21375683, 'A', 27, 12);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1011, 3020, 21378490, 'A', 15, 138);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1012, 3022, 21391217, 'A', 12, 116);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1013, 3023, 21398863, 'A', 19, 133);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1014, 1002, 21407281, 'A', 19, 129);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1015, 1003, 21408826, 'A', 12, 129);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1016, 3024, 21409856, 'A', 15, 129);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1017, 1006, 21424336, 'A', 19, 129);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1018, 1010, 21438689, 'A', 15, 124);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1019, 3034, 21545394, 'A', 19, 125);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1020, 3035, 21545742, 'A', 19, 125);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1021, 1021, 21658185, 'A', 19, 124);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1022, 3037, 21666349, 'A', 19, 125);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1023, 3039, 21667514, 'A', 19, 125);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1024, 5974, 22029229, 'A', 261, 764);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1025, 5441, 22045522, 'A', 11, 126);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1026, 3043, 22088787, 'A', 12, 138);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1027, 6899, 22225249, 'A', 145, 121);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1028, 1031, 22276172, 'A', 19, 136);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1029, 3053, 22302639, 'A', 12, 121);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1030, 1035, 22348703, 'A', 29, 751);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1031, 1036, 22355238, 'A', 19, 124);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1032, 1037, 22384894, 'A', 19, 129);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1033, 1040, 22494224, 'A', 11, 70);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1034, 1044, 22525985, 'A', 19, 129);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1035, 6435, 22526906, 'A', 11, 12);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1036, 3057, 22588738, 'A', 12, 120);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1037, 1052, 22598962, 'A', 17, 122);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1038, 1053, 22599502, 'A', 19, 122);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1039, 1377, 22617221, 'A', 13, 48);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1040, 1380, 22658074, 'A', 22, 46);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1041, 1055, 22667227, 'A', 19, 129);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1042, 3061, 22692842, 'A', 15, 129);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1043, 6203, 22692885, 'A', 44, 77);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1044, 3062, 22700451, 'A', 19, 130);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1045, 1382, 22710481, 'A', 16, 48);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1046, 1058, 22768648, 'A', 19, 124);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1047, 6865, 22900633, 'A', 17, 210);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1048, 3091, 22962427, 'A', 19, 122);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1049, 3092, 22986241, 'A', 15, 128);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1050, 3093, 22996894, 'A', 19, 131);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1051, 7061, 22998320, 'A', 42, 59);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1052, 6705, 23073415, 'A', 17, 100);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1053, 6006, 23101216, 'A', 17, 57);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1054, 3097, 23148995, 'A', 19, 134);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1055, 3099, 23206160, 'A', 19, 128);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1056, 6377, 23529583, 'A', 17, 210);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1057, 1080, 23533344, 'A', 12, 130);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1058, 4970, 23610614, 'A', 12, 132);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1059, 1084, 23611172, 'A', 19, 129);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1060, 1090, 23624625, 'A', 15, 129);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1061, 6956, 23639327, 'A', 15, 124);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1062, 1389, 23651944, 'A', 18, 47);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1063, 1099, 23656016, 'A', 19, 129);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1064, 1100, 23656049, 'A', 19, 129);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1065, 1102, 23657182, 'A', 19, 129);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1066, 3112, 23676218, 'A', 19, 125);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1067, 7002, 23780081, 'A', 19, 132);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1068, 3258, 23862637, 'A', 12, 138);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1069, 73, 23952513, 'A', 41, 44);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1070, 3117, 24013987, 'A', 19, 122);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1071, 5428, 24019631, 'A', 19, 132);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1072, 6970, 24105202, 'A', 19, 131);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1073, 3121, 24130658, 'A', 19, 133);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1074, 5985, 24139608, 'A', 42, 65);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1075, 5388, 24174369, 'A', 15, 118);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1076, 1393, 24198130, 'A', 13, 46);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1077, 7012, 24205143, 'A', 29, 75);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1078, 1395, 24274757, 'A', 16, 47);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1079, 6782, 24315663, 'A', 11, 12);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1080, 3128, 24373217, 'A', 15, 128);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1081, 1399, 24419296, 'A', 26, 44);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1082, 1129, 24435596, 'A', 19, 129);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1083, 3130, 24447983, 'A', 13, 34);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1084, 1130, 24455819, 'A', 19, 129);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1085, 7071, 24579010, 'A', 452, 123);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1086, 6560, 24579423, 'A', 19, 123);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1087, 3132, 24594738, 'A', 15, 133);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1088, 5559, 24619127, 'A', 25, 58);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1089, 3134, 24621121, 'A', 19, 125);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1090, 3135, 24622579, 'A', 19, 125);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1091, 3136, 24625553, 'A', 19, 133);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1092, 3137, 24633957, 'A', 12, 137);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1093, 1140, 24669520, 'A', 19, 118);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1094, 7006, 24687814, 'A', 12, 132);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1095, 3143, 24727035, 'A', 15, 138);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1096, 6612, 24794559, 'A', 19, 122);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1097, 1402, 24798613, 'A', 19, 137);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1098, 6961, 24807020, 'A', 11, 119);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1099, 6872, 24898165, 'A', 29, 754);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1100, 4195, 24933181, 'A', 23, 751);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1101, 5372, 24998069, 'A', 21, 24);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1102, 3148, 25120009, 'A', 12, 122);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1103, 1158, 25174923, 'A', 15, 136);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1104, 1162, 25217119, 'A', 15, 129);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1105, 6378, 25218863, 'A', 25, 76);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1106, 5675, 25222916, 'A', 14, 223);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1107, 3262, 25308825, 'A', 26, 55);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1108, 3165, 25323378, 'A', 12, 138);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1109, 3149, 25344630, 'A', 12, 116);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1110, 6132, 25411746, 'A', 17, 107);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1111, 6063, 25455557, 'A', 123, 98);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1112, 6710, 25466093, 'A', 72, 86);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1113, 6927, 25512083, 'A', 12, 120);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1114, 6512, 25531075, 'A', 46, 762);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1115, 6923, 25559507, 'A', 12, 120);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1116, 6879, 25574173, 'A', 11, 12);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1117, 6878, 25575612, 'A', 11, 12);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1118, 6761, 25575623, 'A', 11, 12);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1119, 6922, 25579488, 'A', 40, 127);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1120, 6963, 25644035, 'A', 12, 119);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1121, 74, 25674518, 'A', 41, 47);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1122, 6876, 25795162, 'A', 571, 74);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1123, 1176, 25832536, 'A', 23, 135);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1124, 4301, 25867744, 'A', 17, 107);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1125, 5003, 25872405, 'A', 23, 57);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1126, 5637, 25936423, 'A', 12, 120);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1127, 5651, 25977039, 'A', 145, 134);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1128, 5635, 26029304, 'A', 12, 129);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1129, 6969, 26087204, 'A', 19, 131);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1130, 6033, 26089543, 'A', 17, 755);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1131, 6136, 26113188, 'A', 25, 762);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1132, 6611, 26209010, 'A', 17, 134);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1133, 5690, 26217140, 'A', 44, 740);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1134, 6444, 26221053, 'A', 55, 210);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1135, 3267, 26222767, 'A', 12, 138);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1136, 4306, 26312899, 'A', 11, 129);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1137, 5485, 26334329, 'A', 14, 22);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1138, 5259, 26539250, 'A', 19, 117);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1139, 5520, 26614990, 'A', 25, 126);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1140, 6084, 26728074, 'A', 14, 14);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1141, 5403, 26754949, 'A', 25, 115);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1142, 6532, 26794215, 'A', 14, 12);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1143, 6572, 26895348, 'A', 25, 12);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1144, 6952, 26920236, 'A', 15, 126);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1145, 6302, 26994339, 'A', 14, 223);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1146, 5503, 27047952, 'A', 21, 762);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1147, 6593, 27261420, 'A', 25, 131);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1148, 6439, 27446264, 'A', 11, 107);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1149, 6051, 27450893, 'A', 25, 76);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1150, 4313, 27470745, 'A', 23, 114);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1151, 6722, 27784687, 'A', 17, 14);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1152, 6701, 27795771, 'A', 17, 58);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1153, 6124, 27797241, 'A', 17, 107);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1154, 6951, 27958527, 'A', 25, 120);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1155, 6803, 27965342, 'A', 14, 210);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1156, 5721, 28101018, 'A', 14, 107);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1157, 6935, 28172156, 'A', 25, 120);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1158, 6992, 28184304, 'A', 11, 12);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1159, 6988, 28201550, 'A', 17, 116);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1160, 6274, 28307378, 'A', 11, 56);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1161, 4311, 28331511, 'A', 17, 107);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1162, 7021, 28413890, 'A', 25, 140);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1163, 6438, 28494658, 'A', 11, 22);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1164, 5647, 28684022, 'A', 11, 124);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1165, 6319, 29502403, 'A', 11, 118);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1166, 6771, 29521566, 'A', 14, 12);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1167, 6399, 29529266, 'A', 11, 12);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1168, 5972, 29617218, 'A', 11, 31);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1169, 5847, 29622423, 'A', 111, 754);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1170, 6317, 29797942, 'A', 11, 63);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1171, 5981, 29991336, 'A', 11, 14);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1172, 6315, 30100638, 'A', 11, 115);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1173, 6841, 30226035, 'A', 11, 12);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1174, 6333, 30722062, 'A', 11, 107);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1175, 6395, 30967684, 'A', 11, 12);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1176, 7022, 31012816, 'A', 12, 119);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1177, 6330, 31084242, 'A', 11, 107);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1178, 6802, 31341154, 'A', 11, 210);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1179, 6318, 31360731, 'A', 11, 57);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1180, 6823, 31370462, 'A', 11, 120);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1181, 6396, 31408164, 'A', 11, 12);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1182, 6864, 31693381, 'A', 11, 210);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1183, 6437, 31745612, 'A', 11, 107);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1184, 6023, 32353249, 'A', 11, 65);
INSERT INTO public.worker (id, worker_id, civ, status, charge_id, dependence_id) VALUES (1185, 1193, 82098315, 'A', 23, 156);


--
-- TOC entry 5337 (class 0 OID 949759)
-- Dependencies: 285
-- Data for Name: workers_data; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (1, 1414, '636204', 'VIOLETA COROMOTO, YEPEZ DE MATOS', 19, 124, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (2, 1418, '3062111', 'CLEOPATRA , RAMIREZ OMAÑA', 15, 124, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (3, 1423, '3660639', 'MARTA LIA, RIVERA ROVIRA', 19, 124, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (4, 1427, '3839102', 'JOSE MANUEL, CARRASCO ', 12, 124, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (5, 1428, '3916013', 'TERESA DEL CARMEN, GARCIA GUTIERREZ', 19, 124, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (6, 1435, '4282579', 'CARLOS PORFIRIO, GARCIA KIENZLER', 19, 124, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (7, 6774, '4580553', 'RAUL RICARDO, FARFAN ', 47, 140, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (8, 1445, '4680842', 'MARIA ISABEL, JASPE GUTIERREZ', 19, 124, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (9, 1450, '4872516', 'OLIVER BARNARDIZ, SANCHEZ PARRA', 19, 124, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (10, 1455, '5004884', 'JOSE ANTONIO, FROMETA GRILLO', 12, 124, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (11, 1458, '5121911', 'SOLEDAD , INOJOSA CASTRO', 19, 124, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (12, 1460, '5132444', 'JESUS AURELIO, CORONADO ARENAS', 19, 124, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (13, 3069, '5147134', 'WILLIAM RAMON, MIRANDA CAPOTE', 17, 70, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (14, 3071, '5301899', 'REINALDO , SOSA VALENCIA', 29, 97, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (15, 1472, '5407643', 'MARYORI TIBISAY, VERDU CANACHE', 19, 124, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (16, 1478, '5571823', 'MARIA DOLORES, DARIAS FERNANDEZ', 15, 124, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (17, 6601, '5616086', 'MARIA DEL ROSARIO, BUITRAGO GONZALEZ', 29, 17, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (18, 6514, '5678047', 'MIGUEL ANGEL, CONCEPCION NIETO', 11, 14, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (19, 6892, '5892907', 'ROSA VICTORIA, MATA VALERA', 23, 79, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (20, 1494, '6066611', 'MARIA NELLY, MEDINA GARCIA', 12, 124, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (21, 6708, '6085188', 'NAGIB CARLOS, HEREDIA ', 29, 17, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (22, 3078, '6100860', 'CARLOS JOSE, NUÑEZ SALAZAR', 17, 71, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (23, 3080, '6141706', 'OSCAR MIGUEL, HERNANDEZ ', 17, 14, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (24, 75, '6182582', 'JOSE ANTONIO, LOPEZ  ', 17, 14, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (25, 4834, '6263682', 'PEDRO ARMANDO, PARADA LOOR', 261, 152, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (26, 4954, '6269749', 'ANGEL RAFAEL, RODRIGUEZ ESCOBAR', 11, 71, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (27, 5335, '6291135', 'GERONIMO RODOLFO, RODRIGUEZ MORGADO', 42, 22, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (28, 6801, '6366133', 'AURA FRANCISCA, ANGULO HERRERA', 29, 58, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (29, 6932, '6472216', 'JUAN CARLOS, ANTEQUERA SAAVEDRA', 46, 157, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (30, 1520, '6511331', 'ELEADYS ACACIA, REVERON ASCANIO', 19, 124, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (31, 101, '6857315', 'CANDELARIA , ORTEGA ', 11, 70, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (32, 1195, '6864252', 'PRAYA ELIZABETH, ROJAS ORTIZ', 19, 124, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (33, 5673, '6961404', 'EDGAR MARTIN, CHACON ZAPATA', 120, 19, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (34, 4840, '6969987', 'ANTONINO JESUS, DI CARLO DI PASQUALE', 29, 139, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (35, 6773, '7121016', 'ESTEBAN RAMON, PINTO OCHOA', 44, 21, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (36, 1569, '7721980', 'CARLOS LUIS, PIRELA QUEVEDO', 12, 124, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (37, 6959, '7927220', 'DELFINO JOSE, FARNETANO ALAPON', 17, 124, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (38, 6955, '8262447', 'GONZALO RAFAEL, MENESES ARIAS', 42, 23, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (39, 6772, '8731566', 'VICTOR EMILIO, GONZALEZ ', 46, 156, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (40, 122, '8881733', 'LEIDA FELICIA, GUZMAN ROJAS', 25, 99, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (41, 128, '9265719', 'JOSE SABINO, ALTUVE RONDON', 17, 14, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (42, 4120, '9315723', 'ODILA RAMONA, DUARTE DE JEUNE', 17, 70, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (43, 7008, '9414764', 'ANAYANSI , CANTILLO LINARES', 19, 124, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (44, 6689, '10112174', 'GUSTAVO ADOLFO, GARCIA IBARRA', 29, 107, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (45, 7036, '10184958', 'KARINA DEL VALLE, BETHELMY SOTILLO', 19, 124, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (46, 6885, '10186377', 'MARIA LUISA, LOPEZ YEPEZ', 11, 12, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (47, 4472, '10240796', 'DORA MARGARITA, LEON DE GUERRERO', 11, 70, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (48, 151, '10433901', 'MIRIAM TERESA, HORTA MARRIAGA', 17, 70, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (49, 153, '10487534', 'NORMA MARGARITA, APONTE CASTILLO', 11, 70, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (50, 156, '10517146', 'GLORIA DEL CARMEN, GARABITO RUIZ', 29, 124, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (51, 157, '10519509', 'ZULAY COROMOTO, NARANJO DE SANCHEZ', 11, 70, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (52, 6348, '10519731', 'JHONNY ALEXANDER, MARTINEZ ARDILA', 11, 14, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (53, 1741, '10520598', 'MARLENE YAJAIRA, TRIANA GOMEZ', 19, 124, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (54, 7007, '10546390', 'NANCY JOSEFINA, TRUJILLO PATIÑO', 19, 124, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (55, 1745, '10576828', 'YAMILET , CASTELLANO BASTIDAS', 19, 124, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (56, 160, '10578522', 'CARLOS EDUARDO, SILVEIRA ZERPA', 23, 136, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (57, 6035, '10780501', 'FRANKLIN JOSE GREGORIO, ROMERO SALINAS', 281, 107, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (58, 165, '10786396', 'ARMANDO JOSE, RODRIGUEZ VEGA', 11, 56, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (59, 167, '10828378', 'JENNY DEL CARMEN, CARRERO VILLASMIL', 23, 56, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (60, 169, '10865782', 'XIOMARA DEL CARMEN, CUMACHINA ', 17, 70, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (61, 6085, '11157639', 'LIZABETH CAROL, CISNEROS ', 42, 89, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (62, 6301, '11164881', 'JANUCSY LIANETT, VIVAS GONZALEZ', 11, 12, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (63, 7011, '11244736', 'NIDIA KARILY, ORTEGA ', 29, 140, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (64, 194, '11366743', 'RAFAEL ENRIQUE, SALAZAR ', 11, 70, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (65, 5657, '11410970', 'ELENA MERCEDES, CASTILLO ARROYO', 12, 124, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (66, 1812, '11550601', 'YANINA , PERRICONE DE ZOMOSA', 15, 124, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (67, 1813, '11561439', 'PURA MARGARITA DEL VALLE, MILLAN MEDINA', 12, 124, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (68, 206, '11669307', 'DELCY  , PINILLA DE GONALEZ', 29, 59, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (69, 1819, '11689315', 'WILLIAM OSWALDO, SUAREZ VARGAS', 19, 124, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (70, 210, '11742070', 'MILEIZI ZULAY, VARGAS CABELLO', 25, 99, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (71, 4535, '11793272', 'ROSEBETH DEL ROSARIO, MARIANI ESPIDEA', 29, 58, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (72, 7009, '11899858', 'EDUARDO ANTONIO, CARRILLO BERMUDEZ', 19, 124, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (73, 5131, '11938837', 'YAREKY ISABEL, BORGES ', 17, 223, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (74, 6804, '11944972', 'EDUMIR RAMON, TORO MONTOYA', 17, 140, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (75, 219, '12085180', 'DORKA ANTONIETA, COLINA ', 23, 59, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (76, 6061, '12115540', 'DAMELIS CECILIA, ESCOBAR ALVAREZ', 23, 27, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (77, 6721, '12164686', 'YOURIS UBALDO, GONZALEZ SANCHEZ', 11, 12, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (78, 6346, '12376915', 'JESUS ORLANDO, CUMANA RIVAS', 17, 14, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (79, 6329, '12399154', 'JENNY JOSEFINA, CAMARGO HERNANDEZ', 17, 107, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (80, 6971, '12562760', 'ELISA MARIA, DA SILVA MACEDO', 29, 223, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (81, 7051, '12563145', 'MARIA ALEJANDRA, BLANCO HERNANDEZ', 11, 12, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (82, 6347, '12626343', 'FRANK , URIBE ', 17, 12, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (83, 30, '12627128', 'HENGLER , SANCHEZ RODRIGUEZ', 41, 42, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (84, 6703, '12717002', 'ALEXIS JOSE, SANCHEZ ', 11, 12, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (85, 5102, '12747896', 'PEDRO ALCANTARA, LAYA GUACACHE', 11, 71, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (86, 5514, '12761907', 'GILBERTO ANTONIO, MORALES FLORES', 17, 14, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (87, 6960, '12976588', 'DENIS MORELA, BREA ESCALONA', 19, 124, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (88, 4792, '13139582', 'YESENIA ZULEIMA, ECHEVERRIA ', 25, 66, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (89, 1985, '13320255', 'FRANK EDUARDO, FLORES MORA', 27, 157, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (90, 6861, '13325504', 'NELSON ENRIQUE, GUTIERREZ SAAVEDRA', 42, 18, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (91, 6391, '13339166', 'ALICIA JEANINE, RIVAS MADRIZ', 17, 77, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (92, 1997, '13457841', 'FRANCISCO JAVIER, MATA ', 19, 124, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (93, 4751, '13463048', 'ALEXANDRA DE LA CRUZ, PLAMA REYES', 27, 70, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (94, 276, '13479588', 'ORANGELICA JOSE, GUERRA VALENCIA', 23, 156, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (95, 1226, '13493799', 'JUANA ROSALIA, PLAZA ALDANA', 15, 124, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (96, 278, '13506477', 'MARIA ALEJANDRA, CHACON PINEDA', 29, 81, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (97, 287, '13617600', 'GILMAR CECILIA, ESPINOZA GUILLEN', 25, 93, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (98, 6451, '13630953', 'MARTHA MARIA, PEREZ PEREZ', 271, 95, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (99, 6193, '13673745', 'ALEXIS ALEXANDER, MADRID ', 11, 70, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (100, 6709, '13678167', 'KISKEYA KARINA, LINARES LEON', 17, 81, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (101, 297, '13847307', 'OSCAR JOSE, GUILARTE ASTUDILLO', 11, 65, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (102, 6762, '13851088', 'NATHALI JOSE, QUINTERO AVILA', 25, 12, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (103, 6511, '13888040', 'JUAN MANUEL, CEDEÑO QUIÑONEZ', 21, 12, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (104, 6832, '13888116', 'ROLANDO JOSE, FIGUEROA ARIAS', 14, 70, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (105, 6941, '13951387', 'EYLIN REINA, MORENO ', 17, 70, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (106, 6813, '13993461', 'CARLOS FRANCISCO, LOPEZ ', 40, 124, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (107, 5684, '14017338', 'ANDREINA DEL VALLE, VASQUEZ COVA', 23, 65, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (108, 2053, '14034157', 'LUISA KATIANA, REVOLLEDO VELASQUEZ', 12, 124, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (109, 6281, '14195856', 'ERICK YULIMAR, CUMANA RIVAS', 17, 12, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (110, 6398, '14201465', 'KRISTIANS HUMBERTO, MOHAMED ORAMAS', 11, 12, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (111, 6860, '14299442', 'JIMMY ALEXIS, CARRASCO ALVAREZ', 14, 14, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (112, 6936, '14407820', 'EDWARD IGNACIO, MEZA RAMIREZ', 23, 140, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (113, 6835, '14527054', 'MANUEL ANTONIO, CALDERON PEREZ', 17, 14, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (114, 7023, '14755841', 'RONALD ALEXANDER, GARCIA TORRES', 19, 124, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (115, 348, '14954407', 'NORELKIS ELIZABETH, BERNAL MARRON', 29, 75, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (116, 6873, '15022272', 'MAIKEL OMAR, BUENAÑO LINARES', 17, 66, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (117, 2175, '15023106', 'MARYURY DEL VALLE, LOPEZ BASTARDO', 12, 124, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (118, 6863, '15106517', 'JOSE GREGORIO, ACEVEDO ', 23, 24, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (119, 5733, '15203695', 'JENNIFER TAMARA, MARIN AFFONSO', 46, 84, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (120, 6574, '15229499', 'MARIA ALEJANDRA, COLINA ', 27, 12, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (121, 2235, '15476640', 'KERLY ALEJANDRA, ROMERO NUÑEZ', 12, 124, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (122, 6170, '15667023', 'MARIANGELA , ALMARZA CUELLO', 382, 17, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (123, 6783, '15828400', 'JENNIFER JAMILE, PAUL ', 121, 223, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (124, 6462, '15843138', 'SHIRLLYE DEL MAR, PACHECO COLMENARES', 42, 57, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (125, 7024, '15901137', 'FRANCIS COROMOTO, VIELMA MENDOZA', 29, 12, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (126, 7037, '16027711', 'YUSBERLY CAROLINA, LINARES AULAR', 11, 67, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (127, 6321, '16032162', 'VALERY ALEXANDRA, DIAZ DE DOMINGUEZ', 11, 70, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (128, 416, '16061513', 'YENNIFER DAMELIS, ASTUDILLO CORREA', 19, 124, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (129, 6833, '16085553', 'LINDA VIOLENI, ANTILLANO BEJARANO', 11, 70, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (130, 6282, '16133074', 'WILKER WILFREDO, MUJICA COLON', 25, 99, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (131, 429, '16224400', 'GLENDA NAISMAR, RAMOS PLAZA', 15, 136, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (132, 4933, '16309927', 'JHON MANUEL, GUTIERREZ MARIN', 42, 70, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (133, 6704, '16431382', 'GIANCARLO , AGUDO FERNANDEZ', 11, 12, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (134, 6164, '16461410', 'ORIANA GISELLE, VALDEZ COVA', 44, 56, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (135, 6355, '16557388', 'FRANCISCO DAVID, MIRANDA DIAZ', 44, 63, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (136, 452, '16557478', 'EILLYN RAQUEL, GARCIA CARDOZA', 17, 104, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (137, 453, '16562439', 'JAMAIKA JUSSIKI, MALAVE CAMPOS', 15, 124, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (138, 6445, '16562948', 'NABETSY PATRICIA, TKACHENKO DELGADO', 281, 93, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (139, 456, '16567752', 'YASMIN JOSEFINA, BARROETA CARAPAICA', 29, 57, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (140, 7035, '16616045', 'DANIEL ALBERTO, MONCADA PARADA', 19, 124, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (141, 6702, '16663040', 'YULIMAR DEL VALLE, BRICEÑO GIL', 42, 104, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (142, 5738, '16675537', 'GERALDINE NAZARET, PEREIRA MUÑOZ', 17, 95, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (143, 6195, '16676119', 'JULIO CESAR, MALAVE BERMEJO', 281, 67, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (144, 5841, '16676659', 'ISBETTYS CELINA, GARCIA MARTINEZ', 25, 712, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (145, 6065, '16901926', 'CRISTIE JULIANY, MONTES DE FERNANDES', 23, 740, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (146, 6958, '16972060', 'JOSE FRANCISCO, AMARIO ALCALA', 19, 124, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (147, 1279, '16984422', 'AYETZA MARIA, TOLEDO MEDINA', 28, 42, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (148, 4831, '17020089', 'DILIAN DEL CARMEN, LOPEZ LOPEZ', 42, 25, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (149, 2429, '17027025', 'DIANA CAROLINA, LOPEZ ', 15, 124, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (150, 6354, '17058844', 'AURA LILIBETH, GRATEROL ORTEGA', 44, 712, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (151, 6162, '17065276', 'MARIA FERNANDA, PALENCIA AVENDAÑO', 461, 12, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (152, 6060, '17134398', 'YORAIMA YANINA, CASTELLANOS MARTINEZ', 72, 28, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (153, 6957, '17147096', 'JULIESKA MERCEDES, BAPTISTA BERASTEGUI', 19, 124, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (154, 5011, '17155968', 'CARLA KARINA, GONZALEZ FIGUEROA', 40, 136, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (155, 1283, '17159985', 'DENISEE YORLEY, NOGUERA DUEÑAS', 18, 42, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (156, 1284, '17167607', 'YELITZA DEL CARMEN, CARAPAICA VARGAS', 15, 124, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (157, 6034, '17205873', 'JESUS ANTONIO, PEÑA CAMACHO', 271, 100, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (158, 6871, '17224346', 'YOUSELINE UENSE, ARMAS PIÑATE', 29, 712, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (159, 2453, '17225563', 'DENIMAR DEYANIRA, RAMONES DIAZ', 15, 124, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (160, 5762, '17425796', 'NIURKA ATAMAICA, CASTILLO RONDON', 27, 31, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (161, 5382, '17439195', 'JHONEIDY KARINA, LINARES CARDENAS', 563, 26, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (162, 2506, '17498190', 'MARIA ARALI, SUSARRE ORASMA', 120, 20, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (163, 545, '17556065', 'SARA ISABEL, TINOCO FLORES', 25, 59, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (164, 5979, '17610071', 'NOHEMY , DELGADO AROCHA', 29, 58, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (165, 6573, '17613571', 'EDWARD ELIU, FORERO JAIMES', 25, 12, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (166, 6691, '17711506', 'LUIS ALBERTO, GONZALEZ SANCHEZ', 11, 12, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (167, 6431, '17856758', 'BEATRIZ TERESA, ARELLAN DE RAMIREZ', 120, 81, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (168, 6433, '17906952', 'AYMARA CATERLYN, PALMA REYES', 17, 70, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (169, 6262, '17922923', 'YORDALYS EUNICE, BARCENAS ', 23, 12, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (170, 6163, '18025464', 'MARIA JOSE, MIRABAL MEJIAS', 17, 17, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (171, 590, '18031724', 'ANGEL KENYER, SEQUERA REYES', 29, 79, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (172, 592, '18033740', 'LISSETT CAROLINA, RUIZ ZERPA', 27, 65, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (173, 6123, '18109006', 'ROSAIDA COROMOTO, RODRIGUEZ RODRIGUEZ', 17, 100, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (174, 6212, '18167370', 'DARIANY EMILIA, PEREZ GRATEROL', 17, 66, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (175, 6938, '18182916', 'FLAVIO ENRIQUE, SALAS MORENO', 29, 23, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (176, 609, '18183863', 'BERELIS MARIA, CASTRO GONZALEZ', 17, 70, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (177, 1304, '18189807', 'REINA VANESKA SANID, IDROGO SANCHEZ', 12, 124, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (178, 615, '18222823', 'JORGE LUIS, OLIVIER ACOSTA', 12, 124, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (179, 6335, '18276607', 'JACKILDE SOSILBER, MONTILLA LUNAR', 47, 80, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (180, 2629, '18324432', 'ROSALBA JOSEFINA, TORTOZA MARTINEZ', 19, 136, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (181, 6706, '18329043', 'SIOLY MAYERLIN, SEQUERA TORREALBA', 17, 95, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (182, 6830, '18363572', 'ANDREA TERESA, COLMENARES GONZALEZ', 42, 58, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (183, 6350, '18399254', 'CARLOS ANTONIO, RUIZ MARTINEZ', 17, 71, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (184, 6991, '18440619', 'LYSBEIDA ALEJANDRA, BLANCO BOLIVAR', 44, 12, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (185, 7041, '18465143', 'NELSON JOSE, MEJIAS PERAZA', 17, 12, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (186, 5861, '18467837', 'JOHANNA ALEJANDRA DE GERICO, CLARK ', 23, 107, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (187, 6692, '18472411', 'ROSAURA , CONTRERAS TERAN', 11, 12, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (188, 662, '18708934', 'ERIK ALBERTO, ACOSTA RICO', 11, 71, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (189, 6877, '18754140', 'BRISMARY DEL VALLE, MARCANO TAVIO', 11, 12, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (190, 6341, '18761079', 'JEISON JOSE, MARTINEZ MARTINEZ', 11, 14, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (191, 688, '18911506', 'MARIANA SOLEDAD, LUQUEZ MAURERA', 22, 42, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (192, 4911, '18912889', 'DEYLI CAROLINA, AMARO HERNANDEZ', 29, 74, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (193, 2709, '18967767', 'GABRIELA COROMOTO, GONZALEZ VASQUEZ', 12, 124, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (194, 2737, '19153405', 'LUIS ALBERTO, FLORES ZAMORA', 15, 124, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (195, 6880, '19273357', 'OSCAR ALEXANDER, GONZALEZ REGALADO', 11, 12, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (196, 6214, '19291616', 'YARLING JOSEFINA, ROMERO AGUIRRE', 42, 79, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (197, 765, '19500261', 'DRAILY BETZABETH, PATIÑO USECHE', 15, 124, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (198, 781, '19581943', 'ELIGGISMA DEL CARMEN, RODRIGUEZ GONZALEZ', 19, 124, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (199, 6442, '19581973', 'SIEDEYLI JOSELYN, ALVAREZ VARONA', 21, 57, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (200, 2799, '19628249', 'BETITZA ALEJANDRA, ILARRAZA LOPEZ', 15, 136, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (201, 789, '19658574', 'YUNEIRA DESIREE, RAMIREZ CHACON', 19, 124, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (202, 792, '19671186', 'MAYRET DE JESUS, ESPINOZA LOVERA', 29, 59, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (203, 5911, '19710509', 'ANEL ANTONIO, RUIDIAZ CHACON', 29, 58, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (204, 6993, '19797479', 'DANCING OSCARINA, CARDENAS GOYO', 11, 12, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (205, 4199, '19820193', 'DILMARYS MILAGRO, DELGADO RIVERO', 29, 107, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (206, 816, '19830495', 'YANETSI CAROLINA, OCANTO PIÑANGO', 29, 77, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (207, 2846, '19914999', 'DEILIMAR DAYANARA, CANELON JUSTO', 19, 136, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (208, 2847, '19915717', 'GRESLHY CAROLINA, SALAZAR ROJAS', 19, 136, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (209, 6352, '20026446', 'ALFREDO RAFAEL, DIMAS AGUILAR', 17, 70, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (210, 6351, '20034894', 'JHON LUIS, RIVAS RIVERO', 17, 14, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (211, 6324, '20051482', 'SARA HARMENIA, GARCIA CARDOZA', 17, 70, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (212, 6332, '20185900', 'MARIA DE LOS ANGELES, GONZALEZ GARCIA', 47, 99, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (213, 2881, '20192670', 'ESTEFANY MARYAN, GALINDO LIENDO', 15, 136, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (214, 1349, '20291468', 'DENISSE ALEXANDRA, DIAZ MEJIAS', 12, 124, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (215, 871, '20291945', 'VICTOR EDGARDO, CASTRO ORTIZ', 11, 14, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (216, 6934, '20304115', 'MAYELA SUSANA, TORRES CALDERON', 29, 75, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (217, 874, '20307420', 'LUIGI ERICK, RIVERA FIGUEROA', 19, 124, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (218, 6884, '20330608', 'NATASHA DESIREE, ZAPATA LOPEZ', 11, 12, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (219, 6775, '20406530', 'VANESSA KARELIS, CUEVAS PAVON', 17, 12, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (220, 908, '20559187', 'SERMARI SOLIMAR, CABRERA MEDINA', 19, 136, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (221, 911, '20563860', 'EMELI ANDREINA, REINOSA LEZAMA', 19, 124, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (222, 4724, '20606365', 'ABRAMNY EVELYN, PINTO SUAREZ', 25, 59, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (223, 5101, '20629854', 'NEILLYN  , ZAMBRANO HERNANDEZ', 29, 58, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (224, 6990, '20781217', 'YEFERSON ANDRES, GONZALEZ SANCHEZ', 332, 71, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (225, 936, '20781586', 'WILLIANIS KATERINE, TREJO BORGES', 15, 136, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (226, 937, '20782480', 'ROMELY ALEJANDRA, SALAZAR YEGUEZ', 12, 136, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (227, 6781, '20783232', 'ENLLERSON RAMON, COVA MENDOZA', 11, 12, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (228, 6373, '20791003', 'JESICCA VIRGINIA, FLORES GARCIA', 17, 70, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (229, 6062, '20793914', 'GERALDINE  , NAVARRO MAYA', 23, 27, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (230, 1357, '20870677', 'GENESIS YOHANA, GARCIA SUCRE', 27, 71, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (231, 6075, '20871239', 'JUNIOR JOSE, AMAYA JURADO', 17, 107, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (232, 965, '20978798', 'ARTURO DE JESUS, MARTINEZ ROJAS', 29, 59, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (233, 6862, '20996689', 'RAYLETH ALESSANDRA, GUEVARA ALVIAREZ', 23, 114, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (234, 975, '21092485', 'JOSE GREGORIO, OROPEZA ROMERO', 535, 88, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (235, 2997, '21116573', 'ELIEZER JOSE, FIGUEROA SALAZAR', 12, 124, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (236, 978, '21116971', 'SHIRLEY  , ROJAS CASTILLO', 19, 124, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (237, 6342, '21282007', 'NELSON ANDRES, GONZALEZ CRUZ', 123, 14, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (238, 6196, '21375683', 'JOSE DANIEL, PACHECO CASTILLO', 27, 12, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (239, 1010, '21438689', 'KLEISBERTH OSMAR, QUEVEDO MEJIA', 15, 124, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (240, 1021, '21658185', 'ARTURO GREGORIO, CARRIZALES JIMENEZ', 19, 124, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (241, 1031, '22276172', 'LUSELA MILAGROS, GUACARAN FEO', 19, 136, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (242, 1036, '22355238', 'ANA KARINA, MENDEZ MARRONI', 19, 124, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (243, 1040, '22494224', 'ISMARA , MARTINEZ AMARIS', 11, 70, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (244, 6435, '22526906', 'YURIENMIS MACIEL, RODRIGUEZ GOMEZ', 11, 12, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (245, 6203, '22692885', 'ENITH ARIANA, PADILLA URBINA', 44, 77, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (246, 1058, '22768648', 'ORLELYS ELIE, CABALLERO RAMIREZ', 19, 124, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (247, 6865, '22900633', 'DANIELA ESTEFANIA, BLANCO MELENDEZ', 17, 210, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (248, 7061, '22998320', 'KIMBERLYN ESTEFANY, HERMOSO VARELA', 42, 59, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (249, 6705, '23073415', 'YETSERE CAROLINA, SOTILLO PACHECO', 17, 100, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (250, 6006, '23101216', 'BARBARA CECILIA, VASQUEZ MEDINA', 17, 57, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (251, 6377, '23529583', 'ABRAHAM , BECERRA MARTINEZ', 17, 210, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (252, 6956, '23639327', 'RAFAEL JESUS, DELGADO SIERRA', 15, 124, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (253, 5985, '24139608', 'ERLIANY DEL CARMEN, DURAN DURAN', 42, 65, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (254, 7012, '24205143', 'LISSETTE CAROLINA, ARELLANO MONSALVE', 29, 75, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (255, 6782, '24315663', 'YALIMAR COROMOTO, SANTANA RAMOS', 11, 12, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (256, 5559, '24619127', 'LEYANNA DALIMAR, RUIZ ZERPA', 25, 58, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (257, 5372, '24998069', 'LARYOSE ENRIQUE, MAGDALENO PONCE', 21, 24, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (258, 1158, '25174923', 'YERMARAY , MARTINEZ MAYORA', 15, 136, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (259, 6378, '25218863', 'STEFANY DANIELA, GARCIA QUINTERO', 25, 76, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (260, 5675, '25222916', 'WALTHER JOSE, LAYA PORRAS', 14, 223, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (261, 6132, '25411746', 'LISKAR ARIANNA, BRUSCO RODRIGUEZ', 17, 107, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (262, 6063, '25455557', 'YELIMAR FRANYELIC, OCHOA MORENO', 123, 98, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (263, 6710, '25466093', 'SAMANTHA CAROLINA, OVIEDO FERNANDEZ', 72, 86, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (264, 6879, '25574173', 'DAINER JOSE, GUAICAIPURO ROMERO', 11, 12, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (265, 6878, '25575612', 'ANDRYS JOSE, MORAN SANCHEZ', 11, 12, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (266, 6761, '25575623', 'RICHARD JOSE, LEON MORAN', 11, 12, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (267, 6876, '25795162', 'ANGELICA CAROLINA, CACERES MONCADA', 571, 74, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (268, 4301, '25867744', 'ARIANNA JUSBELL, PEÑA QUINTERO', 17, 107, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (269, 5003, '25872405', 'FANY VALENTINA, DELGADO CASTELLANOS', 23, 57, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (270, 5690, '26217140', 'ANGEL DAVID, GONZALEZ PAEZ', 44, 740, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (271, 6444, '26221053', 'WENDY GABRIELA, BARRIOS MANZABA', 55, 210, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (272, 5485, '26334329', 'PEDRO ESTIBEN, LAYA PORRAS', 14, 22, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (273, 6084, '26728074', 'VICTOR MANUEL, CAMPOS ALAN', 14, 14, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (274, 6572, '26895348', 'GABRIEL ALEJANDRO, VILLAVICENCIO GRAJALES', 25, 12, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (275, 6302, '26994339', 'VALERIA NATALY, RODRIGUEZ PALMA', 14, 223, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (276, 6439, '27446264', 'LISBEILY JOSELYN, MAITA RODRIGUEZ', 11, 107, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (277, 6051, '27450893', 'VICTORIA AURIBEL ARAMIS, ACOSTA MARTINEZ', 25, 76, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (278, 4313, '27470745', 'LIGIA ALEXAMAR, AREVALO PALMA', 23, 114, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (279, 6124, '27797241', 'EMILI SOFIA, ROMERO ORTA', 17, 107, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (280, 5721, '28101018', 'ALBER JESUS, LAYA PORRAS', 14, 107, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (281, 6274, '28307378', 'WILEIDYS ASIRE, GARCIA JIMENEZ', 11, 56, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (282, 4311, '28331511', 'ALONDRA JOSELIA, PALACIO URZOLA', 17, 107, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (283, 7021, '28413890', 'MAYERLIN ALEJANDRA, HERNANDEZ PEREZ', 25, 140, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (284, 6438, '28494658', 'SEBASTIAM JOSE, DIAZ JAIMES', 11, 22, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (285, 5647, '28684022', 'GEORGINA EUGENIA, LIZARDI GARCIA', 11, 124, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (286, 6771, '29521566', 'NATHALY ALONDRA, MARCANO TAVIO', 14, 12, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (287, 6399, '29529266', 'YOFRE JOSE, JIMENEZ LANDAEZ', 11, 12, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (288, 6317, '29797942', 'LOHENDRY YULIMAR, RANGEL CAMEJO', 11, 63, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (289, 5981, '29991336', 'MANUEL ALEJANDRO, BLANCO MARQUEZ', 11, 14, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (290, 6333, '30722062', 'LONYEIKER RAUL, PEREZ MONTEVERDE', 11, 107, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (291, 6395, '30967684', 'ROBERTO RAFAEL, ARTEAGA MONASTERIO', 11, 12, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (292, 6330, '31084242', 'NANCY CAROLINA, OROZCO HERRERA', 11, 107, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (293, 6318, '31360731', 'JOHAN ENRIQUE, CASTRO PEREZ', 11, 57, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (294, 6396, '31408164', 'JEAN PAUL, VIVAS CALZADILLA', 11, 12, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (295, 6437, '31745612', 'CARLOS DANIEL, MAZA GODOY', 11, 107, 'A');
INSERT INTO public.workers_data (id, worker_id, civ, names, charge_id, dependence_id, status) VALUES (296, 1193, '82098315', 'MARIA ISABEL, MOYANO LAVALLE', 23, 156, 'A');


--
-- TOC entry 5375 (class 0 OID 0)
-- Dependencies: 243
-- Name: audit_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.audit_log_id_seq', 157, true);


--
-- TOC entry 5376 (class 0 OID 0)
-- Dependencies: 282
-- Name: charges_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.charges_id_seq', 118, false);


--
-- TOC entry 5377 (class 0 OID 0)
-- Dependencies: 234
-- Name: countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.countries_id_seq', 241, true);


--
-- TOC entry 5378 (class 0 OID 0)
-- Dependencies: 286
-- Name: dependence_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.dependence_id_seq', 147, false);


--
-- TOC entry 5379 (class 0 OID 0)
-- Dependencies: 226
-- Name: genders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.genders_id_seq', 4, true);


--
-- TOC entry 5380 (class 0 OID 0)
-- Dependencies: 220
-- Name: groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.groups_id_seq', 5, true);


--
-- TOC entry 5381 (class 0 OID 0)
-- Dependencies: 230
-- Name: login_attempts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.login_attempts_id_seq', 4, true);


--
-- TOC entry 5382 (class 0 OID 0)
-- Dependencies: 239
-- Name: logs_activity_partitioned_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.logs_activity_partitioned_id_seq', 19, true);


--
-- TOC entry 5383 (class 0 OID 0)
-- Dependencies: 257
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.migrations_id_seq', 1, true);


--
-- TOC entry 5384 (class 0 OID 0)
-- Dependencies: 228
-- Name: nationality_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.nationality_id_seq', 3, true);


--
-- TOC entry 5385 (class 0 OID 0)
-- Dependencies: 259
-- Name: notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.notifications_id_seq', 18, true);


--
-- TOC entry 5386 (class 0 OID 0)
-- Dependencies: 288
-- Name: region_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.region_id_seq', 3, false);


--
-- TOC entry 5387 (class 0 OID 0)
-- Dependencies: 255
-- Name: session_logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.session_logs_id_seq', 86, true);


--
-- TOC entry 5388 (class 0 OID 0)
-- Dependencies: 224
-- Name: siteconfig_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.siteconfig_id_seq', 2, true);


--
-- TOC entry 5389 (class 0 OID 0)
-- Dependencies: 232
-- Name: states_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.states_id_seq', 25, true);


--
-- TOC entry 5390 (class 0 OID 0)
-- Dependencies: 261
-- Name: technician_assignments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.technician_assignments_id_seq', 21, true);


--
-- TOC entry 5391 (class 0 OID 0)
-- Dependencies: 251
-- Name: ticket_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.ticket_attachments_id_seq', 16, true);


--
-- TOC entry 5392 (class 0 OID 0)
-- Dependencies: 253
-- Name: ticket_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.ticket_categories_id_seq', 6, true);


--
-- TOC entry 5393 (class 0 OID 0)
-- Dependencies: 247
-- Name: ticket_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.ticket_comments_id_seq', 36, true);


--
-- TOC entry 5394 (class 0 OID 0)
-- Dependencies: 249
-- Name: ticket_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.ticket_history_id_seq', 34, true);


--
-- TOC entry 5395 (class 0 OID 0)
-- Dependencies: 245
-- Name: tickets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tickets_id_seq', 31, true);


--
-- TOC entry 5396 (class 0 OID 0)
-- Dependencies: 263
-- Name: user_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.user_categories_id_seq', 9, true);


--
-- TOC entry 5397 (class 0 OID 0)
-- Dependencies: 222
-- Name: users_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_groups_id_seq', 13, true);


--
-- TOC entry 5398 (class 0 OID 0)
-- Dependencies: 218
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 6, true);


--
-- TOC entry 5399 (class 0 OID 0)
-- Dependencies: 290
-- Name: worker_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.worker_id_seq', 1186, false);


--
-- TOC entry 5400 (class 0 OID 0)
-- Dependencies: 284
-- Name: workers_data_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.workers_data_id_seq', 297, false);


--
-- TOC entry 5020 (class 2606 OID 41371)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 237 (class 1259 OID 948151)
-- Name: mv_user_roles; Type: MATERIALIZED VIEW; Schema: public; Owner: -
--

CREATE MATERIALIZED VIEW public.mv_user_roles AS
 SELECT u.id,
    u.username,
    u.email,
    u.first_name,
    u.first_last_name,
    array_agg(g.name) AS roles,
    max(ug.id) AS latest_role_assignment
   FROM ((public.users u
     JOIN public.users_groups ug ON ((u.id = ug.user_id)))
     JOIN public.groups g ON ((ug.group_id = g.id)))
  GROUP BY u.id
  WITH NO DATA;


--
-- TOC entry 5058 (class 2606 OID 948234)
-- Name: audit_log audit_log_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.audit_log
    ADD CONSTRAINT audit_log_pkey PRIMARY KEY (id);


--
-- TOC entry 5098 (class 2606 OID 949757)
-- Name: charges charges_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.charges
    ADD CONSTRAINT charges_pkey PRIMARY KEY (id);


--
-- TOC entry 5050 (class 2606 OID 41489)
-- Name: countries countries_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);


--
-- TOC entry 5102 (class 2606 OID 949774)
-- Name: dependence dependence_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dependence
    ADD CONSTRAINT dependence_pkey PRIMARY KEY (id);


--
-- TOC entry 5039 (class 2606 OID 41443)
-- Name: genders genders_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.genders
    ADD CONSTRAINT genders_pkey PRIMARY KEY (id);


--
-- TOC entry 5023 (class 2606 OID 41391)
-- Name: groups groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);


--
-- TOC entry 5045 (class 2606 OID 41473)
-- Name: login_attempts login_attempts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.login_attempts
    ADD CONSTRAINT login_attempts_pkey PRIMARY KEY (id);


--
-- TOC entry 5043 (class 2606 OID 41463)
-- Name: nationality nationality_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nationality
    ADD CONSTRAINT nationality_pkey PRIMARY KEY (id);


--
-- TOC entry 5080 (class 2606 OID 948431)
-- Name: migrations pk_migrations; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT pk_migrations PRIMARY KEY (id);


--
-- TOC entry 5084 (class 2606 OID 948441)
-- Name: notifications pk_notifications; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT pk_notifications PRIMARY KEY (id);


--
-- TOC entry 5104 (class 2606 OID 949781)
-- Name: region region_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.region
    ADD CONSTRAINT region_pkey PRIMARY KEY (id);


--
-- TOC entry 5078 (class 2606 OID 948383)
-- Name: session_logs session_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.session_logs
    ADD CONSTRAINT session_logs_pkey PRIMARY KEY (id);


--
-- TOC entry 5052 (class 2606 OID 41521)
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id, ip_address);


--
-- TOC entry 5036 (class 2606 OID 41429)
-- Name: siteconfig siteconfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.siteconfig
    ADD CONSTRAINT siteconfig_pkey PRIMARY KEY (id);


--
-- TOC entry 5047 (class 2606 OID 41481)
-- Name: states states_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.states
    ADD CONSTRAINT states_pkey PRIMARY KEY (id);


--
-- TOC entry 5087 (class 2606 OID 948521)
-- Name: technician_assignments technician_assignments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.technician_assignments
    ADD CONSTRAINT technician_assignments_pkey PRIMARY KEY (id);


--
-- TOC entry 5089 (class 2606 OID 948523)
-- Name: technician_assignments technician_assignments_ticket_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.technician_assignments
    ADD CONSTRAINT technician_assignments_ticket_id_key UNIQUE (ticket_id);


--
-- TOC entry 5073 (class 2606 OID 948331)
-- Name: ticket_attachments ticket_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ticket_attachments
    ADD CONSTRAINT ticket_attachments_pkey PRIMARY KEY (id);


--
-- TOC entry 5076 (class 2606 OID 948358)
-- Name: ticket_categories ticket_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ticket_categories
    ADD CONSTRAINT ticket_categories_pkey PRIMARY KEY (id);


--
-- TOC entry 5067 (class 2606 OID 948291)
-- Name: ticket_comments ticket_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ticket_comments
    ADD CONSTRAINT ticket_comments_pkey PRIMARY KEY (id);


--
-- TOC entry 5070 (class 2606 OID 948311)
-- Name: ticket_history ticket_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ticket_history
    ADD CONSTRAINT ticket_history_pkey PRIMARY KEY (id);


--
-- TOC entry 5063 (class 2606 OID 948252)
-- Name: tickets tickets_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_pkey PRIMARY KEY (id);


--
-- TOC entry 5005 (class 2606 OID 41375)
-- Name: users uc_activation_selector; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT uc_activation_selector UNIQUE (activation_selector);


--
-- TOC entry 5007 (class 2606 OID 41373)
-- Name: users uc_email; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT uc_email UNIQUE (email);


--
-- TOC entry 5009 (class 2606 OID 41377)
-- Name: users uc_forgotten_password_selector; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT uc_forgotten_password_selector UNIQUE (forgotten_password_selector);


--
-- TOC entry 5011 (class 2606 OID 41379)
-- Name: users uc_remember_selector; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT uc_remember_selector UNIQUE (remember_selector);


--
-- TOC entry 5092 (class 2606 OID 948544)
-- Name: user_categories uc_user_category; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_categories
    ADD CONSTRAINT uc_user_category UNIQUE (user_id, category_id);


--
-- TOC entry 5025 (class 2606 OID 41404)
-- Name: users_groups uc_users_groups; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users_groups
    ADD CONSTRAINT uc_users_groups UNIQUE (user_id, group_id);


--
-- TOC entry 5094 (class 2606 OID 948542)
-- Name: user_categories user_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_categories
    ADD CONSTRAINT user_categories_pkey PRIMARY KEY (id);


--
-- TOC entry 5030 (class 2606 OID 41402)
-- Name: users_groups users_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users_groups
    ADD CONSTRAINT users_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 5106 (class 2606 OID 949790)
-- Name: worker worker_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.worker
    ADD CONSTRAINT worker_pkey PRIMARY KEY (id);


--
-- TOC entry 5100 (class 2606 OID 949767)
-- Name: workers_data workers_data_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.workers_data
    ADD CONSTRAINT workers_data_pkey PRIMARY KEY (id);


--
-- TOC entry 5048 (class 1259 OID 41490)
-- Name: countries_idx_iso; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX countries_idx_iso ON public.countries USING btree (iso);


--
-- TOC entry 5037 (class 1259 OID 41444)
-- Name: genders_idx_gender_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX genders_idx_gender_name ON public.genders USING btree (gender_name);


--
-- TOC entry 5021 (class 1259 OID 41392)
-- Name: groups_idx_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX groups_idx_name ON public.groups USING btree (name);


--
-- TOC entry 5081 (class 1259 OID 948600)
-- Name: idx_notifications_related; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_notifications_related ON public.notifications USING btree (related_id, type);


--
-- TOC entry 5082 (class 1259 OID 948599)
-- Name: idx_notifications_user_read; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_notifications_user_read ON public.notifications USING btree (user_id, is_read);


--
-- TOC entry 5085 (class 1259 OID 948555)
-- Name: idx_technician_assignments_active; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_technician_assignments_active ON public.technician_assignments USING btree (technician_id) WHERE (completed_at IS NULL);


--
-- TOC entry 5059 (class 1259 OID 948562)
-- Name: idx_tickets_user_closed; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tickets_user_closed ON public.tickets USING btree (user_id, closed_at) WHERE ((status)::text = 'cerrado'::text);


--
-- TOC entry 5060 (class 1259 OID 948561)
-- Name: idx_tickets_user_created; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_tickets_user_created ON public.tickets USING btree (user_id, created_at);


--
-- TOC entry 5090 (class 1259 OID 948556)
-- Name: idx_user_categories_composite; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_user_categories_composite ON public.user_categories USING btree (category_id, is_primary, user_id);


--
-- TOC entry 5054 (class 1259 OID 948211)
-- Name: logs_activity_partitioned_create_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX logs_activity_partitioned_create_at_idx ON ONLY public.logs_activity USING btree (create_at);


--
-- TOC entry 5055 (class 1259 OID 948212)
-- Name: logs_activity_y2025q1_create_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX logs_activity_y2025q1_create_at_idx ON public.logs_activity_y2025q1 USING btree (create_at);


--
-- TOC entry 5056 (class 1259 OID 948213)
-- Name: logs_activity_y2025q2_create_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX logs_activity_y2025q2_create_at_idx ON public.logs_activity_y2025q2 USING btree (create_at);


--
-- TOC entry 5095 (class 1259 OID 948630)
-- Name: logs_activity_y2025q3_create_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX logs_activity_y2025q3_create_at_idx ON public.logs_activity_y2025q3 USING btree (create_at);


--
-- TOC entry 5096 (class 1259 OID 948638)
-- Name: logs_activity_y2025q4_create_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX logs_activity_y2025q4_create_at_idx ON public.logs_activity_y2025q4 USING btree (create_at);


--
-- TOC entry 5040 (class 1259 OID 41464)
-- Name: nationality_idx_code; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nationality_idx_code ON public.nationality USING btree (code);


--
-- TOC entry 5041 (class 1259 OID 41465)
-- Name: nationality_idx_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nationality_idx_name ON public.nationality USING btree (name);


--
-- TOC entry 5053 (class 1259 OID 41498)
-- Name: sessions_timestamp; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sessions_timestamp ON public.sessions USING btree ("timestamp");


--
-- TOC entry 5031 (class 1259 OID 41432)
-- Name: siteconfig_idx_country; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX siteconfig_idx_country ON public.siteconfig USING btree (country);


--
-- TOC entry 5032 (class 1259 OID 41430)
-- Name: siteconfig_idx_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX siteconfig_idx_name ON public.siteconfig USING btree (name);


--
-- TOC entry 5033 (class 1259 OID 41433)
-- Name: siteconfig_idx_rif; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX siteconfig_idx_rif ON public.siteconfig USING btree (rif);


--
-- TOC entry 5034 (class 1259 OID 41431)
-- Name: siteconfig_idx_state; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX siteconfig_idx_state ON public.siteconfig USING btree (state);


--
-- TOC entry 5074 (class 1259 OID 948364)
-- Name: ticket_categories_name_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ticket_categories_name_idx ON public.ticket_categories USING btree (lower((name)::text));


--
-- TOC entry 5068 (class 1259 OID 948345)
-- Name: ticket_comments_ticket_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ticket_comments_ticket_id_idx ON public.ticket_comments USING btree (ticket_id);


--
-- TOC entry 5071 (class 1259 OID 948346)
-- Name: ticket_history_ticket_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ticket_history_ticket_id_idx ON public.ticket_history USING btree (ticket_id);


--
-- TOC entry 5061 (class 1259 OID 948344)
-- Name: tickets_assigned_to_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tickets_assigned_to_idx ON public.tickets USING btree (assigned_to);


--
-- TOC entry 5064 (class 1259 OID 948342)
-- Name: tickets_status_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tickets_status_idx ON public.tickets USING btree (status);


--
-- TOC entry 5065 (class 1259 OID 948343)
-- Name: tickets_user_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX tickets_user_id_idx ON public.tickets USING btree (user_id);


--
-- TOC entry 5012 (class 1259 OID 41382)
-- Name: users_email; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX users_email ON public.users USING btree (email);


--
-- TOC entry 5013 (class 1259 OID 41383)
-- Name: users_email_lower; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX users_email_lower ON public.users USING btree (lower((email)::text));


--
-- TOC entry 5026 (class 1259 OID 948150)
-- Name: users_groups_idx_composite; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX users_groups_idx_composite ON public.users_groups USING btree (user_id, group_id);


--
-- TOC entry 5027 (class 1259 OID 41406)
-- Name: users_groups_idx_group_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX users_groups_idx_group_id ON public.users_groups USING btree (group_id);


--
-- TOC entry 5028 (class 1259 OID 41405)
-- Name: users_groups_idx_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX users_groups_idx_user_id ON public.users_groups USING btree (user_id);


--
-- TOC entry 5014 (class 1259 OID 41381)
-- Name: users_idx_active; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX users_idx_active ON public.users USING btree (active);


--
-- TOC entry 5015 (class 1259 OID 948146)
-- Name: users_idx_company; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX users_idx_company ON public.users USING btree (company);


--
-- TOC entry 5016 (class 1259 OID 41380)
-- Name: users_idx_first_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX users_idx_first_name ON public.users USING btree (first_name);


--
-- TOC entry 5017 (class 1259 OID 948145)
-- Name: users_idx_full_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX users_idx_full_name ON public.users USING btree (lower((first_name)::text), lower((first_last_name)::text));


--
-- TOC entry 5018 (class 1259 OID 948147)
-- Name: users_idx_phone; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX users_idx_phone ON public.users USING btree (phone);


--
-- TOC entry 5107 (class 0 OID 0)
-- Name: logs_activity_y2025q1_create_at_idx; Type: INDEX ATTACH; Schema: public; Owner: -
--

ALTER INDEX public.logs_activity_partitioned_create_at_idx ATTACH PARTITION public.logs_activity_y2025q1_create_at_idx;


--
-- TOC entry 5108 (class 0 OID 0)
-- Name: logs_activity_y2025q2_create_at_idx; Type: INDEX ATTACH; Schema: public; Owner: -
--

ALTER INDEX public.logs_activity_partitioned_create_at_idx ATTACH PARTITION public.logs_activity_y2025q2_create_at_idx;


--
-- TOC entry 5109 (class 0 OID 0)
-- Name: logs_activity_y2025q3_create_at_idx; Type: INDEX ATTACH; Schema: public; Owner: -
--

ALTER INDEX public.logs_activity_partitioned_create_at_idx ATTACH PARTITION public.logs_activity_y2025q3_create_at_idx;


--
-- TOC entry 5110 (class 0 OID 0)
-- Name: logs_activity_y2025q4_create_at_idx; Type: INDEX ATTACH; Schema: public; Owner: -
--

ALTER INDEX public.logs_activity_partitioned_create_at_idx ATTACH PARTITION public.logs_activity_y2025q4_create_at_idx;


--
-- TOC entry 5137 (class 2620 OID 948239)
-- Name: groups groups_audit_trigger; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER groups_audit_trigger AFTER INSERT OR DELETE OR UPDATE ON public.groups FOR EACH ROW EXECUTE FUNCTION public.audit_trigger_function();


--
-- TOC entry 5139 (class 2620 OID 948238)
-- Name: siteconfig siteconfig_audit_trigger; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER siteconfig_audit_trigger AFTER INSERT OR DELETE OR UPDATE ON public.siteconfig FOR EACH ROW EXECUTE FUNCTION public.audit_trigger_function();


--
-- TOC entry 5140 (class 2620 OID 948649)
-- Name: logs_activity trg_create_log_partition; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER trg_create_log_partition BEFORE INSERT ON public.logs_activity FOR EACH ROW EXECUTE FUNCTION public.create_logs_partition_trigger();


--
-- TOC entry 5138 (class 2620 OID 948159)
-- Name: users_groups trigger_refresh_mv_user_roles; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER trigger_refresh_mv_user_roles AFTER INSERT OR DELETE OR UPDATE ON public.users_groups FOR EACH STATEMENT EXECUTE FUNCTION public.refresh_mv_user_roles();


--
-- TOC entry 5136 (class 2620 OID 948373)
-- Name: users users_audit_trigger; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER users_audit_trigger AFTER INSERT OR DELETE OR UPDATE ON public.users FOR EACH ROW EXECUTE FUNCTION public.audit_trigger_function();


--
-- TOC entry 5115 (class 2606 OID 948135)
-- Name: siteconfig fk_siteconfig_country; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.siteconfig
    ADD CONSTRAINT fk_siteconfig_country FOREIGN KEY (country) REFERENCES public.countries(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 5116 (class 2606 OID 41500)
-- Name: siteconfig fk_siteconfig_created_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.siteconfig
    ADD CONSTRAINT fk_siteconfig_created_user_id FOREIGN KEY (created_user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 5117 (class 2606 OID 948140)
-- Name: siteconfig fk_siteconfig_state; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.siteconfig
    ADD CONSTRAINT fk_siteconfig_state FOREIGN KEY (state) REFERENCES public.states(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 5118 (class 2606 OID 41505)
-- Name: siteconfig fk_siteconfig_updated_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.siteconfig
    ADD CONSTRAINT fk_siteconfig_updated_user_id FOREIGN KEY (updated_user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 5111 (class 2606 OID 948125)
-- Name: users fk_users_gender; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk_users_gender FOREIGN KEY (gender) REFERENCES public.genders(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 5113 (class 2606 OID 41515)
-- Name: users_groups fk_users_groups_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users_groups
    ADD CONSTRAINT fk_users_groups_group_id FOREIGN KEY (group_id) REFERENCES public.groups(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 5114 (class 2606 OID 41510)
-- Name: users_groups fk_users_groups_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users_groups
    ADD CONSTRAINT fk_users_groups_user_id FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 5112 (class 2606 OID 948130)
-- Name: users fk_users_nationality; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk_users_nationality FOREIGN KEY (nationality) REFERENCES public.nationality(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 5131 (class 2606 OID 948442)
-- Name: notifications notifications_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 5130 (class 2606 OID 948384)
-- Name: session_logs session_logs_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.session_logs
    ADD CONSTRAINT session_logs_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 5132 (class 2606 OID 948524)
-- Name: technician_assignments technician_assignments_technician_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.technician_assignments
    ADD CONSTRAINT technician_assignments_technician_id_fkey FOREIGN KEY (technician_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 5133 (class 2606 OID 948529)
-- Name: technician_assignments technician_assignments_ticket_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.technician_assignments
    ADD CONSTRAINT technician_assignments_ticket_id_fkey FOREIGN KEY (ticket_id) REFERENCES public.tickets(id) ON DELETE CASCADE;


--
-- TOC entry 5126 (class 2606 OID 948332)
-- Name: ticket_attachments ticket_attachments_ticket_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ticket_attachments
    ADD CONSTRAINT ticket_attachments_ticket_id_fkey FOREIGN KEY (ticket_id) REFERENCES public.tickets(id) ON DELETE CASCADE;


--
-- TOC entry 5127 (class 2606 OID 948337)
-- Name: ticket_attachments ticket_attachments_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ticket_attachments
    ADD CONSTRAINT ticket_attachments_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 5128 (class 2606 OID 948359)
-- Name: ticket_categories ticket_categories_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ticket_categories
    ADD CONSTRAINT ticket_categories_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- TOC entry 5129 (class 2606 OID 948366)
-- Name: ticket_categories ticket_categories_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ticket_categories
    ADD CONSTRAINT ticket_categories_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES public.ticket_categories(id);


--
-- TOC entry 5122 (class 2606 OID 948292)
-- Name: ticket_comments ticket_comments_ticket_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ticket_comments
    ADD CONSTRAINT ticket_comments_ticket_id_fkey FOREIGN KEY (ticket_id) REFERENCES public.tickets(id) ON DELETE CASCADE;


--
-- TOC entry 5123 (class 2606 OID 948297)
-- Name: ticket_comments ticket_comments_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ticket_comments
    ADD CONSTRAINT ticket_comments_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 5124 (class 2606 OID 948317)
-- Name: ticket_history ticket_history_changed_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ticket_history
    ADD CONSTRAINT ticket_history_changed_by_fkey FOREIGN KEY (changed_by) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 5125 (class 2606 OID 948312)
-- Name: ticket_history ticket_history_ticket_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ticket_history
    ADD CONSTRAINT ticket_history_ticket_id_fkey FOREIGN KEY (ticket_id) REFERENCES public.tickets(id) ON DELETE CASCADE;


--
-- TOC entry 5119 (class 2606 OID 948258)
-- Name: tickets tickets_assigned_to_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_assigned_to_fkey FOREIGN KEY (assigned_to) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- TOC entry 5120 (class 2606 OID 948263)
-- Name: tickets tickets_closed_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_closed_by_fkey FOREIGN KEY (closed_by) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- TOC entry 5121 (class 2606 OID 948253)
-- Name: tickets tickets_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 5134 (class 2606 OID 948550)
-- Name: user_categories user_categories_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_categories
    ADD CONSTRAINT user_categories_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.ticket_categories(id) ON DELETE CASCADE;


--
-- TOC entry 5135 (class 2606 OID 948545)
-- Name: user_categories user_categories_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_categories
    ADD CONSTRAINT user_categories_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 5306 (class 0 OID 948160)
-- Dependencies: 238 5345
-- Name: mv_site_config; Type: MATERIALIZED VIEW DATA; Schema: public; Owner: -
--

REFRESH MATERIALIZED VIEW public.mv_site_config;


--
-- TOC entry 5305 (class 0 OID 948151)
-- Dependencies: 237 5345
-- Name: mv_user_roles; Type: MATERIALIZED VIEW DATA; Schema: public; Owner: -
--

REFRESH MATERIALIZED VIEW public.mv_user_roles;


-- Completed on 2025-07-14 13:57:04

--
-- PostgreSQL database dump complete
--

