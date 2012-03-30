[getList]
SELECT * FROM af 

[getById]
SELECT * FROM af WHERE objid = $P{objid} 

[getApprovedAFList]
SELECT * from af WHERE docstate = 'APPROVED'

[getApprovedAFListById]
SELECT * FROM af WHERE docstate = 'APPROVED' AND objid = $P{objid} 

[getAF5253]
SELECT * FROM af WHERE objid in ('52','53') 



