[getList]
SELECT * FROM etracsuser u 
ORDER BY u.uid

[findByUid]
SELECT * FROM etracsuser u 
WHERE u.uid LIKE $P{uid}
ORDER BY u.uid  

[findByLastName]
SELECT * FROM etracsuser u 
WHERE u.lastname LIKE $P{lastname} 
ORDER BY u.uid  

[getUserInfo]
SELECT 
	name,
	formalname, 
	u.jobtitle 
FROM etracsuser u 
WHERE u.objid = $P{objid}  
ORDER BY u.uid  

[getUserRoles]
SELECT role FROM user_role WHERE userid = $P{userid} 


[getLiquidatingOfficers]
SELECT * FROM etracsuser WHERE isliquidating = 1 ORDER BY name 

[getLiquidatingOfficer]
SELECT * FROM etracsuser WHERE objid = $P{objid} AND isliquidating = 1 

[getCollectors]
SELECT * FROM etracsuser WHERE iscollector = 1 ORDER BY name 

[getCollector]
SELECT * FROM etracsuser WHERE objid = $P{objid} AND iscollector = 1 


#-------------------------------------------------
# EXAMINER SUPPORT 
#-------------------------------------------------
[getExaminerList]
SELECT u.objid, u.uid, u.lastname, u.firstname, u.jobtitle 
FROM etracsuser u, examiner ex  
WHERE u.objid = ex.objid 
ORDER BY u.uid  

[findExaminerByUid]
SELECT u.objid, u.uid, u.lastname, u.firstname, u.jobtitle 
FROM etracsuser u, examiner ex  
WHERE u.objid = ex.objid 
  AND u.uid LIKE $P{uid}
ORDER BY u.uid  

[findExaminerByLastName]
SELECT u.objid, u.uid, u.lastname, u.firstname, u.jobtitle 
FROM etracsuser u, examiner ex  
WHERE u.objid = ex.objid 
  AND u.lastname LIKE $P{lastname} 
ORDER BY u.uid  


