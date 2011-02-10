#----------------------------------------------------------------
# FINDERS
#----------------------------------------------------------------
[findByState]
SELECT objid, state, docNo, lgu, rpuCount, dtTransmitted, transmittedBy FROM transmittal WHERE state = $P{state}

[findByDocno]
SELECT objid, state, docNo, lgu, rpuCount, dtTransmitted, transmittedBy FROM transmittal WHERE state = $P{state} AND docno = $P{docno}

[findByLgu]
SELECT objid, state, docNo, lgu, rpuCount, dtTransmitted, transmittedBy FROM transmittal WHERE state = $P{state} AND lgu LIKE $P{lgu}


#----------------------------------------------------------------
# GETTERS
#----------------------------------------------------------------
[getState]
SELECT state FROM transmittal WHERE objid = $P{objid}

[getTransmittalItem]
SELECT * FROM transmittalitem WHERE objid = $P{objid} ORDER BY pin

[getTransmittalItemList]
SELECT * FROM transmittalitem WHERE transmittalid = $P{transmittalid} ORDER BY pin


#----------------------------------------------------------------
# UPDATES
#----------------------------------------------------------------
[updateStateToReceived]
UPDATE transmittal SET state = 'RECEIVED' WHERE objid = $P{objid}

[updateStateToReviewed]
UPDATE transmittal SET state = 'REVIEWED' WHERE objid = $P{objid}

[updateStateToClosed]
UPDATE transmittal SET state = 'CLOSED' WHERE objid = $P{objid}

[updateStateToSubmitted]
UPDATE transmittal SET state = 'SUBMITTED' WHERE objid = $P{objid}

[updateItemState]
UPDATE transmittalitem SET state = $P{newstate} WHERE transmittalid = $P{transmittalid} AND faasid = $P{faasid}

[disapproveItem]
UPDATE transmittalitem SET state = $P{newstate}, remarks = $P{remarks} WHERE transmittalid = $P{transmittalid} AND faasid = $P{faasid}

[incompleteItem]
UPDATE transmittalitem SET state = $P{newstate}, remarks = $P{remarks} WHERE transmittalid = $P{transmittalid} AND objid = $P{objid}

#----------------------------------------------------------------
# DELETES
#----------------------------------------------------------------
[delete]
DELETE FROM transmittal WHERE objid = $P{objid}

[deleteItemList]
DELETE FROM transmittalitem WHERE transmittalid = $P{transmittalid}


#----------------------------------------------------------------
# COUNTS
#----------------------------------------------------------------
[countofUnreviewedItems]
SELECT COUNT(*) AS count FROM transmittalitem WHERE transmittalid = $P{transmittalid} AND state = 'PROVAPPROVAL'

[countofUnrapprovedItems]
SELECT COUNT(*) AS count FROM transmittalitem WHERE transmittalid = $P{transmittalid} AND state NOT IN ('CURRENT', 'DISAPPROVED','INCOMPLETE') 

[getTransmittalItemIdByParentId]
SELECT objid, faasId FROM transmittalitem where transmittalid = $P{transmittalid}

[deleteTransmittalAttachmentById]
DELETE FROM transmittalattachment where refId = $P{faasId}

[getAttachmentsByRefId]
SELECT * FROM transmittalattachment where refId = $P{refId}

[getTransmittalItemForProvApproval]
SELECT * FROM transmittalitem WHERE transmittalid = $P{transmittalId} and state = 'PROVAPPROVAL' 