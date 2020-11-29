drop database if exists meetingplanner;
create database meetingplanner ;
use meetingplanner;

drop table if exists organizzatore;
create table organizzatore(
   id  int primary key auto_increment,
   cf char(16) unique not null,
   nome varchar(25) not null,
   cognome varchar(25) not null,
   email varchar(25) unique not null
);

drop table if exists sala;
create table sala(
   id int  auto_increment  primary key,
   nome varchar(25) not null ,
   ubicazione varchar(25) not null,
   unique(nome,ubicazione),
   capienza int default 50
);

drop table if exists invitato;
create table  invitato(
   id int primary key not null auto_increment,
   cf char(16) unique  not null,
   nome varchar(25) not null,
   cognome varchar(25) not null,
   email varchar(25) not null
);

drop table if exists evento;
create table evento(
   id int primary key  not null auto_increment ,
   nome varchar(40) not null,
   id_organizzatore int  not null,
   id_sala int default null,
   dataconf  date default null,
   unique(dataconf,id_sala),
   foreign key(id_organizzatore) references organizzatore(id)  on update cascade,
   foreign key(id_sala) references sala(id)  on update cascade 
);

drop table if exists proposta;
create table  proposta(
   id int primary key not null auto_increment ,
   id_evento int not null,
   quando date,
   dove int , 
   unique(quando,dove),
   foreign key(dove) references sala(id)  on update cascade,
   foreign key (id_evento) references evento(id)  on delete cascade on update cascade 
);

drop table if exists vota;
create table  vota(
   id_invitato int not null,
   id_proposte int not null,
   voto boolean,
   primary key(id_invitato , id_proposte),
   foreign key (id_invitato) references invitato(id) on delete cascade on update cascade,
   foreign key (id_proposte) references proposta(id) on delete cascade  on update cascade
);

drop table if exists partecipa;
create table  partecipa(
   id_invitato int ,
   id_evento int,
   primary key(id_invitato,id_evento),
   foreign key (id_invitato) references invitato(id) on delete cascade on update cascade,
   foreign key (id_evento) references evento(id) on delete cascade on update cascade

);

drop table if exists attrezzatura;
create table attrezzatura(
   id int primary key auto_increment,
   nome varchar(25) not null,
   id_sala int,
   foreign key (id_sala) references sala(id) on delete cascade on update cascade
);

drop table if exists invita;
create table invita(
	id_organizzatore int not null,
    id_invitato int not null,
    id_evento int not null,
    primary key(id_organizzatore,id_invitato,id_evento),
    foreign key(id_organizzatore) references organizzatore(id) on delete cascade,
    foreign key(id_invitato) references invitato(id) on delete cascade on update cascade,
    foreign key(id_evento) references evento(id) on delete cascade on update cascade
);


insert into organizzatore(cf,nome,cognome,email) values('sptfnc89a21a345h','Francesco','Spatari','kekkoapa@gmail.com');
insert into organizzatore(cf,nome,cognome,email) values('infgpp88c28i537m','Giuseppe','Infantino','infa.g@hotmail.com');
insert into organizzatore(cf,nome,cognome,email) values('nnandr73d15b344f','Andrea','Anania','andre2a@gmail.com');
insert into organizzatore(cf,nome,cognome,email) values('plvntn76l17e456h','Antonio','Pulvirenti','pulviking@hotmail.com');
insert into organizzatore(cf,nome,cognome,email) values('sfoprz90s58t988f','Patrizia','Sofio','patsof@libero.it');
insert into organizzatore(cf,nome,cognome,email) values('ptrsfn68t45q122r','Stefania','Petrace','petttraci@gmail.com');
insert into organizzatore(cf,nome,cognome,email) values('brnfnc92b22v276h','Francesco','Barone','kikkob@libero.it');



insert into sala(nome,ubicazione,capienza) values('Salone Pio 15','Palmi',200);
insert into sala(nome,ubicazione,capienza) values('Centro Ambesi','Gioia Tauro',40);
insert into sala(nome,ubicazione,capienza) values('Palazzo Palapentimele','Reggio Calabria',100);
insert into sala(nome,ubicazione,capienza) values('Capannone','Vibo Valentia',90);
insert into sala(nome,ubicazione,capienza) values('Sala comizi','Lamezia',125);
insert into sala(nome,ubicazione,capienza) values('Centro Emmanuel','Taurianova',60);


###########################################
########    DA FINIRE   ###################
###########################################
insert into invitato(cf,nome,cognome,email) values('brnngl90a22i537m','Angelo','Barone','angebi@gmail.com');
insert into invitato(cf,nome,cognome,email) values('esppri86b23a345g','Piero','Esposito','espox@hotmail.it');
insert into invitato(cf,nome,cognome,email) values('rffsmn63c24f432g','Simone','Raffa','rsimo@hotmail.it');
insert into invitato(cf,nome,cognome,email) values('srggli76d12k876h','Giulio','Sergi','xxser@gmail.com');
insert into invitato(cf,nome,cognome,email) values('grsvcz83l13n956h','Vincenzo','Grassi','gravi@hotmail.it');
insert into invitato(cf,nome,cognome,email) values('cntbnc89h53f546d','Bianca','Conte','bie@gmail.com');
insert into invitato(cf,nome,cognome,email) values('rnzvlr84r42a111a','Valeria','Renzi','shish@gmail.com');
insert into invitato(cf,nome,cognome,email) values('rssncl75c13b222b','Nicola','Rossi','nik@gmail.com');
insert into invitato(cf,nome,cognome,email) values('vlidtl69d14f561e','Donatello','Viola','violetta@hotmail.it');
insert into invitato(cf,nome,cognome,email) values('mcamhl75a24l999p','Michelangelo','Mace','mikm@hotmail.it');
insert into invitato(cf,nome,cognome,email) values('cntlrd87a23s355a','Leonardo','Conte','leoconte@hotmail.com');
insert into invitato(cf,nome,cognome,email) values('vlirfl99d13c422i','Raffaele','Viola','raffaviola@gmail.com');
insert into invitato(cf,nome,cognome,email) values('vrdncl23d14f194a','Nicola','Verdi','niccccoooola@gmail.com');
insert into invitato(cf,nome,cognome,email) values('bncmra79c08p655d','Mario','Bonaccorso','mbario@hotmail.com');
insert into invitato(cf,nome,cognome,email) values('rssmra56r09o567m','Maria','Rossi','maryred@hotmail.com');



insert into evento(nome,dataconf,id_sala,id_organizzatore) values('Incontro scacchistico','2020-2-24',1,1);
insert into evento(nome,dataconf,id_sala,id_organizzatore) values('Conferenza di cybersecurity','2020-4-30',3,2);
insert into evento(nome,dataconf,id_sala,id_organizzatore) values('Conferenza Sportiva','2020-11-26',3,3);
insert into evento(nome,dataconf,id_sala,id_organizzatore) values('Comitato della salute','2020-8-11',2,4);
insert into evento(nome,dataconf,id_sala,id_organizzatore) values('Libri amici','2020-10-4',4,5);
insert into evento(nome,dataconf,id_sala,id_organizzatore) values('Salviamo i pesci','2021-9-24',5,6);
insert into evento(nome,dataconf,id_sala,id_organizzatore) values('Raccolta fondi slp','2021-7-7',3,7);
insert into evento(nome,dataconf,id_sala,id_organizzatore) values('Romhack','2022-9-19',2,6);


insert into proposta(id_evento,quando,dove) values(1,'2020-10-5',6);
insert into proposta(id_evento,quando,dove) values(1,'202-11-4',1);
insert into proposta(id_evento,quando,dove) values(2,'2020-12-7',5);
insert into proposta(id_evento,quando,dove) values(2,'2020-8-8',2);
insert into proposta(id_evento,quando,dove) values(3,'2020-9-11',4);
insert into proposta(id_evento,quando,dove) values(3,'2020-8-22',3);
insert into proposta(id_evento,quando,dove) values(4,'2020-9-21',6);
insert into proposta(id_evento,quando,dove) values(4,'2020-10-14',6);
insert into proposta(id_evento,quando,dove) values(4,'2020-11-16',5);
insert into proposta(id_evento,quando,dove) values(4,'2020-12-1',5);
insert into proposta(id_evento,quando,dove) values(5,'2020-6-3',4);
insert into proposta(id_evento,quando,dove) values(5,'2020-8-27',4);
insert into proposta(id_evento,quando,dove) values(6,'2020-9-29',2);
insert into proposta(id_evento,quando,dove) values(6,'2020-10-12',1);
insert into proposta(id_evento,quando,dove) values(6,'2021-3-9',1);
insert into proposta(id_evento,quando,dove) values(7,'2021-2-6',2);
insert into proposta(id_evento,quando,dove) values(8,'2021-4-3',3);
insert into proposta(id_evento,quando,dove) values(8,'2021-6-4',3);
insert into proposta(id_evento,quando,dove) values(8,'2021-7-17',3);
insert into proposta(id_evento,quando,dove) values(8,'2021-2-13',4);


insert into vota(id_invitato,id_proposte,voto) values(1,3,1);
insert into vota(id_invitato,id_proposte,voto) values(2,4,0);
insert into vota(id_invitato,id_proposte,voto) values(1,2,1);
insert into vota(id_invitato,id_proposte,voto) values(10,11,1);
insert into vota(id_invitato,id_proposte,voto) values(10,1,0);
insert into vota(id_invitato,id_proposte,voto) values(12,18,1);
insert into vota(id_invitato,id_proposte,voto) values(3,5,1);
insert into vota(id_invitato,id_proposte,voto) values(4,6,1);
insert into vota(id_invitato,id_proposte,voto) values(5,7,1);
insert into vota(id_invitato,id_proposte,voto) values(6,8,1);
insert into vota(id_invitato,id_proposte,voto) values(7,9,1);
insert into vota(id_invitato,id_proposte,voto) values(8,10,1);
insert into vota(id_invitato,id_proposte,voto) values(9,11,1);
insert into vota(id_invitato,id_proposte,voto) values(10,18,1);
insert into vota(id_invitato,id_proposte,voto) values(11,12,1);
insert into vota(id_invitato,id_proposte,voto) values(12,3,1);
insert into vota(id_invitato,id_proposte,voto) values(13,19,1);
insert into vota(id_invitato,id_proposte,voto) values(14,15,1);
insert into vota(id_invitato,id_proposte,voto) values(15,14,1);
insert into vota(id_invitato,id_proposte,voto) values(1,6,1);
insert into vota(id_invitato,id_proposte,voto) values(2,12,1);
insert into vota(id_invitato,id_proposte,voto) values(3,6,1);
insert into vota(id_invitato,id_proposte,voto) values(4,8,1);
insert into vota(id_invitato,id_proposte,voto) values(5,9,1);
insert into vota(id_invitato,id_proposte,voto) values(6,4,1);
insert into vota(id_invitato,id_proposte,voto) values(7,5,1);
insert into vota(id_invitato,id_proposte,voto) values(8,7,1);

insert into partecipa(id_invitato,id_evento) values(1,5);
insert into partecipa(id_invitato,id_evento) values(2,6);
insert into partecipa(id_invitato,id_evento) values(3,6);
insert into partecipa(id_invitato,id_evento) values(4,5);
insert into partecipa(id_invitato,id_evento) values(5,8);
insert into partecipa(id_invitato,id_evento) values(6,8);
insert into partecipa(id_invitato,id_evento) values(7,1);
insert into partecipa(id_invitato,id_evento) values(8,2);
insert into partecipa(id_invitato,id_evento) values(9,3);
insert into partecipa(id_invitato,id_evento) values(10,7);
insert into partecipa(id_invitato,id_evento) values(12,5);
insert into partecipa(id_invitato,id_evento) values(13,4);
insert into partecipa(id_invitato,id_evento) values(14,2);
insert into partecipa(id_invitato,id_evento) values(15,3);
insert into partecipa(id_invitato,id_evento) values(1,1);
insert into partecipa(id_invitato,id_evento) values(11,2);
insert into partecipa(id_invitato,id_evento) values(10,3);
insert into partecipa(id_invitato,id_evento) values(9,4);
insert into partecipa(id_invitato,id_evento) values(5,7);
insert into partecipa(id_invitato,id_evento) values(6,4);

insert into attrezzatura(nome,id_sala) values('condizionatore',1);
insert into attrezzatura(nome,id_sala) values('condizionatore',2);
insert into attrezzatura(nome,id_sala) values('proiettore',3);
insert into attrezzatura(nome,id_sala) values('impianto acustico',4);
insert into attrezzatura(nome,id_sala) values('impianto acustico',5);
insert into attrezzatura(nome,id_sala) values('condizionatore',6);
insert into attrezzatura(nome,id_sala) values('televisore',1);
insert into attrezzatura(nome,id_sala) values('televisore',2);
insert into attrezzatura(nome,id_sala) values('televisore',3);
insert into attrezzatura(nome,id_sala) values('proiettore',5);
insert into attrezzatura(nome,id_sala) values('proiettore',4);
insert into attrezzatura(nome,id_sala) values('proiettore',6);

insert into invita(id_organizzatore,id_invitato,id_evento) values(1,1,1);
insert into invita(id_organizzatore,id_invitato,id_evento) values(7,5,4);
insert into invita(id_organizzatore,id_invitato,id_evento) values(1,6,5);
insert into invita(id_organizzatore,id_invitato,id_evento) values(3,8,6);
insert into invita(id_organizzatore,id_invitato,id_evento) values(5,10,7);
insert into invita(id_organizzatore,id_invitato,id_evento) values(3,15,8);
insert into invita(id_organizzatore,id_invitato,id_evento) values(2,14,6);
insert into invita(id_organizzatore,id_invitato,id_evento) values(3,12,5);
insert into invita(id_organizzatore,id_invitato,id_evento) values(2,11,6);
insert into invita(id_organizzatore,id_invitato,id_evento) values(2,6,2);
insert into invita(id_organizzatore,id_invitato,id_evento) values(3,7,3);
insert into invita(id_organizzatore,id_invitato,id_evento) values(4,8,3);
insert into invita(id_organizzatore,id_invitato,id_evento) values(5,9,1);
insert into invita(id_organizzatore,id_invitato,id_evento) values(6,4,3);
insert into invita(id_organizzatore,id_invitato,id_evento) values(7,6,2);
insert into invita(id_organizzatore,id_invitato,id_evento) values(4,7,2);

