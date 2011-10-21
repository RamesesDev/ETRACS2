

[updateAppFullypaid]  
UPDATE bpapplicationlisting   
SET fullypaid = 1   
WHERE businessid = $P{businessid} 


[updateStateApps]
UPDATE bpapplication   
SET docstate = 'PERMIT_PENDING1'   
WHERE objid = $P{objid} 


[updateStateAppListing]
UPDATE bpapplicationlisting   
SET docstate = 'PERMIT_PENDING1'   
WHERE objid = $P{objid} 
