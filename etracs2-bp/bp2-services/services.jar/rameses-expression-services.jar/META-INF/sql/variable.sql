[getList]
SELECT * FROM variable ORDER BY name  

[getListByName]
SELECT * FROM variable WHERE name LIKE $P{name} ORDER BY name 

[checkDuplicateName]
SELECT * FROM variable WHERE objid <> $P{objid} AND name = $P{name}


