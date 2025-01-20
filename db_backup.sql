--
-- PostgreSQL database dump
--

-- Dumped from database version 14.15 (Homebrew)
-- Dumped by pg_dump version 14.15 (Homebrew)

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
-- Name: commenti; Type: TABLE; Schema: public; Owner: luca
--

CREATE TABLE public.commenti (
    id integer NOT NULL,
    post_id integer NOT NULL,
    utente_id integer NOT NULL,
    contenuto text NOT NULL,
    data_creazione timestamp without time zone DEFAULT now(),
    data_modifica timestamp without time zone DEFAULT now()
);


ALTER TABLE public.commenti OWNER TO luca;

--
-- Name: commenti_id_seq; Type: SEQUENCE; Schema: public; Owner: luca
--

CREATE SEQUENCE public.commenti_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.commenti_id_seq OWNER TO luca;

--
-- Name: commenti_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: luca
--

ALTER SEQUENCE public.commenti_id_seq OWNED BY public.commenti.id;


--
-- Name: configurazione; Type: TABLE; Schema: public; Owner: luca
--

CREATE TABLE public.configurazione (
    id integer NOT NULL,
    valore text NOT NULL,
    descrizione text,
    gruppo integer
);


ALTER TABLE public.configurazione OWNER TO luca;

--
-- Name: configurazione_id_seq; Type: SEQUENCE; Schema: public; Owner: luca
--

CREATE SEQUENCE public.configurazione_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.configurazione_id_seq OWNER TO luca;

--
-- Name: configurazione_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: luca
--

ALTER SEQUENCE public.configurazione_id_seq OWNED BY public.configurazione.id;


--
-- Name: dms; Type: TABLE; Schema: public; Owner: luca
--

CREATE TABLE public.dms (
    id integer NOT NULL,
    mittente_id integer NOT NULL,
    destinatario_id integer NOT NULL,
    messaggio text NOT NULL,
    data_creazione timestamp without time zone DEFAULT now()
);


ALTER TABLE public.dms OWNER TO luca;

--
-- Name: dms_id_seq; Type: SEQUENCE; Schema: public; Owner: luca
--

CREATE SEQUENCE public.dms_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dms_id_seq OWNER TO luca;

--
-- Name: dms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: luca
--

ALTER SEQUENCE public.dms_id_seq OWNED BY public.dms.id;


--
-- Name: likes; Type: TABLE; Schema: public; Owner: luca
--

CREATE TABLE public.likes (
    id integer NOT NULL,
    utente_id integer NOT NULL,
    post_id integer NOT NULL,
    data_creazione timestamp without time zone DEFAULT now()
);


ALTER TABLE public.likes OWNER TO luca;

--
-- Name: likes_id_seq; Type: SEQUENCE; Schema: public; Owner: luca
--

CREATE SEQUENCE public.likes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.likes_id_seq OWNER TO luca;

--
-- Name: likes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: luca
--

ALTER SEQUENCE public.likes_id_seq OWNED BY public.likes.id;


--
-- Name: post; Type: TABLE; Schema: public; Owner: luca
--

CREATE TABLE public.post (
    id integer NOT NULL,
    utente_id integer NOT NULL,
    contenuto text NOT NULL,
    data_creazione timestamp without time zone DEFAULT now(),
    data_modifica timestamp without time zone DEFAULT now()
);


ALTER TABLE public.post OWNER TO luca;

--
-- Name: post_id_seq; Type: SEQUENCE; Schema: public; Owner: luca
--

CREATE SEQUENCE public.post_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.post_id_seq OWNER TO luca;

--
-- Name: post_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: luca
--

ALTER SEQUENCE public.post_id_seq OWNED BY public.post.id;


--
-- Name: utente_seq; Type: SEQUENCE; Schema: public; Owner: luca
--

CREATE SEQUENCE public.utente_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.utente_seq OWNER TO luca;

--
-- Name: utenti; Type: TABLE; Schema: public; Owner: luca
--

CREATE TABLE public.utenti (
    id bigint NOT NULL,
    username character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    data_creazione timestamp without time zone DEFAULT now(),
    data_modifica timestamp without time zone DEFAULT now()
);


ALTER TABLE public.utenti OWNER TO luca;

--
-- Name: utenti_id_seq; Type: SEQUENCE; Schema: public; Owner: luca
--

CREATE SEQUENCE public.utenti_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.utenti_id_seq OWNER TO luca;

--
-- Name: utenti_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: luca
--

ALTER SEQUENCE public.utenti_id_seq OWNED BY public.utenti.id;


--
-- Name: utenti_seq; Type: SEQUENCE; Schema: public; Owner: luca
--

CREATE SEQUENCE public.utenti_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.utenti_seq OWNER TO luca;

--
-- Name: commenti id; Type: DEFAULT; Schema: public; Owner: luca
--

ALTER TABLE ONLY public.commenti ALTER COLUMN id SET DEFAULT nextval('public.commenti_id_seq'::regclass);


--
-- Name: configurazione id; Type: DEFAULT; Schema: public; Owner: luca
--

ALTER TABLE ONLY public.configurazione ALTER COLUMN id SET DEFAULT nextval('public.configurazione_id_seq'::regclass);


--
-- Name: dms id; Type: DEFAULT; Schema: public; Owner: luca
--

ALTER TABLE ONLY public.dms ALTER COLUMN id SET DEFAULT nextval('public.dms_id_seq'::regclass);


--
-- Name: likes id; Type: DEFAULT; Schema: public; Owner: luca
--

ALTER TABLE ONLY public.likes ALTER COLUMN id SET DEFAULT nextval('public.likes_id_seq'::regclass);


--
-- Name: post id; Type: DEFAULT; Schema: public; Owner: luca
--

ALTER TABLE ONLY public.post ALTER COLUMN id SET DEFAULT nextval('public.post_id_seq'::regclass);


--
-- Name: utenti id; Type: DEFAULT; Schema: public; Owner: luca
--

ALTER TABLE ONLY public.utenti ALTER COLUMN id SET DEFAULT nextval('public.utenti_id_seq'::regclass);


--
-- Data for Name: commenti; Type: TABLE DATA; Schema: public; Owner: luca
--

COPY public.commenti (id, post_id, utente_id, contenuto, data_creazione, data_modifica) FROM stdin;
\.


--
-- Data for Name: configurazione; Type: TABLE DATA; Schema: public; Owner: luca
--

COPY public.configurazione (id, valore, descrizione, gruppo) FROM stdin;
3	fdxjhppimrteylgl	password	1
4	smtp.gmail.com	smtpHost	1
5	587	smtpPort	1
6	true	smtpAuth	1
7	true	smtpStarttlsEnable	1
8	true	smtpSslTrust	1
2	luca.prova.dev@gmail.com	sender	1
1	Configurazione invio email	\N	\N
\.


--
-- Data for Name: dms; Type: TABLE DATA; Schema: public; Owner: luca
--

COPY public.dms (id, mittente_id, destinatario_id, messaggio, data_creazione) FROM stdin;
\.


--
-- Data for Name: likes; Type: TABLE DATA; Schema: public; Owner: luca
--

COPY public.likes (id, utente_id, post_id, data_creazione) FROM stdin;
\.


--
-- Data for Name: post; Type: TABLE DATA; Schema: public; Owner: luca
--

COPY public.post (id, utente_id, contenuto, data_creazione, data_modifica) FROM stdin;
2	2	Ciao a tutti, sono user2!	2025-01-13 10:09:24.922377	2025-01-13 10:09:24.922377
3	3	Post casuale di user3.	2025-01-13 10:09:24.922377	2025-01-13 10:09:24.922377
\.


--
-- Data for Name: utenti; Type: TABLE DATA; Schema: public; Owner: luca
--

COPY public.utenti (id, username, email, password, data_creazione, data_modifica) FROM stdin;
2	user2	user2@example.com	password2	2025-01-13 10:09:24.922377	2025-01-13 10:09:24.922377
3	user3	user3@example.com	password3	2025-01-13 10:09:24.922377	2025-01-13 10:09:24.922377
51	string	string	string	2025-01-15 14:29:43.290088	2025-01-15 14:29:43.290104
\.


--
-- Name: commenti_id_seq; Type: SEQUENCE SET; Schema: public; Owner: luca
--

SELECT pg_catalog.setval('public.commenti_id_seq', 2, true);


--
-- Name: configurazione_id_seq; Type: SEQUENCE SET; Schema: public; Owner: luca
--

SELECT pg_catalog.setval('public.configurazione_id_seq', 1, false);


--
-- Name: dms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: luca
--

SELECT pg_catalog.setval('public.dms_id_seq', 2, true);


--
-- Name: likes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: luca
--

SELECT pg_catalog.setval('public.likes_id_seq', 3, true);


--
-- Name: post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: luca
--

SELECT pg_catalog.setval('public.post_id_seq', 3, true);


--
-- Name: utente_seq; Type: SEQUENCE SET; Schema: public; Owner: luca
--

SELECT pg_catalog.setval('public.utente_seq', 1, false);


--
-- Name: utenti_id_seq; Type: SEQUENCE SET; Schema: public; Owner: luca
--

SELECT pg_catalog.setval('public.utenti_id_seq', 3, true);


--
-- Name: utenti_seq; Type: SEQUENCE SET; Schema: public; Owner: luca
--

SELECT pg_catalog.setval('public.utenti_seq', 101, true);


--
-- Name: commenti commenti_pkey; Type: CONSTRAINT; Schema: public; Owner: luca
--

ALTER TABLE ONLY public.commenti
    ADD CONSTRAINT commenti_pkey PRIMARY KEY (id);


--
-- Name: configurazione configurazione_pkey; Type: CONSTRAINT; Schema: public; Owner: luca
--

ALTER TABLE ONLY public.configurazione
    ADD CONSTRAINT configurazione_pkey PRIMARY KEY (id);


--
-- Name: dms dms_pkey; Type: CONSTRAINT; Schema: public; Owner: luca
--

ALTER TABLE ONLY public.dms
    ADD CONSTRAINT dms_pkey PRIMARY KEY (id);


--
-- Name: likes likes_pkey; Type: CONSTRAINT; Schema: public; Owner: luca
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_pkey PRIMARY KEY (id);


--
-- Name: likes likes_utente_id_post_id_key; Type: CONSTRAINT; Schema: public; Owner: luca
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_utente_id_post_id_key UNIQUE (utente_id, post_id);


--
-- Name: post post_pkey; Type: CONSTRAINT; Schema: public; Owner: luca
--

ALTER TABLE ONLY public.post
    ADD CONSTRAINT post_pkey PRIMARY KEY (id);


--
-- Name: utenti utenti_email_key; Type: CONSTRAINT; Schema: public; Owner: luca
--

ALTER TABLE ONLY public.utenti
    ADD CONSTRAINT utenti_email_key UNIQUE (email);


--
-- Name: utenti utenti_pkey; Type: CONSTRAINT; Schema: public; Owner: luca
--

ALTER TABLE ONLY public.utenti
    ADD CONSTRAINT utenti_pkey PRIMARY KEY (id);


--
-- Name: utenti utenti_username_key; Type: CONSTRAINT; Schema: public; Owner: luca
--

ALTER TABLE ONLY public.utenti
    ADD CONSTRAINT utenti_username_key UNIQUE (username);


--
-- Name: commenti commenti_post_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: luca
--

ALTER TABLE ONLY public.commenti
    ADD CONSTRAINT commenti_post_id_fkey FOREIGN KEY (post_id) REFERENCES public.post(id) ON DELETE CASCADE;


--
-- Name: commenti commenti_utente_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: luca
--

ALTER TABLE ONLY public.commenti
    ADD CONSTRAINT commenti_utente_id_fkey FOREIGN KEY (utente_id) REFERENCES public.utenti(id) ON DELETE CASCADE;


--
-- Name: dms dms_destinatario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: luca
--

ALTER TABLE ONLY public.dms
    ADD CONSTRAINT dms_destinatario_id_fkey FOREIGN KEY (destinatario_id) REFERENCES public.utenti(id) ON DELETE CASCADE;


--
-- Name: dms dms_mittente_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: luca
--

ALTER TABLE ONLY public.dms
    ADD CONSTRAINT dms_mittente_id_fkey FOREIGN KEY (mittente_id) REFERENCES public.utenti(id) ON DELETE CASCADE;


--
-- Name: likes likes_post_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: luca
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_post_id_fkey FOREIGN KEY (post_id) REFERENCES public.post(id) ON DELETE CASCADE;


--
-- Name: likes likes_utente_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: luca
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_utente_id_fkey FOREIGN KEY (utente_id) REFERENCES public.utenti(id) ON DELETE CASCADE;


--
-- Name: post post_utente_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: luca
--

ALTER TABLE ONLY public.post
    ADD CONSTRAINT post_utente_id_fkey FOREIGN KEY (utente_id) REFERENCES public.utenti(id) ON DELETE CASCADE;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: luca
--

GRANT ALL ON SCHEMA public TO "user";


--
-- Name: TABLE commenti; Type: ACL; Schema: public; Owner: luca
--

GRANT ALL ON TABLE public.commenti TO "user";


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: luca
--

ALTER DEFAULT PRIVILEGES FOR ROLE luca IN SCHEMA public GRANT ALL ON SEQUENCES  TO "user";


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: luca
--

ALTER DEFAULT PRIVILEGES FOR ROLE luca IN SCHEMA public GRANT ALL ON FUNCTIONS  TO "user";


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: luca
--

ALTER DEFAULT PRIVILEGES FOR ROLE luca IN SCHEMA public GRANT ALL ON TABLES  TO "user";


--
-- PostgreSQL database dump complete
--

