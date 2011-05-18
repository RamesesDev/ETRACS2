[getList]
SELECT o.* FROM iraf o ORDER BY o.txnno 

[getListByRivno] 
SELECT o.* FROM iraf o WHERE o.rivno = $P{rivno} 

[getIrafByTxnno] 
SELECT o.* FROM iraf o 
WHERE o.txnno = $P{txnno} 

[getDraftIrafByRivId] 
SELECT o.* FROM iraf o 
WHERE o.rivid = $P{rivid} 
AND o.docstate = 'DRAFT' 

[getListByRequestedBy] 
SELECT o.* FROM iraf o WHERE o.rivrequestedby = $P{requestedby} 

[getNextOpenAFInventory] 
SELECT o.* FROM afinventory o 
WHERE o.afid =  $P{afid}  
AND o.docstate = 'OPEN' 
ORDER BY o.startserialno 

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
ORDER BY o.stubto desc 