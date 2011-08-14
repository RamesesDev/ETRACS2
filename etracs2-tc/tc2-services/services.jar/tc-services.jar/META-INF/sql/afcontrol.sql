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

[getAFList]
 SELECT objid, aftype FROM af WHERE docstate = 'APPROVED' ORDER BY objid 
 
[getOpenAFControlList]
SELECT * FROM AFControl 
WHERE collectorid = $P{collectorid} 
  AND afid LIKE $P{afid} 
  AND docstate = 'APPROVED' 
  AND balance > 0 
ORDER BY afid   
 
 
[activateControl]  
UPDATE afcontrol SET active = 1 WHERE objid = $P{objid} 

[changeMode]
UPDATE afcontrol SET 
	mode = $P{newmode}, active = 0 
WHERE objid = $P{objid}  


  
  






  