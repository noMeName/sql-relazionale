use meetingplanner;
drop procedure if exists elimina_sala;
delimiter $$

create procedure  elimina_sala(IN  numero int)
begin
delete from sala where sala.id=numero;
end $$
delimiter ;
call elimina_sala(7);
select * from sala


