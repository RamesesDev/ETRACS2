[get-excluded-permissions]
 select 
	j.excluded as jobexcluded, r.included as roleincluded
 from 
  jobposition j
 inner join role r on r.name = j.role
 where j.objid = $P{jobid}


[get-module-permissions]
 select name, permissions from sys_module where name in (
   select module from roleclass_module where roleclass = $P{roleclass}
 )