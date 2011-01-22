[get]
select value, type from sys_var where name=$P{name}

[set]
update sys_var set value=$P{value} where name=$P{name}
