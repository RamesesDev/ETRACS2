[getList]
SELECT * FROM cancelannotation ORDER BY docno DESC 

[getListByTdno]
SELECT * FROM cancelannotation  WHERE tdno = $P{tdno} ORDER BY docno DESC 

[getListByFileno]
SELECT * FROM cancelannotation  WHERE fileno LIKE $P{fileno} ORDER BY docno DESC 

[getListByDocno]
SELECT * FROM cancelannotation  WHERE docno LIKE $P{docno} ORDER BY docno DESC 

[getListByAnnotationno]
SELECT * FROM cancelannotation  WHERE annotationno LIKE $P{annotationno} ORDER BY docno DESC 

