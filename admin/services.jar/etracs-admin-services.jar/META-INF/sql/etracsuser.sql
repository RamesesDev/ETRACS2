[getList]
SELECT u.objid, u.uid, u.lastname, u.firstname, eu.jobtitle 
FROM user u, etracsuser eu 
WHERE u.objid = eu.objid 

[findByUid]
SELECT u.objid, u.uid, u.lastname, u.firstname, eu.jobtitle 
FROM user u, etracsuser eu 
WHERE u.objid = eu.objid 
  AND u.uid LIKE $P{uid}

[findByLastName]
SELECT u.objid, u.uid, u.lastname, u.firstname, eu.jobtitle 
FROM user u, etracsuser eu 
WHERE u.objid = eu.objid 
  AND u.lastname LIKE $P{lastname} 

[getUserInfo]
SELECT 
	CONCAT(u.firstname, ' ', u.lastname) AS name,  
	eu.jobtitle 
FROM user u, etracsuser eu  
WHERE u.objid = eu.objid  
  AND u.objid = $P{objid}  


[insertUser]
INSERT INTO etracsuser (objid, uid) VALUES( $P{objid}, $P{uid} ) 


[updateJobTitle]
UPDATE etracsuser SET jobtitle = $P{jobtitle} WHERE objid = $P{objid} 

