[getList]
SELECT * FROM machrysetting ORDER BY ry 

[getIdByRy]
SELECT objid FROM machrysetting WHERE ry = $P{ry} 

[getListByRy]
SELECT * FROM machrysetting WHERE ry = $P{ry}

[getAssessLevel]
SELECT * FROM machassesslevel WHERE machrysettingid = $P{machrysettingid} ORDER BY code 

[getForex]
SELECT * FROM machforex WHERE machrysettingid = $P{machrysettingid} ORDER BY iyear

[getPropertyClassification]
SELECT objid as classid, propertycode as classcode, propertydesc as classname FROM propertyclassification ORDER BY orderno


[checkDuplicate]
SELECT objid 
FROM machrysetting 
WHERE objid <> $P{objid} AND ry = $P{ry} 

[deleteAssessLevel]
DELETE FROM machassesslevel WHERE machrysettingid = $P{machrysettingid} 

[deleteForex]
DELETE FROM machforex WHERE machrysettingid = $P{machrysettingid} 


