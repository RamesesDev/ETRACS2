

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
  
