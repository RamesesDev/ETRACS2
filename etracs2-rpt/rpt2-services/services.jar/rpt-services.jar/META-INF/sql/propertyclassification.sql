[getList]
SELECT * FROM propertyclassification ORDER BY orderno

[getListByCode]
SELECT * FROM propertyclassification WHERE propertycode LIKE $P{propertycode} ORDER BY orderno

[getListByDescription]
SELECT * FROM propertyclassification WHERE propertydesc LIKE $P{propertydesc} ORDER BY orderno

[getById]
SELECT * FROM propertyclassification WHERE objid = $P{objid}

[checkDuplicateDescription]
SELECT COUNT(*) AS count FROM propertyclassification WHERE propertydesc = $P{propertydesc}

[checkDuplicateCode]
SELECT COUNT(*) AS count FROM propertyclassification WHERE propertycode = $P{propertycode}

[checkReferencedLCUVId]
SELECT COUNT(*) AS count FROM lcuv WHERE propertyclassificationid = $P{objid}

[checkReferencedAgriId]
SELECT COUNT(*) AS count FROM rptsetting WHERE agriculturalid = $P{objid}

[checkReferencedSettingId]
SELECT propertyclassifications FROM rptsetting
