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

[getMemberList]
SELECT * FROM entitymember WHERE entityid = $P{entityid} ORDER BY itemno 

[checkDuplicateNo]
SELECT COUNT(*) AS icount FROM entity WHERE objid <> $P{objid} AND entityno = $P{entityno} 

[checkDuplicateName]
SELECT * FROM entity 
WHERE objid <> $P{objid} 
  AND entityname = $P{entityname} AND entityaddress = $P{entityaddress} 

[getMappingList]  
SELECT * FROM entitymapping WHERE parentid = $P{parentid}

