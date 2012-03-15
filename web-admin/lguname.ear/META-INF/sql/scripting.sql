[list]
select name,category,notes from sys_script ${condition}

[find-script]
select content from sys_script where name=?

[remove-script]
delete from sys_script where name=?

[interceptors]
select name from sys_script where category='interceptor'

[async-push]
insert into sys_async_response (objid,requestId,data,idx,expirydate) values (?,?,?,?, DATE_ADD(now(), INTERVAL 1 DAY) )

[async-poll]
select objid, data from sys_async_response where requestId = ? order by idx ASC

[async-remove]
delete from sys_async_response where objid = ?