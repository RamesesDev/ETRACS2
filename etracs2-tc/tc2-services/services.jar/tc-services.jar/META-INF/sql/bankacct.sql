[getBankAccounts]
SELECT * FROM bankaccount

[getById]
SELECT * FROM bankaccount WHERE objid = $P{objid}

[getFund]
SELECT objid, fundname FROM fund
WHERE objid not in(
   SELECT fundid FROM bankaccount)
AND docstate = 'APPROVED'

[getFundByFundName]
SELECT objid FROM fund WHERE fundname = $P{fundname}

[checkDuplicateBankAccount]
SELECT COUNT(*) AS count FROM bankaccount WHERE acctno = $P{acctno}

[getBankAcctByAcctNo]
SELECT * FROM bankaccount WHERE acctno LIKE $P{acctno}

[getByBankCode]
SELECT * FROM bankaccount where bankcode LIKE $P{bankcode}

[getByBankName]
SELECT * FROM bankaccount where bankname LIKE $P{bankname}
