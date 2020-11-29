use meetingplanner;
drop procedure if exists estrazione_voti_per_alternativa;
delimiter $$
create procedure estrazione_voti_per_alternativa(in evnt int)
begin 
select p.id,p.quando,p.dove , e.nome,count(*)
from evento  e join proposta p on  (e.id=p.id_evento) join  vota v on (p.id=v.id_proposte)
where e.id=evnt and voto=1
group by p.id;
end $$
delimiter ;

call estrazione_voti_per_alternativa(2);