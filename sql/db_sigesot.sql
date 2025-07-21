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

INSERT INTO public.users (id, ip_address, username, password, email, activation_selector, activation_code, forgotten_password_selector, forgotten_password_code, forgotten_password_time, remember_selector, remember_code, created_on, last_login, active, first_name, middle_name, first_last_name, second_last_name, gender, nationality, photo, company, phone) VALUES (1, '127.0.0.1', 'admin', '$argon2i$v=19$m=16384,t=4,p=2$YWRvZFRpUzJEMEdMNFZMSg$D8SpV6v8DKg/VN3jpJMa/mfdSwLaXYATvwDuMPlymhs', 'admin@youdomain.com', NULL, '', NULL, NULL, NULL, NULL, NULL, 1744672199, 1752246755, 1, 'John', 'Jerry', 'Doe', 'Smith', 1, 1, 'assets/profiles/default.jpg', 'Sigesot', '+584145555555');

--
-- TOC entry 5291 (class 0 OID 41394)
-- Dependencies: 223
-- Data for Name: users_groups; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users_groups (id, user_id, group_id) VALUES (1, 1, 1);
INSERT INTO public.users_groups (id, user_id, group_id) VALUES (2, 1, 2);
INSERT INTO public.users_groups (id, user_id, group_id) VALUES (3, 1, 3);
INSERT INTO public.users_groups (id, user_id, group_id) VALUES (4, 1, 4);

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

SELECT pg_catalog.setval('public.users_groups_id_seq', 5, true);


--
-- TOC entry 5398 (class 0 OID 0)
-- Dependencies: 218
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 2, true);


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

