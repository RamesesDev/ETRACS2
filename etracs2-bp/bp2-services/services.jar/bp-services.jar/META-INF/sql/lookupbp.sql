[lookupBusiness]
SELECT b.objid, b.taxpayername, bpa.txnno AS appno, b.tradename, b.businessaddress FROM business b 
INNER JOIN bpapplication bpa on bpa.objid = b.applicationid 

[lookupBusinessByBIN] 
SELECT b.objid, b.taxpayername, bpa.txnno AS appno, b.tradename, b.businessaddress FROM business b 
INNER JOIN bpapplication bpa on bpa.objid = b.applicationid 
WHERE b.bin = $P{searchText} 

[lookupBusinessByAppNo] 
SELECT b.objid, b.taxpayername, bpa.txnno AS appno, b.tradename, b.businessaddress FROM business b 
INNER JOIN bpapplication bpa on bpa.objid = b.applicationid 
WHERE bpa.txnno = $P{searchText} 

[lookupBusinessByPermitNo] 
SELECT b.objid, b.taxpayername, bpa.txnno AS appno, b.tradename, b.businessaddress FROM business b 
INNER JOIN bpapplication bpa on bpa.objid = b.applicationid 
INNER JOIN bppermit bp on bp.businessid = b.objid 
WHERE bp.txnno = $P{searchText} 

[lookupBusinessByTradeName] 
SELECT b.objid, b.taxpayername, bpa.txnno AS appno, b.tradename, b.businessaddress FROM business b 
INNER JOIN bpapplication bpa on bpa.objid = b.applicationid 
WHERE b.tradename LIKE $P{searchText} 

[lookupBusinessByTaxpayerName] 
SELECT b.objid, b.taxpayername, bpa.txnno AS appno, b.tradename, b.businessaddress FROM business b 
INNER JOIN bpapplication bpa on bpa.objid = b.applicationid 
WHERE b.taxpayername LIKE $P{searchText} 

[lookupBusinessAdminstratorName] 
SELECT b.objid, b.taxpayername, bpa.txnno AS appno, b.tradename, b.businessaddress FROM business b 
INNER JOIN bpapplication bpa on bpa.objid = b.applicationid 
WHERE b.adminname LIKE $P{searchText} 

[lookupBusinessBusinessAddress] 
SELECT b.objid, b.taxpayername, bpa.txnno AS appno, b.tradename, b.businessaddress FROM business b 
INNER JOIN bpapplication bpa on bpa.objid = b.applicationid 
WHERE b.businessaddress LIKE $P{searchText} 