[getList]
SELECT a.txnno, b.* FROM business b  
INNER JOIN bpapplication a ON a.businessid = b.objid 
WHERE b.docstate IN ( 'ACTIVE', 'FOR_RELEASE' ) 
ORDER BY b.tradename 

[getListByTradename]
SELECT a.txnno, b.* FROM business b 
INNER JOIN bpapplication a ON a.businessid = b.objid 
WHERE b.tradename LIKE CONCAT( $P{tradename}, '%' ) 
AND b.docstate = 'ACTIVE' 
ORDER BY b.tradename, b.taxpayername

[getListByOwnername]
SELECT a.txnno, b.* FROM business b 
INNER JOIN bpapplication a ON a.businessid = b.objid 
WHERE b.taxpayername LIKE CONCAT( $P{taxpayername}, '%' ) 
AND b.docstate = 'ACTIVE' 
ORDER BY b.tradename, b.taxpayername

[getListByTaxpayerid]
SELECT b.*  
FROM business b  
	INNER JOIN bpapplicationlisting bl ON b.applicationid = bl.objid   
WHERE b.taxpayerid = $P{taxpayerid}  
  AND b.tradename = $P{tradename} 
  AND b.docstate in ('ACTIVE', 'EXPIRED') 
  AND bl.barangayid LIKE $P{barangayid}   
ORDER BY b.tradename, b.taxpayername 

[getBusinessByTaxpayerIdTrade]
SELECT b.*  
FROM business b  
	INNER JOIN bpapplicationlisting bl ON b.applicationid = bl.objid   
WHERE b.taxpayerid = $P{taxpayerid}  
  AND b.tradename = $P{tradename}   
  AND bl.barangayid LIKE $P{barangayid} 
  AND b.docstate in ('ACTIVE', 'EXPIRED')      
ORDER BY b.tradename, b.taxpayername 

[getApplicationsByBusinessId]  
SELECT * FROM bpapplication 
WHERE businessid = $P{businessid} 
AND docstate IN ( 'APPROVED', 'ACTIVE', 'PERMIT_PENDING', 'EXPIRED' ) 
ORDER BY txnno 

[getApplicationsByBusinessIdNotActive]
SELECT * FROM bpapplication 
WHERE businessid = $P{businessid} 
AND docstate NOT IN ( 'APPROVED', 'ACTIVE', 'PERMIT_PENDING', 'EXPIRED', 'RENEWED' ) 
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

[updateAppListStatToRenewed] 
UPDATE bpapplicationlisting 
SET docstate = 'RENEWED' 
WHERE businessid = $P{businessid} 

[getBPApplicationById]
SELECT 
 * 
FROM bpapplication  
WHERE objid = $P{objid} 


