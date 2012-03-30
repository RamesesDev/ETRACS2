[list]
select * from sys_roleclass where rolelevel > $P{rolelevel} order by name

[module-list]
select * from sys_roleclass_module where roleclass = $P{roleclass}

[module-permissions]
select sm.name as modulename, sm.title as moduletitle, sm.permissions 
from sys_roleclass_module rcm  
inner join sys_module sm on sm.name = rcm.module 
where rcm.roleclass = $P{roleclass} 

[module-permission-list]
select m.name as modulename, m.title as moduletitle, m.permissions  
from sys_roleclass rc  
inner join sys_roleclass_module rcm on rc.name=rcm.roleclass  
inner join sys_module m on m.name=rcm.module  
where rcm.roleclass=$P{roleclass} 




