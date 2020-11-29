use meetingplanner;
drop procedure if exists controllo_utenti_senza_risposta;
delimiter $$
create procedure controllo_utenti_senza_risposta(in evn int)
begin
select i.* from invitato i join vota v on (i.id=v.id_invitato)
join proposta p on (p.id=v.id_proposte)
join evento e on(e.id=p.id_evento) 
where v.voto is null and e.id=evn and p.id_evento=evn;
end $$
delimiter ;

call controllo_utenti_senza_risposta(2)