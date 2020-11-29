use meetingplanner;
delimiter $$
create procedure verifica_partecipante_in_lista(in partecipante int, in evnt int)
begin 
select if(count(ii.id)>0,"è in lista", "non è in lista")
from invita i join  invitato ii on(i.id_invitato=ii.id) join evento e on(e.id=i.id_evento)
where e.id=evnt and i.id_invitato=partecipante;
 end $$
 delimiter ;


call verifica_partecipante_in_lista(2,6)