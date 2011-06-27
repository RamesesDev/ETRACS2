[getList]
SELECT * FROM landrysetting

[getListByRy]
SELECT * FROM landrysetting WHERE ry = $P{ry}

[getPropertyClassification]
SELECT objid as classid, propertycode as classcode, propertydesc as classname FROM propertyclassification

[getAssessLevel]
SELECT * FROM landassesslevel WHERE landrysettingid = $P{landrysettingid} 

[getLCUV]
SELECT * FROM lcuv WHERE landrysettingid = $P{landrysettingid} ORDER BY classname

[getLCUVSpecificClass]
SELECT * FROM lcuvspecificclass WHERE lcuvid = $P{lcuvid} ORDER BY classcode, classname

[getLCUVSubClass]
SELECT * FROM lcuvsubclass WHERE specificclassid = $P{specificclassid} ORDER BY subclasscode, subclassname

[getLCUVStripping]
SELECT * FROM lcuvstripping WHERE lcuvid = $P{lcuvid} ORDER BY striplevel

[getLandAdjustment]
SELECT * FROM landadjustment WHERE landrysettingid = $P{landrysettingid} ORDER BY adjustmentcode, adjustmentname

[getLandActualUseAdjustment]
SELECT * FROM landactualuseadjustment WHERE landrysettingid = $P{landrysettingid} ORDER BY adjustmentcode, adjustmentname

[checkDuplicate]
SELECT objid 
FROM landrysetting 
WHERE objid <> $P{objid} AND ry = $P{ry} 

[deleteRYSetting]
DELETE FROM landrysetting WHERE objid = $P{objid}

[deleteAssessLevel]
DELETE FROM landassesslevel WHERE landrysettingid = $P{objid} 

[deleteLCUV]
DELETE FROM lcuv WHERE landrysettingid = $P{objid} 

[deleteLCUVSpecificClass]
DELETE FROM lcuvspecificclass WHERE landrysettingid = $P{objid} 

[deleteLCUVSubClass]
DELETE FROM lcuvsubclass WHERE landrysettingid = $P{objid} 

[deleteLCUVStripping]
DELETE FROM lcuvstripping WHERE landrysettingid = $P{objid} 

[deleteLandAdjustment]
DELETE FROM landadjustment WHERE landrysettingid = $P{objid} 

[deleteLandActualUseAdjustment]
DELETE FROM landactualuseadjustment WHERE landrysettingid = $P{objid} 
