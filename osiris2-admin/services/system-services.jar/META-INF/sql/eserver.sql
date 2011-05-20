[script]
select content from res_script where name=?

[schema]
select content from res_schema where name=?

[sql]
select content from res_sql where name=?

[interceptors]
select name from res_script where category='interceptor'

[datasources]
select * from res_ds

[async-push]
insert into async_response (objid,requestId,data,expirydate) values (?,?,?, DATE_ADD(now(), INTERVAL 1 DAY) )

[async-poll]
select objid, data from async_response where requestId = ?

[async-remove]
delete from async_response where objid = ?