[getList]
SELECT * FROM collectiontype ORDER BY afid, name 

[getListByName]
SELECT * FROM collectiontype WHERE name LIKE $P{name} ORDER BY afid, name 

[getListByAfId]
SELECT * FROM collectiontype WHERE afid = $P{afid} ORDER BY name 

[checkDuplicateName]
SELECT objid FROM collectiontype WHERE objid <> $P{objid} AND name = $P{name} AND afid = $P{afid}


