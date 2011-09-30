[getAssessLevelById]
SELECT * FROM landassesslevel WHERE objid = $P{objid}

[getRPTSetting]
SELECT * FROM rptsetting 

#----------------------------------------------------------------
# Lookups
#----------------------------------------------------------------
[lookupSubclass]
SELECT 
	s.objid AS subclassid, s.subclasscode, s.subclassname, s.specificclassid, s.unitvalue AS basevalue, 
	sp.classcode AS specificclasscode, sp.classname AS specificclassname, sp.lcuvid AS actualuseid, sp.areatype, 
	l.classcode AS actualusecode, l.classname AS actualusename 
FROM lcuvsubclass s, lcuvspecificclass sp, lcuv l, landrysetting ls 
WHERE s.specificclassid = sp.objid  
  AND sp.lcuvid = l.objid 
  AND l.landrysettingid = ls.objid 
  AND ls.ry = $P{ry} 
  AND s.subclasscode LIKE $P{subclasscode}  
ORDER BY s.subclasscode   
  
  
[lookupAssessLevel]  
SELECT 
	l.objid AS assesslevelid, l.classcode AS assesslevelcode, l.classname AS assesslevelname  
FROM landassesslevel l, landrysetting ls  
WHERE l.landrysettingid = ls.objid  
  AND ls.ry = $P{ry}  
  AND l.classcode LIKE $P{classcode} 
ORDER BY classcode  

	
    
[lookupStripping] 
SELECT s.objid AS strippingid, s.striplevel, s.rate AS striprate 
FROM lcuvstripping s, lcuv l, landrysetting ls 
WHERE s.lcuvid = l.objid    
  AND l.landrysettingid = ls.objid 
  AND ls.ry = $P{ry} 
  AND s.lcuvid = $P{actualuseid}     
  AND s.striplevel = $P{striplevel}   
ORDER BY striplevel 

[lookupAdjType]
SELECT la.objid AS adjtypeid, la.adjustmentcode AS adjtypecode, la.adjustmentname AS adjtypename, la.expression AS expr 
FROM landadjustment la, landrysetting ls 
WHERE la.landrysettingid = ls.objid   
  AND ls.ry = $P{ry}  
  AND la.adjustmentcode LIKE $P{code}  
  AND la.classids LIKE $P{classid} 
ORDER BY la.adjustmentcode   
    