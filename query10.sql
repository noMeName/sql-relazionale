use meetingplanner;

create procedure proposta_con_maggioranza_voti(in evnt int)
select p.id, e.nome,count(v.voto) c
from evento e join proposta p on  (e.id=p.id_evento) join  vota v on (p.id=v.id_proposte)
where e.id=evnt and voto=1
group by p.id
having max(c)
