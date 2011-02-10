[add-task]
insert into task_info (taskid,scriptname,method,startdate,enddate,duration,parameters,allowedhost) 
values ($P{taskid}, $P{scriptname}, $P{method},$P{startdate},$P{enddate},$P{duration},$P{parameters},$P{allowedhost}) 

[start-task]
insert into task_queue (taskid, expirydate, dtfiled)  
select t.taskid, t.startdate, NOW() from task_info t where t.taskid = ?   

[suspend-task]
insert into task_suspended (taskid) values (?) 

[resume-task]
delete from task_suspended where taskid=?

[update-taskid]
update task_taskid set taskid=taskid+1

[init-taskid]
insert into task_taskid select 1

[get-taskid]
select taskid from task_taskid

[add-queue]
insert into task_queue (taskid, expirydate,dtfiled) values (?,?,NOW())

[list-queue]
select t.taskid, q.expirydate 
from task_info t inner join task_queue q on t.taskid = q.taskid 
and q.expirydate <= NOW() 
and  not exists (select taskid from task_suspended where taskid=q.taskid)  
and exists (select taskid from task_info where taskid=q.taskid and (allowedhost is null or allowedhost like '%${host}%' ) ) 

[transfer-queue-to-interim]
insert into task_interim ( taskid, machineid, expirydate, processhost ) values (?,?,?,?)

[remove-queue]
delete from task_queue where taskid = ?

[list-interim]
select t.*, q.expirydate, q.machineid, q.processhost 
from task_interim q inner join task_info t on t.taskid=q.taskid 
where q.machineid=?

[transfer-interim-to-processing]
insert into task_processing (taskid, machineid, processdate, processhost) 
select t.taskid, q.machineid, NOW(), q.processhost  
from task_interim q inner join task_info t on t.taskid=q.taskid 
where t.taskid=? 

[remove-interim]
delete from task_interim where taskid=?

[remove-processing]
delete from task_processing where taskid=?