create table classification(
    classification_id int not null primary key ,
    class_name varchar
);

create table author(
    author_id int not null primary key,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    gender varchar not null,
    birth_date date
);

create table genre(
    genre_id int not null primary key,
    genre_name varchar(50) not null
);

create table author_genre(
    genre_id int not null,
    author_id int not null,
    foreign key (author_id) references author(author_id),
    foreign key (genre_id) references genre(genre_id)
);

create table publishing(
    publishing_id int not null primary key,
    publishing_name varchar(50),
    publishing_rating varchar(50)
);

create table books(
    book_code int not null primary key,
    book_name varchar not null,
    author_id int not null,
    classification_id int not null,
    publishing_id int not null,
    publication_date date not null,
    books_price decimal(10) not null,
    foreign key (classification_id) references classification(classification_id),
    foreign key (author_id) references author(author_id),
    foreign key (publishing_id) references publishing(publishing_id)
);

create table book_genre(
    book_code int not null,
    genre_id int not null,
    foreign key (book_code) references books(book_code),
    foreign key (genre_id) references genre(genre_id)
);

create table customers(
    customer_id int not null primary key,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    date_birth date,
    address varchar(250)
);

create table orders(
    order_id int not null primary key,
    book_code int not null,
    number_of_books int not null,
    price decimal not null,
    amount int not null,
    foreign key (book_code) references books(book_code)
);

create table store(
    store_id int not null primary key,
    store_name varchar not null,
    store_state varchar not null,
    store_city varchar not null
);

create table employee(
    employee_id int not null primary key,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    position varchar not null,
    store_id int not null,
    foreign key (store_id) references store(store_id)
);

create table customer_order(
    order_id int not null,
    customer_id int not null,
    store_id int not null,
    date_order date,
    payment_method varchar not null,
    foreign key (order_id) references orders(order_id),
    foreign key (customer_id) references customers(customer_id),
    foreign key (store_id) references store(store_id)
);

create table warehouse(
    warehouse_id int not null primary key ,
    warehouse_state varchar not null
);

create table warehouse_store(
    warehouse_id int not null,
    store_id int not null,
    foreign key (warehouse_id) references warehouse(warehouse_id),
    foreign key (store_id) references store(store_id)
);

create table warehouse_book(
    warehouse_id int not null,
    book_code int not null,
    number_of_books int not null,
    foreign key (warehouse_id) references warehouse(warehouse_id) ,
    foreign key (book_code) references books(book_code)
);


insert into classification(classification_id, class_name) values (901, 'educational');
insert into classification(classification_id, class_name) values (902, 'popular science');
insert into classification(classification_id, class_name) values (903, 'artistic');
insert into classification(classification_id, class_name) values (904, 'business literature');
insert into classification(classification_id, class_name) values (905, 'company/brand/startup stories');
insert into classification(classification_id, class_name) values (906, 'biographies of famous people');
insert into classification(classification_id, class_name) values (907, 'reference');
insert into classification(classification_id, class_name) values (908, 'historical research/works');

insert into author (author_id, first_name, last_name, gender, birth_date) values (1, 'Archaimbaud', 'Cucuzza', 'Male', '9/2/1976');
insert into author (author_id, first_name, last_name, gender, birth_date) values (2, 'Ruth', 'Shadfourth', 'Female', '25/12/1930');
insert into author (author_id, first_name, last_name, gender, birth_date) values (3, 'Annabell', 'Domoni', 'Female', '5/7/1917');
insert into author (author_id, first_name, last_name, gender, birth_date) values (4, 'Myrtia', 'Fogg', 'Male', '15/3/1973');
insert into author (author_id, first_name, last_name, gender, birth_date) values (5, 'Faustina', 'Simonnet', 'Female', '21/6/2001');
insert into author (author_id, first_name, last_name, gender, birth_date) values (6, 'Donica', 'Kochl', 'Male', '2/1/2002');
insert into author (author_id, first_name, last_name, gender, birth_date) values (7, 'Elbertina', 'Kareman', 'Male', '19/11/1984');
insert into author (author_id, first_name, last_name, gender, birth_date) values (8, 'De', 'Serginson', 'Female', '12/12/2000');
insert into author (author_id, first_name, last_name, gender, birth_date) values (9, 'Georgi', 'Bowyer', 'Male', '8/9/1941');
insert into author (author_id, first_name, last_name, gender, birth_date) values (10, 'Padriac', 'Muffin', 'Female', '26/8/1907');
insert into author (author_id, first_name, last_name, gender, birth_date) values (11, 'Sebastian', 'Hakewell', 'Female', '29/12/1953');
insert into author (author_id, first_name, last_name, gender, birth_date) values (12, 'Tessi', 'Laurens', 'Female', '10/2/1923');
insert into author (author_id, first_name, last_name, gender, birth_date) values (13, 'Gill', 'Ciric', 'Male', '18/2/1930');
insert into author (author_id, first_name, last_name, gender, birth_date) values (14, 'Dacia', 'Flewan', 'Male', '3/12/1981');
insert into author (author_id, first_name, last_name, gender, birth_date) values (15, 'Jermain', 'Ruf', 'Male', '12/8/1998');
insert into author (author_id, first_name, last_name, gender, birth_date) values (16, 'Maria', 'Klisch', 'Female', '27/2/1974');
insert into author (author_id, first_name, last_name, gender, birth_date) values (17, 'Ofelia', 'O'' Scallan', 'Male', '14/6/1999');
insert into author (author_id, first_name, last_name, gender, birth_date) values (18, 'Caddric', 'Orris', 'Male', '7/9/1970');
insert into author (author_id, first_name, last_name, gender, birth_date) values (19, 'Caresse', 'Meijer', 'Male', '29/7/1920');
insert into author (author_id, first_name, last_name, gender, birth_date) values (20, 'Vance', 'Thorpe', 'Female', '3/1/1923');
insert into author (author_id, first_name, last_name, gender, birth_date) values (21, 'Alis', 'Sherred', 'Male', '2/10/1910');
insert into author (author_id, first_name, last_name, gender, birth_date) values (22, 'Benny', 'Beasleigh', 'Female', '23/12/1945');
insert into author (author_id, first_name, last_name, gender, birth_date) values (23, 'Letty', 'Wipper', 'Male', '27/1/1971');
insert into author (author_id, first_name, last_name, gender, birth_date) values (24, 'Brandon', 'Corrigan', 'Male', '12/1/1919');
insert into author (author_id, first_name, last_name, gender, birth_date) values (25, 'Gregoire', 'Vlasenko', 'Male', '2/3/1977');
insert into author (author_id, first_name, last_name, gender, birth_date) values (26, 'Tildy', 'Folan', 'Female', '1/4/1944');
insert into author (author_id, first_name, last_name, gender, birth_date) values (27, 'Lauryn', 'Riggott', 'Male', '22/9/1910');
insert into author (author_id, first_name, last_name, gender, birth_date) values (28, 'Alma', 'Huby', 'Male', '9/2/1932');
insert into author (author_id, first_name, last_name, gender, birth_date) values (29, 'Ethelred', 'Coneley', 'Female', '12/7/1927');
insert into author (author_id, first_name, last_name, gender, birth_date) values (30, 'Karyn', 'Westcar', 'Female', '15/10/1953');
insert into author (author_id, first_name, last_name, gender, birth_date) values (31, 'Alanah', 'Longland', 'Female', '25/9/1978');
insert into author (author_id, first_name, last_name, gender, birth_date) values (32, 'Connie', 'Vipan', 'Male', '15/9/1994');
insert into author (author_id, first_name, last_name, gender, birth_date) values (33, 'Katherina', 'Mackerness', 'Male', '27/2/1995');
insert into author (author_id, first_name, last_name, gender, birth_date) values (34, 'Rosamund', 'Brasner', 'Female', '19/4/1936');
insert into author (author_id, first_name, last_name, gender, birth_date) values (35, 'Petronia', 'Wyldish', 'Male', '25/6/1990');
insert into author (author_id, first_name, last_name, gender, birth_date) values (36, 'Dane', 'Churchward', 'Female', '7/8/1999');
insert into author (author_id, first_name, last_name, gender, birth_date) values (37, 'Rochester', 'Stamp', 'Female', '10/9/1999');
insert into author (author_id, first_name, last_name, gender, birth_date) values (38, 'Marlena', 'Hunsworth', 'Female', '25/1/1962');
insert into author (author_id, first_name, last_name, gender, birth_date) values (39, 'Miguela', 'Iacapucci', 'Female', '20/8/1931');
insert into author (author_id, first_name, last_name, gender, birth_date) values (40, 'Mirna', 'Phuprate', 'Male', '14/9/1941');
insert into author (author_id, first_name, last_name, gender, birth_date) values (41, 'Isabeau', 'Novik', 'Male', '6/11/1961');
insert into author (author_id, first_name, last_name, gender, birth_date) values (42, 'Alard', 'Baress', 'Male', '28/5/1933');
insert into author (author_id, first_name, last_name, gender, birth_date) values (43, 'Olivie', 'Ancell', 'Male', '28/11/1965');
insert into author (author_id, first_name, last_name, gender, birth_date) values (44, 'Lezley', 'Wrout', 'Male', '17/2/1900');
insert into author (author_id, first_name, last_name, gender, birth_date) values (45, 'Laetitia', 'Cutford', 'Male', '18/12/1921');
insert into author (author_id, first_name, last_name, gender, birth_date) values (46, 'Tremain', 'Rummery', 'Female', '13/8/1947');
insert into author (author_id, first_name, last_name, gender, birth_date) values (47, 'Brandy', 'Winckle', 'Male', '1/6/1962');
insert into author (author_id, first_name, last_name, gender, birth_date) values (48, 'Rollins', 'Pickett', 'Female', '9/3/1927');
insert into author (author_id, first_name, last_name, gender, birth_date) values (49, 'Eduard', 'Leyban', 'Female', '21/6/1955');
insert into author (author_id, first_name, last_name, gender, birth_date) values (50, 'Kristyn', 'Matschuk', 'Male', '14/3/1968');

insert into genre (genre_id, genre_name) values (101, 'business books');
insert into genre (genre_id, genre_name) values (102, 'classic literature');
insert into genre (genre_id, genre_name) values (103, 'detectives');
insert into genre (genre_id, genre_name) values (104, 'fantasy');
insert into genre (genre_id, genre_name) values (105, 'fantastic');
insert into genre (genre_id, genre_name) values (106, 'drama');
insert into genre (genre_id, genre_name) values (107, 'novel');
insert into genre (genre_id, genre_name) values (108, 'horror/mystic');
insert into genre (genre_id, genre_name) values (109, 'psychology');
insert into genre (genre_id, genre_name) values (110, 'adventure');
insert into genre (genre_id, genre_name) values (111, 'comics/manga');
insert into genre (genre_id, genre_name) values (112, 'comedy');
insert into genre (genre_id, genre_name) values (113, 'thriller');
insert into genre (genre_id, genre_name) values (114, 'the science');
insert into genre (genre_id, genre_name) values (115, 'religion');

insert into author_genre (genre_id, author_id) values (106, 45); insert into author_genre (genre_id, author_id) values (104, 14);
insert into author_genre (genre_id, author_id) values (110, 6); insert into author_genre (genre_id, author_id) values (111, 30);
insert into author_genre (genre_id, author_id) values (105, 12); insert into author_genre (genre_id, author_id) values (105, 9);
insert into author_genre (genre_id, author_id) values (101, 28); insert into author_genre (genre_id, author_id) values (110, 42);
insert into author_genre (genre_id, author_id) values (106, 12); insert into author_genre (genre_id, author_id) values (115, 46);
insert into author_genre (genre_id, author_id) values (107, 5); insert into author_genre (genre_id, author_id) values (115, 18);
insert into author_genre (genre_id, author_id) values (106, 22); insert into author_genre (genre_id, author_id) values (109, 4);
insert into author_genre (genre_id, author_id) values (106, 22); insert into author_genre (genre_id, author_id) values (111, 36);
insert into author_genre (genre_id, author_id) values (111, 29); insert into author_genre (genre_id, author_id) values (109, 21);
insert into author_genre (genre_id, author_id) values (111, 18); insert into author_genre (genre_id, author_id) values (106, 31);
insert into author_genre (genre_id, author_id) values (106, 19); insert into author_genre (genre_id, author_id) values (102, 31);
insert into author_genre (genre_id, author_id) values (112, 15); insert into author_genre (genre_id, author_id) values (105, 4);
insert into author_genre (genre_id, author_id) values (110, 12); insert into author_genre (genre_id, author_id) values (107, 3);
insert into author_genre (genre_id, author_id) values (109, 29); insert into author_genre (genre_id, author_id) values (107, 41);
insert into author_genre (genre_id, author_id) values (102, 32); insert into author_genre (genre_id, author_id) values (102, 8);
insert into author_genre (genre_id, author_id) values (104, 27); insert into author_genre (genre_id, author_id) values (101, 16);
insert into author_genre (genre_id, author_id) values (112, 21); insert into author_genre (genre_id, author_id) values (107, 11);
insert into author_genre (genre_id, author_id) values (115, 18); insert into author_genre (genre_id, author_id) values (104, 12);
insert into author_genre (genre_id, author_id) values (106, 20); insert into author_genre (genre_id, author_id) values (104, 3);
insert into author_genre (genre_id, author_id) values (114, 41); insert into author_genre (genre_id, author_id) values (110, 10);
insert into author_genre (genre_id, author_id) values (101, 5); insert into author_genre (genre_id, author_id) values (102, 48);
insert into author_genre (genre_id, author_id) values (113, 25); insert into author_genre (genre_id, author_id) values (110, 42);
insert into author_genre (genre_id, author_id) values (103, 2); insert into author_genre (genre_id, author_id) values (115, 28);
insert into author_genre (genre_id, author_id) values (111, 19); insert into author_genre (genre_id, author_id) values (112, 4);
insert into author_genre (genre_id, author_id) values (107, 19); insert into author_genre (genre_id, author_id) values (107, 39);
insert into author_genre (genre_id, author_id) values (109, 1); insert into author_genre (genre_id, author_id) values (109, 13);
insert into author_genre (genre_id, author_id) values (110, 38); insert into author_genre (genre_id, author_id) values (104, 3);
insert into author_genre (genre_id, author_id) values (113, 43); insert into author_genre (genre_id, author_id) values (110, 13);
insert into author_genre (genre_id, author_id) values (112, 11); insert into author_genre (genre_id, author_id) values (106, 7);
insert into author_genre (genre_id, author_id) values (104, 42); insert into author_genre (genre_id, author_id) values (113, 36);
insert into author_genre (genre_id, author_id) values (106, 15); insert into author_genre (genre_id, author_id) values (102, 43);
insert into author_genre (genre_id, author_id) values (111, 27); insert into author_genre (genre_id, author_id) values (112, 5);
insert into author_genre (genre_id, author_id) values (109, 44); insert into author_genre (genre_id, author_id) values (106, 50);
insert into author_genre (genre_id, author_id) values (115, 17); insert into author_genre (genre_id, author_id) values (113, 3);
insert into author_genre (genre_id, author_id) values (112, 12); insert into author_genre (genre_id, author_id) values (109, 17);
insert into author_genre (genre_id, author_id) values (112, 22); insert into author_genre (genre_id, author_id) values (110, 20);
insert into author_genre (genre_id, author_id) values (102, 26); insert into author_genre (genre_id, author_id) values (112, 28);
insert into author_genre (genre_id, author_id) values (101, 28); insert into author_genre (genre_id, author_id) values (111, 18);
insert into author_genre (genre_id, author_id) values (109, 18); insert into author_genre (genre_id, author_id) values (110, 19);
insert into author_genre (genre_id, author_id) values (106, 42); insert into author_genre (genre_id, author_id) values (106, 48);
insert into author_genre (genre_id, author_id) values (113, 31); insert into author_genre (genre_id, author_id) values (115, 33);
insert into author_genre (genre_id, author_id) values (107, 37); insert into author_genre (genre_id, author_id) values (109, 10);
insert into author_genre (genre_id, author_id) values (111, 41); insert into author_genre (genre_id, author_id) values (102, 17);
insert into author_genre (genre_id, author_id) values (102, 18); insert into author_genre (genre_id, author_id) values (108, 3);
insert into author_genre (genre_id, author_id) values (101, 16); insert into author_genre (genre_id, author_id) values (115, 38);
insert into author_genre (genre_id, author_id) values (107, 32); insert into author_genre (genre_id, author_id) values (113, 15);
insert into author_genre (genre_id, author_id) values (109, 48); insert into author_genre (genre_id, author_id) values (113, 47);
insert into author_genre (genre_id, author_id) values (103, 22); insert into author_genre (genre_id, author_id) values (101, 41);
insert into author_genre (genre_id, author_id) values (103, 21); insert into author_genre (genre_id, author_id) values (111, 14);
insert into author_genre (genre_id, author_id) values (110, 36); insert into author_genre (genre_id, author_id) values (104, 24);

insert into publishing(publishing_id, publishing_name, publishing_rating) values (501, 'Pearson', 1);
insert into publishing(publishing_id, publishing_name, publishing_rating) values (502, 'RELX', 2);
insert into publishing(publishing_id, publishing_name, publishing_rating) values (503, 'Thomson Reuters', 3);
insert into publishing(publishing_id, publishing_name, publishing_rating) values (504, 'Penguin Random House', 4);
insert into publishing(publishing_id, publishing_name, publishing_rating) values (505, 'Hachette Livre', 5);
insert into publishing(publishing_id, publishing_name, publishing_rating) values (506, 'HarperCollins', 6);
insert into publishing(publishing_id, publishing_name, publishing_rating) values (507, 'Macmillan Publishers', 7);
insert into publishing(publishing_id, publishing_name, publishing_rating) values (508, 'Bertelsmann', 8);
insert into publishing(publishing_id, publishing_name, publishing_rating) values (509, 'Scholastic Corporation', 9);
insert into publishing(publishing_id, publishing_name, publishing_rating) values (510, 'McGraw-Hill Education', 10);

insert into books values (1001, 'Graphical User Interface', 21, 902, 504, '11/11/2000', 85.73);insert into books values (1002, 'task-force', 16, 901, 507, '27/12/1951', 39.99);
insert into books values (1003, 'fault-tolerant', 23, 904, 508, '22/01/2003', 57.01);insert into books values (1004, 'matrices', 45, 908, 501, '07/05/2017', 60.13);
insert into books values (1005, 'Multi-layered', 47, 906, 502, '07/11/2010', 97.7);insert into books values (1006, 'attitude', 43, 903, 510, '12/08/1927', 50.03);
insert into books values (1007, 'analyzer', 21, 903, 504, '26/08/2015', 61.94);insert into books values (1008, 'product', 12, 902, 505, '03/03/1986', 90.7);
insert into books values (1009, 'system-worthy', 39, 905, 506, '24/12/1967', 68.58);insert into books values (1010, 'directional', 20, 907, 507, '27/06/1924', 85.74);
insert into books values (1011, 'middleware', 34, 904, 507, '22/01/2003', 25.83);insert into books values (1012, 'systemic', 40, 902, 508, '11/10/1965', 15.41);
insert into books values (1013, 'Team-oriented', 21, 905, 510, '02/12/1966', 65.69);insert into books values (1014, 'intranet', 13, 905, 508, '15/04/1969', 18.55);
insert into books values (1015, 'productivity', 25, 908, 502, '08/01/1947', 75.46);insert into books values (1016, 'foreground', 28, 903, 505, '30/05/1939', 36.45);
insert into books values (1017, 'zero defect', 26, 902, 503, '05/04/1997', 85.49);insert into books values (1018, 'stable', 5, 905, 501, '15/03/2002', 80.73);
insert into books values (1019, 'pricing structure', 40, 906, 502, '13/02/1926', 66.95);insert into books values (1020, 'Secured', 36, 905, 502, '28/11/1981', 75.2);
insert into books values (1021, 'Inverse', 26, 901, 504, '07/05/1965', 84.05);insert into books values (1022, 'definition', 29, 902, 507, '16/12/1935', 72.18);
insert into books values (1023, 'portal', 45, 907, 505, '04/01/1931', 18.38);insert into books values (1024, 'model', 17, 908, 509, '27/03/1941', 66.18);
insert into books values (1025, 'systemic', 8, 902, 508, '24/06/1978', 79.94);insert into books values (1026, 'bandwidth-monitored', 35, 907, 501, '23/05/1936', 74.2);
insert into books values (1027, 'budgetary management', 41, 902, 507, '26/04/1967', 61.84);insert into books values (1028, 'Secured', 49, 907, 505, '01/01/2004', 37.76);
insert into books values (1029, 'User-friendly', 48, 904, 504, '13/09/1987', 92.7);insert into books values (1030, 'hub', 4, 907, 506, '16/10/1953', 34.24);
insert into books values (1031, 'upward-trending', 6, 905, 507, '27/05/2010', 26.08);insert into books values (1032, 'Pre-emptive', 49, 908, 510, '06/10/2008', 92.42);
insert into books values (1033, 'Organic', 30, 905, 506, '26/08/1927', 33.85);insert into books values (1034, 'data-warehouse', 43, 906, 504, '02/11/1988', 15.92);
insert into books values (1035, 'user-facing', 26, 906, 501, '14/10/1928', 12.3);insert into books values (1036, 'well-modulated', 46, 908, 502, '03/04/1985', 77.53);
insert into books values (1037, 'neural-net', 11, 906, 509, '12/02/1976', 86.15);insert into books values (1038, 'systematic', 23, 904, 510, '06/07/1974', 20.3);
insert into books values (1039, 'Triple-buffered', 32, 904, 502, '28/02/1922', 91.71);insert into books values (1040, 'protocol', 31, 904, 509, '11/07/1931', 57.36);
insert into books values (1041, 'Graphical User Interface', 47, 905, 502, '10/04/2007', 19.54);insert into books values (1042, 'Proactive', 40, 904, 505, '20/11/1962', 76.38);
insert into books values (1043, 'clear-thinking', 21, 903, 505, '19/04/2019', 20.92);insert into books values (1044, 'internet solution', 15, 906, 504, '13/03/1950', 98.56);
insert into books values (1045, 'next generation', 24, 907, 506, '03/01/1995', 64.21);insert into books values (1046, 'methodology', 48, 902, 510, '16/07/1992', 23.38);
insert into books values (1047, 'strategy', 38, 901, 505, '07/05/1943', 36.35);insert into books values (1048, '3rd generation', 37, 902, 509, '18/07/2010', 59.78);
insert into books values (1049, 'Implemented', 34, 907, 505, '20/08/1925', 81.04);insert into books values (1050, 'process improvement', 10, 903, 503, '06/10/2004', 89.22);
insert into books values (1051, 'fresh-thinking', 41, 903, 510, '10/02/1982', 88.68);insert into books values (1052, 'Face to face', 3, 905, 504, '24/04/1927', 88.5);
insert into books values (1053, 'Fundamental', 29, 904, 508, '16/12/1970', 62.03);insert into books values (1054, 'full-range', 16, 901, 510, '05/08/1929', 13.65);
insert into books values (1055, 'attitude-oriented', 2, 905, 508, '18/04/1944', 33.86);insert into books values (1056, 'moderator', 26, 903, 504, '28/08/1990', 28.8);
insert into books values (1057, 'motivating', 32, 901, 508, '22/05/1951', 45.14);insert into books values (1058, 'full-range', 27, 904, 507, '21/05/1974', 70.29);
insert into books values (1059, 'Reverse-engineered', 37, 904, 505, '18/06/1976', 91.28);insert into books values (1060, 'full-range', 15, 904, 503, '21/08/2015', 88.91);
insert into books values (1061, 'fault-tolerant', 46, 907, 509, '28/03/1961', 53.8);insert into books values (1062, 'Assimilated', 22, 906, 506, '27/01/1979', 58.62);
insert into books values (1063, 'Team-oriented', 31, 903, 501, '02/09/1974', 24.12);insert into books values (1064, '3rd generation', 47, 908, 509, '31/03/1975', 74.92);
insert into books values (1065, 'Reduced', 13, 904, 507, '18/04/2005', 26.87);insert into books values (1066, 'parallelism', 32, 904, 507, '14/03/1960', 31.44);
insert into books values (1067, 'database', 13, 908, 504, '24/10/1992', 84.08);insert into books values (1068, '6th generation', 25, 908, 506, '28/07/2018', 26.11);
insert into books values (1069, 'clear-thinking', 45, 907, 506, '03/05/1926', 13.44);insert into books values (1070, 'Optimized', 5, 908, 510, '11/07/1978', 83.05);
insert into books values (1071, 'scalable', 12, 903, 506, '24/03/2016', 86.59);insert into books values (1072, 'intangible', 45, 907, 506, '19/08/1927', 55.39);
insert into books values (1073, 'system engine', 34, 905, 501, '31/05/1984', 51.53);insert into books values (1074, 'Vision-oriented', 29, 907, 507, '11/03/2014', 37.23);
insert into books values (1075, 'client-driven', 26, 905, 508, '26/09/2012', 50.8);insert into books values (1076, 'framework', 38, 901, 505, '26/07/1992', 80.93);
insert into books values (1077, 'analyzing', 13, 902, 505, '17/03/1997', 30.25);insert into books values (1078, 'optimizing', 41, 905, 509, '20/09/1973', 43.5);
insert into books values (1079, 'algorithm', 25, 908, 503, '10/12/1951', 40.3);insert into books values (1080, 'executive', 34, 903, 510, '26/10/2015', 35.45);
insert into books values (1081, 'Down-sized', 2, 904, 509, '13/01/1998', 44.49);insert into books values (1082, 'Extended', 2, 907, 508, '09/09/1933', 47.96);
insert into books values (1083, 'open architecture', 9, 905, 502, '11/09/1971', 77.0);insert into books values (1084, 'methodical', 21, 904, 507, '06/08/2020', 81.29);
insert into books values (1085, 'local', 3, 907, 502, '01/04/1989', 70.32);insert into books values (1086, 'Monitored', 15, 901, 507, '09/05/1958', 50.64);
insert into books values (1087, 'exuding', 9, 905, 506, '21/09/2013', 21.02);insert into books values (1088, 'infrastructure', 26, 903, 504, '13/06/1933', 99.54);
insert into books values (1089, 'Ergonomic', 29, 908, 506, '21/05/1943', 28.04);insert into books values (1090, 'Stand-alone', 25, 908, 506, '25/06/1952', 71.14);
insert into books values (1091, 'bottom-line', 12, 906, 510, '19/11/2016', 21.07);insert into books values (1092, 'fault-tolerant', 5, 906, 504, '15/10/1986', 22.91);
insert into books values (1093, 'approach', 2, 901, 502, '12/02/1954', 57.91);insert into books values (1094, 'actuating', 42, 905, 506, '24/07/1922', 27.16);
insert into books values (1095, 'interface', 2, 908, 509, '17/07/1981', 53.86);insert into books values (1096, 'Mandatory', 4, 902, 509, '16/10/1959', 37.87);
insert into books values (1097, 'productivity', 33, 902, 503, '10/12/1990', 90.02);insert into books values (1098, 'uniform', 25, 908, 504, '15/12/1993', 65.12);
insert into books values (1099, 'matrices', 2, 907, 509, '16/10/1923', 10.01);insert into books values (1100, 'Profit-focused', 30, 907, 505, '06/03/1993', 63.27);

insert into book_genre (book_code, genre_id) values (1003, 104);insert into book_genre (book_code, genre_id) values (1009, 111);insert into book_genre (book_code, genre_id) values (1006, 104);
insert into book_genre (book_code, genre_id) values (1072, 110);insert into book_genre (book_code, genre_id) values (1057, 115);insert into book_genre (book_code, genre_id) values (1025, 110);
insert into book_genre (book_code, genre_id) values (1041, 115);insert into book_genre (book_code, genre_id) values (1038, 110);insert into book_genre (book_code, genre_id) values (1099, 114);
insert into book_genre (book_code, genre_id) values (1035, 110);insert into book_genre (book_code, genre_id) values (1088, 103);insert into book_genre (book_code, genre_id) values (1023, 113);
insert into book_genre (book_code, genre_id) values (1009, 115);insert into book_genre (book_code, genre_id) values (1041, 110);insert into book_genre (book_code, genre_id) values (1027, 102);
insert into book_genre (book_code, genre_id) values (1093, 103);insert into book_genre (book_code, genre_id) values (1033, 110);insert into book_genre (book_code, genre_id) values (1053, 104);
insert into book_genre (book_code, genre_id) values (1004, 105);insert into book_genre (book_code, genre_id) values (1025, 111);insert into book_genre (book_code, genre_id) values (1005, 114);
insert into book_genre (book_code, genre_id) values (1020, 110);insert into book_genre (book_code, genre_id) values (1078, 109);insert into book_genre (book_code, genre_id) values (1054, 110);
insert into book_genre (book_code, genre_id) values (1085, 112);insert into book_genre (book_code, genre_id) values (1064, 101);insert into book_genre (book_code, genre_id) values (1068, 106);
insert into book_genre (book_code, genre_id) values (1018, 112);insert into book_genre (book_code, genre_id) values (1095, 105);insert into book_genre (book_code, genre_id) values (1009, 114);
insert into book_genre (book_code, genre_id) values (1057, 109);insert into book_genre (book_code, genre_id) values (1021, 115);insert into book_genre (book_code, genre_id) values (1043, 107);
insert into book_genre (book_code, genre_id) values (1041, 112);insert into book_genre (book_code, genre_id) values (1071, 108);insert into book_genre (book_code, genre_id) values (1078, 110);
insert into book_genre (book_code, genre_id) values (1048, 113);insert into book_genre (book_code, genre_id) values (1094, 110);insert into book_genre (book_code, genre_id) values (1039, 107);
insert into book_genre (book_code, genre_id) values (1100, 114);insert into book_genre (book_code, genre_id) values (1083, 111);insert into book_genre (book_code, genre_id) values (1063, 102);
insert into book_genre (book_code, genre_id) values (1007, 111);insert into book_genre (book_code, genre_id) values (1042, 104);insert into book_genre (book_code, genre_id) values (1063, 102);
insert into book_genre (book_code, genre_id) values (1061, 107);insert into book_genre (book_code, genre_id) values (1052, 107);insert into book_genre (book_code, genre_id) values (1072, 111);
insert into book_genre (book_code, genre_id) values (1062, 105);insert into book_genre (book_code, genre_id) values (1058, 111);insert into book_genre (book_code, genre_id) values (1024, 102);
insert into book_genre (book_code, genre_id) values (1060, 103);insert into book_genre (book_code, genre_id) values (1084, 106);insert into book_genre (book_code, genre_id) values (1100, 110);
insert into book_genre (book_code, genre_id) values (1063, 105);insert into book_genre (book_code, genre_id) values (1019, 106);insert into book_genre (book_code, genre_id) values (1030, 111);
insert into book_genre (book_code, genre_id) values (1089, 111);insert into book_genre (book_code, genre_id) values (1018, 114);insert into book_genre (book_code, genre_id) values (1053, 111);
insert into book_genre (book_code, genre_id) values (1074, 101);insert into book_genre (book_code, genre_id) values (1085, 110);insert into book_genre (book_code, genre_id) values (1077, 104);
insert into book_genre (book_code, genre_id) values (1050, 103);insert into book_genre (book_code, genre_id) values (1069, 108);insert into book_genre (book_code, genre_id) values (1011, 114);
insert into book_genre (book_code, genre_id) values (1080, 112);insert into book_genre (book_code, genre_id) values (1089, 110);insert into book_genre (book_code, genre_id) values (1031, 106);
insert into book_genre (book_code, genre_id) values (1098, 113);insert into book_genre (book_code, genre_id) values (1004, 112);insert into book_genre (book_code, genre_id) values (1077, 101);
insert into book_genre (book_code, genre_id) values (1084, 103);insert into book_genre (book_code, genre_id) values (1093, 111);insert into book_genre (book_code, genre_id) values (1004, 102);
insert into book_genre (book_code, genre_id) values (1093, 105);insert into book_genre (book_code, genre_id) values (1022, 112);insert into book_genre (book_code, genre_id) values (1086, 112);
insert into book_genre (book_code, genre_id) values (1062, 114);insert into book_genre (book_code, genre_id) values (1076, 114);insert into book_genre (book_code, genre_id) values (1042, 112);
insert into book_genre (book_code, genre_id) values (1062, 115);insert into book_genre (book_code, genre_id) values (1034, 109);insert into book_genre (book_code, genre_id) values (1062, 111);
insert into book_genre (book_code, genre_id) values (1079, 107);insert into book_genre (book_code, genre_id) values (1038, 101);insert into book_genre (book_code, genre_id) values (1099, 103);
insert into book_genre (book_code, genre_id) values (1078, 110);insert into book_genre (book_code, genre_id) values (1089, 114);insert into book_genre (book_code, genre_id) values (1098, 108);
insert into book_genre (book_code, genre_id) values (1049, 103);insert into book_genre (book_code, genre_id) values (1098, 111);insert into book_genre (book_code, genre_id) values (1063, 111);
insert into book_genre (book_code, genre_id) values (1032, 104);insert into book_genre (book_code, genre_id) values (1030, 111);insert into book_genre (book_code, genre_id) values (1100, 113);
insert into book_genre (book_code, genre_id) values (1011, 112);insert into book_genre (book_code, genre_id) values (1004, 108);insert into book_genre (book_code, genre_id) values (1096, 108);
insert into book_genre (book_code, genre_id) values (1048, 114);insert into book_genre (book_code, genre_id) values (1018, 112);insert into book_genre (book_code, genre_id) values (1025, 107);
insert into book_genre (book_code, genre_id) values (1082, 112);insert into book_genre (book_code, genre_id) values (1096, 106);insert into book_genre (book_code, genre_id) values (1017, 103);
insert into book_genre (book_code, genre_id) values (1062, 109);insert into book_genre (book_code, genre_id) values (1005, 104);insert into book_genre (book_code, genre_id) values (1076, 115);
insert into book_genre (book_code, genre_id) values (1066, 102);insert into book_genre (book_code, genre_id) values (1058, 108);insert into book_genre (book_code, genre_id) values (1067, 109);
insert into book_genre (book_code, genre_id) values (1022, 107);insert into book_genre (book_code, genre_id) values (1071, 112);insert into book_genre (book_code, genre_id) values (1049, 105);
insert into book_genre (book_code, genre_id) values (1096, 107);insert into book_genre (book_code, genre_id) values (1085, 110);insert into book_genre (book_code, genre_id) values (1074, 108);
insert into book_genre (book_code, genre_id) values (1036, 103);insert into book_genre (book_code, genre_id) values (1063, 103);insert into book_genre (book_code, genre_id) values (1033, 108);
insert into book_genre (book_code, genre_id) values (1008, 106);insert into book_genre (book_code, genre_id) values (1017, 103);insert into book_genre (book_code, genre_id) values (1002, 107);
insert into book_genre (book_code, genre_id) values (1057, 108);insert into book_genre (book_code, genre_id) values (1055, 108);insert into book_genre (book_code, genre_id) values (1057, 115);
insert into book_genre (book_code, genre_id) values (1056, 107);insert into book_genre (book_code, genre_id) values (1087, 114);insert into book_genre (book_code, genre_id) values (1025, 114);
insert into book_genre (book_code, genre_id) values (1077, 113);insert into book_genre (book_code, genre_id) values (1072, 109);insert into book_genre (book_code, genre_id) values (1025, 109);
insert into book_genre (book_code, genre_id) values (1090, 105);insert into book_genre (book_code, genre_id) values (1068, 113);insert into book_genre (book_code, genre_id) values (1074, 104);
insert into book_genre (book_code, genre_id) values (1006, 115);insert into book_genre (book_code, genre_id) values (1026, 104);insert into book_genre (book_code, genre_id) values (1028, 106);
insert into book_genre (book_code, genre_id) values (1004, 114);insert into book_genre (book_code, genre_id) values (1064, 111);insert into book_genre (book_code, genre_id) values (1035, 115);
insert into book_genre (book_code, genre_id) values (1097, 106);insert into book_genre (book_code, genre_id) values (1096, 103);insert into book_genre (book_code, genre_id) values (1081, 113);
insert into book_genre (book_code, genre_id) values (1028, 108);insert into book_genre (book_code, genre_id) values (1057, 107);insert into book_genre (book_code, genre_id) values (1095, 115);
insert into book_genre (book_code, genre_id) values (1071, 101);insert into book_genre (book_code, genre_id) values (1078, 105);insert into book_genre (book_code, genre_id) values (1052, 103);

insert into customers (customer_id, first_name, last_name, date_birth, address) values (70, 'Arther', 'Canet', '04/02/1958', 'Las Vegas');
insert into customers (customer_id, first_name, last_name, date_birth, address) values (71, 'Ranique', 'Swainston', '06/05/1962', 'Las Vegas');
insert into customers (customer_id, first_name, last_name, date_birth, address) values (72, 'Brit', 'Joslow', '25/01/1955', 'Las Vegas');
insert into customers (customer_id, first_name, last_name, date_birth, address) values (73, 'Giffer', 'Hartgill', '15/10/1959', 'Los Angeles');
insert into customers (customer_id, first_name, last_name, date_birth, address) values (74, 'Ingrid', 'Pirolini', '26/12/1975', 'Los Angeles');
insert into customers (customer_id, first_name, last_name, date_birth, address) values (75, 'Silvain', 'Vasyuchov', '29/11/1981', 'Los Angeles');
insert into customers (customer_id, first_name, last_name, date_birth, address) values (76, 'Kimberlyn', 'Addicott', '22/08/1964', 'Los Angeles');
insert into customers (customer_id, first_name, last_name, date_birth, address) values (77, 'Bat', 'Greenhaugh', '12/03/1957', 'Orlando');
insert into customers (customer_id, first_name, last_name, date_birth, address) values (78, 'Nevil', 'Benoiton', '21/12/1988', 'Orlando');
insert into customers (customer_id, first_name, last_name, date_birth, address) values (79, 'Augusto', 'Colafate', '25/02/1977', 'Dallas');
insert into customers (customer_id, first_name, last_name, date_birth, address) values (80, 'Mariana', 'Rudyard', '01/10/2004', 'Dallas');
insert into customers (customer_id, first_name, last_name, date_birth, address) values (81, 'Hildegarde', 'Callear', '14/10/1956', 'Dallas');
insert into customers (customer_id, first_name, last_name, date_birth, address) values (82, 'Wash', 'Daniellot', '30/04/1959', 'Dallas');
insert into customers (customer_id, first_name, last_name, date_birth, address) values (83, 'Moselle', 'Redrup', '17/03/1996', 'Dallas');
insert into customers (customer_id, first_name, last_name, date_birth, address) values (84, 'Bridget', 'Acock', '10/10/1986', 'San Diego');
insert into customers (customer_id, first_name, last_name, date_birth, address) values (85, 'Ilsa', 'Spawell', '03/12/1973', 'San Diego');
insert into customers (customer_id, first_name, last_name, date_birth, address) values (86, 'Gilbert', 'Bury', '20/10/1979', 'Miami');
insert into customers (customer_id, first_name, last_name, date_birth, address) values (87, 'Meghan', 'Ranscome', '06/12/1957', 'Miami');
insert into customers (customer_id, first_name, last_name, date_birth, address) values (88, 'Diann', 'Galego', '16/04/1961', 'Miami');
insert into customers (customer_id, first_name, last_name, date_birth, address) values (89, 'Robby', 'Izatson', '24/09/1981', 'Miami');
insert into customers (customer_id, first_name, last_name, date_birth, address) values (90, 'Ynes', 'Andren', '18/04/1987', 'Henderson');
insert into customers (customer_id, first_name, last_name, date_birth, address) values (91, 'Zebadiah', 'Pratty', '15/11/1979', 'Henderson');
insert into customers (customer_id, first_name, last_name, date_birth, address) values (92, 'Francine', 'Huggen', '23/10/1957', 'Henderson');
insert into customers (customer_id, first_name, last_name, date_birth, address) values (93, 'Alyssa', 'Woodroff', '24/10/1984', 'Henderson');
insert into customers (customer_id, first_name, last_name, date_birth, address) values (94, 'Silvain', 'Swinfon', '03/08/1957', 'Henderson');
insert into customers (customer_id, first_name, last_name, date_birth, address) values (95, 'Jude', 'Landsborough', '30/05/1982', 'San Antonio');
insert into customers (customer_id, first_name, last_name, date_birth, address) values (96, 'Patsy', 'MacRorie', '29/05/2004', 'San Antonio');
insert into customers (customer_id, first_name, last_name, date_birth, address) values (97, 'Romona', 'Ascroft', '17/09/1980', 'San Antonio');
insert into customers (customer_id, first_name, last_name, date_birth, address) values (98, 'Lisha', 'Durban', '18/07/1999', 'San Antonio');
insert into customers (customer_id, first_name, last_name, date_birth, address) values (99, 'Bentley', 'Vassel', '21/05/1986', 'San Antonio');

insert into orders values(1, 1001, 2, 86, 2*86);insert into orders values(21, 1056, 10, 29, 10*29);insert into orders values(41, 1057, 2, 45, 2*45);
insert into orders values(2, 1002, 3, 40, 3*40);insert into orders values(22, 1065, 1, 27, 1*27);insert into orders values(42, 1052, 1, 89, 1*89);
insert into orders values(3, 1003, 4, 57, 4*57);insert into orders values(23, 1071, 2, 87, 2*87);insert into orders values(43, 1053, 2, 62, 2*62);
insert into orders values(4, 1004, 2, 60, 2*60);insert into orders values(24, 1075, 3, 51, 3*51);insert into orders values(44, 1100, 3, 63, 3*63);
insert into orders values(5, 1087, 1, 21, 1*21);insert into orders values(25, 1077, 5, 30, 5*30);insert into orders values(45, 1093, 2, 58, 2*58);
insert into orders values(6, 1001, 1, 86, 1*86);insert into orders values(26, 1039, 6, 92, 6*92);insert into orders values(46, 1023, 2, 18, 2*18);
insert into orders values(7, 1100, 6, 63, 6*63);insert into orders values(27, 1047, 4, 36, 4*36);insert into orders values(47, 1027, 1, 62, 1*62);
insert into orders values(8, 1012, 4, 15, 4*15);insert into orders values(28, 1089, 7, 28, 7*28);insert into orders values(48, 1049, 1, 81, 1*81);
insert into orders values(9, 1043, 8, 21, 8*21);insert into orders values(29, 1098, 9, 65, 9*65);insert into orders values(49, 1058, 4, 70, 4*70);
insert into orders values(10, 1034, 4, 16, 4*16);insert into orders values(30, 1099, 8, 10, 8*10);insert into orders values(50, 1059, 3, 91, 3*91);
insert into orders values(11, 1067, 3, 86, 3*84);insert into orders values(31, 1002, 2, 40, 2*40);insert into orders values(51, 1027, 6, 62, 6*62);
insert into orders values(12, 1087, 3, 21, 3*21);insert into orders values(32, 1001, 2, 86, 2*86);insert into orders values(52, 1065, 7, 27, 7*27);
insert into orders values(13, 1024, 3, 66, 3*66);insert into orders values(33, 1045, 1, 64, 1*64);insert into orders values(53, 1048, 4, 60, 4*60);
insert into orders values(14, 1098, 2, 65, 2*65);insert into orders values(34, 1054, 3, 14, 3*14);insert into orders values(54, 1084, 3, 81, 3*81);
insert into orders values(15, 1099, 1, 10, 1*10);insert into orders values(35, 1065, 9, 27, 9*27);insert into orders values(55, 1093, 9, 53, 9*53);
insert into orders values(16, 1009, 1, 69, 1*69);insert into orders values(36, 1079, 8, 40, 8*40);insert into orders values(56, 1014, 6, 19, 6*19);
insert into orders values(17, 1006, 2, 50, 2*50);insert into orders values(37, 1041, 5, 20, 5*20);insert into orders values(57, 1001, 5, 86, 5*86);
insert into orders values(18, 1005, 2, 98, 2*98);insert into orders values(38, 1042, 2, 76, 2*76);insert into orders values(58, 1018, 2, 81, 2*81);
insert into orders values(19, 1032, 4, 92, 4*92);insert into orders values(39, 1056, 1, 29, 2*29);insert into orders values(59, 1033, 1, 34, 1*34);
insert into orders values(20, 1056, 5, 29, 5*29);insert into orders values(40, 1057, 6, 45, 6*45);insert into orders values(60, 1061, 3, 54, 3*54);

insert into store values (1, 'Bayer, Trantow and McDermott', 'California', 'Los Angeles');
insert into store values (2, 'Russel-Farrell', 'Texas', 'San Antonio');
insert into store values (3, 'Nienow, Runolfsson and Herman', 'Florida', 'Miami');
insert into store values (4, 'Wiza Group', 'Nevada', 'Henderson');
insert into store values (5, 'Lynch LLC', 'California', 'San Diego');
insert into store values (6, 'Haag Inc', 'Texas', 'Dallas');
insert into store values (7, 'Roob-Bergnaum', 'Florida', 'Orlando');
insert into store values (8, 'Hagenes, Lubowitz and Schmeler', 'Nevada', 'Las Vegas');

insert into employee values (1, 'Gery', 'Fitzsimmons', 'сashier', 1);insert into employee values (2, 'Ursala', 'Shilleto', 'cashier', 1);
insert into employee values (3, 'Verina', 'Ortiga', 'administrator', 1);insert into employee values (4, 'Juliet', 'Pirelli', 'consultant', 1);
insert into employee values (5, 'Pamela', 'Whines', 'consultant', 1);insert into employee values (6, 'Mercy', 'Wallbank', 'security', 1);--1
insert into employee values (7, 'Mignonne', 'Cubin', 'cashier', 2);insert into employee values (8, 'Edgar', 'Gitsham', 'cashier', 2);
insert into employee values (9, 'Anthe', 'Sifleet', 'administrator', 2);insert into employee values (10, 'Skelly', 'Innwood', 'consultant', 2);
insert into employee values (11, 'Reggis', 'Mell', 'consultant', 2);insert into employee values (12, 'Rowen', 'Bridgland', 'security', 2);    --2
insert into employee values (13, 'Devon', 'O''Nowlan', 'cashier', 3);insert into employee values (14, 'Javier', 'Iddon', 'cashier', 3);
insert into employee values (15, 'Carmencita', 'Pitcock', 'administrator', 3);insert into employee values (16, 'Bastian', 'Connett', 'consultant', 3);
insert into employee values (17, 'Becki', 'Raye', 'consultant', 3);insert into employee values (18, 'Cori', 'Loveridge', 'security', 3);--3
insert into employee values (19, 'Gloriane', 'Gookey', 'cashier', 4);insert into employee values (20, 'Craggie', 'Walby', 'cashier', 4);
insert into employee values (21, 'Phylis', 'Causbey', 'administrator', 4);insert into employee values (22, 'Barbey', 'Crispin', 'consultant', 4);
insert into employee values (23, 'Gizela', 'Sent', 'consultant', 4);insert into employee values (24, 'Eleonore', 'Cannaway', 'security', 4);--4
insert into employee values (25, 'Tades', 'Wolfendale', 'cashier', 5);insert into employee values (26, 'Stu', 'Montes', 'cashier', 5);
insert into employee values (27, 'Giulia', 'Mashal', 'administrator', 5);insert into employee values (28, 'Gabbie', 'Bentsen', 'consultant', 5);
insert into employee values (29, 'Sherwood', 'Aslum', 'consultant', 5);insert into employee values (30, 'Dalli', 'Iffe', 'security', 5);--5
insert into employee values (31, 'Faye', 'Pirdy', 'cashier', 6);insert into employee values (32, 'Rowena', 'Akester', 'cashier', 6);
insert into employee values (33, 'Cicily', 'Stampfer', 'administrator', 6);insert into employee values (34, 'Fred', 'Pelzer', 'consultant', 6);
insert into employee values (35, 'Cleve', 'Abrami', 'consultant', 6);insert into employee values (36, 'Pattie', 'Arran', 'security', 6);--6
insert into employee values (37, 'Whit', 'Hurdis', 'cashier', 7);insert into employee values (38, 'Krystle', 'Sperring', 'cashier', 7);
insert into employee values (39, 'Barbette', 'Craigie', 'administrator', 7);insert into employee values (40, 'Patrica', 'Wortman', 'consultant', 7);
insert into employee values (41, 'Ancell', 'Gunby', 'consultant', 7);insert into employee values (42, 'Ortensia', 'Skeels', 'security', 7);--7
insert into employee values (43, 'Ilario', 'Follis', 'cashier', 8);insert into employee values (44, 'Agnese', 'Daulton', 'cashier', 8);
insert into employee values (45, 'Zorana', 'Mifflin', 'administrator', 8);insert into employee values (46, 'Engracia', 'Welton', 'consultant', 8);
insert into employee values (47, 'Jud', 'Dugue', 'consultant', 8);insert into employee values (48, 'Prinz', 'Jessep', 'security', 8);--8


insert into customer_order values (1, 70, 8, '18/05/2017', 'online');insert into customer_order values (2, 70, 8, '08/02/2015', 'cash');
insert into customer_order values (3, 71, 8, '16/11/2013', 'card');insert into customer_order values (4, 71, 8, '21/07/2014', 'online');
insert into customer_order values (5, 72, 8, '28/11/2019', 'cash');insert into customer_order values (6, 72, 8, '30/04/2013', 'card');
insert into customer_order values (7, 73, 1, '22/02/2017', 'online');insert into customer_order values (8, 73, 1, '28/02/2011', 'cash');
insert into customer_order values (9, 74, 1, '11/09/2017', 'card');insert into customer_order values (10, 74, 1, '26/01/2021', 'online');
insert into customer_order values (11, 75, 1, '02/05/2013', 'cash');insert into customer_order values (12, 75, 1, '16/09/2020', 'card');
insert into customer_order values (13, 76, 1, '25/11/2011', 'online');insert into customer_order values (14, 76, 1, '14/01/2014', 'cash');
insert into customer_order values (15, 77, 7, '14/08/2012', 'card');insert into customer_order values (16, 77, 7, '22/06/2012', 'online');
insert into customer_order values (17, 78, 7, '07/05/2015', 'cash');insert into customer_order values (18, 78, 7, '11/11/2011', 'card');
insert into customer_order values (19, 79, 6, '04/12/2012', 'online');insert into customer_order values (20, 79, 6, '30/03/2011', 'cash');
insert into customer_order values (21, 80, 6, '24/05/2018', 'card');insert into customer_order values (22, 80, 6, '30/01/2012', 'online');
insert into customer_order values (23, 81, 6, '20/02/2021', 'cash');insert into customer_order values (24, 81, 6, '16/08/2018', 'card');
insert into customer_order values (25, 82, 6, '13/02/2012', 'online');insert into customer_order values (26, 82, 6, '06/06/2016', 'cash');
insert into customer_order values (27, 83, 6, '05/04/2011', 'card');insert into customer_order values (28, 83, 6, '07/04/2014', 'online');
insert into customer_order values (29, 84, 5, '05/04/2011', 'cash');insert into customer_order values (30, 84, 5, '25/12/2014', 'card');
insert into customer_order values (31, 85, 5, '17/12/2012', 'online');insert into customer_order values (32, 85, 5, '19/12/2014', 'cash');
insert into customer_order values (33, 86, 3, '14/08/2012', 'card');insert into customer_order values (34, 86, 3, '30/07/2018', 'online');
insert into customer_order values (35, 87, 3, '21/03/2015', 'cash');insert into customer_order values (36, 87, 3, '06/02/2016', 'card');
insert into customer_order values (37, 88, 3, '23/10/2018', 'online');insert into customer_order values (38, 88, 3, '07/10/2019', 'cash');
insert into customer_order values (39, 89, 3, '03/03/2015', 'card');insert into customer_order values (40, 89, 3, '15/09/2019', 'online');
insert into customer_order values (41, 90, 4, '09/06/2017', 'cash');insert into customer_order  values (42, 90, 4, '31/07/2018', 'card');
insert into customer_order values (43, 91, 4, '26/08/2016', 'online');insert into customer_order values (44, 91, 4, '21/05/2017', 'cash');
insert into customer_order values (45, 92, 4, '25/03/2017', 'card');insert into customer_order values (46, 92, 4, '18/07/2013', 'online');
insert into customer_order values (47, 93, 4, '23/04/2018', 'cash');insert into customer_order values (48, 93, 4, '26/12/2019', 'card');
insert into customer_order values (49, 94, 4, '28/04/2017', 'online');insert into customer_order values (50, 94, 4, '06/03/2020', 'cash');
insert into customer_order values (51, 95, 2, '05/04/2016', 'card');insert into customer_order values (52, 95, 2, '17/04/2017', 'online');
insert into customer_order values (53, 96, 2, '19/03/2015', 'cash');insert into customer_order values (54, 96, 2, '15/06/2018', 'card');
insert into customer_order values (55, 97, 2, '26/07/2014', 'online');insert into customer_order values (56, 97, 2, '15/06/2017', 'cash');
insert into customer_order values (57, 98, 2, '05/12/2019', 'card');insert into customer_order values (58, 98, 2, '18/09/2016', 'online');
insert into customer_order values (59, 99, 2, '25/09/2011', 'cash');insert into customer_order values (60, 99, 2, '12/08/2012', 'card');

insert into warehouse values (1, 'California');insert into warehouse values (2, 'Texas');
insert into warehouse values (3, 'Florida');insert into warehouse values (4, 'Nevada');

insert into warehouse_store values (1, 1);insert into warehouse_store values (1, 5);
insert into warehouse_store values (2, 2);insert into warehouse_store values (2, 6);
insert into warehouse_store values (3, 3);insert into warehouse_store values (3, 7);
insert into warehouse_store values (4, 4);insert into warehouse_store values (4, 8);

insert into warehouse_book (warehouse_id, book_code, number_of_books) values (2, 1061, 271);insert into warehouse_book (warehouse_id, book_code, number_of_books) values (2, 1053, 325);
insert into warehouse_book (warehouse_id, book_code, number_of_books) values (1, 1004, 362);insert into warehouse_book (warehouse_id, book_code, number_of_books) values (3, 1054, 344);
insert into warehouse_book (warehouse_id, book_code, number_of_books) values (4, 1098, 304);insert into warehouse_book (warehouse_id, book_code, number_of_books) values (3, 1078, 442);
insert into warehouse_book (warehouse_id, book_code, number_of_books) values (1, 1076, 284);insert into warehouse_book (warehouse_id, book_code, number_of_books) values (4, 1053, 433);
insert into warehouse_book (warehouse_id, book_code, number_of_books) values (3, 1067, 411);insert into warehouse_book (warehouse_id, book_code, number_of_books) values (4, 1067, 492);
insert into warehouse_book (warehouse_id, book_code, number_of_books) values (4, 1066, 472);insert into warehouse_book (warehouse_id, book_code, number_of_books) values (2, 1028, 273);
insert into warehouse_book (warehouse_id, book_code, number_of_books) values (3, 1092, 434);insert into warehouse_book (warehouse_id, book_code, number_of_books) values (2, 1029, 385);
insert into warehouse_book (warehouse_id, book_code, number_of_books) values (3, 1001, 394);insert into warehouse_book (warehouse_id, book_code, number_of_books) values (2, 1025, 370);
insert into warehouse_book (warehouse_id, book_code, number_of_books) values (4, 1018, 471);insert into warehouse_book (warehouse_id, book_code, number_of_books) values (4, 1087, 349);
insert into warehouse_book (warehouse_id, book_code, number_of_books) values (4, 1009, 389);insert into warehouse_book (warehouse_id, book_code, number_of_books) values (4, 1095, 500);
insert into warehouse_book (warehouse_id, book_code, number_of_books) values (1, 1003, 472);insert into warehouse_book (warehouse_id, book_code, number_of_books) values (3, 1013, 255);
insert into warehouse_book (warehouse_id, book_code, number_of_books) values (2, 1078, 466);insert into warehouse_book (warehouse_id, book_code, number_of_books) values (3, 1097, 354);
insert into warehouse_book (warehouse_id, book_code, number_of_books) values (2, 1028, 294);insert into warehouse_book (warehouse_id, book_code, number_of_books) values (2, 1059, 216);
insert into warehouse_book (warehouse_id, book_code, number_of_books) values (3, 1066, 208);insert into warehouse_book (warehouse_id, book_code, number_of_books) values (2, 1031, 296);
insert into warehouse_book (warehouse_id, book_code, number_of_books) values (1, 1060, 200);insert into warehouse_book (warehouse_id, book_code, number_of_books) values (1, 1071, 206);
insert into warehouse_book (warehouse_id, book_code, number_of_books) values (2, 1091, 222);insert into warehouse_book (warehouse_id, book_code, number_of_books) values (2, 1040, 419);
insert into warehouse_book (warehouse_id, book_code, number_of_books) values (1, 1039, 243);insert into warehouse_book (warehouse_id, book_code, number_of_books) values (4, 1055, 372);
insert into warehouse_book (warehouse_id, book_code, number_of_books) values (4, 1004, 457);insert into warehouse_book (warehouse_id, book_code, number_of_books) values (1, 1053, 484);
insert into warehouse_book (warehouse_id, book_code, number_of_books) values (2, 1088, 425);insert into warehouse_book (warehouse_id, book_code, number_of_books) values (4, 1014, 370);
insert into warehouse_book (warehouse_id, book_code, number_of_books) values (2, 1047, 491);insert into warehouse_book (warehouse_id, book_code, number_of_books) values (4, 1051, 493);
insert into warehouse_book (warehouse_id, book_code, number_of_books) values (1, 1003, 478);insert into warehouse_book (warehouse_id, book_code, number_of_books) values (3, 1004, 346);
insert into warehouse_book (warehouse_id, book_code, number_of_books) values (3, 1023, 372);insert into warehouse_book (warehouse_id, book_code, number_of_books) values (4, 1096, 233);
insert into warehouse_book (warehouse_id, book_code, number_of_books) values (3, 1045, 358);insert into warehouse_book (warehouse_id, book_code, number_of_books) values (2, 1093, 350);
insert into warehouse_book (warehouse_id, book_code, number_of_books) values (4, 1024, 387);insert into warehouse_book (warehouse_id, book_code, number_of_books) values (4, 1002, 340);
insert into warehouse_book (warehouse_id, book_code, number_of_books) values (1, 1052, 405);insert into warehouse_book (warehouse_id, book_code, number_of_books) values (2, 1053, 490);
insert into warehouse_book (warehouse_id, book_code, number_of_books) values (1, 1041, 496);insert into warehouse_book (warehouse_id, book_code, number_of_books) values (3, 1019, 327);
insert into warehouse_book (warehouse_id, book_code, number_of_books) values (1, 1053, 296);insert into warehouse_book (warehouse_id, book_code, number_of_books) values (4, 1047, 447);
insert into warehouse_book (warehouse_id, book_code, number_of_books) values (2, 1042, 497);insert into warehouse_book (warehouse_id, book_code, number_of_books) values (1, 1068, 200);
insert into warehouse_book (warehouse_id, book_code, number_of_books) values (2, 1016, 274);insert into warehouse_book (warehouse_id, book_code, number_of_books) values (2, 1037, 344);
insert into warehouse_book (warehouse_id, book_code, number_of_books) values (3, 1071, 292);insert into warehouse_book (warehouse_id, book_code, number_of_books) values (2, 1073, 397);
insert into warehouse_book (warehouse_id, book_code, number_of_books) values (4, 1095, 490);insert into warehouse_book (warehouse_id, book_code, number_of_books) values (4, 1081, 428);
insert into warehouse_book (warehouse_id, book_code, number_of_books) values (1, 1023, 221);insert into warehouse_book (warehouse_id, book_code, number_of_books) values (1, 1065, 373);
insert into warehouse_book (warehouse_id, book_code, number_of_books) values (2, 1065, 410);insert into warehouse_book (warehouse_id, book_code, number_of_books) values (4, 1026, 424);
insert into warehouse_book (warehouse_id, book_code, number_of_books) values (2, 1013, 415);insert into warehouse_book (warehouse_id, book_code, number_of_books) values (2, 1080, 269);
insert into warehouse_book (warehouse_id, book_code, number_of_books) values (1, 1081, 336);insert into warehouse_book (warehouse_id, book_code, number_of_books) values (4, 1035, 431);
insert into warehouse_book (warehouse_id, book_code, number_of_books) values (1, 1066, 462);insert into warehouse_book (warehouse_id, book_code, number_of_books) values (1, 1069, 248);
insert into warehouse_book (warehouse_id, book_code, number_of_books) values (1, 1056, 345);insert into warehouse_book (warehouse_id, book_code, number_of_books) values (3, 1071, 249);
insert into warehouse_book (warehouse_id, book_code, number_of_books) values (1, 1066, 415);insert into warehouse_book (warehouse_id, book_code, number_of_books) values (4, 1034, 481);
insert into warehouse_book (warehouse_id, book_code, number_of_books) values (4, 1078, 469);insert into warehouse_book (warehouse_id, book_code, number_of_books) values (4, 1009, 284);
insert into warehouse_book (warehouse_id, book_code, number_of_books) values (4, 1006, 292);insert into warehouse_book (warehouse_id, book_code, number_of_books) values (2, 1023, 318);
insert into warehouse_book (warehouse_id, book_code, number_of_books) values (1, 1036, 421);insert into warehouse_book (warehouse_id, book_code, number_of_books) values (2, 1006, 316);
insert into warehouse_book (warehouse_id, book_code, number_of_books) values (2, 1069, 262);insert into warehouse_book (warehouse_id, book_code, number_of_books) values (3, 1095, 321);
insert into warehouse_book (warehouse_id, book_code, number_of_books) values (2, 1017, 474);insert into warehouse_book (warehouse_id, book_code, number_of_books) values (1, 1019, 333);
insert into warehouse_book (warehouse_id, book_code, number_of_books) values (3, 1076, 481);insert into warehouse_book (warehouse_id, book_code, number_of_books) values (2, 1069, 409);
insert into warehouse_book (warehouse_id, book_code, number_of_books) values (4, 1049, 463);insert into warehouse_book (warehouse_id, book_code, number_of_books) values (1, 1089, 341);
insert into warehouse_book (warehouse_id, book_code, number_of_books) values (3, 1014, 243);insert into warehouse_book (warehouse_id, book_code, number_of_books) values (1, 1051, 462);
insert into warehouse_book (warehouse_id, book_code, number_of_books) values (4, 1070, 466);insert into warehouse_book (warehouse_id, book_code, number_of_books) values (3, 1025, 321);
insert into warehouse_book (warehouse_id, book_code, number_of_books) values (4, 1100, 376);insert into warehouse_book (warehouse_id, book_code, number_of_books) values (4, 1049, 403);
insert into warehouse_book (warehouse_id, book_code, number_of_books) values (2, 1055, 305);insert into warehouse_book (warehouse_id, book_code, number_of_books) values (1, 1062, 464);
insert into warehouse_book (warehouse_id, book_code, number_of_books) values (3, 1051, 496);insert into warehouse_book (warehouse_id, book_code, number_of_books) values (3, 1043, 308);
insert into warehouse_book (warehouse_id, book_code, number_of_books) values (1, 1085, 457);insert into warehouse_book (warehouse_id, book_code, number_of_books) values (3, 1004, 340);
insert into warehouse_book (warehouse_id, book_code, number_of_books) values (3, 1084, 322);insert into warehouse_book (warehouse_id, book_code, number_of_books) values (2, 1076, 474);
insert into warehouse_book (warehouse_id, book_code, number_of_books) values (2, 1001, 401);insert into warehouse_book (warehouse_id, book_code, number_of_books) values (4, 1011, 453);
insert into warehouse_book (warehouse_id, book_code, number_of_books) values (2, 1078, 461);insert into warehouse_book (warehouse_id, book_code, number_of_books) values (2, 1047, 347);
insert into warehouse_book (warehouse_id, book_code, number_of_books) values (2, 1027, 361);insert into warehouse_book (warehouse_id, book_code, number_of_books) values (3, 1015, 238);
insert into warehouse_book (warehouse_id, book_code, number_of_books) values (3, 1098, 362);insert into warehouse_book (warehouse_id, book_code, number_of_books) values (3, 1043, 312);
insert into warehouse_book (warehouse_id, book_code, number_of_books) values (4, 1017, 213);insert into warehouse_book (warehouse_id, book_code, number_of_books) values (4, 1086, 413);
insert into warehouse_book (warehouse_id, book_code, number_of_books) values (3, 1068, 427);insert into warehouse_book (warehouse_id, book_code, number_of_books) values (2, 1050, 415);
insert into warehouse_book (warehouse_id, book_code, number_of_books) values (2, 1063, 262);insert into warehouse_book (warehouse_id, book_code, number_of_books) values (4, 1002, 485);
insert into warehouse_book (warehouse_id, book_code, number_of_books) values (2, 1016, 414);insert into warehouse_book (warehouse_id, book_code, number_of_books) values (2, 1011, 355);
insert into warehouse_book (warehouse_id, book_code, number_of_books) values (2, 1007, 262);insert into warehouse_book (warehouse_id, book_code, number_of_books) values (4, 1025, 464);
insert into warehouse_book (warehouse_id, book_code, number_of_books) values (3, 1073, 458);insert into warehouse_book (warehouse_id, book_code, number_of_books) values (1, 1098, 379);
insert into warehouse_book (warehouse_id, book_code, number_of_books) values (4, 1052, 362);insert into warehouse_book (warehouse_id, book_code, number_of_books) values (3, 1094, 221);
insert into warehouse_book (warehouse_id, book_code, number_of_books) values (4, 1024, 448);insert into warehouse_book (warehouse_id, book_code, number_of_books) values (4, 1083, 377);
insert into warehouse_book (warehouse_id, book_code, number_of_books) values (2, 1027, 395);insert into warehouse_book (warehouse_id, book_code, number_of_books) values (2, 1091, 313);
insert into warehouse_book (warehouse_id, book_code, number_of_books) values (1, 1069, 426);insert into warehouse_book (warehouse_id, book_code, number_of_books) values (2, 1096, 495);
insert into warehouse_book (warehouse_id, book_code, number_of_books) values (1, 1070, 234);insert into warehouse_book (warehouse_id, book_code, number_of_books) values (3, 1008, 230);
insert into warehouse_book (warehouse_id, book_code, number_of_books) values (3, 1035, 433);insert into warehouse_book (warehouse_id, book_code, number_of_books) values (3, 1010, 428);
insert into warehouse_book (warehouse_id, book_code, number_of_books) values (3, 1022, 285);insert into warehouse_book (warehouse_id, book_code, number_of_books) values (4, 1098, 235);
insert into warehouse_book (warehouse_id, book_code, number_of_books) values (1, 1056, 306);insert into warehouse_book (warehouse_id, book_code, number_of_books) values (2, 1021, 265);
insert into warehouse_book (warehouse_id, book_code, number_of_books) values (1, 1003, 460);insert into warehouse_book (warehouse_id, book_code, number_of_books) values (3, 1036, 392);
insert into warehouse_book (warehouse_id, book_code, number_of_books) values (1, 1099, 365);insert into warehouse_book (warehouse_id, book_code, number_of_books) values (3, 1014, 462);
insert into warehouse_book (warehouse_id, book_code, number_of_books) values (1, 1032, 438);insert into warehouse_book (warehouse_id, book_code, number_of_books) values (1, 1063, 400);
insert into warehouse_book (warehouse_id, book_code, number_of_books) values (2, 1051, 219);insert into warehouse_book (warehouse_id, book_code, number_of_books) values (4, 1039, 260);
insert into warehouse_book (warehouse_id, book_code, number_of_books) values (4, 1090, 256);insert into warehouse_book (warehouse_id, book_code, number_of_books) values (4, 1064, 321);

