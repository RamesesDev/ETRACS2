
[updatebpapplicationStatExpired]
UPDATE bpapplication  
SET docstate = 'EXPIRED'  
WHERE docstate IN ('APPROVED', 'PERMIT_PENDING', 'ACTIVE') 
 AND iyear < $P{currentYr} 
 
[updatebpapplicationlistingStatExpired]
UPDATE bpapplicationlisting  
SET docstate = 'EXPIRED' 
WHERE docstate IN ('APPROVED', 'PERMIT_PENDING', 'ACTIVE') 
 AND iyear < $P{currentYr}

[updatebpapplicationStatExpiredById]
UPDATE bpapplication  
SET docstate = 'EXPIRED'  
WHERE objid = $P{objid}  
  
[updatebpapplicationlistingStatExpiredById]
UPDATE bpapplicationlisting  
SET docstate = 'EXPIRED' 
WHERE objid = $P{objid} 
 