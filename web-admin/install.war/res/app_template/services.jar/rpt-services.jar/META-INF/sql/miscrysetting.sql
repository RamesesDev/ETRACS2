[getList]
SELECT * FROM miscrysetting ORDER BY ry 

[getIdByRy]
SELECT objid FROM miscrysetting WHERE ry = $P{ry} 

[getListByRy]
SELECT * FROM miscrysetting WHERE ry = $P{ry}

[getAssessLevel]
SELECT * FROM miscassesslevel WHERE miscrysettingid = $P{miscrysettingid} ORDER BY code 

[getMiscItemValue]
SELECT * FROM miscitemvalue WHERE miscrysettingid = $P{miscrysettingid} ORDER BY miscitemcode 

[getMiscItem]
SELECT objid AS miscitemid, misccode AS miscitemcode, miscdesc AS miscitemname  FROM miscitems

[getPropertyClassification]
SELECT objid as classid, propertycode as classcode, propertydesc as classname FROM propertyclassification ORDER BY orderno



[checkDuplicate]
SELECT objid 
FROM miscrysetting 
WHERE objid <> $P{objid} AND ry = $P{ry} 

[deleteAssessLevel]
DELETE FROM miscassesslevel WHERE miscrysettingid = $P{miscrysettingid} 

[deleteAllMiscItemValue]
DELETE FROM miscitemvalue WHERE miscrysettingid = $P{miscrysettingid} 


