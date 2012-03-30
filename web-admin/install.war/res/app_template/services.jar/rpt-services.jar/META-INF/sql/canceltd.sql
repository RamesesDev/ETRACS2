[getList]
SELECT * FROM canceltdreason ORDER BY cancelcode

[getListByCode]
SELECT * FROM canceltdreason WHERE cancelcode LIKE $P{cancelcode} ORDER BY cancelcode

[getListByTitle]
SELECT * FROM canceltdreason WHERE canceltitle LIKE $P{canceltitle} ORDER BY cancelcode

[getById]
SELECT * FROM canceltdreason WHERE objid = $P{objid}

[checkDuplicateTitle]
SELECT COUNT(*) AS count FROM canceltdreason WHERE canceltitle = $P{canceltitle}

[checkDuplicateCode]
SELECT COUNT(*) AS count FROM canceltdreason WHERE cancelcode = $P{cancelcode}

