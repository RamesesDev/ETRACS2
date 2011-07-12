[getAssessLevelById]
SELECT * FROM miscassesslevel WHERE objid = $P{objid}

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
