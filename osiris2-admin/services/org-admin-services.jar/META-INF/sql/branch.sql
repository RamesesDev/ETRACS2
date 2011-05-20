[list]
select objid,code,name,country,timezone from branch where parentid=$P{parentid} ${filter}

[by-code]
select * from branch where code = $P{code} 

