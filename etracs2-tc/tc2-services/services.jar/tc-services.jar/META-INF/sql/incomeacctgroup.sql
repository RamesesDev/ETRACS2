[getList]
SELECT * FROM incomeaccountgroup 

[getReference]
SELECT accttitle FROM incomeaccount 
WHERE objid = $P{groupid} 
