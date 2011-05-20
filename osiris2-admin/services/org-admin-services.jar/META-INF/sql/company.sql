[list]
select objid,code,name,country,timezone from company where parentid=$P{parentid} ${filter}

[by-code]
select * from company where code = $P{code} 

[managed-list]
select distinct c.objid,c.code,c.name,c.country,c.timezone from company c 
where c.parentid=$P{parentid} and c.objid in (
	select ur.groupid from user_role ur 
	inner join role r on r.name = ur.role
	where r.admin=1 and ur.userid=$P{userid})