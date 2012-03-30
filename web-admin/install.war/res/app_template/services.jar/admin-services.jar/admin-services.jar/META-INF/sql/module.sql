[list]
select * from sys_module

[get-module-permissions-by-roleclass]
 select 
   name, permissions 
 from sys_module 
 where name in (
   select module from sys_roleclass_module where roleclass = $P{roleclass}
 )


