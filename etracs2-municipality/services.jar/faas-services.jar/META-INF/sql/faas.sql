[findById]
SELECT * FROM faas WHERE objid = $P{objid}

[updateStateToCurrent]
UPDATE faas SET state = 'CURRENT' WHERE objid = $P{objid}


#--------------------------------------------------------------------------------------
# ETRACS 1.0 SUPPORT
#--------------------------------------------------------------------------------------

[getProvApprovalList]
SELECT td.objid, td.state, td.tdNo, td.taxpayerName, td.txnType, td.transmitted, r.pin, r.type 
FROM TaxDeclaration td, RPU r 
WHERE td.rpuid = r.objid AND td.state = 'PROVAPPROVAL'


[findTdById]
SELECT td.objid, td.state, td.tdNo, td.taxpayerName, td.txnType, td.transmitted, r.pin, r.type 
FROM TaxDeclaration td, RPU r 
WHERE td.rpuid = r.objid 
  AND td.objid = $P{objid}

[findTdByTdNo]
SELECT td.objid, td.state, td.tdNo, td.taxpayerName, td.txnType, r.pin, r.type 
FROM TaxDeclaration td, RPU r 
WHERE td.rpuid = r.objid 
  AND td.tdNo = $P{tdNo}

[findTdByPin]
SELECT td.objid, td.state, td.tdNo, td.taxpayerName, td.txnType, r.pin, r.type 
FROM TaxDeclaration td, RPU r 
WHERE td.rpuid = r.objid   
  AND r.pin LIKE $P{pin}

[findTdByTaxpayerName]
SELECT td.objid, td.state, td.tdNo, td.taxpayerName, td.txnType, r.pin, r.type 
FROM TaxDeclaration td, RPU r 
WHERE td.rpuid = r.objid 
  AND taxpayerName LIKE $P{taxpayerName}
  
[findRPTParameter]
SELECT * FROM RPTParameter WHERE objid = $P{objid}

[findRPTParameterValue]
SELECT * FROM RPTParameterValue WHERE objid = $P{objid}

[updateTransmittedTaxDeclaration]
UPDATE TaxDeclaration 
SET transmitted = $P{transmittalState} 
WHERE objid = $P{objid}

  
#------------------------------------------
#  TD to FAAS Conversion support
#------------------------------------------

[getTdById] 
SELECT * FROM TaxDeclaration WHERE objid = $P{objid}

[getRpuById] 
SELECT * FROM RPU WHERE objid = $P{objid}

[getRealPropertyById] 
SELECT * FROM RealProperty WHERE objid = $P{objid}

[getLguById] 
SELECT * FROM LGU WHERE objid = $P{objid}

[getPreviousTaxDeclarationByParentId]
SELECT * FROM PreviousTaxDeclaration WHERE parentId = $P{parentId}


#------------------------------------------
#	LandRPU Queries
#------------------------------------------
[getLandRpuById]
SELECT * FROM LandRPU WHERE objid = $P{objid}

[getLandAdjustmentByRpuId]
SELECT * FROM LandAdjustment WHERE rpuid = $P{rpuId}

[getLandAdjustmentParamsByAdjId]
SELECT * FROM LandAdjustment_RPTParameterValue WHERE LandAdjustment_objid = $P{adjId}

[getLandDetailsByRpuId]
SELECT * FROM LandDetail WHERE rpuId = $P{rpuId}

[getLandDetailAdjustmentByLandDetailId]
SELECT * FROM LandDetailAdjustment WHERE landdetailid = $P{landDetailId}

[getLandDetailAdjustmentParamsByAdjId]
SELECT * FROM LandDetailAdjustment_RPTParameterValue WHERE LandDetailAdjustment_objid = $P{adjId}


#------------------------------------------
#	BldgRPU Queries
#------------------------------------------
[getBldgRpuById]
SELECT * FROM BldgRPU WHERE objid = $P{objid}

[getBldgUseByRpuId]
SELECT * FROM BldgUse WHERE bldgRpuId = $P{rpuId}

[getBldgFloorByUseId]
SELECT * FROM BldgFloor WHERE bldgUseid = $P{useId}

[getBldgFloorAdditionalByFloorId]
SELECT * FROM BldgFloorAdditional WHERE bldgFloorId = $P{floorId}

[getBldgAdditionalParamsByAdditionalId]
SELECT * FROM BldgFloorAdditional_RPTParameterValue WHERE BldgFloorAdditional_objid = $P{additionalId}

[getBldgStructureByRpuId]
SELECT * FROM BldgRPUStructure WHERE bldgRpuId = $P{rpuId}


#------------------------------------------
#	MachRPU Queries
#------------------------------------------
[getMachRpuById]
SELECT * FROM MachRPU WHERE objid = $P{objid}

[getMachUseByRpuId]
SELECT * FROM MachineUse WHERE rpuId = $P{rpuId}

[getMachDetailByUseId]
SELECT * FROM machineList WHERE machineUseId = $P{useId}


#------------------------------------------
#	TreeRPU Queries
#------------------------------------------
[getTreeRpuById]
SELECT * FROM TreeRPU WHERE objid = $P{objid}

[getLandPlantDetailByRpuId]
SELECT * FROM LandPlantDetail WHERE rpuid = $P{rpuId}


#------------------------------------------
#	MiscRPU
#------------------------------------------
[getMiscRpuById]
SELECT * FROM MiscRPU WHERE objid = $P{objid}

[getMiscRpuItemByRpuId]
SELECT * FROM MiscRPUItem WHERE rpuId = $P{rpuId}

[getMiscRpuItemParamsByItemId]
SELECT * FROM MiscRPUItem_RPTParameterValue WHERE MiscRPUItem_objid = $P{itemId}
