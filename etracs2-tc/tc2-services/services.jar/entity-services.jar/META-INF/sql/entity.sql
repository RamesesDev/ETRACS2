[getList] 
SELECT objid, schemaname, schemaversion, entityno, entitytype, entityname, entityaddress 
FROM entity 
ORDER BY entityname 

[getListByNo] 
SELECT objid, schemaname, schemaversion, entityno, entitytype, entityname, entityaddress 
FROM entity 
WHERE entityno = $P{entityno} 

[getListByName] 
SELECT objid, schemaname, schemaversion, entityno, entitytype, entityname, entityaddress  
FROM entity 
WHERE entityname LIKE $P{entityname} 
ORDER BY entityname 

[checkDuplicateNo]
SELECT COUNT(*) AS icount FROM entity WHERE entityno = $P{entityno} 

[checkDuplicateName]
SELECT * FROM entity WHERE objid <> $P{objid} AND entityname = $P{entityname} 


