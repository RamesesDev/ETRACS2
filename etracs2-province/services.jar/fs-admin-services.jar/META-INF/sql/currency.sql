[list]
select code,name from currency 

[allowed]
select c.code,c.name 
from currency c 
inner join allowed_currency ac on c.code = ac.currency 
where ac.parentid = $P{parentid} 
