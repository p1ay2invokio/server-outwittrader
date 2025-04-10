PGDMP  9                    }            outwittrader    17.4    17.4     %           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            &           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            '           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            (           1262    16388    outwittrader    DATABASE     r   CREATE DATABASE outwittrader WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en-US';
    DROP DATABASE outwittrader;
                     postgres    false            �            1259    16439    forex    TABLE     F   CREATE TABLE public.forex (
    news text,
    id integer NOT NULL
);
    DROP TABLE public.forex;
       public         heap r       postgres    false            �            1259    16444    forex_id_seq    SEQUENCE     �   ALTER TABLE public.forex ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.forex_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public               postgres    false    223            �            1259    16413    orders    TABLE     �   CREATE TABLE public.orders (
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
            public               postgres    false    220            �            1259    16406    products    TABLE     �   CREATE TABLE public.products (
    id integer NOT NULL,
    days integer,
    name text,
    detail text,
    price integer,
    special smallint,
    img text
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
            public               postgres    false    219            �            1259    16455    teams    TABLE     �   CREATE TABLE public.teams (
    id integer NOT NULL,
    team_name text,
    status smallint DEFAULT 0,
    owner_id integer NOT NULL,
    broker_link text DEFAULT ''::text
);
    DROP TABLE public.teams;
       public         heap r       postgres    false            �            1259    16454    teams_id_seq    SEQUENCE     �   ALTER TABLE public.teams ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.teams_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public               postgres    false    226            �            1259    16389    users    TABLE     �  CREATE TABLE public.users (
    id integer NOT NULL,
    username text,
    password text,
    email text,
    phone_number text,
    total_days integer DEFAULT 0,
    role integer DEFAULT 0,
    name text DEFAULT ''::text,
    surname text DEFAULT ''::text,
    age integer DEFAULT 0,
    gender text DEFAULT ''::text,
    thai_id text DEFAULT ''::text,
    bod text DEFAULT ''::text,
    job text DEFAULT ''::text,
    salary integer DEFAULT 0,
    bank_account text DEFAULT ''::text,
    bank_name text DEFAULT ''::text,
    referral text DEFAULT ''::text,
    bank_img text DEFAULT ''::text,
    thai_id_img text DEFAULT ''::text,
    face_img text DEFAULT ''::text,
    team_id integer
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
            public               postgres    false    217                      0    16439    forex 
   TABLE DATA           )   COPY public.forex (news, id) FROM stdin;
    public               postgres    false    223   �                  0    16413    orders 
   TABLE DATA           T   COPY public.orders (id, user_id, product_id, "timestamp", status, slip) FROM stdin;
    public               postgres    false    220   )*                 0    16406    products 
   TABLE DATA           O   COPY public.products (id, days, name, detail, price, special, img) FROM stdin;
    public               postgres    false    219   �*       "          0    16455    teams 
   TABLE DATA           M   COPY public.teams (id, team_name, status, owner_id, broker_link) FROM stdin;
    public               postgres    false    226   y+                 0    16389    users 
   TABLE DATA           �   COPY public.users (id, username, password, email, phone_number, total_days, role, name, surname, age, gender, thai_id, bod, job, salary, bank_account, bank_name, referral, bank_img, thai_id_img, face_img, team_id) FROM stdin;
    public               postgres    false    217   �+       )           0    0    forex_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.forex_id_seq', 1, true);
          public               postgres    false    224            *           0    0    orders_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.orders_id_seq', 4, true);
          public               postgres    false    221            +           0    0    products_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.products_id_seq', 3, true);
          public               postgres    false    222            ,           0    0    teams_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.teams_id_seq', 15, true);
          public               postgres    false    225            -           0    0    users_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.users_id_seq', 10014, true);
          public               postgres    false    218            �           2606    16451    forex forex_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.forex
    ADD CONSTRAINT forex_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.forex DROP CONSTRAINT forex_pkey;
       public                 postgres    false    223            �           2606    16419    orders orders_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public                 postgres    false    220            �           2606    16412    products products_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
       public                 postgres    false    219            �           2606    16462    teams teams_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.teams DROP CONSTRAINT teams_pkey;
       public                 postgres    false    226                       2606    16395    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public                 postgres    false    217               -	  x��[�r�8}�|�U�6bx��7I�=�U�����}@$XB�"��G�����J�i�V�%)�d��������������ɔ�l��|Y%#(s��.�EIh�l>nN~?Y�*/�>|=�|�D%�����Bo�Nc���z^��G�f�%|�3}�/(�T���+[���
X�������~�����d�e�pvw�����!�^C�\AH2T��U+�c��H�Q��ṁ�bx��3�
��p�4 K�/� ���#È�n$��2�?ޙ�EI�3fxIJ�p��8<7��R�yAy� �^1�����J�0�՟��o�pIVkD���/�"���y��@&�j�@�(bn.)?+gV"V��?�|����P���MĴ\`�A�s��RVB!�\���}�׃	��x�'aQ�����%H��}A��a��+���zJz<�ބ���	��ΙU�m�S`\��z�q��i�J(�h�4��v��ʊc�H�_
��g�/yŔ��y"�
����D�`$�/_y�D�xF�c���,Њ*���L��a��i�!��X��z���ؙ��v�9x^�J/k��κ�m*F�K�7ی�68/�{��I3 �G"P.�n��G8"��1c,��b#��~	�0�Y�,	ͤ��"=tl�k�R;'9�v�o�������zE�WD�$�)1S!>W!���#Q$H_�R��bi�Ih.�"ח�~I8�a�;�@%�{t"ewh�/�3E�k��z4P��ق`L7
�|w�]r�lDШE��}�=n�9���RCa�νG r+0���-��:5�/ϛ �K�w+g�E9�jh/K�ﱄ��)������ͤ��Ʋе�H��h�M�xk��HXRiR:絹vLZx S:��-�+��ཀL#�W�%sʻ�D�j�M$���м\��Үˎ�)Q�?QƗ�ؙ��7̜�q������!� Ŵ�[Z�I�ZˏH��zE$��i�<��V�d�9Xn���i^t�S͒�b��(����i5��C"3��xT�n�̋V�-�'�N�H���n�pF�=�j���̙{��.���&��{�օ���%B+D0W�IG(~������w)������̹�ߜ�-��ّ�A���`"�H�4���ZI��.=��Z�@�)0G%{���JٻU������Ԋ���B_�mΜ;�k���^`��1e=?q})Q�䉉�O>ί�S�lAs�!88��Ia�02ֶ�et�i�ڮh�d�KG�<�1�HV~\�ū�H#��XU���|�)J�>97�i4��i�����57�K�v�-���3氷���s,�����61�j(��+_\*2�e��	U�.!0�]	=�|6=���HL�#�H,����+CD��MU,] �����.��������[���424,�����������z���9k����\�5tX�}�/E'M�؜#~��s�@+2�7����C�<�1�@�ޑ����2bD75�J�uA/tC�n~��9�6[s�
Ps�b��o�U�ف�_�7��hF6A�G�Lx�r%�]Gӷ�����n�W.�`������������x`��{��!����`��S�������+ޗ�j{��oP��������/H�������u�Nۓ%Ё���g����c�
&����.0�C���"m�X�`1vWšJ$�JpW;a1�!��Q��B]A����GK��@AR���2/�j��c���El���x�-L���h�I	��L��Z�w�yk��"K����lܻ��ԎK��fY���a���˴�ޣ�wc��WZ7�)LpS����g��јؕ +=
��Q�a߬��ƕ�I�^m����,s�^e�bת/-�HR9��"G�2D6&���ʮA kA����f`^T�����V�P�|�8�'X�RnSZ��1Kk>����P���h\��/e�hNmF3�k��Ɖ�?<��J-. ��϶�
Ƙ�G+G�P���i�����_��{���<�W�l��G�z�Io.�HX��{?�Y�o��"&�_LEo��	��I��|��N��ټ8��S����5G&���~NO��É��=s�>�)o���3���N�\�<ޓo���ϾW�:�J����g������	I�sP�
���'(�V�Q/;"+���������P$JE'�>aNl��*��3���IC?�����wYĖ)
S9C�U��"Rl�H��s��! f�g�e���}��ک�5;B��~����[��'�� p%4�'���d��ٚ<��p�q�&P-ŀ!�+�$�ȿ������Ç�e׈J         j   x�]�K� D��.��@�KxV&.L\����"~RmWo2o�E�(Ʌ,�PF`�u�v��j�+�4S�j�d��p��6���?v��������� ~X�c�L,{         �   x��ο�P���)�uo�H�z��Rڄ�PĪ1��`�A"	1`p��|���F�.'_��?���3��q�����Pp�җs��7�\�w�gl�6����n�+������ >}[�6�Tn��_̢pH�� I�i��q>p�Ioby�ʀ�i2.F���uY��E�ұbI���ٰ��I�4��$�L���X���j F      "   ;   x�34�t�,I����4�44004��())(���O�H��OJ��-)JLI�K������� ���         �  x����n�F���w�9�ˮq�.�]t+ �-9��,;AvuP�n�]$H�E� H� Z���m�(=琔š-fQ�0��<�����\p�7{̄T�X~�`�';��)��k�^3߻Pw�kf8+�E�����D`���m�3�t�m_�K=������t>���E�w<���pZY��.����h|8}��h�7�6�'���������|p]-�VI��O�5	7Q 	W��}���Ʈ�5��Lf<t�����u�<+����(�:��Y^���q2X�� �U�x��f@I��Ԛ>$��9����pO �X D|f�Q��O�#������d�/FL5H9�� .�q�I�R zF�gMDFk�(	9^�c	4��}ُq�Z�lĕVw�J/�	��W�'����Švd�AY1����p< ?b���5�=��j��Ҟd_�o�9�+�
'K)Y^���w[j�׭,8�oVSR-:�Ԛ>Q� <�=�=��tp��A6������%��< ���P�ɪ���;2�9����Xpw�f,[L��|v���n���~2�W�6�M�&D�+�ъ�(��^!P?��O�8g��τ�<�:���Q�(Ŗ @�GB-b��T�l�HR:=Қ>i�:vlqz��W�Oy��� 6W� ��{ߠؗO),���:b4�	"R�ʘ/�4
a:o@|UI!i�UM��)��fF���;%ӻ�-K\����J8n)È�&
?�Ny��Y�_����9�F�Fsc���CȘrF-�b&�+�4�/w�"�i��ݑ��
c�F���F��j�9����D�
2v]n�Q+��)&�d �_�_VO��|�?�����F2|/�F�#+ ]���Oٲl '�b-����}����Q}_:X���5�&��;�2t��۝�C�<����%i�}��Wp�I9�E�*��(|���i��P_��>b��Ę�oI��I�o��@���v�ɫ���D\�;��+o�Un�6I7C�K�G�~��m��*��u���ц�7�%N4�����@�Qz��'�`�F�T�Ҳ�����]RuرY��.;&��bGÎO�`�S*�R;�PU���ǃłi���
��04'7�xA����%�M���u�o���ݙԚ�F��2�:Z��@�^y������I_���ͼ>�	��S�{aP�hް��v՝VV����nx�dh���lmm��� �     