[getActiveByCollectorId]
SELECT * FROM afcontrol 
WHERE collectorid = $P{collectorid} 
  AND afid = $P{afid} 
  AND docstate = 'APPROVED' 
  AND mode = $P{mode} 
  AND active = 1 
  AND balance > 0 

[getAllInactiveList]
SELECT * FROM afcontrol 
WHERE collectorid = $P{collectorid} 
  AND docstate = 'APPROVED' 
  AND active = 0 
  AND balance > 0 
ORDER BY dtissued, afid, stubno   

[getInactiveList]
SELECT * FROM afcontrol 
WHERE collectorid = $P{collectorid} 
  AND afid = $P{afid} 
  AND docstate = 'APPROVED' 
  AND mode = $P{mode} 
  AND active = 0 
  AND balance > 0 
ORDER BY dtissued, stubno   

[getInactiveSerialCaptureList]
SELECT * FROM afcontrol 
WHERE collectorid = $P{collectorid} 
  AND docstate = 'APPROVED' 
  AND mode = 'CAPTURE' 
  AND aftype = 'serial' 
  AND balance > 0 
ORDER BY afid, startseries 

[getAFList]
 SELECT objid, aftype, serieslength FROM af WHERE docstate = 'APPROVED' ORDER BY objid 
 
[getOpenAFControlList]
SELECT * FROM afcontrol 
WHERE collectorid = $P{collectorid} 
  AND afid LIKE $P{afid} 
  AND balance > 0 
ORDER BY afid   
 
 
[activateControl]  
UPDATE afcontrol SET active = 1 WHERE objid = $P{objid} 

[changeMode]
UPDATE afcontrol SET 
	mode = $P{newmode}, active = 0 
WHERE objid = $P{objid}  

[getCraafByCreditId]
SELECT * FROM craaf WHERE afinventorycreditid = $P{afinventorycreditid} 

[updateCraafToTransferById]
UPDATE craaf 
SET collectorid = $P{collectorid}, collectorname = $P{collectorname}, collectortitle = $P{collectortitle} 
WHERE objid = $P{objid} 
  
[updateTransferredCreditState]  
UPDATE afinventorycredit SET docstate = 'TRANSFERRED' WHERE objid = $P{objid}

[checkOverlapSeries]
SELECT stubno FROM afcontrol 
WHERE objid <> $P{objid} 
  AND afid = $P{afid}
  AND $P{startseries} BETWEEN startseries AND endseries 


[adjustInventoryCreditBalance]
UPDATE afinventorycredit SET  
	balance = balance + $P{qtyadjustment}  
WHERE objid = $P{objid} 

[adjustCraafInventoryCreditQty]
UPDATE craaf SET  
	receivedqty = receivedqty + $P{qtyadjustment}, 
	endingqty = endingqty + $P{qtyadjustment} 
WHERE afinventorycreditid = $P{afinventorycreditid} 

[adjustCraafInventoryQty]
UPDATE craaf c, afinventorycredit cr SET  
	c.receivedqty = c.receivedqty + $P{qtyadjustment},  
	c.endingqty = c.endingqty + $P{qtyadjustment}  
WHERE c.afinventoryid = cr.afinventoryid  
  AND cr.objid = $P{afinventorycreditid}  
  