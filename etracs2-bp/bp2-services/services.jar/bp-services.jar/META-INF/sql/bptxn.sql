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
WHERE objid = $P{businessid}



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