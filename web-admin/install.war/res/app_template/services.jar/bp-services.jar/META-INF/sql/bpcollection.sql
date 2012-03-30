[getReceivables]  
SELECT o.*, a.systype FROM bpreceivable o 
INNER JOIN  incomeaccount a ON a.objid = o.acctid 
WHERE o.objid IN ( 
	SELECT o.objid FROM bpreceivable o  
	WHERE o.businessid = $P{businessid}   
	AND   o.iyear < $P{iyear} 
	AND   o.amount > o.amtpaid 
	AND   o.applicationtype NOT IN ('ADDLOB', 'NEW') 
) OR o.objid IN ( 
	SELECT o.objid FROM bpreceivable o  
	WHERE  o.businessid = $P{businessid}  
	AND    o.iyear = $P{iyear}  
	AND    o.amount > o.amtpaid 
	AND    o.iqtr <= $P{iqtr} 
	AND    o.applicationtype NOT IN ('ADDLOB', 'NEW') 
) OR o.objid IN ( 
	SELECT o.objid FROM bpreceivable o  
	WHERE  o.businessid = $P{businessid}  
	AND    o.amount > o.amtpaid  
	AND    o.applicationtype IN ('ADDLOB', 'NEW') 
) ORDER BY o.iyear , o.iqtr 

[updatePermitForRelease] 
UPDATE bppermit 
SET docstate = 'PERMIT_PENDING' 
WHERE applicationid = $P{applicationid} 
AND   docstate = 'DRAFT' 
