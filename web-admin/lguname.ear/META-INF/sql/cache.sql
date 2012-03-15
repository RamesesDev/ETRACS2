[add-cache]
insert into sys_cache (id,host) values (?,?)

[find-cache-host]
select host from sys_cache where id=?

[remove-cache]
delete from sys_cache where id=?

[remove-host]
delete from sys_cache where host=?