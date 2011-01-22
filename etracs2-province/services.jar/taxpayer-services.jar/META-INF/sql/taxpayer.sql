[findPROVINCE-list]
SELECT * FROM province_taxpayer ORDER BY name

[findPROVINCE-byNo]
SELECT * FROM province_taxpayer WHERE taxpayerNo = $P{taxpayerNo} ORDER BY name

[findPROVINCE-byName]
SELECT * FROM province_taxpayer WHERE name LIKE $P{name} ORDER BY name

[findPROVINCE-byLgu]
SELECT * FROM province_taxpayer WHERE lgu LIKE $P{lgu} ORDER BY name


[findMUNICIPALITY-list]
SELECT * FROM municipal_taxpayer ORDER BY name

[findMUNICIPALITY-byNo]
SELECT * FROM municipal_taxpayer WHERE taxpayerNo = $P{taxpayerNo} ORDER BY name

[findMUNICIPALITY-byName]
SELECT * FROM municipal_taxpayer WHERE name LIKE $P{name} ORDER BY name

[findMUNICIPALITY-byLgu]
SELECT * FROM municipal_taxpayer WHERE lgu LIKE $P{lgu} ORDER BY name



[getMunicipalTaxpayerById]
SELECT * FROM municipal_taxpayer WHERE objid = $P{objid} ORDER BY name

[updateMunicipalMappingStatus]
UPDATE municipal_taxpayer SET provTaxpayerId = $P{provTaxpayerId}, provTaxpayerNo = $P{provTaxpayerNo}, provTaxpayerName = $P{provTaxpayerName},provTaxpayerAddress = $P{provTaxpayerAddress} WHERE objid = $P{objid}

[resetProvinceMapping]
UPDATE municipal_taxpayer SET provTaxpayerId = null, provTaxpayerNo = null, provTaxpayerName = null, provTaxpayerAddress = null WHERE provTaxpayerId = $P{provTaxpayerId}



[reportProvinceTaxpayerList]
SELECT taxpayerNo, name, address, mailAddress FROM province_taxpayer ORDER BY name 

