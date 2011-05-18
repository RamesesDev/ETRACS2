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
  
[activateControl]  
UPDATE afcontrol SET active = 1 WHERE objid = $P{objid} 


  
  





