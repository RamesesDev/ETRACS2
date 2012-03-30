[getBanks]
SELECT * FROM bank

[getById]
SELECT * FROM bank WHERE objid = $P{objid} 

[checkDuplicateBank]
SELECT COUNT(*) AS count FROM bank WHERE bankname = $P{bankname} AND branchname = $P{branchname}

[getByBankCode]
SELECT * FROM bank WHERE bankcode LIKE $P{bankcode}

[getByBankName]
SELECT * FROM bank WHERE bankname LIKE $P{bankname}

[checkIfReferenced]
SELECT COUNT(*) AS count FROM bankaccount WHERE bankid = $P{bankid}
