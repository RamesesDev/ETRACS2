[getList]
SELECT * FROM structures ORDER BY structurecode

[getListByCode]
SELECT * FROM structures WHERE structurecode LIKE $P{structurecode} ORDER BY structurecode

[getListByStructure]
SELECT * FROM structures WHERE structuredesc LIKE $P{structuredesc} ORDER BY structurecode

[getById]
SELECT * FROM structures WHERE objid = $P{objid}

[checkDuplicateStructure]
SELECT COUNT(*) AS count FROM structures WHERE structuredesc = $P{structuredesc}

[checkDuplicateCode]
SELECT COUNT(*) AS count FROM structures WHERE structurecode = $P{structurecode}

