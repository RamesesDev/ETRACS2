[load-tasks]
insert ignore into sys_task_active 
select t.id, $P{host} from sys_task t where 
(t.allowedhost is null or t.allowedhost = $P{host}) 
and (t.enddate is null or t.currentdate is null or t.currentdate < t.enddate)

[unload-tasks]
delete from sys_task_active where host=$P{host}

[load-pending-tasks]
select 
  t.*, 
  IFNULL( (select 1 from sys_task_suspended p where p.id=t.id), 0 ) AS suspended, 
  IFNULL( (select 1 from sys_task_error p where p.id=t.id), 0 ) AS error 
from sys_task t 
inner join  sys_task_active ta 
on t.id = ta.id 
where ta.host=$P{host}

[load-single-task]
insert into sys_task_active 
select t.id, $P{host} from sys_task t 
where t.id = $P{id} 
and (t.allowedhost is null or t.allowedhost = $P{host}) 
and (t.enddate is null or t.currentdate is null or t.currentdate < t.enddate)

[get-single-task]
select 
  t.*, 
  IFNULL( (select 1 from sys_task_suspended p where p.id=t.id), 0 ) AS suspended, 
  IFNULL( (select 1 from sys_task_error p where p.id=t.id), 0 ) AS error 
from sys_task t 
inner join  sys_task_active ta 
on t.id = ta.id 
where t.id = $P{id}

[active-tasks]
select 
  t.*, 
  CASE
	WHEN EXISTS (select * from sys_task_suspended p where p.id=t.id) THEN 'suspended'
	WHEN EXISTS (select * from sys_task_error p where p.id=t.id) THEN 'error'
	ELSE 'active'
  END as status 	
from sys_task t 
where (t.enddate is null or t.currentdate is null or t.currentdate < t.enddate)

[suspend]
insert into sys_task_suspended (id) values (?)

[resume]
delete from sys_task_suspended where id=?

[update-next-date]
update sys_task set currentdate=$P{currentdate} where id=$P{id}

[remove-active]
delete from sys_task_active where id=$P{id}


[log-error]
insert into sys_task_error (id, message) values ( $P{id}, $P{message})

[resume-error]
delete from sys_task_error where id=?

[add-task]
insert into sys_task 
(id, appcontext, apphost, service, servicetype, method, startdate, enddate, currentdate, `interval`, `parameters`, allowedhost, description) values 
($P{id}, $P{appcontext}, $P{apphost}, $P{service}, $P{servicetype}, $P{method}, $P{startdate}, $P{enddate}, $P{currentdate}, $P{interval}, $P{parameters}, $P{allowedhost}, $P{description} )

[update-task]
update sys_task   
set appcontext=$P{appcontext},apphost=$P{apphost},service=$P{service},servicetype=$P{servicetype},
method=$P{method},startdate=$P{startdate},enddate=$P{enddate},currentdate=$P{currentdate},`interval`=$P{interval},
`parameters`=$P{parameters},allowedhost=$P{allowedhost},description=$P{description} 
where id=$P{id}
