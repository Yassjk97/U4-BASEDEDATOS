--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

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
-- Name: aula; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.aula (
    idaula integer NOT NULL,
    nombreaula character varying(100) NOT NULL,
    capacidad character varying(100),
    ubicacion character varying(100)
);


ALTER TABLE public.aula OWNER TO postgres;

--
-- Name: aula_idaula_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.aula_idaula_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.aula_idaula_seq OWNER TO postgres;

--
-- Name: aula_idaula_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.aula_idaula_seq OWNED BY public.aula.idaula;


--
-- Name: campus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.campus (
    idcampus integer NOT NULL,
    nombrecampus character varying(100) NOT NULL,
    direcciocampus character varying(100) NOT NULL
);


ALTER TABLE public.campus OWNER TO postgres;

--
-- Name: campus_idcampus_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.campus_idcampus_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.campus_idcampus_seq OWNER TO postgres;

--
-- Name: campus_idcampus_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.campus_idcampus_seq OWNED BY public.campus.idcampus;


--
-- Name: carreras; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.carreras (
    idcarrera integer NOT NULL,
    nombrecarrera character varying(100),
    titulootorgado character varying(100)
);


ALTER TABLE public.carreras OWNER TO postgres;

--
-- Name: carreras_idcarrera_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.carreras_idcarrera_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.carreras_idcarrera_seq OWNER TO postgres;

--
-- Name: carreras_idcarrera_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.carreras_idcarrera_seq OWNED BY public.carreras.idcarrera;


--
-- Name: curso; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.curso (
    idcurso integer NOT NULL,
    nombrecurso character varying(100) NOT NULL,
    descripcion character varying(100) NOT NULL,
    creditos character varying(100) NOT NULL,
    semestre character varying(100) NOT NULL,
    iddepatamento integer NOT NULL,
    idcampus integer NOT NULL
);


ALTER TABLE public.curso OWNER TO postgres;

--
-- Name: curso_idcurso_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.curso_idcurso_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.curso_idcurso_seq OWNER TO postgres;

--
-- Name: curso_idcurso_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.curso_idcurso_seq OWNED BY public.curso.idcurso;


--
-- Name: cursosprofesor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cursosprofesor (
    idcursoprofesor integer NOT NULL,
    idcurso integer NOT NULL,
    idprofesor integer NOT NULL
);


ALTER TABLE public.cursosprofesor OWNER TO postgres;

--
-- Name: cursosprofesor_idcursoprofesor_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cursosprofesor_idcursoprofesor_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cursosprofesor_idcursoprofesor_seq OWNER TO postgres;

--
-- Name: cursosprofesor_idcursoprofesor_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cursosprofesor_idcursoprofesor_seq OWNED BY public.cursosprofesor.idcursoprofesor;


--
-- Name: departamentos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.departamentos (
    iddepartamento integer NOT NULL,
    nombredepartamento character varying(100) NOT NULL,
    edificio character varying(100) NOT NULL
);


ALTER TABLE public.departamentos OWNER TO postgres;

--
-- Name: departamentos_iddepartamento_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.departamentos_iddepartamento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.departamentos_iddepartamento_seq OWNER TO postgres;

--
-- Name: departamentos_iddepartamento_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.departamentos_iddepartamento_seq OWNED BY public.departamentos.iddepartamento;


--
-- Name: estudiante; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.estudiante (
    idestudiante integer NOT NULL,
    nombre character varying(100) NOT NULL,
    apellido character varying(100) NOT NULL,
    fechanacimiento character varying(100) NOT NULL,
    direccion character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    idcarrera integer NOT NULL
);


ALTER TABLE public.estudiante OWNER TO postgres;

--
-- Name: estudiante_idestudiante_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.estudiante_idestudiante_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.estudiante_idestudiante_seq OWNER TO postgres;

--
-- Name: estudiante_idestudiante_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.estudiante_idestudiante_seq OWNED BY public.estudiante.idestudiante;


--
-- Name: horario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.horario (
    idhorarios integer NOT NULL,
    idcurso integer NOT NULL,
    idaula integer NOT NULL,
    fechafin date,
    fechainicio date,
    horainicio time without time zone,
    horafin time without time zone
);


ALTER TABLE public.horario OWNER TO postgres;

--
-- Name: horario_idhorarios_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.horario_idhorarios_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.horario_idhorarios_seq OWNER TO postgres;

--
-- Name: horario_idhorarios_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.horario_idhorarios_seq OWNED BY public.horario.idhorarios;


--
-- Name: inscripcion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inscripcion (
    idinscripciones integer NOT NULL,
    idestudiante integer NOT NULL,
    idcurso integer NOT NULL,
    fechainscripcion date DEFAULT CURRENT_DATE,
    calificacion numeric(10,2) NOT NULL
);


ALTER TABLE public.inscripcion OWNER TO postgres;

--
-- Name: inscripcion_idinscripciones_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.inscripcion_idinscripciones_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.inscripcion_idinscripciones_seq OWNER TO postgres;

--
-- Name: inscripcion_idinscripciones_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.inscripcion_idinscripciones_seq OWNED BY public.inscripcion.idinscripciones;


--
-- Name: profesor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.profesor (
    idprofesor integer NOT NULL,
    nombre character varying(100) NOT NULL,
    apellido character varying(100) NOT NULL,
    titulo character varying(100) NOT NULL,
    iddepartamento integer NOT NULL,
    email character varying(100) NOT NULL
);


ALTER TABLE public.profesor OWNER TO postgres;

--
-- Name: profesor_idprofesor_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.profesor_idprofesor_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.profesor_idprofesor_seq OWNER TO postgres;

--
-- Name: profesor_idprofesor_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.profesor_idprofesor_seq OWNED BY public.profesor.idprofesor;


--
-- Name: programascurso; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.programascurso (
    idprogramacurso integer NOT NULL,
    idprograma integer NOT NULL,
    idcurso integer NOT NULL
);


ALTER TABLE public.programascurso OWNER TO postgres;

--
-- Name: programascurso_idprogramacurso_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.programascurso_idprogramacurso_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.programascurso_idprogramacurso_seq OWNER TO postgres;

--
-- Name: programascurso_idprogramacurso_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.programascurso_idprogramacurso_seq OWNED BY public.programascurso.idprogramacurso;


--
-- Name: programasestudios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.programasestudios (
    idprograma integer NOT NULL,
    nombreprograma character varying(100),
    descripcionprograma character varying(100)
);


ALTER TABLE public.programasestudios OWNER TO postgres;

--
-- Name: programasestudios_idprograma_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.programasestudios_idprograma_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.programasestudios_idprograma_seq OWNER TO postgres;

--
-- Name: programasestudios_idprograma_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.programasestudios_idprograma_seq OWNED BY public.programasestudios.idprograma;


--
-- Name: aula idaula; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aula ALTER COLUMN idaula SET DEFAULT nextval('public.aula_idaula_seq'::regclass);


--
-- Name: campus idcampus; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campus ALTER COLUMN idcampus SET DEFAULT nextval('public.campus_idcampus_seq'::regclass);


--
-- Name: carreras idcarrera; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carreras ALTER COLUMN idcarrera SET DEFAULT nextval('public.carreras_idcarrera_seq'::regclass);


--
-- Name: curso idcurso; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.curso ALTER COLUMN idcurso SET DEFAULT nextval('public.curso_idcurso_seq'::regclass);


--
-- Name: cursosprofesor idcursoprofesor; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cursosprofesor ALTER COLUMN idcursoprofesor SET DEFAULT nextval('public.cursosprofesor_idcursoprofesor_seq'::regclass);


--
-- Name: departamentos iddepartamento; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departamentos ALTER COLUMN iddepartamento SET DEFAULT nextval('public.departamentos_iddepartamento_seq'::regclass);


--
-- Name: estudiante idestudiante; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudiante ALTER COLUMN idestudiante SET DEFAULT nextval('public.estudiante_idestudiante_seq'::regclass);


--
-- Name: horario idhorarios; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.horario ALTER COLUMN idhorarios SET DEFAULT nextval('public.horario_idhorarios_seq'::regclass);


--
-- Name: inscripcion idinscripciones; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripcion ALTER COLUMN idinscripciones SET DEFAULT nextval('public.inscripcion_idinscripciones_seq'::regclass);


--
-- Name: profesor idprofesor; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profesor ALTER COLUMN idprofesor SET DEFAULT nextval('public.profesor_idprofesor_seq'::regclass);


--
-- Name: programascurso idprogramacurso; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.programascurso ALTER COLUMN idprogramacurso SET DEFAULT nextval('public.programascurso_idprogramacurso_seq'::regclass);


--
-- Name: programasestudios idprograma; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.programasestudios ALTER COLUMN idprograma SET DEFAULT nextval('public.programasestudios_idprograma_seq'::regclass);


--
-- Data for Name: aula; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.aula (idaula, nombreaula, capacidad, ubicacion) FROM stdin;
1	Aula 101	40	Edificio A - Primer piso
2	Aula 102	35	Edificio A - Primer piso
3	Laboratorio de Computo	25	Edificio B - Segundo piso
5	Aula Magna	100	Edificio Principal - Auditorio
6	Sala de Conferencias	60	Edificio D - Tercer piso
\.


--
-- Data for Name: campus; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.campus (idcampus, nombrecampus, direcciocampus) FROM stdin;
1	Campus Central	Av. Universitaria 1000
2	Campus Norte	Calle Ciencia 123
\.


--
-- Data for Name: carreras; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.carreras (idcarrera, nombrecarrera, titulootorgado) FROM stdin;
2	Matemáticas Aplicadas	Licenciado en Matemáticas
1	Ingeniería de Sistemas	Ingeniero en Sistemas
\.


--
-- Data for Name: curso; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.curso (idcurso, nombrecurso, descripcion, creditos, semestre, iddepatamento, idcampus) FROM stdin;
1	Estructuras de Datos	Curso avanzado de estructuras	4	2025-1	1	1
2	Álgebra Lineal	Espacios vectoriales y matrices	3	2025-1	2	1
\.


--
-- Data for Name: cursosprofesor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cursosprofesor (idcursoprofesor, idcurso, idprofesor) FROM stdin;
1	1	1
2	2	2
\.


--
-- Data for Name: departamentos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.departamentos (iddepartamento, nombredepartamento, edificio) FROM stdin;
1	Ingeniería de Sistemas	Edificio A
2	Matemáticas	Edificio B
3	Humanidades	Edificio C
\.


--
-- Data for Name: estudiante; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.estudiante (idestudiante, nombre, apellido, fechanacimiento, direccion, email, idcarrera) FROM stdin;
2	María	López	1999-08-23	Av. Principal 456	maria.lopez@example.com	2
1	Juan	Pérez	2000-05-15	Calle Actualizada 456	juan.perez@example.com	1
\.


--
-- Data for Name: horario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.horario (idhorarios, idcurso, idaula, fechafin, fechainicio, horainicio, horafin) FROM stdin;
4	1	2	2025-06-30	2025-03-01	08:00:00	10:00:00
5	2	3	2025-06-30	2025-03-01	10:00:00	12:00:00
\.


--
-- Data for Name: inscripcion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inscripcion (idinscripciones, idestudiante, idcurso, fechainscripcion, calificacion) FROM stdin;
1	1	1	2025-05-23	85.00
2	2	2	2025-05-23	90.00
\.


--
-- Data for Name: profesor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.profesor (idprofesor, nombre, apellido, titulo, iddepartamento, email) FROM stdin;
2	Ana	Gómez	MSc. en Matemáticas	2	ana.gomez@uni.edu
1	Carlos	Ramírez	Dr. en Computación	1	carlos.ramirez.actualizado@uni.edu
\.


--
-- Data for Name: programascurso; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.programascurso (idprogramacurso, idprograma, idcurso) FROM stdin;
1	1	1
2	2	2
\.


--
-- Data for Name: programasestudios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.programasestudios (idprograma, nombreprograma, descripcionprograma) FROM stdin;
1	Ingeniería de Software	Formación en desarrollo y análisis de software
2	Matemáticas Puras	Estudios teóricos en matemática pura
\.


--
-- Name: aula_idaula_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.aula_idaula_seq', 6, true);


--
-- Name: campus_idcampus_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.campus_idcampus_seq', 2, true);


--
-- Name: carreras_idcarrera_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.carreras_idcarrera_seq', 2, true);


--
-- Name: curso_idcurso_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.curso_idcurso_seq', 2, true);


--
-- Name: cursosprofesor_idcursoprofesor_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cursosprofesor_idcursoprofesor_seq', 2, true);


--
-- Name: departamentos_iddepartamento_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.departamentos_iddepartamento_seq', 3, true);


--
-- Name: estudiante_idestudiante_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.estudiante_idestudiante_seq', 2, true);


--
-- Name: horario_idhorarios_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.horario_idhorarios_seq', 5, true);


--
-- Name: inscripcion_idinscripciones_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.inscripcion_idinscripciones_seq', 2, true);


--
-- Name: profesor_idprofesor_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.profesor_idprofesor_seq', 2, true);


--
-- Name: programascurso_idprogramacurso_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.programascurso_idprogramacurso_seq', 2, true);


--
-- Name: programasestudios_idprograma_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.programasestudios_idprograma_seq', 2, true);


--
-- Name: aula aula_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aula
    ADD CONSTRAINT aula_pkey PRIMARY KEY (idaula);


--
-- Name: campus campus_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campus
    ADD CONSTRAINT campus_pkey PRIMARY KEY (idcampus);


--
-- Name: carreras carreras_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carreras
    ADD CONSTRAINT carreras_pkey PRIMARY KEY (idcarrera);


--
-- Name: curso curso_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.curso
    ADD CONSTRAINT curso_pkey PRIMARY KEY (idcurso);


--
-- Name: cursosprofesor cursosprofesor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cursosprofesor
    ADD CONSTRAINT cursosprofesor_pkey PRIMARY KEY (idcursoprofesor);


--
-- Name: departamentos departamentos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departamentos
    ADD CONSTRAINT departamentos_pkey PRIMARY KEY (iddepartamento);


--
-- Name: estudiante estudiante_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudiante
    ADD CONSTRAINT estudiante_email_key UNIQUE (email);


--
-- Name: estudiante estudiante_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudiante
    ADD CONSTRAINT estudiante_pkey PRIMARY KEY (idestudiante);


--
-- Name: horario horario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.horario
    ADD CONSTRAINT horario_pkey PRIMARY KEY (idhorarios);


--
-- Name: inscripcion inscripcion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripcion
    ADD CONSTRAINT inscripcion_pkey PRIMARY KEY (idinscripciones);


--
-- Name: profesor profesor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profesor
    ADD CONSTRAINT profesor_pkey PRIMARY KEY (idprofesor);


--
-- Name: programascurso programascurso_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.programascurso
    ADD CONSTRAINT programascurso_pkey PRIMARY KEY (idprogramacurso);


--
-- Name: programasestudios programasestudios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.programasestudios
    ADD CONSTRAINT programasestudios_pkey PRIMARY KEY (idprograma);


--
-- Name: curso curso_idcampus_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.curso
    ADD CONSTRAINT curso_idcampus_fkey FOREIGN KEY (idcampus) REFERENCES public.campus(idcampus);


--
-- Name: curso curso_iddepatamento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.curso
    ADD CONSTRAINT curso_iddepatamento_fkey FOREIGN KEY (iddepatamento) REFERENCES public.departamentos(iddepartamento);


--
-- Name: cursosprofesor cursosprofesor_idcurso_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cursosprofesor
    ADD CONSTRAINT cursosprofesor_idcurso_fkey FOREIGN KEY (idcurso) REFERENCES public.curso(idcurso);


--
-- Name: cursosprofesor cursosprofesor_idprofesor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cursosprofesor
    ADD CONSTRAINT cursosprofesor_idprofesor_fkey FOREIGN KEY (idprofesor) REFERENCES public.profesor(idprofesor);


--
-- Name: estudiante estudiante_idcarrera_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudiante
    ADD CONSTRAINT estudiante_idcarrera_fkey FOREIGN KEY (idcarrera) REFERENCES public.carreras(idcarrera);


--
-- Name: horario horario_idaula_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.horario
    ADD CONSTRAINT horario_idaula_fkey FOREIGN KEY (idaula) REFERENCES public.aula(idaula);


--
-- Name: horario horario_idcurso_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.horario
    ADD CONSTRAINT horario_idcurso_fkey FOREIGN KEY (idcurso) REFERENCES public.curso(idcurso);


--
-- Name: inscripcion inscripcion_idcurso_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripcion
    ADD CONSTRAINT inscripcion_idcurso_fkey FOREIGN KEY (idcurso) REFERENCES public.curso(idcurso);


--
-- Name: inscripcion inscripcion_idestudiante_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripcion
    ADD CONSTRAINT inscripcion_idestudiante_fkey FOREIGN KEY (idestudiante) REFERENCES public.estudiante(idestudiante);


--
-- Name: profesor profesor_iddepartamento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profesor
    ADD CONSTRAINT profesor_iddepartamento_fkey FOREIGN KEY (iddepartamento) REFERENCES public.departamentos(iddepartamento);


--
-- Name: programascurso programascurso_idcurso_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.programascurso
    ADD CONSTRAINT programascurso_idcurso_fkey FOREIGN KEY (idcurso) REFERENCES public.curso(idcurso);


--
-- Name: programascurso programascurso_idprograma_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.programascurso
    ADD CONSTRAINT programascurso_idprograma_fkey FOREIGN KEY (idprograma) REFERENCES public.programasestudios(idprograma);


--
-- PostgreSQL database dump complete
--

