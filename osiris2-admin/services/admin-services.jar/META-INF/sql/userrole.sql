[list]
select * from user_role where userid=$P{userid}

[find]
select * from user_role where userid=$P{userid} and role=$P{role}

[user-access]
select ur.*, r.excludepermissions as role_excludedpermissions from user_role ur inner join role r on ur.role = r.name 
where ur.userid=$P{userid} and ur.groupid = $P{groupid} 

[permissions]
select ur.role, ur.excludepermissions,  r.permissionsets, r.excludepermissions as role_excludedpermissions 
from user_role ur  inner join role r on ur.role = r.name 
where parentid=$P{objid}