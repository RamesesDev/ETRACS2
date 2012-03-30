[getList]
SELECT * FROM faasannotation ORDER BY docno DESC 

[getListByDocno]
SELECT * FROM faasannotation  WHERE docno LIKE $P{docno} ORDER BY docno DESC 

[getListByFileno]
SELECT * FROM faasannotation  WHERE fileno LIKE $P{fileno} ORDER BY docno DESC 


[getListByOwnername]
SELECT * FROM faasannotation  WHERE ownername LIKE $P{ownername} ORDER BY docno DESC 

[getListByTdno]
SELECT * FROM faasannotation  WHERE tdno = $P{tdno} ORDER BY docno DESC 

[getListByPin]
SELECT * FROM faasannotation  WHERE fullpin LIKE $P{fullpin} ORDER BY docno DESC  

[getListByCadastralLotNo]
SELECT * FROM faasannotation  WHERE cadastrallotno LIKE $P{cadastrallotno} ORDER BY docno DESC  

[getListBySurveno]
SELECT * FROM faasannotation  WHERE surveyno LIKE $P{surveyno} ORDER BY docno DESC  

[getListByBlockno]
SELECT * FROM faasannotation  WHERE blockno LIKE $P{blockno} ORDER BY docno DESC   


[getActiveAnnotations]
SELECT * FROM faasannotation WHERE faasid = $P{faasid}  AND docstate = 'APPROVED' 


[getFaasInfo]
SELECT 
	objid, docstate, tdno, issuedate, 
	ownername, owneraddress, 
	fullpin, classcode, cadastrallotno, surveyno, blockno, 
	totalmv, totalav  
FROM faaslist	 
WHERE objid = $P{objid} 


[getOtherAnnotationTypeList]
SELECT annotationtype FROM faasannotationtype ORDER BY annotationtype 


