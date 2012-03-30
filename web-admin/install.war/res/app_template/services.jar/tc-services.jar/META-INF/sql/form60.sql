[getForm60Setup]
SELECT * FROM form60setup 
WHERE objid = $P{objid} 

[insertSetup]
INSERT INTO form60setup( objid, items )
VALUES( $P{objid}, $P{items} )

[updateSetup]
UPDATE form60setup SET items = $P{items} WHERE objid = $P{objid} 


[getAccountList]
SELECT ia.objid AS acctid, ia.accttitle, ia.acctcode, ia.fundname 
FROM incomeaccount ia
 LEFT JOIN form60account f ON ia.objid = f.acctid  
WHERE ia.docstate = 'APPROVED' 	
  AND f.objid IS NULL  
ORDER BY ia.accttitle    

[getAccountListByTitle]
SELECT ia.objid AS acctid, ia.accttitle, ia.acctcode, ia.fundname 
FROM incomeaccount ia 
	LEFT JOIN form60account f ON ia.objid = f.acctid 
WHERE ia.docstate = 'APPROVED' 	 
  AND ia.accttitle LIKE $P{accttitle}  
  AND f.objid IS NULL 
ORDER BY ia.accttitle     


[getAccountsByParentId]
SELECT * FROM form60account WHERE parentid = $P{parentid}


[insertAccount]
INSERT INTO form60account 
	( objid, parentid, acctid, accttitle )
VALUES 
	( $P{objid}, $P{parentid}, $P{acctid}, $P{accttitle} )
	
	
[removeAccount]	
DELETE FROM form60account WHERE acctid = $P{acctid} 

[removeAccountByParentId]
DELETE FROM form60account WHERE parentid = $P{parentid} 


[getDepositedSummary]
SELECT  
	fa.parentid,  
	SUM(rev.amount) AS total  
FROM revenue rev 
	INNER JOIN form60account fa ON rev.acctid = fa.acctid 
WHERE rev.deposittimestamp LIKE $P{timestamp} 
  AND rev.voided = 0 
  AND rev.docstate = 'DEPOSITED' 
GROUP BY fa.parentid 