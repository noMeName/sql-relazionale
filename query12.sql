use meetingplanner ;

drop procedure if exists eventoconf;
delimiter $$
create procedure eventoconf(in evnt int,in prp int)
begin
insert into evento (nome,id_organizzatore,id_sala,dataconf) 
select e.nome, e.id_organizzatore, p.dove,p.quando 
from evento e join  proposta p on( e.id=p.id_evento)
where e.id=evnt and p.id=prp ;

delete from evento where evento.id=evnt;
update evento set id=evnt where id=last_insert_id();
end$$
delimiter ;

call eventoconf(6,15);



####   Conferma di una riunione e dell’alternativa prescelta   ###
/*drop procedure if exists eventoconf;
create procedure eventoconf(in evnt int,in prp int)
update evento,proposta,sala
set evento.id_sala=if(evento.id=evnt and proposta.id_evento=evnt,
proposta.dove and evento.dataconf=proposta.quando,
continue)
where evento.id=evnt and proposta.id_evento=evento.id and proposta.id=prp and evento.id_sala=sala.id;

drop procedure if exists eventoconf;
delimiter $$

create procedure eventoconf(in evnt int,in prp int)
begin

 evento,proposta
set evento.id_sala=proposta.dove and evento.dataconf=proposta.quando
where evento.id=evnt and proposta.id_evento=evnt and proposta.id=prp ;


end $$
delimiter ;
call eventoconf(4,8);

select * from proposta join evento on (id_evento=evento.id)
order by evento.id;

*/