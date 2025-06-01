--
-- PostgreSQL database dump
--

-- Dumped from database version 16.8
-- Dumped by pg_dump version 16.8

-- Started on 2025-06-01 13:58:53

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
-- TOC entry 234 (class 1259 OID 41483)
-- Name: countries; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.countries (
    id integer NOT NULL,
    iso character varying(2) NOT NULL,
    nombre character varying(100) NOT NULL,
    create_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- TOC entry 233 (class 1259 OID 41482)
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
-- TOC entry 4980 (class 0 OID 0)
-- Dependencies: 233
-- Name: countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.countries_id_seq OWNED BY public.countries.id;


--
-- TOC entry 224 (class 1259 OID 41435)
-- Name: genders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.genders (
    id integer NOT NULL,
    gender_name text NOT NULL,
    create_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- TOC entry 223 (class 1259 OID 41434)
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
-- TOC entry 4981 (class 0 OID 0)
-- Dependencies: 223
-- Name: genders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.genders_id_seq OWNED BY public.genders.id;


--
-- TOC entry 218 (class 1259 OID 41385)
-- Name: groups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.groups (
    id integer NOT NULL,
    name character varying(20) NOT NULL,
    description character varying(100) NOT NULL,
    CONSTRAINT check_id CHECK ((id >= 0))
);


--
-- TOC entry 217 (class 1259 OID 41384)
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
-- TOC entry 4982 (class 0 OID 0)
-- Dependencies: 217
-- Name: groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.groups_id_seq OWNED BY public.groups.id;


--
-- TOC entry 230 (class 1259 OID 41467)
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
-- TOC entry 229 (class 1259 OID 41466)
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
-- TOC entry 4983 (class 0 OID 0)
-- Dependencies: 229
-- Name: login_attempts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.login_attempts_id_seq OWNED BY public.login_attempts.id;


--
-- TOC entry 226 (class 1259 OID 41446)
-- Name: logs_activity; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.logs_activity (
    id integer NOT NULL,
    ip_address character varying(45),
    title character varying(50) NOT NULL,
    description text NOT NULL,
    create_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 41445)
-- Name: logs_activity_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.logs_activity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4984 (class 0 OID 0)
-- Dependencies: 225
-- Name: logs_activity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.logs_activity_id_seq OWNED BY public.logs_activity.id;


--
-- TOC entry 228 (class 1259 OID 41456)
-- Name: nationality; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nationality (
    id integer NOT NULL,
    code character varying(1) DEFAULT 'V'::character varying NOT NULL,
    name character varying(50) NOT NULL,
    create_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- TOC entry 227 (class 1259 OID 41455)
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
-- TOC entry 4985 (class 0 OID 0)
-- Dependencies: 227
-- Name: nationality_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.nationality_id_seq OWNED BY public.nationality.id;


--
-- TOC entry 235 (class 1259 OID 41491)
-- Name: sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sessions (
    id character varying(128) NOT NULL,
    ip_address inet NOT NULL,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    data bytea DEFAULT '\x'::bytea NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 41408)
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
-- TOC entry 221 (class 1259 OID 41407)
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
-- TOC entry 4986 (class 0 OID 0)
-- Dependencies: 221
-- Name: siteconfig_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.siteconfig_id_seq OWNED BY public.siteconfig.id;


--
-- TOC entry 232 (class 1259 OID 41475)
-- Name: states; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.states (
    id integer NOT NULL,
    state character varying(50) NOT NULL,
    create_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- TOC entry 231 (class 1259 OID 41474)
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
-- TOC entry 4987 (class 0 OID 0)
-- Dependencies: 231
-- Name: states_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.states_id_seq OWNED BY public.states.id;


--
-- TOC entry 216 (class 1259 OID 41358)
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
-- TOC entry 220 (class 1259 OID 41394)
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
-- TOC entry 219 (class 1259 OID 41393)
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
-- TOC entry 4988 (class 0 OID 0)
-- Dependencies: 219
-- Name: users_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_groups_id_seq OWNED BY public.users_groups.id;


--
-- TOC entry 215 (class 1259 OID 41357)
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
-- TOC entry 4989 (class 0 OID 0)
-- Dependencies: 215
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 4769 (class 2604 OID 41486)
-- Name: countries id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.countries ALTER COLUMN id SET DEFAULT nextval('public.countries_id_seq'::regclass);


--
-- TOC entry 4759 (class 2604 OID 41438)
-- Name: genders id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.genders ALTER COLUMN id SET DEFAULT nextval('public.genders_id_seq'::regclass);


--
-- TOC entry 4742 (class 2604 OID 41388)
-- Name: groups id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.groups ALTER COLUMN id SET DEFAULT nextval('public.groups_id_seq'::regclass);


--
-- TOC entry 4766 (class 2604 OID 41470)
-- Name: login_attempts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.login_attempts ALTER COLUMN id SET DEFAULT nextval('public.login_attempts_id_seq'::regclass);


--
-- TOC entry 4761 (class 2604 OID 41449)
-- Name: logs_activity id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.logs_activity ALTER COLUMN id SET DEFAULT nextval('public.logs_activity_id_seq'::regclass);


--
-- TOC entry 4763 (class 2604 OID 41459)
-- Name: nationality id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nationality ALTER COLUMN id SET DEFAULT nextval('public.nationality_id_seq'::regclass);


--
-- TOC entry 4744 (class 2604 OID 41411)
-- Name: siteconfig id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.siteconfig ALTER COLUMN id SET DEFAULT nextval('public.siteconfig_id_seq'::regclass);


--
-- TOC entry 4767 (class 2604 OID 41478)
-- Name: states id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.states ALTER COLUMN id SET DEFAULT nextval('public.states_id_seq'::regclass);


--
-- TOC entry 4737 (class 2604 OID 41361)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 4743 (class 2604 OID 41397)
-- Name: users_groups id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users_groups ALTER COLUMN id SET DEFAULT nextval('public.users_groups_id_seq'::regclass);


--
-- TOC entry 4824 (class 2606 OID 41489)
-- Name: countries countries_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);


--
-- TOC entry 4811 (class 2606 OID 41443)
-- Name: genders genders_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.genders
    ADD CONSTRAINT genders_pkey PRIMARY KEY (id);


--
-- TOC entry 4796 (class 2606 OID 41391)
-- Name: groups groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);


--
-- TOC entry 4819 (class 2606 OID 41473)
-- Name: login_attempts login_attempts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.login_attempts
    ADD CONSTRAINT login_attempts_pkey PRIMARY KEY (id);


--
-- TOC entry 4813 (class 2606 OID 41454)
-- Name: logs_activity logs_activity_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.logs_activity
    ADD CONSTRAINT logs_activity_pkey PRIMARY KEY (id);


--
-- TOC entry 4817 (class 2606 OID 41463)
-- Name: nationality nationality_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nationality
    ADD CONSTRAINT nationality_pkey PRIMARY KEY (id);


--
-- TOC entry 4826 (class 2606 OID 41521)
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id, ip_address);


--
-- TOC entry 4808 (class 2606 OID 41429)
-- Name: siteconfig siteconfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.siteconfig
    ADD CONSTRAINT siteconfig_pkey PRIMARY KEY (id);


--
-- TOC entry 4821 (class 2606 OID 41481)
-- Name: states states_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.states
    ADD CONSTRAINT states_pkey PRIMARY KEY (id);


--
-- TOC entry 4781 (class 2606 OID 41375)
-- Name: users uc_activation_selector; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT uc_activation_selector UNIQUE (activation_selector);


--
-- TOC entry 4783 (class 2606 OID 41373)
-- Name: users uc_email; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT uc_email UNIQUE (email);


--
-- TOC entry 4785 (class 2606 OID 41377)
-- Name: users uc_forgotten_password_selector; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT uc_forgotten_password_selector UNIQUE (forgotten_password_selector);


--
-- TOC entry 4787 (class 2606 OID 41379)
-- Name: users uc_remember_selector; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT uc_remember_selector UNIQUE (remember_selector);


--
-- TOC entry 4798 (class 2606 OID 41404)
-- Name: users_groups uc_users_groups; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users_groups
    ADD CONSTRAINT uc_users_groups UNIQUE (user_id, group_id);


--
-- TOC entry 4802 (class 2606 OID 41402)
-- Name: users_groups users_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users_groups
    ADD CONSTRAINT users_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 4793 (class 2606 OID 41371)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4822 (class 1259 OID 41490)
-- Name: countries_idx_iso; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX countries_idx_iso ON public.countries USING btree (iso);


--
-- TOC entry 4809 (class 1259 OID 41444)
-- Name: genders_idx_gender_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX genders_idx_gender_name ON public.genders USING btree (gender_name);


--
-- TOC entry 4794 (class 1259 OID 41392)
-- Name: groups_idx_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX groups_idx_name ON public.groups USING btree (name);


--
-- TOC entry 4814 (class 1259 OID 41464)
-- Name: nationality_idx_code; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nationality_idx_code ON public.nationality USING btree (code);


--
-- TOC entry 4815 (class 1259 OID 41465)
-- Name: nationality_idx_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX nationality_idx_name ON public.nationality USING btree (name);


--
-- TOC entry 4827 (class 1259 OID 41498)
-- Name: sessions_timestamp; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sessions_timestamp ON public.sessions USING btree ("timestamp");


--
-- TOC entry 4803 (class 1259 OID 41432)
-- Name: siteconfig_idx_country; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX siteconfig_idx_country ON public.siteconfig USING btree (country);


--
-- TOC entry 4804 (class 1259 OID 41430)
-- Name: siteconfig_idx_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX siteconfig_idx_name ON public.siteconfig USING btree (name);


--
-- TOC entry 4805 (class 1259 OID 41433)
-- Name: siteconfig_idx_rif; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX siteconfig_idx_rif ON public.siteconfig USING btree (rif);


--
-- TOC entry 4806 (class 1259 OID 41431)
-- Name: siteconfig_idx_state; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX siteconfig_idx_state ON public.siteconfig USING btree (state);


--
-- TOC entry 4788 (class 1259 OID 41382)
-- Name: users_email; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX users_email ON public.users USING btree (email);


--
-- TOC entry 4789 (class 1259 OID 41383)
-- Name: users_email_lower; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX users_email_lower ON public.users USING btree (lower((email)::text));


--
-- TOC entry 4799 (class 1259 OID 41406)
-- Name: users_groups_idx_group_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX users_groups_idx_group_id ON public.users_groups USING btree (group_id);


--
-- TOC entry 4800 (class 1259 OID 41405)
-- Name: users_groups_idx_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX users_groups_idx_user_id ON public.users_groups USING btree (user_id);


--
-- TOC entry 4790 (class 1259 OID 41381)
-- Name: users_idx_active; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX users_idx_active ON public.users USING btree (active);


--
-- TOC entry 4791 (class 1259 OID 41380)
-- Name: users_idx_first_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX users_idx_first_name ON public.users USING btree (first_name);


--
-- TOC entry 4830 (class 2606 OID 41500)
-- Name: siteconfig fk_siteconfig_created_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.siteconfig
    ADD CONSTRAINT fk_siteconfig_created_user_id FOREIGN KEY (created_user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 4831 (class 2606 OID 41505)
-- Name: siteconfig fk_siteconfig_updated_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.siteconfig
    ADD CONSTRAINT fk_siteconfig_updated_user_id FOREIGN KEY (updated_user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 4828 (class 2606 OID 41515)
-- Name: users_groups fk_users_groups_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users_groups
    ADD CONSTRAINT fk_users_groups_group_id FOREIGN KEY (group_id) REFERENCES public.groups(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4829 (class 2606 OID 41510)
-- Name: users_groups fk_users_groups_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users_groups
    ADD CONSTRAINT fk_users_groups_user_id FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2025-06-01 13:58:53

--
-- PostgreSQL database dump complete
--

