[getList]
SELECT * FROM lob ORDER BY name  

[getListByName]
SELECT * FROM lob WHERE name LIKE $P{name} ORDER BY name 

[checkDuplicateName]
SELECT * FROM lob WHERE objid <> $P{objid} AND name = $P{name}

[getAttributes]
SELECT * FROM lobattribute WHERE name LIKE $P{name} 


