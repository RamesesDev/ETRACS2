[list]
select * from orgunit where orgtype=$P{orgtype} order by code

[orgtype-list]
select * from orgtype

[list-by-user-orgtype]
select * from orgunit where orgtype=$P{orgtype} order by code

[list-by-user]
select * from orgunit order by code