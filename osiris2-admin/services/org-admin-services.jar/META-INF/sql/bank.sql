[list]
select objid,code,name,country,timezone from bank where parentid=$P{parentid} ${filter}