[list]
select objid,uid,firstname,lastname,loginid,owner from user where parentid=$P{parentid} ${filter} order by lastname


[find]
select lastname, firstname from user where objid=?

[user-group-list]
select ur.userid, concat(u.lastname, ', ', u.firstname) as username, 
ur.role, ur.disallowedterminals, ur.schedules 
from user_role ur inner join user u on ur.userid=u.objid 
where ur.groupid = $P{groupid} 


[update-loginid]
update user set loginid=$P{loginid} where objid=$P{userid}

[userlevel]
select userlevel from user where objid=$P{userid}



