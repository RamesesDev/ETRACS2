[getCurrentRYSettingInfo]
SELECT predominant, depreciatecoreanditemseparately, computedepreciationbasedonschedule 
FROM bldgrysetting WHERE ry = $P{ry} 

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


