[getLgusByParentid]
SELECT * FROM provlgu WHERE parentid = $P{parentid} ORDER BY indexno 



[checkExists]
SELECT objid FROM provlgu WHERE lgutype = 'PROVINCE' 



[deleteLguByParentId]
DELETE FROM provlgu WHERE parentid = $P{parentid}

[deleteLguById]
DELETE FROM provlgu WHERE objid = $P{objid}

