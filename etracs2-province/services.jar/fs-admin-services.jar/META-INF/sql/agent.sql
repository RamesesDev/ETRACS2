[list]
select objid,code,name,country,timezone from agent where parentid=$P{parentid} ${filter}