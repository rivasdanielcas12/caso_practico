PGDMP          %            
    w            dbTransporte    10.10    10.10 (    +           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            ,           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            -           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            .           1262    16393    dbTransporte    DATABASE     �   CREATE DATABASE "dbTransporte" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Spain.1252' LC_CTYPE = 'Spanish_Spain.1252';
    DROP DATABASE "dbTransporte";
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            /           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    12924    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            0           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    16538    autobus    TABLE     k   CREATE TABLE public.autobus (
    id integer NOT NULL,
    placa character(6),
    nro_asientos numeric
);
    DROP TABLE public.autobus;
       public         postgres    false    3            �            1259    16554    billete    TABLE     �  CREATE TABLE public.billete (
    id integer NOT NULL,
    cliente_id integer NOT NULL,
    trayecto_id integer NOT NULL,
    categoria_id integer NOT NULL,
    autobus_id integer NOT NULL,
    precio numeric(9,2),
    sobre_precio numeric(9,2),
    subtotal numeric(9,2),
    porcentaje_descuento numeric,
    descuento numeric(9,2),
    total numeric(9,2),
    fechahora_partida date,
    fechahora_llegada date,
    tipo_viaje character varying(6)
);
    DROP TABLE public.billete;
       public         postgres    false    3            �            1259    16586 	   categoria    TABLE     v   CREATE TABLE public.categoria (
    id integer NOT NULL,
    nombre text,
    porcentaje_alteracion_precio integer
);
    DROP TABLE public.categoria;
       public         postgres    false    3            �            1259    16394    cliente    TABLE     �   CREATE TABLE public.cliente (
    id integer NOT NULL,
    nombres text,
    apellido_paterni text,
    apellido_materno text,
    dni character(8)
);
    DROP TABLE public.cliente;
       public         postgres    false    3            �            1259    16546    pago    TABLE     �   CREATE TABLE public.pago (
    id integer NOT NULL,
    billete_id integer[] NOT NULL,
    vuelo text,
    importe_pagar numeric(9,2),
    estado character(1)
);
    DROP TABLE public.pago;
       public         postgres    false    3            �            1259    16578    parada    TABLE     ]   CREATE TABLE public.parada (
    id integer NOT NULL,
    nombre text,
    ubicacion text
);
    DROP TABLE public.parada;
       public         postgres    false    3            �            1259    16570    tramo    TABLE     �   CREATE TABLE public.tramo (
    id integer NOT NULL,
    trayecto_id integer NOT NULL,
    parada_inicio_id integer NOT NULL,
    parada_fin_id integer NOT NULL,
    precio numeric(9,2),
    orden integer
);
    DROP TABLE public.tramo;
       public         postgres    false    3            �            1259    16562    trayecto    TABLE     �   CREATE TABLE public.trayecto (
    id integer NOT NULL,
    nombre text,
    parada_inicio_id integer NOT NULL,
    parada_fin_id integer NOT NULL
);
    DROP TABLE public.trayecto;
       public         postgres    false    3            "          0    16538    autobus 
   TABLE DATA               :   COPY public.autobus (id, placa, nro_asientos) FROM stdin;
    public       postgres    false    197   .       $          0    16554    billete 
   TABLE DATA               �   COPY public.billete (id, cliente_id, trayecto_id, categoria_id, autobus_id, precio, sobre_precio, subtotal, porcentaje_descuento, descuento, total, fechahora_partida, fechahora_llegada, tipo_viaje) FROM stdin;
    public       postgres    false    199   $.       (          0    16586 	   categoria 
   TABLE DATA               M   COPY public.categoria (id, nombre, porcentaje_alteracion_precio) FROM stdin;
    public       postgres    false    203   A.       !          0    16394    cliente 
   TABLE DATA               W   COPY public.cliente (id, nombres, apellido_paterni, apellido_materno, dni) FROM stdin;
    public       postgres    false    196   ^.       #          0    16546    pago 
   TABLE DATA               L   COPY public.pago (id, billete_id, vuelo, importe_pagar, estado) FROM stdin;
    public       postgres    false    198   �.       '          0    16578    parada 
   TABLE DATA               7   COPY public.parada (id, nombre, ubicacion) FROM stdin;
    public       postgres    false    202   �.       &          0    16570    tramo 
   TABLE DATA               `   COPY public.tramo (id, trayecto_id, parada_inicio_id, parada_fin_id, precio, orden) FROM stdin;
    public       postgres    false    201   �.       %          0    16562    trayecto 
   TABLE DATA               O   COPY public.trayecto (id, nombre, parada_inicio_id, parada_fin_id) FROM stdin;
    public       postgres    false    200   �.       �
           2606    16401    cliente Cliente_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT "Cliente_pkey" PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.cliente DROP CONSTRAINT "Cliente_pkey";
       public         postgres    false    196            �
           2606    16545    autobus autobus_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.autobus
    ADD CONSTRAINT autobus_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.autobus DROP CONSTRAINT autobus_pkey;
       public         postgres    false    197            �
           2606    16561    billete billete_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.billete
    ADD CONSTRAINT billete_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.billete DROP CONSTRAINT billete_pkey;
       public         postgres    false    199            �
           2606    16593    categoria categoria_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.categoria
    ADD CONSTRAINT categoria_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.categoria DROP CONSTRAINT categoria_pkey;
       public         postgres    false    203            �
           2606    16553    pago pago_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.pago
    ADD CONSTRAINT pago_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.pago DROP CONSTRAINT pago_pkey;
       public         postgres    false    198            �
           2606    16585    parada parada_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.parada
    ADD CONSTRAINT parada_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.parada DROP CONSTRAINT parada_pkey;
       public         postgres    false    202            �
           2606    16577    tramo tramo_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.tramo
    ADD CONSTRAINT tramo_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.tramo DROP CONSTRAINT tramo_pkey;
       public         postgres    false    201            �
           2606    16569    trayecto trayecto_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.trayecto
    ADD CONSTRAINT trayecto_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.trayecto DROP CONSTRAINT trayecto_pkey;
       public         postgres    false    200            �
           2606    16609     billete fk_billete_codigoautobus    FK CONSTRAINT     �   ALTER TABLE ONLY public.billete
    ADD CONSTRAINT fk_billete_codigoautobus FOREIGN KEY (autobus_id) REFERENCES public.autobus(id) ON UPDATE CASCADE ON DELETE CASCADE;
 J   ALTER TABLE ONLY public.billete DROP CONSTRAINT fk_billete_codigoautobus;
       public       postgres    false    2707    199    197            �
           2606    16604 "   billete fk_billete_codigocategoria    FK CONSTRAINT     �   ALTER TABLE ONLY public.billete
    ADD CONSTRAINT fk_billete_codigocategoria FOREIGN KEY (categoria_id) REFERENCES public.categoria(id) ON UPDATE CASCADE ON DELETE CASCADE;
 L   ALTER TABLE ONLY public.billete DROP CONSTRAINT fk_billete_codigocategoria;
       public       postgres    false    199    203    2719            �
           2606    16594     billete fk_billete_codigocliente    FK CONSTRAINT     �   ALTER TABLE ONLY public.billete
    ADD CONSTRAINT fk_billete_codigocliente FOREIGN KEY (cliente_id) REFERENCES public.cliente(id) ON UPDATE CASCADE ON DELETE CASCADE;
 J   ALTER TABLE ONLY public.billete DROP CONSTRAINT fk_billete_codigocliente;
       public       postgres    false    199    196    2705            �
           2606    16614    billete fk_billete_codigopago    FK CONSTRAINT     �   ALTER TABLE ONLY public.billete
    ADD CONSTRAINT fk_billete_codigopago FOREIGN KEY (id) REFERENCES public.pago(id) ON UPDATE CASCADE ON DELETE CASCADE;
 G   ALTER TABLE ONLY public.billete DROP CONSTRAINT fk_billete_codigopago;
       public       postgres    false    199    198    2709            �
           2606    16599 !   billete fk_billete_codigotrayecto    FK CONSTRAINT     �   ALTER TABLE ONLY public.billete
    ADD CONSTRAINT fk_billete_codigotrayecto FOREIGN KEY (trayecto_id) REFERENCES public.trayecto(id) ON UPDATE CASCADE ON DELETE CASCADE;
 K   ALTER TABLE ONLY public.billete DROP CONSTRAINT fk_billete_codigotrayecto;
       public       postgres    false    2713    199    200            �
           2606    16629    tramo fk_tramo_codigoparadafin    FK CONSTRAINT     �   ALTER TABLE ONLY public.tramo
    ADD CONSTRAINT fk_tramo_codigoparadafin FOREIGN KEY (parada_fin_id) REFERENCES public.parada(id) ON UPDATE CASCADE ON DELETE CASCADE;
 H   ALTER TABLE ONLY public.tramo DROP CONSTRAINT fk_tramo_codigoparadafin;
       public       postgres    false    201    202    2717            �
           2606    16624    tramo fk_tramo_codigoparadaini    FK CONSTRAINT     �   ALTER TABLE ONLY public.tramo
    ADD CONSTRAINT fk_tramo_codigoparadaini FOREIGN KEY (parada_inicio_id) REFERENCES public.parada(id) ON UPDATE CASCADE ON DELETE CASCADE;
 H   ALTER TABLE ONLY public.tramo DROP CONSTRAINT fk_tramo_codigoparadaini;
       public       postgres    false    2717    202    201            �
           2606    16619    tramo fk_tramo_codigotrayecto    FK CONSTRAINT     �   ALTER TABLE ONLY public.tramo
    ADD CONSTRAINT fk_tramo_codigotrayecto FOREIGN KEY (trayecto_id) REFERENCES public.trayecto(id) ON UPDATE CASCADE ON DELETE CASCADE;
 G   ALTER TABLE ONLY public.tramo DROP CONSTRAINT fk_tramo_codigotrayecto;
       public       postgres    false    2713    201    200            "      x������ � �      $      x������ � �      (      x������ � �      !   (   x�3��*M��,H-J��,�/N�4426153������� ��6      #      x������ � �      '      x������ � �      &      x������ � �      %      x������ � �     