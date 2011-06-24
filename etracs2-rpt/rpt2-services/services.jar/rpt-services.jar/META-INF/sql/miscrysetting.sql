[getList]
SELECT * FROM miscrysetting ORDER BY ry 

[getListByRy]
SELECT * FROM miscrysetting WHERE ry = $P{ry}

[getAssessLevel]
SELECT * FROM miscassesslevel WHERE miscrysettingid = $P{miscrysettingid} ORDER BY code 

[getMiscItemValue]
SELECT * FROM miscitemvalue WHERE miscrysettingid = $P{miscrysettingid} ORDER BY miscitemcode 

[getMiscItem]
SELECT objid AS miscitemid, misccode AS miscitemcode, miscdesc AS miscitemname  FROM miscitems


[checkDuplicate]
SELECT objid 
FROM miscrysetting 
WHERE objid <> $P{objid} AND ry = $P{ry} 

[deleteAssessLevel]
DELETE FROM miscassesslevel WHERE miscrysettingid = $P{miscrysettingid} 

[deleteAllMiscItemValue]
DELETE FROM miscitemvalue WHERE miscrysettingid = $P{miscrysettingid} 


