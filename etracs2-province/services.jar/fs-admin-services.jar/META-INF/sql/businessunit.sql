[list]
select objid,code,name from business_unit where parentid=$P{parentid} ${filter}

[remove-group-user]
delete from business_unit_user_index where userid = $P{userid} 

[list-terminals]
select terminalid, macaddress from terminal where parentid = $P{objid} 

[list-users]
select userid, username, role, blockedterminals from business_unit_user_index where groupid = $P{objid} 

[remove-user-groups]
delete from business_unit_user_index where userid = $P{userid} 