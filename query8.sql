

use meetingplanner;
drop procedure if exists voto_proposta;
delimiter $$
create procedure voto_proposta(in invitato int, in proposta int, in vot boolean)
begin
insert into vota(id_invitato,id_proposte,voto) values(invitato , proposta, vot);
end $$
delimiter ;

call voto_proposta(1,5,1);
select * from vota