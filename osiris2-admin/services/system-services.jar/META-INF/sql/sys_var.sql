[get]
select value, type from sys_var where name=$P{name}

[set]
update sys_var set value=$P{value}, type=$P{type} where name=$P{name}
