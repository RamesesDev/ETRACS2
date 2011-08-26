[getReceiptsByDate]
SELECT  afid, serialno, payorname, 
	CASE WHEN voided = 1 THEN '*** VOIDED ***' ELSE accttitle END AS particulars ,  
	CASE WHEN voided = 1 THEN 0.0 ELSE amount END as amount 
FROM revenue  
WHERE voided = 0  
AND remittancetimestamp = $P{txntimestamp}  
ORDER BY afid, serialno, accttitle 

[getReceiptSummaryByDate]
SELECT 
	fundname, accttitle, SUM(amount) AS amount 
FROM revenue 
WHERE remittancetimestamp = $P{txntimestamp} 
  AND voided = 0 
GROUP BY fundname, accttitle 
ORDER BY fundname, accttitle 



[getReceiptsByMonth]
SELECT 
	afid AS afid, 
	serialno AS serialno, 
	payorname AS payor, 
	accttitle AS particulars, 
	amount AS amount 
FROM revenue 
WHERE voided = 0 
AND remittancetimestamp LIKE CONCAT($P{monthtimestamp}, '%') 
ORDER BY afid, serialno, accttitle

[getReceiptSummaryByMonth]
SELECT 
	accttitle AS acctname, 
	SUM(amount) AS amount 
FROM revenue 
WHERE voided = 0 
AND remittancetimestamp LIKE CONCAT($P{monthtimestamp}, '%') 
GROUP BY accttitle 
ORDER BY accttitle



[getReceiptsByQtr]
SELECT 
	afid AS afid, 
	serialno AS serialno, 
	payorname AS payor, 
	accttitle AS particulars, 
	amount AS amount 
FROM revenue 
WHERE voided = 0 
AND remittancetimestamp LIKE CONCAT($P{qtrtimestamp}, '%') 
ORDER BY afid, serialno, accttitle

[getReceiptSummaryByQtr]
SELECT 
	accttitle AS acctname, 
	SUM(amount) AS amount 
FROM revenue 
WHERE voided = 0 
AND remittancetimestamp LIKE CONCAT($P{qtrtimestamp}, '%') 
GROUP BY accttitle 
ORDER BY accttitle