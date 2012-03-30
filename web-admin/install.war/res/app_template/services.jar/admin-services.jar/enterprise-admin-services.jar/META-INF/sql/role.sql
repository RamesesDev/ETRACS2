[list]
 select * from role order by name 

[list-exclude-system]
select * from role where not(system=1) order by name 

[list-by-roleclass]
select * from role where roleclass=$P{roleclass} order by name
 
[list-by-roleclass-exclude-system]
select * from role where roleclass=$P{roleclass} and not(system=1) order by name

[permissions]
select r.name, r.included, r.roleclass  
from role r 
where r.name = $P{role} 