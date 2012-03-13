[getList]
SELECT * FROM etracsuser u 
ORDER BY u.name

[findByUid]
SELECT * FROM etracsuser u 
WHERE u.uid LIKE $P{uid}
ORDER BY u.name

[findByLastName]
SELECT * FROM etracsuser u 
WHERE u.lastname LIKE $P{lastname} 
ORDER BY u.name

[findById]
SELECT * FROM etracsuser u  
WHERE u.objid = $P{objid} 

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

[getUserByRole]
 SELECT 
  p.objid, p.lastname, p.firstname, p.middlename,
  j.title AS jobtitle, 
  concat(p.lastname, ', ', p.firstname, ' ', ifnull(p.middlename,'')) as name,
  concat(
    p.firstname, ' ', 
	(case ifnull(middlename,'') when '' then '' else concat(middlename, ' ') end), 
	p.lastname
  ) as formalname
 FROM personnel p, jobposition j
 WHERE j.assigneeid = p.objid
  AND j.assigneeid = $P{objid}
  AND j.objid IN (
    SELECT jobid FROM jobposition_tag WHERE tagid = $P{tagid}
  )



[getUsersByRole]
 SELECT 
  p.objid, p.lastname, p.firstname, p.middlename,
  j.title AS jobtitle, 
  concat(p.lastname, ', ', p.firstname, ' ', ifnull(p.middlename,'')) as name,
  concat(
    p.firstname, ' ', 
	(case ifnull(middlename,'') when '' then '' else concat(middlename, ' ') end), 
	p.lastname
  ) as formalname
 FROM personnel p, jobposition j
 WHERE j.assigneeid = p.objid
   AND j.objid IN (
     SELECT jobid FROM jobposition_tag WHERE tagid = $P{tagid}
   )



[getLiquidatingOfficers]
SELECT * FROM etracsuser WHERE isliquidating = 1 ORDER BY name 

[getLiquidatingOfficer]
SELECT * FROM etracsuser WHERE objid = $P{objid} AND isliquidating = 1 

[getCollectors]
SELECT * FROM etracsuser WHERE iscollector = 1 ORDER BY name 

[getCollectorsByLqOfficerId]
SELECT * FROM etracsuser WHERE lqofficerid = $P{lqofficerid} 

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


[getCashierList]
SELECT DISTINCT u.objid, u.formalname AS cashiername, u.jobtitle AS cashiertitle 
FROM etracsuser u, user_role ur  
WHERE u.objid = ur.userid  
  AND ur.role = 'CASHIER' 
ORDER BY u.formalname   

[getCashierListByName]
SELECT DISTINCT u.objid, u.formalname AS cashiername, u.jobtitle AS cashiertitle 
FROM etracsuser u, user_role ur  
WHERE u.objid = ur.userid  
  AND ur.role = 'CASHIER' 
  AND u.name LIKE $P{name} 
ORDER BY u.formalname   
