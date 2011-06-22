[getList]
SELECT * FROM bldgrysetting

[getListByRy]
SELECT * FROM bldgrysetting WHERE ry = $P{ry}

[getAssessLevel]
SELECT * FROM bldgassesslevel WHERE bldgrysettingid = $P{bldgrysettingid} 

[checkDuplicate]
SELECT objid 
FROM bldgrysetting 
WHERE objid <> $P{objid} AND ry = $P{ry} 

[deleteAssessLevel]
DELETE FROM bldgassesslevel WHERE bldgrysettingid = $P{objid} 

[deleteAdditionalItem]
DELETE FROM bldgadditionalitem WHERE bldgrysettingid = $P{objid} 

[deleteBldgKindBucc]
DELETE FROM bldgkindbucc WHERE bldgrysettingid = $P{objid} 

[deleteBldgType]
DELETE FROM bldgtype WHERE bldgrysettingid = $P{objid} 

