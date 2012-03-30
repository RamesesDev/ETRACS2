[list]
select * from terminal where parentid = $P{parentid}

[list-all]
select * from terminal 

[find-macaddress]
select * from terminal where macaddress = $P{macaddress}

[find-terminal]
select * from terminal where terminalid = $P{terminalid}

[remove-block-terminal]
delete from blocked_terminal where userid = $P{userid} 

[find-clientid]
select * from terminal where parentcode=$P{clientcode} and terminalid=$P{terminal}

[unregister-terminal]
update terminal set macaddress=null,dtregistered=null,registeredby=null  where terminalid=$P{terminalid}