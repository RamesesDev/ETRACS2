[getList]
SELECT * FROM business 
WHERE docstate IN ( 'ACTIVE', 'FOR_RELEASE' ) 
ORDER BY tradename

[getListByTradename]
SELECT * FROM business 
WHERE tradename LIKE CONCAT( $P{tradename}, '%' ) 
AND docstate = 'ACTIVE' 
ORDER BY tradename, taxpayername

[getListByOwnername]
SELECT * FROM business 
WHERE taxpayername LIKE CONCAT( $P{taxpayername}, '%' ) 
AND docstate = 'ACTIVE' 
ORDER BY tradename, taxpayername

