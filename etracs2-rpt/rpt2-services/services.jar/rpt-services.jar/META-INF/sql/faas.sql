#----------------------------------------------------------------
# GETTERS
#----------------------------------------------------------------

[getTxnReference]
SELECT * FROM txnreference WHERE objid = $P{objid}

[getState]
SELECT state FROM faas WHERE objid = $P{objid}

[getByTdNo]
SELECT state FROM faas WHERE tdNo = $P{tdNo}

[getPinCount]
SELECT COUNT(*) AS pinCount FROM faaslist WHERE pin = $P{pin}

[getExchangePinList]
SELECT objid, pin FROM faaslist WHERE objid <> $P{objid}  AND state = 'FORAPPROVAL' ORDER BY pin 

[getFaasHistory]
SELECT h.objid, h.faasid, h.pin, h.tdno, lh.municipality 
FROM rpu r, rpu_history h, faaslist lh 
WHERE r.objid = h.parentid 
  AND h.faasid = lh.objid 
  AND r.faasid = $P{faasid}   
ORDER BY h.tdno DESC   


[getRYSetting_land]
SELECT * FROM landrysetting  where ry = $P{ry}

[getRYSetting_bldg]
SELECT * FROM bldgrysetting  where ry = $P{ry}

[getRYSetting_mach]
SELECT * FROM machrysetting  where ry = $P{ry}

[getRYSetting_planttree]
SELECT * FROM planttreerysetting  where ry = $P{ry}

[getRYSetting_misc]
SELECT * FROM miscrysetting  where ry = $P{ry}

[getLgu]
SELECT objid, lguname, indexno, parentid FROM lgu WHERE objid = $P{objid} 

[getPin]
SELECT * FROM pin WHERE pin = $P{pin}

[getPinClaimno]
SELECT * FROM pin WHERE pin = $P{pin} AND claimno = $P{claimno}

[getCurrentRY]
SELECT ry FROM rptsetting  

#----------------------------------------------------------------
# INSERT
#----------------------------------------------------------------
[insertPin]
INSERT INTO pin ( pin, claimno, docstate ) VALUES( $P{pin}, $P{claimno}, $P{docstate} )

#----------------------------------------------------------------
# UPDATE
#----------------------------------------------------------------
[updateState]    
UPDATE faas SET docstate = $P{docstate} WHERE objid = $P{objid} 
    
[updateListState]    
UPDATE faaslist SET docstate = $P{docstate} WHERE objid = $P{objid} 

[updatePinState]    
UPDATE pin SET docstate = $P{docstate} WHERE pin = $P{pin} 

[updatePinStateWithClaimno]    
UPDATE pin SET docstate = $P{docstate} WHERE pin = $P{pin} AND claimno = $P{claimno}



#----------------------------------------------------------------
# CHECKS
#----------------------------------------------------------------
[checkDuplicateTdNo]
SELECT tdno FROM faaslist WHERE objid <> $P{objid} AND tdno = $P{tdno}

#----------------------------------------------------------------
# DELETES
#----------------------------------------------------------------
[deletePin]		
DELETE FROM pin WHERE pin = $P{pin}
		
		
#----------------------------------------------------------------
# FINDERS
#----------------------------------------------------------------
[findByState]
SELECT objid, docstate, tdno, fullpin, rputype FROM faaslist ORDER BY pin

[findByTdNo]
SELECT objid, docstate, tdno, fullpin, rputype FROM faaslist WHERE tdno = $P{tdno} ORDER BY pin

[findByTaxpayerName]
SELECT objid, docstate, tdno, fullpin, rputype FROM faaslist WHERE taxpayername LIKE $P{taxpayername} ORDER BY pin

[findByPin]
SELECT objid, docstate, tdno, fullpin, rputype FROM faaslist WHERE pin LIKE $P{pin} ORDER BY pin

[findByBarangay]
SELECT objid, docstate, tdno, fullpin, rputype FROM faaslist WHERE barangay = $P{barangay} ORDER BY pin

[findByCadastralLotNo]
SELECT objid, docstate, tdno, fullpin, rputype FROM faaslist WHERE cadastrallotno = $P{cadastrallotno} ORDER BY pin

[findBySurveyNo]
SELECT objid, docstate, tdno, fullpin, rputype FROM faaslist WHERE surveyno = $P{surveyno} ORDER BY pin

[findByBlockNo]
SELECT objid, docstate, tdno, fullpin, rputype FROM faaslist WHERE blockno = $P{blockno} ORDER BY pin



