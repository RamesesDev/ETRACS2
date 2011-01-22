#----------------------------------------------------------------
# GETTERS
#----------------------------------------------------------------
[getState]
SELECT state FROM faas WHERE objid = $P{objid}


#----------------------------------------------------------------
# UPDATES
#----------------------------------------------------------------


#----------------------------------------------------------------
# DELETES
#----------------------------------------------------------------
[deleteFaas]
DELETE FROM faas WHERE objid = $P{objid}

[deleteProvApproval]
DELETE FROM faas_provapproval WHERE objid = $P{objid}

[deleteForApproval]
DELETE FROM faas_approval WHERE objid = $P{objid}

		
#----------------------------------------------------------------
# FINDERS
#----------------------------------------------------------------

#----------------------------------------------------------------
# Finders for FORREVIEW
#----------------------------------------------------------------
[findFORREVIEW-ByState]
SELECT * FROM faas_provapproval ORDER BY pin

[findFORREVIEW-ByTdNo]
SELECT * FROM faas_provapproval WHERE tdno = $P{tdno} ORDER BY pin

[findFORREVIEW-ByTaxpayerName]
SELECT * FROM faas_provapproval WHERE taxpayername LIKE $P{taxpayername} ORDER BY pin

[findFORREVIEW-ByPin]
SELECT * FROM faas_provapproval WHERE pin LIKE $P{pin} ORDER BY pin

[findFORREVIEW-ByBarangay]
SELECT * FROM faas_provapproval WHERE barangay = $P{barangay} ORDER BY pin

[findFORREVIEW-ByCadastralLotNo]
SELECT * FROM faas_provapproval WHERE cadastrallotno = $P{cadastrallotno} ORDER BY pin

[findFORREVIEW-BySurveyNo]
SELECT * FROM faas_provapproval WHERE surveyno = $P{surveyno} ORDER BY pin

[findFORREVIEW-ByBlockNo]
SELECT * FROM faas_provapproval WHERE blockno = $P{blockno} ORDER BY pin


#----------------------------------------------------------------
# Finders for FORAPPROVAL
#----------------------------------------------------------------
[findFORAPPROVAL-ByState]
SELECT * FROM faas_approval ORDER BY pin

[findFORAPPROVAL-ByTdNo]
SELECT * FROM faas_approval WHERE tdno = $P{tdno} ORDER BY pin

[findFORAPPROVAL-ByTaxpayerName]
SELECT * FROM faas_approval WHERE taxpayername LIKE $P{taxpayername} ORDER BY pin

[findFORAPPROVAL-ByPin]
SELECT * FROM faas_approval WHERE pin LIKE $P{pin} ORDER BY pin

[findFORAPPROVAL-ByBarangay]
SELECT * FROM faas_approval WHERE barangay = $P{barangay} ORDER BY pin

[findFORAPPROVAL-ByCadastralLotNo]
SELECT * FROM faas_approval WHERE cadastrallotno = $P{cadastrallotno} ORDER BY pin

[findFORAPPROVAL-BySurveyNo]
SELECT * FROM faas_approval WHERE surveyno = $P{surveyno} ORDER BY pin

[findFORAPPROVAL-ByBlockNo]
SELECT * FROM faas_approval WHERE blockno = $P{blockno} ORDER BY pin


#----------------------------------------------------------------
# Finders for CURRENT
#----------------------------------------------------------------
[findCURRENT-ByState]
SELECT * FROM faas_current ORDER BY pin

[findCURRENT-ByTdNo]
SELECT * FROM faas_current WHERE tdno = $P{tdno} ORDER BY pin

[findCURRENT-ByTaxpayerName]
SELECT * FROM faas_current WHERE taxpayername LIKE $P{taxpayername} ORDER BY pin

[findCURRENT-ByPin]
SELECT * FROM faas_current WHERE pin LIKE $P{pin} ORDER BY pin

[findCURRENT-ByBarangay]
SELECT * FROM faas_current WHERE barangay = $P{barangay} ORDER BY pin

[findCURRENT-ByCadastralLotNo]
SELECT * FROM faas_current WHERE cadastrallotno = $P{cadastrallotno} ORDER BY pin

[findCURRENT-BySurveyNo]
SELECT * FROM faas_current WHERE surveyno = $P{surveyno} ORDER BY pin

[findCURRENT-ByBlockNo]
SELECT * FROM faas_current WHERE blockno = $P{blockno} ORDER BY pin





