[getList] 
SELECT 
	o.objid, 
	o.txnno, 
	o.tradename, 
	o.businessaddress, 
	o.docstate 
FROM bpapplication o ORDER BY o.txnno 

[getBusinessForRENEW] 
SELECT b.iyear, bpa.info FROM business b 
INNER JOIN bpapplication bpa on bpa.businessid = b.objid 
WHERE b.taxpayerid = $P{taxpayerid} 
AND   bpa.docstate = 'EXPIRED' 

[getBusinessForRETIRE] 
SELECT b.iyear, bpa.info FROM business b 
INNER JOIN bpapplication bpa on bpa.businessid = b.objid 
WHERE b.taxpayerid = $P{taxpayerid} 
AND   bpa.docstate IN 'ACTIVE|EXPIRED' 

[getBusinessForRETIRELINE] 
SELECT b.iyear, bpa.info FROM business b 
INNER JOIN bpapplication bpa on bpa.businessid = b.objid 
WHERE b.taxpayerid = $P{taxpayerid} 
AND   bpa.docstate IN 'ACTIVE|EXPIRED'

[getBusinessForADDLINE] 
SELECT b.iyear, bpa.info FROM business b 
INNER JOIN bpapplication bpa on bpa.businessid = b.objid 
WHERE b.taxpayerid = $P{taxpayerid} 
AND   bpa.docstate = 'ACTIVE' 