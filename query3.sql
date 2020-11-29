use meetingplanner;
-- Correzione (modifica) dell’ubicazione di una sala riunioni.
drop procedure if exists update_sala;
delimiter $$

create procedure update_sala (in id_sala int,IN luogo varchar(25))
begin
update sala set ubicazione=luogo
where id=id_sala;
end $$
delimiter ;
