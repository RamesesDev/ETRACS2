

[getCraafDuplicateByBFromBto]
SELECT    
 afinventorycreditid AS aficreditid, 
 craafmonth, craafyear, 
 beginfrom, beginto 
FROM craaf  
GROUP BY  craafmonth, craafyear, beginfrom, beginto 
HAVING COUNT(beginfrom) > 1  
 AND COUNT(beginto) > 1 
ORDER BY craafmonth, craafyear 

[getCraafByMonthYearBFromBto] 
SELECT 
 objid, afinventorycreditid AS aficreditid,
 craafmonth, craafyear,
 beginqty, beginfrom, beginto,
 receivedqty, receivedfrom, receivedto,
 issuedqty, issuedfrom, issuedto 
FROM craaf  
WHERE  afinventorycreditid = $P{aficreditid}  
 AND craafmonth = $P{craafmonth}  
 AND craafyear = $P{craafyear}  
 AND beginfrom = $P{beginfrom}  
 AND beginto = $P{beginto} 


[getCraafDuplicateByBto]
SELECT    
 afinventorycreditid AS aficreditid, 
 craafmonth, craafyear, beginto 
FROM craaf  
GROUP BY  craafmonth, craafyear, beginto 
HAVING COUNT(beginto) > 1 
ORDER BY craafmonth, craafyear 

[getCraafByMonthYearBto] 
SELECT 
 objid, afinventorycreditid AS aficreditid, 
 craafmonth, craafyear, 
 beginqty, beginfrom, beginto,  
 receivedqty, receivedfrom, receivedto,  
 issuedqty, issuedfrom, issuedto   
FROM craaf    
WHERE afinventorycreditid = $P{aficreditid}  
 AND craafmonth = $P{craafmonth}    
 AND craafyear = $P{craafyear}   
 AND beginto = $P{beginto}   
 


[deleteDuplicateCraaf]
DELETE FROM craaf    
WHERE objid = $P{objid} 


[getConsolatedWrongEntry]
SELECT 
 * FROM craaf 
 WHERE beginqty IS NULL 
  AND issuedfrom != receivedfrom

 
[updateConsolatedWrongEntry]
UPDATE craaf  
SET issuedfrom = $P{issuedfrom}  
WHERE objid = $P{objid} 

[getCraafEndingNoBIR]
SELECT 
 objid 
FROM craaf  
WHERE ( beginqty IS NULL OR beginqty = 0 )  
 AND beginfrom IS NULL 
 AND beginto IS NULL 
 AND ( receivedqty IS NULL OR receivedqty = 0 ) 
 AND receivedfrom IS NULL 
 AND receivedto IS NULL 
 AND ( issuedqty IS NULL OR issuedqty = 0 ) 
 AND issuedfrom IS NULL 
 AND issuedto IS NULL 
 AND ( endingqty IS NOT NULL OR endingqty = 0 ) 
 AND endingfrom IS NOT NULL 
 AND endingto IS NOT NULL 
 
[getNoEndingBalByBgnQty]
SELECT 
 objid, beginqty, beginfrom, beginto,
 receivedqty, receivedfrom, receivedto,
 issuedqty, issuedfrom, issuedto,
 endingqty, endingfrom, endingto 
FROM craaf 
WHERE ( beginqty IS NOT NULL AND ( issuedqty IS NULL OR issuedqty = 0 ) ) 
 AND ( ( endingqty IS NULL OR endingqty = 0 ) 
 AND endingfrom IS NULL  
 AND endingto IS NULL )
 
[getNoEndingBalByRrcvQty] 
SELECT 
 objid, beginqty, beginfrom, beginto,
 receivedqty, receivedfrom, receivedto,
 issuedqty, issuedfrom, issuedto,
 endingqty, endingfrom, endingto 
FROM craaf 
WHERE ( receivedqty IS NOT NULL AND ( issuedqty IS NULL OR issuedqty = 0 ) ) 
 AND ( ( endingqty IS NULL OR endingqty = 0 ) 
 AND endingfrom IS NULL 
 AND endingto IS NULL ) 
 
[updateEndingBal]
UPDATE craaf 
SET endingqty = $P{endingqty}, 
 endingfrom = $P{endingfrom}, 
 endingto = $P{endingto}  
WHERE objid = $P{objid} 

[getFirstCraafRec]  
SELECT 
 craafmonth, craafyear 
FROM craaf 
ORDER BY craafyear ASC, craafmonth ASC 

[getFirstCraafRecByAfinventoryid]
SELECT 
 craafmonth, craafyear 
FROM craaf 
WHERE afinventoryid = $P{afinventoryid}
ORDER BY craafyear ASC, craafmonth ASC 

[getCraafByAfinventoryid]
SELECT  
 objid 
FROM craaf 
WHERE afinventoryid = $P{afinventoryid} 
 AND craafmonth = $P{craafmonth} 
 AND craafyear = $P{craafyear}
 
[updateStubno]
UPDATE craaf c SET c.stubno = ( 
 SELECT a.stubno FROM afcontrol a WHERE a.afinventorycreditid = c.afinventorycreditid ) 
WHERE c.stubno IS NULL 
 AND c.afinventorycreditid IS NOT NULL 

[getBFromBToBlank]
SELECT 
 * 
FROM craaf 
WHERE beginqty = 0 
 AND beginfrom IS NOT NULL 
 AND beginto IS NOT NULL 
 
[resolveBFromBToBlank]
UPDATE craaf 
SET beginqty = $P{beginqty}, 
 beginfrom = $P{beginfrom}, 
 beginto = $P{beginto} 
WHERE objid = $P{objid} 


[getAFCByBRGYUser]
SELECT  
 afc.objid, afc.balance AS qtyissued 
FROM iraf irf   
INNER JOIN afinventorycredit afc ON afc.irafid = irf.objid 
WHERE irf.rivrequestedby LIKE '%BRGY%' 

[updateAFC] 
UPDATE afinventorycredit  
SET docstate='CLOSED', qtyissued=$P{qtyissued}, balance=0  
WHERE objid = $P{objid}  

[getAfcontrolByAfcId]
SELECT 
 objid, startseries, endseries, balance  
FROM afcontrol 
WHERE afinventorycreditid = $P{objid}  

[updateAFCtrl] 
UPDATE afcontrol  
SET docstate='CLOSED', currentseries=$P{endseries},  
beginseries=$P{endseries}, qtyissued=$P{balance}, 
issuedfrom=$P{startseries}, issuedto=$P{endseries}, balance=0 
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




 