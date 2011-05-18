[getList]
SELECT 
	u.objid, u.uid, u.lastname, u.firstname, eu.middlename, eu.jobtitle, 
	CONCAT(u.firstname, ' ', IFNULL(eu.middlename,''), CASE WHEN eu.middlename IS NULL THEN '' ELSE ' ' END, u.lastname) AS name 
FROM user u
	LEFT JOIN etracsuser eu ON u.objid = eu.objid 
ORDER BY  u.lastname, u.firstname, eu.middlename 

[findByUid]
SELECT 
	u.objid, u.uid, u.lastname, u.firstname, eu.middlename, eu.jobtitle,  
	CONCAT(u.firstname, ' ', IFNULL(eu.middlename,''), CASE WHEN eu.middlename IS NULL THEN '' ELSE ' ' END, u.lastname) AS name 
FROM user u
	LEFT JOIN etracsuser eu ON u.objid = eu.objid 
WHERE u.uid LIKE $P{uid}
ORDER BY  u.lastname, u.firstname, eu.middlename 

[findByLastName]
SELECT 
	u.objid, u.uid, u.lastname, u.firstname, eu.middlename, eu.jobtitle, 
	CONCAT(u.firstname, ' ', IFNULL(eu.middlename,''), CASE WHEN eu.middlename IS NULL THEN '' ELSE ' ' END, u.lastname) AS name 
FROM user u
	LEFT JOIN etracsuser eu ON u.objid = eu.objid 
WHERE u.lastname LIKE $P{lastname} 
ORDER BY u.lastname, u.firstname, eu.middlename 

[getUserInfo]
SELECT 
	CONCAT(u.firstname, ' ', IFNULL(eu.middlename,''), CASE WHEN eu.middlename IS NULL THEN '' ELSE ' ' END, u.lastname) AS name,  
	eu.jobtitle 
FROM user u
	LEFT JOIN etracsuser eu ON u.objid = eu.objid 
WHERE u.objid = $P{objid}  
ORDER BY  u.lastname, u.firstname, eu.middlename 


[insertUser]
INSERT INTO etracsuser (objid, uid) VALUES( $P{objid}, $P{uid} ) 


[updateInfo]
UPDATE etracsuser SET middlename = $P{middlename}, jobtitle = $P{jobtitle} WHERE objid = $P{objid} 


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


