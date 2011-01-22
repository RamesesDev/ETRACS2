[findById]
SELECT * FROM fileheader WHERE objid = $P{objid}

[findDetailById]
SELECT content FROM filedetail WHERE objid = $P{objid} 

[getHeaderByRefIdName]
SELECT * FROM fileheader WHERE refId = $P{refId} AND refName = $P{refName} ORDER BY documentType

[getDetailsByParentId]
SELECT * FROM filedetail WHERE parentId = $P{parentId}

[deleteHeaderById]
DELETE FROM fileheader WHERE objid = $P{objid}

[deleteDetailByParentId]
DELETE FROM filedetail WHERE parentId = $P{parentId}

[deleteHeaderByRefId]
DELETE FROM fileheader WHERE refId = $P{refId}

[deleteDetailByRefId]
DELETE FROM filedetail WHERE parentId IN (SELECT objid FROM fileheader WHERE refId  = $P{refId})
