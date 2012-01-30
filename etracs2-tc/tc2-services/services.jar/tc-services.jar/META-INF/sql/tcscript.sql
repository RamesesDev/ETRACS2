
[getCraafDuplicate]
SELECT   
 afinventorycreditid as aficreditid 
FROM craaf   
WHERE craafmonth = $P{craafmonth} AND craafyear = $P{craafyear}  
GROUP BY  beginfrom, beginto , afinventorycreditid 
HAVING COUNT(beginfrom) > 1 AND COUNT(beginto) > 1  

[getCraafDuplicate_I]
SELECT   
 afinventorycreditid as aficreditid 
FROM craaf   
WHERE craafmonth = $P{craafmonth} AND craafyear = $P{craafyear}  
GROUP BY beginto  
HAVING COUNT(beginto) > 1


[getCraafByCreditId]
SELECT 
 * 
FROM craaf 
WHERE craafmonth = $P{craafmonth} 
 AND craafyear = $P{craafyear}  
 AND afinventorycreditid = $P{aficreditid}  
 
 
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
 AND craafmonth = $P{craafmonth}  
 AND craafyear = $P{craafyear}  
  
