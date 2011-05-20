[list]
select objid,code,name,country,timezone,'partner' as type from partner ${filter}

[list-for-admin]
select p.objid,p.code,p.name,p.country,p.timezone, 'partner' as type 
from user_role u, role r, partner p  
where u.userid='USR-3443c0ad:12e03f8d6ca:-7ff3' 
  and u.grouptype='partner' 
  and u.role = r.name 
  and r.scope = 'superadmin' 
  and u.groupid=p.objid 

[get-objid-by-code]
select objid from partner where code=$P{code}
