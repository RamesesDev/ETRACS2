[getReceiptsByDate]
SELECT 
	afid AS afid, 
	serialno AS serialno, 
	payorname AS payor, 
	accttitle AS particulars, 
	amount AS amount 
FROM revenue 
WHERE voided = 0 
AND remittancetimestamp = $P{txntimestamp} 
ORDER BY afid, serialno, accttitle

[getReceiptSummaryByDate]
SELECT 
	accttitle AS acctname, 
	SUM(amount) AS amount 
FROM revenue 
WHERE voided = 0 
AND remittancetimestamp = $P{txntimestamp} 
GROUP BY accttitle 
ORDER BY accttitle



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