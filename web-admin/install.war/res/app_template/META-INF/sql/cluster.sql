[add-host]
insert ignore into sys_cluster_host (name,context,host) values (?,?,?)
 
[list-hosts]
select * from sys_cluster_host where not(name=?)

[remove-host]
delete from sys_cluster_host where name=?