use meetingplanner;
drop procedure if exists  cerca_sala_libera;
delimiter $$
create procedure cerca_sala_libera(in data_disponibile date, in capienza_minima int)
begin
select distinct s.*
from sala s join evento e on(e.id_sala=s.id)
where s.capienza >= capienza_minima and s.id not in (
select e1.id_sala from evento e1 where e1.dataconf=data_disponibile );
end $$
delimiter ;


call cerca_sala_libera("2020-02-24",100)



