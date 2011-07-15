[lookupApproveApplication]
SELECT bpa.objid, b.taxpayername, bpa.txnno AS appno, b.tradename, b.businessaddress FROM bpapplication bpa 
INNER JOIN business b on b.applicationid = bpa.objid 

[lookupApproveApplicationByBIN] 
SELECT bpa.objid, b.taxpayername, bpa.txnno AS appno, b.tradename, b.businessaddress FROM bpapplication bpa 
INNER JOIN business b on b.applicationid = bpa.objid 
WHERE b.bin = $P{searchText} 

[lookupApproveApplicationByAppNo] 
SELECT bpa.objid, b.taxpayername, bpa.txnno AS appno, b.tradename, b.businessaddress FROM bpapplication bpa 
INNER JOIN business b on b.applicationid = bpa.objid 
WHERE bpa.txnno = $P{searchText} 

[lookupApproveApplicationByPermitNo] 
SELECT bpa.objid, b.taxpayername, bpa.txnno AS appno, b.tradename, b.businessaddress FROM bpapplication bpa 
INNER JOIN business b on b.applicationid = bpa.objid 
INNER JOIN bppermit bp on bp.businessid = b.objid 
WHERE bp.txnno = $P{searchText} 

[lookupApproveApplicationByTradeName] 
SELECT bpa.objid, b.taxpayername, bpa.txnno AS appno, b.tradename, b.businessaddress FROM bpapplication bpa 
INNER JOIN business b on b.applicationid = bpa.objid 
WHERE b.tradename LIKE $P{searchText} 

[lookupApproveApplicationByTaxpayerName] 
SELECT bpa.objid, b.taxpayername, bpa.txnno AS appno, b.tradename, b.businessaddress FROM bpapplication bpa 
INNER JOIN business b on b.applicationid = bpa.objid 
WHERE b.taxpayername LIKE $P{searchText} 

[lookupApproveApplicationByAdminstratorName] 
SELECT bpa.objid, b.taxpayername, bpa.txnno AS appno, b.tradename, b.businessaddress FROM bpapplication bpa 
INNER JOIN business b on b.applicationid = bpa.objid 
WHERE b.adminname LIKE $P{searchText} 

[lookupApproveApplicationByBusinessAddress] 
SELECT bpa.objid, b.taxpayername, bpa.txnno AS appno, b.tradename, b.businessaddress FROM bpapplication bpa 
INNER JOIN business b on b.applicationid = bpa.objid 
WHERE b.businessaddress LIKE $P{searchText} 