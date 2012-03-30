[getIncomeAccountById]
SELECT * FROM incomeaccount WHERE objid = $P{objid}

[getVarInfo]
SELECT 
	objid, 
	name AS varname, 
	datatype AS vartype, 
	caption AS varcaption , 
	arrayvalues AS arrayvalues 
FROM variable 
WHERE objid = $P{objid} 


[getSystemVarList]
SELECT 
	objid, 
	name AS varname, 
	datatype AS vartype, 
	caption AS varcaption , 
	arrayvalues AS arrayvalues 
FROM variable 
WHERE name IN ('CURRENT_YEAR','CURRENT_QTR', 'NO_LOBS')