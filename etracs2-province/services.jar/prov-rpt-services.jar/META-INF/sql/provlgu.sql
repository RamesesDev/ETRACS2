[getLgusByParentid]
SELECT * FROM provlgu WHERE parentid = $P{parentid} ORDER BY indexno 

[lookupMunicipaltyByName]
SELECT * FROM provlgu WHERE lgutype = 'MUNICIPALITY' AND name LIKE $P{name}

[lookupMunicipaltyByIndex]
SELECT * FROM provlgu WHERE lgutype = 'MUNICIPALITY' AND indexno LIKE $P{indexno}


[checkExists]
SELECT objid FROM provlgu WHERE lgutype = 'PROVINCE' 



[deleteLguByParentId]
DELETE FROM provlgu WHERE parentid = $P{parentid}

[deleteLguById]
DELETE FROM provlgu WHERE objid = $P{objid}

