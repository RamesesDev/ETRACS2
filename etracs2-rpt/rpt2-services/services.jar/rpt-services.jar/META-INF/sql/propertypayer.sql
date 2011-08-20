[getList]
SELECT * FROM propertypayer ORDER BY taxpayername

[getListByName]
SELECT * FROM propertypayer WHERE taxpayername LIKE $P{taxpayername} ORDER BY taxpayername

[getItems]
SELECT ppi.*,
	rl.tdno, rl.fullpin, rl.taxpayername, rl.taxpayeraddress, rl.classcode AS classification, rl.cadastrallotno, rl.assessedvalue 
FROM propertypayeritem ppi, rptledger rl 
WHERE ppi.ledgerid = rl.objid 
  AND ppi.propertypayerid = $P{propertypayerid} 


[checkDuplicate]
SELECT objid FROM propertypayer WHERE objid <> $P{objid} AND taxpayerid = $P{taxpayerid} 

[deleteItem]
DELETE FROM propertypayeritem WHERE propertypayerid = $P{propertypayerid} 
