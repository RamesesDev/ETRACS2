[getCurrentRYSettingInfo]
SELECT predominant, depreciatecoreanditemseparately, computedepreciationbasedonschedule 
FROM bldgrysetting WHERE ry = $P{ry} 

[lookupActualUseByCode]
SELECT  
	bl.objid AS actualuseid, bl.code AS actualusecode, bl.name AS actualusename, 
	bl.fixrate, bl.rate, bl.ranges 
FROM machrysetting s, machassesslevel bl 
WHERE s.objid = bl.machrysettingid 
  AND s.ry = $P{ry} AND bl.code LIKE $P{code} 

[getForex]  
SELECT mf.objid, mf.forex 
FROM machrysetting s, machforex mf 
WHERE s.objid = mf.machrysettingid 
  AND s.ry = $P{ry}
  AND mf.iyear = $P{iyear}

  
def getRPTSetting() {
	return em.sqlContext.createNamedQuery('bldgrpu:getRPTSetting').singleResult 
}

boolean IS_TRUE( value ) {
	return TO_BOOLEAN( value ) == true 
}

boolean TO_BOOLEAN( value ) {
	if( value instanceof Boolean ) return value 
	return '1/y/yes/true/t'.indexOf( value.toString().toLowerCase() ) >= 0
}