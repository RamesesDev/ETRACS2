[getById] 
SELECT * FROM incomeaccount WHERE objid = $P{objid}

[getList]
SELECT * FROM incomeaccount ORDER BY accttitle   

[getListByAcctNo]
SELECT * FROM incomeaccount WHERE acctno LIKE $P{acctno}  ORDER BY acctno 

[getListByTitle]
SELECT * FROM incomeaccount WHERE accttitle LIKE $P{accttitle} ORDER BY accttitle   

[getIncomeAccountList]
SELECT objid, acctno, accttitle, fundid FROM incomeaccount WHERE docstate = 'APPROVED'

[getIncomeAccountListByNo]
SELECT objid, acctno, accttitle, fundid FROM incomeaccount WHERE docstate = 'APPROVED' AND acctno = $P{acctno}

[getIncomeAccountListByTitle]
SELECT objid, acctno, accttitle, fundid FROM incomeaccount WHERE docstate = 'APPROVED' AND accttitle LIKE $P{accttitle}

[getFund]
SELECT * FROM fund WHERE docstate = "APPROVED"

[getFundId]
SELECT objid FROM fund WHERE fundname = $P{fundname}

[checkDuplicateAcctNo]
SELECT COUNT(*) AS count FROM incomeaccount 
WHERE objid <> $P{objid} AND acctno = $P{acctno} 

[checkDuplicateTitle]
SELECT COUNT(*) AS count FROM incomeaccount 
WHERE objid <> $P{objid} AND accttitle = $P{title} 

[checkReferencedId]
SELECT COUNT(*) AS count FROM receiptitem WHERE acctid = $P{acctid}
