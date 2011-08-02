[getList]
SELECT * FROM lgu

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
