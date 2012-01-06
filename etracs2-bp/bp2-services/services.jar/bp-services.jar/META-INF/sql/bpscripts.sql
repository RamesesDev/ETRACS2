

[updateAppFullypaid]  
UPDATE bpapplicationlisting   
SET fullypaid = 1   
WHERE businessid = $P{businessid} 

[updateStateApps]
UPDATE bpapplication   
SET docstate = 'PERMIT_PENDING'   
WHERE objid = $P{objid} 

[updateStateAppListing]
UPDATE bpapplicationlisting   
SET docstate = 'PERMIT_PENDING'   
WHERE objid = $P{objid} 

[getreceivables]
SELECT objid, receivables 
FROM bpapplication 
WHERE tradename = $P{tradename}

[updatereceivables]
UPDATE bpapplication 
SET receivables = $P{receivables} 
WHERE objid = $P{objid} 
