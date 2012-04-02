[getList]
 SELECT 
  p.objid, p.lastname, p.firstname, p.middlename, u.uid,
  j.title AS jobtitle, 
  concat(p.lastname, ', ', p.firstname, ' ', ifnull(p.middlename,'')) as name,
  concat(
    p.firstname, ' ', 
	(case ifnull(p.middlename,'') when '' then '' else concat(p.middlename, ' ') end), 
	p.lastname
  ) as formalname
 FROM personnel p
 INNER JOIN jobposition j ON j.assigneeid = p.objid
 INNER JOIN useraccount u ON u.objid = p.objid
 ORDER BY name



[findByUid]
 SELECT 
  p.objid, p.lastname, p.firstname, p.middlename, u.uid,
  j.title AS jobtitle, 
  concat(p.lastname, ', ', p.firstname, ' ', ifnull(p.middlename,'')) as name,
  concat(
    p.firstname, ' ', 
	(case ifnull(p.middlename,'') when '' then '' else concat(p.middlename, ' ') end), 
	p.lastname
  ) as formalname
 FROM personnel p
 INNER JOIN jobposition j ON j.assigneeid = p.objid
 INNER JOIN useraccount u ON u.objid = p.objid
 WHERE u.uid LIKE $P{uid}
 ORDER BY name



[findByLastName]
  SELECT 
  p.objid, p.lastname, p.firstname, p.middlename, u.uid,
  j.title AS jobtitle, 
  concat(p.lastname, ', ', p.firstname, ' ', ifnull(p.middlename,'')) as name,
  concat(
    p.firstname, ' ', 
	(case ifnull(p.middlename,'') when '' then '' else concat(p.middlename, ' ') end), 
	p.lastname
  ) as formalname
 FROM personnel p
 INNER JOIN jobposition j ON j.assigneeid = p.objid
 INNER JOIN useraccount u ON u.objid = p.objid
 WHERE p.lastname LIKE $P{lastname} 
 ORDER BY name


[findById]
  SELECT 
  p.objid, p.lastname, p.firstname, p.middlename, u.uid,
  j.title AS jobtitle, 
  concat(p.lastname, ', ', p.firstname, ' ', ifnull(p.middlename,'')) as name,
  concat(
    p.firstname, ' ', 
	(case ifnull(p.middlename,'') when '' then '' else concat(p.middlename, ' ') end), 
	p.lastname
  ) as formalname
 FROM personnel p
 INNER JOIN jobposition j ON j.assigneeid = p.objid
 INNER JOIN useraccount u ON u.objid = p.objid
 WHERE p.objid = $P{objid} 
 ORDER BY name



[getUserByTagid]
 SELECT 
  p.objid, p.lastname, p.firstname, p.middlename,
  j.title AS jobtitle, 
  concat(p.lastname, ', ', p.firstname, ' ', ifnull(p.middlename,'')) as name,
  concat(
    p.firstname, ' ', 
	(case ifnull(p.middlename,'') when '' then '' else concat(p.middlename, ' ') end), 
	p.lastname
  ) as formalname
 FROM personnel p
 INNER JOIN jobposition j ON j.assigneeid = p.objid
 WHERE p.objid = $P{objid}
   AND j.objid IN (
    SELECT jobid FROM jobposition_tag WHERE tagid = $P{tagid}
   )
 ORDER BY name
 


[getUsersByTagid]
 SELECT 
  p.objid, p.lastname, p.firstname, p.middlename,
  j.title AS jobtitle, 
  concat(p.lastname, ', ', p.firstname, ' ', ifnull(p.middlename,'')) as name,
  concat(
    p.firstname, ' ', 
	(case ifnull(p.middlename,'') when '' then '' else concat(p.middlename, ' ') end), 
	p.lastname
  ) as formalname
 FROM personnel p
 INNER JOIN jobposition j ON j.assigneeid = p.objid
 WHERE j.objid IN (
          SELECT jobid FROM jobposition_tag WHERE tagid = $P{tagid}
       )
 ORDER BY name





