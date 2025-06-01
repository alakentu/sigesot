--
-- PostgreSQL database dump
--

-- Dumped from database version 16.8
-- Dumped by pg_dump version 16.8

-- Started on 2025-04-14 16:13:17

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
-- TOC entry 216 (class 1259 OID 41358)
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "public"."users" (
    "id" integer NOT NULL,
    "ip_address" character varying(45),
    "username" character varying(100),
    "password" character varying(255) NOT NULL,
    "email" character varying(254) NOT NULL,
    "activation_selector" character varying(255),
    "activation_code" character varying(255),
    "forgotten_password_selector" character varying(255),
    "forgotten_password_code" character varying(255),
    "forgotten_password_time" integer,
    "remember_selector" character varying(255),
    "remember_code" character varying(255),
    "created_on" integer NOT NULL,
    "last_login" integer,
    "active" smallint DEFAULT 1 NOT NULL,
    "first_name" character varying(50) NOT NULL,
    "middle_name" character varying(50),
    "first_last_name" character varying(50) NOT NULL,
    "second_last_name" character varying(50),
    "gender" smallint DEFAULT 1 NOT NULL,
    "nationality" smallint DEFAULT 1 NOT NULL,
    "photo" "text" DEFAULT 'assets/profiles/default.jpg'::"text" NOT NULL,
    "company" character varying(100),
    "phone" character varying(20),
    CONSTRAINT "check_active" CHECK (("active" >= 0)),
    CONSTRAINT "check_id" CHECK (("id" >= 0))
);


--
-- TOC entry 215 (class 1259 OID 41357)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "public"."users_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4895 (class 0 OID 0)
-- Dependencies: 215
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "public"."users_id_seq" OWNED BY "public"."users"."id";


--
-- TOC entry 4726 (class 2604 OID 41361)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."users" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."users_id_seq"'::"regclass");


--
-- TOC entry 4734 (class 2606 OID 41375)
-- Name: users uc_activation_selector; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."users"
    ADD CONSTRAINT "uc_activation_selector" UNIQUE ("activation_selector");


--
-- TOC entry 4736 (class 2606 OID 41373)
-- Name: users uc_email; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."users"
    ADD CONSTRAINT "uc_email" UNIQUE ("email");


--
-- TOC entry 4738 (class 2606 OID 41377)
-- Name: users uc_forgotten_password_selector; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."users"
    ADD CONSTRAINT "uc_forgotten_password_selector" UNIQUE ("forgotten_password_selector");


--
-- TOC entry 4740 (class 2606 OID 41379)
-- Name: users uc_remember_selector; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."users"
    ADD CONSTRAINT "uc_remember_selector" UNIQUE ("remember_selector");


--
-- TOC entry 4746 (class 2606 OID 41371)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "public"."users"
    ADD CONSTRAINT "users_pkey" PRIMARY KEY ("id");


--
-- TOC entry 4741 (class 1259 OID 41382)
-- Name: users_email; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "users_email" ON "public"."users" USING "btree" ("email");


--
-- TOC entry 4742 (class 1259 OID 41383)
-- Name: users_email_lower; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "users_email_lower" ON "public"."users" USING "btree" ("lower"(("email")::"text"));


--
-- TOC entry 4743 (class 1259 OID 41381)
-- Name: users_idx_active; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "users_idx_active" ON "public"."users" USING "btree" ("active");


--
-- TOC entry 4744 (class 1259 OID 41380)
-- Name: users_idx_first_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "users_idx_first_name" ON "public"."users" USING "btree" ("first_name");


-- Completed on 2025-04-14 16:13:17

--
-- PostgreSQL database dump complete
--

