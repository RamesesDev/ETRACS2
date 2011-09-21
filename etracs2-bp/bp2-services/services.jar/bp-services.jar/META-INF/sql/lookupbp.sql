[lookupApplicationByTxntype] 
SELECT bpa.objid, b.taxpayername, bpa.txnno AS appno, b.tradename, b.businessaddress, bpa.businessid FROM bpapplication bpa 
INNER JOIN business b on b.objid = bpa.businessid 
AND bpa.docstate IN ('ACTIVE'  ,'APPROVED', 'EXPIRED', 'PERMIT_PENDING') 
AND bpa.txntype IN ('NEW', 'RENEW') 

[lookupApplicationByTxntypeAndByBIN]  
SELECT bpa.objid, b.taxpayername, bpa.txnno AS appno, b.tradename, b.businessaddress, bpa.businessid FROM bpapplication bpa 
INNER JOIN business b on b.objid = bpa.businessid 
WHERE b.bin = $P{searchText} 
AND bpa.docstate IN ('ACTIVE'  ,'APPROVED', 'EXPIRED', 'PERMIT_PENDING')
AND bpa.txntype IN ('NEW', 'RENEW')

[lookupApplicationByTxntypeAndByAppNo] 
SELECT bpa.objid, b.taxpayername, bpa.txnno AS appno, b.tradename, b.businessaddress, bpa.businessid FROM bpapplication bpa 
INNER JOIN business b on b.objid = bpa.businessid 
WHERE bpa.txnno = $P{searchText} 
AND bpa.docstate IN ('ACTIVE'  ,'APPROVED', 'EXPIRED', 'PERMIT_PENDING')
AND bpa.txntype IN ('NEW', 'RENEW')

[lookupApplicationByTxntypeAndByPermitNo] 
SELECT bpa.objid, b.taxpayername, bpa.txnno AS appno, b.tradename, b.businessaddress, bpa.businessid FROM bpapplication bpa 
INNER JOIN business b on b.objid = bpa.businessid  
INNER JOIN bppermit bp on bp.businessid = b.objid 
WHERE bp.txnno = $P{searchText} 
AND bpa.docstate IN ('ACTIVE'  ,'APPROVED', 'EXPIRED', 'PERMIT_PENDING')
AND bpa.txntype IN ('NEW', 'RENEW')

[lookupApplicationByTxntypeAndByTradeName] 
SELECT bpa.objid, b.taxpayername, bpa.txnno AS appno, b.tradename, b.businessaddress, bpa.businessid FROM bpapplication bpa 
INNER JOIN business b on b.objid = bpa.businessid  
WHERE b.tradename LIKE $P{searchText} 
AND bpa.docstate IN ('ACTIVE'  ,'APPROVED', 'EXPIRED', 'PERMIT_PENDING')
AND bpa.txntype IN ('NEW', 'RENEW')

[lookupApplicationByTxntypeAndByTaxpayerName] 
SELECT bpa.objid, b.taxpayername, bpa.txnno AS appno, b.tradename, b.businessaddress, bpa.businessid FROM bpapplication bpa 
INNER JOIN business b on b.objid = bpa.businessid 
WHERE b.taxpayername LIKE $P{searchText} 
AND bpa.docstate IN ('ACTIVE'  ,'APPROVED', 'EXPIRED', 'PERMIT_PENDING')
AND bpa.txntype IN ('NEW', 'RENEW')

[lookupApplicationByTxntypeAndByAdminstratorName] 
SELECT bpa.objid, b.taxpayername, bpa.txnno AS appno, b.tradename, b.businessaddress, bpa.businessid FROM bpapplication bpa 
INNER JOIN business b on b.objid = bpa.businessid 
WHERE b.adminname LIKE $P{searchText} 
AND bpa.docstate IN ('ACTIVE'  ,'APPROVED', 'EXPIRED', 'PERMIT_PENDING')
AND bpa.txntype IN ('NEW', 'RENEW')

[lookupApplicationByTxntypeAndByBusinessAddress] 
SELECT bpa.objid, b.taxpayername, bpa.txnno AS appno, b.tradename, b.businessaddress, bpa.businessid FROM bpapplication bpa 
INNER JOIN business b on b.objid = bpa.businessid 
WHERE b.businessaddress LIKE $P{searchText} 
AND bpa.docstate IN ('ACTIVE'  ,'APPROVED', 'EXPIRED', 'PERMIT_PENDING')
AND bpa.txntype IN ('NEW', 'RENEW')

[lookupApproveApplication]
SELECT bpa.objid, b.taxpayername, bpa.txnno AS appno, b.tradename, b.businessaddress, bpa.businessid FROM bpapplication bpa 
INNER JOIN business b on b.objid = bpa.businessid 
AND bpa.docstate IN ('ACTIVE'  ,'APPROVED', 'PERMIT_PENDING', 'EXPIRED')

[lookupApproveApplicationByBIN] 
SELECT bpa.objid, b.taxpayername, bpa.txnno AS appno, b.tradename, b.businessaddress, bpa.businessid FROM bpapplication bpa 
INNER JOIN business b on b.objid = bpa.businessid 
WHERE b.bin = $P{searchText} 
AND bpa.docstate IN ('ACTIVE'  ,'APPROVED', 'PERMIT_PENDING', 'EXPIRED')

[lookupApproveApplicationByAppNo] 
SELECT bpa.objid, b.taxpayername, bpa.txnno AS appno, b.tradename, b.businessaddress, bpa.businessid FROM bpapplication bpa 
INNER JOIN business b on b.objid = bpa.businessid 
WHERE bpa.txnno = $P{searchText} 
AND bpa.docstate IN ('ACTIVE'  ,'APPROVED', 'PERMIT_PENDING', 'EXPIRED')


[lookupApproveApplicationByPermitNo] 
SELECT bpa.objid, b.taxpayername, bpa.txnno AS appno, b.tradename, b.businessaddress, bpa.businessid FROM bpapplication bpa 
INNER JOIN business b on b.objid = bpa.businessid  
INNER JOIN bppermit bp on bp.businessid = b.objid 
WHERE bp.txnno = $P{searchText}                
AND bpa.docstate IN ('ACTIVE'  ,'APPROVED', 'PERMIT_PENDING', 'EXPIRED')


[lookupApproveApplicationByTradeName] 
SELECT bpa.objid, b.taxpayername, bpa.txnno AS appno, b.tradename, b.businessaddress, bpa.businessid FROM bpapplication bpa 
INNER JOIN business b on b.objid = bpa.businessid  
WHERE b.tradename LIKE $P{searchText} 
AND bpa.docstate IN ('ACTIVE'  ,'APPROVED', 'PERMIT_PENDING', 'EXPIRED')

[lookupApproveApplicationByTaxpayerName] 
SELECT bpa.objid, b.taxpayername, bpa.txnno AS appno, b.tradename, b.businessaddress, bpa.businessid FROM bpapplication bpa 
INNER JOIN business b on b.objid = bpa.businessid 
WHERE b.taxpayername LIKE $P{searchText} 
AND bpa.docstate IN ('ACTIVE'  ,'APPROVED', 'PERMIT_PENDING', 'EXPIRED') 

[lookupApproveApplicationByAdminstratorName] 
SELECT bpa.objid, b.taxpayername, bpa.txnno AS appno, b.tradename, b.businessaddress, bpa.businessid FROM bpapplication bpa 
INNER JOIN business b on b.objid = bpa.businessid 
WHERE b.adminname LIKE $P{searchText} 
AND bpa.docstate IN ('ACTIVE'  ,'APPROVED', 'PERMIT_PENDING', 'EXPIRED')

[lookupApproveApplicationByBusinessAddress] 
SELECT bpa.objid, b.taxpayername, bpa.txnno AS appno, b.tradename, b.businessaddress, bpa.businessid FROM bpapplication bpa 
INNER JOIN business b on b.objid = bpa.businessid 
WHERE b.businessaddress LIKE $P{searchText} 
AND bpa.docstate IN ('ACTIVE'  ,'APPROVED', 'PERMIT_PENDING', 'EXPIRED')
