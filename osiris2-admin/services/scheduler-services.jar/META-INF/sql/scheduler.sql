[list-active-queue]
select * from sys_task_info t 
inner join sys_task_queue tq on t.taskid = tq.taskid 
where t.nextdate < now() 
and not exists (select taskid from sys_task_suspended where taskid=t.taskid) 
and not exists (select taskid from sys_task_error where taskid=t.taskid) 
and t.allowedhost is null or t.allowedhost='' or t.allowedhost like '%${host}%' 
 
[add-to-processing]
insert into sys_task_processing (taskid, machineid, processhost, processdate) values ( ?,?,?, now() )

[remove-queue]
delete from sys_task_queue where taskid = ?

[remove-processing]
delete from sys_task_processing where taskid=?

[add-queue]
insert into sys_task_queue (taskid) values (?)

[update-next-date]
update sys_task_info set nextdate=? where taskid=?

[reset-next-date]
update sys_task_info set nextdate=startdate where taskid=?

[add-error]
insert into sys_task_error (taskid, msg) values (?,?) 

[add-task]
insert into sys_task_info (taskid,scriptname,method,startdate,enddate,duration,parameters,allowedhost,nextdate) 
values ($P{taskid}, $P{scriptname}, $P{method},$P{startdate},$P{enddate},$P{duration},$P{parameters},$P{allowedhost},$P{startdate}) 

[suspend-task]
insert into sys_task_suspended (taskid) values (?) 

[resume-task]
delete from sys_task_suspended where taskid=?

[remove-error]
delete from sys_task_error where taskid=?

[update-taskid]
update sys_task_taskid set taskid=taskid+1

[init-taskid]
insert into sys_task_taskid select 1

[get-taskid]
select taskid from sys_task_taskid

[list-tasks]
select *,  
   case 
	   when not((select 1 from sys_task_error where taskid=t.taskid) is null) then 'error' 
	   when not((select 1 from sys_task_processing where taskid=t.taskid) is null) then 'processing' 
	   when not((select 1 from sys_task_suspended where taskid=t.taskid) is null) then 'suspended' 
	   when not((select 1 from sys_task_queue where taskid=t.taskid) is null) then 'queue' 
	   else 'inactive' 
   end as status 
from sys_task_info t 

[view-error]
select msg from sys_task_error where taskid=?

[remove-system-task]
delete from sys_task_info where taskid=? and ownerid = 'system'

