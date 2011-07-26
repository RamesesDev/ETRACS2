[getSubdividedLandAreaSqm]
SELECT SUM(areasqm) AS totalareasqm FROM subdivisionland WHERE subdivisionid = $P{subdivisionid} 

#--------------------------------------------------------------------
# LIstings
#--------------------------------------------------------------------
[getList]
SELECT * FROM subdivision ORDER BY mothertdno 

[getListByTdno]
SELECT * FROM subdivision WHERE mothertdno = $P{mothertdno} ORDER BY mothertdno 

[getListByPIN]
SELECT * FROM subdivision WHERE motherpin = $P{motherpin} ORDER BY mothertdno 

[getListByCadastral]
SELECT * FROM subdivision WHERE mothercadastrallotno = $P{mothercadastrallotno} ORDER BY mothertdno 

[getListByTaxpayer]
SELECT * FROM subdivision WHERE mothertaxpayername LIKE $P{taxpayername} ORDER BY mothertdno 



[getAffectedRpusByLandId]
SELECT * FROM subdivisionaffectedrpu 
WHERE subdivisionid = $P{subdivisionid} AND subdivisionlandid = $P{subdivisionlandid} 


[getSubdividedLandIds]
SELECT objid, newfaasid  FROM subdivisionland WHERE subdivisionid = $P{subdivisionid}  ORDER BY newpin 

[getAffectedRpuIds]
SELECT objid, newfaasid  FROM subdivisionaffectedrpu WHERE subdivisionid = $P{subdivisionid}  ORDER BY newpin 

[getSubdividedLandTdNo]
SELECT newtdno FROM subdivisionland WHERE subdivisionid = $P{subdivisionid} 

[getCurrentRy]
SELECT ry FROM rptsetting 


[getSubdividedLands]
SELECT *  FROM subdivisionland WHERE subdivisionid = $P{subdivisionid} ORDER BY newtdno 

[getAffectedRpus]
SELECT *  FROM subdivisionaffectedrpu WHERE subdivisionid = $P{subdivisionid}  ORDER BY rputype, prevfullpin 


[getImprovementIds]
SELECT objid FROM faaslist WHERE landfaasid = $P{landfaasid} AND docstate <> 'CANCELLED' AND rputype <> 'land' 


[getImprovementStates] 
SELECT f.tdno, f.docstate  
FROM faaslist f, subdivisionaffectedrpu r  
WHERE f.objid = r.prevfaasid  
  AND f.docstate NOT IN ('CURRENT', 'CANCELLED')  
  AND r.subdivisionid = $P{subdivisionid} 

[getAffectedRpuUnapprovedLedgers]  
SELECT rl.tdno, rl.docstate 
FROM subdivisionaffectedrpu r, rptledger rl 
WHERE r.prevfaasid = rl.faasid  
  AND rl.docstate NOT IN ('APPROVED')  
  AND r.subdivisionid = $P{subdivisionid} 

  
[getAffectedRpuNewPin]  
SELECT newpin FROM subdivisionland WHERE objid = $P{objid} 

  
#--------------------------------------------------------------------
# UPDATES
#--------------------------------------------------------------------
[cancelMotherLandLedger]
UPDATE rptledger SET docstate = 'CANCELLED' WHERE faasid = $P{faasid} 


#--------------------------------------------------------------------
# DELETES
#--------------------------------------------------------------------
[deleteAffectedRpus]
DELETE FROM subdivisionaffectedrpu WHERE subdivisionid = $P{subdivisionid} 

[deleteSubdividedLands]
DELETE FROM subdivisionland WHERE subdivisionid = $P{subdivisionid} 


[deleteSubdivision]
DELETE FROM subdivision WHERE objid = $P{objid}


[deleteSubdividedLand]
DELETE FROM subdivisionland WHERE objid = $P{objid} 




