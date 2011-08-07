[getList]
SELECT * FROM bldgrysetting

[getIdByRy]
SELECT objid FROM bldgrysetting WHERE ry = $P{ry} 

[getListByRy]
SELECT * FROM bldgrysetting WHERE ry = $P{ry}

[getAssessLevel]
SELECT * FROM bldgassesslevel WHERE bldgrysettingid = $P{bldgrysettingid} ORDER BY code 

[getAdditionalItem]
SELECT * FROM bldgadditionalitem WHERE bldgrysettingid = $P{bldgrysettingid} ORDER BY code 

[getBldgType]
SELECT * FROM bldgtype WHERE bldgrysettingid = $P{bldgrysettingid} ORDER BY code 

[getBldgKindBucc]
SELECT * FROM bldgkindbucc WHERE bldgtypeid = $P{bldgtypeid} ORDER BY bldgkindcode 

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

[getPropertyClassifications] 
SELECT * FROM propertyclassification 

