[getList]
SELECT * FROM exemptiontype ORDER BY orderno

[getListByCode]
SELECT * FROM exemptiontype WHERE exemptcode LIKE $P{exemptcode} ORDER BY orderno

[getListByDescription]
SELECT * FROM exemptiontype WHERE exemptdesc LIKE $P{exemptdesc} ORDER BY orderno

[getById]
SELECT * FROM exemptiontype WHERE objid = $P{objid}

[checkDuplicateDescription]
SELECT COUNT(*) AS count FROM exemptiontype WHERE exemptdesc = $P{exemptdesc}

[checkDuplicateCode]
SELECT COUNT(*) AS count FROM exemptiontype WHERE exemptcode = $P{exemptcode}

