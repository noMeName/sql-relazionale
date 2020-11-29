use meetingplanner;


drop procedure if  exists partecipazione_alternativa_prescelta;
delimiter $$
create procedure partecipazione_alternativa_prescelta(in evn int)
begin
select ii.*
from invitato ii join vota v on(ii.id=v.id_invitato) join proposta p on(v.id_proposte=p.id) join evento e on(e.id=p.id_evento)
where  v.voto=1 and e.id=evn ;

end $$
delimiter ;

call partecipazione_alternativa_prescelta(3)