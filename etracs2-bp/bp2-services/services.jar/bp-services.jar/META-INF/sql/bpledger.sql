[getBusinessLedgers]
SELECT 
	iyear AS appyear, 
	applicationid AS applicationid, 
	appno AS appno, 
	applicationtype as applicationtype, 
	SUM( amount ) AS amount, 
	SUM( amtpaid ) AS amtpaid 
FROM bpreceivable  
WHERE businessid = $P{businessid} 
GROUP BY iyear, applicationid 
ORDER BY iyear DESC, appno DESC


[getBPReceivablesByAppId]
SELECT 
	businessid AS businessid, 
	applicationid AS applicationid, 
	lobid AS lobid, 
	lobname AS lobname, 
	acctid AS acctid, 
	accttitle AS accttitle, 
	SUM( amount ) AS amount, 
	SUM( amtpaid ) AS amtpaid 
FROM bpreceivable 
WHERE applicationid = $P{appid} 
GROUP BY businessid, applicationid, lobid, lobname, acctid, accttitle  
ORDER BY lobname, accttitle

[getBPReceivableCredits]
SELECT bprc.* FROM bpreceivablecredit bprc, bpreceivable bpr  
WHERE bpr.objid = bprc.bpreceivableid 
AND bpr.applicationid = $P{appid} 
AND bpr.lobid = $P{lobid} 
AND bpr.acctid = $P{acctid} 
ORDER BY bprc.refdate

[getBPReceivableCreditsForNullLOB]
SELECT bprc.* FROM bpreceivablecredit bprc, bpreceivable bpr  
WHERE bpr.objid = bprc.bpreceivableid 
AND bpr.applicationid = $P{appid} 
AND bpr.lobid IS NULL 
AND bpr.acctid = $P{acctid} 
ORDER BY bprc.refdate

[getBPLastPaymentInfo]
SELECT 
	MIN( iyear ) AS lastyrpaid, 
	MIN( iqtr ) AS lastqtrpaid 
FROM bpreceivable 
WHERE businessid = $P{businessid} 
AND NOT amount = amtpaid

[getBPReceivablesByBusinessId]
SELECT 
	objid AS objid, 
	appno AS appno, 
	iyear AS iyear, 
	iqtr AS iqtr, 
	lobname AS lobname, 
	acctid AS acctid, 
	accttitle AS accttitle, 
	systype AS systype, 
	(amount - amtpaid) AS amount, 
	0.0 AS paymentAmt, 
	0.0 AS surcharge, 
	0.0 AS interest, 
	0.0 AS discount 
FROM bpreceivable 
WHERE businessid = $P{businessid} 
AND NOT amount = amtpaid 
ORDER BY appno DESC, iyear DESC, lobname, accttitle, iqtr DESC

[updateReceivableWithCapturePayment]
UPDATE bpreceivable 
SET amtpaid = ( amtpaid + $P{amtpaid} ) 
WHERE objid = $P{receivableid}