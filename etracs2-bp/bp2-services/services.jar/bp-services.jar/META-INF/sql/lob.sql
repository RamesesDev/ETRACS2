[getList]
SELECT * FROM lob ORDER BY name  

[getListByName]
SELECT * FROM lob WHERE name LIKE $P{name} ORDER BY name 

[getApprovedList]
SELECT * FROM lob WHERE docstate = 'APPROVED' ORDER BY name  

[getApprovedListByName]
SELECT * FROM lob WHERE name LIKE $P{name} and docstate = 'APPROVED'  ORDER BY name 

[lookup]
SELECT objid, name, classificationid FROM lob WHERE docstate = 'APPROVED' ORDER BY name  

[lookupByName]
SELECT objid, name, classificationid FROM lob WHERE name LIKE $P{name} and docstate = 'APPROVED'  ORDER BY name 

[checkDuplicateName]
SELECT * FROM lob WHERE objid <> $P{objid} AND name = $P{name}

[getAttributes]
SELECT * FROM lobattribute WHERE name LIKE $P{name} 

[getLobInUsed]
SELECT lobid  FROM bploblisting WHERE lobid = $P{objid}


