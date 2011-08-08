[getList]
SELECT * FROM kindofbuilding ORDER BY bldgcode

[getListByCode]
SELECT * FROM kindofbuilding WHERE bldgcode LIKE $P{bldgcode} ORDER BY bldgcode

[getListByKind]
SELECT * FROM kindofbuilding WHERE bldgkind LIKE $P{bldgkind} ORDER BY bldgcode

[getById]
SELECT * FROM kindofbuilding WHERE objid = $P{objid}

[checkDuplicateKind]
SELECT COUNT(*) AS count FROM kindofbuilding WHERE bldgkind = $P{bldgkind}

[checkDuplicateCode]
SELECT COUNT(*) AS count FROM kindofbuilding WHERE bldgcode = $P{bldgcode}

[lookupBldgKindByCode]
SELECT objid, bldgcode, bldgkind FROM kindofbuilding WHERE bldgcode LIKE $P{bldgcode} 