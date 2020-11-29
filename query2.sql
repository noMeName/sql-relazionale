use meetingplanner;
-- Associazione delle attrezzature a una sala riunioni
drop procedure if exists associa_attrezzatura_sala;
delimiter $$
create procedure associa_attrezzatura_sala (in sala int,IN attrezzatura int)
begin
update attrezzatura set id_sala=sala
where id=attrezzatura;
end $$
delimiter ;



