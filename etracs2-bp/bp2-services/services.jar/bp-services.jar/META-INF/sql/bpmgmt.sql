[getList]  
SELECT o.* FROM bpapplicationlisting o 
WHERE  o.docstate = $P{docstate} 
AND   NOT o.txntype in ('RETIRE','RETIRELOB') 

[getListByPermitNo]  
SELECT o.* FROM bpapplicationlisting o 
WHERE o.txnno = $P{search} 
AND   o.docstate = $P{docstate} 
AND   NOT o.txntype in ('RETIRE','RETIRELOB') 

[getListByTradeName]  
SELECT o.* FROM bpapplicationlisting o  
WHERE o.tradename LIKE $P{search}  
AND   o.docstate = $P{docstate} 
AND   NOT o.txntype in ('RETIRE','RETIRELOB') 

[getListByBusinessAddress]  
SELECT o.* FROM bpapplicationlisting o 
WHERE o.businessaddress LIKE $P{search}  
AND   o.docstate = $P{docstate} 
AND   NOT o.txntype in ('RETIRE','RETIRELOB') 

[getListByTaxpayerName]  
SELECT o.* FROM bpapplicationlisting o 
WHERE o.taxpayername LIKE $P{search} 
AND   o.docstate = $P{docstate} 
AND   NOT o.txntype in ('RETIRE','RETIRELOB') 

[getListByTaxpayerAddress]  
SELECT o.* FROM bpapplicationlisting o 
WHERE o.taxpayeraddress LIKE $P{search} 
AND   o.docstate = $P{docstate} 
AND   NOT o.txntype in ('RETIRE','RETIRELOB') 

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
