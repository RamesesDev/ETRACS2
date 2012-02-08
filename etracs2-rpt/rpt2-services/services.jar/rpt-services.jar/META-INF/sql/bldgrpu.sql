[getCurrentRYSettingInfo]
SELECT predominant, depreciatecoreanditemseparately, computedepreciationbasedonschedule 
FROM bldgrysetting WHERE ry = $P{ry} 

[getRPTSetting]
SELECT * FROM rptsetting 

[getStructures]
SELECT  objid AS structureid, structurecode, structuredesc AS structurename FROM structures  ORDER BY structuredesc 



[getLatestRevisedLandFaas] 
SELECT objid, docstate, rputype, txntype, taxpayerid, ry   
FROM faaslist   
WHERE pin = $P{pin}  
  AND rputype = 'land' 
  AND docstate <> 'CANCELLED'  
  AND ry = $P{ry} 
  AND txntype = 'GR'  
  

[lookupBldgTypeByCode]
SELECT 
    bt.objid AS bldgtypeid, bt.code AS bldgtypecode, bt.name AS bldgtypename, 
    bt.depreciations, bt.multistoreyadjustments, bt.basevaluetype, bt.residualrate, 
    s.predominant, s.depreciatecoreanditemseparately, s.computedepreciationbasedonschedule 
FROM bldgrysetting s, bldgtype bt  
WHERE s.objid = bt.bldgrysettingid  
 AND s.ry = $P{ry} AND bt.code LIKE $P{code}   
 
 
[lookupBldgKindByCode] 
SELECT 
	bk.objid AS bldgkindbuccid, 
	bk.bldgkindid, bk.bldgkindcode, bk.bldgkindname, 
	bk.basevaluetype, bk.basevalue, bk.minbasevalue, bk.maxbasevalue, 
	bk.gapvalue, bk.minarea, bk.maxarea 
FROM bldgkindbucc bk 
WHERE bk.bldgtypeid = $P{bldgtypeid} AND bk.bldgkindcode LIKE $P{code} 

[lookupActualUseByCode]
SELECT  
	bl.objid AS actualuseid, bl.code AS actualusecode, bl.name AS actualusename, 
	bl.fixrate, bl.rate, bl.ranges 
FROM bldgrysetting s, bldgassesslevel bl 
WHERE s.objid = bl.bldgrysettingid 
  AND s.ry = $P{ry} AND bl.code LIKE $P{code} 

[lookupAdditionalItem]  
SELECT 
    bi.objid AS addlitemid, 
    bi.code AS addlitemcode, 
    bi.name AS addlitemname, 
    bi.unit AS addlitemunit, 
    bi.expr   
FROM bldgrysetting s, bldgadditionalitem bi 
WHERE s.objid = bi.bldgrysettingid  
  AND s.ry = $P{ry} AND bi.code LIKE $P{code} 



  
[getBldgTypeByPrevID]
SELECT 
    bt.objid AS bldgtypeid, bt.code AS bldgtypecode, bt.name AS bldgtypename, 
    bt.depreciations, bt.multistoreyadjustments, bt.basevaluetype, bt.residualrate, 
    s.predominant, s.depreciatecoreanditemseparately, s.computedepreciationbasedonschedule 
FROM bldgrysetting s, bldgtype bt  
WHERE s.objid = bt.bldgrysettingid  
 AND bt.previd = $P{previd} 
 
 
[getBldgKindBuccByPrevId] 
SELECT 
	bk.objid AS bldgkindbuccid, 
	bk.bldgkindid, bk.bldgkindcode, bk.bldgkindname, 
	bk.basevaluetype, bk.basevalue, bk.minbasevalue, bk.maxbasevalue, 
	bk.gapvalue, bk.minarea, bk.maxarea 
FROM bldgkindbucc bk 
WHERE bk.previd = $P{previd} 

[getActualUseByPrevID]
SELECT  
	bl.objid AS actualuseid, bl.code AS actualusecode, bl.name AS actualusename, 
	bl.fixrate, bl.rate, bl.ranges 
FROM bldgrysetting s, bldgassesslevel bl 
WHERE s.objid = bl.bldgrysettingid 
  AND bl.previd = $P{previd} 

[getAdditionalItemByPrevId]  
SELECT 
    bi.objid AS addlitemid, 
    bi.code AS addlitemcode, 
    bi.name AS addlitemname, 
    bi.unit AS addlitemunit, 
    bi.expr   
FROM bldgrysetting s, bldgadditionalitem bi 
WHERE s.objid = bi.bldgrysettingid  
  AND bi.previd = $P{previd} 
  


  
