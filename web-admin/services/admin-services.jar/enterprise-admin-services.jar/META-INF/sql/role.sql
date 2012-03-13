[list]
 select * from role order by name

[list-by-roleclass]
 select * from role where roleclass=$P{roleclass} order by name

[permissions]
select r.name, r.included, r.roleclass  
from role r 
where r.name = $P{role} 