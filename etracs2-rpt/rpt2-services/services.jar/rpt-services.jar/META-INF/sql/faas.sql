#----------------------------------------------------------------
# GETTERS
#----------------------------------------------------------------
[getInfoByTdno]
SELECT objid, docstate, schemaname, tdno, fullpin, claimno, ledgerid FROM faaslist WHERE tdno = $P{tdno} 

[getInfoByPin]
SELECT objid, docstate, schemaname, tdno, fullpin, claimno, ledgerid FROM faaslist WHERE pin = $P{pin} 

[getLandReferenceByPin]
SELECT objid, schemaname, taxpayerid FROM faaslist WHERE fullpin = $P{pin} 

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

[getLookupList]
SELECT * FROM faaslist

[getLookupByTdNo]
SELECT * FROM faaslist WHERE tdno = $P{tdno}

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
 

[getLedgerInfo]
SELECT objid, docstate, lastyearpaid, lastqtrpaid FROM rptledger where objid = $P{objid} 


[getLandImprovementIds]
SELECT objid FROM faaslist WHERE landfaasid = $P{landfaasid} AND docstate NOT IN ('CANCELLED') 

[getBarangayInfo]
SELECT provcity, munidistrict, barangay, barangayid, provcityindex, munidistrictindex, barangayindex 
FROM faaslist 
WHERE objid = $P{objid} 
 
[getTaxpayerInfo]
SELECT taxpayerid, taxpayerno, taxpayername, taxpayeraddress FROM faaslist WHERE objid = $P{objid} 

[getAttachments]
SELECT * FROM faasattachment WHERE faasid = $P{faasid}

[getAttachmentForTransmittal]
SELECT * FROM faasattachment WHERE docstate = 'FORTRANSMITTAL' 

[getBarangays]
SELECT * FROM lgu WHERE parentid = $P{parentid} ORDER BY lguname 


[getActiveAnnotationId] 
SELECT objid FROM faasannotation WHERE faasid = $P{faasid} AND docstate = 'APPROVED' ORDER BY docno DESC 

#----------------------------------------------------------------
# INSERT
#----------------------------------------------------------------
[insertPin]
INSERT INTO pin ( pin, claimno, docstate ) VALUES( $P{pin}, $P{claimno}, $P{docstate} )

[insertTxnReference]
INSERT INTO txnreference (objid, refid, refname, message, txndate )  
VALUES( $P{objid}, $P{refid}, $P{refname}, $P{message}, $P{txndate} ) 

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

[updateListCancelInfo]
UPDATE faaslist SET 
    docstate     = $P{docstate}, 
    cancelreason = $P{cancelreason},  
    canceldate  = $P{canceldate}, 
    cancelledbytdnos = $P{cancelledbytdnos} 
WHERE objid = $P{objid}    


[updateListTdNo]
UPDATE faaslist SET tdno = $P{tdno} WHERE objid = $P{objid} 


[updateListLandReference]
UPDATE faaslist SET landfaasid = $P{landfaasid}, landfaastaxpayerid = $P{landfaastaxpayerid} WHERE objid = $P{objid} 

[updateMessage]
UPDATE faas SET message = $P{message} WHERE objid = $P{objid} 

[updateAttachmentState]
UPDATE faasattachment SET docstate = $P{docstate} WHERE faasid = $P{faasid}

[updateFaasAttachmentInfo]
UPDATE faasattachment SET  
    docstate = $P{docstate}, 
    message = $P{message}  
WHERE objid = $P{objid} 



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

[deleteTxnReference]
DELETE FROM txnreference WHERE refid = $P{refid} 
		
		
#----------------------------------------------------------------
# FINDERS
#----------------------------------------------------------------
[findByState]
SELECT 
	objid, docstate, ry, tdno, fullpin, rputype, txntype, 
	taxpayerid, taxpayername, taxpayeraddress, ownername, owneraddress, 
	cadastrallotno, surveyno, effectivityyear, effectivityqtr, classcode, taxable, 
	totalareasqm, totalmv, totalav, barangay, totalareasqm, totalareaha 
FROM faaslist 

[findByTdNo]
SELECT 
	objid, docstate, ry, tdno, fullpin, rputype, txntype, 
	taxpayerid, taxpayername, taxpayeraddress, ownername, owneraddress, 
	cadastrallotno, surveyno, effectivityyear, effectivityqtr, classcode, taxable, 
	totalareasqm, totalmv, totalav, barangay, totalareasqm, totalareaha 
FROM  faaslist 
WHERE tdno = $P{tdno} 

[findByTaxpayerName]
SELECT 
	objid, docstate, ry, tdno, fullpin, rputype, txntype, 
	taxpayerid, taxpayername, taxpayeraddress, ownername, owneraddress, 
	cadastrallotno, surveyno, effectivityyear, effectivityqtr, classcode, taxable, 
	totalareasqm, totalmv, totalav, barangay, totalareasqm, totalareaha 
FROM  faaslist 
WHERE taxpayername LIKE $P{taxpayername} 

[findByPin] 
SELECT 
	objid, docstate, ry, tdno, fullpin, rputype, txntype, 
	taxpayerid, taxpayername, taxpayeraddress, ownername, owneraddress, 
	cadastrallotno, surveyno, effectivityyear, effectivityqtr, classcode, taxable, 
	totalareasqm, totalmv, totalav, barangay, totalareasqm, totalareaha 
FROM  faaslist 
WHERE pin LIKE $P{pin} 

[findByBarangay]
SELECT 
	objid, docstate, ry, tdno, fullpin, rputype, txntype, 
	taxpayerid, taxpayername, ownername, owneraddress, 
	cadastrallotno, surveyno, effectivityyear, effectivityqtr, classcode, taxable, 
	totalareasqm, totalmv, totalav, barangay, totalareasqm, totalareaha 
FROM  faaslist 
WHERE barangay = $P{barangay} 

[findByCadastralLotNo]
SELECT 
	objid, docstate, ry, tdno, fullpin, rputype, txntype, 
	taxpayerid, taxpayername, taxpayeraddress, ownername, owneraddress, 
	cadastrallotno, surveyno, effectivityyear, effectivityqtr, classcode, taxable, 
	totalareasqm, totalmv, totalav, barangay, totalareasqm, totalareaha 
FROM  faaslist 
WHERE cadastrallotno = $P{cadastrallotno} 

[findBySurveyNo]
SELECT 
	objid, docstate, ry, tdno, fullpin, rputype, txntype, 
	taxpayerid, taxpayername, taxpayeraddress, ownername, owneraddress, 
	cadastrallotno, surveyno, effectivityyear, effectivityqtr, classcode, taxable, 
	totalareasqm, totalmv, totalav, barangay, totalareasqm, totalareaha 
FROM  faaslist 
WHERE surveyno = $P{surveyno} 

[findByBlockNo]
SELECT 
	objid, docstate, ry, tdno, fullpin, rputype, txntype, 
	taxpayerid, taxpayername, taxpayeraddress, ownername, owneraddress, 
	cadastrallotno, surveyno, effectivityyear, effectivityqtr, classcode, taxable, 
	totalareasqm, totalmv, totalav, barangay, totalareasqm, totalareaha 
FROM  faaslist 
WHERE blockno = $P{blockno} 




