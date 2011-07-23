[getList]  
SELECT o.* FROM bpapplicationlisting o 
WHERE  o.docstate = $P{docstate} 

[getListByPermitNo]  
SELECT o.* FROM bpapplicationlisting o 
WHERE o.txnno = $P{search} 
AND   o.docstate = $P{docstate} 

[getListByTradeName]  
SELECT o.* FROM bpapplicationlisting o  
WHERE o.tradename LIKE $P{search}  
AND   o.docstate = $P{docstate} 

[getListByBusinessAddress]  
SELECT o.* FROM bpapplicationlisting o 
WHERE o.businessaddress LIKE $P{search} 
AND   o.docstate = $P{docstate} 

[getListByTaxpayerName]  
SELECT o.* FROM bpapplicationlisting o 
WHERE o.taxpayername LIKE $P{search} 
AND   o.docstate = $P{docstate} 

[getListByTaxpayerAddress]  
SELECT o.* FROM bpapplicationlisting o 
WHERE o.taxpayeraddress LIKE $P{search} 
AND   o.docstate = $P{docstate} 

[findPermitByApplicationId] 
SELECT o.* FROM bppermit o 
WHERE o.applicationid = $P{applicationid} 
