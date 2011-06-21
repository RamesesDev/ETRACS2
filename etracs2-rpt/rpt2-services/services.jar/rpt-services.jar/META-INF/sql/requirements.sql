[getList]
SELECT * FROM requirements ORDER BY reqcode

[getListByCode]
SELECT * FROM requirements WHERE reqcode LIKE $P{reqcode} ORDER BY reqcode

[getListByName]
SELECT * FROM requirements WHERE reqname LIKE $P{reqname} ORDER BY reqcode

[getById]
SELECT * FROM requirements WHERE objid = $P{objid}

[checkDuplicateName]
SELECT COUNT(*) AS count FROM requirements WHERE reqname = $P{reqname}

[checkDuplicateCode]
SELECT COUNT(*) AS count FROM requirements WHERE reqcode = $P{reqcode}

