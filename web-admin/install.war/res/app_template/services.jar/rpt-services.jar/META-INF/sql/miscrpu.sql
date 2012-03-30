[getAssessLevelById]
SELECT * FROM miscassesslevel WHERE objid = $P{objid}

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
  
[lookupAssessLevel]  
SELECT 
	l.objid AS assesslevelid, l.code AS assesslevelcode, l.name AS assesslevelname  
FROM miscassesslevel l, miscrysetting ms  
WHERE l.miscrysettingid = ms.objid  
  AND ms.ry = $P{ry}  
ORDER BY code  

[lookupMiscItems]
SELECT 
	m.objid, m.miscitemid, m.miscitemcode, m.miscitemname, m.expr  
FROM miscitemvalue m, miscrysetting ms  
WHERE m.miscrysettingid = ms.objid  
  AND ms.ry = $P{ry}  
  AND m.miscitemcode LIKE $P{miscitemcode}  
ORDER BY miscitemcode


  
[getActualUseByPrevId]  
SELECT 
	l.objid AS actualuseid, l.code AS actualusecode, l.name AS actualusename   
FROM miscassesslevel l, miscrysetting ms  
WHERE l.miscrysettingid = ms.objid  
  AND l.previd = $P{previd} 
ORDER BY code  

[getAssessLevelByPrevId]  
SELECT 
	l.objid AS assesslevelid, l.code AS assesslevelcode, l.name AS assesslevelname  
FROM miscassesslevel l, miscrysetting ms  
WHERE l.miscrysettingid = ms.objid  
  AND l.previd = $P{previd} 
ORDER BY code  

[getMiscItemByPrevId]
SELECT 
	m.objid, m.miscitemid, m.miscitemcode, m.miscitemname, m.expr  
FROM miscitemvalue m, miscrysetting ms  
WHERE m.miscrysettingid = ms.objid  
  AND m.previd = $P{previd} 
ORDER BY miscitemcode
