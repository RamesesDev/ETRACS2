[get]
select value, datatype from sys_var where name=$P{name}

[set]
update sys_var set value=$P{value} where name=$P{name}

[list]
select * from sys_var 
where category=$P{category} 
order by name 

[category]
select distinct category from sys_var where not(category is null) order by category 