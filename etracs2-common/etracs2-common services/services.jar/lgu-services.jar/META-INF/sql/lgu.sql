[getList]
SELECT * FROM lgu

[getMuncipalities]
SELECT * FROM lgu WHERE lgutype = 'MUNICIPALITY'

[getDistricts]
SELECT * FROM lgu WHERE lgutype = 'DISTRICT'

[getProvinceId]
SELECT objid FROM lgu WHERE type = 'PROVINCE'
