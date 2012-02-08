

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

  
