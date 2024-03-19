--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

-- Started on 2024-03-19 20:55:00

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

DROP DATABASE java4a;
--
-- TOC entry 4914 (class 1262 OID 82293)
-- Name: java4a; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE java4a WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Turkish_Turkey.1254';


ALTER DATABASE java4a OWNER TO postgres;

\connect java4a

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
-- TOC entry 218 (class 1259 OID 90504)
-- Name: address; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.address (
    id integer NOT NULL,
    user_id integer NOT NULL,
    country_id integer NOT NULL,
    city_id integer NOT NULL,
    district_id integer NOT NULL
);


ALTER TABLE public.address OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 90503)
-- Name: address_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.address ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.address_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 228 (class 1259 OID 90552)
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    category_name character varying NOT NULL,
    category_detail character varying NOT NULL
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 90551)
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.categories ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 238 (class 1259 OID 90591)
-- Name: city; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.city (
    id integer NOT NULL,
    country_id integer NOT NULL,
    city_name character varying NOT NULL
);


ALTER TABLE public.city OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 90590)
-- Name: city_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.city ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.city_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 220 (class 1259 OID 90510)
-- Name: country; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.country (
    id integer NOT NULL,
    country_name character varying NOT NULL
);


ALTER TABLE public.country OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 90509)
-- Name: country_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.country ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.country_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 240 (class 1259 OID 90599)
-- Name: district; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.district (
    id integer NOT NULL,
    city_id integer NOT NULL,
    district_name character varying NOT NULL
);


ALTER TABLE public.district OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 90598)
-- Name: district_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.district ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.district_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 232 (class 1259 OID 90568)
-- Name: invoice_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.invoice_details (
    id integer NOT NULL,
    invoice_id integer NOT NULL,
    order_details_id integer NOT NULL,
    product_id integer NOT NULL,
    quantity integer NOT NULL,
    unit_price double precision NOT NULL,
    line_total double precision NOT NULL
);


ALTER TABLE public.invoice_details OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 90567)
-- Name: invoice_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.invoice_details ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.invoice_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 230 (class 1259 OID 90560)
-- Name: invoices; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.invoices (
    id integer NOT NULL,
    order_id integer NOT NULL,
    date date NOT NULL,
    address_id integer NOT NULL,
    cargo_receipt_no character varying NOT NULL,
    total_amount double precision NOT NULL
);


ALTER TABLE public.invoices OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 90559)
-- Name: invoices_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.invoices ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.invoices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 224 (class 1259 OID 90538)
-- Name: order_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_details (
    id integer NOT NULL,
    order_id integer NOT NULL,
    product_id integer NOT NULL,
    quantity integer NOT NULL,
    unit_price double precision NOT NULL,
    line_total double precision NOT NULL
);


ALTER TABLE public.order_details OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 90537)
-- Name: order_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.order_details ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.order_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 222 (class 1259 OID 90532)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    user_id integer NOT NULL,
    date date NOT NULL,
    total_amount double precision NOT NULL,
    status integer NOT NULL,
    address_id integer NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 90531)
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.orders ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 236 (class 1259 OID 90582)
-- Name: payment_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment_types (
    id integer NOT NULL,
    payment_type character varying NOT NULL
);


ALTER TABLE public.payment_types OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 90581)
-- Name: payment_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.payment_types ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.payment_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 234 (class 1259 OID 90574)
-- Name: payments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payments (
    id integer NOT NULL,
    order_id integer NOT NULL,
    payment_id smallint NOT NULL,
    date date NOT NULL,
    approval_code character varying NOT NULL,
    payment_total double precision NOT NULL
);


ALTER TABLE public.payments OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 90573)
-- Name: payments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.payments ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.payments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 226 (class 1259 OID 90544)
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id integer NOT NULL,
    product_code character varying NOT NULL,
    product_name character varying NOT NULL,
    unit_price double precision NOT NULL,
    category_id integer NOT NULL,
    brand character varying NOT NULL
);


ALTER TABLE public.products OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 90543)
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.products ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 216 (class 1259 OID 90494)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    user_name character varying NOT NULL,
    password character varying NOT NULL,
    full_name character varying NOT NULL,
    e_mail character varying NOT NULL,
    gender character varying NOT NULL,
    date_of_birth character varying NOT NULL,
    creation_date character varying NOT NULL,
    phone_number character varying NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 90493)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.users ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 4886 (class 0 OID 90504)
-- Dependencies: 218
-- Data for Name: address; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4896 (class 0 OID 90552)
-- Dependencies: 228
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4906 (class 0 OID 90591)
-- Dependencies: 238
-- Data for Name: city; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4888 (class 0 OID 90510)
-- Dependencies: 220
-- Data for Name: country; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4908 (class 0 OID 90599)
-- Dependencies: 240
-- Data for Name: district; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4900 (class 0 OID 90568)
-- Dependencies: 232
-- Data for Name: invoice_details; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4898 (class 0 OID 90560)
-- Dependencies: 230
-- Data for Name: invoices; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4892 (class 0 OID 90538)
-- Dependencies: 224
-- Data for Name: order_details; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4890 (class 0 OID 90532)
-- Dependencies: 222
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4904 (class 0 OID 90582)
-- Dependencies: 236
-- Data for Name: payment_types; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4902 (class 0 OID 90574)
-- Dependencies: 234
-- Data for Name: payments; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4894 (class 0 OID 90544)
-- Dependencies: 226
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4884 (class 0 OID 90494)
-- Dependencies: 216
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4915 (class 0 OID 0)
-- Dependencies: 217
-- Name: address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.address_id_seq', 1, false);


--
-- TOC entry 4916 (class 0 OID 0)
-- Dependencies: 227
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_id_seq', 1, false);


--
-- TOC entry 4917 (class 0 OID 0)
-- Dependencies: 237
-- Name: city_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.city_id_seq', 1, false);


--
-- TOC entry 4918 (class 0 OID 0)
-- Dependencies: 219
-- Name: country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.country_id_seq', 1, false);


--
-- TOC entry 4919 (class 0 OID 0)
-- Dependencies: 239
-- Name: district_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.district_id_seq', 1, false);


--
-- TOC entry 4920 (class 0 OID 0)
-- Dependencies: 231
-- Name: invoice_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.invoice_details_id_seq', 1, false);


--
-- TOC entry 4921 (class 0 OID 0)
-- Dependencies: 229
-- Name: invoices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.invoices_id_seq', 1, false);


--
-- TOC entry 4922 (class 0 OID 0)
-- Dependencies: 223
-- Name: order_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_details_id_seq', 1, false);


--
-- TOC entry 4923 (class 0 OID 0)
-- Dependencies: 221
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 1, false);


--
-- TOC entry 4924 (class 0 OID 0)
-- Dependencies: 235
-- Name: payment_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payment_types_id_seq', 1, false);


--
-- TOC entry 4925 (class 0 OID 0)
-- Dependencies: 233
-- Name: payments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payments_id_seq', 1, false);


--
-- TOC entry 4926 (class 0 OID 0)
-- Dependencies: 225
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 1, false);


--
-- TOC entry 4927 (class 0 OID 0)
-- Dependencies: 215
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- TOC entry 4699 (class 2606 OID 90508)
-- Name: address address_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_pkey PRIMARY KEY (id);


--
-- TOC entry 4709 (class 2606 OID 90558)
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- TOC entry 4719 (class 2606 OID 90597)
-- Name: city city_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.city
    ADD CONSTRAINT city_pkey PRIMARY KEY (id);


--
-- TOC entry 4701 (class 2606 OID 90516)
-- Name: country country_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_pkey PRIMARY KEY (id);


--
-- TOC entry 4721 (class 2606 OID 90605)
-- Name: district district_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.district
    ADD CONSTRAINT district_pkey PRIMARY KEY (id);


--
-- TOC entry 4713 (class 2606 OID 90572)
-- Name: invoice_details invoice_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoice_details
    ADD CONSTRAINT invoice_details_pkey PRIMARY KEY (id);


--
-- TOC entry 4711 (class 2606 OID 90566)
-- Name: invoices invoices_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoices
    ADD CONSTRAINT invoices_pkey PRIMARY KEY (id);


--
-- TOC entry 4705 (class 2606 OID 90542)
-- Name: order_details order_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT order_details_pkey PRIMARY KEY (id);


--
-- TOC entry 4703 (class 2606 OID 90536)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- TOC entry 4717 (class 2606 OID 90588)
-- Name: payment_types payment_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_types
    ADD CONSTRAINT payment_types_pkey PRIMARY KEY (id);


--
-- TOC entry 4715 (class 2606 OID 90580)
-- Name: payments payments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (id);


--
-- TOC entry 4707 (class 2606 OID 90550)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- TOC entry 4695 (class 2606 OID 90502)
-- Name: users users_e_mail_password_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_e_mail_password_key UNIQUE (e_mail, password);


--
-- TOC entry 4697 (class 2606 OID 90500)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4722 (class 2606 OID 90616)
-- Name: address FK_ADDRESS_CITY; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT "FK_ADDRESS_CITY" FOREIGN KEY (city_id) REFERENCES public.city(id) NOT VALID;


--
-- TOC entry 4723 (class 2606 OID 90611)
-- Name: address FK_ADDRESS_COUNTRY; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT "FK_ADDRESS_COUNTRY" FOREIGN KEY (country_id) REFERENCES public.country(id) NOT VALID;


--
-- TOC entry 4724 (class 2606 OID 90621)
-- Name: address FK_ADDRESS_DISTRICT; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT "FK_ADDRESS_DISTRICT" FOREIGN KEY (district_id) REFERENCES public.district(id) NOT VALID;


--
-- TOC entry 4725 (class 2606 OID 90606)
-- Name: address FK_ADDRESS_USERS; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT "FK_ADDRESS_USERS" FOREIGN KEY (user_id) REFERENCES public.users(id) NOT VALID;


--
-- TOC entry 4738 (class 2606 OID 90626)
-- Name: city FK_CITY_COUNTRY; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.city
    ADD CONSTRAINT "FK_CITY_COUNTRY" FOREIGN KEY (country_id) REFERENCES public.country(id) NOT VALID;


--
-- TOC entry 4739 (class 2606 OID 90631)
-- Name: district FK_DISTRICT_CITY; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.district
    ADD CONSTRAINT "FK_DISTRICT_CITY" FOREIGN KEY (city_id) REFERENCES public.city(id) NOT VALID;


--
-- TOC entry 4731 (class 2606 OID 90666)
-- Name: invoices FK_INVOICES_ADDRESS; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoices
    ADD CONSTRAINT "FK_INVOICES_ADDRESS" FOREIGN KEY (address_id) REFERENCES public.address(id) NOT VALID;


--
-- TOC entry 4732 (class 2606 OID 90661)
-- Name: invoices FK_INVOICES_ORDER; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoices
    ADD CONSTRAINT "FK_INVOICES_ORDER" FOREIGN KEY (order_id) REFERENCES public.orders(id) NOT VALID;


--
-- TOC entry 4733 (class 2606 OID 90671)
-- Name: invoice_details FK_INVOICE_DETAILS_INVOICES; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoice_details
    ADD CONSTRAINT "FK_INVOICE_DETAILS_INVOICES" FOREIGN KEY (invoice_id) REFERENCES public.invoices(id) NOT VALID;


--
-- TOC entry 4734 (class 2606 OID 90676)
-- Name: invoice_details FK_INVOICE_DETAILS_ORDER_DETAILS; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoice_details
    ADD CONSTRAINT "FK_INVOICE_DETAILS_ORDER_DETAILS" FOREIGN KEY (order_details_id) REFERENCES public.order_details(id) NOT VALID;


--
-- TOC entry 4735 (class 2606 OID 90681)
-- Name: invoice_details FK_INVOICE_DETAILS_PRODUCTS; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.invoice_details
    ADD CONSTRAINT "FK_INVOICE_DETAILS_PRODUCTS" FOREIGN KEY (product_id) REFERENCES public.products(id) NOT VALID;


--
-- TOC entry 4726 (class 2606 OID 90641)
-- Name: orders FK_ORDERS_ADDRESS; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT "FK_ORDERS_ADDRESS" FOREIGN KEY (address_id) REFERENCES public.address(id) NOT VALID;


--
-- TOC entry 4727 (class 2606 OID 90636)
-- Name: orders FK_ORDERS_USERS; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT "FK_ORDERS_USERS" FOREIGN KEY (user_id) REFERENCES public.users(id) NOT VALID;


--
-- TOC entry 4728 (class 2606 OID 90646)
-- Name: order_details FK_ORDER_DETAILS_ORDERS; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT "FK_ORDER_DETAILS_ORDERS" FOREIGN KEY (order_id) REFERENCES public.orders(id) NOT VALID;


--
-- TOC entry 4729 (class 2606 OID 90651)
-- Name: order_details FK_ORDER_DETAILS_PRODUCTS; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT "FK_ORDER_DETAILS_PRODUCTS" FOREIGN KEY (product_id) REFERENCES public.products(id) NOT VALID;


--
-- TOC entry 4736 (class 2606 OID 90686)
-- Name: payments FK_PAYMENTS_ORDERS; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT "FK_PAYMENTS_ORDERS" FOREIGN KEY (order_id) REFERENCES public.orders(id) NOT VALID;


--
-- TOC entry 4737 (class 2606 OID 90691)
-- Name: payments FK_PAYMENTS_PAYMENT_TYPES; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT "FK_PAYMENTS_PAYMENT_TYPES" FOREIGN KEY (payment_id) REFERENCES public.payment_types(id) NOT VALID;


--
-- TOC entry 4730 (class 2606 OID 90656)
-- Name: products FK_PRODUCTS_CATEGORIES; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT "FK_PRODUCTS_CATEGORIES" FOREIGN KEY (category_id) REFERENCES public.categories(id) NOT VALID;


-- Completed on 2024-03-19 20:55:00

--
-- PostgreSQL database dump complete
--

