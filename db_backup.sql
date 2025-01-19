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
-- Name: commenti; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.commenti (
    id integer NOT NULL,
    post_id integer NOT NULL,
    utente_id integer NOT NULL,
    contenuto text NOT NULL,
    data_creazione timestamp without time zone DEFAULT now(),
    data_modifica timestamp without time zone DEFAULT now()
);


ALTER TABLE public.commenti OWNER TO user;

--
-- Name: commenti_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.commenti_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.commenti_id_seq OWNER TO user;

--
-- Name: commenti_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.commenti_id_seq OWNED BY public.commenti.id;


--
-- Name: configurazione; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.configurazione (
    id integer NOT NULL,
    valore text NOT NULL,
    descrizione text,
    gruppo integer
);


ALTER TABLE public.configurazione OWNER TO user;

--
-- Name: configurazione_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.configurazione_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.configurazione_id_seq OWNER TO user;

--
-- Name: configurazione_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.configurazione_id_seq OWNED BY public.configurazione.id;


--
-- Name: dms; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.dms (
    id integer NOT NULL,
    mittente_id integer NOT NULL,
    destinatario_id integer NOT NULL,
    messaggio text NOT NULL,
    data_creazione timestamp without time zone DEFAULT now()
);


ALTER TABLE public.dms OWNER TO user;

--
-- Name: dms_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.dms_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dms_id_seq OWNER TO user;

--
-- Name: dms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.dms_id_seq OWNED BY public.dms.id;


--
-- Name: likes; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.likes (
    id integer NOT NULL,
    utente_id integer NOT NULL,
    post_id integer NOT NULL,
    data_creazione timestamp without time zone DEFAULT now()
);


ALTER TABLE public.likes OWNER TO user;

--
-- Name: likes_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.likes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.likes_id_seq OWNER TO user;

--
-- Name: likes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.likes_id_seq OWNED BY public.likes.id;


--
-- Name: post; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.post (
    id integer NOT NULL,
    utente_id integer NOT NULL,
    contenuto text NOT NULL,
    data_creazione timestamp without time zone DEFAULT now(),
    data_modifica timestamp without time zone DEFAULT now()
);


ALTER TABLE public.post OWNER TO user;

--
-- Name: post_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.post_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.post_id_seq OWNER TO user;

--
-- Name: post_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.post_id_seq OWNED BY public.post.id;


--
-- Name: utente_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.utente_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.utente_seq OWNER TO user;

--
-- Name: utenti; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.utenti (
    id bigint NOT NULL,
    username character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    data_creazione timestamp without time zone DEFAULT now(),
    data_modifica timestamp without time zone DEFAULT now()
);


ALTER TABLE public.utenti OWNER TO user;

--
-- Name: utenti_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.utenti_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.utenti_id_seq OWNER TO user;

--
-- Name: utenti_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.utenti_id_seq OWNED BY public.utenti.id;


--
-- Name: utenti_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.utenti_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.utenti_seq OWNER TO user;

--
-- Name: commenti id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.commenti ALTER COLUMN id SET DEFAULT nextval('public.commenti_id_seq'::regclass);


--
-- Name: configurazione id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.configurazione ALTER COLUMN id SET DEFAULT nextval('public.configurazione_id_seq'::regclass);


--
-- Name: dms id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.dms ALTER COLUMN id SET DEFAULT nextval('public.dms_id_seq'::regclass);


--
-- Name: likes id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.likes ALTER COLUMN id SET DEFAULT nextval('public.likes_id_seq'::regclass);


--
-- Name: post id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.post ALTER COLUMN id SET DEFAULT nextval('public.post_id_seq'::regclass);


--
-- Name: utenti id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.utenti ALTER COLUMN id SET DEFAULT nextval('public.utenti_id_seq'::regclass);


--
-- Data for Name: commenti; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.commenti (id, post_id, utente_id, contenuto, data_creazione, data_modifica) FROM stdin;
1	1	2	Bel post!	2025-01-13 10:09:24.922377	2025-01-13 10:09:24.922377
2	2	1	Grazie!	2025-01-13 10:09:24.922377	2025-01-13 10:09:24.922377
\.


--
-- Data for Name: configurazione; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.configurazione (id, valore, descrizione, gruppo) FROM stdin;
3	fdxjhppimrteylgl	password	1
4	smtp.gmail.com	smtpHost	1
5	587	smtpPort	1
6	true	smtpAuth	1
7	true	smtpStarttlsEnable	1
8	true	smtpSslTrust	1
2	user.prova.dev@gmail.com	sender	1
1	Configurazione invio email	\N	\N
\.


--
-- Data for Name: dms; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.dms (id, mittente_id, destinatario_id, messaggio, data_creazione) FROM stdin;
1	1	2	Ciao user2!	2025-01-13 10:09:24.922377
2	2	1	Ciao user1, come stai?	2025-01-13 10:09:24.922377
\.


--
-- Data for Name: likes; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.likes (id, utente_id, post_id, data_creazione) FROM stdin;
1	1	2	2025-01-13 10:09:24.922377
2	2	1	2025-01-13 10:09:24.922377
3	3	1	2025-01-13 10:09:24.922377
\.


--
-- Data for Name: post; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.post (id, utente_id, contenuto, data_creazione, data_modifica) FROM stdin;
1	1	Questo è il primo post di user1!	2025-01-13 10:09:24.922377	2025-01-13 10:09:24.922377
2	2	Ciao a tutti, sono user2!	2025-01-13 10:09:24.922377	2025-01-13 10:09:24.922377
3	3	Post casuale di user3.	2025-01-13 10:09:24.922377	2025-01-13 10:09:24.922377
\.


--
-- Data for Name: utenti; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.utenti (id, username, email, password, data_creazione, data_modifica) FROM stdin;
1	user1	user1@example.com	password1	2025-01-13 10:09:24.922377	2025-01-13 10:09:24.922377
2	user2	user2@example.com	password2	2025-01-13 10:09:24.922377	2025-01-13 10:09:24.922377
3	user3	user3@example.com	password3	2025-01-13 10:09:24.922377	2025-01-13 10:09:24.922377
51	string	string	string	2025-01-15 14:29:43.290088	2025-01-15 14:29:43.290104
\.


--
-- Name: commenti_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.commenti_id_seq', 2, true);


--
-- Name: configurazione_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.configurazione_id_seq', 1, false);


--
-- Name: dms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.dms_id_seq', 2, true);


--
-- Name: likes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.likes_id_seq', 3, true);


--
-- Name: post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.post_id_seq', 3, true);


--
-- Name: utente_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.utente_seq', 1, false);


--
-- Name: utenti_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.utenti_id_seq', 3, true);


--
-- Name: utenti_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.utenti_seq', 51, true);


--
-- Name: commenti commenti_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.commenti
    ADD CONSTRAINT commenti_pkey PRIMARY KEY (id);


--
-- Name: configurazione configurazione_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.configurazione
    ADD CONSTRAINT configurazione_pkey PRIMARY KEY (id);


--
-- Name: dms dms_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.dms
    ADD CONSTRAINT dms_pkey PRIMARY KEY (id);


--
-- Name: likes likes_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_pkey PRIMARY KEY (id);


--
-- Name: likes likes_utente_id_post_id_key; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_utente_id_post_id_key UNIQUE (utente_id, post_id);


--
-- Name: post post_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.post
    ADD CONSTRAINT post_pkey PRIMARY KEY (id);


--
-- Name: utenti utenti_email_key; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.utenti
    ADD CONSTRAINT utenti_email_key UNIQUE (email);


--
-- Name: utenti utenti_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.utenti
    ADD CONSTRAINT utenti_pkey PRIMARY KEY (id);


--
-- Name: utenti utenti_username_key; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.utenti
    ADD CONSTRAINT utenti_username_key UNIQUE (username);


--
-- Name: commenti commenti_post_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.commenti
    ADD CONSTRAINT commenti_post_id_fkey FOREIGN KEY (post_id) REFERENCES public.post(id) ON DELETE CASCADE;


--
-- Name: commenti commenti_utente_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.commenti
    ADD CONSTRAINT commenti_utente_id_fkey FOREIGN KEY (utente_id) REFERENCES public.utenti(id) ON DELETE CASCADE;


--
-- Name: dms dms_destinatario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.dms
    ADD CONSTRAINT dms_destinatario_id_fkey FOREIGN KEY (destinatario_id) REFERENCES public.utenti(id) ON DELETE CASCADE;


--
-- Name: dms dms_mittente_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.dms
    ADD CONSTRAINT dms_mittente_id_fkey FOREIGN KEY (mittente_id) REFERENCES public.utenti(id) ON DELETE CASCADE;


--
-- Name: likes likes_post_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_post_id_fkey FOREIGN KEY (post_id) REFERENCES public.post(id) ON DELETE CASCADE;


--
-- Name: likes likes_utente_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_utente_id_fkey FOREIGN KEY (utente_id) REFERENCES public.utenti(id) ON DELETE CASCADE;


--
-- Name: post post_utente_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: useruser
--

ALTER TABLE ONLY public.post
    ADD CONSTRAINT post_utente_id_fkey FOREIGN KEY (utente_id) REFERENCES public.utenti(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--
