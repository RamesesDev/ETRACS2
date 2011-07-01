[getList]
SELECT * FROM faaslist WHERE objid = $P{objid}

[getLatestItem]
SELECT * FROM rptledgeritem WHERE toyear = 0 AND parentid = $P{parentid} 





