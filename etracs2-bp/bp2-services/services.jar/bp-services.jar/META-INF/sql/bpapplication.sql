[getList] 
SELECT 
	o.objid, 
	o.txnno, 
	o.tradename, 
	o.businessaddress, 
	o.docstate 
FROM bpapplication o ORDER BY o.txnno 

[getBusinessForRENEW] 
SELECT b.objid, bpa.txnno, b.yearstated, bpa.info FROM business b 
INNER JOIN bpapplication bpa on bpa.businessid = b.objid 
WHERE b.taxpayerid = $P{taxpayerid} 
AND   b.docstate = 'EXPIRED' 

[getBusinessForRETIRE] 
SELECT b.objid, bpa.txnno, b.yearstated, bpa.info FROM business b 
INNER JOIN bpapplication bpa on bpa.businessid = b.objid 
WHERE b.taxpayerid = $P{taxpayerid} 
AND   b.docstate IN 'ACTIVE|EXPIRED' 

[getBusinessForRETIRELINE] 
SELECT b.objid, bpa.txnno, b.yearstated, bpa.info FROM business b 
INNER JOIN bpapplication bpa on bpa.businessid = b.objid 
WHERE b.taxpayerid = $P{taxpayerid} 
AND   b.docstate IN 'ACTIVE|EXPIRED'

[getBusinessForADDLOB] 
SELECT b.objid, bpa.txnno, b.yearstated, bpa.info FROM business b 
INNER JOIN bpapplication bpa on bpa.businessid = b.objid 
WHERE b.taxpayerid = $P{taxpayerid} 
AND   b.docstate = 'ACTIVE' 

[getApplicationByBusinessId] 
SELECT bpa.* FROM business b  
INNER JOIN bpapplication bpa on bpa.objid = b.applicationid 
WHERE b.objid = $P{objid} 

[getApplicationByParentId] 
SELECT bpa.* FROM bpapplication bpa 
WHERE bpa.parentid = $P{parentid} 

[deleteReferenceApplication] 
DELETE FROM bpapplication 
WHERE parentid = $P{parentid}  