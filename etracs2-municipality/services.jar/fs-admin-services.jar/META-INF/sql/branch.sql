[list]
select objid,code,name,country,timezone from branch where parentid=$P{parentid} ${filter}

[remove-user-branches]
delete from branch_user_index where userid = $P{userid} 


[by-code]
select * from branch where code = $P{code} 

[branch-user]
select * from branch_user_index where branchid=$P{branchid} and userid=$P{userid}

