drop database if exists empresa;
create database empresa;
use empresa;

drop table if exists Categories;
create table Categories(
	codi int (8) auto_increment,
    primary key (codi),
    nom varchar (15),
    inf_rellevant varchar (50)
);

drop table if exists Productes;
create table Productes(
	id int (8) auto_increment,
    primary key (id),
    nom varchar (80),
	estoc int (3),
    imatge varchar (500),
    codi_categoria int (8) not null,
    foreign key (codi_categoria) references Categories (codi) ON DELETE CASCADE
    
);

drop table if exists Similar;
create table Similar(
	id_producte1 int (8) not null,
    foreign key (id_producte1) references Productes (id) ON DELETE CASCADE,
    id_producte2 int (8) not null,
    foreign key (id_producte2) references Productes (id) ON DELETE CASCADE
);

drop table if exists Proveïdors;
create table Proveïdors(
	NIF varchar (9) primary key,
    nom varchar (15),
    telèfon int (9),
    direcció varchar (50)
);

drop table if exists Proveeix;
create table Proveeix(
	id int (8) not null,
    foreign key (id) references Productes (id) ON DELETE CASCADE,
    NIF varchar (9) not null,
    foreign key (NIF) references Proveïdors (NIF) ON DELETE CASCADE
);

drop table if exists Materials;
create table Materials(
	codi int (8) auto_increment,
    primary key (codi),
    nom varchar (25),
    tipus varchar (30)
);

drop table if exists Formats;
create table Formats(
	id int (8) not null,
    foreign key (id) references Productes (id) ON DELETE CASCADE   ,
    codi int (8) not null,
    foreign key (codi) references Materials (codi) ON DELETE CASCADE
);



# INSERTEM ELS REGISTRES DE LA TAULA CATEGORIES

INSERT INTO Categories VALUES(1,'Escriptoris', ' Varietat de escriptoris per al gust del client'),
(default,'Sofàs', 'Varietat de escriptoris per al gust del client '),
(default,'Cadires', ' Varietat de escriptoris per al gust del client'),
(default,'Estanteria', ' Varietat de escriptoris per al gust del client'),
(default,'Armaris', ' Varietat de escriptoris per al gust del client');



# INSERTEM ELS REGISTRES DE LA TAULA PRODUCTES

INSERT INTO Productes VALUES(1,'Escriptori Gaming Negre', 87,'/IMG/1.png',1),
(default,'Escriptori p/nen/a', 23,'/IMG/2.png',1),
(default,'Escriptori de oficina negre amb cantonada', 8,'/IMG/3.png',1),
(default,'Escriptori regulable per la casa', 76,'/IMG/4.png',1),
(default,'Escriptori de suport', 4,'/IMG/5.png',1),
(default,'Sofà/llit de 3 places', 2,'/IMG/6.png',2),
(default,'Sofà de tela 3 places', 20,'/IMG/7.png',2),
(default,'Sofà amb cantonada (5 places en total)', 69,'/IMG/8.png',2),
(default,'Sofà negre de dos places', 34,'/IMG/9.png',2),
(default,'Sofa de pell sintetica de 3 places', 51,'/IMG/10.png',2),
(default,'Cadira gaming negra i vermella', 66,'/IMG/11.png',3),
(default,'Cadira de escriptori blava per a nen/a', 7,'/IMG/12.png',3),
(default,'Tamburet alt plegable', 54,'/IMG/13.png',3),
(default,'Butaca negra', 22,'/IMG/14.png',3),
(default,'Trona amb safata per a bebé', 90,'/IMG/15.png',3),
(default,'Estanteria de cup blanc', 45,'/IMG/16.png',4),
(default,'Estanteria de 8 cups blanc', 18,'/IMG/17.png',4),
(default,'Estanteria de 3 plantes', 102,'/IMG/18.png',4),
(default,'Llibreria', 6,'/IMG/19.png',4),
(default,'Estanteria modular amb rodetes ', 40,'/IMG/20.png',4),
(default,'Armari amb doble porta i mirall', 111,'/IMG/21.png',5),
(default,'Armari obert', 44,'/IMG/22.png',5),
(default,'Armari amb caixoneres extraïbles', 50,'/IMG/23.png',5),
(default,'Vestidor amb penjadors i calaixeres', 101,'/IMG/24.png',5),
(default,'Armari amb cantonada', 97,'/IMG/25.png',5);



# INSERTEM ELS REGISTRES DE LA TAULA SIMILAR

INSERT INTO Similar VALUES(3,4),
(7,10),
(16,17),
(1,2),
(20,25);



# INSERTEM ELS REGISTRES DE LA TAULA PROVEÏDORS

INSERT INTO Proveïdors VALUES('B25013574','Mobel Linia','973530050','Ctra.Guissona, Km.1 Cervera (Spain)'),
('B62110507','Tàrrega S L','973314540','Carretera Nacional (km 508,6), Tarrega (Spain)'),
('B25089234','møbler','973684112','c/ Las glorias (km 234,2) Ponts (Spain)');



# INSERTEM ELS REGISTRES DE LA TAULA PROVEEIX

INSERT INTO Proveeix VALUES(1,'B25089234'),
(2,'B25089234'),
(3,'B25089234'),
(4,'B25089234'),
(5,'B25089234'),
(6,'B62110507'),
(7,'B62110507'),
(8,'B62110507'),
(9,'B62110507'),
(10,'B62110507'),
(11,'B25089234'),
(12,'B25089234'),
(13,'B25089234'),
(14,'B25089234'),
(15,'B25089234'),
(16,'B25013574'),
(17,'B25013574'),
(18,'B25013574'),
(19,'B25013574'),
(20,'B25013574'),
(21,'B25013574'),
(22,'B25013574'),
(23,'B25013574'),
(24,'B25013574'),
(25,'B25013574');



# INSERTEM ELS REGISTRES DE LA TAULA MATERIALS

#Escriptori2, Sofà2, Sofà3, Sofà5, Estanteria3, Estanteria4, Estanteria5
INSERT INTO Materials VALUES(1,'Fusta', ' Fusta massissa '),
#Escriptori1, Escriptori2, Sofà1, Sofà2, Sofà3, Sofà 4, Sofà5, Estanteria1, Estanteria2, Armari3,  Armari5, Armari1, Armari2, Armari3, Armari4, Armari5, Sofà4, Cadira4
(default,'Fibra', ' Tauler de fibra'),
#Escriptori1, Escriptori3, Escriptori4, Escriptori 5, Cadira1,  Cadira2, Cadira5, Estanteria3, Estanteria5, Armari3
(default,'Acer', ' Amb revestiment de polièster'),
#Escriptori3, Escriptori4, Armari4
(default,'Alumini', ' Amb revestiment de polièster'),
#Escriptori5, Armari1
(default,'Vidre', 'Templat'),
#Sofà1, Sofà2
(default,'Tela', 'polièster'),
#Sofà3, Sofà5, Cadira4
(default,'Guata', 'polièster'),
#Cadira1, Cadira2, Cadira3, Cadira5, Estanteria4, Armari1, Armari5
(default,'Plàstic', 'polièster');



# INSERTEM ELS REGISTRES DE LA TAULA FORMATS

INSERT INTO Formats VALUES(1,2),
(1,3),
(2,1),
(2,2),
(3,3),
(3,4),
(4,3),
(4,4),
(5,3),
(5,5),
(6,2),
(6,6),
(7,1),
(7,2),
(7,6),
(8,1),
(8,2),
(8,7),
(9,2),
(10,1),
(10,2),
(10,7),
(11,3),
(11,8),
(12,3),
(12,8),
(13,8),
(14,2),
(14,7),
(15,3),
(15,8),
(16,2),
(17,2),
(18,1),
(18,3),
(19,1),
(19,8),
(20,1),
(20,3),
(21,2),
(21,5),
(21,8),
(22,2),
(23,2),
(23,3),
(24,2),
(24,4),
(25,2),
(25,8);



























