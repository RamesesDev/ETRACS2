[getList]
SELECT * FROM miscitems ORDER BY misccode

[getListByCode]
SELECT * FROM miscitems WHERE misccode LIKE $P{misccode} ORDER BY misccode

[getListByDescription]
SELECT * FROM miscitems WHERE miscdesc LIKE $P{miscdesc} ORDER BY misccode

[getById]
SELECT * FROM miscitems WHERE objid = $P{objid}

[checkDuplicateDescription]
SELECT COUNT(*) AS count FROM miscitems WHERE miscdesc = $P{miscdesc}

[checkDuplicateCode]
SELECT COUNT(*) AS count FROM miscitems WHERE misccode = $P{misccode}

