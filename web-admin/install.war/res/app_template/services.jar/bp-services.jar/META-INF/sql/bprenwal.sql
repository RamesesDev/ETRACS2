
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

