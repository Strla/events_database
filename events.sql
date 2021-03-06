PGDMP     3    )                  z            events    14.1    14.1 1    0           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            1           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            2           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            3           1262    25015    events    DATABASE     e   CREATE DATABASE events WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Croatian_Croatia.1252';
    DROP DATABASE events;
                postgres    false            4           0    0    DATABASE events    ACL     9   REVOKE CONNECT,TEMPORARY ON DATABASE events FROM PUBLIC;
                   postgres    false    3379            ?            1259    25048    cities    TABLE     I   CREATE TABLE public.cities (
    name character varying(200) NOT NULL
);
    DROP TABLE public.cities;
       public         heap    postgres    false            ?            1259    25092    events    TABLE       CREATE TABLE public.events (
    id integer NOT NULL,
    name character varying(300) NOT NULL,
    date_planned timestamp without time zone NOT NULL,
    image character varying(300),
    description text NOT NULL,
    max_participants integer,
    min_age integer,
    location_id integer,
    organizer_id integer,
    CONSTRAINT events_max_participants_check CHECK ((max_participants > 0)),
    CONSTRAINT events_min_age_check CHECK ((min_age > 0)),
    CONSTRAINT events_name_check CHECK ((length((name)::text) > 5))
);
    DROP TABLE public.events;
       public         heap    postgres    false            ?            1259    25091    events_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.events_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.events_id_seq;
       public          postgres    false    217            5           0    0    events_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.events_id_seq OWNED BY public.events.id;
          public          postgres    false    216            ?            1259    25128    events_tags    TABLE     q   CREATE TABLE public.events_tags (
    event_id integer NOT NULL,
    tag_name character varying(100) NOT NULL
);
    DROP TABLE public.events_tags;
       public         heap    postgres    false            ?            1259    25113    events_users    TABLE     b   CREATE TABLE public.events_users (
    event_id integer NOT NULL,
    user_id integer NOT NULL
);
     DROP TABLE public.events_users;
       public         heap    postgres    false            ?            1259    25054 	   locations    TABLE       CREATE TABLE public.locations (
    id integer NOT NULL,
    title character varying(300),
    street character varying(300) NOT NULL,
    house_number character varying(10) NOT NULL,
    postal_code character varying(5) NOT NULL,
    city_name character varying(200)
);
    DROP TABLE public.locations;
       public         heap    postgres    false            ?            1259    25053    locations_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.locations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.locations_id_seq;
       public          postgres    false    211            6           0    0    locations_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.locations_id_seq OWNED BY public.locations.id;
          public          postgres    false    210            ?            1259    25076 
   organizers    TABLE     o   CREATE TABLE public.organizers (
    password character varying(500) NOT NULL,
    user_id integer NOT NULL
);
    DROP TABLE public.organizers;
       public         heap    postgres    false            ?            1259    25086    tags    TABLE     G   CREATE TABLE public.tags (
    name character varying(100) NOT NULL
);
    DROP TABLE public.tags;
       public         heap    postgres    false            ?            1259    25068    users    TABLE     ?   CREATE TABLE public.users (
    id integer NOT NULL,
    first_name character varying(300) NOT NULL,
    last_name character varying(300) NOT NULL,
    birthdate date NOT NULL,
    email character varying(300) NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false            ?            1259    25067    users_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    213            7           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    212            |           2604    25095 	   events id    DEFAULT     f   ALTER TABLE ONLY public.events ALTER COLUMN id SET DEFAULT nextval('public.events_id_seq'::regclass);
 8   ALTER TABLE public.events ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    217    217            z           2604    25057    locations id    DEFAULT     l   ALTER TABLE ONLY public.locations ALTER COLUMN id SET DEFAULT nextval('public.locations_id_seq'::regclass);
 ;   ALTER TABLE public.locations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    210    211    211            {           2604    25071    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    213    212    213            #          0    25048    cities 
   TABLE DATA           &   COPY public.cities (name) FROM stdin;
    public          postgres    false    209   m8       +          0    25092    events 
   TABLE DATA           ?   COPY public.events (id, name, date_planned, image, description, max_participants, min_age, location_id, organizer_id) FROM stdin;
    public          postgres    false    217   ?8       -          0    25128    events_tags 
   TABLE DATA           9   COPY public.events_tags (event_id, tag_name) FROM stdin;
    public          postgres    false    219   ;9       ,          0    25113    events_users 
   TABLE DATA           9   COPY public.events_users (event_id, user_id) FROM stdin;
    public          postgres    false    218   t9       %          0    25054 	   locations 
   TABLE DATA           \   COPY public.locations (id, title, street, house_number, postal_code, city_name) FROM stdin;
    public          postgres    false    211   ?9       (          0    25076 
   organizers 
   TABLE DATA           7   COPY public.organizers (password, user_id) FROM stdin;
    public          postgres    false    214   _:       )          0    25086    tags 
   TABLE DATA           $   COPY public.tags (name) FROM stdin;
    public          postgres    false    215   ?:       '          0    25068    users 
   TABLE DATA           L   COPY public.users (id, first_name, last_name, birthdate, email) FROM stdin;
    public          postgres    false    213   ?:       8           0    0    events_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.events_id_seq', 1, true);
          public          postgres    false    216            9           0    0    locations_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.locations_id_seq', 7, true);
          public          postgres    false    210            :           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 4, true);
          public          postgres    false    212            ?           2606    25052    cities cities_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (name);
 <   ALTER TABLE ONLY public.cities DROP CONSTRAINT cities_pkey;
       public            postgres    false    209            ?           2606    25102    events events_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.events DROP CONSTRAINT events_pkey;
       public            postgres    false    217            ?           2606    25132    events_tags events_tags_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.events_tags
    ADD CONSTRAINT events_tags_pkey PRIMARY KEY (event_id, tag_name);
 F   ALTER TABLE ONLY public.events_tags DROP CONSTRAINT events_tags_pkey;
       public            postgres    false    219    219            ?           2606    25117    events_users events_users_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.events_users
    ADD CONSTRAINT events_users_pkey PRIMARY KEY (event_id, user_id);
 H   ALTER TABLE ONLY public.events_users DROP CONSTRAINT events_users_pkey;
       public            postgres    false    218    218            ?           2606    25061    locations locations_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.locations DROP CONSTRAINT locations_pkey;
       public            postgres    false    211            ?           2606    25080    organizers organizers_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.organizers
    ADD CONSTRAINT organizers_pkey PRIMARY KEY (user_id);
 D   ALTER TABLE ONLY public.organizers DROP CONSTRAINT organizers_pkey;
       public            postgres    false    214            ?           2606    25090    tags tags_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (name);
 8   ALTER TABLE ONLY public.tags DROP CONSTRAINT tags_pkey;
       public            postgres    false    215            ?           2606    25075    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    213            ?           2606    25103    events events_location_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.locations(id) ON DELETE CASCADE;
 H   ALTER TABLE ONLY public.events DROP CONSTRAINT events_location_id_fkey;
       public          postgres    false    211    3203    217            ?           2606    25108    events events_organizer_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_organizer_id_fkey FOREIGN KEY (organizer_id) REFERENCES public.organizers(user_id) ON DELETE CASCADE;
 I   ALTER TABLE ONLY public.events DROP CONSTRAINT events_organizer_id_fkey;
       public          postgres    false    214    3207    217            ?           2606    25133 %   events_tags events_tags_event_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.events_tags
    ADD CONSTRAINT events_tags_event_id_fkey FOREIGN KEY (event_id) REFERENCES public.events(id) ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.events_tags DROP CONSTRAINT events_tags_event_id_fkey;
       public          postgres    false    217    219    3211            ?           2606    25138 %   events_tags events_tags_tag_name_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.events_tags
    ADD CONSTRAINT events_tags_tag_name_fkey FOREIGN KEY (tag_name) REFERENCES public.tags(name) ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.events_tags DROP CONSTRAINT events_tags_tag_name_fkey;
       public          postgres    false    219    3209    215            ?           2606    25118 '   events_users events_users_event_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.events_users
    ADD CONSTRAINT events_users_event_id_fkey FOREIGN KEY (event_id) REFERENCES public.events(id) ON DELETE CASCADE;
 Q   ALTER TABLE ONLY public.events_users DROP CONSTRAINT events_users_event_id_fkey;
       public          postgres    false    217    3211    218            ?           2606    25123 &   events_users events_users_user_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.events_users
    ADD CONSTRAINT events_users_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;
 P   ALTER TABLE ONLY public.events_users DROP CONSTRAINT events_users_user_id_fkey;
       public          postgres    false    218    3205    213            ?           2606    25062 "   locations locations_city_name_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_city_name_fkey FOREIGN KEY (city_name) REFERENCES public.cities(name) ON UPDATE CASCADE ON DELETE RESTRICT;
 L   ALTER TABLE ONLY public.locations DROP CONSTRAINT locations_city_name_fkey;
       public          postgres    false    209    211    3201            ?           2606    25081 "   organizers organizers_user_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.organizers
    ADD CONSTRAINT organizers_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;
 L   ALTER TABLE ONLY public.organizers DROP CONSTRAINT organizers_user_id_fkey;
       public          postgres    false    214    3205    213            #   5   x??-??L??rJ-????r???O?K?r+J??N+-*??H?M*-J?????? nJ?      +   y   x?E?1
?0Eg???H.???{???,??m,??!׏?R????3<dǤXmW??}Gm?|?4A	?5TR???2??6????ޭ??Š?H?%}??I?ğY??"??|vS??; ??%?      -   )   x?3?,?O?L?ɬJ?2?L???KM.?R2??"?=... ?*
?      ,      x?3?4?2?4?????? ??      %   ?   x?M?A?0E??S????*ܨ$Wl?N?Xڤ????b Mf1?{yaG?????G4??B??pM{kX???c )?.&?+w'????E????=4?d.T?--v?#?N??ɩW(???Vo??+?'6?;??r??J?)?K"??YmkC,?R?툗?V
I??????fՆ1??L?      (      x?˭,(7?4?*??M-(7?4?????? U??      )   4   x?+?O?L?ɬJ??IM,??J???KM.?J??E\IE???i??%\1z\\\ ?h?      '   ?   x?E?1?0???_??Z?fG?SW?#$Ҥ??X??&:????#???ٺ7???3j???5˖;??wY??&??7"i$S\??/^??)?V?u?4????`??q9??Ϯ?¨?h??)????2g     