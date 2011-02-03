[list]
select objid,uid,firstname,lastname,loginid,owner from user where parentid=$P{parentid} ${filter} order by lastname


[find]
select lastname, firstname from user where objid=?

[user-group-list]
select ur.userid, concat(u.lastname, ', ', u.firstname) as username, 
ur.role, ur.disallowedterminals, ur.schedules 
from user_role ur inner join user u on ur.userid=u.objid 
where ur.groupid = $P{groupid} 


[user-roles]
select * from user_role where userid=$P{userid}

[find-role]
select * from user_role where userid=$P{userid} and role=$P{role}

[update-loginid]
update user set loginid=$P{loginid} where objid=$P{userid}

[role-permission]
select ur.role, ur.excludepermissions,  r.permissionsets, r.excludepermissions as role_excludedpermissions 
from user_role ur  inner join role r on ur.role = r.name 
where parentid=$P{objid}

[userlevel]
select userlevel from user where objid=$P{userid}

[reactivate]
update login_account set accessdate = NULL,active=1 where uid=$P{uid}

[user-role-access]
select ur.* from user_role ur inner join role r on ur.role = r.name 
where ur.userid=$P{userid} and ur.groupid = $P{groupid} and r.scope = $P{scope} 




