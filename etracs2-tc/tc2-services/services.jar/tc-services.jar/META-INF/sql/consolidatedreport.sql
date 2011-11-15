[getList]
SELECT * FROM craaf WHERE afid = $P{afid}

[getCRAAFItem]
SELECT * FROM craaf WHERE afinventoryid = $P{afinventoryid} OR afinventorycreditid = $P{afinventorycreditid} AND afid = $P{afid} 

[getAFInventoryIdStubfrom]
SELECT objid FROM afinventory 
WHERE irafid = $P{irafid} 
  AND afid = $P{afid}  
  AND stubfrom = $P{stubfrom} 
  
[getAFInventoryIdSeries]
SELECT objid FROM afinventory 
WHERE irafid = $P{irafid} 
  AND afid = $P{afid}  
  AND startseries = $P{startseries}

[getAFInventoryCredit]
SELECT * FROM afinventorycredit  
WHERE irafid = $P{irafid}  
  AND afid = $P{afid}  
  AND stubno = $P{stubno} 


[getAF]
SELECT * FROM af WHERE objid = $P{afid} 

[getStartEndSeries]
SELECT MIN(startseries) AS startseries, MAX(endseries) AS endseries    
FROM afinventorycredit     
WHERE irafid = $P{irafid} AND afid = $P{afid}     
GROUP BY afid 

[getAFControl]
SELECT * FROM afcontrol WHERE objid = $P{afcontrolid} 

[getReportDataGeneral]
SELECT collectorname, afid, beginqty, beginfrom, beginto,   
	receivedqty, receivedfrom, receivedto,   
	issuedqty, issuedfrom, issuedto,  
	endingqty, endingfrom, endingto  
FROM craaf   
WHERE collectorid IS NULL    
AND craafmonth = $P{craafmonth}    
AND craafyear = $P{craafyear}   
ORDER BY afid, beginfrom, receivedfrom 

[getReportDataCollector]
SELECT a.collectorname, c.stubno, c.afid, c.beginqty, c.beginfrom, c.beginto,   
	c.receivedqty, c.receivedfrom, c.receivedto,   
	c.issuedqty, c.issuedfrom, c.issuedto,    
	c.endingqty, c.endingfrom, c.endingto    
FROM craaf c , afcontrol a  
WHERE c.afinventorycreditid = a.afinventorycreditid  
  AND c.afinventorycreditid IS NOT NULL   
  AND craafmonth = $P{craafmonth}    
  AND craafyear = $P{craafyear}     
ORDER BY c.collectorname, c.afid, c.beginfrom, c.receivedfrom  

[getReportDataCanceledSeries]
SELECT c.collectorname, a.stubno, c.afid, c.canceledqty AS beginqty,    
	   c.canceledfrom AS beginfrom, c.canceledto AS beginto     
FROM craaf c, afcontrol a    
WHERE c.afinventorycreditid = a.afinventorycreditid    
AND craafyear = $P{craafyear}  
AND craafmonth = $P{craafmonth}   
AND canceledqty != 0  

[updateCRAAFbyIRAFCol]
UPDATE craaf SET 
	issuedqty = issuedqty + $P{qtyreceived}, 
	issuedfrom = CASE WHEN issuedfrom IS NULL THEN $P{issuedfrom} ELSE issuedfrom END , 
	issuedto = $P{issuedto}, 
	endingqty = $P{endingqty}, 
	endingfrom = $P{endingfrom}, 
	endingto = $P{endingto}    
WHERE afinventoryid = $P{afinventoryid}  
 AND afid = $P{afid}  
 AND craafyear = $P{year}  
 AND craafmonth = $P{month} 

 
[updateCRAAFbyRemittance] 
UPDATE craaf SET 
	issuedqty = $P{issuedqty}, 
	issuedfrom = $P{issuedfrom}, 
	issuedto = $P{issuedto}, 
	endingqty = $P{endingqty}, 
	endingfrom = $P{endingfrom}, 
	endingto = $P{endingto}  
WHERE objid = $P{objid} 
 
[getAFInventoryQtyHandById]
SELECT 
 qtyonhand 
 FROM afinventory  
WHERE objid = $P{objid}  





[getCraaf]
SELECT  
 *   
FROM craaf  
WHERE craafyear = $P{year}   
 AND craafmonth = $P{month} 

[getAFInventoryStateOpen]
SELECT  
 *  
 FROM afinventory  
WHERE docstate = 'OPEN' 

[getAFInventoryStateClosed]
SELECT i.* FROM afinventory i  
INNER JOIN afinventorycredit c ON c.afinventoryid = i.objid  
WHERE i.docstate = 'CLOSED' 
 AND c.docstate = 'OPEN' 
 
[getAfICreditByParentIdOpen]  
SELECT  
 * 
FROM afinventorycredit   
WHERE afinventoryid = $P{afinventoryid}  
 AND docstate = 'OPEN' 
 
[getAFCtrlStateApproved]
SELECT 
 * 
FROM afcontrol 
WHERE afinventorycreditid = $P{afinventorycreditid}  
 and docstate = 'APPROVED'  
 
[getCraafByAFCId]
SELECT afinventorycreditid FROM craaf 
WHERE afinventorycreditid = $P{afinventorycreditid} 
 AND craafyear = $P{year}  
 AND craafmonth = $P{month} 
