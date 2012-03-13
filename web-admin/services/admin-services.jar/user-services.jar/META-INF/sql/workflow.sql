[list]
select wt.* 
from wf_task wt 
inner join wf_task_actor wa on wa.taskid=wt.objid 
where wa.actorid=$P{actorid} 

[remove-actors]
delete from wf_task_actor where taskid=$P{taskid}