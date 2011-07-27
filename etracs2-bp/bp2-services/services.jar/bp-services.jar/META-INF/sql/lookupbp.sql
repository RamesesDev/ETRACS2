[lookupApproveApplication]
SELECT bpa.objid, b.taxpayername, bpa.txnno AS appno, b.tradename, b.businessaddress, bpa.businessid FROM bpapplication bpa 
INNER JOIN business b on b.applicationid = bpa.objid 
AND bpa.txntype NOT IN ('RETIRE','RETIRELOB')

[lookupApproveApplicationByBIN] 
SELECT bpa.objid, b.taxpayername, bpa.txnno AS appno, b.tradename, b.businessaddress, bpa.businessid FROM bpapplication bpa 
INNER JOIN business b on b.applicationid = bpa.objid 
WHERE b.bin = $P{searchText} 
AND bpa.txntype NOT IN ('RETIRE','RETIRELOB')

[lookupApproveApplicationByAppNo] 
SELECT bpa.objid, b.taxpayername, bpa.txnno AS appno, b.tradename, b.businessaddress, bpa.businessid FROM bpapplication bpa 
INNER JOIN business b on b.applicationid = bpa.objid 
WHERE bpa.txnno = $P{searchText} 
AND bpa.txntype NOT IN ('RETIRE','RETIRELOB') 

[lookupApproveApplicationByPermitNo] 
SELECT bpa.objid, b.taxpayername, bpa.txnno AS appno, b.tradename, b.businessaddress, bpa.businessid FROM bpapplication bpa 
INNER JOIN business b on b.applicationid = bpa.objid 
INNER JOIN bppermit bp on bp.businessid = b.objid 
WHERE bp.txnno = $P{searchText} 
AND bpa.txntype NOT IN ('RETIRE','RETIRELOB') 

[lookupApproveApplicationByTradeName] 
SELECT bpa.objid, b.taxpayername, bpa.txnno AS appno, b.tradename, b.businessaddress, bpa.businessid FROM bpapplication bpa 
INNER JOIN business b on b.applicationid = bpa.objid 
WHERE b.tradename LIKE $P{searchText} 
AND bpa.txntype NOT IN ('RETIRE','RETIRELOB') 

[lookupApproveApplicationByTaxpayerName] 
SELECT bpa.objid, b.taxpayername, bpa.txnno AS appno, b.tradename, b.businessaddress, bpa.businessid FROM bpapplication bpa 
INNER JOIN business b on b.applicationid = bpa.objid 
WHERE b.taxpayername LIKE $P{searchText} 
AND bpa.txntype NOT IN ('RETIRE','RETIRELOB') 

[lookupApproveApplicationByAdminstratorName] 
SELECT bpa.objid, b.taxpayername, bpa.txnno AS appno, b.tradename, b.businessaddress, bpa.businessid FROM bpapplication bpa 
INNER JOIN business b on b.applicationid = bpa.objid 
WHERE b.adminname LIKE $P{searchText} 
AND bpa.txntype NOT IN ('RETIRE','RETIRELOB') 

[lookupApproveApplicationByBusinessAddress] 
SELECT bpa.objid, b.taxpayername, bpa.txnno AS appno, b.tradename, b.businessaddress, bpa.businessid FROM bpapplication bpa 
INNER JOIN business b on b.applicationid = bpa.objid 
WHERE b.businessaddress LIKE $P{searchText} 
AND bpa.txntype NOT IN ('RETIRE','RETIRELOB') 