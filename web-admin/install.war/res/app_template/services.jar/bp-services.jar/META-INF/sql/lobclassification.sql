[getList]
SELECT * FROM lobclassification  
ORDER BY name 

[getListByName]
SELECT * FROM lobclassification 
WHERE name LIKE $P{name} ORDER BY name 

[checkDuplicateName]
SELECT * FROM lobclassification WHERE objid <> $P{objid} AND name = $P{name}

[getClassifications]
SELECT objid, name FROM lobclassification ORDER BY name 


