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


[getMaterial]
SELECT objid AS materialid, materialcode, materialdesc AS materialname 
FROM materials 
ORDER BY materialcode 

[getMaterialByCode]
SELECT objid AS materialid, materialcode, materialdesc AS materialname 
FROM materials 
WHERE materialcode LIKE $P{code} 
ORDER BY materialcode 

[getMaterialByName]
SELECT objid AS materialid, materialcode, materialdesc AS materialname 
FROM materials 
WHERE materialdesc LIKE $P{name} 
ORDER BY materialcode 
