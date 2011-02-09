[getList]
SELECT u.objid, u.uid, u.lastname, u.firstname, eu.jobtitle 
FROM user u, etracsuser eu 
WHERE u.objid = eu.objid 
ORDER BY u.uid

[findByUid]
SELECT u.objid, u.uid, u.lastname, u.firstname, eu.jobtitle 
FROM user u, etracsuser eu 
WHERE u.objid = eu.objid 
  AND u.uid LIKE $P{uid}
ORDER BY u.uid  

[findByLastName]
SELECT u.objid, u.uid, u.lastname, u.firstname, eu.jobtitle 
FROM user u, etracsuser eu 
WHERE u.objid = eu.objid 
  AND u.lastname LIKE $P{lastname} 
ORDER BY u.uid  

[getUserInfo]
SELECT 
	CONCAT(u.firstname, ' ', u.lastname) AS name,  
	eu.jobtitle 
FROM user u, etracsuser eu  
WHERE u.objid = eu.objid  
  AND u.objid = $P{objid}  
ORDER BY u.uid  


[insertUser]
INSERT INTO etracsuser (objid, uid) VALUES( $P{objid}, $P{uid} ) 


[updateJobTitle]
UPDATE etracsuser SET jobtitle = $P{jobtitle} WHERE objid = $P{objid} 


#-------------------------------------------------
# EXAMINER SUPPORT 
#-------------------------------------------------
[getExaminerList]
SELECT u.objid, u.uid, u.lastname, u.firstname, eu.jobtitle 
FROM user u, etracsuser eu, examiner ex  
WHERE u.objid = eu.objid 
  AND u.objid = ex.objid 
ORDER BY u.uid  

[findExaminerByUid]
SELECT u.objid, u.uid, u.lastname, u.firstname, eu.jobtitle 
FROM user u, etracsuser eu, examiner ex  
WHERE u.objid = eu.objid 
  AND u.objid = ex.objid 
  AND u.uid LIKE $P{uid}
ORDER BY u.uid  

[findExaminerByLastName]
SELECT u.objid, u.uid, u.lastname, u.firstname, eu.jobtitle 
FROM user u, etracsuser eu, examiner ex  
WHERE u.objid = eu.objid 
  AND u.objid = ex.objid 
  AND u.lastname LIKE $P{lastname} 
ORDER BY u.uid  


