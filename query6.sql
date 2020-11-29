use meetingplanner;
drop procedure if exists invito;
delimiter $$
create procedure invito(in org int, in inv int, in eve int)
begin 
insert into invita(id_organizzatore,id_invitato,id_evento) values (org,inv,eve) ;
end $$
delimiter ;


call invito(3,6,2);
select * from invita


