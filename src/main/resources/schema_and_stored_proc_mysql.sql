-- Create tables and then create autoincrement key

CREATE TABLE authors(
	author_id	INT(10) PRIMARY KEY,
	name 		VARCHAR(50)
)
;

CREATE TABLE categories(
	category_id	INT(10) PRIMARY KEY,
	name 		VARCHAR(50)
)
;


CREATE TABLE publishers(
	publisher_id	INT(10) PRIMARY KEY,
	name 		VARCHAR(60)
)
;

CREATE TABLE books(
  isbn	VARCHAR(20) PRIMARY KEY,
  title 	VARCHAR(50),
  author_id INT(10),
  about 	VARCHAR(2000),
  publisher_id INT(10),
  price DECIMAL(10,2),
  pages_total_num INT(20),
  category_id INT(10),
  published_date DATE,
  imagepath VARCHAR(20),
  CONSTRAINT books_authors_fk	FOREIGN KEY(author_id) REFERENCES authors(author_id),
  CONSTRAINT books_categories_fk FOREIGN KEY(category_id) REFERENCES categories(category_id),
  CONSTRAINT books_publishers_fk FOREIGN KEY(publisher_id) REFERENCES publishers(publisher_id)
)
;

CREATE TABLE book_author(
  isbn		VARCHAR(20),
  author_id INT(10),
  CONSTRAINT b_a_bs_isbn_fk FOREIGN KEY(isbn) REFERENCES books(isbn),
	CONSTRAINT b_a_as_author_id_fk	FOREIGN KEY(author_id) REFERENCES authors(author_id)
)
;


CREATE TABLE book_category(
	isbn	VARCHAR(20),
  category_id INT(10),
  CONSTRAINT b_c_bs_isbn_fk FOREIGN KEY(isbn) REFERENCES books(isbn),
	CONSTRAINT b_c_cs_category_id_fk	FOREIGN KEY(category_id) REFERENCES categories(category_id)
)
;


CREATE TABLE book_stock( /*add auto increment*/
  book_stock_id INT(10) AUTO_INCREMENT  PRIMARY KEY ,
isbn	VARCHAR(20),
  book_copies_num INT(20),
  CONSTRAINT b_b_stock_isbn_fk FOREIGN KEY(isbn) REFERENCES books(isbn)
)
;

CREATE TABLE libuser_titles (
  title_id INT(10) PRIMARY KEY, 
	title VARCHAR(20)
  );

CREATE TABLE libusers (
	username VARCHAR(50) PRIMARY KEY, 
	password VARCHAR(100), 
	title_id INT(10),
	firstname VARCHAR(50), 
	lastname VARCHAR(50),
	email VARCHAR(50), 
	enabled INT(10),
  CONSTRAINT libuser_titles_libusers_fk FOREIGN KEY(title_id) REFERENCES libuser_titles(title_id)
  );

 CREATE TABLE libuser_roles ( /*add auto increment*/
 		user_role_id INT(10) AUTO_INCREMENT  PRIMARY KEY,
    username VARCHAR(100), 
    authority VARCHAR(50),
    CONSTRAINT libusers_libuser_roles_fk FOREIGN KEY(username) REFERENCES libusers(username)
 );

  CREATE TABLE accounts 
   (	accountno INT(2), 
	balance DECIMAL(10,2)
   );


  CREATE TABLE shopping_cart 
   (
   username VARCHAR(50), 
	map_name VARCHAR(2000), 
	basket BLOB
   );

  CREATE TABLE shopping_cart_history 
   (	
   shop_cart_hist_id INT(10) AUTO_INCREMENT PRIMARY KEY, 
	username VARCHAR(50),
	map_name VARCHAR(2000), 
	basket BLOB, 
	purchase_date DATE
   );
   

Insert into ACCOUNTS (ACCOUNTNO,BALANCE) values (1,0);

Insert into AUTHORS (AUTHOR_ID,NAME) values (246,' Terry Hayes');

Insert into AUTHORS (AUTHOR_ID,NAME) values (247,'Robert Harris');

Insert into AUTHORS (AUTHOR_ID,NAME) values (1,'Agatha Christie');

Insert into AUTHORS (AUTHOR_ID,NAME) values (2,'Alan Moore');

Insert into AUTHORS (AUTHOR_ID,NAME) values (3,'Albert Camus');

Insert into AUTHORS (AUTHOR_ID,NAME) values (4,'Aldous Huxley');

Insert into AUTHORS (AUTHOR_ID,NAME) values (5,'Alexander Mccall Smith');

Insert into AUTHORS (AUTHOR_ID,NAME) values (6,'Allen Ginsberg');

Insert into AUTHORS (AUTHOR_ID,NAME) values (7,'AnaÔs Nin');

Insert into AUTHORS (AUTHOR_ID,NAME) values (8,'Anne Frank');

Insert into AUTHORS (AUTHOR_ID,NAME) values (9,'Anne Rice');

Insert into AUTHORS (AUTHOR_ID,NAME) values (10,'Antoine De Saint-ExupÈry');

Insert into AUTHORS (AUTHOR_ID,NAME) values (11,'Anton Chekhov');

Insert into AUTHORS (AUTHOR_ID,NAME) values (12,'Arthur C. Clarke');

Insert into AUTHORS (AUTHOR_ID,NAME) values (13,'Arthur Miller');

Insert into AUTHORS (AUTHOR_ID,NAME) values (14,'Arundhati Roy');

Insert into AUTHORS (AUTHOR_ID,NAME) values (15,'Astrid Lindgren');

Insert into AUTHORS (AUTHOR_ID,NAME) values (16,'Ayn Rand');

Insert into AUTHORS (AUTHOR_ID,NAME) values (17,'Barbara Cartland');

Insert into AUTHORS (AUTHOR_ID,NAME) values (18,'Beatrix Potter');

Insert into AUTHORS (AUTHOR_ID,NAME) values (19,'Beverly Cleary');

Insert into AUTHORS (AUTHOR_ID,NAME) values (20,'Brian Jacques');

Insert into AUTHORS (AUTHOR_ID,NAME) values (21,'C. S. Lewis');

Insert into AUTHORS (AUTHOR_ID,NAME) values (22,'Carol Ann Duffy');

Insert into AUTHORS (AUTHOR_ID,NAME) values (23,'Charles Dickens');

Insert into AUTHORS (AUTHOR_ID,NAME) values (24,'Chinua Achebe');

Insert into AUTHORS (AUTHOR_ID,NAME) values (25,'Christopher Hitchens');

Insert into AUTHORS (AUTHOR_ID,NAME) values (26,'Christopher Marlowe');

Insert into AUTHORS (AUTHOR_ID,NAME) values (27,'Christopher Paolini');

Insert into AUTHORS (AUTHOR_ID,NAME) values (28,'Chuck Palahniuk');

Insert into AUTHORS (AUTHOR_ID,NAME) values (29,'Clive Cussler');

Insert into AUTHORS (AUTHOR_ID,NAME) values (30,'Cormac McCarthy');

Insert into AUTHORS (AUTHOR_ID,NAME) values (31,'Czes?aw Mi?osz');

Insert into AUTHORS (AUTHOR_ID,NAME) values (32,'D.H. Lawrence');

Insert into AUTHORS (AUTHOR_ID,NAME) values (33,'Dale Carnegie');

Insert into AUTHORS (AUTHOR_ID,NAME) values (34,'Dan Brown');

Insert into AUTHORS (AUTHOR_ID,NAME) values (35,'Danielle Steel');

Insert into AUTHORS (AUTHOR_ID,NAME) values (36,'Dante Alighieri');

Insert into AUTHORS (AUTHOR_ID,NAME) values (37,'Daphne du Maurier');

Insert into AUTHORS (AUTHOR_ID,NAME) values (38,'Dashiell Hammett');

Insert into AUTHORS (AUTHOR_ID,NAME) values (39,'Dav Pilkey');

Insert into AUTHORS (AUTHOR_ID,NAME) values (40,'David Baldacci');

Insert into AUTHORS (AUTHOR_ID,NAME) values (41,'David Foster Wallace');

Insert into AUTHORS (AUTHOR_ID,NAME) values (42,'David Sedaris');

Insert into AUTHORS (AUTHOR_ID,NAME) values (43,'Dean Koontz');

Insert into AUTHORS (AUTHOR_ID,NAME) values (44,'Debbie Macomber');

Insert into AUTHORS (AUTHOR_ID,NAME) values (45,'Denis Diderot');

Insert into AUTHORS (AUTHOR_ID,NAME) values (46,'Don DeLillo');

Insert into AUTHORS (AUTHOR_ID,NAME) values (47,'Doris Lessing');

Insert into AUTHORS (AUTHOR_ID,NAME) values (48,'Douglas Adams');

Insert into AUTHORS (AUTHOR_ID,NAME) values (49,'Dr. Seuss');

Insert into AUTHORS (AUTHOR_ID,NAME) values (50,'E.M. Forster');

Insert into AUTHORS (AUTHOR_ID,NAME) values (51,'Edgar Allan Poe');

Insert into AUTHORS (AUTHOR_ID,NAME) values (52,'Edith Wharton');

Insert into AUTHORS (AUTHOR_ID,NAME) values (53,'Elbert Hubbard');

Insert into AUTHORS (AUTHOR_ID,NAME) values (54,'Elie Wiesel');

Insert into AUTHORS (AUTHOR_ID,NAME) values (55,'Ellen G. White');

Insert into AUTHORS (AUTHOR_ID,NAME) values (56,'…mile Zola');

Insert into AUTHORS (AUTHOR_ID,NAME) values (57,'Emily Dickinson');

Insert into AUTHORS (AUTHOR_ID,NAME) values (58,'Enid Blyton');

Insert into AUTHORS (AUTHOR_ID,NAME) values (59,'Eoin Colfer');

Insert into AUTHORS (AUTHOR_ID,NAME) values (60,'Eric Carle');

Insert into AUTHORS (AUTHOR_ID,NAME) values (61,'Erica Jong');

Insert into AUTHORS (AUTHOR_ID,NAME) values (62,'Ernest Hemingway');

Insert into AUTHORS (AUTHOR_ID,NAME) values (63,'Euripides');

Insert into AUTHORS (AUTHOR_ID,NAME) values (64,'F. Scott Fitzgerald');

Insert into AUTHORS (AUTHOR_ID,NAME) values (65,'Fernando Pessoa');

Insert into AUTHORS (AUTHOR_ID,NAME) values (66,'Frank McCourt');

Insert into AUTHORS (AUTHOR_ID,NAME) values (67,'Flannery OíConnor');

Insert into AUTHORS (AUTHOR_ID,NAME) values (68,'Franz Kafka');

Insert into AUTHORS (AUTHOR_ID,NAME) values (69,'Gabriel GarcÌa M·rquez');

Insert into AUTHORS (AUTHOR_ID,NAME) values (70,'Geoffrey Chaucer');

Insert into AUTHORS (AUTHOR_ID,NAME) values (71,'George Bernard Shaw');

Insert into AUTHORS (AUTHOR_ID,NAME) values (72,'George Eliot');

Insert into AUTHORS (AUTHOR_ID,NAME) values (73,'George Orwell');

Insert into AUTHORS (AUTHOR_ID,NAME) values (74,'George R. R. Martin');

Insert into AUTHORS (AUTHOR_ID,NAME) values (75,'Germaine Greer');

Insert into AUTHORS (AUTHOR_ID,NAME) values (76,'Gertrude Stein');

Insert into AUTHORS (AUTHOR_ID,NAME) values (77,'Giacomo Leopardi');

Insert into AUTHORS (AUTHOR_ID,NAME) values (78,'Giovanni Boccaccio');

Insert into AUTHORS (AUTHOR_ID,NAME) values (79,'G¸nter Grass');

Insert into AUTHORS (AUTHOR_ID,NAME) values (80,'Gustave Flaubert');

Insert into AUTHORS (AUTHOR_ID,NAME) values (81,'H. G. Wells');

Insert into AUTHORS (AUTHOR_ID,NAME) values (82,'Hans Christian Andersen');

Insert into AUTHORS (AUTHOR_ID,NAME) values (83,'Harper Lee');

Insert into AUTHORS (AUTHOR_ID,NAME) values (84,'Haruki Murakami');

Insert into AUTHORS (AUTHOR_ID,NAME) values (85,'Henning Mankell');

Insert into AUTHORS (AUTHOR_ID,NAME) values (86,'Henrik Ibsen');

Insert into AUTHORS (AUTHOR_ID,NAME) values (87,'Henry David Thoreau');

Insert into AUTHORS (AUTHOR_ID,NAME) values (88,'Henry James');

Insert into AUTHORS (AUTHOR_ID,NAME) values (89,'Henry Miller');

Insert into AUTHORS (AUTHOR_ID,NAME) values (90,'Herman Melville');

Insert into AUTHORS (AUTHOR_ID,NAME) values (91,'Hermann Hesse');

Insert into AUTHORS (AUTHOR_ID,NAME) values (92,'Homer');

Insert into AUTHORS (AUTHOR_ID,NAME) values (93,'HonorÈ De Balzac');

Insert into AUTHORS (AUTHOR_ID,NAME) values (94,'Hunter S. Thompson');

Insert into AUTHORS (AUTHOR_ID,NAME) values (95,'Ian Fleming');

Insert into AUTHORS (AUTHOR_ID,NAME) values (96,'Ian McEwan');

Insert into AUTHORS (AUTHOR_ID,NAME) values (97,'Isaac Asimov');

Insert into AUTHORS (AUTHOR_ID,NAME) values (98,'Isabel Allende');

Insert into AUTHORS (AUTHOR_ID,NAME) values (99,'Italo Calvino');

Insert into AUTHORS (AUTHOR_ID,NAME) values (100,'Italo Svevo');

Insert into AUTHORS (AUTHOR_ID,NAME) values (101,'J. G. Ballard');

Insert into AUTHORS (AUTHOR_ID,NAME) values (102,'J. K. Rowling');

Insert into AUTHORS (AUTHOR_ID,NAME) values (103,'J. R. R. Tolkien');

Insert into AUTHORS (AUTHOR_ID,NAME) values (104,'J.D. Salinger');

Insert into AUTHORS (AUTHOR_ID,NAME) values (105,'Jack Kerouac');

Insert into AUTHORS (AUTHOR_ID,NAME) values (106,'Jack London');

Insert into AUTHORS (AUTHOR_ID,NAME) values (107,'Jackie Collins');

Insert into AUTHORS (AUTHOR_ID,NAME) values (108,'Jacqueline Wilson');

Insert into AUTHORS (AUTHOR_ID,NAME) values (109,'James Frey');

Insert into AUTHORS (AUTHOR_ID,NAME) values (110,'James Joyce');

Insert into AUTHORS (AUTHOR_ID,NAME) values (111,'James Patterson');

Insert into AUTHORS (AUTHOR_ID,NAME) values (112,'Jane Austen');

Insert into AUTHORS (AUTHOR_ID,NAME) values (113,'Jean M. Auel');

Insert into AUTHORS (AUTHOR_ID,NAME) values (114,'Jeff Kinney');

Insert into AUTHORS (AUTHOR_ID,NAME) values (115,'Jeffrey Archer');

Insert into AUTHORS (AUTHOR_ID,NAME) values (116,'Jo Nesb¯');

Insert into AUTHORS (AUTHOR_ID,NAME) values (117,'Johann Wolfgang Von Goethe');

Insert into AUTHORS (AUTHOR_ID,NAME) values (118,'John Gray');

Insert into AUTHORS (AUTHOR_ID,NAME) values (119,'John Grisham');

Insert into AUTHORS (AUTHOR_ID,NAME) values (120,'John Irving');

Insert into AUTHORS (AUTHOR_ID,NAME) values (121,'John Keats');

Insert into AUTHORS (AUTHOR_ID,NAME) values (122,'John Milton');

Insert into AUTHORS (AUTHOR_ID,NAME) values (123,'John Steinbeck');

Insert into AUTHORS (AUTHOR_ID,NAME) values (124,'John Updike');

Insert into AUTHORS (AUTHOR_ID,NAME) values (125,'Jonathan Safran Foer');

Insert into AUTHORS (AUTHOR_ID,NAME) values (126,'Jonathan Swift');

Insert into AUTHORS (AUTHOR_ID,NAME) values (127,'Jorge Luis Borges');

Insert into AUTHORS (AUTHOR_ID,NAME) values (128,'JosÈ Saramago');

Insert into AUTHORS (AUTHOR_ID,NAME) values (129,'Joseph Conrad');

Insert into AUTHORS (AUTHOR_ID,NAME) values (130,'Joseph Heller');

Insert into AUTHORS (AUTHOR_ID,NAME) values (131,'Jostein Gaarder');

Insert into AUTHORS (AUTHOR_ID,NAME) values (132,'Joyce Carol Oates');

Insert into AUTHORS (AUTHOR_ID,NAME) values (133,'Juan Rulfo');

Insert into AUTHORS (AUTHOR_ID,NAME) values (134,'Jules Verne');

Insert into AUTHORS (AUTHOR_ID,NAME) values (135,'Julian Barnes');

Insert into AUTHORS (AUTHOR_ID,NAME) values (136,'Karl May');

Insert into AUTHORS (AUTHOR_ID,NAME) values (137,'Kazuo Ishiguro');

Insert into AUTHORS (AUTHOR_ID,NAME) values (138,'Ken Follett');

Insert into AUTHORS (AUTHOR_ID,NAME) values (139,'Khaled Hosseini');

Insert into AUTHORS (AUTHOR_ID,NAME) values (140,'Khalil Gibran');

Insert into AUTHORS (AUTHOR_ID,NAME) values (141,'Knut Hamsun');

Insert into AUTHORS (AUTHOR_ID,NAME) values (142,'Kurt Vonnegut');

Insert into AUTHORS (AUTHOR_ID,NAME) values (143,'Laura Ingalls Wilder');

Insert into AUTHORS (AUTHOR_ID,NAME) values (144,'Lee Child');

Insert into AUTHORS (AUTHOR_ID,NAME) values (145,'Leo Tolstoy');

Insert into AUTHORS (AUTHOR_ID,NAME) values (146,'Lewis Carroll');

Insert into AUTHORS (AUTHOR_ID,NAME) values (147,'Lord Byron');

Insert into AUTHORS (AUTHOR_ID,NAME) values (148,'Louise Hay');

Insert into AUTHORS (AUTHOR_ID,NAME) values (149,'Malcolm Gladwell');

Insert into AUTHORS (AUTHOR_ID,NAME) values (150,'Marcel Proust');

Insert into AUTHORS (AUTHOR_ID,NAME) values (151,'Margaret Mitchell');

Insert into AUTHORS (AUTHOR_ID,NAME) values (152,'Margaret Peterson Haddix');

Insert into AUTHORS (AUTHOR_ID,NAME) values (153,'Marguerite Yourcenar');

Insert into AUTHORS (AUTHOR_ID,NAME) values (154,'Mario Puzo');

Insert into AUTHORS (AUTHOR_ID,NAME) values (155,'Mario Vargas Llosa');

Insert into AUTHORS (AUTHOR_ID,NAME) values (156,'Mark Twain');

Insert into AUTHORS (AUTHOR_ID,NAME) values (157,'Martin Amis');

Insert into AUTHORS (AUTHOR_ID,NAME) values (158,'Mary Higgins Clark');

Insert into AUTHORS (AUTHOR_ID,NAME) values (159,'Mary Shelley');

Insert into AUTHORS (AUTHOR_ID,NAME) values (160,'Maurice Sendak');

Insert into AUTHORS (AUTHOR_ID,NAME) values (161,'Maya Angelou');

Insert into AUTHORS (AUTHOR_ID,NAME) values (162,'Michael Crichton');

Insert into AUTHORS (AUTHOR_ID,NAME) values (163,'Michel De Montaigne');

Insert into AUTHORS (AUTHOR_ID,NAME) values (164,'Michel Houellebecq');

Insert into AUTHORS (AUTHOR_ID,NAME) values (165,'Miguel De Cervantes');

Insert into AUTHORS (AUTHOR_ID,NAME) values (166,'Mitch Albom');

Insert into AUTHORS (AUTHOR_ID,NAME) values (167,'Napoleon Hill');

Insert into AUTHORS (AUTHOR_ID,NAME) values (168,'Neil Gaiman');

Insert into AUTHORS (AUTHOR_ID,NAME) values (169,'Niall Ferguson');

Insert into AUTHORS (AUTHOR_ID,NAME) values (170,'Nicholas Sparks');

Insert into AUTHORS (AUTHOR_ID,NAME) values (171,'Nick Hornby');

Insert into AUTHORS (AUTHOR_ID,NAME) values (172,'Nicole Krauss');

Insert into AUTHORS (AUTHOR_ID,NAME) values (173,'Nora Roberts');

Insert into AUTHORS (AUTHOR_ID,NAME) values (174,'Norman Mailer');

Insert into AUTHORS (AUTHOR_ID,NAME) values (175,'Oscar Wilde');

Insert into AUTHORS (AUTHOR_ID,NAME) values (176,'Ovid');

Insert into AUTHORS (AUTHOR_ID,NAME) values (177,'P. D. James');

Insert into AUTHORS (AUTHOR_ID,NAME) values (178,'Patricia Cornwell');

Insert into AUTHORS (AUTHOR_ID,NAME) values (179,'Paul Auster');

Insert into AUTHORS (AUTHOR_ID,NAME) values (180,'Paul Celan');

Insert into AUTHORS (AUTHOR_ID,NAME) values (181,'Paul ValÈry');

Insert into AUTHORS (AUTHOR_ID,NAME) values (182,'Paulo Coelho');

Insert into AUTHORS (AUTHOR_ID,NAME) values (183,'Peter Hitchens');

Insert into AUTHORS (AUTHOR_ID,NAME) values (184,'Philip Pullman');

Insert into AUTHORS (AUTHOR_ID,NAME) values (185,'Pierre Dukan');

Insert into AUTHORS (AUTHOR_ID,NAME) values (186,'R. L. Stine');

Insert into AUTHORS (AUTHOR_ID,NAME) values (187,'Ralph Ellison');

Insert into AUTHORS (AUTHOR_ID,NAME) values (188,'Raymond Carver');

Insert into AUTHORS (AUTHOR_ID,NAME) values (189,'Raymond Chandler');

Insert into AUTHORS (AUTHOR_ID,NAME) values (190,'Raymond E. Feist');

Insert into AUTHORS (AUTHOR_ID,NAME) values (191,'Rhonda Byrne');

Insert into AUTHORS (AUTHOR_ID,NAME) values (192,'Richard Bach');

Insert into AUTHORS (AUTHOR_ID,NAME) values (193,'Richard Scarry');

Insert into AUTHORS (AUTHOR_ID,NAME) values (194,'Richard Wright');

Insert into AUTHORS (AUTHOR_ID,NAME) values (195,'Rick Riordan');

Insert into AUTHORS (AUTHOR_ID,NAME) values (196,'Rick Warren');

Insert into AUTHORS (AUTHOR_ID,NAME) values (197,'Roald Dahl');

Insert into AUTHORS (AUTHOR_ID,NAME) values (198,'Robert Jordan');

Insert into AUTHORS (AUTHOR_ID,NAME) values (199,'Robert Louis Stevenson');

Insert into AUTHORS (AUTHOR_ID,NAME) values (200,'Robert Ludlum');

Insert into AUTHORS (AUTHOR_ID,NAME) values (201,'Robert Munsch');

Insert into AUTHORS (AUTHOR_ID,NAME) values (202,'Robin Cook');

Insert into AUTHORS (AUTHOR_ID,NAME) values (203,'Roger Hargreaves');

Insert into AUTHORS (AUTHOR_ID,NAME) values (204,'Rudyard Kipling');

Insert into AUTHORS (AUTHOR_ID,NAME) values (205,'Rumi');

Insert into AUTHORS (AUTHOR_ID,NAME) values (206,'S. E. Hinton');

Insert into AUTHORS (AUTHOR_ID,NAME) values (207,'Salman Rushdie');

Insert into AUTHORS (AUTHOR_ID,NAME) values (208,'Samuel Beckett');

Insert into AUTHORS (AUTHOR_ID,NAME) values (209,'Samuel Johnson');

Insert into AUTHORS (AUTHOR_ID,NAME) values (210,'Seamus Heaney');

Insert into AUTHORS (AUTHOR_ID,NAME) values (211,'Shaun Tan');

Insert into AUTHORS (AUTHOR_ID,NAME) values (212,'Sidney Sheldon');

Insert into AUTHORS (AUTHOR_ID,NAME) values (213,'Simone de Beauvoir');

Insert into AUTHORS (AUTHOR_ID,NAME) values (214,'Sophocles');

Insert into AUTHORS (AUTHOR_ID,NAME) values (215,'Stendhal');

Insert into AUTHORS (AUTHOR_ID,NAME) values (216,'Stephen Hawking');

Insert into AUTHORS (AUTHOR_ID,NAME) values (217,'Stephen King');

Insert into AUTHORS (AUTHOR_ID,NAME) values (218,'Stephenie Meyer');

Insert into AUTHORS (AUTHOR_ID,NAME) values (219,'Stieg Larsson');

Insert into AUTHORS (AUTHOR_ID,NAME) values (220,'Suzanne Collins');

Insert into AUTHORS (AUTHOR_ID,NAME) values (221,'Sylvia Plath');

Insert into AUTHORS (AUTHOR_ID,NAME) values (222,'Ted Hughes');

Insert into AUTHORS (AUTHOR_ID,NAME) values (223,'Tennessee Williams');

Insert into AUTHORS (AUTHOR_ID,NAME) values (224,'Terry Brooks');

Insert into AUTHORS (AUTHOR_ID,NAME) values (225,'Terry Pratchett');

Insert into AUTHORS (AUTHOR_ID,NAME) values (226,'Thomas Mann');

Insert into AUTHORS (AUTHOR_ID,NAME) values (227,'Thomas Pynchon');

Insert into AUTHORS (AUTHOR_ID,NAME) values (228,'Tom Clancy');

Insert into AUTHORS (AUTHOR_ID,NAME) values (229,'Tom Robbins');

Insert into AUTHORS (AUTHOR_ID,NAME) values (230,'Toni Morrison');

Insert into AUTHORS (AUTHOR_ID,NAME) values (231,'Truman Capote');

Insert into AUTHORS (AUTHOR_ID,NAME) values (232,'Umberto Eco');

Insert into AUTHORS (AUTHOR_ID,NAME) values (233,'Viktor Frankl');

Insert into AUTHORS (AUTHOR_ID,NAME) values (234,'Virgil');

Insert into AUTHORS (AUTHOR_ID,NAME) values (235,'Virginia Woolf');

Insert into AUTHORS (AUTHOR_ID,NAME) values (236,'Vladimir Nabokov');

Insert into AUTHORS (AUTHOR_ID,NAME) values (237,'Walt Whitman');

Insert into AUTHORS (AUTHOR_ID,NAME) values (238,'Wilbur Smith');

Insert into AUTHORS (AUTHOR_ID,NAME) values (239,'William Blake');

Insert into AUTHORS (AUTHOR_ID,NAME) values (240,'William Faulkner');

Insert into AUTHORS (AUTHOR_ID,NAME) values (241,'William Gibson');

Insert into AUTHORS (AUTHOR_ID,NAME) values (242,'William Golding');

Insert into AUTHORS (AUTHOR_ID,NAME) values (243,'William S. Burroughs');

Insert into AUTHORS (AUTHOR_ID,NAME) values (244,'William Shakespeare');

Insert into AUTHORS (AUTHOR_ID,NAME) values (245,'Zora Neale Hurston');


Insert into CATEGORIES (CATEGORY_ID,NAME) values (1,'Adventure');

Insert into CATEGORIES (CATEGORY_ID,NAME) values (2,'Animals');

Insert into CATEGORIES (CATEGORY_ID,NAME) values (3,'Art and design');

Insert into CATEGORIES (CATEGORY_ID,NAME) values (4,'Audiobooks');

Insert into CATEGORIES (CATEGORY_ID,NAME) values (5,'Autobiography and memoir');

Insert into CATEGORIES (CATEGORY_ID,NAME) values (6,'Ballet');

Insert into CATEGORIES (CATEGORY_ID,NAME) values (7,'Biography');

Insert into CATEGORIES (CATEGORY_ID,NAME) values (8,'Children and teenagers');

Insert into CATEGORIES (CATEGORY_ID,NAME) values (9,'Business and finance');

Insert into CATEGORIES (CATEGORY_ID,NAME) values (10,'Chick lit');

Insert into CATEGORIES (CATEGORY_ID,NAME) values (11,'Children''s books: 7 and under');

Insert into CATEGORIES (CATEGORY_ID,NAME) values (12,'Children''s books: 8-12 years');

Insert into CATEGORIES (CATEGORY_ID,NAME) values (13,'Classics');

Insert into CATEGORIES (CATEGORY_ID,NAME) values (14,'Comics and graphic novels');

Insert into CATEGORIES (CATEGORY_ID,NAME) values (15,'Comics and graphic novels');

Insert into CATEGORIES (CATEGORY_ID,NAME) values (16,'Computing and the net');

Insert into CATEGORIES (CATEGORY_ID,NAME) values (17,'Craft and hobbies');

Insert into CATEGORIES (CATEGORY_ID,NAME) values (18,'Crime fiction');

Insert into CATEGORIES (CATEGORY_ID,NAME) values (19,'Disaster fiction');

Insert into CATEGORIES (CATEGORY_ID,NAME) values (20,'Fairies');

Insert into CATEGORIES (CATEGORY_ID,NAME) values (21,'Fantasy');

Insert into CATEGORIES (CATEGORY_ID,NAME) values (22,'Fiction');

Insert into CATEGORIES (CATEGORY_ID,NAME) values (23,'Film');

Insert into CATEGORIES (CATEGORY_ID,NAME) values (24,'Food and drink');

Insert into CATEGORIES (CATEGORY_ID,NAME) values (25,'Friendship');

Insert into CATEGORIES (CATEGORY_ID,NAME) values (26,'Funny books');

Insert into CATEGORIES (CATEGORY_ID,NAME) values (27,'Health, mind and body');

Insert into CATEGORIES (CATEGORY_ID,NAME) values (28,'Historical fiction');

Insert into CATEGORIES (CATEGORY_ID,NAME) values (29,'History');

Insert into CATEGORIES (CATEGORY_ID,NAME) values (30,'Horror');

Insert into CATEGORIES (CATEGORY_ID,NAME) values (31,'House and garden');

Insert into CATEGORIES (CATEGORY_ID,NAME) values (32,'Literary criticism');

Insert into CATEGORIES (CATEGORY_ID,NAME) values (33,'Music');

Insert into CATEGORIES (CATEGORY_ID,NAME) values (34,'Non-fiction');

Insert into CATEGORIES (CATEGORY_ID,NAME) values (35,'Paranormal romance');

Insert into CATEGORIES (CATEGORY_ID,NAME) values (36,'Philosophy');

Insert into CATEGORIES (CATEGORY_ID,NAME) values (37,'Picture books');

Insert into CATEGORIES (CATEGORY_ID,NAME) values (38,'Poetry');

Insert into CATEGORIES (CATEGORY_ID,NAME) values (39,'Politics');

Insert into CATEGORIES (CATEGORY_ID,NAME) values (40,'Reference and languages');

Insert into CATEGORIES (CATEGORY_ID,NAME) values (41,'Religion');

Insert into CATEGORIES (CATEGORY_ID,NAME) values (42,'Romance');

Insert into CATEGORIES (CATEGORY_ID,NAME) values (43,'School');

Insert into CATEGORIES (CATEGORY_ID,NAME) values (44,'Sci-fi');

Insert into CATEGORIES (CATEGORY_ID,NAME) values (45,'Science and nature');

Insert into CATEGORIES (CATEGORY_ID,NAME) values (46,'Science fiction ');

Insert into CATEGORIES (CATEGORY_ID,NAME) values (47,'Short stories');

Insert into CATEGORIES (CATEGORY_ID,NAME) values (48,'Society');

Insert into CATEGORIES (CATEGORY_ID,NAME) values (49,'Sport and leisure');

Insert into CATEGORIES (CATEGORY_ID,NAME) values (50,'Stage');

Insert into CATEGORIES (CATEGORY_ID,NAME) values (51,'Teen books');

Insert into CATEGORIES (CATEGORY_ID,NAME) values (52,'Thrillers');

Insert into CATEGORIES (CATEGORY_ID,NAME) values (53,'Travel guides');

Insert into CATEGORIES (CATEGORY_ID,NAME) values (54,'Travel writing');

Insert into CATEGORIES (CATEGORY_ID,NAME) values (55,'True crime');

Insert into CATEGORIES (CATEGORY_ID,NAME) values (56,'TV and radio');

Insert into CATEGORIES (CATEGORY_ID,NAME) values (57,'Vampires');

Insert into CATEGORIES (CATEGORY_ID,NAME) values (58,'War');



Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (274,'Lippincott Williams & Wilkins');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (275,'A. C. McClurg');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (276,'McClelland and Stewart');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (277,'Macmillan Publishers');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (278,'Mainstream Publishing');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (279,'Manning Publications');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (280,'Mandrake of Oxford');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (281,'Mandrake Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (282,'Manchester University Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (283,'Manor House Publishing');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (284,'Mapin Publishing');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (285,'Marion Boyars Publishers');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (286,'Mark Batty Publisher');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (287,'Marshall Cavendish');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (288,'Marshall Pickering');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (289,'Martinus Nijhoff Publishers');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (290,'Mascot Books');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (291,'Matthias Media');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (292,'McFarland & Company');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (293,'McGraw-Hill');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (294,'Medknow Publications');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (295,'Melbourne University Publishing');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (296,'Methuen Publishing');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (297,'Michael Joseph');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (298,'Michael O''Mara Books');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (299,'Michigan State University Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (300,'Microsoft Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (301,'The Miegunyah Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (302,'Miles Kelly Publishing');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (303,'Mills & Boon');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (304,'Minerva Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (305,'Mirage Publishing');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (306,'MIT Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (307,'Mkuki na Nyota');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (308,'Modern Library');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (309,'Mother Tongue Publishing');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (310,'John Murray');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (311,'Mycroft & Moran');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (312,'Naiad Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (313,'Nauka');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (314,'NavPress');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (315,'New Directions Publishing');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (316,'New English Library');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (317,'New Holland Publishers');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (318,'New Village Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (319,'Newnes');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (320,'Nonesuch Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (321,'Noontide Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (322,'Northwestern University Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (323,'W. W. Norton & Company');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (324,'NRC Research Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (325,'NYRB Classics');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (326,'Oberon Books');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (327,'Open University Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (328,'Orchard Books');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (329,'Oracle Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (330,'Orion Books');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (331,'Orion Publishing Group');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (332,'O''Reilly Media');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (333,'Osborne Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (334,'Osprey Publishing');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (335,'Other Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (336,'Peter Owen Publishers');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (337,'The Overlook Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (338,'Oxford University Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (339,'Packt Publishing');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (340,'Palgrave Macmillan');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (341,'Pan Books');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (342,'Pantheon Books at Random House');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (343,'Parachute Publishing');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (344,'Parragon');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (345,'Pathfinder Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (346,'Paulist Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (347,'Pavilion Books');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (348,'Peace Hill Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (349,'Pecan Grove Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (350,'Pen and Sword Books');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (351,'Penguin Books UK');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (352,'Penguin Putnam Inc.');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (353,'Penn State University Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (354,'Persephone Books');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (355,'Perseus Books Group');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (356,'Peter Lang');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (357,'Peter Owen Publishers');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (358,'Phaidon Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (359,'Philosophy Documentation Center');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (360,'Philtrum Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (361,'Picador UK');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (362,'Pimlico Books at Random House');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (363,'Pluto Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (364,'Point Blank');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (365,'Poisoned Pen Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (366,'Policy Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (367,'Polity');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (368,'Practical Action');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (369,'Prentice Hall');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (370,'Prime Books');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (371,'Princeton University Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (372,'Progress Publishers');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (373,'Prometheus Books');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (374,'Profile Books');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (375,'Puffin Books');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (376,'G. P. Putnam''s Sons');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (377,'Que Publishing');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (378,'Quebecor');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (379,'Quirk Books');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (380,'Random House');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (381,'Reed Elsevier');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (382,'D. Reidel');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (383,'Remington & Co');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (384,'Research Publishing Services');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (385,'Rigby');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (386,'Riverhead Books');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (387,'Robson Books');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (388,'Rock scorpion books');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (389,'Rodopi');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (390,'Routledge Kegan Paul');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (391,'Rowman & Littlefield');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (392,'Royal Society of Chemistry');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (393,'SAGE Publications');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (394,'Sams Publishing');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (395,'St. Martin''s Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (396,'Salt Publishing');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (397,'Schocken Books');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (398,'Scholastic Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (399,'Scribner');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (400,'Secker & Warburg');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (401,'Shambhala Publications');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (402,'Shire Books');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (403,'Shoemaker & Hoard Publishers');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (404,'Shuter & Shooter Publishers');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (405,'Sidgwick & Jackson');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (406,'Signet Books');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (407,'Simon and Schuster');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (408,'Sinclair-Stevenson Ltd');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (409,'Sounds True');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (410,'Sourcebooks');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (411,'South End Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (412,'SPCK');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (413,'Spinster''s ink books');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (414,'Spottiswoode');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (415,'Springer Science+Business Media');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (416,'Stanford University Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (417,'The Stationery Office');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (418,'Stein and Day');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (419,'Summerwild Productions');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (420,'Summit Media');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (421,'SUNY Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (422,'Sussex Academic Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (423,'Sylvan Dell Publishing');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (424,'T & T Clark');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (425,'Tachyon Publications');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (426,'Tammi, Finland');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (427,'Target Books');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (428,'Tarpaulin Sky Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (429,'Tartarus Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (430,'Taunton Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (431,'Taylor & Francis');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (432,'Ten Speed Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (433,'Thames & Hudson');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (434,'Thames & Hudson');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (435,'The Good Book Company');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (436,'Thieme Medical Publishers');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (437,'Third World Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (438,'Thomas Nelson');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (439,'Ticonderoga Publications');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (440,'Times Books');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (441,'Titan Books');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (442,'Tor Books');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (443,'Triangle Books');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (444,'Troubador Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (445,'Tupelo Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (446,'Tuttle Publishing');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (447,'Twelveheads Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (448,'UCL Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (449,'Unfinished Monument Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (450,'University of Akron Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (451,'University of Alaska Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (452,'University of California Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (453,'University of Chicago Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (454,'University of Minnesota Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (455,'University of Michigan Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (456,'University of Nebraska Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (457,'University of Pennsylvania Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (458,'University of South Carolina Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (459,'University of Toronto Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (460,'University of Wales Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (461,'University Press of America');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (462,'University Press of Kansas');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (463,'University Press of Kentucky');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (464,'Usborne Publishing');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (465,'Verso Books');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (466,'Velazquez Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (467,'Viking Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (468,'Vintage Books');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (469,'Vintage Books at Random House');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (470,'Virago Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (471,'Virgin Publishing');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (472,'Voyager Books');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (473,'VSP Publishers ');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (474,'W. W. Norton & Company');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (475,'Walter de Gruyter');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (476,'Ward Lock & Co');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (477,'WBusiness Books');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (478,'WEbook');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (479,'Weidenfeld & Nicolson');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (480,'Wesleyan University Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (481,'WestBow Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (482,'Westminster John Knox Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (483,'W. H. Allen Ltd');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (484,'Wildside Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (485,'William Edwin Rudge');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (486,'Windgate Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (487,'Wipf and Stock');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (488,'Wisdom Publications');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (489,'Woodhead Publishing');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (490,'Workman Publishing');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (491,'World Publishing Company');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (492,'World Scientific Publishing');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (493,'Wrecking Ball Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (494,'Wrox Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (495,'WSOY, Finland');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (496,'John Wiley & Sons');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (497,'Xoanon Publishing');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (498,'Yale University Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (499,'Zed Books');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (500,'Ziff Davis Media');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (501,'Zondervan');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (1,'Abilene Christian University Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (2,'Ablex Publishing');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (3,'Ace Books');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (4,'Academic Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (5,'AddisonñWesley');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (6,'Adis International');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (7,'Akashic Books');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (8,'Aladdin Paperbacks');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (9,'Allen & Unwin');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (10,'Alyson Books');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (11,'AndrÈ Deutsch');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (12,'Andrews McMeel Publishing');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (13,'Anova Books');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (14,'Anvil Press Poetry');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (15,'Applewood Books');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (16,'Apress');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (17,'Arbor House');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (18,'Arbordale Publishing');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (19,'Arcade Publishing');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (20,'Arcadia Publishing');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (21,'Airiti Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (22,'Arkham House');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (23,'Armida Publications');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (24,'ArtScroll');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (25,'A. S. Barnes');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (26,'Athabasca University Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (27,'Atheneum Books');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (28,'Atheneum Publishers');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (29,'Atlantic Books');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (30,'Atlas Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (31,'ATOM Books');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (32,'Augsburg Fortress');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (33,'Aunt Lute Books');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (34,'Avon Publications');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (35,'B & W Publishing');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (36,'Baen Books');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (37,'Baker Book House');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (38,'Banner of Truth Trust');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (39,'Barrie & Jenkins');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (40,'Basic Books');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (41,'Ballantine Books');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (42,'Bantam Books');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (43,'Bantam Spectra');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (44,'BBC Books');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (45,'Belknap Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (46,'Bella Books');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (47,'Bellevue Literary Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (48,'Berg Publishers');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (49,'Berkley Books');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (50,'Birkhauser Boston');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (51,'Bison Books');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (52,'A & C Black');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (53,'Black Dog Publishing');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (54,'Black Library');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (55,'Black Sparrow Books');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (56,'Blackie and Son Limited');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (57,'Blackwell Publishing');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (58,'Blake Publishing');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (59,'Bloodaxe Books');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (60,'Bloomsbury Publishing Plc');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (61,'Blue Ribbon Books, Garden City');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (62,'Bobbs');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (63,'Book League of America');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (64,'Book Works');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (65,'Borgo Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (66,'Boundless');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (67,'Bowes & Bowes');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (68,'Marion Boyars Publishers');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (69,'Boydell & Brewer');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (70,'Broadview Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (71,'Breslov Research Institute');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (72,'Brill Publishers');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (73,'Brimstone Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (74,'BSL Publications');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (75,'Burns & Oates');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (76,'Butterworth-Heinemann');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (77,'Caister Academic Press UK');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (78,'Cambridge University Press UK');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (79,'Candlewick Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (80,'Canongate Books');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (81,'Carcanet Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (82,'Carlton Books UK');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (83,'Carlton Publishing Group UK');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (84,'Carnegie Mellon University Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (85,'Casemate Publishers');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (86,'Cassell');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (87,'Cengage Learning');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (88,'Central European University Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (89,'Century');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (90,'Chambers Harrap');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (91,'Charles Scribner''s Sons');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (92,'Chatto and Windus');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (93,'Chick Publications');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (94,'Chronicle Books');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (95,'Churchill Livingstone');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (96,'City Lights Publishers.');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (97,'Cisco Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (98,'Cloverdale Corporation');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (99,'Cold Spring Harbor Laboratory Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (100,'Collector''s Guide Publishing');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (101,'Collins');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (102,'Columbia University Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (103,'Concordia Publishing House');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (104,'Constable & Co Ltd');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (105,'Continuum International Publishing Group');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (106,'Copper Canyon Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (107,'Cork University Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (108,'Cornell University Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (109,'Coronet Books');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (110,'Craftsman Book Company');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (111,'CRC Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (112,'Crocker & Brewster');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (113,'Crown Publishing Group');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (114,'Da Capo Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (115,'Daedalus Publishing');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (116,'Dalkey Archive Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (117,'Darakwon Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (118,'David & Charles');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (119,'DAW Books');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (120,'Dedalus Books');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (121,'Del Rey Books');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (122,'Delacorte Pres');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (123,'J. M. Dent');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (124,'Dick and Fitzgerald');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (125,'Directmedia Publishing');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (126,'DNA Publications');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (127,'Dodd, Mead and Company');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (128,'Dorchester Publishing');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (129,'Dorling Kindersley');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (130,'Doubleday');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (131,'Douglas & McIntyre');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (132,'Dove Medical Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (133,'Dover Publications');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (134,'Dundurn Group');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (135,'E. P. Dutton');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (136,'Earthscan');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (137,'ECW Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (138,'Eel Pie Publishing');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (139,'Eerdmans Publishing');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (140,'Ellora''s Cave');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (141,'Elsevier');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (142,'Emerald Group Publishing');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (143,'Europa Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (144,'Everyman''s Library');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (145,'Ewha Womans University Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (146,'Exact Change');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (147,'Faber and Faber');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (148,'FabJob');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (149,'Fairview Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (150,'Farrar, Straus & Giroux');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (151,'Fearless Books');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (152,'Felony & Mayhem Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (153,'Firebrand Books');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (154,'Flame Tree Publishing');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (155,'Flux');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (156,'Focal Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (157,'Folio Society');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (158,'Forum Media Group');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (159,'Four Courts Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (160,'Four Walls Eight Windows');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (161,'Free Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (162,'Frederick Fell Publishers, Inc.');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (163,'Frederick Warne & Co');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (164,'Fulcrum Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (165,'Funk & Wagnalls');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (166,'G-Unit Books');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (167,'Gaspereau Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (168,'Gay Men''s Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (169,'George Newnes');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (170,'Gefen Publishing House');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (171,'George Routledge & Sons');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (172,'Victor Gollancz Ltd');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (173,'Good News Publishers');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (174,'Goops Unlimited');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (175,'Goose Lane Editions');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (176,'Golden Cockerel Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (177,'Grafton');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (178,'Graywolf Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (179,'Greenleaf Book Group');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (180,'Greenery Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (181,'Greenwillow Books');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (182,'Greenwood Publishing Group');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (183,'Gregg Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (184,'Grosset & Dunlap');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (185,'Grove Press / Atlantic Monthly Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (186,'Hachette Book Group USA');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (187,'Hackett Publishing Company');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (188,'Happy House');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (189,'Hamish Hamilton');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (190,'Harcourt Trade Publishers');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (191,'Harcourt Assessment');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (192,'Harlequin Enterprises Ltd');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (193,'Harper & Brothers');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (194,'Harper & Row');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (195,'HarperCollins Publishers');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (196,'HarperPrism');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (197,'HarperTrophy');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (198,'Harry N. Abrams, Inc.');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (199,'Harvard University Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (200,'Harvest House');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (201,'Harvill Press at Random House');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (202,'Hawthorne Books');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (203,'Hay House');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (204,'Haynes Manuals');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (205,'Heinemann');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (206,'Herbert Jenkins');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (207,'Heyday Books');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (208,'HMSO');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (209,'Hodder & Stoughton');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (210,'Hodder Headline');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (211,'Hogarth Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (212,'Holland Park Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (213,'Holt McDougal');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (214,'Hoover Institution Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (215,'Horizon Scientific Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (216,'Houghton Mifflin');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (217,'House of Anansi Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (218,'The House of Murky Depths');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (219,'Howell-North Book');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (220,'Huffington Post');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (221,'Humana Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (222,'Hutchinson');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (223,'Hyperion');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (224,'Ian Allan Publishing');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (225,'IDC Publishers');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (226,'Ignatius Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (227,'Imperial War Museum');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (228,'Indiana University Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (229,'Informa Healthcare');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (230,'Information Age Publishing');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (231,'Insomniac Press Canada');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (232,'International Universities Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (233,'Inter-Varsity Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (234,'InterVarsity Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (235,'International Association of Engineers');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (236,'Ishi Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (237,'Islamic Texts Society');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (238,'Island Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (239,'Ivyspring International Publisher');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (240,'Jaico Publishing House');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (241,'Jarrolds Publishing');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (242,'John Murray');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (243,'John Wiley & Sons');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (244,'Jones and Bartlett Learning');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (245,'Kessinger Publishing');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (246,'Kluwer Academic Publishers');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (247,'Alfred A. Knopf');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (248,'Kodansha');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (249,'Koren Publishers Jerusalem');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (250,'Kumarian Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (251,'Karadi Tales');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (252,'Kogan Page');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (253,'KOYINTA Publishing House');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (254,'Ladybird Books');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (255,'Leaf Books');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (256,'Leafwood Publishers');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (257,'Left Book Club');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (258,'Legas');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (259,'Legend Books');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (260,'Lethe Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (261,'Libertas Academica');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (262,'Liberty Fund');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (263,'Library of America');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (264,'LifeBound');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (265,'Lion Hudson');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (266,'Lion Publishing');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (267,'Lionel Leventhal');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (268,'Little, Brown and Company');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (269,'Liverpool University Press');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (270,'Llewellyn Worldwide');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (271,'Longman');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (272,'LPI Media');

Insert into PUBLISHERS (PUBLISHER_ID,NAME) values (273,'Lutterworth Press');





Insert into BOOKS (ISBN,TITLE,AUTHOR_ID,ABOUT,PUBLISHER_ID,PRICE,PAGES_TOTAL_NUM,CATEGORY_ID,PUBLISHED_DATE,IMAGEPATH) values ('978-0141183848','Fictions',127,'The seventeen pieces in Ficciones demonstrate the whirlwind of Borges?s genius and mirror the precision and potency of his intellect and inventiveness, his piercing irony, his skepticism, and his obsession with fantasy. Borges sends us on a journey into a compelling, bizarre, and profoundly resonant realm; we enter the fearful sphere of Pascal?s abyss, the surreal and literal labyrinth of books, and the iconography of eternal return. To enter the worlds in Ficciones is to enter the mind of Jorge Luis Borges, wherein lies Heaven, Hell, and everything in between.',351,6.29,192,13,STR_TO_DATE('07-SEP-00','%d-%M-%y'),'/uploads/Library/imgs/fictions.jpg');

Insert into BOOKS (ISBN,TITLE,AUTHOR_ID,ABOUT,PUBLISHER_ID,PRICE,PAGES_TOTAL_NUM,CATEGORY_ID,PUBLISHED_DATE,IMAGEPATH) values ('978-0-141-19889-7','Great Expectations',23,'Pip, a young orphan living with his sister and her husband in the marshes of Kent, sits in a cemetery one evening looking at his parents? tombstones. Suddenly, an escaped convict springs up from behind a tombstone, grabs Pip, and orders him to bring him food and a file for his leg irons. Pip obeys, but the fearsome convict is soon captured anyway. The convict protects Pip by claiming to have stolen the items himself.',351,4.79,592,22,STR_TO_DATE('12-APR-12','%d-%M-%y'),'/uploads/Library/imgs/GreatExpectations.jpg');

Insert into BOOKS (ISBN,TITLE,AUTHOR_ID,ABOUT,PUBLISHER_ID,PRICE,PAGES_TOTAL_NUM,CATEGORY_ID,PUBLISHED_DATE,IMAGEPATH) values ('978-0-06-207350-1','Murder on the Orient Express',1,'Murder on the Orient Express is a detective novel featuring the Belgian detective Hercule Poirot.',195,4.11,10,18,STR_TO_DATE('29-MAR-11','%d-%M-%y'),'/uploads/Library/imgs/MurderontheOrientExpress.jpg');

Insert into BOOKS (ISBN,TITLE,AUTHOR_ID,ABOUT,PUBLISHER_ID,PRICE,PAGES_TOTAL_NUM,CATEGORY_ID,PUBLISHED_DATE,IMAGEPATH) values ('978-0099527923','Enigma',247,'Enigma is a novel by Robert Harris about Tom Jericho, a young mathematician trying to break the Germans'' "Enigma" ciphers during World War II. It was adapted to film in 2001',274,6.75,464,22,STR_TO_DATE('01-OCT-09','%d-%M-%y'),'/uploads/Library/imgs/enigma.jpg');

Insert into BOOKS (ISBN,TITLE,AUTHOR_ID,ABOUT,PUBLISHER_ID,PRICE,PAGES_TOTAL_NUM,CATEGORY_ID,PUBLISHED_DATE,IMAGEPATH) values ('978-0553296983','The Diary of a Young Girl',8,'Discovered in the attic in which she spent the last years of her life, Anne Frank''s remarkable diary has since become a world classic?a powerful reminder of the horrors of war and an eloquent testament to the human spirit. In 1942, with Nazis occupying Holland, a thirteen-year-old Jewish girl and her family fled their home in Amsterdam and went into hiding. For the next two years, until their whereabouts were betrayed to the Gestapo.',42,4.5,304,7,STR_TO_DATE('01-JUN-47','%d-%M-%y'),'/uploads/Library/imgs/TheDiaryofaYoungGirl.jpg');

Insert into BOOKS (ISBN,TITLE,AUTHOR_ID,ABOUT,PUBLISHER_ID,PRICE,PAGES_TOTAL_NUM,CATEGORY_ID,PUBLISHED_DATE,IMAGEPATH) values ('978-0593064948','I am Pilgrim',246,'What begins as an unusual and challenging investigation will become a terrifying race-against-time to save America from oblivion. Pilgrim will have to make a journey from a public beheading in Mecca to a deserted ruins on the Turkish coast via a Nazi death camp in Alsace and the barren wilderness of the Hindu Kush in search of the faceless man who would commit an appalling act of mass murder in the name of his God.',42,3.95,704,18, STR_TO_DATE ('18-JUL-13','%d-%M-%y'),'/uploads/Library/imgs/iampilgrim-220.jpg');

Insert into BOOKS (ISBN,TITLE,AUTHOR_ID,ABOUT,PUBLISHER_ID,PRICE,PAGES_TOTAL_NUM,CATEGORY_ID,PUBLISHED_DATE,IMAGEPATH) values ('978-0-06-207355-6','Death on the Nile',1,'The tranquillity of a cruise along the Nile is shattered by the discovery that Linnet Ridgeway has been shot through the head. She was young, stylish and beautiful, a girl who had everything ? until she lost her life.',101,5.99,288,18, STR_TO_DATE ('15-OCT-07','%d-%M-%y'),'/uploads/Library/imgs/DeathontheNile.jpg');

Insert into BOOKS (ISBN,TITLE,AUTHOR_ID,ABOUT,PUBLISHER_ID,PRICE,PAGES_TOTAL_NUM,CATEGORY_ID,PUBLISHED_DATE,IMAGEPATH) values ('978-1444720686','Bag of Bones',217,'Several years after his wife''s death, novelist Mike Noonan still suffers writer''s block. A dream inspires him to return to the couple''s summer retreat in western Maine, a lakeside house called Sara Laughs. Shortly after arriving, Noonan is caught in the middle of a custody battle involving the daughter of an attractive young widow and the child''s enormously wealthy grandfather. He also discovers that Sara Laughs is haunted and that his late wife, Joanna, still has something to tell him.',209,7.95,672,30, STR_TO_DATE ('04-AUG-11','%d-%M-%y'),'/uploads/Library/imgs/BagofBones.jpg');

Insert into BOOKS (ISBN,TITLE,AUTHOR_ID,ABOUT,PUBLISHER_ID,PRICE,PAGES_TOTAL_NUM,CATEGORY_ID,PUBLISHED_DATE,IMAGEPATH) values ('978-1604503289','The Aleph',127,'When the writer feels that his attempts are not properly being requited with the results he desired, he starts to have doubts about the path he is following and about the things he is doing. Then, as his master J. says, he starts trying to become the "King of [his] Kingdom". The master J. tells him that what the writer is feeling is what he himself had felt some years back. That way, the writer is convinced that what he is in is a phase he cannot withdraw himself from and then he goes to travel. The writer persuades his agent, and then makes out a way to visit Russia for his tour, on the pretext of signing books and holding various programmes for the promotion of his books in the northern Eurasian parts. In Russia, he comes across a girl, Hilal, who happens to be a Turk. She talks about her dream about a friend with a light and so does the story develops. Hilal also joins the writer in his carriage in the train. Then, in a vestibule, the two of them, the writer and Hilal see Aleph, which is defined as "a point where everything, the whole universe is contained"',351,7.99,224,13, STR_TO_DATE ('07-SEP-00','%d-%M-%y'),'/uploads/Library/imgs/elaleph.jpg');


Insert into BOOK_STOCK (ISBN,BOOK_COPIES_NUM) values ('978-0-141-19889-7',10);

Insert into BOOK_STOCK (ISBN,BOOK_COPIES_NUM) values ('978-0141183848',3);

Insert into BOOK_STOCK (ISBN,BOOK_COPIES_NUM) values ('978-0-06-207350-1',6);

Insert into BOOK_STOCK (ISBN,BOOK_COPIES_NUM) values ('978-0099527923',10);

Insert into BOOK_STOCK (ISBN,BOOK_COPIES_NUM) values ('978-0553296983',2);

Insert into BOOK_STOCK (ISBN,BOOK_COPIES_NUM) values ('978-0593064948',20);

Insert into BOOK_STOCK (ISBN,BOOK_COPIES_NUM) values ('978-0-06-207355-6',75);

Insert into BOOK_STOCK (ISBN,BOOK_COPIES_NUM) values ('978-1444720686',20);

Insert into BOOK_STOCK (ISBN,BOOK_COPIES_NUM) values ('978-1604503289',5);



Insert into LIBUSER_TITLES (TITLE_ID,TITLE) values (1,'Mr');

Insert into LIBUSER_TITLES (TITLE_ID,TITLE) values (2,'Mrs');

Insert into LIBUSER_TITLES (TITLE_ID,TITLE) values (3,'Ms');

Insert into LIBUSER_TITLES (TITLE_ID,TITLE) values (4,'Miss');

Insert into LIBUSER_TITLES (TITLE_ID,TITLE) values (5,'Dr');

Insert into LIBUSER_TITLES (TITLE_ID,TITLE) values (6,'Professor');

Insert into LIBUSER_TITLES (TITLE_ID,TITLE) values (7,'Lord');

Insert into LIBUSER_TITLES (TITLE_ID,TITLE) values (8,'Sir');

Insert into LIBUSER_TITLES (TITLE_ID,TITLE) values (9,'Master');

Insert into LIBUSER_TITLES (TITLE_ID,TITLE) values (10,'Other');

ALTER TABLE books ADD INDEX title_index(title);

ALTER TABLE authors ADD INDEX name_index(name);


/*
CREATE OR REPLACE PACKAGE "HERNANRIZZUTI"."TYPES" AS
type cursorType is REF CURSOR;
END;

/
*/

-- ------------------------------------------------------

--  DDL for Procedures

-- ------------------------------------------------------
DELIMITER //

CREATE PROCEDURE ADD_BOOK (IN isbn_in VARCHAR(20),IN title_in VARCHAR(50),IN author_in VARCHAR(50),IN about_in VARCHAR(2000),
						  IN publisher_in VARCHAR(60),IN price_in DECIMAL(10,2),IN pages_in INT(20),IN category_in VARCHAR(50),
						  IN date_in  VARCHAR(20),IN copies_in INT(20), IN imagepath_in VARCHAR(300))
BEGIN
INSERT INTO books
(
	isbn,title,author_id,about,publisher_id,price,pages_total_num,category_id,published_date,imagepath
)
VALUES
(
	isbn_in, title_in,(SELECT author_id FROM authors WHERE name = author_in),about_in,
	(SELECT publisher_id FROM publishers WHERE name = publisher_in ), price_in, pages_in,
	(SELECT category_id FROM categories WHERE name = category_in), STR_TO_DATE(date_in,'%m/%d/%Y'), imagepath_in
);
INSERT INTO book_stock (isbn,book_copies_num) VALUES (isbn_in,copies_in);

END//

DELIMITER ;

-- ------------------------------------------------------

DELIMITER //

CREATE PROCEDURE ADD_LIBUSER(IN username_in VARCHAR(50),IN password_in VARCHAR(100),IN title_id_in INT(10),IN firstname_in VARCHAR(50),
								IN lastname_in VARCHAR(50),IN email_in VARCHAR(50),IN enabled_in INT(10),IN authority_in VARCHAR(50))
BEGIN
  INSERT
  INTO libusers
    (
      username,
      password,
      title_id,
      firstname,
      lastname,
      email,
      enabled
    )
    VALUES
    (
      username_in,
      password_in,
      title_id_in,
      firstname_in,
      lastname_in,
      email_in,
      enabled_in
    );
  INSERT
  INTO libuser_roles
    (
      username,
      authority
    )
    VALUES
    (
      username_in,
      authority_in
    );

END//

DELIMITER ;

-- ------------------------------------------------------
/*DROP PROCEDURE IF EXISTS GET_LIBUSER;*/
DELIMITER //

CREATE PROCEDURE GET_LIBUSER(IN username_in VARCHAR(50))
BEGIN
SELECT
      lu.username,
      lu.password,
      lt.title,
      lu.firstname,
      lu.lastname,
      lu.email
FROM
      libusers lu
JOIN libuser_titles lt on lu.title_id = lt.title_id 
WHERE username=username_in;

END//

DELIMITER ;

---------------------------------------------------------

DELIMITER //

CREATE PROCEDURE BOOK_SEARCH(IN criteria_in VARCHAR(50))
BEGIN
SELECT
  b.isbn,
  b.title,
  a.name as author
FROM
  books b
     INNER JOIN
    authors a
      ON
    a.author_id = b.author_id
WHERE b.title = criteria_in OR a.name = criteria_in;
END//

DELIMITER ;

-- ------------------------------------------------------

DELIMITER //

CREATE PROCEDURE GET_AUTHORS()
BEGIN
  SELECT 
    name
  FROM
    authors;
END//
DELIMITER ;
-- ------------------------------------------------------

DELIMITER //

CREATE PROCEDURE GET_BOOK (IN title_in VARCHAR(50))
BEGIN
  SELECT 
    b.isbn, 
    b.title, 
    a.name AS author, 
    b.about, 
    c.name AS
    category, 
    b.price, 
    bs.book_copies_num AS copies, 
    b.pages_total_num AS pages, 
    p.name AS publisher, 
    b.imagepath 
  FROM 
    books b 
    INNER JOIN
      book_stock bs 
    ON bs.isbn = b.isbn 
    INNER JOIN 
      authors a 
    ON a.author_id=b.author_id 
    INNER JOIN 
      categories c 
    ON c.category_id = b.category_id
    INNER JOIN 
      publishers p 
    ON p.publisher_id = b.publisher_id 
  WHERE b.title = title_in;
END//

DELIMITER ;

-- ------------------------------------------------------

DELIMITER //

CREATE PROCEDURE GET_BOOKS ()
BEGIN
SELECT
  b.isbn,
  b.title,
  a.name as author,
  b.about,
  c.name as category,
  b.price,
  bs.book_copies_num as copies,
  b.pages_total_num as pages,
  p.name as publisher,
  b.imagepath
FROM
  books b
     INNER JOIN
    book_stock bs
     ON
    bs.isbn = b.isbn
      INNER JOIN
    authors a
      ON
    a.author_id=b.author_id
      INNER JOIN
    categories c
      ON
    c.category_id = b.category_id
      INNER JOIN
    publishers p
      ON
    p.publisher_id = b.publisher_id;
END//

DELIMITER ;

-- ------------------------------------------------------

DELIMITER //

CREATE PROCEDURE GET_BOOKSTOCK_BY_TITLE_COPY ()
BEGIN
SELECT
  b.title,
  bs.book_copies_num
FROM
  books b
     INNER JOIN
   book_stock bs
     ON
    bs.isbn = b.isbn;
END//

DELIMITER ;

-- ------------------------------------------------------

DELIMITER //

CREATE PROCEDURE GET_BOOK_STOCK ()
BEGIN
SELECT
  SUM(book_copies_num) AS copies
FROM
  book_stock;

END//

DELIMITER ;

-- ------------------------------------------------------

DELIMITER //

CREATE PROCEDURE GET_BOOK_STOCK_BY_TITLE_COPY ()
BEGIN
SELECT
  b.title,
  bs.book_copies_num
FROM
  books b
     INNER JOIN
   book_stock bs
     ON
    bs.isbn = b.isbn;

END//

DELIMITER ;

DELIMITER //

CREATE PROCEDURE ADD_BASKET(IN username_in VARCHAR(50), IN map_name_in VARCHAR(60),IN basket_in BLOB)
BEGIN 
INSERT INTO shopping_cart(username, map_name, basket) VALUES (username_in, map_name_in, basket_in);

END//

DELIMITER ;


-- -----------------------------------------------------------

CREATE TABLE card_type
(
card_type_id INT(10) PRIMARY KEY
,name VARCHAR(60)
);


CREATE TABLE card
(
card_id INT(10) AUTO_INCREMENT PRIMARY KEY
,card_number VARCHAR(100)
,cardholders_name VARCHAR(60)
,card_type_id INT(10)
,expiry_date DATE
,CONSTRAINT ct_c_card_type_id_fk FOREIGN KEY(card_type_id) REFERENCES card_type(card_type_id)
);

CREATE TABLE address
(
address_id INT(10) AUTO_INCREMENT PRIMARY KEY
,address_type_1 VARCHAR(60)
,address_type_2 VARCHAR(60)
,town_city VARCHAR(60)
,county VARCHAR(60)
,post_code VARCHAR(60)
,country_id INT(10)
,CONSTRAINT a_c_country_id_fk FOREIGN KEY(country_id) REFERENCES country(country_id)
);

drop table libuser_address;
CREATE TABLE libuser_address
(
libuser_address_id INT(10) AUTO_INCREMENT PRIMARY KEY
,username VARCHAR(50)
,address_id INT(10)
,address_type_id INT(10)
,active INT(2)
,CONSTRAINT lua_lu_username_fk FOREIGN KEY(username) REFERENCES libusers(username)
,CONSTRAINT lua_lu_address_id_fk FOREIGN KEY(address_id) REFERENCES address(address_id)
,CONSTRAINT lua_lu_address_type_id_fk FOREIGN KEY(address_type_id) REFERENCES address_type(address_type_id)
);

CREATE TABLE address_type 
(
address_type_id INT(10)  PRIMARY KEY
,address_type_desc VARCHAR(60)
);

CREATE TABLE country
(
country_id INT(10) PRIMARY KEY
,country_name VARCHAR(50)
);

CREATE TABLE orders
(
order_id INT(10) AUTO_INCREMENT PRIMARY KEY
,username VARCHAR(50)
,billing_address_id INT(10)
,delivery_address_id INT(10)
,ordered_date DATE
,CONSTRAINT order_lua_b_a_fk FOREIGN KEY(billing_address_id) REFERENCES libuser_address(libuser_address_id)
,CONSTRAINT order_lua_d_a_fk FOREIGN KEY(delivery_address_id) REFERENCES libuser_address(libuser_address_id)
,CONSTRAINT order_lu_username_fk FOREIGN KEY(username) REFERENCES libusers(username)
);


CREATE TABLE order_details
(
order_details_id INT(10) AUTO_INCREMENT PRIMARY KEY
,order_id INT(10)
,shop_cart_hist_id INT(10)
,CONSTRAINT order_details_o_order_id_fk FOREIGN KEY(order_id) REFERENCES orders(order_id)
,CONSTRAINT order_details_o_s_c_h_id_fk FOREIGN KEY(shop_cart_hist_id) REFERENCES shopping_cart_history(shop_cart_hist_id)
);

-- TO DO
-- once the order is placed then a stored pro needs to more the basket to shopping_cart_history
-- if I want to see deatils about the orders i can see those in order_details table which is link orders and shopping_cart_history
