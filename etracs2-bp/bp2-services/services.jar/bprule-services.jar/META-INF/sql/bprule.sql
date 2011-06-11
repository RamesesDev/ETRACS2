[getIncomeAccountById]
SELECT * FROM incomeaccount WHERE objid = $P{objid}

[getVarInfo]
SELECT 
	objid, 
	name AS varname, 
	datatype AS vartype, 
	caption AS varcaption 
FROM variable 
WHERE objid = $P{objid} 