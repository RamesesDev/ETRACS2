

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

[getApplications]
SELECT objid, businessid 
FROM bpapplication 
WHERE ( assessments = '[]' OR assessments IS NULL  ) 
 AND docstate IN ( 'APPROVED', 'PERMIT_PENDING', 'ACTIVE', 'RENEWED', 'EXPIRED', 'CLOSED' ) 

[updateAppAssessment]
UPDATE bpapplication 
SET assessments = $P{assessments} 
WHERE objid = $P{objid} 

[getBTReceipts]
SELECT 
 objid, items, info, extended, voided       
FROM receipt 
WHERE doctype = 'BUSINESS_TAX' 
 AND objid NOT IN ( SELECT receiptid FROM bppayment ) 

