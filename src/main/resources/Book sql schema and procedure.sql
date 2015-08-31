--------------------------------------------------------
--  File created - Monday-May-11-2015   
--------------------------------------------------------
--------------------------------------------------------

--  DDL for Sequence ATMUSER_ID_SEQ

--------------------------------------------------------


   CREATE SEQUENCE  "HERNANRIZZUTI"."ATMUSER_ID_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------

--  DDL for Sequence BOOK_STOCK_ID_SEQ

--------------------------------------------------------


   CREATE SEQUENCE  "HERNANRIZZUTI"."BOOK_STOCK_ID_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 221 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------

--  DDL for Sequence BROKER_SEQ

--------------------------------------------------------


   CREATE SEQUENCE  "HERNANRIZZUTI"."BROKER_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 16 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------

--  DDL for Sequence HIBERNATE_SEQUENCE

--------------------------------------------------------


   CREATE SEQUENCE  "HERNANRIZZUTI"."HIBERNATE_SEQUENCE"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------

--  DDL for Sequence INCREMENTCAR1_ID_PK

--------------------------------------------------------


   CREATE SEQUENCE  "HERNANRIZZUTI"."INCREMENTCAR1_ID_PK"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 2 START WITH 48 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------

--  DDL for Sequence INCREMENTCAR_ID_PK

--------------------------------------------------------


   CREATE SEQUENCE  "HERNANRIZZUTI"."INCREMENTCAR_ID_PK"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 26 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------

--  DDL for Sequence INCREMENT_PK

--------------------------------------------------------


   CREATE SEQUENCE  "HERNANRIZZUTI"."INCREMENT_PK"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 26 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------

--  DDL for Sequence MMUSERS_ID_SEQ

--------------------------------------------------------


   CREATE SEQUENCE  "HERNANRIZZUTI"."MMUSERS_ID_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------

--  DDL for Sequence SHARE_ISSUE_ID_SEQ

--------------------------------------------------------


   CREATE SEQUENCE  "HERNANRIZZUTI"."SHARE_ISSUE_ID_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 29 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------

--  DDL for Sequence SHOP_CARD_HIST_ID_SEQ

--------------------------------------------------------


   CREATE SEQUENCE  "HERNANRIZZUTI"."SHOP_CARD_HIST_ID_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------

--  DDL for Sequence TAB_CUSTOMER_SEQ

--------------------------------------------------------


   CREATE SEQUENCE  "HERNANRIZZUTI"."TAB_CUSTOMER_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------

--  DDL for Sequence TD_ID_SEQ

--------------------------------------------------------


   CREATE SEQUENCE  "HERNANRIZZUTI"."TD_ID_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 381 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------

--  DDL for Sequence USER_ID_SEQ

--------------------------------------------------------


   CREATE SEQUENCE  "HERNANRIZZUTI"."USER_ID_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 301 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------

--  DDL for Table ACCOUNTS

--------------------------------------------------------


  CREATE TABLE "HERNANRIZZUTI"."ACCOUNTS" 
   (	"ACCOUNTNO" NUMBER(2,0), 
	"BALANCE" NUMBER(6,2)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------

--  DDL for Table AUTHORS

--------------------------------------------------------


  CREATE TABLE "HERNANRIZZUTI"."AUTHORS" 
   (	"AUTHOR_ID" NUMBER(10,0), 
	"NAME" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------

--  DDL for Table BOOKS

--------------------------------------------------------


  CREATE TABLE "HERNANRIZZUTI"."BOOKS" 
   (	"ISBN" VARCHAR2(20 BYTE), 
	"TITLE" VARCHAR2(50 BYTE), 
	"AUTHOR_ID" NUMBER(10,0), 
	"ABOUT" VARCHAR2(2000 CHAR), 
	"PUBLISHER_ID" NUMBER(10,0), 
	"PRICE" NUMBER(6,2), 
	"PAGES_TOTAL_#" NUMBER(20,0), 
	"CATEGORY_ID" NUMBER(10,0), 
	"PUBLISHED_DATE" DATE, 
	"IMAGEPATH" VARCHAR2(200 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------

--  DDL for Table BOOK_AUTHOR

--------------------------------------------------------


  CREATE TABLE "HERNANRIZZUTI"."BOOK_AUTHOR" 
   (	"ISBN" VARCHAR2(20 BYTE), 
	"AUTHOR_ID" NUMBER(10,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------

--  DDL for Table BOOK_CATEGORY

--------------------------------------------------------


  CREATE TABLE "HERNANRIZZUTI"."BOOK_CATEGORY" 
   (	"ISBN" VARCHAR2(20 BYTE), 
	"CATEGORY_ID" NUMBER(10,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------

--  DDL for Table BOOK_STOCK

--------------------------------------------------------


  CREATE TABLE "HERNANRIZZUTI"."BOOK_STOCK" 
   (	"BOOK_STOCK_ID" NUMBER(10,0), 
	"ISBN" VARCHAR2(20 BYTE), 
	"BOOK_COPIES_#" NUMBER(20,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------

--  DDL for Table CATEGORIES

--------------------------------------------------------


  CREATE TABLE "HERNANRIZZUTI"."CATEGORIES" 
   (	"CATEGORY_ID" NUMBER(10,0), 
	"NAME" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------

--  DDL for Table LIBUSERS

--------------------------------------------------------


  CREATE TABLE "HERNANRIZZUTI"."LIBUSERS" 
   (	"USERNAME" VARCHAR2(50 CHAR), 
	"PASSWORD" VARCHAR2(100 CHAR), 
	"TITLE_ID" NUMBER(10,0), 
	"FIRSTNAME" VARCHAR2(50 CHAR), 
	"LASTNAME" VARCHAR2(50 CHAR), 
	"EMAIL" VARCHAR2(50 CHAR), 
	"ENABLED" NUMBER(10,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------

--  DDL for Table LIBUSER_ROLES

--------------------------------------------------------


  CREATE TABLE "HERNANRIZZUTI"."LIBUSER_ROLES" 
   (	"USER_ROLE_ID" NUMBER(10,0), 
	"USERNAME" VARCHAR2(100 CHAR), 
	"AUTHORITY" VARCHAR2(50 CHAR)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------

--  DDL for Table LIBUSER_TITLES

--------------------------------------------------------


  CREATE TABLE "HERNANRIZZUTI"."LIBUSER_TITLES" 
   (	"TITLE_ID" NUMBER(10,0), 
	"TITLE" VARCHAR2(20 CHAR)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------

--  DDL for Table PUBLISHERS

--------------------------------------------------------


  CREATE TABLE "HERNANRIZZUTI"."PUBLISHERS" 
   (	"PUBLISHER_ID" NUMBER(10,0), 
	"NAME" VARCHAR2(60 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------

--  DDL for Table SHOPPING_CART

--------------------------------------------------------


  CREATE TABLE "HERNANRIZZUTI"."SHOPPING_CART" 
   (	"USERNAME" VARCHAR2(50 BYTE), 
	"MAP_NAME" VARCHAR2(2000 BYTE), 
	"BASKET" BLOB DEFAULT empty_blob()
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 LOB ("BASKET") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;
--------------------------------------------------------

--  DDL for Table SHOPPING_CART_HISTORY

--------------------------------------------------------


  CREATE TABLE "HERNANRIZZUTI"."SHOPPING_CART_HISTORY" 
   (	"SHOPPING_CART_HISTORY_ID" NUMBER(30,0), 
	"USERNAME" VARCHAR2(50 BYTE), 
	"MAP_NAME" VARCHAR2(2000 BYTE), 
	"BASKET" BLOB DEFAULT empty_blob(), 
	"SHOPPING_DATE" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 LOB ("BASKET") STORE AS BASICFILE (
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;
REM INSERTING into HERNANRIZZUTI.ACCOUNTS

SET DEFINE OFF;

Insert into HERNANRIZZUTI.ACCOUNTS (ACCOUNTNO,BALANCE) values (1,0);

REM INSERTING into HERNANRIZZUTI.AUTHORS

SET DEFINE OFF;

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (246,' Terry Hayes');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (247,'Robert Harris');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (1,'Agatha Christie');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (2,'Alan Moore');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (3,'Albert Camus');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (4,'Aldous Huxley');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (5,'Alexander Mccall Smith');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (6,'Allen Ginsberg');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (7,'Anaïs Nin');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (8,'Anne Frank');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (9,'Anne Rice');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (10,'Antoine De Saint-Exupéry');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (11,'Anton Chekhov');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (12,'Arthur C. Clarke');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (13,'Arthur Miller');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (14,'Arundhati Roy');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (15,'Astrid Lindgren');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (16,'Ayn Rand');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (17,'Barbara Cartland');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (18,'Beatrix Potter');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (19,'Beverly Cleary');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (20,'Brian Jacques');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (21,'C. S. Lewis');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (22,'Carol Ann Duffy');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (23,'Charles Dickens');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (24,'Chinua Achebe');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (25,'Christopher Hitchens');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (26,'Christopher Marlowe');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (27,'Christopher Paolini');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (28,'Chuck Palahniuk');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (29,'Clive Cussler');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (30,'Cormac McCarthy');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (31,'Czes?aw Mi?osz');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (32,'D.H. Lawrence');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (33,'Dale Carnegie');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (34,'Dan Brown');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (35,'Danielle Steel');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (36,'Dante Alighieri');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (37,'Daphne du Maurier');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (38,'Dashiell Hammett');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (39,'Dav Pilkey');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (40,'David Baldacci');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (41,'David Foster Wallace');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (42,'David Sedaris');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (43,'Dean Koontz');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (44,'Debbie Macomber');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (45,'Denis Diderot');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (46,'Don DeLillo');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (47,'Doris Lessing');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (48,'Douglas Adams');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (49,'Dr. Seuss');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (50,'E.M. Forster');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (51,'Edgar Allan Poe');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (52,'Edith Wharton');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (53,'Elbert Hubbard');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (54,'Elie Wiesel');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (55,'Ellen G. White');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (56,'Émile Zola');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (57,'Emily Dickinson');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (58,'Enid Blyton');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (59,'Eoin Colfer');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (60,'Eric Carle');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (61,'Erica Jong');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (62,'Ernest Hemingway');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (63,'Euripides');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (64,'F. Scott Fitzgerald');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (65,'Fernando Pessoa');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (66,'Frank McCourt');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (67,'Flannery O’Connor');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (68,'Franz Kafka');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (69,'Gabriel García Márquez');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (70,'Geoffrey Chaucer');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (71,'George Bernard Shaw');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (72,'George Eliot');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (73,'George Orwell');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (74,'George R. R. Martin');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (75,'Germaine Greer');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (76,'Gertrude Stein');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (77,'Giacomo Leopardi');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (78,'Giovanni Boccaccio');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (79,'Günter Grass');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (80,'Gustave Flaubert');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (81,'H. G. Wells');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (82,'Hans Christian Andersen');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (83,'Harper Lee');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (84,'Haruki Murakami');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (85,'Henning Mankell');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (86,'Henrik Ibsen');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (87,'Henry David Thoreau');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (88,'Henry James');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (89,'Henry Miller');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (90,'Herman Melville');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (91,'Hermann Hesse');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (92,'Homer');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (93,'Honoré De Balzac');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (94,'Hunter S. Thompson');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (95,'Ian Fleming');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (96,'Ian McEwan');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (97,'Isaac Asimov');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (98,'Isabel Allende');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (99,'Italo Calvino');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (100,'Italo Svevo');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (101,'J. G. Ballard');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (102,'J. K. Rowling');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (103,'J. R. R. Tolkien');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (104,'J.D. Salinger');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (105,'Jack Kerouac');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (106,'Jack London');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (107,'Jackie Collins');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (108,'Jacqueline Wilson');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (109,'James Frey');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (110,'James Joyce');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (111,'James Patterson');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (112,'Jane Austen');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (113,'Jean M. Auel');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (114,'Jeff Kinney');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (115,'Jeffrey Archer');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (116,'Jo Nesbø');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (117,'Johann Wolfgang Von Goethe');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (118,'John Gray');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (119,'John Grisham');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (120,'John Irving');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (121,'John Keats');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (122,'John Milton');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (123,'John Steinbeck');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (124,'John Updike');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (125,'Jonathan Safran Foer');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (126,'Jonathan Swift');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (127,'Jorge Luis Borges');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (128,'José Saramago');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (129,'Joseph Conrad');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (130,'Joseph Heller');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (131,'Jostein Gaarder');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (132,'Joyce Carol Oates');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (133,'Juan Rulfo');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (134,'Jules Verne');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (135,'Julian Barnes');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (136,'Karl May');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (137,'Kazuo Ishiguro');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (138,'Ken Follett');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (139,'Khaled Hosseini');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (140,'Khalil Gibran');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (141,'Knut Hamsun');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (142,'Kurt Vonnegut');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (143,'Laura Ingalls Wilder');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (144,'Lee Child');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (145,'Leo Tolstoy');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (146,'Lewis Carroll');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (147,'Lord Byron');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (148,'Louise Hay');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (149,'Malcolm Gladwell');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (150,'Marcel Proust');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (151,'Margaret Mitchell');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (152,'Margaret Peterson Haddix');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (153,'Marguerite Yourcenar');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (154,'Mario Puzo');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (155,'Mario Vargas Llosa');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (156,'Mark Twain');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (157,'Martin Amis');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (158,'Mary Higgins Clark');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (159,'Mary Shelley');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (160,'Maurice Sendak');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (161,'Maya Angelou');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (162,'Michael Crichton');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (163,'Michel De Montaigne');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (164,'Michel Houellebecq');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (165,'Miguel De Cervantes');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (166,'Mitch Albom');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (167,'Napoleon Hill');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (168,'Neil Gaiman');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (169,'Niall Ferguson');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (170,'Nicholas Sparks');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (171,'Nick Hornby');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (172,'Nicole Krauss');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (173,'Nora Roberts');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (174,'Norman Mailer');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (175,'Oscar Wilde');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (176,'Ovid');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (177,'P. D. James');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (178,'Patricia Cornwell');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (179,'Paul Auster');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (180,'Paul Celan');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (181,'Paul Valéry');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (182,'Paulo Coelho');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (183,'Peter Hitchens');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (184,'Philip Pullman');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (185,'Pierre Dukan');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (186,'R. L. Stine');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (187,'Ralph Ellison');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (188,'Raymond Carver');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (189,'Raymond Chandler');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (190,'Raymond E. Feist');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (191,'Rhonda Byrne');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (192,'Richard Bach');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (193,'Richard Scarry');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (194,'Richard Wright');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (195,'Rick Riordan');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (196,'Rick Warren');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (197,'Roald Dahl');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (198,'Robert Jordan');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (199,'Robert Louis Stevenson');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (200,'Robert Ludlum');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (201,'Robert Munsch');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (202,'Robin Cook');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (203,'Roger Hargreaves');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (204,'Rudyard Kipling');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (205,'Rumi');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (206,'S. E. Hinton');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (207,'Salman Rushdie');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (208,'Samuel Beckett');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (209,'Samuel Johnson');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (210,'Seamus Heaney');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (211,'Shaun Tan');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (212,'Sidney Sheldon');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (213,'Simone de Beauvoir');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (214,'Sophocles');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (215,'Stendhal');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (216,'Stephen Hawking');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (217,'Stephen King');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (218,'Stephenie Meyer');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (219,'Stieg Larsson');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (220,'Suzanne Collins');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (221,'Sylvia Plath');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (222,'Ted Hughes');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (223,'Tennessee Williams');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (224,'Terry Brooks');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (225,'Terry Pratchett');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (226,'Thomas Mann');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (227,'Thomas Pynchon');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (228,'Tom Clancy');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (229,'Tom Robbins');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (230,'Toni Morrison');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (231,'Truman Capote');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (232,'Umberto Eco');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (233,'Viktor Frankl');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (234,'Virgil');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (235,'Virginia Woolf');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (236,'Vladimir Nabokov');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (237,'Walt Whitman');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (238,'Wilbur Smith');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (239,'William Blake');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (240,'William Faulkner');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (241,'William Gibson');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (242,'William Golding');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (243,'William S. Burroughs');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (244,'William Shakespeare');

Insert into HERNANRIZZUTI.AUTHORS (AUTHOR_ID,NAME) values (245,'Zora Neale Hurston');

REM INSERTING into HERNANRIZZUTI.BOOKS

SET DEFINE OFF;

Insert into HERNANRIZZUTI.BOOKS (ISBN,TITLE,AUTHOR_ID,ABOUT,PUBLISHER_ID,PRICE,PAGES_TOTAL_#,CATEGORY_ID,PUBLISHED_DATE,IMAGEPATH) values ('978-0141183848','Fictions',127,'The seventeen pieces in Ficciones demonstrate the whirlwind of Borges?s genius and mirror the precision and potency of his intellect and inventiveness, his piercing irony, his skepticism, and his obsession with fantasy. Borges sends us on a journey into a compelling, bizarre, and profoundly resonant realm; we enter the fearful sphere of Pascal?s abyss, the surreal and literal labyrinth of books, and the iconography of eternal return. To enter the worlds in Ficciones is to enter the mind of Jorge Luis Borges, wherein lies Heaven, Hell, and everything in between.',351,6.29,192,13,to_date('07-SEP-00','DD-MON-RR'),'/uploads/Library/imgs/fictions.jpg');

Insert into HERNANRIZZUTI.BOOKS (ISBN,TITLE,AUTHOR_ID,ABOUT,PUBLISHER_ID,PRICE,PAGES_TOTAL_#,CATEGORY_ID,PUBLISHED_DATE,IMAGEPATH) values ('978-0-141-19889-7','Great Expectations',23,'Pip, a young orphan living with his sister and her husband in the marshes of Kent, sits in a cemetery one evening looking at his parents? tombstones. Suddenly, an escaped convict springs up from behind a tombstone, grabs Pip, and orders him to bring him food and a file for his leg irons. Pip obeys, but the fearsome convict is soon captured anyway. The convict protects Pip by claiming to have stolen the items himself.',351,4.79,592,22,to_date('12-APR-12','DD-MON-RR'),'/uploads/Library/imgs/GreatExpectations.jpg');

Insert into HERNANRIZZUTI.BOOKS (ISBN,TITLE,AUTHOR_ID,ABOUT,PUBLISHER_ID,PRICE,PAGES_TOTAL_#,CATEGORY_ID,PUBLISHED_DATE,IMAGEPATH) values ('978-0-06-207350-1','Murder on the Orient Express',1,'Murder on the Orient Express is a detective novel featuring the Belgian detective Hercule Poirot.',195,4.11,10,18,to_date('29-MAR-11','DD-MON-RR'),'/uploads/Library/imgs/MurderontheOrientExpress.jpg');

Insert into HERNANRIZZUTI.BOOKS (ISBN,TITLE,AUTHOR_ID,ABOUT,PUBLISHER_ID,PRICE,PAGES_TOTAL_#,CATEGORY_ID,PUBLISHED_DATE,IMAGEPATH) values ('978-0099527923','Enigma',247,'Enigma is a novel by Robert Harris about Tom Jericho, a young mathematician trying to break the Germans'' "Enigma" ciphers during World War II. It was adapted to film in 2001',274,6.75,464,22,to_date('01-OCT-09','DD-MON-RR'),'/uploads/Library/imgs/enigma.jpg');

Insert into HERNANRIZZUTI.BOOKS (ISBN,TITLE,AUTHOR_ID,ABOUT,PUBLISHER_ID,PRICE,PAGES_TOTAL_#,CATEGORY_ID,PUBLISHED_DATE,IMAGEPATH) values ('978-0553296983','The Diary of a Young Girl',8,'Discovered in the attic in which she spent the last years of her life, Anne Frank''s remarkable diary has since become a world classic?a powerful reminder of the horrors of war and an eloquent testament to the human spirit. In 1942, with Nazis occupying Holland, a thirteen-year-old Jewish girl and her family fled their home in Amsterdam and went into hiding. For the next two years, until their whereabouts were betrayed to the Gestapo.',42,4.5,304,7,to_date('01-JUN-47','DD-MON-RR'),'/uploads/Library/imgs/TheDiaryofaYoungGirl.jpg');

Insert into HERNANRIZZUTI.BOOKS (ISBN,TITLE,AUTHOR_ID,ABOUT,PUBLISHER_ID,PRICE,PAGES_TOTAL_#,CATEGORY_ID,PUBLISHED_DATE,IMAGEPATH) values ('978-0593064948','I am Pilgrim',246,'What begins as an unusual and challenging investigation will become a terrifying race-against-time to save America from oblivion. Pilgrim will have to make a journey from a public beheading in Mecca to a deserted ruins on the Turkish coast via a Nazi death camp in Alsace and the barren wilderness of the Hindu Kush in search of the faceless man who would commit an appalling act of mass murder in the name of his God.',42,3.95,704,18,to_date('18-JUL-13','DD-MON-RR'),'/uploads/Library/imgs/iampilgrim-220.jpg');

Insert into HERNANRIZZUTI.BOOKS (ISBN,TITLE,AUTHOR_ID,ABOUT,PUBLISHER_ID,PRICE,PAGES_TOTAL_#,CATEGORY_ID,PUBLISHED_DATE,IMAGEPATH) values ('978-0-06-207355-6','Death on the Nile',1,'The tranquillity of a cruise along the Nile is shattered by the discovery that Linnet Ridgeway has been shot through the head. She was young, stylish and beautiful, a girl who had everything ? until she lost her life.',101,5.99,288,18,to_date('15-OCT-07','DD-MON-RR'),'/uploads/Library/imgs/DeathontheNile.jpg');

Insert into HERNANRIZZUTI.BOOKS (ISBN,TITLE,AUTHOR_ID,ABOUT,PUBLISHER_ID,PRICE,PAGES_TOTAL_#,CATEGORY_ID,PUBLISHED_DATE,IMAGEPATH) values ('978-1444720686','Bag of Bones',217,'Several years after his wife''s death, novelist Mike Noonan still suffers writer''s block. A dream inspires him to return to the couple''s summer retreat in western Maine, a lakeside house called Sara Laughs. Shortly after arriving, Noonan is caught in the middle of a custody battle involving the daughter of an attractive young widow and the child''s enormously wealthy grandfather. He also discovers that Sara Laughs is haunted and that his late wife, Joanna, still has something to tell him.',209,7.95,672,30,to_date('04-AUG-11','DD-MON-RR'),'/uploads/Library/imgs/BagofBones.jpg');

Insert into HERNANRIZZUTI.BOOKS (ISBN,TITLE,AUTHOR_ID,ABOUT,PUBLISHER_ID,PRICE,PAGES_TOTAL_#,CATEGORY_ID,PUBLISHED_DATE,IMAGEPATH) values ('978-1604503289','The Aleph',127,'When the writer feels that his attempts are not properly being requited with the results he desired, he starts to have doubts about the path he is following and about the things he is doing. Then, as his master J. says, he starts trying to become the "King of [his] Kingdom". The master J. tells him that what the writer is feeling is what he himself had felt some years back. That way, the writer is convinced that what he is in is a phase he cannot withdraw himself from and then he goes to travel. The writer persuades his agent, and then makes out a way to visit Russia for his tour, on the pretext of signing books and holding various programmes for the promotion of his books in the northern Eurasian parts. In Russia, he comes across a girl, Hilal, who happens to be a Turk. She talks about her dream about a friend with a light and so does the story develops. Hilal also joins the writer in his carriage in the train. Then, in a vestibule, the two of them, the writer and Hilal see Aleph, which is defined as "a point where everything, the whole universe is contained"',351,7.99,224,13,to_date('07-SEP-00','DD-MON-RR'),'/uploads/Library/imgs/elaleph.jpg');

REM INSERTING into HERNANRIZZUTI.BOOK_AUTHOR

SET DEFINE OFF;

REM INSERTING into HERNANRIZZUTI.BOOK_CATEGORY

SET DEFINE OFF;

REM INSERTING into HERNANRIZZUTI.BOOK_STOCK

SET DEFINE OFF;

Insert into HERNANRIZZUTI.BOOK_STOCK (BOOK_STOCK_ID,ISBN,BOOK_COPIES_#) values (43,'978-0141183848',3);

Insert into HERNANRIZZUTI.BOOK_STOCK (BOOK_STOCK_ID,ISBN,BOOK_COPIES_#) values (1,'978-0-141-19889-7',5);

Insert into HERNANRIZZUTI.BOOK_STOCK (BOOK_STOCK_ID,ISBN,BOOK_COPIES_#) values (2,'978-0-06-207350-1',6);

Insert into HERNANRIZZUTI.BOOK_STOCK (BOOK_STOCK_ID,ISBN,BOOK_COPIES_#) values (101,'978-0099527923',10);

Insert into HERNANRIZZUTI.BOOK_STOCK (BOOK_STOCK_ID,ISBN,BOOK_COPIES_#) values (21,'978-0553296983',2);

Insert into HERNANRIZZUTI.BOOK_STOCK (BOOK_STOCK_ID,ISBN,BOOK_COPIES_#) values (81,'978-0593064948',20);

Insert into HERNANRIZZUTI.BOOK_STOCK (BOOK_STOCK_ID,ISBN,BOOK_COPIES_#) values (61,'978-0-06-207355-6',75);

Insert into HERNANRIZZUTI.BOOK_STOCK (BOOK_STOCK_ID,ISBN,BOOK_COPIES_#) values (41,'978-1444720686',20);

Insert into HERNANRIZZUTI.BOOK_STOCK (BOOK_STOCK_ID,ISBN,BOOK_COPIES_#) values (42,'978-1604503289',5);

REM INSERTING into HERNANRIZZUTI.CATEGORIES

SET DEFINE OFF;

Insert into HERNANRIZZUTI.CATEGORIES (CATEGORY_ID,NAME) values (1,'Adventure');

Insert into HERNANRIZZUTI.CATEGORIES (CATEGORY_ID,NAME) values (2,'Animals');

Insert into HERNANRIZZUTI.CATEGORIES (CATEGORY_ID,NAME) values (3,'Art and design');

Insert into HERNANRIZZUTI.CATEGORIES (CATEGORY_ID,NAME) values (4,'Audiobooks');

Insert into HERNANRIZZUTI.CATEGORIES (CATEGORY_ID,NAME) values (5,'Autobiography and memoir');

Insert into HERNANRIZZUTI.CATEGORIES (CATEGORY_ID,NAME) values (6,'Ballet');

Insert into HERNANRIZZUTI.CATEGORIES (CATEGORY_ID,NAME) values (7,'Biography');

Insert into HERNANRIZZUTI.CATEGORIES (CATEGORY_ID,NAME) values (8,'Children and teenagers');

Insert into HERNANRIZZUTI.CATEGORIES (CATEGORY_ID,NAME) values (9,'Business and finance');

Insert into HERNANRIZZUTI.CATEGORIES (CATEGORY_ID,NAME) values (10,'Chick lit');

Insert into HERNANRIZZUTI.CATEGORIES (CATEGORY_ID,NAME) values (11,'Children''s books: 7 and under');

Insert into HERNANRIZZUTI.CATEGORIES (CATEGORY_ID,NAME) values (12,'Children''s books: 8-12 years');

Insert into HERNANRIZZUTI.CATEGORIES (CATEGORY_ID,NAME) values (13,'Classics');

Insert into HERNANRIZZUTI.CATEGORIES (CATEGORY_ID,NAME) values (14,'Comics and graphic novels');

Insert into HERNANRIZZUTI.CATEGORIES (CATEGORY_ID,NAME) values (15,'Comics and graphic novels');

Insert into HERNANRIZZUTI.CATEGORIES (CATEGORY_ID,NAME) values (16,'Computing and the net');

Insert into HERNANRIZZUTI.CATEGORIES (CATEGORY_ID,NAME) values (17,'Craft and hobbies');

Insert into HERNANRIZZUTI.CATEGORIES (CATEGORY_ID,NAME) values (18,'Crime fiction');

Insert into HERNANRIZZUTI.CATEGORIES (CATEGORY_ID,NAME) values (19,'Disaster fiction');

Insert into HERNANRIZZUTI.CATEGORIES (CATEGORY_ID,NAME) values (20,'Fairies');

Insert into HERNANRIZZUTI.CATEGORIES (CATEGORY_ID,NAME) values (21,'Fantasy');

Insert into HERNANRIZZUTI.CATEGORIES (CATEGORY_ID,NAME) values (22,'Fiction');

Insert into HERNANRIZZUTI.CATEGORIES (CATEGORY_ID,NAME) values (23,'Film');

Insert into HERNANRIZZUTI.CATEGORIES (CATEGORY_ID,NAME) values (24,'Food and drink');

Insert into HERNANRIZZUTI.CATEGORIES (CATEGORY_ID,NAME) values (25,'Friendship');

Insert into HERNANRIZZUTI.CATEGORIES (CATEGORY_ID,NAME) values (26,'Funny books');

Insert into HERNANRIZZUTI.CATEGORIES (CATEGORY_ID,NAME) values (27,'Health, mind and body');

Insert into HERNANRIZZUTI.CATEGORIES (CATEGORY_ID,NAME) values (28,'Historical fiction');

Insert into HERNANRIZZUTI.CATEGORIES (CATEGORY_ID,NAME) values (29,'History');

Insert into HERNANRIZZUTI.CATEGORIES (CATEGORY_ID,NAME) values (30,'Horror');

Insert into HERNANRIZZUTI.CATEGORIES (CATEGORY_ID,NAME) values (31,'House and garden');

Insert into HERNANRIZZUTI.CATEGORIES (CATEGORY_ID,NAME) values (32,'Literary criticism');

Insert into HERNANRIZZUTI.CATEGORIES (CATEGORY_ID,NAME) values (33,'Music');

Insert into HERNANRIZZUTI.CATEGORIES (CATEGORY_ID,NAME) values (34,'Non-fiction');

Insert into HERNANRIZZUTI.CATEGORIES (CATEGORY_ID,NAME) values (35,'Paranormal romance');

Insert into HERNANRIZZUTI.CATEGORIES (CATEGORY_ID,NAME) values (36,'Philosophy');

Insert into HERNANRIZZUTI.CATEGORIES (CATEGORY_ID,NAME) values (37,'Picture books');

Insert into HERNANRIZZUTI.CATEGORIES (CATEGORY_ID,NAME) values (38,'Poetry');

Insert into HERNANRIZZUTI.CATEGORIES (CATEGORY_ID,NAME) values (39,'Politics');

Insert into HERNANRIZZUTI.CATEGORIES (CATEGORY_ID,NAME) values (40,'Reference and languages');

Insert into HERNANRIZZUTI.CATEGORIES (CATEGORY_ID,NAME) values (41,'Religion');

Insert into HERNANRIZZUTI.CATEGORIES (CATEGORY_ID,NAME) values (42,'Romance');

Insert into HERNANRIZZUTI.CATEGORIES (CATEGORY_ID,NAME) values (43,'School');

Insert into HERNANRIZZUTI.CATEGORIES (CATEGORY_ID,NAME) values (44,'Sci-fi');

Insert into HERNANRIZZUTI.CATEGORIES (CATEGORY_ID,NAME) values (45,'Science and nature');

Insert into HERNANRIZZUTI.CATEGORIES (CATEGORY_ID,NAME) values (46,'Science fiction ');

Insert into HERNANRIZZUTI.CATEGORIES (CATEGORY_ID,NAME) values (47,'Short stories');

Insert into HERNANRIZZUTI.CATEGORIES (CATEGORY_ID,NAME) values (48,'Society');

Insert into HERNANRIZZUTI.CATEGORIES (CATEGORY_ID,NAME) values (49,'Sport and leisure');

Insert into HERNANRIZZUTI.CATEGORIES (CATEGORY_ID,NAME) values (50,'Stage');

Insert into HERNANRIZZUTI.CATEGORIES (CATEGORY_ID,NAME) values (51,'Teen books');

Insert into HERNANRIZZUTI.CATEGORIES (CATEGORY_ID,NAME) values (52,'Thrillers');

Insert into HERNANRIZZUTI.CATEGORIES (CATEGORY_ID,NAME) values (53,'Travel guides');

Insert into HERNANRIZZUTI.CATEGORIES (CATEGORY_ID,NAME) values (54,'Travel writing');

Insert into HERNANRIZZUTI.CATEGORIES (CATEGORY_ID,NAME) values (55,'True crime');

Insert into HERNANRIZZUTI.CATEGORIES (CATEGORY_ID,NAME) values (56,'TV and radio');

Insert into HERNANRIZZUTI.CATEGORIES (CATEGORY_ID,NAME) values (57,'Vampires');

Insert into HERNANRIZZUTI.CATEGORIES (CATEGORY_ID,NAME) values (58,'War');

REM INSERTING into HERNANRIZZUTI.LIBUSERS

SET DEFINE OFF;

Insert into HERNANRIZZUTI.LIBUSERS (USERNAME,PASSWORD,TITLE_ID,FIRSTNAME,LASTNAME,EMAIL,ENABLED) values ('Billy.Mccarthy','QER+qUPHP4qnAHPNqV/oqA==',1,'Billy','Mccarthy','billy.mccarthy@fdmgroup.com',1);

Insert into HERNANRIZZUTI.LIBUSERS (USERNAME,PASSWORD,TITLE_ID,FIRSTNAME,LASTNAME,EMAIL,ENABLED) values ('Hernan1','QeW2bkU3B/3Y6Rd8O+OKpQ==',1,'Hernan','Rizzuti','hernan.rizzuti@gmail.com',1);

Insert into HERNANRIZZUTI.LIBUSERS (USERNAME,PASSWORD,TITLE_ID,FIRSTNAME,LASTNAME,EMAIL,ENABLED) values ('h.rizzuti','47kEfcLky9TiIfG6EXDpMA==',1,'Hernan','Rizzuti','hernan.rizzuti@gmail.com',1);

Insert into HERNANRIZZUTI.LIBUSERS (USERNAME,PASSWORD,TITLE_ID,FIRSTNAME,LASTNAME,EMAIL,ENABLED) values ('nalgere','X945aLZkeiR3GSEEYWr65w==',4,'Nalgere','Outdoor','nalgere.outdoor@gmail.com',1);

Insert into HERNANRIZZUTI.LIBUSERS (USERNAME,PASSWORD,TITLE_ID,FIRSTNAME,LASTNAME,EMAIL,ENABLED) values ('nalgere2002','X945aLZkeiR3GSEEYWr65w==',4,'Nalgere','outdoor','nalgere.outdoor@gmail.com',1);

Insert into HERNANRIZZUTI.LIBUSERS (USERNAME,PASSWORD,TITLE_ID,FIRSTNAME,LASTNAME,EMAIL,ENABLED) values ('Horacio','P6Hc/TOP6pjwqhT8Av5i7w==',1,'Horacio','Rizzuti','horacio.rizzuti@gmail.com',1);

Insert into HERNANRIZZUTI.LIBUSERS (USERNAME,PASSWORD,TITLE_ID,FIRSTNAME,LASTNAME,EMAIL,ENABLED) values ('Silvina','6++XoxowPNEPt1kCGK/zlg==',1,'silvi','rizzuti','silvi@gmail.com',1);

Insert into HERNANRIZZUTI.LIBUSERS (USERNAME,PASSWORD,TITLE_ID,FIRSTNAME,LASTNAME,EMAIL,ENABLED) values ('drizzuti','yIfbb2mWbFf2Gt/GQ3c+Aw==',1,'Deborah','Rizzuti','d.rizzuti@gmail.com',1);

Insert into HERNANRIZZUTI.LIBUSERS (USERNAME,PASSWORD,TITLE_ID,FIRSTNAME,LASTNAME,EMAIL,ENABLED) values ('Hori','0BAO4CkgQGVm+JNPtsLZNA==',1,'Horacio','Rizzuti','h.rizzuti@gmail.com',1);

Insert into HERNANRIZZUTI.LIBUSERS (USERNAME,PASSWORD,TITLE_ID,FIRSTNAME,LASTNAME,EMAIL,ENABLED) values ('Hernan','QeW2bkU3B/3Y6Rd8O+OKpQ==',1,'Hernan','Rizzuti','hernan.rizzuti@gmail.com',1);

Insert into HERNANRIZZUTI.LIBUSERS (USERNAME,PASSWORD,TITLE_ID,FIRSTNAME,LASTNAME,EMAIL,ENABLED) values ('Hernan2','QeW2bkU3B/3Y6Rd8O+OKpQ==',1,'Hernan','Rizzuti','hernanrizzuti@gmail.com',1);

Insert into HERNANRIZZUTI.LIBUSERS (USERNAME,PASSWORD,TITLE_ID,FIRSTNAME,LASTNAME,EMAIL,ENABLED) values ('Hernan3','DDdY/OubuF5e/yQP9CxuWQ==',1,'Hernan','Rizzuti','hernan.rizzuti@gmail.com',1);

Insert into HERNANRIZZUTI.LIBUSERS (USERNAME,PASSWORD,TITLE_ID,FIRSTNAME,LASTNAME,EMAIL,ENABLED) values ('Debs','gs9SfzjPUmm5KZMmbHvz2w==',2,'Deborah','Rizzuti','debs.rizzuti@jl.com',1);

Insert into HERNANRIZZUTI.LIBUSERS (USERNAME,PASSWORD,TITLE_ID,FIRSTNAME,LASTNAME,EMAIL,ENABLED) values ('bobby2002','X945aLZkeiR3GSEEYWr65w==',1,'Robert','Dylan','rob.dylan@gmail.com',1);

Insert into HERNANRIZZUTI.LIBUSERS (USERNAME,PASSWORD,TITLE_ID,FIRSTNAME,LASTNAME,EMAIL,ENABLED) values ('Richard','P6Hc/TOP6pjwqhT8Av5i7w==',1,'Richard','Smith','r.smith@gmail.com',1);

Insert into HERNANRIZZUTI.LIBUSERS (USERNAME,PASSWORD,TITLE_ID,FIRSTNAME,LASTNAME,EMAIL,ENABLED) values ('Rob1','fcRoJR8Ho7I4hNGYW2cL1w==',1,'Robert','Sugar','r.sugar@hotmail.com',1);

Insert into HERNANRIZZUTI.LIBUSERS (USERNAME,PASSWORD,TITLE_ID,FIRSTNAME,LASTNAME,EMAIL,ENABLED) values ('Laura','DDdY/OubuF5e/yQP9CxuWQ==',2,'Laura','Williams','l.wills@hotmail.com',1);

Insert into HERNANRIZZUTI.LIBUSERS (USERNAME,PASSWORD,TITLE_ID,FIRSTNAME,LASTNAME,EMAIL,ENABLED) values ('Deborah','nnvUt20X6XryI6/gPGpvpQ==',1,'Deborah','Lewinson','debs.rizzuti@gmail.com',1);

Insert into HERNANRIZZUTI.LIBUSERS (USERNAME,PASSWORD,TITLE_ID,FIRSTNAME,LASTNAME,EMAIL,ENABLED) values ('Billy','wlAmZQdOQO5HSu1n6KQdSQ==',1,'Billy','Rogers','b.rogers@hotmail.com',1);

REM INSERTING into HERNANRIZZUTI.LIBUSER_ROLES

SET DEFINE OFF;

Insert into HERNANRIZZUTI.LIBUSER_ROLES (USER_ROLE_ID,USERNAME,AUTHORITY) values (201,'Billy.Mccarthy','ROLE_USER');

Insert into HERNANRIZZUTI.LIBUSER_ROLES (USER_ROLE_ID,USERNAME,AUTHORITY) values (241,'Hernan1','ROLE_USER');

Insert into HERNANRIZZUTI.LIBUSER_ROLES (USER_ROLE_ID,USERNAME,AUTHORITY) values (261,'h.rizzuti','ROLE_SELLER');

Insert into HERNANRIZZUTI.LIBUSER_ROLES (USER_ROLE_ID,USERNAME,AUTHORITY) values (21,'nalgere','ROLE_USER');

Insert into HERNANRIZZUTI.LIBUSER_ROLES (USER_ROLE_ID,USERNAME,AUTHORITY) values (22,'nalgere2002','ROLE_USER');

Insert into HERNANRIZZUTI.LIBUSER_ROLES (USER_ROLE_ID,USERNAME,AUTHORITY) values (61,'Horacio','ROLE_USER');

Insert into HERNANRIZZUTI.LIBUSER_ROLES (USER_ROLE_ID,USERNAME,AUTHORITY) values (62,'Silvina','ROLE_USER');

Insert into HERNANRIZZUTI.LIBUSER_ROLES (USER_ROLE_ID,USERNAME,AUTHORITY) values (161,'drizzuti','ROLE_USER');

Insert into HERNANRIZZUTI.LIBUSER_ROLES (USER_ROLE_ID,USERNAME,AUTHORITY) values (181,'Hori','ROLE_USER');

Insert into HERNANRIZZUTI.LIBUSER_ROLES (USER_ROLE_ID,USERNAME,AUTHORITY) values (221,'Hernan','ROLE_SELLER');

Insert into HERNANRIZZUTI.LIBUSER_ROLES (USER_ROLE_ID,USERNAME,AUTHORITY) values (242,'Hernan2','ROLE_USER');

Insert into HERNANRIZZUTI.LIBUSER_ROLES (USER_ROLE_ID,USERNAME,AUTHORITY) values (281,'Hernan3','ROLE_USER');

Insert into HERNANRIZZUTI.LIBUSER_ROLES (USER_ROLE_ID,USERNAME,AUTHORITY) values (41,'bobby2002','ROLE_USER');

Insert into HERNANRIZZUTI.LIBUSER_ROLES (USER_ROLE_ID,USERNAME,AUTHORITY) values (6,'Debs','ROLE_USER');

Insert into HERNANRIZZUTI.LIBUSER_ROLES (USER_ROLE_ID,USERNAME,AUTHORITY) values (81,'Richard','ROLE_USER');

Insert into HERNANRIZZUTI.LIBUSER_ROLES (USER_ROLE_ID,USERNAME,AUTHORITY) values (101,'Rob1','ROLE_USER');

Insert into HERNANRIZZUTI.LIBUSER_ROLES (USER_ROLE_ID,USERNAME,AUTHORITY) values (102,'Laura','ROLE_USER');

Insert into HERNANRIZZUTI.LIBUSER_ROLES (USER_ROLE_ID,USERNAME,AUTHORITY) values (121,'Deborah','ROLE_USER');

Insert into HERNANRIZZUTI.LIBUSER_ROLES (USER_ROLE_ID,USERNAME,AUTHORITY) values (141,'Billy','ROLE_USER');

REM INSERTING into HERNANRIZZUTI.LIBUSER_TITLES

SET DEFINE OFF;

Insert into HERNANRIZZUTI.LIBUSER_TITLES (TITLE_ID,TITLE) values (1,'Mr');

Insert into HERNANRIZZUTI.LIBUSER_TITLES (TITLE_ID,TITLE) values (2,'Mrs');

Insert into HERNANRIZZUTI.LIBUSER_TITLES (TITLE_ID,TITLE) values (3,'Ms');

Insert into HERNANRIZZUTI.LIBUSER_TITLES (TITLE_ID,TITLE) values (4,'Miss');

Insert into HERNANRIZZUTI.LIBUSER_TITLES (TITLE_ID,TITLE) values (5,'Dr');

Insert into HERNANRIZZUTI.LIBUSER_TITLES (TITLE_ID,TITLE) values (6,'Professor');

Insert into HERNANRIZZUTI.LIBUSER_TITLES (TITLE_ID,TITLE) values (7,'Lord');

Insert into HERNANRIZZUTI.LIBUSER_TITLES (TITLE_ID,TITLE) values (8,'Sir');

Insert into HERNANRIZZUTI.LIBUSER_TITLES (TITLE_ID,TITLE) values (9,'Master');

Insert into HERNANRIZZUTI.LIBUSER_TITLES (TITLE_ID,TITLE) values (10,'Other');

REM INSERTING into HERNANRIZZUTI.PUBLISHERS

SET DEFINE OFF;

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (274,'Lippincott Williams & Wilkins');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (275,'A. C. McClurg');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (276,'McClelland and Stewart');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (277,'Macmillan Publishers');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (278,'Mainstream Publishing');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (279,'Manning Publications');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (280,'Mandrake of Oxford');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (281,'Mandrake Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (282,'Manchester University Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (283,'Manor House Publishing');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (284,'Mapin Publishing');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (285,'Marion Boyars Publishers');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (286,'Mark Batty Publisher');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (287,'Marshall Cavendish');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (288,'Marshall Pickering');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (289,'Martinus Nijhoff Publishers');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (290,'Mascot Books');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (291,'Matthias Media');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (292,'McFarland & Company');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (293,'McGraw-Hill');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (294,'Medknow Publications');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (295,'Melbourne University Publishing');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (296,'Methuen Publishing');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (297,'Michael Joseph');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (298,'Michael O''Mara Books');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (299,'Michigan State University Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (300,'Microsoft Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (301,'The Miegunyah Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (302,'Miles Kelly Publishing');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (303,'Mills & Boon');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (304,'Minerva Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (305,'Mirage Publishing');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (306,'MIT Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (307,'Mkuki na Nyota');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (308,'Modern Library');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (309,'Mother Tongue Publishing');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (310,'John Murray');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (311,'Mycroft & Moran');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (312,'Naiad Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (313,'Nauka');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (314,'NavPress');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (315,'New Directions Publishing');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (316,'New English Library');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (317,'New Holland Publishers');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (318,'New Village Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (319,'Newnes');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (320,'Nonesuch Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (321,'Noontide Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (322,'Northwestern University Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (323,'W. W. Norton & Company');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (324,'NRC Research Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (325,'NYRB Classics');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (326,'Oberon Books');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (327,'Open University Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (328,'Orchard Books');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (329,'Oracle Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (330,'Orion Books');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (331,'Orion Publishing Group');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (332,'O''Reilly Media');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (333,'Osborne Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (334,'Osprey Publishing');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (335,'Other Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (336,'Peter Owen Publishers');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (337,'The Overlook Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (338,'Oxford University Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (339,'Packt Publishing');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (340,'Palgrave Macmillan');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (341,'Pan Books');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (342,'Pantheon Books at Random House');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (343,'Parachute Publishing');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (344,'Parragon');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (345,'Pathfinder Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (346,'Paulist Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (347,'Pavilion Books');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (348,'Peace Hill Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (349,'Pecan Grove Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (350,'Pen and Sword Books');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (351,'Penguin Books UK');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (352,'Penguin Putnam Inc.');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (353,'Penn State University Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (354,'Persephone Books');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (355,'Perseus Books Group');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (356,'Peter Lang');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (357,'Peter Owen Publishers');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (358,'Phaidon Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (359,'Philosophy Documentation Center');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (360,'Philtrum Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (361,'Picador UK');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (362,'Pimlico Books at Random House');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (363,'Pluto Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (364,'Point Blank');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (365,'Poisoned Pen Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (366,'Policy Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (367,'Polity');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (368,'Practical Action');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (369,'Prentice Hall');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (370,'Prime Books');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (371,'Princeton University Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (372,'Progress Publishers');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (373,'Prometheus Books');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (374,'Profile Books');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (375,'Puffin Books');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (376,'G. P. Putnam''s Sons');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (377,'Que Publishing');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (378,'Quebecor');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (379,'Quirk Books');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (380,'Random House');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (381,'Reed Elsevier');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (382,'D. Reidel');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (383,'Remington & Co');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (384,'Research Publishing Services');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (385,'Rigby');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (386,'Riverhead Books');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (387,'Robson Books');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (388,'Rock scorpion books');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (389,'Rodopi');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (390,'Routledge Kegan Paul');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (391,'Rowman & Littlefield');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (392,'Royal Society of Chemistry');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (393,'SAGE Publications');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (394,'Sams Publishing');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (395,'St. Martin''s Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (396,'Salt Publishing');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (397,'Schocken Books');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (398,'Scholastic Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (399,'Scribner');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (400,'Secker & Warburg');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (401,'Shambhala Publications');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (402,'Shire Books');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (403,'Shoemaker & Hoard Publishers');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (404,'Shuter & Shooter Publishers');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (405,'Sidgwick & Jackson');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (406,'Signet Books');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (407,'Simon and Schuster');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (408,'Sinclair-Stevenson Ltd');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (409,'Sounds True');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (410,'Sourcebooks');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (411,'South End Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (412,'SPCK');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (413,'Spinster''s ink books');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (414,'Spottiswoode');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (415,'Springer Science+Business Media');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (416,'Stanford University Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (417,'The Stationery Office');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (418,'Stein and Day');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (419,'Summerwild Productions');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (420,'Summit Media');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (421,'SUNY Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (422,'Sussex Academic Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (423,'Sylvan Dell Publishing');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (424,'T & T Clark');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (425,'Tachyon Publications');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (426,'Tammi, Finland');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (427,'Target Books');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (428,'Tarpaulin Sky Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (429,'Tartarus Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (430,'Taunton Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (431,'Taylor & Francis');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (432,'Ten Speed Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (433,'Thames & Hudson');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (434,'Thames & Hudson');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (435,'The Good Book Company');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (436,'Thieme Medical Publishers');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (437,'Third World Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (438,'Thomas Nelson');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (439,'Ticonderoga Publications');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (440,'Times Books');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (441,'Titan Books');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (442,'Tor Books');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (443,'Triangle Books');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (444,'Troubador Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (445,'Tupelo Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (446,'Tuttle Publishing');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (447,'Twelveheads Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (448,'UCL Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (449,'Unfinished Monument Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (450,'University of Akron Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (451,'University of Alaska Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (452,'University of California Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (453,'University of Chicago Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (454,'University of Minnesota Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (455,'University of Michigan Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (456,'University of Nebraska Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (457,'University of Pennsylvania Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (458,'University of South Carolina Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (459,'University of Toronto Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (460,'University of Wales Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (461,'University Press of America');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (462,'University Press of Kansas');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (463,'University Press of Kentucky');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (464,'Usborne Publishing');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (465,'Verso Books');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (466,'Velazquez Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (467,'Viking Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (468,'Vintage Books');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (469,'Vintage Books at Random House');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (470,'Virago Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (471,'Virgin Publishing');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (472,'Voyager Books');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (473,'VSP Publishers ');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (474,'W. W. Norton & Company');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (475,'Walter de Gruyter');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (476,'Ward Lock & Co');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (477,'WBusiness Books');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (478,'WEbook');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (479,'Weidenfeld & Nicolson');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (480,'Wesleyan University Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (481,'WestBow Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (482,'Westminster John Knox Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (483,'W. H. Allen Ltd');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (484,'Wildside Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (485,'William Edwin Rudge');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (486,'Windgate Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (487,'Wipf and Stock');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (488,'Wisdom Publications');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (489,'Woodhead Publishing');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (490,'Workman Publishing');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (491,'World Publishing Company');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (492,'World Scientific Publishing');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (493,'Wrecking Ball Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (494,'Wrox Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (495,'WSOY, Finland');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (496,'John Wiley & Sons');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (497,'Xoanon Publishing');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (498,'Yale University Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (499,'Zed Books');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (500,'Ziff Davis Media');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (501,'Zondervan');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (1,'Abilene Christian University Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (2,'Ablex Publishing');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (3,'Ace Books');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (4,'Academic Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (5,'Addison–Wesley');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (6,'Adis International');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (7,'Akashic Books');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (8,'Aladdin Paperbacks');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (9,'Allen & Unwin');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (10,'Alyson Books');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (11,'André Deutsch');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (12,'Andrews McMeel Publishing');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (13,'Anova Books');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (14,'Anvil Press Poetry');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (15,'Applewood Books');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (16,'Apress');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (17,'Arbor House');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (18,'Arbordale Publishing');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (19,'Arcade Publishing');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (20,'Arcadia Publishing');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (21,'Airiti Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (22,'Arkham House');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (23,'Armida Publications');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (24,'ArtScroll');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (25,'A. S. Barnes');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (26,'Athabasca University Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (27,'Atheneum Books');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (28,'Atheneum Publishers');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (29,'Atlantic Books');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (30,'Atlas Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (31,'ATOM Books');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (32,'Augsburg Fortress');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (33,'Aunt Lute Books');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (34,'Avon Publications');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (35,'B & W Publishing');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (36,'Baen Books');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (37,'Baker Book House');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (38,'Banner of Truth Trust');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (39,'Barrie & Jenkins');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (40,'Basic Books');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (41,'Ballantine Books');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (42,'Bantam Books');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (43,'Bantam Spectra');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (44,'BBC Books');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (45,'Belknap Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (46,'Bella Books');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (47,'Bellevue Literary Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (48,'Berg Publishers');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (49,'Berkley Books');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (50,'Birkhauser Boston');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (51,'Bison Books');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (52,'A & C Black');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (53,'Black Dog Publishing');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (54,'Black Library');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (55,'Black Sparrow Books');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (56,'Blackie and Son Limited');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (57,'Blackwell Publishing');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (58,'Blake Publishing');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (59,'Bloodaxe Books');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (60,'Bloomsbury Publishing Plc');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (61,'Blue Ribbon Books, Garden City');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (62,'Bobbs');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (63,'Book League of America');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (64,'Book Works');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (65,'Borgo Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (66,'Boundless');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (67,'Bowes & Bowes');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (68,'Marion Boyars Publishers');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (69,'Boydell & Brewer');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (70,'Broadview Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (71,'Breslov Research Institute');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (72,'Brill Publishers');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (73,'Brimstone Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (74,'BSL Publications');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (75,'Burns & Oates');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (76,'Butterworth-Heinemann');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (77,'Caister Academic Press UK');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (78,'Cambridge University Press UK');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (79,'Candlewick Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (80,'Canongate Books');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (81,'Carcanet Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (82,'Carlton Books UK');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (83,'Carlton Publishing Group UK');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (84,'Carnegie Mellon University Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (85,'Casemate Publishers');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (86,'Cassell');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (87,'Cengage Learning');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (88,'Central European University Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (89,'Century');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (90,'Chambers Harrap');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (91,'Charles Scribner''s Sons');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (92,'Chatto and Windus');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (93,'Chick Publications');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (94,'Chronicle Books');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (95,'Churchill Livingstone');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (96,'City Lights Publishers.');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (97,'Cisco Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (98,'Cloverdale Corporation');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (99,'Cold Spring Harbor Laboratory Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (100,'Collector''s Guide Publishing');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (101,'Collins');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (102,'Columbia University Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (103,'Concordia Publishing House');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (104,'Constable & Co Ltd');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (105,'Continuum International Publishing Group');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (106,'Copper Canyon Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (107,'Cork University Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (108,'Cornell University Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (109,'Coronet Books');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (110,'Craftsman Book Company');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (111,'CRC Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (112,'Crocker & Brewster');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (113,'Crown Publishing Group');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (114,'Da Capo Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (115,'Daedalus Publishing');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (116,'Dalkey Archive Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (117,'Darakwon Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (118,'David & Charles');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (119,'DAW Books');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (120,'Dedalus Books');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (121,'Del Rey Books');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (122,'Delacorte Pres');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (123,'J. M. Dent');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (124,'Dick and Fitzgerald');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (125,'Directmedia Publishing');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (126,'DNA Publications');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (127,'Dodd, Mead and Company');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (128,'Dorchester Publishing');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (129,'Dorling Kindersley');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (130,'Doubleday');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (131,'Douglas & McIntyre');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (132,'Dove Medical Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (133,'Dover Publications');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (134,'Dundurn Group');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (135,'E. P. Dutton');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (136,'Earthscan');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (137,'ECW Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (138,'Eel Pie Publishing');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (139,'Eerdmans Publishing');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (140,'Ellora''s Cave');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (141,'Elsevier');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (142,'Emerald Group Publishing');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (143,'Europa Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (144,'Everyman''s Library');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (145,'Ewha Womans University Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (146,'Exact Change');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (147,'Faber and Faber');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (148,'FabJob');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (149,'Fairview Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (150,'Farrar, Straus & Giroux');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (151,'Fearless Books');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (152,'Felony & Mayhem Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (153,'Firebrand Books');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (154,'Flame Tree Publishing');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (155,'Flux');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (156,'Focal Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (157,'Folio Society');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (158,'Forum Media Group');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (159,'Four Courts Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (160,'Four Walls Eight Windows');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (161,'Free Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (162,'Frederick Fell Publishers, Inc.');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (163,'Frederick Warne & Co');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (164,'Fulcrum Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (165,'Funk & Wagnalls');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (166,'G-Unit Books');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (167,'Gaspereau Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (168,'Gay Men''s Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (169,'George Newnes');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (170,'Gefen Publishing House');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (171,'George Routledge & Sons');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (172,'Victor Gollancz Ltd');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (173,'Good News Publishers');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (174,'Goops Unlimited');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (175,'Goose Lane Editions');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (176,'Golden Cockerel Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (177,'Grafton');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (178,'Graywolf Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (179,'Greenleaf Book Group');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (180,'Greenery Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (181,'Greenwillow Books');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (182,'Greenwood Publishing Group');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (183,'Gregg Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (184,'Grosset & Dunlap');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (185,'Grove Press / Atlantic Monthly Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (186,'Hachette Book Group USA');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (187,'Hackett Publishing Company');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (188,'Happy House');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (189,'Hamish Hamilton');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (190,'Harcourt Trade Publishers');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (191,'Harcourt Assessment');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (192,'Harlequin Enterprises Ltd');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (193,'Harper & Brothers');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (194,'Harper & Row');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (195,'HarperCollins Publishers');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (196,'HarperPrism');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (197,'HarperTrophy');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (198,'Harry N. Abrams, Inc.');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (199,'Harvard University Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (200,'Harvest House');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (201,'Harvill Press at Random House');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (202,'Hawthorne Books');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (203,'Hay House');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (204,'Haynes Manuals');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (205,'Heinemann');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (206,'Herbert Jenkins');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (207,'Heyday Books');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (208,'HMSO');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (209,'Hodder & Stoughton');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (210,'Hodder Headline');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (211,'Hogarth Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (212,'Holland Park Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (213,'Holt McDougal');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (214,'Hoover Institution Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (215,'Horizon Scientific Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (216,'Houghton Mifflin');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (217,'House of Anansi Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (218,'The House of Murky Depths');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (219,'Howell-North Book');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (220,'Huffington Post');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (221,'Humana Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (222,'Hutchinson');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (223,'Hyperion');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (224,'Ian Allan Publishing');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (225,'IDC Publishers');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (226,'Ignatius Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (227,'Imperial War Museum');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (228,'Indiana University Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (229,'Informa Healthcare');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (230,'Information Age Publishing');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (231,'Insomniac Press Canada');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (232,'International Universities Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (233,'Inter-Varsity Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (234,'InterVarsity Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (235,'International Association of Engineers');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (236,'Ishi Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (237,'Islamic Texts Society');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (238,'Island Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (239,'Ivyspring International Publisher');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (240,'Jaico Publishing House');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (241,'Jarrolds Publishing');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (242,'John Murray');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (243,'John Wiley & Sons');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (244,'Jones and Bartlett Learning');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (245,'Kessinger Publishing');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (246,'Kluwer Academic Publishers');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (247,'Alfred A. Knopf');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (248,'Kodansha');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (249,'Koren Publishers Jerusalem');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (250,'Kumarian Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (251,'Karadi Tales');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (252,'Kogan Page');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (253,'KOYINTA Publishing House');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (254,'Ladybird Books');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (255,'Leaf Books');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (256,'Leafwood Publishers');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (257,'Left Book Club');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (258,'Legas');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (259,'Legend Books');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (260,'Lethe Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (261,'Libertas Academica');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (262,'Liberty Fund');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (263,'Library of America');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (264,'LifeBound');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (265,'Lion Hudson');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (266,'Lion Publishing');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (267,'Lionel Leventhal');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (268,'Little, Brown and Company');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (269,'Liverpool University Press');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (270,'Llewellyn Worldwide');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (271,'Longman');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (272,'LPI Media');

Insert into HERNANRIZZUTI.PUBLISHERS (PUBLISHER_ID,NAME) values (273,'Lutterworth Press');

REM INSERTING into HERNANRIZZUTI.SHOPPING_CART

SET DEFINE OFF;

REM INSERTING into HERNANRIZZUTI.SHOPPING_CART_HISTORY

SET DEFINE OFF;

--------------------------------------------------------

--  DDL for Index B$TITLE

--------------------------------------------------------


  CREATE INDEX "HERNANRIZZUTI"."B$TITLE" ON "HERNANRIZZUTI"."BOOKS" ("TITLE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------

--  DDL for Index A$NAME

--------------------------------------------------------


  CREATE INDEX "HERNANRIZZUTI"."A$NAME" ON "HERNANRIZZUTI"."AUTHORS" ("NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------

--  Constraints for Table CATEGORIES

--------------------------------------------------------


  ALTER TABLE "HERNANRIZZUTI"."CATEGORIES" ADD PRIMARY KEY ("CATEGORY_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------

--  Constraints for Table ACCOUNTS

--------------------------------------------------------


  ALTER TABLE "HERNANRIZZUTI"."ACCOUNTS" ADD PRIMARY KEY ("ACCOUNTNO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------

--  Constraints for Table AUTHORS

--------------------------------------------------------


  ALTER TABLE "HERNANRIZZUTI"."AUTHORS" ADD PRIMARY KEY ("AUTHOR_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------

--  Constraints for Table LIBUSER_ROLES

--------------------------------------------------------


  ALTER TABLE "HERNANRIZZUTI"."LIBUSER_ROLES" ADD PRIMARY KEY ("USER_ROLE_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------

--  Constraints for Table BOOK_STOCK

--------------------------------------------------------


  ALTER TABLE "HERNANRIZZUTI"."BOOK_STOCK" ADD PRIMARY KEY ("BOOK_STOCK_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------

--  Constraints for Table BOOKS

--------------------------------------------------------


  ALTER TABLE "HERNANRIZZUTI"."BOOKS" ADD PRIMARY KEY ("ISBN")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------

--  Constraints for Table SHOPPING_CART

--------------------------------------------------------


  ALTER TABLE "HERNANRIZZUTI"."SHOPPING_CART" ADD PRIMARY KEY ("USERNAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------

--  Constraints for Table PUBLISHERS

--------------------------------------------------------


  ALTER TABLE "HERNANRIZZUTI"."PUBLISHERS" ADD PRIMARY KEY ("PUBLISHER_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------

--  Constraints for Table LIBUSER_TITLES

--------------------------------------------------------


  ALTER TABLE "HERNANRIZZUTI"."LIBUSER_TITLES" ADD PRIMARY KEY ("TITLE_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------

--  Constraints for Table SHOPPING_CART_HISTORY

--------------------------------------------------------


  ALTER TABLE "HERNANRIZZUTI"."SHOPPING_CART_HISTORY" ADD PRIMARY KEY ("SHOPPING_CART_HISTORY_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------

--  Constraints for Table LIBUSERS

--------------------------------------------------------


  ALTER TABLE "HERNANRIZZUTI"."LIBUSERS" ADD PRIMARY KEY ("USERNAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------

--  Ref Constraints for Table BOOKS

--------------------------------------------------------


  ALTER TABLE "HERNANRIZZUTI"."BOOKS" ADD CONSTRAINT "BOOKS_AUTHORS_FK" FOREIGN KEY ("AUTHOR_ID")
	  REFERENCES "HERNANRIZZUTI"."AUTHORS" ("AUTHOR_ID") ENABLE;
  ALTER TABLE "HERNANRIZZUTI"."BOOKS" ADD CONSTRAINT "BOOKS_CATEGORIES_FK" FOREIGN KEY ("CATEGORY_ID")
	  REFERENCES "HERNANRIZZUTI"."CATEGORIES" ("CATEGORY_ID") ENABLE;
  ALTER TABLE "HERNANRIZZUTI"."BOOKS" ADD CONSTRAINT "BOOKS_PUBLISHERS_FK" FOREIGN KEY ("PUBLISHER_ID")
	  REFERENCES "HERNANRIZZUTI"."PUBLISHERS" ("PUBLISHER_ID") ENABLE;
--------------------------------------------------------

--  Ref Constraints for Table BOOK_AUTHOR

--------------------------------------------------------


  ALTER TABLE "HERNANRIZZUTI"."BOOK_AUTHOR" ADD CONSTRAINT "B_A_AS_AUTHOR_ID_FK" FOREIGN KEY ("AUTHOR_ID")
	  REFERENCES "HERNANRIZZUTI"."AUTHORS" ("AUTHOR_ID") ENABLE;
  ALTER TABLE "HERNANRIZZUTI"."BOOK_AUTHOR" ADD CONSTRAINT "B_A_BS_ISBN_FK" FOREIGN KEY ("ISBN")
	  REFERENCES "HERNANRIZZUTI"."BOOKS" ("ISBN") ENABLE;
--------------------------------------------------------

--  Ref Constraints for Table BOOK_CATEGORY

--------------------------------------------------------


  ALTER TABLE "HERNANRIZZUTI"."BOOK_CATEGORY" ADD CONSTRAINT "B_C_BS_ISBN_FK" FOREIGN KEY ("ISBN")
	  REFERENCES "HERNANRIZZUTI"."BOOKS" ("ISBN") ENABLE;
  ALTER TABLE "HERNANRIZZUTI"."BOOK_CATEGORY" ADD CONSTRAINT "B_C_CS_CATEGORY_ID_FK" FOREIGN KEY ("CATEGORY_ID")
	  REFERENCES "HERNANRIZZUTI"."CATEGORIES" ("CATEGORY_ID") ENABLE;
--------------------------------------------------------

--  Ref Constraints for Table BOOK_STOCK

--------------------------------------------------------


  ALTER TABLE "HERNANRIZZUTI"."BOOK_STOCK" ADD CONSTRAINT "B_B_STOCK_ISBN_FK" FOREIGN KEY ("ISBN")
	  REFERENCES "HERNANRIZZUTI"."BOOKS" ("ISBN") ON DELETE CASCADE ENABLE;
--------------------------------------------------------

--  Ref Constraints for Table LIBUSERS

--------------------------------------------------------


  ALTER TABLE "HERNANRIZZUTI"."LIBUSERS" ADD CONSTRAINT "LIBUSER_TITLES_LIBUSERS_FK" FOREIGN KEY ("TITLE_ID")
	  REFERENCES "HERNANRIZZUTI"."LIBUSER_TITLES" ("TITLE_ID") ENABLE;
--------------------------------------------------------

--  Ref Constraints for Table LIBUSER_ROLES

--------------------------------------------------------


  ALTER TABLE "HERNANRIZZUTI"."LIBUSER_ROLES" ADD CONSTRAINT "LIBUSERS_LIBUSER_ROLES_FK" FOREIGN KEY ("USERNAME")
	  REFERENCES "HERNANRIZZUTI"."LIBUSERS" ("USERNAME") ENABLE;
--------------------------------------------------------

--  Ref Constraints for Table SHOPPING_CART

--------------------------------------------------------


  ALTER TABLE "HERNANRIZZUTI"."SHOPPING_CART" ADD CONSTRAINT "LIBUSERS_SHOPPING_CART_FK" FOREIGN KEY ("USERNAME")
	  REFERENCES "HERNANRIZZUTI"."LIBUSERS" ("USERNAME") ENABLE;
--------------------------------------------------------

--  Ref Constraints for Table SHOPPING_CART_HISTORY

--------------------------------------------------------


  ALTER TABLE "HERNANRIZZUTI"."SHOPPING_CART_HISTORY" ADD CONSTRAINT "LIBUSR_SHOP_CART_HISTORY_FK" FOREIGN KEY ("USERNAME")
	  REFERENCES "HERNANRIZZUTI"."LIBUSERS" ("USERNAME") ENABLE;
--------------------------------------------------------

--  DDL for Function MULTIPLIER

--------------------------------------------------------


  CREATE OR REPLACE FUNCTION "HERNANRIZZUTI"."MULTIPLIER" (x IN NUMBER, y IN NUMBER)
	RETURN VARCHAR2 IS answer VARCHAR2(20);
BEGIN
	answer := x||' x '||y||' is '||x*y;
	RETURN answer;
END;
 

/
--------------------------------------------------------

--  DDL for Package TYPES

--------------------------------------------------------


  CREATE OR REPLACE PACKAGE "HERNANRIZZUTI"."TYPES" AS
type cursorType is REF CURSOR;
END;

/
--------------------------------------------------------

--  DDL for Procedure ADD_BOOK

--------------------------------------------------------

set define off;


  CREATE OR REPLACE PROCEDURE "HERNANRIZZUTI"."ADD_BOOK" 
( 
  isbn_in IN VARCHAR2,
  title_in IN VARCHAR2,
  author_in IN VARCHAR2,
  about_in IN VARCHAR2,
  publisher_in IN VARCHAR2,
  price_in IN NUMBER,
  pages_in IN NUMBER,
  category_in IN VARCHAR2,
  date_in IN VARCHAR2,
  copies_in IN NUMBER,
  imagepath_in IN VARCHAR2
)
IS
BEGIN
INSERT INTO books
(
  isbn,
  title,
  author_id,
  about,
  publisher_id,
  price,
  pages_total_#,
  category_id,
  published_date,
  imagepath
)
VALUES
(
  isbn_in,
  title_in,
  (SELECT author_id FROM authors WHERE name = author_in),
  about_in,
  (SELECT publisher_id FROM publishers WHERE name = publisher_in ),
  price_in,
  pages_in,
  (SELECT category_id FROM categories WHERE name = category_in),
  TO_DATE(date_in, 'dd/mm/yyyy'),
  imagepath_in
);
INSERT INTO book_stock
(
  book_stock_id,
  isbn,
  book_copies_#
)
VALUES
(
book_stock_id_seq.nextval,
isbn_in,
copies_in
);
END;

/
--------------------------------------------------------

--  DDL for Procedure ADD_LIBUSER

--------------------------------------------------------

set define off;


  CREATE OR REPLACE PROCEDURE "HERNANRIZZUTI"."ADD_LIBUSER" (
    username_in  IN VARCHAR2,
    password_in  IN VARCHAR2,
    title_id_in  IN NUMBER,
    firstname_in IN VARCHAR2,
    lastname_in  IN VARCHAR2,
    email_in     IN VARCHAR2,
    enabled_in   IN NUMBER,
    authority_in IN VARCHAR2)
IS
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
      user_role_id,
      username,
      authority
    )
    VALUES
    (
      user_id_seq.nextval,
      username_in,
      authority_in
    );
END;

/
--------------------------------------------------------

--  DDL for Procedure BOOK_SEARCH

--------------------------------------------------------

set define off;


  CREATE OR REPLACE PROCEDURE "HERNANRIZZUTI"."BOOK_SEARCH" (
criteria_in IN VARCHAR2,
p_resultset OUT TYPES.cursorType
)
AS
BEGIN
OPEN p_resultset FOR
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
END;

/
--------------------------------------------------------

--  DDL for Procedure GET_ATMUSER

--------------------------------------------------------

set define off;


  CREATE OR REPLACE PROCEDURE "HERNANRIZZUTI"."GET_ATMUSER" 
(
  username_in IN VARCHAR2,
  p_RESULTSET OUT TYPES.cursorType  
)
AS
BEGIN
OPEN p_resultset FOR
SELECT
  username,
  pin,
  firstName,
  lastName,
  balance,
  accountNumber
FROM
  ATMUSERS
WHERE
  username = username_in;
END;

/
--------------------------------------------------------

--  DDL for Procedure GET_AUTHORS

--------------------------------------------------------

set define off;


  CREATE OR REPLACE PROCEDURE "HERNANRIZZUTI"."GET_AUTHORS" 
( 
  p_RESULTSET OUT TYPES.cursorType
)
AS
BEGIN
OPEN p_resultset FOR
  SELECT 
    name
  FROM 
    authors;
END;

/
--------------------------------------------------------

--  DDL for Procedure GET_BOOK

--------------------------------------------------------

set define off;


  CREATE OR REPLACE PROCEDURE "HERNANRIZZUTI"."GET_BOOK" (
    title_in IN VARCHAR2,
    p_resultset OUT TYPES.cursorType )
AS
BEGIN
  OPEN p_resultset FOR 
  SELECT 
    b.isbn, 
    b.title, 
    a.name AS author, 
    b.about, 
    c.name AS
    category, 
    b.price, 
    bs.book_copies_# AS copies, 
    b.pages_total_# AS pages, 
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
END;

/
--------------------------------------------------------

--  DDL for Procedure GET_BOOKS

--------------------------------------------------------

set define off;


  CREATE OR REPLACE PROCEDURE "HERNANRIZZUTI"."GET_BOOKS" (
p_resultset OUT TYPES.cursorType
)
AS
BEGIN
OPEN p_resultset FOR
SELECT
  b.isbn,
  b.title,
  a.name as author,
  b.about,
  c.name as category,
  b.price,
  bs.book_copies_# as copies,
  b.pages_total_# as pages,
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
END;

/
--------------------------------------------------------

--  DDL for Procedure GET_BOOKSTOCK_BY_TITLE_COPY

--------------------------------------------------------

set define off;


  CREATE OR REPLACE PROCEDURE "HERNANRIZZUTI"."GET_BOOKSTOCK_BY_TITLE_COPY" (
p_resultset OUT TYPES.cursorType
)
AS
BEGIN
OPEN p_resultset FOR
SELECT
  b.title,
  bs.book_copies_#
FROM
  books b
     INNER JOIN
   book_stock bs
     ON
    bs.isbn = b.isbn;
END;

/
--------------------------------------------------------

--  DDL for Procedure GET_BOOK_STOCK

--------------------------------------------------------

set define off;


  CREATE OR REPLACE PROCEDURE "HERNANRIZZUTI"."GET_BOOK_STOCK" (
p_resultset OUT TYPES.cursorType
)
AS
BEGIN
OPEN p_resultset FOR
SELECT
  SUM(book_copies_#) AS copies
FROM
  book_stock;
END;

/
--------------------------------------------------------

--  DDL for Procedure GET_BOOK_STOCK_BY_TITLE_COPY

--------------------------------------------------------

set define off;


  CREATE OR REPLACE PROCEDURE "HERNANRIZZUTI"."GET_BOOK_STOCK_BY_TITLE_COPY" (
p_resultset OUT TYPES.cursorType
)
AS
BEGIN
OPEN p_resultset FOR
SELECT
  b.title,
  bs.book_copies_#
FROM
  books b
     INNER JOIN
   book_stock bs
     ON
    bs.isbn = b.isbn;
END;

/
