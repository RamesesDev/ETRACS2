/* Change Tradename Transaction */

[getChangeTradenameList]
SELECT * FROM changetradenamelist 
ORDER BY txnno

[submitChangeTradenameList]
UPDATE changetradenamelist 
SET docstate = 'SUBMITTED' 
WHERE objid = $P{objid}

[approvedChangeTradenameList]
UPDATE changetradenamelist 
SET docstate = 'APPROVED' 
WHERE objid = $P{objid}

[rejectChangeTradenameList]
UPDATE changetradenamelist 
SET docstate = 'REJECTED' 
WHERE objid = $P{objid}

[updateBusinessTradename]
UPDATE business 
SET tradename = $P{newtradename} 
WHERE objid = $P{businessid}

[updateApplicationTradename]
UPDATE bpapplication SET tradename = $P{tradename} WHERE objid = $P{objid} 

[updateApplicationListingTradename]
UPDATE bpapplicationlisting SET tradename = $P{tradename} WHERE objid = $P{objid} 

[updatePermitTradename]
UPDATE bppermit SET tradename = $P{tradename} WHERE applicationid = $P{applicationid} 

/* Change Admin Transaction */

[getChangeAdminList]
SELECT * FROM changeadminlist 
ORDER BY txnno

[submitChangeAdminList]
UPDATE changeadminlist 
SET docstate = 'SUBMITTED' 
WHERE objid = $P{objid}

[approvedChangeAdminList]
UPDATE changeadminlist 
SET docstate = 'APPROVED' 
WHERE objid = $P{objid}

[rejectChangeAdminList]
UPDATE changeadminlist 
SET docstate = 'REJECTED' 
WHERE objid = $P{objid}

[updateBusinessAdmin]
UPDATE business 
SET adminid = $P{newadminid}, 
adminname = $P{newadminname}, 
adminaddress = $P{newadminaddress} 
WHERE objid = $P{businessid}

[updateApplicationListingAdmin]
UPDATE bpapplicationlisting SET 
	administratorname  = $P{administratorname}, 
	administratoraddress = $P{administratoraddress} 
WHERE objid = $P{objid} 

/* Change Address Transaction */

[getChangeAddressList]
SELECT * FROM changeaddresslist 
ORDER BY txnno

[submitChangeAddressList]
UPDATE changeaddresslist 
SET docstate = 'SUBMITTED' 
WHERE objid = $P{objid}

[approvedChangeAddressList]
UPDATE changeaddresslist 
SET docstate = 'APPROVED' 
WHERE objid = $P{objid}

[rejectChangeAddressList]
UPDATE changeaddresslist 
SET docstate = 'REJECTED' 
WHERE objid = $P{objid}

[updateBusinessAddress]
UPDATE business 
SET businessaddress = $P{newbusinessaddress} 
WHERE objid = $P{objid}

[updateApplicationBusinessAddress]
UPDATE bpapplication 
SET businessaddress = $P{newbusinessaddress} 
WHERE businessid = $P{businessid} 

[updateApplicationListingBusinessAddress]
UPDATE bpapplicationlisting 
SET businessaddress = $P{newbusinessaddress} 
WHERE businessid = $P{businessid} 




/* Change Permittee Transaction */

[getChangePermitteeList]
SELECT * FROM changepermitteelist 
ORDER BY txnno

[submitChangePermitteeList]
UPDATE changepermitteelist 
SET docstate = 'SUBMITTED' 
WHERE objid = $P{objid}

[approvedChangePermitteeList]
UPDATE changepermitteelist 
SET docstate = 'APPROVED' 
WHERE objid = $P{objid}

[rejectChangePermitteeList]
UPDATE changepermitteelist 
SET docstate = 'REJECTED' 
WHERE objid = $P{objid}

[updateBusinessPermittee]
UPDATE business 
SET taxpayerid = $P{newtaxpayerid}, 
taxpayername = $P{newtaxpayername}, 
taxpayeraddress = $P{newtaxpayeraddress} 
WHERE objid = $P{businessid}

[updateApplicationListingPermittee]
UPDATE bpapplicationlisting SET 
	taxpayerid = $P{taxpayerid}, 
	taxpayername = $P{taxpayername}, 
	taxpayeraddress = $P{taxpayeraddress} 
WHERE objid = $P{objid} 

 


[submitTransaction]
UPDATE bptxn 
SET docstate = 'SUBMITTED' 
WHERE objid = $P{objid}

[approveTransaction]
UPDATE bptxn 
SET docstate = 'APPROVED' 
WHERE objid = $P{objid}

[rejectTransaction]
UPDATE bptxn 
SET docstate = 'REJECTED' 
WHERE objid = $P{objid}

[getPendingBPTxnByBusinessId]
SELECT * FROM bptxn 
WHERE businessid = $P{businessid} 
AND NOT docstate IN ('APPROVED', 'REJECTED')