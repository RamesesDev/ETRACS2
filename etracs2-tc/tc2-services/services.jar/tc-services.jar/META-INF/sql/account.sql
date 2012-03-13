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
SELECT a.objid, a.acctcode, a.accttitle, p.accttitle AS parentaccttitle 
FROM account a 
	LEFT JOIN account p ON a.parentid = p.objid 
WHERE a.accttype = 'GLACCOUNT' 
AND a.charttype = $P{charttype} 

[getAccountListByCode]
SELECT a.objid, a.acctcode, a.accttitle, p.accttitle AS parentaccttitle 
FROM account a 
	LEFT JOIN account p ON a.parentid = p.objid 
WHERE a.accttype = 'GLACCOUNT'
  AND a.acctcode = $P{acctcode} 
  AND a.charttype = $P{charttype} 


[getAccountListByTitle]
SELECT a.objid, a.acctcode, a.accttitle, p.accttitle AS parentaccttitle 
FROM account a 
	LEFT JOIN account p ON a.parentid = p.objid 
WHERE a.accttype = 'GLACCOUNT'
  AND a.accttitle LIKE $P{accttitle} 
  AND a.charttype = $P{charttype} 
  

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
 SELECT CONCAT(d.acctcode, '-', d.accttitle) AS parent3, 
        CONCAT(c.acctcode, '-', c.accttitle) AS parent2, 
        CONCAT(b.acctcode, '-', b.accttitle) AS parent1, 
        CONCAT(a.acctcode, '-', a.accttitle) AS parent
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
  
[getReportData]
SELECT acctcode, accttitle, accttype  
FROM account a  
WHERE a.charttype = $P{charttype}  
AND a.acctlevel != 0  
ORDER BY acctlevel
