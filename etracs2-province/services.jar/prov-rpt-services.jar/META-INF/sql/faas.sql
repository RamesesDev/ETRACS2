#----------------------------------------------------------------
# GETTERS
#----------------------------------------------------------------
[getState]
SELECT docstate FROM faas WHERE objid = $P{objid}

[getByTdNo]
SELECT docstate FROM faas WHERE tdNo = $P{tdNo}

[getPinCount]
SELECT COUNT(*) AS pinCount FROM faaslist WHERE pin = $P{pin}

[getPinClaimno]
SELECT * FROM pin WHERE pin = $P{pin} AND claimno = $P{claimno}


[getExchangePinList]
SELECT objid, pin FROM faaslist WHERE objid <> $P{objid}  AND docstate = 'FORAPPROVAL' ORDER BY pin 

[getAttachments]
SELECT * FROM faasattachment WHERE faasid = $P{faasid}


[getActiveAnnotationTexts] 
SELECT memoranda AS annotationtext FROM faasannotation WHERE faasid = $P{faasid} AND docstate = 'APPROVED' ORDER BY docno DESC 


#----------------------------------------------------------------
# CHECKS
#----------------------------------------------------------------
[checkDuplicateTdNo]
SELECT tdno FROM faaslist WHERE objid <> $P{objid} AND tdno = $P{tdno}


#----------------------------------------------------------------
# UPDATES
#----------------------------------------------------------------
[updateListState]
UPDATE faaslist SET docstate = $P{docstate} WHERE objid = $P{objid}

[updateListTdNo]
UPDATE faaslist SET tdno = $P{tdno} WHERE objid = $P{objid}


[updateFaasListPin]
UPDATE faaslist SET pin = $P{pin}, fullpin = $P{fullpin} WHERE objid = $P{objid} 


#----------------------------------------------------------------
# DELETES
#----------------------------------------------------------------


#----------------------------------------------------------------
# INSERT
#----------------------------------------------------------------
[insertPin]
INSERT INTO pin ( pin, claimno, docstate ) VALUES( $P{pin}, $P{claimno}, $P{docstate} )
		
		
		
#----------------------------------------------------------------
# FINDERS
#----------------------------------------------------------------
[findByState]
select objid, tdno, taxpayerid, fullpin, pin, rputype, taxpayername, ownername, munidistrict, totalmv, totalav from faaslist 
WHERE docstate = $P{docstate} ORDER BY pin

[findByTdNo]
select objid, tdno, taxpayerid, fullpin, pin, rputype, taxpayername, ownername, munidistrict, totalmv, totalav from faaslist 
WHERE tdno = $P{tdno} AND docstate = $P{docstate} ORDER BY pin

[findByTaxpayerName]
select objid, tdno, taxpayerid, fullpin, pin, rputype, taxpayername, ownername, munidistrict, totalmv, totalav from faaslist 
WHERE taxpayername LIKE $P{taxpayername} AND docstate = $P{docstate} ORDER BY pin

[findByPin]
select objid, tdno, taxpayerid, fullpin, pin, rputype, taxpayername, ownername, munidistrict, totalmv, totalav from faaslist 
WHERE pin LIKE $P{pin} AND docstate = $P{docstate} ORDER BY pin

[findByBarangay]
SELECT * FROM faaslist WHERE barangay = $P{barangay} AND docstate = $P{docstate} ORDER BY pin

[findByCadastralLotNo]
select objid, tdno, taxpayerid, fullpin, pin, rputype, taxpayername, ownername, munidistrict, totalmv, totalav from faaslist 
WHERE cadastrallotno = $P{cadastrallotno} AND docstate = $P{docstate} ORDER BY pin

[findBySurveyNo]
SELECT * FROM faaslist WHERE surveyno = $P{surveyno} AND docstate = $P{docstate} ORDER BY pin

[findByBlockNo]
select objid, tdno, taxpayerid, fullpin, pin, rputype, taxpayername, ownername, munidistrict, totalmv, totalav from faaslist 
WHERE blockno = $P{blockno} AND docstate = $P{docstate} ORDER BY pin

#----------------------------------------------------------------
# FINDERS ( BY ASSIGNED LGU )
#----------------------------------------------------------------
[findByExaminer]
SELECT * FROM faaslist ${whereClause}


