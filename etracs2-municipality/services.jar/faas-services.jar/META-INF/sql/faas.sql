[findById]
SELECT * FROM faas WHERE objid = $P{objid}


#--------------------------------------------------------------------------------------
# ETRACS 1.0 SUPPORT
#--------------------------------------------------------------------------------------

[getProvApprovalList]
SELECT td.objid, td.state, td.tdNo, td.taxpayerName, td.txnType, r.pin, r.type 
FROM TaxDeclaration td, RPU r 
WHERE td.rpuid = r.objid AND td.state = 'PROVAPPROVAL'


[findTdById]
SELECT td.objid, td.state, td.tdNo, td.taxpayerName, td.txnType, r.pin, r.type 
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


