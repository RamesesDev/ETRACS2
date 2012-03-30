[getAssessLevelById]
SELECT * FROM landassesslevel WHERE objid = $P{objid}

[getRYSetting]
SELECT * FROM planttreerysetting WHERE ry = $P{ry}

[getLatestRevisedLandFaas] 
SELECT objid, docstate, rputype, txntype, taxpayerid, ry   
FROM faaslist   
WHERE pin = $P{pin}  
  AND rputype = 'land' 
  AND docstate <> 'CANCELLED'  
  AND ry = $P{ry} 
  AND txntype = 'GR'  
  

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


  

#----------------------------------------------------------------
# Lookups by previd 
#----------------------------------------------------------------
[lookupUnitValueByPrevId]
SELECT 
	ptv.objid AS unitvalueid, ptv.code AS unitvaluecode, ptv.name AS unitvaluename, ptv.unitvalue,  
	pt.objid AS planttreeid, pt.planttreecode, pt.planttreedesc AS planttreename 
FROM planttreeunitvalue ptv, plantsandtrees pt, planttreerysetting s 
WHERE ptv.planttreeid = pt.objid  
  AND ptv.planttreerysettingid = s.objid 
  AND ptv.previd = $P{previd} 
ORDER BY ptv.code  

[lookupAssessLevelByPrevId]
SELECT * FROM landassesslevel WHERE objid = $P{objid}
  
