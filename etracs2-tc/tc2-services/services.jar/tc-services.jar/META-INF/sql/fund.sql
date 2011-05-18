[getList]
SELECT * FROM fund

[getListByFund]
SELECT * FROM fund WHERE fund LIKE $P{fund}

[getListBySubFund]
SELECT * FROM fund WHERE subfund LIKE $P{subfund}

[getListByFundName]
SELECT * FROM fund WHERE fundname LIKE $P{fundname}

[getById]
SELECT * FROM fund WHERE objid = $P{objid}

[getFund]
SELECT fund FROM fund

[checkDuplicateFundName]
SELECT COUNT(*) AS count FROM fund WHERE fundname = $P{fundname}

[checkReferencedId]
SELECT COUNT(*) AS count FROM incomeaccount WHERE fundid = $P{fundid}
