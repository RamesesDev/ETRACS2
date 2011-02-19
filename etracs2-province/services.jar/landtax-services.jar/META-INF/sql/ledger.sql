[getFaasByTaxpayerId] 
SELECT objid, tdNo, txnType, pin, municipalityIndex FROM faas_list WHERE taxpayerId = $P{taxpayerId} 
