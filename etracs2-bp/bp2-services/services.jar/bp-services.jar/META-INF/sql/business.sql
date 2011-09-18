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
SELECT * FROM business 
WHERE taxpayerid = $P{taxpayerid} 
AND docstate = 'ACTIVE' 
ORDER BY tradename, taxpayername

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

