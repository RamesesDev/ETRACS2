[list]
select p.*, exists (select 1 from useraccount u where u.objid=p.objid) as canlogin 
from ( 
  select objid,staffno,lastname,firstname 
  from personnel 
  ${condition} 
) p  
order by p.lastname, p.firstname, p.staffno 

[getPersonnelPositions]
select code, title, role, objid  
from jobposition 
where assigneeid=$P{objid}
