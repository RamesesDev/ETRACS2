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

[getListByBusinessName]  
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

[getForRenewalList]  
SELECT o.* FROM bpapplicationlisting o 
WHERE   o.docstate = 'EXPIRED'   

[getForRenewalListByPermitNo]  
SELECT o.* FROM bpapplicationlisting o 
WHERE o.txnno = $P{search} 
AND   o.docstate = 'EXPIRED'  

[getForRenewalListByTradeName]  
SELECT o.* FROM bpapplicationlisting o  
WHERE o.tradename LIKE $P{search}  
AND   o.docstate = 'EXPIRED'  

[getForRenewalListByBusinessAddress]  
SELECT o.* FROM bpapplicationlisting o 
WHERE o.businessaddress LIKE $P{search}  
AND   o.docstate = 'EXPIRED'  

[getForRenewalListByTaxpayerName]  
SELECT o.* FROM bpapplicationlisting o 
WHERE o.taxpayername LIKE $P{search} 
AND   o.docstate = 'EXPIRED'  

[getForRenewalListByTaxpayerAddress]  
SELECT o.* FROM bpapplicationlisting o 
WHERE o.taxpayeraddress LIKE $P{search} 
AND   o.docstate = 'EXPIRED'  

[getRetiredList]  
SELECT o.* FROM bpapplicationlisting o 
WHERE  o.docstate = $P{docstate} 
AND   o.txntype in ('RETIRE','RETIRELOB') 

[getRetiredListByPermitNo]  
SELECT o.* FROM bpapplicationlisting o 
WHERE o.txnno = $P{search} 
AND   o.docstate = $P{docstate} 
AND   o.txntype in ('RETIRE','RETIRELOB') 

[getRetiredListByTradeName]  
SELECT o.* FROM bpapplicationlisting o  
WHERE o.tradename LIKE $P{search}  
AND   o.docstate = $P{docstate} 
AND   o.txntype in ('RETIRE','RETIRELOB') 

[getRetiredListByBusinessAddress]  
SELECT o.* FROM bpapplicationlisting o 
WHERE o.businessaddress LIKE $P{search}  
AND   o.docstate = $P{docstate} 
AND   o.txntype in ('RETIRE','RETIRELOB') 

[getRetiredListByTaxpayerName]  
SELECT o.* FROM bpapplicationlisting o 
WHERE o.taxpayername LIKE $P{search} 
AND   o.docstate = $P{docstate} 
AND   o.txntype in ('RETIRE','RETIRELOB') 

[getRetiredListByTaxpayerAddress]  
SELECT o.* FROM bpapplicationlisting o 
WHERE o.taxpayeraddress LIKE $P{search} 
AND   o.docstate = $P{docstate} 
AND   o.txntype in ('RETIRE','RETIRELOB') 

[findPermitByApplicationId] 
SELECT o.* FROM bppermit o 
WHERE o.applicationid = $P{applicationid} 





[getAppListInfo]
SELECT barangayname, ctcno FROM bpapplicationlisting WHERE objid = $P{objid}

[getTaxpayer]
SELECT * FROM entity where objid = $P{objid}


