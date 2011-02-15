#----------------------------------------------------------------
# GETTERS
#----------------------------------------------------------------
[getState]
SELECT state FROM faas WHERE objid = $P{objid}

[getByTdNo]
SELECT state FROM faas WHERE tdNo = $P{tdNo}

[getPinCount]
SELECT COUNT(*) AS pinCount FROM faas_list WHERE pin = $P{pin}

[getExchangePinList]
SELECT objid, pin FROM faas_list WHERE objid <> $P{objid}  AND state = 'FORAPPROVAL' ORDER BY pin 

#----------------------------------------------------------------
# UPDATES
#----------------------------------------------------------------


#----------------------------------------------------------------
# DELETES
#----------------------------------------------------------------
		
		
		
#----------------------------------------------------------------
# FINDERS
#----------------------------------------------------------------
[findByState]
SELECT * FROM faas_list WHERE state = $P{state} ORDER BY pin

[findByTdNo]
SELECT * FROM faas_list WHERE tdno = $P{tdno} AND state = $P{state} ORDER BY pin

[findByTaxpayerName]
SELECT * FROM faas_list WHERE taxpayername LIKE $P{taxpayername} AND state = $P{state} ORDER BY pin

[findByPin]
SELECT * FROM faas_list WHERE pin LIKE $P{pin} AND state = $P{state} ORDER BY pin

[findByBarangay]
SELECT * FROM faas_list WHERE barangay = $P{barangay} AND state = $P{state} ORDER BY pin

[findByCadastralLotNo]
SELECT * FROM faas_list WHERE cadastrallotno = $P{cadastrallotno} AND state = $P{state} ORDER BY pin

[findBySurveyNo]
SELECT * FROM faas_list WHERE surveyno = $P{surveyno} AND state = $P{state} ORDER BY pin

[findByBlockNo]
SELECT * FROM faas_list WHERE blockno = $P{blockno} AND state = $P{state} ORDER BY pin

#----------------------------------------------------------------
# FINDERS ( BY ASSIGNED LGU )
#----------------------------------------------------------------
[findByExaminer]
SELECT * FROM faas_list ${whereClause}


