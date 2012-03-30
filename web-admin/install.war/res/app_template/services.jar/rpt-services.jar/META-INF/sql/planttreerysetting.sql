[getList]
SELECT * FROM planttreerysetting ORDER BY ry 

[getIdByRy]
SELECT objid FROM planttreerysetting WHERE ry = $P{ry} 

[getListByRy]
SELECT * FROM planttreerysetting WHERE ry = $P{ry} 

[geUnitValue]
SELECT * FROM planttreeunitvalue WHERE planttreeid = $P{planttreeid} ORDER BY code 

[geUnitValueByRysetting]
SELECT * FROM planttreeunitvalue 
WHERE planttreeid = $P{planttreeid} 
  AND planttreerysettingid = $P{rysettingid} 
ORDER BY code 

[getPlantTree]
SELECT objid AS planttreeid, planttreecode, planttreedesc AS planttreename FROM plantsandtrees ORDER BY planttreecode 

[checkDuplicate]
SELECT objid 
FROM planttreerysetting 
WHERE objid <> $P{objid} AND ry = $P{ry} 

[deleteUnitValues]
DELETE FROM planttreeunitvalue WHERE planttreerysettingid = $P{planttreerysettingid} 

[getTreeUnitValues]
SELECT * FROM planttreeunitvalue WHERE planttreerysettingid = $P{rysettingid} 




