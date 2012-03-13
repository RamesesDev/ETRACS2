[module-permissions]
select m.name as modulename, m.title as moduletitle, m.permissions  
from sys_roleclass rc  
inner join sys_roleclass_module rcm on rc.name=rcm.roleclass  
inner join sys_module m on m.name=rcm.module  
where rcm.roleclass=$P{roleclass} 




