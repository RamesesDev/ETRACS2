[getChartList]
SELECT a.*, '' AS parentcode, '' AS parenttitle 
FROM account a 
WHERE parentid IS NULL 
ORDER BY code 

[getList]
SELECT a.*, p.code AS parentcode, p.title AS parenttitle 
FROM account a, account p 
WHERE a.parentid = p.objid 
  AND a.parentid = $P{parentid} ORDER BY code 
  
[getById]
SELECT a.*, p.code AS parentcode, p.title AS parenttitle 
FROM account a
	LEFT JOIN account p ON a.parentid = p.objid 
WHERE a.objid = $P{objid} 
  
[getSubAccounts]  
SELECT * FROM account WHERE parentid = $P{parentid} 

[getAccountList]
SELECT objid, code, title FROM account WHERE type = 'GLACCOUNT' AND charttype = $P{charttype} 

[getAccountListByCode]
SELECT objid, code, title FROM account WHERE code = $P{code} AND type = 'GLACCOUNT' AND charttype = $P{charttype} 

[getAccountListByTitle]
SELECT objid, code, title FROM account WHERE title LIKE $P{title} AND type = 'GLACCOUNT' AND charttype = $P{charttype}    


[updateToYear]
UPDATE account SET toyear = $P{toyear} WHERE rootid = $P{rootid} 


[checkDuplicateCode]
SELECT COUNT(*) AS count FROM account 
WHERE objid <> $P{objid}
  AND code = $P{code} 
  AND parentid = $P{parentid} 
  
[checkDuplicateTitle]
SELECT COUNT(*) AS count FROM account 
WHERE objid <> $P{objid}
  AND title = $P{title} 
  AND parentid = $P{parentid} 
  
