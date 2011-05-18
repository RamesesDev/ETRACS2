[getChartList]
SELECT a.*, '' AS parentcode, '' AS parenttitle 
FROM account a 
WHERE parentid IS NULL 
ORDER BY acctcode 

[getList]
SELECT a.*, p.acctcode AS parentcode, p.accttitle AS parenttitle 
FROM account a, account p 
WHERE a.parentid = p.objid 
  AND a.parentid = $P{parentid} ORDER BY acctcode 
  
[getById]
SELECT a.*, p.acctcode AS parentcode, p.accttitle AS parenttitle 
FROM account a
	LEFT JOIN account p ON a.parentid = p.objid 
WHERE a.objid = $P{objid} 
  
[getSubAccounts]  
SELECT * FROM account WHERE parentid = $P{parentid} 

[getAccountList]
SELECT objid, acctcode, accttitle FROM account WHERE accttype = 'GLACCOUNT' AND charttype = $P{charttype} 

[getAccountListByCode]
SELECT objid, acctcode, accttitle FROM account WHERE acctcode = $P{acctcode} AND accttype = 'GLACCOUNT' AND charttype = $P{charttype} 

[getAccountListByTitle]
SELECT objid, acctcode, accttitle FROM account WHERE accttitle LIKE $P{accttitle} AND accttype = 'GLACCOUNT' AND charttype = $P{charttype}    

[getSubAccountList]
SELECT objid, acctcode, accttitle FROM account WHERE accttype = 'SUBACCOUNT' AND charttype = $P{charttype} AND parentid = $P{parentid}

[getSubAccountListByCode]
SELECT objid, acctcode, accttitle FROM account WHERE acctcode = $P{acctcode} AND accttype = 'SUBACCOUNT' AND charttype = $P{charttype} AND parentid = $P{parentid}

[getSubAccountListByTitle]
SELECT objid, acctcode, accttitle FROM account WHERE accttitle LIKE $P{accttitle} AND accttype = 'SUBACCOUNT' AND charttype = $P{charttype} AND parentid = $P{parentid}


[getPathByIds]
 SELECT d.objid AS parent3, c.objid AS parent2, b.objid AS parent1, a.objid AS parent
 FROM account a
	LEFT JOIN account b ON b.objid = a.parentid 
	LEFT JOIN account c ON c.objid = b.parentid
	LEFT JOIN account d ON d.objid = c.parentid
 WHERE a.objid = $P{parentid}

[getPathByTitle]
 SELECT d.accttitle AS parent3, c.accttitle AS parent2, b.accttitle AS parent1, a.accttitle AS parent
 FROM account a
	LEFT JOIN account b ON b.objid = a.parentid 
	LEFT JOIN account c ON c.objid = b.parentid
	LEFT JOIN account d ON d.objid = c.parentid
 WHERE a.objid = $P{parentid}


[updateToYear]
UPDATE account SET toyear = $P{toyear} WHERE rootid = $P{rootid} 


[checkDuplicateCode]
SELECT COUNT(*) AS count FROM account 
WHERE objid <> $P{objid}
  AND acctcode = $P{code} 
  AND parentid = $P{parentid} 
  
[checkDuplicateTitle]
SELECT COUNT(*) AS count FROM account 
WHERE objid <> $P{objid}
  AND accttitle = $P{title} 
  AND parentid = $P{parentid} 
  
[checkReferencedId]
SELECT COUNT(*) AS count FROM account a, incomeaccount i WHERE i.ngasid = $P{objid} OR i.sreid = $P{objid}
  
