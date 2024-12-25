--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2 (Debian 17.2-1.pgdg120+1)
-- Dumped by pg_dump version 17.2 (Ubuntu 17.2-1.pgdg22.04+1)

-- Started on 2024-12-25 04:30:13 MSK

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 222 (class 1259 OID 16428)
-- Name: nomenclature; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.nomenclature (
    id_type integer NOT NULL,
    name_materials text,
    id_supplier integer
);


ALTER TABLE public.nomenclature OWNER TO admin;

--
-- TOC entry 221 (class 1259 OID 16427)
-- Name: nomenclature_id_type_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.nomenclature_id_type_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.nomenclature_id_type_seq OWNER TO admin;

--
-- TOC entry 3406 (class 0 OID 0)
-- Dependencies: 221
-- Name: nomenclature_id_type_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.nomenclature_id_type_seq OWNED BY public.nomenclature.id_type;


--
-- TOC entry 218 (class 1259 OID 16410)
-- Name: storage; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.storage (
    id integer NOT NULL,
    id_type_materials integer,
    foto text,
    price_materials numeric(12,2) NOT NULL,
    count_materials integer,
    min_count_materials integer,
    count_in_pack integer,
    id_unit_materials integer,
    id_materials integer
);


ALTER TABLE public.storage OWNER TO admin;

--
-- TOC entry 217 (class 1259 OID 16409)
-- Name: storage_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.storage_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.storage_id_seq OWNER TO admin;

--
-- TOC entry 3407 (class 0 OID 0)
-- Dependencies: 217
-- Name: storage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.storage_id_seq OWNED BY public.storage.id;


--
-- TOC entry 224 (class 1259 OID 16437)
-- Name: supplier; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.supplier (
    id_supp integer NOT NULL,
    name_supplier text,
    id_type_supplier integer,
    inn character varying(10),
    quality_rating character varying(3),
    start_date date
);


ALTER TABLE public.supplier OWNER TO admin;

--
-- TOC entry 223 (class 1259 OID 16436)
-- Name: supplier_id_supp_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.supplier_id_supp_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.supplier_id_supp_seq OWNER TO admin;

--
-- TOC entry 3408 (class 0 OID 0)
-- Dependencies: 223
-- Name: supplier_id_supp_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.supplier_id_supp_seq OWNED BY public.supplier.id_supp;


--
-- TOC entry 220 (class 1259 OID 16419)
-- Name: type_materials; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.type_materials (
    id_type integer NOT NULL,
    type_materials_materials text
);


ALTER TABLE public.type_materials OWNER TO admin;

--
-- TOC entry 219 (class 1259 OID 16418)
-- Name: type_materials_id_type_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.type_materials_id_type_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.type_materials_id_type_seq OWNER TO admin;

--
-- TOC entry 3409 (class 0 OID 0)
-- Dependencies: 219
-- Name: type_materials_id_type_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.type_materials_id_type_seq OWNED BY public.type_materials.id_type;


--
-- TOC entry 226 (class 1259 OID 16494)
-- Name: type_supplier; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.type_supplier (
    "ID_type_supplier" integer NOT NULL,
    name_type_supplier text
);


ALTER TABLE public.type_supplier OWNER TO admin;

--
-- TOC entry 225 (class 1259 OID 16468)
-- Name: unit_material; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.unit_material (
    "PK_ID" integer NOT NULL,
    name_unit text
);


ALTER TABLE public.unit_material OWNER TO admin;

--
-- TOC entry 3235 (class 2604 OID 16431)
-- Name: nomenclature id_type; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.nomenclature ALTER COLUMN id_type SET DEFAULT nextval('public.nomenclature_id_type_seq'::regclass);


--
-- TOC entry 3233 (class 2604 OID 16413)
-- Name: storage id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.storage ALTER COLUMN id SET DEFAULT nextval('public.storage_id_seq'::regclass);


--
-- TOC entry 3236 (class 2604 OID 16440)
-- Name: supplier id_supp; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.supplier ALTER COLUMN id_supp SET DEFAULT nextval('public.supplier_id_supp_seq'::regclass);


--
-- TOC entry 3234 (class 2604 OID 16422)
-- Name: type_materials id_type; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.type_materials ALTER COLUMN id_type SET DEFAULT nextval('public.type_materials_id_type_seq'::regclass);


--
-- TOC entry 3242 (class 2606 OID 16435)
-- Name: nomenclature nomenclature_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.nomenclature
    ADD CONSTRAINT nomenclature_pkey PRIMARY KEY (id_type);


--
-- TOC entry 3238 (class 2606 OID 16417)
-- Name: storage storage_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.storage
    ADD CONSTRAINT storage_pkey PRIMARY KEY (id);


--
-- TOC entry 3244 (class 2606 OID 16446)
-- Name: supplier supplier_inn_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.supplier
    ADD CONSTRAINT supplier_inn_key UNIQUE (inn);


--
-- TOC entry 3246 (class 2606 OID 16444)
-- Name: supplier supplier_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.supplier
    ADD CONSTRAINT supplier_pkey PRIMARY KEY (id_supp);


--
-- TOC entry 3240 (class 2606 OID 16426)
-- Name: type_materials type_materials_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.type_materials
    ADD CONSTRAINT type_materials_pkey PRIMARY KEY (id_type);


--
-- TOC entry 3250 (class 2606 OID 16500)
-- Name: type_supplier type_supplier_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.type_supplier
    ADD CONSTRAINT type_supplier_pkey PRIMARY KEY ("ID_type_supplier");


--
-- TOC entry 3248 (class 2606 OID 16474)
-- Name: unit_material unit_material_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.unit_material
    ADD CONSTRAINT unit_material_pkey PRIMARY KEY ("PK_ID");


--
-- TOC entry 3251 (class 2606 OID 16463)
-- Name: storage FK_id_materials; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.storage
    ADD CONSTRAINT "FK_id_materials" FOREIGN KEY (id_materials) REFERENCES public.nomenclature(id_type) NOT VALID;


--
-- TOC entry 3254 (class 2606 OID 16453)
-- Name: nomenclature FK_supplier; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.nomenclature
    ADD CONSTRAINT "FK_supplier" FOREIGN KEY (id_supplier) REFERENCES public.supplier(id_supp) NOT VALID;


--
-- TOC entry 3252 (class 2606 OID 16458)
-- Name: storage FK_type_materials; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.storage
    ADD CONSTRAINT "FK_type_materials" FOREIGN KEY (id_type_materials) REFERENCES public.type_materials(id_type) NOT VALID;


--
-- TOC entry 3255 (class 2606 OID 16501)
-- Name: supplier FK_type_supplier; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.supplier
    ADD CONSTRAINT "FK_type_supplier" FOREIGN KEY (id_type_supplier) REFERENCES public.type_supplier("ID_type_supplier") NOT VALID;


--
-- TOC entry 3253 (class 2606 OID 16481)
-- Name: storage FK_unit_materials; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.storage
    ADD CONSTRAINT "FK_unit_materials" FOREIGN KEY (id_unit_materials) REFERENCES public.unit_material("PK_ID") NOT VALID;


-- Completed on 2024-12-25 04:30:13 MSK

--
-- PostgreSQL database dump complete
--

