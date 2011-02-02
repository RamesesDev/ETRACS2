[findAttachmentById]
SELECT * FROM faasattachment WHERE objid = $P{objid}

[findAttachmentByRefId]
SELECT * FROM faasattachment WHERE refId = $P{refId}
