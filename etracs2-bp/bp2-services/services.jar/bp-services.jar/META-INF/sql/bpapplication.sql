[getList] 
SELECT 
	o.objid, 
	o.txnno, 
	o.tradename, 
	o.businessaddress, 
	o.docstate 
FROM bpapplication o 
WHERE o.docstate IN ('DRAFT','FOR_REVIEW') 
ORDER BY o.txnno 

[getBusinessForRENEW] 
SELECT b.objid, b.tradename, b.businessaddress, bpa.info FROM business b 
INNER JOIN bpapplication bpa ON bpa.businessid = b.objid 
WHERE b.taxpayerid = $P{taxpayerid} 
AND   b.docstate = 'EXPIRED' 

[getBusinessForRETIRE] 
SELECT b.objid, bpa.txnno, b.yearstated, bpa.info FROM business b 
INNER JOIN bpapplication bpa ON bpa.businessid = b.objid 
WHERE b.taxpayerid = $P{taxpayerid} 
AND   b.docstate NOT IN ('RETIRE') 

[getBusinessForRETIRELINE] 
SELECT b.objid, bpa.txnno, b.yearstated, bpa.info FROM business b 
INNER JOIN bpapplication bpa ON bpa.businessid = b.objid 
WHERE b.taxpayerid = $P{taxpayerid} 

[getBusinessForADDLOB] 
SELECT b.objid, b.tradename, b.businessaddress FROM business b 
WHERE b.taxpayerid = $P{taxpayerid} 
AND   b.docstate = 'ACTIVE' 

[getApplicationByBusinessId] 
SELECT bpa.* FROM business b  
INNER JOIN bpapplication bpa ON bpa.objid = b.applicationid 
WHERE b.objid = $P{objid} 

[getApplicationByParentId] 
SELECT bpa.* FROM bpapplication bpa 
WHERE bpa.parentid = $P{parentid} 

[deleteReferenceApplication] 
DELETE FROM bpapplication 
WHERE parentid = $P{parentid}  


[updateApplicationForActive] 
UPDATE bpapplication  
SET docstate = 'ACTIVE' 
WHERE objid = $P{objid} 

[updatePermitForActive] 
UPDATE bppermit 
SET docstate = 'ACTIVE' 
WHERE applicationid = $P{applicationid} 