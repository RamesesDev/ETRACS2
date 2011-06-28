[getList]
SELECT * FROM rptofficers ORDER BY lastname, firstname, middlename

[getListByLastName]
SELECT * FROM rptofficers WHERE lastname LIKE $P{lastname} ORDER BY lastname, firstname, middlename

[getListByFirstName]
SELECT * FROM rptofficers WHERE firstname LIKE $P{firstname} ORDER BY lastname, firstname, middlename

[getListByPosition]
SELECT * FROM rptofficers WHERE position LIKE $P{position} ORDER BY lastname, firstname, middlename

[getListByType]
SELECT * FROM rptofficers WHERE officertype LIKE $P{officertype} ORDER BY lastname, firstname, middlename

[getById]
SELECT * FROM rptofficers WHERE objid = $P{objid}

[checkDuplicateName]
SELECT COUNT(*) AS count FROM rptofficers WHERE fullname = $P{fullname}


#------------------------------------------------------
# lookup support
#------------------------------------------------------
[lookupList]
SELECT objid, fullname AS name, position AS title FROM rptofficers WHERE officertype = $P{officertype} ORDER BY lastname, firstname, middlename

[lookupListByLastName]
SELECT objid, fullname AS name, position AS title FROM rptofficers WHERE lastname LIKE $P{lastname} AND officertype = $P{officertype} ORDER BY lastname, firstname, middlename

[lookupListByFirstName]
SELECT objid, fullname AS name, position AS title FROM rptofficers WHERE firstname LIKE $P{firstname} AND officertype = $P{officertype} ORDER BY lastname, firstname, middlename

