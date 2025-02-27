PGDMP      #                }            outwittrader    17.4    17.4                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false                       1262    16388    outwittrader    DATABASE     r   CREATE DATABASE outwittrader WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en-US';
    DROP DATABASE outwittrader;
                     postgres    false            �            1259    16413    orders    TABLE     �   CREATE TABLE public.orders (
    id integer NOT NULL,
    user_id integer,
    product_id integer,
    "timestamp" text,
    status integer DEFAULT 0,
    slip text
);
    DROP TABLE public.orders;
       public         heap r       postgres    false            �            1259    16420    orders_id_seq    SEQUENCE     �   ALTER TABLE public.orders ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public               postgres    false    220            �            1259    16406    products    TABLE        CREATE TABLE public.products (
    id integer NOT NULL,
    days integer,
    name text,
    detail text,
    price integer
);
    DROP TABLE public.products;
       public         heap r       postgres    false            �            1259    16421    products_id_seq    SEQUENCE     �   ALTER TABLE public.products ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public               postgres    false    219            �            1259    16389    users    TABLE     �   CREATE TABLE public.users (
    id integer NOT NULL,
    username text,
    password text,
    email text,
    phone_number text,
    total_days integer DEFAULT 0,
    role integer DEFAULT 0
);
    DROP TABLE public.users;
       public         heap r       postgres    false            �            1259    16405    users_id_seq    SEQUENCE     �   ALTER TABLE public.users ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.users_id_seq
    START WITH 10000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public               postgres    false    217            �          0    16413    orders 
   TABLE DATA           T   COPY public.orders (id, user_id, product_id, "timestamp", status, slip) FROM stdin;
    public               postgres    false    220   �       �          0    16406    products 
   TABLE DATA           A   COPY public.products (id, days, name, detail, price) FROM stdin;
    public               postgres    false    219   G       �          0    16389    users 
   TABLE DATA           ^   COPY public.users (id, username, password, email, phone_number, total_days, role) FROM stdin;
    public               postgres    false    217                     0    0    orders_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.orders_id_seq', 3, true);
          public               postgres    false    221                       0    0    products_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.products_id_seq', 3, true);
          public               postgres    false    222            	           0    0    users_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.users_id_seq', 10001, true);
          public               postgres    false    218            i           2606    16419    orders orders_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public                 postgres    false    220            g           2606    16412    products products_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
       public                 postgres    false    219            e           2606    16395    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public                 postgres    false    217            �   X   x�3�44 NCNCs3cSK3C#�?d�����Ԥ.#�CN#�
S#CKs$#@|3s$�Pp�f�@��7F����� ��!�      �   �   x���-�@`={�=A�?����`1ETQ�� (�)��A�@�`�6�(��5��{O|��
i��I�'W��p;p�i/�m��=����V���������/�'�������+�%��U@�(%,�8�g�:��E�?�4MV�(^��.�S@6��4B|#��4      �   R   x�M�1
�0D�z�0a'q#�<�MP�@���ޠ�����Y��A��L[˥��h�d1�F�P��"���x�'H��@������     