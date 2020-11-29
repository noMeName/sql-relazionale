use meetingplanner;
drop procedure if exists  inserisci_sala;
create procedure inserisci_sala (IN nome varchar(25),IN  luogo varchar(25),IN  numero int)
insert into sala(nome,ubicazione,capienza) values(nome,luogo,numero);

call inserisci_sala ("sala prove", "canicccccccccccattì",500);
select * from sala
