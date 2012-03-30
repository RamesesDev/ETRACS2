[getList]
SELECT 
	objid, opener, docstate, afid, collectorname, encodedby, amount, 
	startseries, series-1 AS endseries 
FROM batchcapture  
ORDER BY defaulttxndate DESC 


[getListByState]
SELECT 
	objid, opener, docstate, afid, collectorname, encodedby, amount, 
	startseries, series-1 AS endseries 
FROM batchcapture  
WHERE docstate LIKE $P{docstate}  
ORDER BY defaulttxndate DESC 

[getListByCollector]
SELECT 
	objid, opener, docstate, afid, collectorname, encodedby, amount, 
	startseries, series-1 AS endseries 
FROM batchcapture  
WHERE collectorname LIKE $P{collectorname}  
ORDER BY defaulttxndate DESC 

[getListByEncoder]
SELECT 
	objid, opener, docstate, afid, collectorname, encodedby, amount, 
	startseries, series-1 AS endseries 
FROM batchcapture  
WHERE encodedby LIKE $P{encodedby}  
ORDER BY defaulttxndate DESC 


[getState]
SELECT docstate FROM batchcapture WHERE objid = $P{objid} 

