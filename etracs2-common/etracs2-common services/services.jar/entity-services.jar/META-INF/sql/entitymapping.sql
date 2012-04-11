[getList] 
SELECT * 
FROM entityformapping 
ORDER BY domainname, entityname 

[getListByName] 
SELECT * 
FROM entityformapping 
WHERE entityname LIKE $P{entityname}  
ORDER BY domainname, entityname 

[getMapping]
SELECT * FROM entitymapping  
WHERE domainid = $P{domainid}  
  AND parentid = $P{parentid}  
  AND entityid = $P{entityid}  
  
[deleteMapping]  
DELETE FROM entitymapping  
WHERE domainid = $P{domainid}  
  AND parentid = $P{parentid}  
  AND entityid = $P{entityid}  