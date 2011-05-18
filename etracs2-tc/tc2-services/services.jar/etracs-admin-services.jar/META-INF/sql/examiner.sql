[getList]
SELECT u.objid, u.uid, u.lastname, u.firstname, eu.jobtitle, CONCAT(u.lastname, ', ', u.firstname) AS name 
FROM user u, etracsuser eu, examiner ex  
WHERE u.objid = eu.objid 
  AND u.objid = ex.objid 
ORDER BY u.uid  

[findByUid]
SELECT u.objid, u.uid, u.lastname, u.firstname, eu.jobtitle, CONCAT(u.lastname, ', ', u.firstname) AS name  
FROM user u, etracsuser eu, examiner ex  
WHERE u.objid = eu.objid 
  AND u.objid = ex.objid 
  AND u.uid LIKE $P{uid}
ORDER BY u.uid  

[findByLastName]
SELECT u.objid, u.uid, u.lastname, u.firstname, eu.jobtitle , CONCAT(u.lastname, ', ', u.firstname) AS name 
FROM user u, etracsuser eu, examiner ex  
WHERE u.objid = eu.objid 
  AND u.objid = ex.objid 
  AND u.lastname LIKE $P{lastname} 
ORDER BY u.uid  



[getReassignList]
SELECT objid, state, assignedFrom, assignedTo, validUntil  
FROM reassignedlgu 
ORDER BY validUntil 

[getActiveReassignList]
SELECT objid, state, assignedFrom, assignedTo, validUntil, DATEDIFF(validUntil, NOW()) + 1 AS remainingDays  
FROM reassignedlgu 
WHERE state = 'ACTIVE'  
ORDER BY validUntil  


[getReassignListByFrom]
SELECT objid, state, assignedFrom, assignedTo, validUntil  
FROM reassignedlgu 
WHERE assignedFrom LIKE $P{assignedFrom}  
ORDER BY validUntil  

[getReassignListByTo]
SELECT objid, state, assignedFrom, assignedTo, validUntil  
FROM reassignedlgu 
WHERE assignedTo LIKE $P{assignedTo}  
ORDER BY validUntil 

[getClosedReassignList]
SELECT objid FROM reassignedlgu WHERE state = 'ACTIVE' AND DATE_ADD(validUntil, INTERVAL 1 DAY) < NOW() 





