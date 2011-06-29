[getAssessLevelById]
SELECT * FROM landassesslevel WHERE objid = $P{objid}

[getRYSetting]
SELECT * FROM planttreerysetting WHERE ry = $P{ry}

#----------------------------------------------------------------
# Lookups
#----------------------------------------------------------------
[lookupUnitValue]
SELECT 
	ptv.objid AS unitvalueid, ptv.code AS unitvaluecode, ptv.name AS unitvaluename, ptv.unitvalue,  
	pt.objid AS planttreeid, pt.planttreecode, pt.planttreedesc AS planttreename 
FROM planttreeunitvalue ptv, plantsandtrees pt, planttreerysetting s 
WHERE ptv.planttreeid = pt.objid  
  AND ptv.planttreerysettingid = s.objid 
  AND s.ry = $P{ry} 
ORDER BY ptv.code  



[lookupUnitValueByCode]
SELECT 
	ptv.objid AS unitvalueid, ptv.code AS unitvaluecode, ptv.name AS unitvaluename, ptv.unitvalue, 
	pt.objid AS planttreeid, pt.planttreecode, pt.planttreedesc AS planttreename 
FROM planttreeunitvalue ptv, plantsandtrees pt, planttreerysetting s 
WHERE ptv.planttreeid = pt.objid  
  AND ptv.planttreerysettingid = s.objid 
  AND s.ry = $P{ry} 
  AND ptv.code LIKE $P{code} 
ORDER BY ptv.code   


  