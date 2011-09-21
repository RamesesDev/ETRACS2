
[updatebusiness]
UPDATE business  
SET docstate = 'EXPIRED'  
WHERE docstate IN ('APPROVED', 'PERMIT_PENDING', 'ACTIVE') 
 AND yearstarted < $P{currentYr}
 
[updatebpapplication]
UPDATE bpapplication  
SET docstate = 'EXPIRED'  
WHERE docstate IN ('APPROVED', 'PERMIT_PENDING', 'ACTIVE') 
 AND iyear < $P{currentYr} 
 
[updatebpapplicationlisting]
UPDATE bpapplicationlisting  
SET docstate = 'EXPIRED' 
WHERE docstate IN ('APPROVED', 'PERMIT_PENDING', 'ACTIVE') 
 AND iyear < $P{currentYr}

