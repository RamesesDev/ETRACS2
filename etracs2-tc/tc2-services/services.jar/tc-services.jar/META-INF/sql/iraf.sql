[getList]
SELECT o.* FROM iraf o WHERE docstate = 'DRAFT' ORDER BY o.txnno 

[getListByRivno] 
SELECT o.* FROM iraf o WHERE o.rivno LIKE $P{rivno} 

[getIrafByTxnno] 
SELECT o.* FROM iraf o 
WHERE o.txnno LIKE $P{txnno} 

[getDraftIrafByRivId] 
SELECT o.* FROM iraf o 
WHERE o.rivid = $P{rivid} 
AND o.docstate = 'DRAFT' 

[getListByRequestedBy] 
SELECT o.* FROM iraf o WHERE o.rivrequestedby LIKE $P{requestedby} 

[getNextOpenAFInventory] 
SELECT o.* FROM afinventory o 
WHERE o.afid =  $P{afid}  
AND o.docstate = 'OPEN' 
ORDER BY o.startseries,  o.stubfrom 

[checkConflictSeries] 
SELECT a.* FROM afinventory a 
WHERE a.afid = $P{afid}  
AND   (a.endseries > $P{startseries} OR a.startseries >= $P{startseries} ) 
AND   a.startseries <= $P{endseries} 
AND   a.prefix = $P{prefix} 
AND   a.suffix = $P{suffix} 

[getAFInventoryByIRAFIdOrderByStubNo] 
SELECT o.* FROM afinventory o 
WHERE o.irafid = $P{irafid} 
AND   o.afid = $P{afid} 
ORDER BY o.stubto desc 

[checkSerialInUse] 
SELECT ac.objid FROM afinventory ai 
INNER JOIN afinventorycredit aic on aic.afinventoryid = ai.objid 
INNER JOIN afcontrol ac on ac.afinventorycreditid = aic.objid 
WHERE ( ac.docstate = 'CLOSED' OR ac.active = 1 ) 
AND   ( ac.startseries >= $P{series} AND ac.endseries <= $P{series} ) 
AND   ac.currentseries > $P{series} 
AND   ai.irafid = $P{irafid} 

[getAFControlBySeries] 
SELECT ac.schemaname, ac.objid FROM afcontrol ac 
INNER JOIN afinventorycredit aic on aic.objid = ac.afinventorycreditid 
INNER JOIN afinventory ai on ai.objid = aic.afinventoryid 
WHERE   ai.irafid = $P{irafid} 
AND     ac.afid = $P{afid} 
AND   (ac.startseries <= $P{series} AND ac.endseries >= $P{series} ) 

[getAfcontrolByAfcId]
SELECT 
 objid, startseries, endseries 
FROM afcontrol 
WHERE afinventorycreditid = $P{afcid}  

[updateAFCtrl]
UPDATE afcontrol 
SET docstate='CLOSED', currentseries=$P{endseries}, 
beginseries=$P{endseries}, issuedfrom=$P{startseries}, 
issuedto=$P{endseries}, balance=0 
WHERE objid = $P{objid} 


[getAFCByIrafId]
SELECT objid, balance  
FROM afinventorycredit  
WHERE irafid = $P{irafid}  

[updateAFC] 
UPDATE afinventorycredit  
SET docstate='CLOSED', qtyissued=$P{qtyissued}, balance=0  
WHERE objid = $P{objid}  

[getCraafByAFCId]
SELECT 
 objid, receivedqty, receivedfrom, receivedto 
FROM craaf 
WHERE afinventorycreditid = $P{afcid}

[updateCraafToConsolidated]
UPDATE craaf SET 
 issuedqty = $P{receivedqty}, issuedfrom = $P{receivedfrom}, issuedto = $P{receivedto}, 
 endingqty = NULL, endingfrom = NULL, endingto = NULL 
WHERE objid = $P{objid} 
 
 