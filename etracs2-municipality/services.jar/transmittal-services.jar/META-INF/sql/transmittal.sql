#--------------------------------------------------------------------------------------
# ETRACS 1.0 SUPPORT
#--------------------------------------------------------------------------------------

[getList]
SELECT * FROM transmittal 

[getListByDocNo]
SELECT * FROM transmittal 
WHERE docNo = $P{docNo} 

[getProvApprovalList]
SELECT td.objid, td.state, td.tdNo, td.taxpayerName, td.txnType, r.pin, r.type 
FROM TaxDeclaration td, RPU r 
WHERE td.rpuid = r.objid 
AND td.state = 'PROVAPPROVAL' 
AND ( td.transmitted IS NULL OR td.transmitted = 0 )

[getTransmittalItemByParentId]
SELECT * FROM transmittalItem where transmittalId = $P{transmittalId} 

[getListTransmittalIdByParentID]
SELECT objid, faasId FROM transmittalItem where transmittalId = $P{transmittalId} 

[findItemByParentId]
SELECT * FROM transmittalItem where objid = $P{objid}

[deleteTransmittalItemByParentId]
delete from transmittalItem where transmittalId = $P{transmittalId} 

[deleteTransmittalBtId]
delete from transmittal where objid = $P{objid}




[updateTransmittalToClose]
update transmittal set state = 'CLOSED' 
where objid = $P{transmittalId} 

[updateTDState]
UPDATE TaxDeclaration 
SET transmitted = $P{transmittalState} 
WHERE objid = $P{tdId} 



