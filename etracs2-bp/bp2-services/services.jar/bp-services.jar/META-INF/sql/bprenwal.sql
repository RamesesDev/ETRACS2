
[updatebusiness]
UPDATE business  
SET docstate = 'EXPIRED'  
WHERE docstate = 'APPROVED'  
 OR docstate = 'PERMIT_PENDING'  
 OR docstate = 'ACTIVE'  
 AND yearstarted < $P{currentYr} 
 
[updatebpapplication]
UPDATE bpapplication  
SET docstate = 'EXPIRED'  
WHERE docstate = 'APPROVED'  
 OR docstate = 'PERMIT_PENDING'  
 OR docstate = 'ACTIVE'  
 AND iyear < $P{currentYr} 
 
[updatebpapplicationlisting]
UPDATE bpapplicationlisting  
SET docstate = 'EXPIRED'  
WHERE docstate = 'APPROVED'  
 OR docstate = 'PERMIT_PENDING'  
 OR docstate = 'ACTIVE'  
 AND iyear < $P{currentYr}

