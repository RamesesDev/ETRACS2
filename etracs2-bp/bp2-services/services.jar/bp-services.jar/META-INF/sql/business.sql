[getList]
SELECT * FROM business 
WHERE docstate IN ( 'ACTIVE', 'FOR_RELEASE' ) 
ORDER BY tradename

[getListByTradename]
SELECT * FROM business 
WHERE tradename LIKE CONCAT( $P{tradename}, '%' ) 
AND docstate = 'ACTIVE' 
ORDER BY tradename, taxpayername

[getListByOwnername]
SELECT * FROM business 
WHERE taxpayername LIKE CONCAT( $P{taxpayername}, '%' ) 
AND docstate = 'ACTIVE' 
ORDER BY tradename, taxpayername

[getListByTaxpayerid]
SELECT b.*  
FROM business b  
	INNER JOIN bpapplicationlisting bl ON b.applicationid = bl.objid   
WHERE b.taxpayerid = $P{taxpayerid} 
  AND b.docstate = 'ACTIVE'  
  AND bl.barangayid LIKE $P{barangayid}  
ORDER BY b.tradename, b.taxpayername 

[getApplicationsByBusinessId] 
SELECT * FROM bpapplication 
WHERE businessid = $P{businessid} 
AND docstate IN ( 'APPROVED', 'ACTIVE', 'PERMIT_PENDING', 'EXPIRED' ) 
ORDER BY txnno 

[getApplicationListByBusinessId] 
SELECT b.* FROM bpapplication b 
INNER JOIN bpapplicationlisting l ON l.objid = b.objid 
WHERE b.businessid = $P{businessid} 
ORDER BY b.txnno DESC 

[updateAppFullypaid]
UPDATE bpapplicationlisting 
SET fullypaid = 1 
WHERE businessid = $P{businessid} 

