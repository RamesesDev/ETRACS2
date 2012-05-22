[getBarangayList]
SELECT objid AS barangayid, lguname AS barangayname FROM lgu WHERE lgutype = 'BARANGAY'  ORDER BY lguname  

[getClassificationList]
SELECT objid AS classificationid, name AS classification FROM lobclassification ORDER BY name 
 
[getListByYear]
SELECT  
 p.*  
FROM bppermit p  
INNER JOIN bpapplication a on a.objid = p.applicationid  
INNER JOIN bpapplicationlisting l on l.objid = p.applicationid  
WHERE p.iyear = $P{iyear}  
 AND l.barangayname LIKE $P{barangay} 
 AND p.docstate = 'ACTIVE'  

[getAppByIdActivePermit]
SELECT  
 * 
FROM bpapplication 
WHERE objid = $P{applicationid}
 AND docstate = 'ACTIVE'  

 

[getTaxpayerMasterList]
SELECT  
	a.objid,  
	p.txnno AS permitno, a.iyear,  a.organization, a.barangayname, 
	a.tradename, a.businessaddress, a.taxpayername, a.taxpayeraddress, a.txntype, 
	(SELECT SUM(value) FROM bpappinfolisting WHERE varname = 'CAPITAL' and objid like CONCAT(a.objid,'%')) AS capital, 
	(SELECT SUM(value) FROM bpappinfolisting WHERE varname = 'GROSS' and objid like CONCAT(a.objid,'%')) AS gross 
FROM bpapplicationlisting a, bppermit p  
WHERE a.objid = p.applicationid  
  AND a.iyear = $P{iyear} 
ORDER BY a.txnno  

[getApplicationListing] 
SELECT 
	a.txnno AS appno, a.iyear, a.docstate, a.txntype, a.organization, a.barangayname, 
	a.tradename, a.businessaddress, a.taxpayername, a.taxpayeraddress, 
	l.name AS lobname, l.classification, 
	(SELECT SUM(value) FROM bpappinfolisting WHERE varname = 'CAPITAL' and objid like CONCAT(a.objid,'%') AND lobid = bl.lobid) AS capital,
	(SELECT SUM(value) FROM bpappinfolisting WHERE varname = 'GROSS' and objid like CONCAT(a.objid,'%')  AND lobid = bl.lobid) AS gross 
FROM bpapplicationlisting a
	INNER JOIN bploblisting bl ON bl.applicationid = a.objid 
	INNER JOIN lob l ON l.objid = bl.lobid 
WHERE a.iyear = $P{iyear} 
  AND a.docstate LIKE $P{docstate}   
  AND a.barangayid LIKE $P{barangayid}  
  AND l.classificationid LIKE $P{classificationid} 
  AND l.objid LIKE $P{lobid} 
ORDER BY a.txnno 

[getLOBCountListing]
SELECT  
	a.iyear, 
	l.name AS lobname, 
	SUM(CASE WHEN a.txntype = 'NEW' THEN $P{qtr} ELSE 0 END)  AS newcount, 
	SUM(CASE WHEN a.txntype = 'RENEW' THEN $P{qtr} ELSE 0 END)  AS renewcount, 
	SUM(CASE WHEN a.txntype = 'ADDLOB' THEN $P{qtr} ELSE 0 END)  AS addlobcount, 
	SUM(CASE WHEN a.txntype = 'RETIRE' THEN $P{qtr} ELSE 0 END)  AS retirecount 
FROM bpapplicationlisting a 
	INNER JOIN bploblisting bl ON bl.applicationid = a.objid  
	INNER JOIN lob l ON l.objid = bl.lobid  
WHERE a.iyear = $P{iyear}  
  AND a.docstate LIKE $P{docstate}   
  AND a.barangayid LIKE $P{barangayid} 
  AND l.classification LIKE $P{classification} 
GROUP BY a.iyear, l.name   

[getBusinessTaxpayerList]
SELECT distinct taxpayerid, taxpayername, taxpayeraddress 
FROM bpapplicationlisting 
WHERE docstate IN ('APPROVED','PERMIT_PENDING', 'ACTIVE') 
  AND barangayid LIKE $P{barangayid} 
  
[getPermitInfo]
SELECT info FROM bppermit WHERE applicationid = $P{applicationid} 

[getBusinessTopList]
SELECT DISTINCT amount 
FROM ( 
	SELECT SUM(bi.VALUE) AS amount  
	FROM bpappinfolisting bi  
		INNER JOIN bpapplicationlisting bl ON bi.applicationid = bl.objid  
		INNER JOIN lob l ON l.objid = bi.lobid 
		INNER JOIN lobclassification lc ON lc.objid = l.classificationid 
	WHERE bl.txntype = $P{txntype} 
	  AND bl.iyear = $P{year} 
	  AND bl.docstate IN ('APPROVED', 'PERMIT_PENDING', 'ACTIVE') 
	  AND bi.varname = $P{varname}     
	  AND lc.name LIKE $P{classification}  
	GROUP BY bl.objid   
) bb  
ORDER BY bb.amount DESC   
LIMIT $P{topsize}  

[getBusinessTopListGroupByAmount]
SELECT 
 pa.permitno, ba.tradename, ba.businessaddress,
 ba.taxpayername, ba.taxpayeraddress, pa.amount 
FROM bpapplicationlisting ba, 
	( 
		SELECT t.* 
		FROM (	 
			SELECT  
			 a.objid, p.txnno as permitno,  
			 SUM(i.VALUE) AS amount 
			FROM bpappinfolisting i  
				INNER JOIN bpapplicationlisting a ON i.applicationid = a.objid  
				INNER JOIN lob l ON l.objid = i.lobid 
				INNER JOIN lobclassification lc ON lc.objid = l.classificationid 
				LEFT JOIN bppermit p on p.applicationid = a.objid 
			WHERE i.varname = $P{varname}  
			AND lc.name LIKE $P{classification} 
			GROUP BY a.objid 
		) t 
		WHERE t.amount = $P{amount}	
	) pa 
WHERE ba.txntype = $P{txntype}  
  AND ba.iyear = $P{year} 
  AND ba.docstate IN ('APPROVED', 'PERMIT_PENDING', 'ACTIVE') 
  AND ba.objid = pa.objid 
ORDER BY pa.amount DESC  

[getAnnually] 
SELECT
	lc.name AS classification, 
	SUM(CASE WHEN a.iyear = $P{yearto} AND al.varname = $P{varname} THEN al.value ELSE 0.0 END ) AS amountto, 
	SUM(CASE WHEN a.iyear = $P{yearfrom} AND al.varname = $P{varname} THEN al.value ELSE 0.0 END ) AS amountfrom	 
FROM lobclassification lc 
	INNER JOIN lob l ON lc.objid = l.classificationid  
	INNER JOIN bpappinfolisting al ON l.objid = al.lobid  
	INNER JOIN bpapplication a ON al.applicationid = a.objid  
WHERE  a.iyear IN ( $P{yearto}, $P{yearfrom} ) 
 AND a.docstate IN ('APPROVED', 'PERMIT_PENDING', 'ACTIVE', 'EXPIRED')   
GROUP BY lc.name 

[getQuarterly] 
SELECT 
	lc.name AS classification, 
	SUM(CASE WHEN a.iyear = $P{yearto} AND al.varname = $P{varname} THEN al.value ELSE 0.0 END ) AS   amountto, 
	SUM(CASE WHEN a.iyear = $P{yearto} AND QUARTER(a.txndate) = $P{qtr} AND al.varname = $P{varname} THEN al.value ELSE 0.0 END ) AS amttoq1, 
	SUM(CASE WHEN a.iyear = $P{yearto} AND QUARTER(a.txndate) = 2 AND al.varname = $P{varname} THEN al.value ELSE 0.0 END ) AS amttoq2, 
	SUM(CASE WHEN a.iyear = $P{yearto} AND QUARTER(a.txndate) = 3 AND al.varname = $P{varname} THEN al.value ELSE 0.0 END ) AS amttoq3, 
	SUM(CASE WHEN a.iyear = $P{yearto} AND QUARTER(a.txndate) = 4 AND al.varname = $P{varname} THEN al.value ELSE 0.0 END ) AS amttoq4, 
	 
	SUM(CASE WHEN a.iyear = $P{yearfrom} AND al.varname = $P{varname} THEN al.value ELSE 0.0 END ) AS  amountfrom, 
	SUM(CASE WHEN a.iyear = $P{yearfrom} AND QUARTER(a.txndate) = $P{qtr} AND al.varname = $P{varname} THEN al.value ELSE 0.0 END ) AS amtfrmq1, 
	SUM(CASE WHEN a.iyear = $P{yearfrom} AND QUARTER(a.txndate) = 2 AND al.varname = $P{varname} THEN al.value ELSE 0.0 END ) AS amtfrmq2, 
	SUM(CASE WHEN a.iyear = $P{yearfrom} AND QUARTER(a.txndate) = 3 AND al.varname = $P{varname} THEN al.value ELSE 0.0 END ) AS amtfrmq3, 
	SUM(CASE WHEN a.iyear = $P{yearfrom} AND QUARTER(a.txndate) = 4 AND al.varname = $P{varname} THEN al.value ELSE 0.0 END ) AS amtfrmq4   
FROM lobclassification lc  
	INNER JOIN lob l ON lc.objid = l.classificationid  
	INNER JOIN bpappinfolisting al ON l.objid = al.lobid  
	INNER JOIN bpapplication a ON al.applicationid = a.objid  
WHERE  a.iyear IN ( $P{yearto}, $P{yearfrom} ) 
 AND a.docstate IN ('APPROVED', 'PERMIT_PENDING', 'ACTIVE', 'EXPIRED')  
GROUP BY lc.name 
 
[getAssessmentAnnually]
SELECT 
	lc.name AS classification,
	SUM(CASE WHEN ia.systype = 'BUSINESS_TAX' AND a.iyear = $P{yearto} THEN tf.amountdue ELSE 0.0 END )AS businesstaxto, 
	SUM(CASE WHEN ia.systype = 'BUSINESS_TAX' AND a.iyear = $P{yearfrom} THEN tf.amountdue ELSE 0.0 END )AS businesstaxfrom, 
	SUM(CASE WHEN ia.systype = 'REG_FEE' AND a.iyear = $P{yearto} THEN tf.amountdue ELSE 0.0 END) AS regfeeto, 
	SUM(CASE WHEN ia.systype = 'REG_FEE' AND a.iyear = $P{yearfrom} THEN tf.amountdue ELSE 0.0 END) AS regfeefrom, 
	SUM(CASE WHEN a.iyear = $P{yearto} AND ia.systype IS NULL OR ia.systype NOT IN( 'BUSINESS_TAX', 'REG_FEE') THEN tf.amountdue ELSE 0.0 END) AS otherfeeto, 
	SUM(CASE WHEN a.iyear = $P{yearfrom} AND ia.systype IS NULL OR ia.systype NOT IN( 'BUSINESS_TAX', 'REG_FEE') THEN tf.amountdue ELSE 0.0 END) AS otherfeefrom,
	SUM(CASE WHEN a.iyear = $P{yearto} THEN tf.amountdue ELSE 0.0 END) AS amountto, 
	SUM(CASE WHEN a.iyear = $P{yearfrom} THEN tf.amountdue ELSE 0.0 END) AS amountfrom  
FROM bptaxfeelisting tf 
	INNER JOIN bpapplication a ON a.objid = tf.applicationid  
	INNER JOIN incomeaccount ia ON ia.objid = tf.acctid  
	INNER JOIN lob l ON l.objid = tf.lobid  
	INNER JOIN lobclassification lc ON lc.objid = l.classificationid 
WHERE a.iyear IN ( $P{yearto}, $P{yearfrom} )  
 AND a.docstate IN ('APPROVED', 'PERMIT_PENDING', 'ACTIVE', 'EXPIRED')    
GROUP BY classification 
ORDER BY classification 
 
[getAssessmentQuarterly]
SELECT 
	lc.name AS classification,
	SUM(CASE WHEN ia.systype = 'BUSINESS_TAX' AND a.iyear = $P{yearto} AND QUARTER(a.txndate) = $P{qtr} THEN tf.amountdue ELSE 0.0 END )AS businesstaxto, 
	SUM(CASE WHEN ia.systype = 'BUSINESS_TAX' AND a.iyear = $P{yearfrom} AND QUARTER(a.txndate) = $P{qtr} THEN tf.amountdue ELSE 0.0 END )AS businesstaxfrom, 
	SUM(CASE WHEN ia.systype = 'REG_FEE' AND a.iyear = $P{yearto} AND QUARTER(a.txndate) = $P{qtr} THEN tf.amountdue ELSE 0.0 END) AS regfeeto, 
	SUM(CASE WHEN ia.systype = 'REG_FEE' AND a.iyear = $P{yearfrom} AND QUARTER(a.txndate) = $P{qtr} THEN tf.amountdue ELSE 0.0 END) AS regfeefrom, 
	SUM(CASE WHEN a.iyear = $P{yearto} AND QUARTER(a.txndate) = $P{qtr} AND ia.systype IS NULL OR ia.systype NOT IN( 'BUSINESS_TAX', 'REG_FEE') THEN tf.amountdue ELSE 0.0 END) AS otherfeeto, 
	SUM(CASE WHEN a.iyear = $P{yearfrom} AND QUARTER(a.txndate) = $P{qtr} AND ia.systype IS NULL OR ia.systype NOT IN( 'BUSINESS_TAX', 'REG_FEE') THEN tf.amountdue ELSE 0.0 END) AS otherfeefrom,
	SUM(CASE WHEN a.iyear = $P{yearto} AND QUARTER(a.txndate) = $P{qtr} THEN tf.amountdue ELSE 0.0 END) AS amountto, 
	SUM(CASE WHEN a.iyear = $P{yearfrom} AND QUARTER(a.txndate) = $P{qtr} THEN tf.amountdue ELSE 0.0 END) AS amountfrom  
FROM bptaxfeelisting tf 
	INNER JOIN bpapplication a ON a.objid = tf.applicationid  
	INNER JOIN incomeaccount ia ON ia.objid = tf.acctid  
	INNER JOIN lob l ON l.objid = tf.lobid  
	INNER JOIN lobclassification lc ON lc.objid = l.classificationid 
WHERE a.iyear IN ( $P{yearto}, $P{yearfrom} )  
 AND a.docstate IN ('APPROVED', 'PERMIT_PENDING', 'ACTIVE', 'EXPIRED')    
GROUP BY classification 
ORDER BY classification
