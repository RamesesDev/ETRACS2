[getList]
SELECT * FROM materials ORDER BY materialcode

[getListByCode]
SELECT * FROM materials WHERE materialcode LIKE $P{materialcode} ORDER BY materialcode

[getListByMaterial]
SELECT * FROM materials WHERE materialdesc LIKE $P{materialdesc} ORDER BY materialcode

[getLookupList]
SELECT objid, materialcode, materialdesc FROM materials ORDER BY materialcode

[getListByLookupCode]
SELECT objid, materialcode, materialdesc FROM materials WHERE materialcode LIKE $P{materialcode} ORDER BY materialcode

[getListByLookupMaterial]
SELECT objid, materialcode, materialdesc FROM materials WHERE materialdesc LIKE $P{materialdesc} ORDER BY materialcode

[getById]
SELECT * FROM materials WHERE objid = $P{objid}

[checkDuplicateMaterial]
SELECT COUNT(*) AS count FROM materials WHERE materialdesc = $P{materialdesc}

[checkDuplicateCode]
SELECT COUNT(*) AS count FROM materials WHERE materialcode = $P{materialcode}

