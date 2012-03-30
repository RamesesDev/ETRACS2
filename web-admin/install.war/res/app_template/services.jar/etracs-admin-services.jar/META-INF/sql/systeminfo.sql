

[getList]
select * from sys_var 

[updateVar]
update sys_var set value = $P{value} 
where name = $P{name} 
