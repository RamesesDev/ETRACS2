[getList]
SELECT * FROM machrysetting ORDER BY ry 

[getListByRy]
SELECT * FROM machrysetting WHERE ry = $P{ry}

[getAssessLevel]
SELECT * FROM machassesslevel WHERE machrysettingid = $P{machrysettingid} ORDER BY code 

[getForex]
SELECT * FROM machforex WHERE machrysettingid = $P{machrysettingid} ORDER BY iyear


[checkDuplicate]
SELECT objid 
FROM machrysetting 
WHERE objid <> $P{objid} AND ry = $P{ry} 

[deleteAssessLevel]
DELETE FROM machassesslevel WHERE machrysettingid = $P{machrysettingid} 

[deleteForex]
DELETE FROM machforex WHERE machrysettingid = $P{machrysettingid} 


