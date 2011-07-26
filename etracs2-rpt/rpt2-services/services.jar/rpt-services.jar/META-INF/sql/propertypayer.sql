[getList]
SELECT * FROM propertypayer ORDER BY taxpayername

[getListByName]
SELECT * FROM propertypayer WHERE taxpayername LIKE $P{taxpayername} ORDER BY taxpayername

[getById]
SELECT * FROM propertypayer WHERE objid = $P{objid}

[getLedgerData]
SELECT * FROM rptledger WHERE objid = $P{ledgerid}

[checkDuplicateTaxpayer]
SELECT COUNT(*) AS count FROM propertypayer WHERE taxpayername = $P{taxpayername}

