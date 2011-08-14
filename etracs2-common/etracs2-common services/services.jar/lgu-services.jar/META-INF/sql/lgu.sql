[getList]
SELECT * FROM lgu

[getList]
SELECT * FROM lgu WHERE parentid IS NULL 

[getParent]
SELECT * FROM lgu WHERE parentid IS NULL 

[getLgusByType]
SELECT * FROM lgu WHERE lgutype = $P{lgutype} 

[getLgusByParent]
SELECT * FROM lgu WHERE parentid = $P{parentid}



[getBarangays]
SELECT objid, lguname AS name FROM lgu WHERE lgutype  = 'BARANGAY' ORDER BY objid  


[lookupMunicipality]
SELECT objid, lguname, pin FROM lgu 
WHERE lgutype = 'MUNICIPALITY' AND lguname LIKE $P{lguname} 
ORDER BY lguname 

[getMuncipalities]
SELECT * FROM lgu WHERE lgutype = 'MUNICIPALITY'

[getDistricts]
SELECT * FROM lgu WHERE lgutype = 'DISTRICT'

[getProvinceId]
SELECT objid FROM lgu WHERE lgutype = 'PROVINCE'

[getProvince]
SELECT objid FROM lgu WHERE lgutype = 'PROVINCE'


[deleteBarangayByParentId]
DELETE FROM lgu WHERE lgutype = 'BARANGAY' AND parentid = $P{parentid} 
